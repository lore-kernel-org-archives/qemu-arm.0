Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2498480njc;
        Tue, 23 Jul 2024 06:11:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV762JT7CSTECQay412m2/rKPSjV7gCVHfVZZ7liBA8EML5iHFBqPV4gQL5+Antg49DhkcaEosfxxaaTm2LqKLKpSFxtZzl
X-Google-Smtp-Source: AGHT+IH81wL7n18cXCgAVkqg+flhNfRqSF81LdQXoLx6b+NQA4tys0xuaSMoZ61SNrJ3PNnKbxN/
X-Received: by 2002:a05:6830:498d:b0:708:f88a:e3e7 with SMTP id 46e09a7af769-709009f09f2mr14190207a34.34.1721740290585;
        Tue, 23 Jul 2024 06:11:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721740290; cv=none;
        d=google.com; s=arc-20160816;
        b=JCY4SfuAyfUzl7TYf9hi7QwEZuaZQQ0E2Gx/QZFA0d3Aj1dGo14SGKxTkZ5MbhetyN
         Wte9CRkUT8IfaZOzSFbOy/1O/TyvRU3OOPSik1M2vWlsUzejPRFdtVTTJG0YZY6mYdTX
         58sBXwpYY1NfP3D0YDTOpFRvmzEPRwpB03Lt4CwdCCuWUFXW/sxoml3K6WHm4/cfkcH9
         zc/NrVpX6QXO1CwrEJs/G3NUfvzPG2eDkVgBtf5PtH4DwUIp20Ub2UkeDQFOsHgjrn6n
         uDWghnZPT1/tMyruIiYSdtgEWrwgf7vhDWoylQUwYWXE37ozR3bFuv/niFe0YOQ8WsD8
         yERA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9E2PaL3j+vd9cDXCmCuxFcqlpV5vqk14FssyzTSrOZg=;
        fh=N+JkB5fS9dtBw9Yowu6dwKMonyvLu2+1NgiKdmPgCY0=;
        b=bYo2q72GISWhE94B66pkq48dC5907XRihgYsiNDfst9sEYGKcBZmLoEAi+hzOeIsk5
         EHiN84kVXzT8DlN7m5jZ5e0kf7IlXTi0Gj4uJIEvqZRMUvmKkruiIZgNICFcUTC+cld6
         Bp7h+Fs9IuOvQAcrwk7je/OAFLAwqmxPKQA2/PbbirtdDR8++/wq+Xbkoha1lT07Bj8Q
         0HZpcvPbcXFm2rDKene53VEfHo1XqNrpf8IuXL3kb/o89/i91yTXmsDSNt4LF+HHxluT
         0pkfPANU4VOkgKVKGptVUzEFkPHS9JKklvhCyuURwhSxU0FlDu9wBEB/NtkrJQ8xw1Gz
         ERhw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kZGaOpVu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-826dc93aaf9si1173644241.68.2024.07.23.06.11.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jul 2024 06:11:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kZGaOpVu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sWFHv-0006Jy-VE; Tue, 23 Jul 2024 09:10:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sWFHu-0006ES-JO
 for qemu-arm@nongnu.org; Tue, 23 Jul 2024 09:10:42 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sWFHp-0000JB-99
 for qemu-arm@nongnu.org; Tue, 23 Jul 2024 09:10:42 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52fc4388a64so1685844e87.1
 for <qemu-arm@nongnu.org>; Tue, 23 Jul 2024 06:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721740234; x=1722345034; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9E2PaL3j+vd9cDXCmCuxFcqlpV5vqk14FssyzTSrOZg=;
 b=kZGaOpVuBAkbvhXWcHHAwlkKHgia25On/j2OTsM42IDzh7OUrikyYn8pFgdvOJgM/d
 ZZnb6k7UWVWYVaOgAV2aa6hNtoaQsmV+NvPXUb+x4wzyB6gvAYb0X/kcU5rjr6dcMauB
 HV/L4Fog5E52NrKsrAY0ZDGxL1+RIVggGHf8atbffek6vfFDbHpd+sQUPdgEn4gXaF9b
 bEtnDUuYhz6IxlO1NTqfMI2Q13HvDCzhC+8egr043WOOMX6vZVAhAMocw2cflybGS9bN
 mnERjNXZisIg8X4AOGWA5JRRtXfITynnYaCxI8gWx6P4ii7b5QFA/Ao+O47A+MO9sOp6
 e9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721740234; x=1722345034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9E2PaL3j+vd9cDXCmCuxFcqlpV5vqk14FssyzTSrOZg=;
 b=iYJEBClHYrPzx3kEynHa+He0cSYzl5lWEvhbUXfG5rqXSGntVgBiUwP+9Qa1JCzvlz
 +XIN+7L19mLmvmSmBgMwCU6e0yoa/G1OfgLzp+wC00FEIBmggSC5a8OZ3aCd0XZ8PaTd
 3K6nFmIUL/xAbwjVR44WdAupx5sU/zREXFaJ9jI35/ZGdzdOhdxMxUps8T+SWynnTjgT
 k4snV7oKBejDoeYD8BmXGrgKOrXOnkm4OgXMOzmWAFXh5t/f1A64AHYNtTQhue23IUkZ
 eVhGas3qDJzDhlP3hdUf4sV9z4BcTiMZh2WU4KYN3/3JuBtlcy0USFbfjKDYlup1l+F2
 mY4w==
X-Gm-Message-State: AOJu0YxgzuVWFiSSBrKJpb9zf0fDO6oG0TEMncf6eDUMJWrKRBcLaPhL
 9a4ZkiTvkjZVsseScQDlpUSboXDKgEuzWYUJQt7yXGsOq1tJG5BdkLpkOo08X7VX8SK5O6aLr+7
 m
X-Received: by 2002:a05:6512:31d5:b0:52e:97dd:327b with SMTP id
 2adb3069b0e04-52fc4047a95mr2439492e87.23.1721740234156; 
 Tue, 23 Jul 2024 06:10:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36878684773sm11560157f8f.7.2024.07.23.06.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 06:10:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-stable@nongnu.org
Subject: [PATCH 3/4] hw/misc/bcm2835_property: Restrict scope of start_num,
 number, otp_row
Date: Tue, 23 Jul 2024 14:10:28 +0100
Message-Id: <20240723131029.1159908-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723131029.1159908-1-peter.maydell@linaro.org>
References: <20240723131029.1159908-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x136.google.com
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
X-TUID: PMvURqlBiG4j

In the long function bcm2835_property_mbox_push(), the variables
start_num, number and otp_row are used only in the four cases which
access OTP data, and their uses don't overlap with each other.

Make these variables have scope restricted to the cases where they're
used, so it's easier to read each individual case without having to
cross-refer up to the variable declaration at the top of the function
and check whether the variable is also used later in the loop.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/bcm2835_property.c | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index 7eb623b4e90..443d42a1824 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -30,7 +30,6 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
     uint32_t tot_len;
     size_t resplen;
     uint32_t tmp;
-    uint32_t start_num, number, otp_row;
 
     /*
      * Copy the current state of the framebuffer config; we will update
@@ -331,22 +330,25 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
         /* Customer OTP */
 
         case RPI_FWREQ_GET_CUSTOMER_OTP:
-            start_num = ldl_le_phys(&s->dma_as, value + 12);
-            number = ldl_le_phys(&s->dma_as, value + 16);
+        {
+            uint32_t start_num = ldl_le_phys(&s->dma_as, value + 12);
+            uint32_t number = ldl_le_phys(&s->dma_as, value + 16);
 
             resplen = 8 + 4 * number;
 
             for (uint32_t n = start_num; n < start_num + number &&
                  n < BCM2835_OTP_CUSTOMER_OTP_LEN; n++) {
-                otp_row = bcm2835_otp_get_row(s->otp,
+                uint32_t otp_row = bcm2835_otp_get_row(s->otp,
                                               BCM2835_OTP_CUSTOMER_OTP + n);
                 stl_le_phys(&s->dma_as,
                             value + 20 + ((n - start_num) << 2), otp_row);
             }
             break;
+        }
         case RPI_FWREQ_SET_CUSTOMER_OTP:
-            start_num = ldl_le_phys(&s->dma_as, value + 12);
-            number = ldl_le_phys(&s->dma_as, value + 16);
+        {
+            uint32_t start_num = ldl_le_phys(&s->dma_as, value + 12);
+            uint32_t number = ldl_le_phys(&s->dma_as, value + 16);
 
             resplen = 4;
 
@@ -367,32 +369,35 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
 
             for (uint32_t n = start_num; n < start_num + number &&
                  n < BCM2835_OTP_CUSTOMER_OTP_LEN; n++) {
-                otp_row = ldl_le_phys(&s->dma_as,
+                uint32_t otp_row = ldl_le_phys(&s->dma_as,
                                       value + 20 + ((n - start_num) << 2));
                 bcm2835_otp_set_row(s->otp,
                                     BCM2835_OTP_CUSTOMER_OTP + n, otp_row);
             }
             break;
+        }
 
         /* Device-specific private key */
-
         case RPI_FWREQ_GET_PRIVATE_KEY:
-            start_num = ldl_le_phys(&s->dma_as, value + 12);
-            number = ldl_le_phys(&s->dma_as, value + 16);
+        {
+            uint32_t start_num = ldl_le_phys(&s->dma_as, value + 12);
+            uint32_t number = ldl_le_phys(&s->dma_as, value + 16);
 
             resplen = 8 + 4 * number;
 
             for (uint32_t n = start_num; n < start_num + number &&
                  n < BCM2835_OTP_PRIVATE_KEY_LEN; n++) {
-                otp_row = bcm2835_otp_get_row(s->otp,
+                uint32_t otp_row = bcm2835_otp_get_row(s->otp,
                                               BCM2835_OTP_PRIVATE_KEY + n);
                 stl_le_phys(&s->dma_as,
                             value + 20 + ((n - start_num) << 2), otp_row);
             }
             break;
+        }
         case RPI_FWREQ_SET_PRIVATE_KEY:
-            start_num = ldl_le_phys(&s->dma_as, value + 12);
-            number = ldl_le_phys(&s->dma_as, value + 16);
+        {
+            uint32_t start_num = ldl_le_phys(&s->dma_as, value + 12);
+            uint32_t number = ldl_le_phys(&s->dma_as, value + 16);
 
             resplen = 4;
 
@@ -404,12 +409,13 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
 
             for (uint32_t n = start_num; n < start_num + number &&
                  n < BCM2835_OTP_PRIVATE_KEY_LEN; n++) {
-                otp_row = ldl_le_phys(&s->dma_as,
+                uint32_t otp_row = ldl_le_phys(&s->dma_as,
                                       value + 20 + ((n - start_num) << 2));
                 bcm2835_otp_set_row(s->otp,
                                     BCM2835_OTP_PRIVATE_KEY + n, otp_row);
             }
             break;
+        }
         default:
             qemu_log_mask(LOG_UNIMP,
                           "bcm2835_property: unhandled tag 0x%08x\n", tag);
-- 
2.34.1

