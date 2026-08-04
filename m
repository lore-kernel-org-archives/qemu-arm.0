Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995D5C5518F
	for <qemu-arm@archiver.kernel.org>; Tue,  4 Aug 2026 14:46:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wrGPV-0002Sr-Gp; Tue, 04 Aug 2026 10:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huang.botsz@gmail.com>)
 id 1wrGPQ-0002Rl-6i
 for qemu-arm@nongnu.org; Tue, 04 Aug 2026 10:46:25 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <huang.botsz@gmail.com>)
 id 1wrGPO-00013Y-4L
 for qemu-arm@nongnu.org; Tue, 04 Aug 2026 10:46:23 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-384930ca5e2so4043243a91.3
 for <qemu-arm@nongnu.org>; Tue, 04 Aug 2026 07:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785854777; x=1786459577; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=CSa5gtZjReAy+ibyYVDzpszBYSW7M8VPvzqtePKDMK8=;
 b=M5eU3tydIEteeYCtiY/u8UDe39/Y6fZb92YdpZTCVMXCc7QJBqSiNl4a2uM9cb4lS8
 L9jvjSV62MOi5njKsx+ybSCoP9+CihBqg3LEPXlqg679ZB+06pAsbZK6pXkA5CqIP1u5
 ZkMaNic5JzF+TfDYJQlUzJWjxFJ5qDyuNTEzQRAKie5Yfkm7jpi8xp786l74kOdxJYfN
 hrLD0qD2vYOAyI6z+4Kjqg2GbkkQ59WPD7U3dTcqG7/nGks5Z9NUz2oVnq+MsB3MwAx/
 2sQHTf9WvryyabYIU1vdAYVjz+lNQNeFShXMHPvUErQ8sTPjGAbVdjX8xB+5LgeUTK+i
 0uwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785854777; x=1786459577;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CSa5gtZjReAy+ibyYVDzpszBYSW7M8VPvzqtePKDMK8=;
 b=fQNKoLXNPOne+mzlA51uOPO4BAe4GZC35ZQ4l8CpXvzUS2KANFNJZ7IqjTyChCnzrW
 Ugj32hPXMtoE+0BCo7FKhAC7uKW+wibVTa5bArzGkLPU2zLeuERDBsaZbvXp+524M67T
 cJB/j6+W+67ZvahnHQEXsFpbIPlzyHhpzP7EGUlDWQVZ19TQ7J6dJPJgDMqD2RkiCdP3
 sYXqrzmhqTu/rWPKgW371goxzj4UxNRFAYFw3cuhpA1+MCuj1XIbsC3djd4FcEXdME51
 PuYpsEuJon9Du51KBWfQZ2r5NQG5waLRc8tVgSjZhglckhngY77asicUoy+3SPKTG3Q+
 LQHw==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro8dbOkgjI1RJ5FpOxkqVoVOQ4u7S4d4767a7DI5dUGCSIX0a+5+6Xhp4cYoWWUVhLL0xceGiZ4gQ==@nongnu.org
X-Gm-Message-State: AOJu0YxVFXHBiTtMFdV02EzHq5r7H4O80QhSrqy7YeEl3IEEnR2jEt4Q
 J/WZRB7vLR282iFu4QkS0ontJwQMsYt+iZd/iX2LmT/btp7sHWgYOEHw
X-Gm-Gg: AR+sD11wTySLcodRCrQydQdomDJ+GQwuNC6+d26ODBTFPasb1uUTdZSebl1JvIHxG8u
 QORvSkJjTdcmkN7RVP411AZ+6W/K+5ksA7TgXy7+uD+XG50a/wGdF7VF7DHFyic8YVl+uiOr/yk
 9bmJRFN20XG0pjiE7w8uhx/0wRCAc9dcWMn1JBBUtYpIQQIm3e9fsbdd4Pn8w+fzfEwiIXv3m8A
 8RJwa5a4UBnu0F+ngSgjO5LGmr5NIiDBObhNVkrDY0dnzH3Hke/LaOAUy1EbRBOevOgxuWcKTX9
 19wzm9sP9D5hUvLvX7zWq62fD8rDp50errpIddTu9CVqjAOfDGj+VO7iDKPu8UoV/QpHOyefy0Q
 B0XBKq4Gqvnc34KYZ8HKYB284J3AoEdCjHgPbGQFXkzWBktmIMnfQJ/hWdnKR7pEaNIvJL3VW4Y
 2zXmSm8xJvLdCYtfCX1aZkgV2WCyNX1E2soZ7vS0vqdJyaBjif08N588AhpgLqXeDs+2QceAQ1h
 XokS8DOTxK5qm4vs4ENtt/T80uMccZDZPOWwpXZuWpl6KSUVeLaT57A4ic/MAJA6sXS0JkAMV6o
 Pt+XN4CgujiE80c631/elN2SXoh71ctO+TYQ3hJu+hbO2A==
X-Received: by 2002:a17:90b:3852:b0:38e:5964:97a8 with SMTP id
 98e67ed59e1d1-38fbc46d032mr12071305a91.16.1785854776683; 
 Tue, 04 Aug 2026 07:46:16 -0700 (PDT)
Received: from botszhome.. (118-171-39-160.dynamic-ip.hinet.net.
 [118.171.39.160]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38febffb36dsm1553009a91.7.2026.08.04.07.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2026 07:46:16 -0700 (PDT)
From: botszhuang <huang.botsz@gmail.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, philmd@mailo.com, qemu-arm@nongnu.org,
 sef1548@gmail.com, botszhuang <huang.botsz@gmail.com>
Subject: [PATCH] hw/i2c/bcm2835_i2c: Correct iomem size
Date: Tue,  4 Aug 2026 22:46:11 +0800
Message-ID: <20260804144611.31735-1-huang.botsz@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=huang.botsz@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The last valid register is the Clock Stretch Timeout (CLKT) at
offset 0x1c. Since it is a 32-bit register, the total memory
region size should be 0x1c + 4 = 0x20.

Update the size parameter in memory_region_init_io() from 0x24
to 0x20 to accurately reflect the hardware specification.

Signed-off-by: botszhuang <huang.botsz@gmail.com>
---
 hw/i2c/bcm2835_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i2c/bcm2835_i2c.c b/hw/i2c/bcm2835_i2c.c
index 34de1f36e5..5f6093087d 100644
--- a/hw/i2c/bcm2835_i2c.c
+++ b/hw/i2c/bcm2835_i2c.c
@@ -222,7 +222,7 @@ static void bcm2835_i2c_realize(DeviceState *dev, Error **errp)
     s->bus = i2c_init_bus(dev, NULL);
 
     memory_region_init_io(&s->iomem, OBJECT(dev), &bcm2835_i2c_ops, s,
-                          TYPE_BCM2835_I2C, 0x24);
+                          TYPE_BCM2835_I2C, 0x20);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
     sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
 }
-- 
2.43.0


