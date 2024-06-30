Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp934127njm;
        Sun, 30 Jun 2024 08:15:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX+wiRWrERF3XaH3xJZ7HzMCwioHYGw7l8Dtp1VvUgzJgZhaL2jM6TirYnevdCvp/+Q3OsWQ7NWv0oRf7Rwuo7TL4+9KOXB
X-Google-Smtp-Source: AGHT+IHka5lfu6vlHwfCm15JSI8/NYW8ckZ2G9dUl4x57gFgCsTtqXpRz0xTmPX0Aaw89hZv1KY8
X-Received: by 2002:a25:9191:0:b0:dff:4044:517c with SMTP id 3f1490d57ef6-e036ec6f17fmr3507698276.56.1719760512295;
        Sun, 30 Jun 2024 08:15:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719760512; cv=none;
        d=google.com; s=arc-20160816;
        b=w/luwLMGlFfv1nI+aveZfMYnWRXcDy5rFdp0z/ZDUAa3F/9T2d930QsfJobGrotlNN
         MMR31mSVb5uKvGHVG5f2tqJxaUwcLa60fEn8xJQygXbmzebBVW85CLerCHNhQpS3qU89
         osSRvt1L5tlU35ipyzeh13f0abQXn4TCkQG0srzHTEtntVmCcR63/BwOYssP3yuLzjEY
         ulBAD6Ujwl/AkCw7pKUUCYmwya/3lJE+wVuALebvu0jxckqRdS2FAWn3ZzDqal4opfBc
         gGoPPpoltXKFnUtqfMMhl7m0sIdZ/KbDyjUsiCanzJt7NoUq7+/09YXWLQ7Y7yjGWEbZ
         lRCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=5jJBrCwi9LW9SaBXFdF0UyfUcbT/SptHMronpgvYm3I=;
        fh=1DUVJ+bVnkgOXhOMsgwOLhFhA4A4TIxpKBmqQ4Bwwuo=;
        b=qv8uIgYrgsVGf46lRrJaYIY6FPQJQ0M6jgeHStqCBqTNHsU77zfd21UQp0Uj8qdqNU
         KCEQ+DLwdkiSVO3ISH4iH1SW0q1+4E89u/2itALiut++WE45CyZzzCPaKW4U05/o+Pdg
         H/UECrH3WP4dBvHMLrf/YkC8rQ3a+XR42gqWYSSZDW1lJNUMasujogl8F2MH35XeOdLg
         tIGhUfacRRjXJU7wGhzh8/ixgG3tVR7hSk5+gZgsL6l3G7odu/XxqBz2SJ4bQaz3Jzuw
         UAl4PL26dey/30Plh1cM2wre2AIoR67R79MKFbUB62RCuy6ZNpKgp+iTPfVvaR47z9nD
         AH8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=F9Hz80X6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-446514aa0fasi65742941cf.521.2024.06.30.08.15.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Jun 2024 08:15:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=F9Hz80X6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sNwGQ-0007B0-FV; Sun, 30 Jun 2024 11:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zheyuma97@gmail.com>)
 id 1sNwGP-0007Ak-A8; Sun, 30 Jun 2024 11:14:49 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zheyuma97@gmail.com>)
 id 1sNwGN-0001LA-Pm; Sun, 30 Jun 2024 11:14:49 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42561c16ffeso17125795e9.3; 
 Sun, 30 Jun 2024 08:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719760486; x=1720365286; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5jJBrCwi9LW9SaBXFdF0UyfUcbT/SptHMronpgvYm3I=;
 b=F9Hz80X6l2o0kgGNqGGw6YrAczafKsWmTI6p3fMbZDUFXB5uRH9fOMvCCBK3GMgfBk
 ICleKRq4fdqNWJVnvl2C/usKfA82WmP66QQXvNZWNx4ER/TBjbwfZEYdUNNXcleoSKA1
 kXViNz4KDmGfA1L4ggx+6UZ3N0pXePbGV9SLI9dypcg4OnORnEn6BnHDZCAT9uRFZtHQ
 x+fjUsiZC/osEQSUIqtIFZRmjERb+naWuw426FHrpsiIwOdGA3R2S9GepBi0uTDMSb0p
 /9rrmdGrB7CKRSHFYFZcjjzqt4LvtqmOadM8yD76vU96j+Mwn/JFG9h7c/Y28/GjxKd9
 Mt7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719760486; x=1720365286;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5jJBrCwi9LW9SaBXFdF0UyfUcbT/SptHMronpgvYm3I=;
 b=L1EK2M4o7SjQ/SsjmF7gOS33mUzi6XeQhu+du7GwstNU8gqTYDsKJXdaAR/px34cBO
 kXTaDE3BhopcGKcsb5BDGU9bxHnBTBsZ7pgAMT5KpKbRggqg/BJ/y2gKtd2TwUtFvi6H
 hTq8FXo8rk9QaJniKERMZ+dyX4lXa6BCuEKbyjEb7HMH6X+iBHBp56iBJ+Eil3UXhLdW
 g04V/o4LhvR1Xd9c2hNfxwNcBu6dOBEXXYZth3DwlWn/NGi0Q+vXq+AKIk6QLxLNJga/
 BMp+HT7bExTk7dnlXRC0SpPPR+I7WvWDdHPhJhpfk6ECX/13ggOTkUa9O3W9+p+4GAhX
 vQBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3qk9ggZmzWT+6A+4TkVYFgRzdyGc5nMZxCIXZkc1M75dKim63gVZ2thsHPD1LVd/sQJE56EQ2rl/MU9UM1lfQrnpMDdTfqEiyHDcl23P3wEXtxmvzMSlKuqs=
X-Gm-Message-State: AOJu0Yx8VCNOFVkUWVW82xX+15aWzjPWXLpeo+82Wdkj6uRh6jpOjCNS
 IuX6C7CfCiEhCzRHYJbO866Za76VgDd60keru5dUMxHXGOPTBoI=
X-Received: by 2002:a05:600c:1d1a:b0:424:a578:fc1 with SMTP id
 5b1f17b1804b1-4257a05c0a3mr22235175e9.25.1719760485499; 
 Sun, 30 Jun 2024 08:14:45 -0700 (PDT)
Received: from wing.epfl.ch (dhcp-122-dist-b-021.epfl.ch. [128.178.122.21])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af5b91bsm114901515e9.20.2024.06.30.08.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jun 2024 08:14:45 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Zheyu Ma <zheyuma97@gmail.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH] hw/misc/bcm2835_thermal: Handle invalid address accesses
 gracefully
Date: Sun, 30 Jun 2024 17:14:14 +0200
Message-Id: <20240630151414.2969772-1-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=zheyuma97@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1SVRYp00+Eg6

This commit handles invalid address accesses gracefully in both read and write
functions. Instead of asserting and aborting, it logs an error message and returns
a neutral value for read operations and does nothing for write operations.

Error log:
ERROR:hw/misc/bcm2835_thermal.c:55:bcm2835_thermal_read: code should not be reached
Bail out! ERROR:hw/misc/bcm2835_thermal.c:55:bcm2835_thermal_read: code should not be reached
Aborted

Reproducer:
cat << EOF | qemu-system-aarch64 -display \
none -machine accel=qtest, -m 512M -machine raspi3b -m 1G -qtest stdio
readw 0x3f212003
EOF

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 hw/misc/bcm2835_thermal.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/misc/bcm2835_thermal.c b/hw/misc/bcm2835_thermal.c
index ee7816b8a5..5c2a429d58 100644
--- a/hw/misc/bcm2835_thermal.c
+++ b/hw/misc/bcm2835_thermal.c
@@ -51,8 +51,10 @@ static uint64_t bcm2835_thermal_read(void *opaque, hwaddr addr, unsigned size)
         val = FIELD_DP32(bcm2835_thermal_temp2adc(25), STAT, VALID, true);
         break;
     default:
-        /* MemoryRegionOps are aligned, so this can not happen. */
-        g_assert_not_reached();
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "bcm2835_thermal_read: invalid address 0x%"
+                      HWADDR_PRIx "\n", addr);
+        val = 0;
     }
     return val;
 }
@@ -72,8 +74,10 @@ static void bcm2835_thermal_write(void *opaque, hwaddr addr,
                        __func__, value, addr);
         break;
     default:
-        /* MemoryRegionOps are aligned, so this can not happen. */
-        g_assert_not_reached();
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "bcm2835_thermal_write: invalid address 0x%"
+                      HWADDR_PRIx "\n", addr);
+        break;
     }
 }
 
-- 
2.34.1

