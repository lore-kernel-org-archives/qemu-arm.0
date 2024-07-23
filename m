Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2498467njc;
        Tue, 23 Jul 2024 06:11:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVq/sSRHL0TgtPTE7PeCo+fOWI1ZB9Kgs+ZK8+yRwR46o4j+aCYnW2j/zw/7E/wLh7ThefQt0P/S+hZzenCwplRiljUZ/s+
X-Google-Smtp-Source: AGHT+IG6fuIpbJOGEgqMo/uH36LdAqepWSWwMsYL6h0y13RIn5VV37BLYhBQJid0xKKJMrbSbbXI
X-Received: by 2002:a05:6122:4107:b0:4f6:a82f:45cc with SMTP id 71dfb90a1353d-4f6a82f5438mr2519778e0c.9.1721740289809;
        Tue, 23 Jul 2024 06:11:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721740289; cv=none;
        d=google.com; s=arc-20160816;
        b=ZSiQF6Dk0Yh+I37NyGnL4c7rovK5OW9YQuEE4kQ0HfOpCdv0szU4trb7Hn+57AF9YU
         smqOsf1rfQOa02FeG+Hj3vKEdcpdzy7i6b9rauroHJ1NfaIeuYRHLuHG2M1pFU8HFlpi
         Hx9JjqteaFiryBkvV+/agAurWUgNCDsJjU1r3dqoDqzYXGg5dLK4oNZ3cARTDDyYWUF7
         clHo8cnQLtl6Ih3QiYMQo9D04jNQZpMGJUxgb5gqA/EK8nC6twkV3/V2Cq6ofv9SE++j
         6TyokNPkuCJGHUzE4OLz3Jey2fRsf5PUfEj/E4nGAWBA7qyuwkCO4VN+AXM1eQszmxTM
         PN/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GDjhGJy1uudDNK18CuZuB7KjPJkSAemQ7/iwEkdj0Zo=;
        fh=N+JkB5fS9dtBw9Yowu6dwKMonyvLu2+1NgiKdmPgCY0=;
        b=jy8fx7LVwoqgGJxjPG3KQlyjRH7zwYkKOXlYXwlGwN494sbmG1xgAw+oxao5I1INI1
         PLz2py4IWaN9KPEm+IlBRFCPQwc5plutx23Px+/PqlEAEFHgBBu4R2Kbjdt0+dsea2do
         5vc0O9cYvMdgo85hMW7EwzU0+swqs/vsULS4YmGtVHKxZWoP+grMWps1CoJ/RYrcGfz0
         4mmO2An/FXhPjy76uE/f7BJhZTRQkarxsoqPT1VSLL9uUnD14hg9lfscfBwqBXnA5p1h
         Ft0Z6LBGLEKrH+Xaubf2e81OmMhCjWU9LopxdFDmwzQz+vJzDnvt2apT64XzfpxzWZoq
         ZPjg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RrdPzu6+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-4f6a89e3674si168725e0c.137.2024.07.23.06.11.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jul 2024 06:11:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RrdPzu6+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sWFHt-00068h-As; Tue, 23 Jul 2024 09:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sWFHr-00061i-Py
 for qemu-arm@nongnu.org; Tue, 23 Jul 2024 09:10:39 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sWFHn-0000IT-8w
 for qemu-arm@nongnu.org; Tue, 23 Jul 2024 09:10:39 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-427db004e36so26161565e9.3
 for <qemu-arm@nongnu.org>; Tue, 23 Jul 2024 06:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721740233; x=1722345033; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GDjhGJy1uudDNK18CuZuB7KjPJkSAemQ7/iwEkdj0Zo=;
 b=RrdPzu6+30zuIbQp484MFe5pJaqtTFWPHwaXfTnw1C+2Hn20rGby5L2eqDOtMF7O8G
 HRvWeyC2FMlRuH/g7dlcVdTNO2oHn25oilBXnnwAekgvm9gN9Tsoe5kVOK/SRoOJkQFq
 kuJ0MGlBSDKxuYfndb6slv2Mmv1itYPa5d8FJbOS66HUCr3cQcbsiZ7pcpYE1dBvngGZ
 CBE3DQ77DuLnsPnZeVNu2hY7yL75pIf7TVKWLqnr8o0rbdO9bNaESTe2tc5KQsow9Q3x
 ay9Ws4vGDQ0qioVod2CYj0YoqXFzXX3GYRWqHT4KN6Folw1oX8VsWCVCAxW0uPMF/fil
 P0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721740233; x=1722345033;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GDjhGJy1uudDNK18CuZuB7KjPJkSAemQ7/iwEkdj0Zo=;
 b=Kib2XtuD50ImFp2otL5A2xEJmWK+4B+FnQ2N0uVtH4I2dN4AJjmgW8R1MOXDPitnty
 UhxDYPqEiICvFH0N03gKuyXHJjffLhu2buvw/696L0QKiPxu+DIxi8rroHCLExHVWXM7
 oHAxVxWKZbMxM3JiEoOD7/JM9PvAraVWjYzWWOkFehRth4LCwMRMvNy2z6o5fCrAr50r
 f/x9uxLVv9WKjrQtzEKNclN+uMkeSm8uqBZboSJIn+s52ucCh+On1idE0t9uJYoy0ub8
 5XNR38kVn1ITzX+7vgRq7HH3e6+pH589NIiK1TPqjWm/4TnwDTAAN8kLHpMP3oKdnN//
 Ml/g==
X-Gm-Message-State: AOJu0YyneXhCUcaczHtbkj24ScGZ+StSQTUzESx5Wa+HupMazzifQRZ8
 eO9m0xqbS+xCMcpOGYKe0r75hbHeQ147YgpG8tIPDAp9RjwzF8zDnUckHknMKZzNf+q5wbhz08A
 S
X-Received: by 2002:a05:6000:44:b0:369:b849:61b0 with SMTP id
 ffacd0b85a97d-369bbc69874mr6079499f8f.43.1721740232571; 
 Tue, 23 Jul 2024 06:10:32 -0700 (PDT)
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
Subject: [PATCH 2/4] hw/misc/bcm2835_property: Avoid overflow in OTP access
 properties
Date: Tue, 23 Jul 2024 14:10:27 +0100
Message-Id: <20240723131029.1159908-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723131029.1159908-1-peter.maydell@linaro.org>
References: <20240723131029.1159908-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: eAEVLcAxBW5A

Coverity points out that in our handling of the property
RPI_FWREQ_SET_CUSTOMER_OTP we have a potential overflow.  This
happens because we read start_num and number from the guest as
unsigned 32 bit integers, but then the variable 'n' we use as a loop
counter as we iterate from start_num to start_num + number is only an
"int".  That means that if the guest passes us a very large start_num
we will interpret it as negative.  This will result in an assertion
failure inside bcm2835_otp_set_row(), which checks that we didn't
pass it an invalid row number.

A similar issue applies to all the properties for accessing OTP rows
where we are iterating through with a start and length read from the
guest.

Use uint32_t for the loop counter to avoid this problem. Because in
all cases 'n' is only used as a loop counter, we can do this as
part of the for(), restricting its scope to exactly where we need it.

Resolves: Coverity CID 1549401
Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/bcm2835_property.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index e28fdca9846..7eb623b4e90 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -30,7 +30,6 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
     uint32_t tot_len;
     size_t resplen;
     uint32_t tmp;
-    int n;
     uint32_t start_num, number, otp_row;
 
     /*
@@ -337,7 +336,7 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
 
             resplen = 8 + 4 * number;
 
-            for (n = start_num; n < start_num + number &&
+            for (uint32_t n = start_num; n < start_num + number &&
                  n < BCM2835_OTP_CUSTOMER_OTP_LEN; n++) {
                 otp_row = bcm2835_otp_get_row(s->otp,
                                               BCM2835_OTP_CUSTOMER_OTP + n);
@@ -366,7 +365,7 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
                 break;
             }
 
-            for (n = start_num; n < start_num + number &&
+            for (uint32_t n = start_num; n < start_num + number &&
                  n < BCM2835_OTP_CUSTOMER_OTP_LEN; n++) {
                 otp_row = ldl_le_phys(&s->dma_as,
                                       value + 20 + ((n - start_num) << 2));
@@ -383,7 +382,7 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
 
             resplen = 8 + 4 * number;
 
-            for (n = start_num; n < start_num + number &&
+            for (uint32_t n = start_num; n < start_num + number &&
                  n < BCM2835_OTP_PRIVATE_KEY_LEN; n++) {
                 otp_row = bcm2835_otp_get_row(s->otp,
                                               BCM2835_OTP_PRIVATE_KEY + n);
@@ -403,7 +402,7 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
                 break;
             }
 
-            for (n = start_num; n < start_num + number &&
+            for (uint32_t n = start_num; n < start_num + number &&
                  n < BCM2835_OTP_PRIVATE_KEY_LEN; n++) {
                 otp_row = ldl_le_phys(&s->dma_as,
                                       value + 20 + ((n - start_num) << 2));
-- 
2.34.1

