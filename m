Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1694175wru;
        Thu, 27 Jun 2019 13:28:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyXdpcNXlcxzJR2KuGLrVfX9vPeQB4+asmEubK0AfIGbsH4CosrWGxDqPJuGl8n+S+aowYA
X-Received: by 2002:ac8:431e:: with SMTP id z30mr4946252qtm.291.1561667308063;
        Thu, 27 Jun 2019 13:28:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561667308; cv=none;
        d=google.com; s=arc-20160816;
        b=iADst1f/SihV9QJ44Cl4/GeGyWp2Gny8+taltIMjvO7282kcypVgcat8FzYQmM3pa8
         GurS2eoiujU+qStNOs2IMPWzg7zL76b/s29nXGnpF91uWjuNje93drIvdRQLGaAOuKcQ
         ODqad/nAlrWqoiWHQ+cPnAWpew2mr6HNp9T9w14zi2sn2pPyJQfgF1tM5QmrWN20R5GJ
         VHmKpe1bctveOvVxbfWdsvPRzIT/kQhg+qPv2mHoqLPuIgbdpjr1iMj/+AuTl8sG9Y7P
         FbCOUA90XNOBpD20Jbyfaa8owXGgzWFmff8EItxeSciq6rWY7xOQGVg3DLgaaT/uiEnt
         SFJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=BYz6e+VUeTZeL45mV7E6STEBRd2VEDPC6HLK7FJLYPM=;
        b=Cz/YtG4yh5UjpFv+LSyXFI2gBDYdPWptpWvsdDqVUIGGGTuXCgQ9FORjZ1n797MdEH
         Z9f5+fbKdGRjMxVvq2lHb09DdHhkkb8Icwfo1x2zsC1TejzpkgooGWJbKfWgOMZxmkiT
         7v5LHzga1NeCv3qMyjmpDDbWRoA6h9AVVqrzx447cKYTihAg1ThAOSPzl5cpw21xNUvp
         QaS6IoSqxgpEN5/nT6NHHAimDGvixVfDQU0WUR0/IvfxrRzYpZ5G3bMMAr1De/fN80vy
         VfLJjRxdjYoZlPq0qrOXUihsKLzV/qFiazHuTZjtPm5wLYAdDFzrazDQXmH4KpFBolyF
         KdGA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id x24si84802qth.392.2019.06.27.13.28.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 13:28:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 180F8307CDD5;
	Thu, 27 Jun 2019 20:28:27 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-69.brq.redhat.com [10.40.204.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E311C6012D;
	Thu, 27 Jun 2019 20:28:20 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Stephen Checkoway <stephen.checkoway@oberlin.edu>,
	qemu-devel@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
	qemu-block@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Max Reitz <mreitz@redhat.com>,
	qemu-ppc@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Michael Walle <michael@walle.cc>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v5 06/28] hw/block/pflash_cfi02: Add helpers to manipulate the status bits
Date: Thu, 27 Jun 2019 22:26:57 +0200
Message-Id: <20190627202719.17739-7-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-1-philmd@redhat.com>
References: <20190627202719.17739-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Thu, 27 Jun 2019 20:28:27 +0000 (UTC)
X-TUID: Vp7AHd6S5hpT

Pull out all of the code to modify the status into simple helper
functions. Status handling becomes more complex once multiple
chips are interleaved to produce a single device.

No change in functionality is intended with this commit.

Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
Message-Id: <20190426162624.55977-3-stephen.checkoway@oberlin.edu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
[PMD: Extracted from bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 40 ++++++++++++++++++++++++++++++++++------
 1 file changed, 34 insertions(+), 6 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 303d225f23..e9eea0ec08 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -101,6 +101,31 @@ struct PFlashCFI02 {
     void *storage;
 };
 
+/*
+ * Toggle status bit DQ7.
+ */
+static inline void toggle_dq7(PFlashCFI02 *pfl)
+{
+    pfl->status ^= 0x80;
+}
+
+/*
+ * Set status bit DQ7 to bit 7 of value.
+ */
+static inline void set_dq7(PFlashCFI02 *pfl, uint8_t value)
+{
+    pfl->status &= 0x7F;
+    pfl->status |= value & 0x80;
+}
+
+/*
+ * Toggle status bit DQ6.
+ */
+static inline void toggle_dq6(PFlashCFI02 *pfl)
+{
+    pfl->status ^= 0x40;
+}
+
 /*
  * Set up replicated mappings of the same region.
  */
@@ -130,7 +155,7 @@ static void pflash_timer (void *opaque)
 
     trace_pflash_timer_expired(pfl->cmd);
     /* Reset flash */
-    pfl->status ^= 0x80;
+    toggle_dq7(pfl);
     if (pfl->bypass) {
         pfl->wcycle = 2;
     } else {
@@ -229,8 +254,7 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, hwaddr offset,
         /* Status register read */
         ret = pfl->status;
         DPRINTF("%s: status %" PRIx32 "\n", __func__, ret);
-        /* Toggle bit 6 */
-        pfl->status ^= 0x40;
+        toggle_dq6(pfl);
         break;
     case 0x98:
         /* CFI query mode */
@@ -374,7 +398,11 @@ static void pflash_write(PFlashCFI02 *pfl, hwaddr offset,
                     break;
                 }
             }
-            pfl->status = 0x00 | ~(value & 0x80);
+            /*
+             * While programming, status bit DQ7 should hold the opposite
+             * value from how it was programmed.
+             */
+            set_dq7(pfl, ~value);
             /* Let's pretend write is immediate */
             if (pfl->bypass)
                 goto do_bypass;
@@ -422,7 +450,7 @@ static void pflash_write(PFlashCFI02 *pfl, hwaddr offset,
                 memset(pfl->storage, 0xFF, pfl->chip_len);
                 pflash_update(pfl, 0, pfl->chip_len);
             }
-            pfl->status = 0x00;
+            set_dq7(pfl, 0x00);
             /* Let's wait 5 seconds before chip erase is done */
             timer_mod(&pfl->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
                       (NANOSECONDS_PER_SECOND * 5));
@@ -437,7 +465,7 @@ static void pflash_write(PFlashCFI02 *pfl, hwaddr offset,
                 memset(p + offset, 0xFF, pfl->sector_len);
                 pflash_update(pfl, offset, pfl->sector_len);
             }
-            pfl->status = 0x00;
+            set_dq7(pfl, 0x00);
             /* Let's wait 1/2 second before sector erase is done */
             timer_mod(&pfl->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
                       (NANOSECONDS_PER_SECOND / 2));
-- 
2.20.1
