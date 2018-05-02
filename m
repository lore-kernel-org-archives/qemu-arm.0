Received: by 10.28.4.212 with SMTP id 203csp1225893wme;
        Wed, 2 May 2018 15:24:45 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqfACprA+GqqEsxmo1oPUQHDVMVE/3k3rRwoGCt21LXxN2JYqpK1gsqRaIHaMgiI9Ii+6mO
X-Received: by 2002:aed:226d:: with SMTP id o42-v6mr18431736qtc.258.1525299885136;
        Wed, 02 May 2018 15:24:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525299885; cv=none;
        d=google.com; s=arc-20160816;
        b=C6Di7N5FAlzZPAlIMhpHWM7fo3x47IKO6srp4XZSNnDGS8GaCB/rsGrlOUQNn3ObjY
         HchiRkPaiFhvK8IIx+XL19cO8z54ef5Zq21rYBT71eQ8PFOMxOEJWefLj5XYkzk2tzjE
         2+D1csyKNF5rFp0ZutE6m7yso4UygQJIb2OM1mO/Gbjf2NYbvXb0cAdOTfplbjnKqJKe
         iTIszfk1qR3BJSNSCBV67M8/bP9fh5EC7NLstnEhxUjRedl+5six/U//G7ZAdIZ/0j3W
         gqqaX7IJJPGqGz8nW1RiA+MmqT2RPjanSLrUTca0uRp98xNu5bWQoZOlS9zplab8wr3o
         HBqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=aO/IxXadKJBMZQYzwQFN+bW33atvEbEmYfm1LunIZS0=;
        b=wZ0w7knK8fI3XFoOK0M+5IPmC5ED2jyyURH8XtEeAlRZ6m1Z2Gd2qBOjEayChrmD27
         O1U3TkIQ+GK2049Jbw3z6nduVYm4CJZCfPLjipE+cNr7epmPRRwlB85GRAGZiCSSaWXW
         8QpxjuVmVah+TQDJafWIP9KCWEFQrmiJYn1ZhWpLHfW8Io3N82s8SJTSE4rfHnoh7M4a
         ieaq0XtNAcRmP3hcO8QHLKboJZ7bEmSI3YW9H7u4kkcxNCn/hIdEj9tDJmi8VZJdmvpg
         gPVfQqmNsFPYtubjoBqViXn8HLxyWEJR6zKGEls6m1uIlDDPI859C9etR2uVqa1N3PPK
         5f5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kDI9+kYI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a7-v6si10034222qvm.21.2018.05.02.15.24.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 May 2018 15:24:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kDI9+kYI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52841 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fE0B2-0007kY-KQ
	for alex.bennee@linaro.org; Wed, 02 May 2018 18:24:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58771)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fE02f-0000h7-HR
	for qemu-arm@nongnu.org; Wed, 02 May 2018 18:16:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fE02e-0007ut-Pk
	for qemu-arm@nongnu.org; Wed, 02 May 2018 18:16:05 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:40469)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fE02e-0007ub-K6
	for qemu-arm@nongnu.org; Wed, 02 May 2018 18:16:04 -0400
Received: by mail-pf0-x244.google.com with SMTP id f189so12958075pfa.7
	for <qemu-arm@nongnu.org>; Wed, 02 May 2018 15:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=aO/IxXadKJBMZQYzwQFN+bW33atvEbEmYfm1LunIZS0=;
	b=kDI9+kYIiW2Ns1Xtcm6k9UlDtX6pF6xMISajHn9ml7wV7mTE9PzDmEh9hHJFwHKSsa
	gUDCFwaEJBC7OcXV42oC4B1UaEyWTpATQatmnFUPhFXY4kt2IUbvJn/HsN6yMyEVEqJ+
	9rrjgfm4MRbmo8yDXedNKjx5ONITOuVZUUvSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=aO/IxXadKJBMZQYzwQFN+bW33atvEbEmYfm1LunIZS0=;
	b=IrmWjnjvZCaILArY62/d9mSSOfyuuAsr5baCpW+2UcHO+4/GsfeC00Bt0kqtO/krsC
	Biuy0dmtRq4q4ecTTJNpzj8nlg5FSgAftgOGHD8TGOy4UcXjdTFcCxct5fyQ5vm6JaW0
	J+ovzw1q27DJp61pMeq8uHvgAX/OoA+ySP+kly1k/wff4Fgua0MtIwJKECvTpTH+0oMR
	7dSdD+dFy7Y1HcDRCfYvY+QV4ldtU5RcXCiaiBfagfCOsHPGJJ9EcxfBd+0oG/ZrecQ8
	JcqXer2fdR6TLEZLEqeKvW96SJixeu3d0exAg/5IuAkstMX7nw3zUqJ2fKR1ccQdKTRI
	jCgA==
X-Gm-Message-State: ALQs6tCeBc5cIHU4qy23TO9qyY9wniM631ZpQQo8hHZtOBkQwUunNEUZ
	ROjW/Ing38X/T34Gfd53Sqtr0w==
X-Received: by 10.98.35.11 with SMTP id j11mr20798987pfj.177.1525299363768;
	Wed, 02 May 2018 15:16:03 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	65sm26170145pft.74.2018.05.02.15.16.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 02 May 2018 15:16:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  2 May 2018 15:15:45 -0700
Message-Id: <20180502221552.3873-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180502221552.3873-1-richard.henderson@linaro.org>
References: <20180502221552.3873-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-arm] [PATCH v2 07/14] target/arm: Implement FCVT (scalar,
 fixed-point) for fp16
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wIY6TJt6JQPk

Cc: qemu-stable@nongnu.org
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d794744aec..e19d97e8f1 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5460,8 +5460,7 @@ static void disas_fp_fixed_conv(DisasContext *s, uint32_t insn)
     bool sf = extract32(insn, 31, 1);
     bool itof;
 
-    if (sbit || (type > 1)
-        || (!sf && scale < 32)) {
+    if (sbit || (!sf && scale < 32)) {
         unallocated_encoding(s);
         return;
     }
@@ -5480,6 +5479,20 @@ static void disas_fp_fixed_conv(DisasContext *s, uint32_t insn)
         return;
     }
 
+    switch (type) {
+    case 0: /* float32 */
+    case 1: /* float64 */
+        break;
+    case 3: /* float16 */
+        if (arm_dc_feature(s, ARM_FEATURE_V8_FP16)) {
+            break;
+        }
+        /* fallthru */
+    default:
+        unallocated_encoding(s);
+        return;
+    }
+
     if (!fp_access_check(s)) {
         return;
     }
-- 
2.14.3

