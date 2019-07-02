Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3193528wru;
        Mon, 1 Jul 2019 17:14:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzvvrTJGxRHehRIRFQTDtvErSgr2xPm/SB+emyPrvgkYExPsc+XD/5baHh+tBab7dXcfuGN
X-Received: by 2002:a05:6214:10c5:: with SMTP id r5mr22730596qvs.224.1562026446816;
        Mon, 01 Jul 2019 17:14:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562026446; cv=none;
        d=google.com; s=arc-20160816;
        b=REQHPopwq+68CB263M17drw4FogaBtQEns2SzQUpUZSGW9Rr3N6uu1Uun9shpR/CRK
         T+hoy8XmOYhiYtZwKN+ciG0p1541LlmAzsxdyMX5PsujhI+KTBDoMnWHLDyX0E7wga2F
         ZN75SLfCvISUChrp5S+vKzvd7z2Biy2kLBgztnmwe35G0ttReZZ+9Qd4UsA4ibmvCLo3
         zALYHvMP27KnykW9KarU8mr26ugYF77amPdLrw89j7GZ8l6mEetQbXWLqo5Ng8rZEyvj
         M45FupoAnqii/DWRP4ZL3IdcfpaNyYN7cT3hAU5SVRArSQEjVI5vgjkc4nzv9LEcq0nK
         wMCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=bB4lIRn+URXaGGERyznyR1RD0IHCEQZBjy6dRPx/knI=;
        b=AUel9lnqgmg/u3jBmanKbWqQ6JAk11hba5yNgeHZYDc0QHbpDy1caiPEBIHzwA5cPT
         qqgp5UlehRiSgaAyBb4Vdq6X38YoaFNpLmH/gKS6ZsTENLYbj7QfsvLCHWhddPsIcZiW
         L3OmxhN/kjNWuYEiGEj1S5aFNKWrQ/rjKt/lE1HMhRdsg2O+JcGhxFAVIEXAMGSw3q2n
         fyZ1lnUtZr/fSn2cnjj/AyJZz9sQgXsvh8kzjl1mRic5OIoPgm9Az9XAVqFZRhT48xPJ
         B6rRcVW9izU3Jeuy/5TZjA6j4UpeGbClpryMmuooRP7IY18EhA+zDeFVNWIQ8U/7q+Ne
         pyPA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id e7si8599389qta.374.2019.07.01.17.14.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 17:14:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BE37DC05FBD7;
	Tue,  2 Jul 2019 00:14:05 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AEF81001B01;
	Tue,  2 Jul 2019 00:13:46 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-ppc@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	John Snow <jsnow@redhat.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Wei Yang <richardw.yang@linux.intel.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Markus Armbruster <armbru@redhat.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Michael Walle <michael@walle.cc>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-arm@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alistair Francis <alistair23@gmail.com>,
	qemu-block@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>
Subject: [PATCH v2 2/9] hw/block/pflash_cfi01: Use the correct READ_ARRAY value
Date: Tue,  2 Jul 2019 02:12:54 +0200
Message-Id: <20190702001301.4768-3-philmd@redhat.com>
In-Reply-To: <20190702001301.4768-1-philmd@redhat.com>
References: <20190702001301.4768-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Tue, 02 Jul 2019 00:14:06 +0000 (UTC)
X-TUID: k/fOE9zYl90u

In the "Read Array Flowchart" the command has a value of 0xFF.

In the document [*] the "Read Array Flowchart", the READ_ARRAY
command has a value of 0xff.

Use the correct value in the pflash model.

There is no change of behavior in the guest, because:
- when the guest were sending 0xFF, the reset_flash label
  was setting the command value as 0x00
- 0x00 was used internally for READ_ARRAY

[*] "Common Flash Interface (CFI) and Command Sets"
    (Intel Application Note 646)
    Appendix B "Basic Command Set"

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi01.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index dcc9885bf0..743b5d5794 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -280,10 +280,9 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr offset,
         /* This should never happen : reset state & treat it as a read */
         DPRINTF("%s: unknown command state: %x\n", __func__, pfl->cmd);
         pfl->wcycle = 0;
-        pfl->cmd = 0;
+        pfl->cmd = 0xff;
         /* fall through to read code */
-    case 0x00:
-        /* Flash area read */
+    case 0xff: /* Read Array */
         ret = pflash_data_read(pfl, offset, width, be);
         break;
     case 0x10: /* Single byte program */
@@ -449,8 +448,6 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
     case 0:
         /* read mode */
         switch (cmd) {
-        case 0x00: /* ??? */
-            goto reset_flash;
         case 0x10: /* Single Byte Program */
         case 0x40: /* Single Byte Program */
             DPRINTF("%s: Single Byte Program\n", __func__);
@@ -527,7 +524,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
             if (cmd == 0xd0) { /* confirm */
                 pfl->wcycle = 0;
                 pfl->status |= 0x80;
-            } else if (cmd == 0xff) { /* read array mode */
+            } else if (cmd == 0xff) { /* Read Array */
                 goto reset_flash;
             } else
                 goto error_flash;
@@ -554,7 +551,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
             } else if (cmd == 0x01) {
                 pfl->wcycle = 0;
                 pfl->status |= 0x80;
-            } else if (cmd == 0xff) {
+            } else if (cmd == 0xff) { /* read array mode */
                 goto reset_flash;
             } else {
                 DPRINTF("%s: Unknown (un)locking command\n", __func__);
@@ -646,7 +643,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
     trace_pflash_reset();
     memory_region_rom_device_set_romd(&pfl->mem, true);
     pfl->wcycle = 0;
-    pfl->cmd = 0;
+    pfl->cmd = 0xff;
 }
 
 
@@ -762,7 +759,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
     }
 
     pfl->wcycle = 0;
-    pfl->cmd = 0;
+    pfl->cmd = 0xff;
     pfl->status = 0;
     /* Hardcoded CFI table */
     /* Standard "QRY" string */
-- 
2.20.1
