Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id k30sm3500874wrf.52.2017.10.31.07.54.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Oct 2017 07:55:03 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id D4E903E0DAA;
	Tue, 31 Oct 2017 14:54:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH 5/7] risugen/risugen_$arch: factor out instruction selection
Date: Tue, 31 Oct 2017 14:54:42 +0000
Message-Id: <20171031145444.13766-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171031145444.13766-1-alex.bennee@linaro.org>
References: <20171031145444.13766-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Cmhaf+yAoe3O

This moves the instruction selection to the common code and passes a
list of selection keys to write_test_code instead. This will allow us
to add selection features to the common code later.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 risugen          | 29 +++++++++++++++++++++++++++--
 risugen_arm.pm   | 18 +-----------------
 risugen_m68k.pm  | 18 +-----------------
 risugen_ppc64.pm | 18 +-----------------
 4 files changed, 30 insertions(+), 53 deletions(-)

diff --git a/risugen b/risugen
index 347cf12..8bfb0e9 100755
--- a/risugen
+++ b/risugen
@@ -26,7 +26,11 @@ use FindBin;
 use lib "$FindBin::Bin";
 use risugen_common;
 
+# insn_details is the full set of instruction definitions whereas
+# insn_keys is array of (potentially filtered) keys to index into the
+# insn_details hash.
 my %insn_details;
+my @insn_keys;
 
 # The arch will be selected based on .mode directive defined in risu file.
 my $arch = "";
@@ -240,6 +244,26 @@ sub parse_config_file($)
     close(CFILE) or die "can't close $file: $!";
 }
 
+# Select a subset of instructions based on our filter preferences
+sub select_insn_keys ()
+{
+    # Get a list of the insn keys which are permitted by the re patterns
+    @insn_keys = sort keys %insn_details;
+    if (@pattern_re) {
+        my $re = '\b((' . join(')|(',@pattern_re) . '))\b';
+        @insn_keys = grep /$re/, @insn_keys;
+    }
+    # exclude any specifics
+    if (@not_pattern_re) {
+        my $re = '\b((' . join(')|(',@not_pattern_re) . '))\b';
+        @insn_keys = grep !/$re/, @insn_keys;
+    }
+    if (!@insn_keys) {
+        print STDERR "No instruction patterns available! (bad config file or --pattern argument?)\n";
+        exit(1);
+    }
+}
+
 sub usage()
 {
     print <<EOT;
@@ -306,6 +330,8 @@ sub main()
 
     parse_config_file($infile);
 
+    select_insn_keys();
+
     my @full_arch = split(/\./, $arch);
     my $module = "risugen_$full_arch[0]";
     load $module, qw/write_test_code/;
@@ -316,9 +342,8 @@ sub main()
         'numinsns' => $numinsns,
         'fp_enabled' => $fp_enabled,
         'outfile' => $outfile,
-        'pattern_re' => \@pattern_re,
-        'not_pattern_re' => \@not_pattern_re,
         'details' => \%insn_details,
+        'keys' => \@insn_keys,
         'arch' => $full_arch[0],
         'subarch' => $full_arch[1] || '',
         'bigendian' => $big_endian
diff --git a/risugen_arm.pm b/risugen_arm.pm
index 1024660..2f10d58 100644
--- a/risugen_arm.pm
+++ b/risugen_arm.pm
@@ -895,9 +895,8 @@ sub write_test_code($$$$$$$$)
     my $fp_enabled = $params->{ 'fp_enabled' };
     my $outfile = $params->{ 'outfile' };
 
-    my @pattern_re = @{ $params->{ 'pattern_re' } };
-    my @not_pattern_re = @{ $params->{ 'not_pattern_re' } };
     my %insn_details = %{ $params->{ 'details' } };
+    my @keys = @{ $params->{ 'keys' } };
 
     open_bin($outfile);
 
@@ -908,21 +907,6 @@ sub write_test_code($$$$$$$$)
     # TODO better random number generator?
     srand(0);
 
-    # Get a list of the insn keys which are permitted by the re patterns
-    my @keys = sort keys %insn_details;
-    if (@pattern_re) {
-        my $re = '\b((' . join(')|(',@pattern_re) . '))\b';
-        @keys = grep /$re/, @keys;
-    }
-    # exclude any specifics
-    if (@not_pattern_re) {
-        my $re = '\b((' . join(')|(',@not_pattern_re) . '))\b';
-        @keys = grep !/$re/, @keys;
-    }
-    if (!@keys) {
-        print STDERR "No instruction patterns available! (bad config file or --pattern argument?)\n";
-        exit(1);
-    }
     print "Generating code using patterns: @keys...\n";
     progress_start(78, $numinsns);
 
diff --git a/risugen_m68k.pm b/risugen_m68k.pm
index 74e4937..7d62b13 100644
--- a/risugen_m68k.pm
+++ b/risugen_m68k.pm
@@ -160,9 +160,8 @@ sub write_test_code($)
     my $numinsns = $params->{ 'numinsns' };
     my $outfile = $params->{ 'outfile' };
 
-    my @pattern_re = @{ $params->{ 'pattern_re' } };
-    my @not_pattern_re = @{ $params->{ 'not_pattern_re' } };
     my %insn_details = %{ $params->{ 'details' } };
+    my @keys = @{ $params->{ 'keys' } };
 
     # Specify the order to use for insn32() and insn16() writes.
     set_endian(1);
@@ -176,21 +175,6 @@ sub write_test_code($)
     # TODO better random number generator?
     srand(0);
 
-    # Get a list of the insn keys which are permitted by the re patterns
-    my @keys = sort keys %insn_details;
-    if (@pattern_re) {
-        my $re = '\b((' . join(')|(',@pattern_re) . '))\b';
-        @keys = grep /$re/, @keys;
-    }
-    # exclude any specifics
-    if (@not_pattern_re) {
-        my $re = '\b((' . join(')|(',@not_pattern_re) . '))\b';
-        @keys = grep !/$re/, @keys;
-    }
-    if (!@keys) {
-        print STDERR "No instruction patterns available! (bad config file or --pattern argument?)\n";
-        exit(1);
-    }
     print "Generating code using patterns: @keys...\n";
     progress_start(78, $numinsns);
 
diff --git a/risugen_ppc64.pm b/risugen_ppc64.pm
index c0e71cf..b241172 100644
--- a/risugen_ppc64.pm
+++ b/risugen_ppc64.pm
@@ -371,9 +371,8 @@ sub write_test_code($)
     my $fp_enabled = $params->{ 'fp_enabled' };
     my $outfile = $params->{ 'outfile' };
 
-    my @pattern_re = @{ $params->{ 'pattern_re' } };
-    my @not_pattern_re = @{ $params->{ 'not_pattern_re' } };
     my %insn_details = %{ $params->{ 'details' } };
+    my @keys = @{ $params->{ 'keys' } };
 
     if ($params->{ 'bigendian' } eq 1) {
         set_endian(1);
@@ -388,21 +387,6 @@ sub write_test_code($)
     # TODO better random number generator?
     srand(0);
 
-    # Get a list of the insn keys which are permitted by the re patterns
-    my @keys = sort keys %insn_details;
-    if (@pattern_re) {
-        my $re = '\b((' . join(')|(',@pattern_re) . '))\b';
-        @keys = grep /$re/, @keys;
-    }
-    # exclude any specifics
-    if (@not_pattern_re) {
-        my $re = '\b((' . join(')|(',@not_pattern_re) . '))\b';
-        @keys = grep !/$re/, @keys;
-    }
-    if (!@keys) {
-        print STDERR "No instruction patterns available! (bad config file or --pattern argument?)\n";
-        exit(1);
-    }
     print "Generating code using patterns: @keys...\n";
     progress_start(78, $numinsns);
 
-- 
2.14.2
