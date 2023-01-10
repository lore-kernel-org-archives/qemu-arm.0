Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2996500ejc;
        Tue, 10 Jan 2023 00:41:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvSImyER20t3DD7Obsk/7ZMJOFbhrUJN5p3rKMz+Teep6E65CFJbAtHWdpKuPYI0E9M+Hzk
X-Received: by 2002:ac8:5481:0:b0:3a7:e2df:e868 with SMTP id h1-20020ac85481000000b003a7e2dfe868mr82057198qtq.41.1673340113492;
        Tue, 10 Jan 2023 00:41:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673340113; cv=none;
        d=google.com; s=arc-20160816;
        b=Y7S3J7RITKu3C1NAkU75gkna+o6pyGJLVfaz8YgPziEmp8uc9UIkx2lnvKgmO589Yg
         2H8dcFkTswFUdfQHsUJ8an1HJlehQaIb6Tut9dOeKJrbOKHVpdwijJZwPAhPusM42/Aa
         luBwtiqm6nygwASCniUIM6LjXsu9brr4s0a/+iFP6lYzIYzrCMUbeigZPMX2f9Ey8Oo9
         o6/70X5BWe15yHYshEihjSQvwdH+NozZgvDpAAPgHknS5nZpYbF8q47TVKnU+GEWkjJE
         oZR9sQuXQOf1K3ZkH2gdwNDSDLmlVfORcYkXRajI7X6Vx+f0P8f6D6bKyApID2kdAhdQ
         2wdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iDnNDu+oMICH4wdH8XoWszonkd1H38BArRChhxQlZUY=;
        b=hAapzP+jf9pvYOlrAWAL5/5goFpAjHh0j9/zXJQmh5qrwVUmtz/vRK1MNyyAfhyKDk
         68je5Mz41HFwaEkYxuDLQk7La122mBDfnr/DACH4BBVy/BdckpIjkAa2Fs6bz+HL1AKY
         wj0aU6Q9TEWEzY1PoLSIGdBrVGPsPVxybJi4t+/Kl6rIu3XhIJNBxA/s2EiSCvMndhMh
         nLFJ7CaouMe2fdM4LiXMelxcxOq5a4GwmqljKSCAFZ065VrhIr9C9JYEcUe3mr6vm+kz
         X0Kp94mui/MlZrkP/nnzLQjhYwn23s77EhId5lZ2cV4F7zbgx9rYjJYKHaHkPRxUS3F8
         YYRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IhhgT/jd";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r15-20020ae9d60f000000b006fb3a1d1eb1si5696762qkk.639.2023.01.10.00.41.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Jan 2023 00:41:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IhhgT/jd";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pFA18-0006gM-EF; Tue, 10 Jan 2023 03:29:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFA12-0006eh-Sz
 for qemu-arm@nongnu.org; Tue, 10 Jan 2023 03:29:56 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFA10-0006JL-DX
 for qemu-arm@nongnu.org; Tue, 10 Jan 2023 03:29:52 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so583986wml.0
 for <qemu-arm@nongnu.org>; Tue, 10 Jan 2023 00:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iDnNDu+oMICH4wdH8XoWszonkd1H38BArRChhxQlZUY=;
 b=IhhgT/jdED5YXPhBH+OO3KYG25RU8oHkoKptSPMMkUnvrq14RWge8xot7+BYF/fYoa
 IaTA3ZiPJpi6oEoZd6PTQVbWG19MVIgK8ftcN9yXUO8/yWGOsYHDaSs1CIdGaaFKJnFw
 wYcriEdUxNH7+5Q1kj+bk5xgiBb3YhCFXoiGe1mOwD66anFS+8mTrkHbgJqPX6DkFa9i
 D15FCq9Yn9OgmbTvVrp2GLhTsFD/wzhs2fxME7j1YGeTo+3AGRUrJCeO72J/hQJNeJgd
 kF1i1Elf94RvJ51+/XFTS7sHeGD1urKDepnvnANCumMrir4PbVmOwjboXRQHfGItpObo
 YJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iDnNDu+oMICH4wdH8XoWszonkd1H38BArRChhxQlZUY=;
 b=ogGF3Tg/UWIhS3kTWqXrg1KX/4D6yeKcgVIc3OlC5Yg5ccmBZF+FOMWo/O+Hymf9qk
 fH6e4hkwkND0gZYuYwOtisq9CT+wwdnOSB28Brgou97FQFkP2EjCTTQZUeRlsVPbas/D
 zd7TNOG391jwwaNsIxMRvS4dgDG8T1HDtKKMJRue4u6a2c+DxBlt5svbdhuHa7WT58sL
 QLgbKVEmiUTOWRKvO7ZR8OQY5HpUPTANFDJUFclccJrCLbnGW8z7XIemc2k5pQ02eMq3
 gppzESvy2wL1aieKkuUN8gjyOlvSo7EQRVz0B8EajbGAuLWHSjr7B/OOJKvhXcvBHMUz
 069g==
X-Gm-Message-State: AFqh2konupnPy0kIhVgKcIW1VdeFSpttxVT/kdPRm2G8sY+vMNZyxbeG
 QP4YNK1P1Z8x/nYVtZzrNxPgBg==
X-Received: by 2002:a05:600c:ac8:b0:3d7:7cea:b410 with SMTP id
 c8-20020a05600c0ac800b003d77ceab410mr48541017wmr.33.1673339388858; 
 Tue, 10 Jan 2023 00:29:48 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a05600c0ad200b003d9c97d82f2sm13869803wmr.8.2023.01.10.00.29.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 00:29:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 3/5] hw/i2c/bitbang_i2c: Change state calling
 bitbang_i2c_set_state() helper
Date: Tue, 10 Jan 2023 09:29:30 +0100
Message-Id: <20230110082932.24386-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110082932.24386-1-philmd@linaro.org>
References: <20230110082932.24386-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Cw4b4Qu6eYpF

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/i2c/bitbang_i2c.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
index e41cb63daa..bf4b781393 100644
--- a/hw/i2c/bitbang_i2c.c
+++ b/hw/i2c/bitbang_i2c.c
@@ -26,13 +26,19 @@ do { printf("bitbang_i2c: " fmt , ## __VA_ARGS__); } while (0)
 #define DPRINTF(fmt, ...) do {} while(0)
 #endif
 
+static void bitbang_i2c_set_state(bitbang_i2c_interface *i2c,
+                                  bitbang_i2c_state state)
+{
+    i2c->state = state;
+}
+
 static void bitbang_i2c_enter_stop(bitbang_i2c_interface *i2c)
 {
     DPRINTF("STOP\n");
     if (i2c->current_addr >= 0)
         i2c_end_transfer(i2c->bus);
     i2c->current_addr = -1;
-    i2c->state = STOPPED;
+    bitbang_i2c_set_state(i2c, STOPPED);
 }
 
 /* Set device data pin.  */
@@ -69,7 +75,7 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level)
         if (level == 0) {
             DPRINTF("START\n");
             /* START condition.  */
-            i2c->state = SENDING_BIT7;
+            bitbang_i2c_set_state(i2c, SENDING_BIT7);
             i2c->current_addr = -1;
         } else {
             /* STOP condition.  */
@@ -96,7 +102,7 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level)
     case SENDING_BIT7 ... SENDING_BIT0:
         i2c->buffer = (i2c->buffer << 1) | data;
         /* will end up in WAITING_FOR_ACK */
-        i2c->state++; 
+        bitbang_i2c_set_state(i2c, i2c->state + 1);
         return bitbang_i2c_ret(i2c, 1);
 
     case WAITING_FOR_ACK:
@@ -117,13 +123,14 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level)
              * device we were sending to decided to NACK us).
              */
             DPRINTF("Got NACK\n");
+            bitbang_i2c_set_state(i2c, SENT_NACK);
             bitbang_i2c_enter_stop(i2c);
             return bitbang_i2c_ret(i2c, 1);
         }
         if (i2c->current_addr & 1) {
-            i2c->state = RECEIVING_BIT7;
+            bitbang_i2c_set_state(i2c, RECEIVING_BIT7);
         } else {
-            i2c->state = SENDING_BIT7;
+            bitbang_i2c_set_state(i2c, SENDING_BIT7);
         }
         return bitbang_i2c_ret(i2c, 0);
     }
@@ -134,18 +141,18 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level)
     case RECEIVING_BIT6 ... RECEIVING_BIT0:
         data = i2c->buffer >> 7;
         /* will end up in SENDING_ACK */
-        i2c->state++;
+        bitbang_i2c_set_state(i2c, i2c->state + 1);
         i2c->buffer <<= 1;
         return bitbang_i2c_ret(i2c, data);
 
     case SENDING_ACK:
-        i2c->state = RECEIVING_BIT7;
         if (data != 0) {
             DPRINTF("NACKED\n");
-            i2c->state = SENT_NACK;
+            bitbang_i2c_set_state(i2c, SENT_NACK);
             i2c_nack(i2c->bus);
         } else {
             DPRINTF("ACKED\n");
+            bitbang_i2c_set_state(i2c, RECEIVING_BIT7);
         }
         return bitbang_i2c_ret(i2c, 1);
     }
-- 
2.38.1

