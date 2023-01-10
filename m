Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3018319ejc;
        Tue, 10 Jan 2023 01:19:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXswpB2EnoXcKKCJxj5oM8wk5VnjPkOFsZ9Q9mjtsEli77kbhZDoxvukY5Ba3XhtMYSDsNS8
X-Received: by 2002:ac8:728f:0:b0:3a9:68c6:2368 with SMTP id v15-20020ac8728f000000b003a968c62368mr85478957qto.30.1673342380761;
        Tue, 10 Jan 2023 01:19:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673342380; cv=none;
        d=google.com; s=arc-20160816;
        b=YBuAhzp7Sbh7WKRGbGxm9BdMGmFDDh0ZGWNSmIPismO5FZv55ugMFjwrKPz/HjeZ6c
         SxiqISkBbD4rHH4p3nGbYzx3i8bJymqee41hqzviuHyEEArMWCciuMRxwyL+6xGqQHUl
         5CdOyWNXTzJllytA7y8myjMotMRC/YtwZqRrw9e8/YBEbPHaraj/ZElxRD5/PRRjYiDa
         yPs/OmE6v7GI7Q/38TYt0Qy0oNf9TBVDYnczRhLEA7mEOoZSOToLg2UsxUpsluR/iEC9
         CfoZW2EgYpSleCTolHz52TEACy2J07qaDKTFYAjCgfB3itC0efceZBeV0sMgmqIngApH
         GmOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yDI+NMLY3kwFwk/S7hyFI2p4AMTGBHGEpIPdQhrWZDA=;
        b=Ci2r5N/eFAMOt5UEb+u0VzCaYjagNNaW3KJjMHiLIIFZd/WwZzAtOzp3DAQ10U6Dg6
         Zg3ORZw45oCu/9lm84JfumW16kbl+tK/4l1ELOsAWuhZ5HPNeFMyk9Pr3qpfTshUROnX
         4dlLph25gtrrYqdKfTyevssoBt0GLTSbgkdxrRxc/g4yOfQ0Lre6tTq7m4yevYQAvocF
         SYc/Z/Tl/0ZSab21m5kWj4sVsT76ItOsytIvLI1aFqL5vVIyhZdeXo3QtVRMAqDgBzwv
         +LA7fOXD2fre81ANle2DfoGcucW6pHkYLVQx1+YJEszNgzJnDhb2U6Pn5A+nXtsx+Ctc
         0ydw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fcz5Ry+q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cn3-20020a05622a248300b003aead8591fesi1943042qtb.25.2023.01.10.01.19.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Jan 2023 01:19:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fcz5Ry+q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pF9ws-0005cd-HG; Tue, 10 Jan 2023 03:25:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF9wq-0005bL-IR
 for qemu-arm@nongnu.org; Tue, 10 Jan 2023 03:25:32 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF9wp-0004eK-0n
 for qemu-arm@nongnu.org; Tue, 10 Jan 2023 03:25:32 -0500
Received: by mail-wr1-x429.google.com with SMTP id az7so10885328wrb.5
 for <qemu-arm@nongnu.org>; Tue, 10 Jan 2023 00:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yDI+NMLY3kwFwk/S7hyFI2p4AMTGBHGEpIPdQhrWZDA=;
 b=fcz5Ry+qWpo+SNgb49kngVWkzWmmab32dwHA4AbVp//EPjzQ/d1OCwBeG02Hp8Qg4i
 Pbayxa1fvcmbW7FdkntSNOBbMmoOXWfwIHgYDPRaoFIEkdBg94Iz0JRC4uoq2WbHu6MJ
 0A1NzMg/DrkdyNC1jx6VMgKejSyObyz1kSBQkuYLMaouxWB6az0fM2tyyOaJbasczxkj
 Tw6guBfl11wj8fQpGX+E/tXiB1woVGaSzMVbtNClt1JKo4vHv6/dnwMyTAZ9uU5MtK+S
 4PzRagd3mWZ7MVleDh/2v0/FPM/rtoohSK9yv+kC/SyXh/CU88K/AlOr6Hp+DmxrbPxu
 TmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yDI+NMLY3kwFwk/S7hyFI2p4AMTGBHGEpIPdQhrWZDA=;
 b=DtY5qtOKMJQwk+cLtTL0FDy9Vs0eM+QUhD5GPNAuSXvbe/AsD+rULFf2MGB8vDxY8F
 /U6xKulPLlU+xgjMXyPM8Dp6KDoNA7xPVoW8F2xAfv1S14tat6E7OYG2vBe5JcmwRsof
 YBUYIWv8wY21UdjnaGuSuPld8P1nLBaxhWBK1UBQPefvqlBYqT2LcRKXLHMu+4f8I21C
 O9YVjKiZlM6otgqkAmvrV7bvNZw8F6LblHf07FJ/00APdpJyvIFQnbYxNNIDgb1y+WGd
 XcXFEBwRjmYeN4uNUiro+qcdStPR+q/PPRXVywdRtcjDKYt24wUJGr8QNQ09taOxltiX
 wgiA==
X-Gm-Message-State: AFqh2kqmV5vWg2qE3Cv2h85ux4nm4f+j5r/4+pCjQ0WCG+OuYBPzt7ID
 4NfkbuLGLDFh92nRdHouKtSB9jUWe2rthcFD
X-Received: by 2002:adf:fe0a:0:b0:2bd:6ddc:3a44 with SMTP id
 n10-20020adffe0a000000b002bd6ddc3a44mr779612wrr.62.1673339129539; 
 Tue, 10 Jan 2023 00:25:29 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 u14-20020adfdd4e000000b002366e3f1497sm10663791wrm.6.2023.01.10.00.25.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 00:25:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 4/5] hw/i2c/versatile_i2c: Use ARM_SBCON_I2C() macro
Date: Tue, 10 Jan 2023 09:25:07 +0100
Message-Id: <20230110082508.24038-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110082508.24038-1-philmd@linaro.org>
References: <20230110082508.24038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: JL5BtT1rIxq7

ARM_SBCON_I2C() macro and ArmSbconI2CState typedef are
already declared via the QOM DECLARE_INSTANCE_CHECKER()
macro in "hw/i2c/arm_sbcon_i2c.h". Drop the VERSATILE_I2C
declarations from versatile_i2c.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/i2c/versatile_i2c.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/i2c/versatile_i2c.c b/hw/i2c/versatile_i2c.c
index b95c70608b..d19df62265 100644
--- a/hw/i2c/versatile_i2c.c
+++ b/hw/i2c/versatile_i2c.c
@@ -29,11 +29,6 @@
 #include "qemu/module.h"
 #include "qom/object.h"
 
-typedef ArmSbconI2CState VersatileI2CState;
-DECLARE_INSTANCE_CHECKER(ArmSbconI2CState, VERSATILE_I2C,
-                         TYPE_ARM_SBCON_I2C)
-
-
 
 REG32(CONTROL_GET, 0)
 REG32(CONTROL_SET, 0)
@@ -86,7 +81,7 @@ static const MemoryRegionOps versatile_i2c_ops = {
 static void versatile_i2c_init(Object *obj)
 {
     DeviceState *dev = DEVICE(obj);
-    ArmSbconI2CState *s = VERSATILE_I2C(obj);
+    ArmSbconI2CState *s = ARM_SBCON_I2C(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     I2CBus *bus;
 
-- 
2.38.1

