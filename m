Received: by 10.25.159.19 with SMTP id i19csp62670lfe;
        Fri, 22 Jan 2016 01:51:11 -0800 (PST)
X-Received: by 10.182.144.133 with SMTP id sm5mr1640047obb.69.1453456271851;
        Fri, 22 Jan 2016 01:51:11 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-ob0-x244.google.com (mail-ob0-x244.google.com. [2607:f8b0:4003:c01::244])
        by mx.google.com with ESMTPS id n7si5078968oig.105.2016.01.22.01.51.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Jan 2016 01:51:11 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c01::244 as permitted sender) client-ip=2607:f8b0:4003:c01::244;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c01::244 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-ob0-x244.google.com with SMTP id wg8so461905obc.3;
        Fri, 22 Jan 2016 01:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-type:content-transfer-encoding;
        bh=lkkZwoiohk1VKkCrZqmOxg5W11Kg7LJZSFSQNsRtd4o=;
        b=uZHNljhY+Jv7+b4kW135TKBgdfwdzjHAz+nesfy+bURUxy5vAmfeRip0haLEHJeZMh
         9pbsUncp+M3hsYwz2A/mouEt+ygAE7akPp2Gh9/4oTNbMMQeLom8pi09CY8OoOWNL9ZY
         u41KetL874jn4zC0vYkmnfyMJE/NVgDt3oDgVYe5LD+x5V5kxDlznX1bp0KV0zQ/s232
         Qz+uNfwFTVyfUh+2gpVQW2MrkTNpj+k0cK+BP/MeuxH0T6oYZLhm7WlUK61cwpEJJ7Ob
         p6PFsMtMdl0qwInADQDPgE96iOCX7lil9BlD9TnDwHCGHjipqyZhZLWtMLKhSqjxy++n
         GtVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-type:content-transfer-encoding;
        bh=lkkZwoiohk1VKkCrZqmOxg5W11Kg7LJZSFSQNsRtd4o=;
        b=bdqogd2TppbXwIfXcC36UWGhf+CYLKNnZaeM2IKmgV1kq4Rmmwamtqklf5MxchJe+I
         MenEsJupJ/hCHP77iDpcAlUIgYaVvUxRtJzBH0w+k2DwH/8Y8JByKr69GQf5ceYrkOB9
         2v5DcB2jB45/tQ/XvgQoAWjXsntUxpqBVzOyjjmAaM0ldi4t264prNIFVafFrsMhy0Ap
         eaTwpn++7IcvC4Pq1RV7TsIvc7GJx7wf4KgmF+SoHRzXzgW4JlJeETlhWYoZqgdIBzDx
         V9mSbs7K0c5ZZcdEiKIEgEroxf+TEuUSjXEPn4QC3aJkiEZeehvt37IZJEdHX4ySJ4u3
         unAA==
X-Gm-Message-State: AG10YOQNE2HPkdSXt6JuOtPMADz4yA67UNmDEGH2SasgRBlmirTOoMLKCkjkoRiStRO9ZQ==
X-Received: by 10.182.97.164 with SMTP id eb4mr1535541obb.3.1453456271532;
        Fri, 22 Jan 2016 01:51:11 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id qs6sm758172oeb.3.2016.01.22.01.51.10
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jan 2016 01:51:11 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v3 2/3] target-arm: Make pamax an argument to check_s2_startlevel
Date: Fri, 22 Jan 2016 10:50:42 +0100
Message-Id: <1453456243-19879-3-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453456243-19879-1-git-send-email-edgar.iglesias@gmail.com>
References: <1453456243-19879-1-git-send-email-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: J7DPjs3cRbBS

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Make pamax an argument to check_s2_startlevel in preparation
for future reuse.

No functional change.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target-arm/helper.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 8aedce9..2a6fa94 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -6575,11 +6575,13 @@ typedef enum {
  * @startlevel: Suggested starting level
  * @inputsize:  Bitsize of IPAs
  * @stride:     Page-table stride (See the ARM ARM)
+ * @pamax:      Implementation defined bit-width of physical addresses
  *
  * Returns true if the suggested starting level is OK and false otherwise.
  */
 static bool check_s2_startlevel(ARMCPU *cpu, bool is_aa64, int level,
-                                int inputsize, int stride)
+                                int inputsize, int stride,
+                                unsigned int pamax)
 {
     const int grainsize = stride + 3;
     int startsizecheck;
@@ -6595,8 +6597,6 @@ static bool check_s2_startlevel(ARMCPU *cpu, bool is_aa64, int level,
     }
 
     if (is_aa64) {
-        unsigned int pamax = arm_pamax(cpu);
-
         switch (stride) {
         case 13: /* 64KB Pages.  */
             if (level == 0 || (level == 1 && pamax <= 42)) {
@@ -6808,6 +6808,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
          * VTCR_EL2.SL0 field (whose interpretation depends on the page size)
          */
         int startlevel = extract32(tcr->raw_tcr, 6, 2);
+        unsigned int pamax = arm_pamax(cpu);
         bool ok;
 
         if (va_size == 32 || stride == 9) {
@@ -6820,7 +6821,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
 
         /* Check that the starting level is valid. */
         ok = check_s2_startlevel(cpu, va_size == 64, level,
-                                 inputsize, stride);
+                                 inputsize, stride, pamax);
         if (!ok) {
             /* AArch64 reports these as level 0 faults.
              * AArch32 reports these as level 1 faults.
-- 
1.9.1
