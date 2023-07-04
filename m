Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2959523ejy;
        Tue, 4 Jul 2023 07:51:58 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHD+DDYCkbGlvu7L+Vwcaqi8Nr5DPPRK7t027OYZoLBGZoRlHRxEeq+33OPfTlAHkfmNZbG
X-Received: by 2002:a05:620a:4256:b0:767:6548:dc68 with SMTP id w22-20020a05620a425600b007676548dc68mr8418722qko.20.1688482318253;
        Tue, 04 Jul 2023 07:51:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688482318; cv=none;
        d=google.com; s=arc-20160816;
        b=la0diICAX2S/Qeoez5JhOv9UAQYhD2V46LtFun6Ginxtmf+JqAHCvD5XJdgjx11LsZ
         snwHrSbljdlO84NbtYivjuvsx9PUK5rEyeyM0FhV0CRagi+7SH4h5lYbLnrSj4I412b3
         uBd9dpMKSv3GmOKvlk71VE5Q13SeBUwVo85HxzJetVH9JvCnYC9f/IZbtJhuF9nQCaFs
         jYBoNyLr8sS+hdk4/j4CXDNLnCIYhZ+VaoJbV0Cc0RqYdbWzARgiFzsRQPQtvxLUQ1qS
         rT59nGgPAWWBYx2AxX9ipqntlVLFZUtcAHFLH0jJXJxxlzQwwmORRlwVKCSIellWVTfX
         dVYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vDbZi+FugjgWhilKkMiEZjysEFMTjfONCoSIxxTN6sY=;
        fh=Lngrjms14biHE1uwg3hJItOsHUc/fKOP3kWz84zgU0I=;
        b=AkCTi8ud+UR7YBnHDcaImcHifMcEWTo5VPwPathkBKGTkhnTUUJVih2Nvb5o2EF8px
         4jAt/L4cgKs1qDr+VD75hDfmrFjiJqTwr5z2gD4Gh0ZVITqKDRHcmO/V8QHrQgk+pBbj
         TsdIu67LTOAB+RqjPWwY1h5WL77FCCk5eOmtjaewmmdhZqkMBWFYVZSET69qO5DtK527
         KIvHWGiTRt9rhYMBHNyv9e9kZ+q28J0KspWKEexFhg4R1YxNtlprTU7A/4tO9y4+rMJ6
         zc7hX6GCD2weVhkWRcdSHFoH16YMJ//MwiJTiMvjL9+5zXVU9Y9B2PMtWzLeJytNfU3t
         E9Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cf31yA0r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2-20020a05620a214200b0075ca70e4659si11697950qkm.261.2023.07.04.07.51.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jul 2023 07:51:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cf31yA0r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGhNJ-0004ww-CA; Tue, 04 Jul 2023 10:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGhMw-0004CP-6O
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 10:51:12 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGhMt-00036h-6Y
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 10:51:05 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3143b70d6easo1844719f8f.2
 for <qemu-arm@nongnu.org>; Tue, 04 Jul 2023 07:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688482261; x=1691074261;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vDbZi+FugjgWhilKkMiEZjysEFMTjfONCoSIxxTN6sY=;
 b=Cf31yA0rPCjRrlKVGtc1E7y9DsccYWcUESQjyLath1r2cZniaPx3hntbzaqVcsGwna
 8vPKoruKH5ImwitIN/gfVxOQfTttNiSeOcGAD5d2V6GffczXEOg8VcXzR/CLHXBcj4Ew
 EOj4m7vRMfiOfM+o57OEqfllLZNrOedU6bzV0r7ohxoNVydF+J4DfwIaNntJaowFCRqE
 e9tYLqi2ipjgqoZCbZ/PLXHSDLvWbC59Yb8TgGaECtFDPBPYUQEhIxmLWPpdK13Lg4bJ
 zyEOjqMXBba8k5seb8Yw0/pHnal7nBGyb2BuAMuyUxNoWx4E/U47wqNSfmb7h7xmmmz6
 tAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688482261; x=1691074261;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vDbZi+FugjgWhilKkMiEZjysEFMTjfONCoSIxxTN6sY=;
 b=dhtPiZVVTKkgHUOvv1lLvar0murYd/h/ddeDl2tyMxCDafonwaMzEmlvYdL5Q0FVgT
 ulY44Z5MOfr5tvpon5mmWop4I8Z0wm3oyywevy/Xz9g+ablSYIag+GFMmAHe8qWSijiz
 I4cMXft3lbUNrYEEYFE9efTXjDu+OO7bha/Nzw64r+Bp2AMov0ATCPRWQCcg0dW7NGQk
 VCCb9XFbTeO/KedUXas4lclao/D4gc5/fCE4zRUHuHe/SHfTvncMC7+WxERaRs25xYSW
 UwOeKKgCq2IrvMJjh9a3CpGEb2T5SOZZFfj1jLXXzfVi2Y7wFaFpGB9tB6+4Cisb9fiJ
 IbJw==
X-Gm-Message-State: ABy/qLYAvdFMtTMePvH65hG8sIYgbCdKRXhOsW1eQ7T3afP6l70dGwf8
 94aBuNa/72Ei8L43A2aLh2kxAg==
X-Received: by 2002:adf:ef4e:0:b0:314:25c6:7f6d with SMTP id
 c14-20020adfef4e000000b0031425c67f6dmr10401009wrp.14.1688482261685; 
 Tue, 04 Jul 2023 07:51:01 -0700 (PDT)
Received: from localhost.localdomain ([176.176.157.122])
 by smtp.gmail.com with ESMTPSA id
 e17-20020a5d5951000000b00313f61889ecsm22420188wri.66.2023.07.04.07.51.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 04 Jul 2023 07:51:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sergey Kambalin <serg.oker@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 09/19] hw/timer/arm_timer: Convert read/write handlers to
 MemoryRegionOps ones
Date: Tue,  4 Jul 2023 16:50:02 +0200
Message-Id: <20230704145012.49870-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230704145012.49870-1-philmd@linaro.org>
References: <20230704145012.49870-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: PghhlMMhWAit

In order to simplify the QOM convertion of ARM_TIMER in a few
commits, start converting the read/write() handlers to follow
the MemoryRegionOps::read/write() prototypes.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/timer/arm_timer.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 0d7fac4d78..cbd82e8365 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -50,7 +50,7 @@ static void arm_timer_update(ArmTimer *s)
     }
 }
 
-static uint32_t arm_timer_read(void *opaque, hwaddr offset)
+static uint64_t arm_timer_read(void *opaque, hwaddr offset, unsigned size)
 {
     ArmTimer *s = opaque;
 
@@ -97,7 +97,7 @@ static void arm_timer_recalibrate(ArmTimer *s, int reload)
 }
 
 static void arm_timer_write(void *opaque, hwaddr offset,
-                            uint32_t value)
+                            uint64_t value, unsigned size)
 {
     ArmTimer *s = opaque;
     int freq;
@@ -233,10 +233,10 @@ static uint64_t sp804_read(void *opaque, hwaddr offset,
     SP804Timer *s = opaque;
 
     if (offset < 0x20) {
-        return arm_timer_read(s->timer[0], offset);
+        return arm_timer_read(&s->timer[0], offset, size);
     }
     if (offset < 0x40) {
-        return arm_timer_read(s->timer[1], offset - 0x20);
+        return arm_timer_read(&s->timer[1], offset - 0x20, size);
     }
 
     /* TimerPeriphID */
@@ -265,12 +265,12 @@ static void sp804_write(void *opaque, hwaddr offset,
     SP804Timer *s = opaque;
 
     if (offset < 0x20) {
-        arm_timer_write(s->timer[0], offset, value);
+        arm_timer_write(&s->timer[0], offset, value, size);
         return;
     }
 
     if (offset < 0x40) {
-        arm_timer_write(s->timer[1], offset - 0x20, value);
+        arm_timer_write(&s->timer[1], offset - 0x20, value, size);
         return;
     }
 
@@ -356,7 +356,7 @@ static uint64_t icp_pit_read(void *opaque, hwaddr offset,
         return 0;
     }
 
-    return arm_timer_read(s->timer[n], offset & 0xff);
+    return arm_timer_read(&s->timer[n], offset & 0xff, size);
 }
 
 static void icp_pit_write(void *opaque, hwaddr offset,
@@ -371,7 +371,7 @@ static void icp_pit_write(void *opaque, hwaddr offset,
         return;
     }
 
-    arm_timer_write(s->timer[n], offset & 0xff, value);
+    arm_timer_write(&s->timer[n], offset & 0xff, value, size);
 }
 
 static const MemoryRegionOps icp_pit_ops = {
-- 
2.38.1

