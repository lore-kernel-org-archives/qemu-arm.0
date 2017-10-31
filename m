Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id m25sm1495530wmi.7.2017.10.31.07.54.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Oct 2017 07:55:03 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id DF3C13E0EE2;
	Tue, 31 Oct 2017 14:54:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH 6/7] risugen: support @GroupName in risu files
Date: Tue, 31 Oct 2017 14:54:43 +0000
Message-Id: <20171031145444.13766-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171031145444.13766-1-alex.bennee@linaro.org>
References: <20171031145444.13766-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ffUBD67gyPUT

The existing pattern support is useful but it does get a little
tedious when faced with large groups of instructions. This introduces
the concept of a @GroupName which can be sprinkled in the risu
definition and is attached to all instructions following its
definition until the next group or an empty group "@" is specified.

It can be combined with the existing pattern support to do things
like:

  ./risugen --group AdvSIMDAcrossVector --not-pattern ".*_RES" aarch64.risu foo.bin

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 README  | 10 ++++++++++
 risugen | 20 ++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/README b/README
index 312e9cd..9946e6e 100644
--- a/README
+++ b/README
@@ -75,6 +75,10 @@ reads the configuration file arm.risu, and generates 10000 instructions
 based on the instruction patterns matching the regular expression
 "VQSHL.*imm.*". The resulting binary is written to vqshlimm.out.
 
+An alternative to using regular expression patterns is to use the
+--group specifier. This relies on the configuration file having been
+annotated with suitable @ markers.
+
 This binary can then be passed to the risu program, which is
 written in C. You need to run risu on both an ARM native target
 and on the program under test. The ARM native system is the 'master'
@@ -140,6 +144,12 @@ Lines starting with a '.' are directives to risu/risugen:
  * ".mode [thumb|arm]" specifies whether the file contains ARM
    or Thumb instructions; it must precede all instruction patterns.
 
+Lines starting with a '@' are a grouping directive. Instructions
+following will be assigned to a comma separated list of groups. The
+list of groups is reset at the next '@' directive which may be empty.
+This provides an alternative method to selecting instructions than RE
+patterns.
+
 Other lines are instruction patterns:
  insnname encodingname bitfield ... [ [ !blockname ] { blocktext } ]
 where each bitfield is either:
diff --git a/risugen b/risugen
index 8bfb0e9..aba4bb7 100755
--- a/risugen
+++ b/risugen
@@ -34,7 +34,10 @@ my @insn_keys;
 
 # The arch will be selected based on .mode directive defined in risu file.
 my $arch = "";
+# Current group, updated by @GroupName
+my $insn_group = "";
 
+my @group = ();                 # include groups
 my @pattern_re = ();            # include pattern
 my @not_pattern_re = ();        # exclude pattern
 
@@ -122,6 +125,11 @@ sub parse_config_file($)
             exit(1);
         }
 
+        if ($tokens[0] =~ /^@(.*)/ ) {
+            $insn_group = $1;
+            next;
+        }
+
         if ($tokens[0] =~ /^\./) {
             parse_risu_directive($file, $seen_pattern, @tokens);
             next;
@@ -239,6 +247,9 @@ sub parse_config_file($)
         $insnrec->{fixedbits} = $fixedbits;
         $insnrec->{fixedbitmask} = $fixedbitmask;
         $insnrec->{fields} = [ @fields ];
+        if (length $insn_group) {
+            $insnrec->{group} = $insn_group;
+        }
         $insn_details{$insnname} = $insnrec;
     }
     close(CFILE) or die "can't close $file: $!";
@@ -249,6 +260,12 @@ sub select_insn_keys ()
 {
     # Get a list of the insn keys which are permitted by the re patterns
     @insn_keys = sort keys %insn_details;
+    if (@group) {
+        my $re = join("|",@group);
+        @insn_keys = grep {
+            defined($insn_details{$_}->{group}) &&
+                grep /$re/, $insn_details{$_}->{group}} @insn_keys
+    }
     if (@pattern_re) {
         my $re = '\b((' . join(')|(',@pattern_re) . '))\b';
         @insn_keys = grep /$re/, @insn_keys;
@@ -277,6 +294,7 @@ Valid options:
     --fpscr n    : set initial FPSCR (arm) or FPCR (aarch64) value (default is 0)
     --condprob p : [ARM only] make instructions conditional with probability p
                    (default is 0, ie all instructions are always executed)
+    --group name[,name..]: only use instructions in defined groups
     --pattern re[,re...] : only use instructions matching regular expression
                    Each re must match a full word (that is, we match on
                    the perl regex '\\b((re)|(re))\\b'). This means that
@@ -305,6 +323,7 @@ sub main()
     GetOptions( "help" => sub { usage(); exit(0); },
                 "numinsns=i" => \$numinsns,
                 "fpscr=o" => \$fpscr,
+                "group=s" => \@group,
                 "pattern=s" => \@pattern_re,
                 "not-pattern=s" => \@not_pattern_re,
                 "condprob=f" => sub {
@@ -319,6 +338,7 @@ sub main()
     # allow "--pattern re,re" and "--pattern re --pattern re"
     @pattern_re = split(/,/,join(',',@pattern_re));
     @not_pattern_re = split(/,/,join(',',@not_pattern_re));
+    @group = split(/,/,join(',',@group));
 
     if ($#ARGV != 1) {
         usage();
-- 
2.14.2
