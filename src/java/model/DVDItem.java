package model;

public class DVDItem {

    private String title;
    private String year;
    private String genre;

    public String getTitle() {
        return title;
    }

    public String getYear() {
        return year;
    }

    public String getGenre() {
        return genre;
    }

    public DVDItem(String title, String year, String genre) {
        this.title = title;
        this.year = year;
        this.genre = genre;
    }

    @Override
    public String toString() {
        return "DVD: "+title + " @ " +year;
    }

}
