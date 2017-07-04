Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 22sm26587572wru.29.2017.07.04.07.48.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jul 2017 07:48:09 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id EBDBB3E21F8;
	Tue,  4 Jul 2017 15:49:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH 04/11] README: document record/replay support
Date: Tue,  4 Jul 2017 15:48:52 +0100
Message-Id: <20170704144859.17644-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170704144859.17644-1-alex.bennee@linaro.org>
References: <20170704144859.17644-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: PljsSvcie4mU

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 README | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/README b/README
index e0bf5c5..5f16f60 100644
--- a/README
+++ b/README
@@ -107,6 +107,26 @@ mismatch status to its standard output.
 NB that in the register dump the r15 (pc) value will be given
 as an offset from the start of the binary, not an absolute value.
 
+While the master/slave setup works well it is a bit fiddly for running
+regression tests and other sorts of automation. For this reason risu
+supports recording a trace of its execution to a file. For example:
+
+  risu --master FxxV_across_lanes.risu.bin -t FxxV_across_lanes.risu.trace
+
+And then playback with:
+
+  risu FxxV_across_lanes.risu.bin -t FxxV_across_lanes.risu.trace
+
+Ideally it should be built with zlib to compress the trace files which
+would otherwise be huge. If building with zlib proves too tricky you
+can pipe to stdout and an external compression binary using "-t -".
+
+  risu --master FxxV_across_lanes.risu.bin -t - | gzip --best > trace.file
+
+and:
+
+  gunzip -c trace.file | risu -t - FxxV_across_lanes.risu.bin
+
 File format
 -----------
 
@@ -203,10 +223,6 @@ implementation, for example) but only ARM is tested.
  * we don't actually compare FP status flags, simply because
 I'm pretty sure qemu doesn't get them right yet and I'm more
 interested in fixing gross bugs first.
- * there isn't currently any support for a "record and replay
-results" mode. This would allow you to record the correct
-results from the ARM host once and then test a model implementation
-even if you didn't have the corresponding native hardware.
  * You can compile statically to avoid the requirement for the ARM
 chroot for qemu testing but you can no longer use gethostbyname() and need
 to specify your hosts by IP address.
-- 
2.13.0
