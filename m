Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp880780wro;
        Fri, 26 Oct 2018 08:31:54 -0700 (PDT)
X-Google-Smtp-Source: AJdET5d39eCk0jPcG8pQnHRzGnYB8wdOrnRs45uxhBR//jDtyp+uEvSfuVuoOR2yMgZ6gHd7IoUc
X-Received: by 2002:a5d:4645:: with SMTP id j5-v6mr5934188wrs.194.1540567914167;
        Fri, 26 Oct 2018 08:31:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540567914; cv=none;
        d=google.com; s=arc-20160816;
        b=J/jL6NvOFXyTYGr5R7/zTHCknpiel73kCSb8EiiRinP5NTY9yK43VsuuqU3sAZmX2e
         3/CP78DrUPQG8j/53p63eg2NrhUYAW1uAhDmoaaUSgDS5yFwYZ2hvIh+w269u4ED3AN0
         OXbDJ7y2y/TX303n1J0/K0qJe2L5MXoBRVhMX6sakXphjaYkKAMvGKiWpuG4qeHUNqED
         cHxpwe9oqwdyTI2oLsjpGHQi3ltXznzX4VkiWl7sx2Kdu2+htsLqR/jBSc5fpBpL3d3Y
         909pADbsPeGGGBSahQRlf3a1+Jyn3hBFrt96VFoOx6J0DtE0+9L3ehSfQgN/WnTVdXNK
         WGNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=4CQq/2mY3d3qQMRw6dhU9bzrX1Q9nLU2Tmq/bJKp5+Q=;
        b=CMPfmTpL2qXwFA40uB3a0eRIgojmymCT7CfTM9b+kuax2JwuG7b97AGCni8Z72r/C2
         KYOLqPBIAzyBG7DbcJ1lVuIyb5JAVQBj9oekRKKbBcshFTlVoqhL3/FeHDniANN6pqNT
         4Nq0fdILkdWc3ohug46wBAnzWu79YrWyscrqJxIRDlxOMe+BDebRbY2XrHdbEUJbYtVq
         OpO99HDBGS1IfeKOreubqk6aGe4O35BaLFgEGRhDocmJ10tzK1CvQo5vxrQ1s5l1DNSx
         1Q3XJa3k4FEbMIxSNqkKWNmDfHQTvGTsvytj26g5FVmVdMETvbgbcbxtPUaU+I9dceFN
         y9WA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.187 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.187])
        by mx.google.com with ESMTPS id e19-v6si4051190wmf.84.2018.10.26.08.31.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Oct 2018 08:31:54 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.187 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.187;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.187 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MuF4v-1fSVlz3MEf-00uabe; Fri, 26 Oct 2018 17:31:51 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MuF4v-1fSVlz3MEf-00uabe; Fri, 26 Oct 2018 17:31:51 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>,
	Jason Wang <jasowang@redhat.com>,
	qemu-arm@nongnu.org,
	Michael Walle <michael@walle.cc>,
	Laurent Vivier <lvivier@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	xen-devel@lists.xenproject.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Markus Armbruster <armbru@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Kevin Wolf <kwolf@redhat.com>,
	qemu-block@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PULL 05/20] qemu-iotests: fix filename containing checks
Date: Fri, 26 Oct 2018 17:31:10 +0200
Message-Id: <20181026153125.24738-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:AHIYzvZ0k2AaXsDkHzyH3mfSFFsxCdqJRBeK+MP9hZPehMjxUA5
 eGWZ82GiJJn0o7a+gzV3bkC3phsf/nyn3w2kiRrkal4eHCM1+CBGa+6eSV48Rp0EbJrJaBP
 69+ksD/WCvbxM6QJg4wt40DWgit+xvppkxtX8mfuNUPyyYaiUEamF54ab7ID27sfRInL+b8
 Dcn6lFU8pDiyUJrNXA2Mg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:a079i6mtQvY=:mXM+exP3XoS8LPq93wsz7g
 mW0aRzKSCQk5ysSjcpRMVQW7FCYBEGhf9KStCMzo8U4B2YL/MzIZUT2LDozfBjzq+OUBaU3Sw
 lTpFZW8aEK5qasOYh8zUZ3DePbSp0D30BmroEqxD9d+jPYUejS4O0ZV+M41X3mH33xr/f9eDo
 0guOYHzqAtf8CR9PRgIqIXZodBMu9bZzHXleI95vhtePv8GxCWQUWrTv8nHdhnBDllB8z+d7w
 hbb9qVWSJebZLv6Yc+3o/H8E33sZIA8yia7Kl7VNrVf3L4Lh7S8PwpsVgqRn+MFScKIzmp59F
 BPwbLDQ6qMwgAwYp76WR4w5M/mf1XLrT5qCmT06F3zrNVk3wfKZftPVUwyhdpQXiwB1HMOFmF
 pqxYPNFr2rLDFFUXF/X34AIWuyRR2jt3yadBmsgcSiF9lQ0RDoYZM3VGlRv98R2ia6dbuzSzj
 BjfFM03oUVNu1BX4CMl3hCr1t1v4+VP4DwWjYpGojts722TfTVf9MsLKbWN96AHtg10bE1n3u
 RvYEyj3GXOz+ivlYMdHixAGnJsj/Ug0xM/sS70M98aQLX24e1+863VqKzLJ2XO836CDrHmhHu
 gNsDFrB+LRXiIJKxNmznQkTeXl2LXAraOjeLPMbTCfF9tR8ek+m6j6X8/9nquenwzvZsbtAeI
 6viJrksGHumC2QWFJnxcF3tvlSJAGuCOWQCI/XY05MW8QbSz0ZFFlfG5RMwpK7cE/guEfmbuh
 giCVff7Z8XZ0mARP
X-TUID: 1nqBqBnnmCxe

From: Cleber Rosa <crosa@redhat.com>

Commit cce293a2945 moved some functions from common.config to
common.rc, but the error messages still reference the old file
location.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20181004161852.11673-5-crosa@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/qemu-iotests/common.rc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 44bee16a5e..70ca65b49b 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -170,7 +170,7 @@ if [ ! -e "$TEST_DIR" ]; then
 fi
 
 if [ ! -d "$TEST_DIR" ]; then
-    echo "common.config: Error: \$TEST_DIR ($TEST_DIR) is not a directory"
+    echo "common.rc: Error: \$TEST_DIR ($TEST_DIR) is not a directory"
     exit 1
 fi
 
@@ -179,7 +179,7 @@ if [ -z "$REMOTE_TEST_DIR" ]; then
 fi
 
 if [ ! -d "$SAMPLE_IMG_DIR" ]; then
-    echo "common.config: Error: \$SAMPLE_IMG_DIR ($SAMPLE_IMG_DIR) is not a directory"
+    echo "common.rc: Error: \$SAMPLE_IMG_DIR ($SAMPLE_IMG_DIR) is not a directory"
     exit 1
 fi
 
-- 
2.17.2
