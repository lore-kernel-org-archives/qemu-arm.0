Received: by 10.25.159.19 with SMTP id i19csp3654563lfe;
        Thu, 21 Jan 2016 03:19:04 -0800 (PST)
X-Received: by 10.60.246.135 with SMTP id xw7mr31454088oec.37.1453375144635;
        Thu, 21 Jan 2016 03:19:04 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com. [2607:f8b0:4003:c06::242])
        by mx.google.com with ESMTPS id a20si734388oib.62.2016.01.21.03.19.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Jan 2016 03:19:04 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c06::242 as permitted sender) client-ip=2607:f8b0:4003:c06::242;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c06::242 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-oi0-x242.google.com with SMTP id e195so1922121oig.2;
        Thu, 21 Jan 2016 03:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=akYwq4Hd9NYVc5b1BM9GUU2CnQbxQcmXyCX3hIWns0k=;
        b=RrBAFH5woZnqxQusClOuTP8OP8lsWvj5xW/TIiKuqBPDpQp3n2Z5zH5gPG2mlXoPKg
         ytfdoHoYo4HBXyJkyyMyppdBNXoteCW3pKJhh59t4oJnlL9VuEgJtUOoBnaqssAaCdxB
         jWK5uHzK+BcP6pv9XYSXLvTH7VPP8wYdzBBZFwadxabfmFbqNOZiOnYNR8GeouFRpIlC
         /r6Lpx7nhzmP2BILYV7ZvMZwcKdcKL7ZhHBr2EO/bgYRpUjBgH1W0ZVdleOFBEHQysRJ
         EyBRFJ6UTdmdgNaj70CHHEljNho/0ih7z2wwo6A0udldEl5YXRrETX0bl3/Q++BGe09L
         EOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=akYwq4Hd9NYVc5b1BM9GUU2CnQbxQcmXyCX3hIWns0k=;
        b=YTNImVYtcaUMJ1uKvvRhn00RaWzNfLu6kSLQlzBGMz0KsVA34fdMOcxkuAhotMiFta
         HgJ/sg1e8xb/OnHiyd4uAkg1aUL31St/P+kPTAWqKeKaT6uK5dnd7hIy0Yky833qzvCf
         LghHUxp1dcJIitbJcchJ0UTCy40Xmy+tfLybc/87TpnQM/tSV+z8tZcjTlsoRFFdNfht
         UFYSOcqL2ftRrrrdkNTHlDbTAG3rR6BjP1RyTZg+SSabXhMZ5DeFhGQcJmNQka5j1Ila
         5ITTUzZ0oQyTsRNvLOuJlIeN+jY3LfIs5tsDuZ2HapJLrfFtjNkYrLdAdseFui5sjaEt
         LGsQ==
X-Gm-Message-State: ALoCoQk51rtwHeOtAVKmJZif+AJr2/LUcmg9TF9NwMCc2t2yBj0Ht5tuYDlMtcuw1ggGPIS9lUxrIX/WG0/g6TzNjrtKp58Jkg==
X-Received: by 10.202.60.135 with SMTP id j129mr30544702oia.70.1453375144302;
        Thu, 21 Jan 2016 03:19:04 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id kg7sm305558obb.27.2016.01.21.03.19.03
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jan 2016 03:19:03 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v2 2/3] target-arm: Make pamax an argument to check_s2_startlevel
Date: Thu, 21 Jan 2016 12:18:27 +0100
Message-Id: <1453375108-25229-3-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453375108-25229-1-git-send-email-edgar.iglesias@gmail.com>
References: <1453375108-25229-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: wmdGJ4RsQMMP

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Make pamax an argument to check_s2_startlevel in preparation
for future reuse.

No functional change.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target-arm/helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 8aedce9..4abeb4d 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -6579,7 +6579,8 @@ typedef enum {
  * Returns true if the suggested starting level is OK and false otherwise.
  */
 static bool check_s2_startlevel(ARMCPU *cpu, bool is_aa64, int level,
-                                int inputsize, int stride)
+                                int inputsize, int stride,
+                                unsigned int pamax)
 {
     const int grainsize = stride + 3;
     int startsizecheck;
@@ -6595,8 +6596,6 @@ static bool check_s2_startlevel(ARMCPU *cpu, bool is_aa64, int level,
     }
 
     if (is_aa64) {
-        unsigned int pamax = arm_pamax(cpu);
-
         switch (stride) {
         case 13: /* 64KB Pages.  */
             if (level == 0 || (level == 1 && pamax <= 42)) {
@@ -6808,6 +6807,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
          * VTCR_EL2.SL0 field (whose interpretation depends on the page size)
          */
         int startlevel = extract32(tcr->raw_tcr, 6, 2);
+        unsigned int pamax = arm_pamax(cpu);
         bool ok;
 
         if (va_size == 32 || stride == 9) {
@@ -6820,7 +6820,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
 
         /* Check that the starting level is valid. */
         ok = check_s2_startlevel(cpu, va_size == 64, level,
-                                 inputsize, stride);
+                                 inputsize, stride, pamax);
         if (!ok) {
             /* AArch64 reports these as level 0 faults.
              * AArch32 reports these as level 1 faults.
-- 
1.9.1
