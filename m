Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2050318njc;
        Mon, 22 Jul 2024 10:31:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX8yAkkXexr91fkLQU/sSZ0IlVvRosa5ZjBaP+sQg+O6wa9kC5184IAFjgjlHDwqOHRGDa/ZBQVjJ7rRnl1SIB8maHmFoEx
X-Google-Smtp-Source: AGHT+IGdH7g9E6gtpA3d3mbNPTv/eryUHhJ7G2tYbQ2RkiWxVHPitmPuONaF5YRt0F3aKJEFoqBw
X-Received: by 2002:a05:6102:3e2a:b0:492:773e:a337 with SMTP id ada2fe7eead31-493b077919fmr859516137.20.1721669468698;
        Mon, 22 Jul 2024 10:31:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721669468; cv=none;
        d=google.com; s=arc-20160816;
        b=u3krUrZeuVfGbwDROZvKBmP7m/u73A4hewYm4fHp1cAqpo0fTFGyMWXJf3f7CO1r1e
         s1xdGGJ44a2yhIiwTtuPw6/HfjsXbb4+9SQIj1qMyalg4YTYBP1wlRWJZskzDL8P6wPk
         Ohi1vg/QU+No3vY8ST5a638U5AYW0Te1GEwB4Bxz+CUg9FtC9x0n60CO2yjXX2KjGuIp
         OlLAwHrJ2xzCHakWSgXajTbGFM+fsC+/jQLwtKlAIDm/T1oxasqxFs3G+1ET8v131b6d
         Et84Cl0bFCRU5v7UhYDgtptjJJ5S4CgXEZjHW+RLgC7LRp19rLAdT90yExaENU5o2c00
         RZtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=q1fk3MZNeiAsw57LUWbslOnLlaVnbzI66YELvNijArk=;
        fh=spbD1uAOw2hCQBb83uSlqZAKTOl6wvNX+k1rxl9UBCg=;
        b=Mf+etD5M78zhoEh8JmrhzI0G5QkA9Sj0q03qxUm83bNGZ8xi8grWMN7UMgBJDDi9yK
         YiimYkTd+lUlGtyX2ooeVLh3U0x6kmADYfjNPR1J5r3PFHbiZZIg2ve9EskhRS5/ziXJ
         1Vi1spredar2oSjaemY6jklDSG4TC+TpcE75+GlnDPVj0VLhcqKnW7mPlIbujlZ2yTfD
         EMZ+NqQSRIQuKMI5D8MDY/rIhLw0NxXWFPJAVYmqf2bwBENiR+oTsfyQqd2b24aEb5K1
         LziaGwlwqiynn6zjuPE9DPT94w1xRNg0YtVqE/Pq5DbbKdJymyw/9vHJOP8i2MgqjBAC
         mNQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="OUtE/lfy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-492af1d146bsi295331137.807.2024.07.22.10.31.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 10:31:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="OUtE/lfy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sVwrb-0000PW-9L; Mon, 22 Jul 2024 13:30:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sVwrY-0000BA-0R
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 13:30:16 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sVwrP-0006Nm-S3
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 13:30:15 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4267300145eso39562535e9.3
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2024 10:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721669400; x=1722274200; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q1fk3MZNeiAsw57LUWbslOnLlaVnbzI66YELvNijArk=;
 b=OUtE/lfyXE3J3ycU7iFQhZaPhFFW8BOvFUJgG4UMgljFJV8ZxW8NT60R2itPFMn9on
 YPxJeEiIL85/5OwiwxqIWeCY7J8AM2opk7jc6TP8D+o3hX0V2t6OY2zPJTaRcHJfe9/c
 gDmUveaZRehgQWKIxF/SGDaX1jiYOturEuoY9EGrgJ0vXR1C6UDB2xm8P2ygVfZqsQit
 oQusGH8NyGJY0fTN+akVqLOCGvciRKcYBbjyfwX4DoZzUtHDHYCGKKxKpggxDAGBnP1P
 N/DU6Q3IHBVdMigIpc+EyETV6I6t3eS8urhr+egK5Z5K8gqehfeviYOeohF3AAO+cgNO
 Bddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721669400; x=1722274200;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q1fk3MZNeiAsw57LUWbslOnLlaVnbzI66YELvNijArk=;
 b=Ictcb/028pqRdGnWZWekOjvBAGylbKhxNKJXKg+1dn3V2KFpw5WSPly41qoTSuGkcL
 CuXWCz2iCQ5BDaKFYCxX/sTzoY+K0lRt1vaOA5b0pYcyhrAsbVcoFI2fpLRd5tMBcJI6
 wRv8RlT3yA0HDm6U2FR5+TgdsdeFS/68yjTvZzmaIF+Q+f3Pq/UMX2kKwZHiBiJe2UTs
 Zs46bBPwegaf1iAU/fJeMDzVNiN7CoxJl0hSsBYl2fzmrxl/alUOy8MeorkGQsj0rEY6
 fARgZxwp0h8gVeXdiQB10KWFDFkKiclv6TEluLNgrMrOpCotRJ73fZunjGuRwJbGytxr
 +1Gw==
X-Gm-Message-State: AOJu0YzwGT9g8HK8IuVddYqmHc6p+IGXS3O51tPI5C7Tjq3xd9i0Mlw9
 e/zT2qg8p12iEftWcG8N0KADEVwGtxvlQCazmJpkuWpMoLOrscnSBqSaAUHray1KmlHi3WP0dM9
 W
X-Received: by 2002:a05:600c:4452:b0:426:63f1:9a1b with SMTP id
 5b1f17b1804b1-427dc56b427mr49402815e9.33.1721669400337; 
 Mon, 22 Jul 2024 10:30:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d68fa493sm138035665e9.10.2024.07.22.10.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 10:30:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH 2/4] target/arm: Fix UMOPA/UMOPS of 16-bit values
Date: Mon, 22 Jul 2024 18:29:55 +0100
Message-Id: <20240722172957.1041231-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240722172957.1041231-1-peter.maydell@linaro.org>
References: <20240722172957.1041231-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 THIS_AD=0.899 autolearn=no autolearn_force=no
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
X-TUID: 8DEjE3GWVfVR

The UMOPA/UMOPS instructions are supposed to multiply unsigned 8 or
16 bit elements and accumulate the products into a 64-bit element.
In the Arm ARM pseudocode, this is done with the usual
infinite-precision signed arithmetic.  However our implementation
doesn't quite get it right, because in the DEF_IMOP_64() macro we do:
  sum += (NTYPE)(n >> 0) * (MTYPE)(m >> 0);

where NTYPE and MTYPE are uint16_t or int16_t.  In the uint16_t case,
the C usual arithmetic conversions mean the values are converted to
"int" type and the multiply is done as a 32-bit multiply.  This means
that if the inputs are, for example, 0xffff and 0xffff then the
result is 0xFFFE0001 as an int, which is then promoted to uint64_t
for the accumulation into sum; this promotion incorrectly sign
extends the multiply.

Avoid the incorrect sign extension by casting to int64_t before
the multiply, so we do the multiply as 64-bit signed arithmetic,
which is a type large enough that the multiply can never
overflow into the sign bit.

(The equivalent 8-bit operations in DEF_IMOP_32() are fine, because
the 8-bit multiplies can never overflow into the sign bit of a
32-bit integer.)

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2372
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/sme_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 5a6dd76489f..f9001f5213a 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1146,10 +1146,10 @@ static uint64_t NAME(uint64_t n, uint64_t m, uint64_t a, uint8_t p, bool neg) \
     uint64_t sum = 0;                                                       \
     /* Apply P to N as a mask, making the inactive elements 0. */           \
     n &= expand_pred_h(p);                                                  \
-    sum += (NTYPE)(n >> 0) * (MTYPE)(m >> 0);                               \
-    sum += (NTYPE)(n >> 16) * (MTYPE)(m >> 16);                             \
-    sum += (NTYPE)(n >> 32) * (MTYPE)(m >> 32);                             \
-    sum += (NTYPE)(n >> 48) * (MTYPE)(m >> 48);                             \
+    sum += (int64_t)(NTYPE)(n >> 0) * (MTYPE)(m >> 0);                      \
+    sum += (int64_t)(NTYPE)(n >> 16) * (MTYPE)(m >> 16);                    \
+    sum += (int64_t)(NTYPE)(n >> 32) * (MTYPE)(m >> 32);                    \
+    sum += (int64_t)(NTYPE)(n >> 48) * (MTYPE)(m >> 48);                    \
     return neg ? a - sum : a + sum;                                         \
 }
 
-- 
2.34.1

