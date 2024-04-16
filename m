Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp245301ejd;
        Tue, 16 Apr 2024 02:19:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUg5YOb+/DUTTOiYRCYXaJBknpcudamihJhZl1mb0ZJbn3SjjprNeIqvlfmAPmtI5LOq5xQMpZKeYNnCHkz9tu3cQRfnMvj
X-Google-Smtp-Source: AGHT+IEGKmROe6V//Tm6BLrUPqKkv9iDeArKCPNa4p4dk/5Xrr5Fh1UCzN2c7W7SESlNDPcqu5V6
X-Received: by 2002:a05:620a:2093:b0:78d:6efe:ca56 with SMTP id e19-20020a05620a209300b0078d6efeca56mr13368535qka.74.1713259183284;
        Tue, 16 Apr 2024 02:19:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713259183; cv=none;
        d=google.com; s=arc-20160816;
        b=o+5Bj5mVPdqp2Dyk57H2SLcOKsf3la/f1tGpSeEL5rGfsiaTyfblUFmHoMmmC71foh
         Y3d169z1Idzy2XXGTTP/DxGI1cmduLKT2+bJ2iqrH0chaWCtwBlQ+XyicT1198nWkMn9
         3nHSWwe291KGRrlT6ISdCDiPDQLPrsuUDQpYOLLzjTtmGT3PTSlLrvRsuUUoFgJvpFTf
         U5sgdkVfEgaSxI748ccI0AF7B6g6dOL/wVSc9rs+W9fDRRztGKFe3DrkwvhrCrxlJzut
         eEc1XNWWIz2MQKQq+4E9E2aBEqXbGQcknT8bSJtoP8JmfyHk1zA67bCoFL0OJ0nO62N6
         5Lhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=JHVgeH3+xUuq6xOiD5sBK8wm816UWLK4jasR5IG2Tvs=;
        fh=4qsXPuPQQYwauqV4GBfUuJ135n2gY4LbnQu8KHliids=;
        b=nM9A7hDVdDB93tpZvuHZVkwcvdGTkt7baTc6iuhlhXa3awM8fqyG5rA7mj7c+FJIDi
         FHi1vCieEZ/t44f2LqRboRD+9pM7807RlsRY428TnC68Qzt3dWGYup+SsSSpB+anpNqV
         d5H546l6JP5WqzCshpilxvwPPo/Ns7XugY2GYuBXa2eP6JbQh/rmeyp9TV77y1eZUon6
         Tve2uH9clZcef5t52UTaZQKxLas8r33masWFF8YFAD+dhMdvYIj+6APjE/n8Qzvoy0P+
         tOuJLLDMh4MfHJ1Vna3i2QwvUj1mQhqg6QZV2gokS4uHva1xHBNsQf4qJp102Nd/62Bf
         P0WQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e20-20020a05620a209400b0078ed7150856si7260126qka.66.2024.04.16.02.19.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Apr 2024 02:19:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rweyX-0002e4-RT; Tue, 16 Apr 2024 05:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1rweyV-0002cP-Mt; Tue, 16 Apr 2024 05:19:35 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1rweyU-0007Zt-A7; Tue, 16 Apr 2024 05:19:35 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 17:19:06 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 16 Apr 2024 17:19:06 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v3 04/16] aspeed/sdmc: fix coding style
Date: Tue, 16 Apr 2024 17:18:51 +0800
Message-ID: <20240416091904.935283-5-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240416091904.935283-1-jamin_lin@aspeedtech.com>
References: <20240416091904.935283-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Xyn8sAthoJoO

Fix coding style issues from checkpatch.pl

Test command:
scripts/checkpatch.pl --no-tree -f hw/misc/aspeed_sdmc.c

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/misc/aspeed_sdmc.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index 74279bbe8e..873d67c592 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -296,7 +296,8 @@ static void aspeed_2400_sdmc_write(AspeedSDMCState *s, uint32_t reg,
                                    uint32_t data)
 {
     if (reg == R_PROT) {
-        s->regs[reg] = (data == PROT_KEY_UNLOCK) ? PROT_UNLOCKED : PROT_SOFTLOCKED;
+        s->regs[reg] =
+            (data == PROT_KEY_UNLOCK) ? PROT_UNLOCKED : PROT_SOFTLOCKED;
         return;
     }
 
@@ -354,7 +355,8 @@ static void aspeed_2500_sdmc_write(AspeedSDMCState *s, uint32_t reg,
                                    uint32_t data)
 {
     if (reg == R_PROT) {
-        s->regs[reg] = (data == PROT_KEY_UNLOCK) ? PROT_UNLOCKED : PROT_SOFTLOCKED;
+        s->regs[reg] =
+            (data == PROT_KEY_UNLOCK) ? PROT_UNLOCKED : PROT_SOFTLOCKED;
         return;
     }
 
@@ -434,8 +436,9 @@ static void aspeed_2600_sdmc_write(AspeedSDMCState *s, uint32_t reg,
     }
 
     if (s->regs[R_PROT] == PROT_HARDLOCKED) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: SDMC is locked until system reset!\n",
-                __func__);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: SDMC is locked until system reset!\n",
+                      __func__);
         return;
     }
 
-- 
2.25.1

