Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp487577lff;
        Thu, 17 Jun 2021 05:24:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLJzjv2FJNb4ZzPtURokPMHTqEb/YtILRJ48IOOMx2K7EOw3CADF+7y7Zqv8ecoqugvlxk
X-Received: by 2002:a1c:3dc2:: with SMTP id k185mr4753823wma.15.1623932667884;
        Thu, 17 Jun 2021 05:24:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623932667; cv=none;
        d=google.com; s=arc-20160816;
        b=dfdwam8KYbVthgkravwOH1dXQ9ZkqeAOhcKx9wrkjs89C9uSKT8RXPGU7Kfc4Ib8py
         ZBT4T8PgftHmecXCZqhX39eDFlc/02tpFpRe+UCwMRjvj8ZABKgnvRuHS6FxQy8IOFHF
         hosKQHCnNU0nPS+ZQZOfdKEa/i6H8yDW4/q6qrY+u8BrWBLi0Kxbh4f3TKgffbUAyUGY
         a4R9H9MbRQxBsrHAh9HPmz1UdYyG0BSi/Kcs4OsIwZkm4E4/T/H99n3YqpX+Ikc8SgpR
         u5+Q1o6SlXe1npwe9oJIeauYCqbq4FBJG6kfy+5jmtRx6dDD/Vvm9j6MJ6IuMn+FDNKy
         OnEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MsKcYIWTozxme+e9eFcnhE6g0TcAu7b2IiyOTlBvd0U=;
        b=nyIerBYUntaAqB3eRiTCCUH41krDjvL+kRWjpNOtBUic4wwmu/pO9tTrjXypJVafDG
         J8U0Opg9b5pfmSXlVahNikxbM2/g5DNK2tRMO3Jfz3tsJjDUm+9+jssfxOE+fQSNOBmL
         rl7GkdqgFSpVTLckqWPzg664L43pt8Fxh5zwNsrTsuCCxVSn1cwmmDNZt7pW5k/6eVJg
         7KiOwjUxwOV7GHr8AYala1giY9zFKQovODHPTUWxWCln/H3VLcG+lTU9FWYeVyUYWaVo
         r9yymJJJmC9MwJOn3bahpO7j2V26k2kGyQGXhKtROgBhtpQUSTQpRkuZDWhFyK44/zra
         tMWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XB5Z5AeW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a13si4898835wru.472.2021.06.17.05.24.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jun 2021 05:24:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XB5Z5AeW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltr4M-0007Y1-VN
	for alex.bennee@linaro.org; Thu, 17 Jun 2021 08:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwr-0001Aa-H3
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:16:41 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:45655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwm-0006w2-3l
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:16:41 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 c18-20020a05600c0ad2b02901cee262e45fso3560755wmr.4
 for <qemu-arm@nongnu.org>; Thu, 17 Jun 2021 05:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MsKcYIWTozxme+e9eFcnhE6g0TcAu7b2IiyOTlBvd0U=;
 b=XB5Z5AeW9jC/NGOVEfA9YH3QzrutqceMFDlfluv3CRugBMaTuZGDFlcVKVdZdJWsgE
 cPEE2dcZw7d1EMJE/q5+E5LjG2a32iKXwnG5M0YRduTvwkmnuso3rN6cMISBQ07UrHe2
 d4M0l38cPrHTfvVA9SdGksYxhdIrhIITCPh/EYk+uPqETJk7jYIFPfb1iJecuQnTIy/r
 1dLOa/RR3GI9CyQ5Hk+cpq5Xe8ZixbYqZWUEaNYSIIYNMtyE7msSYu9UZ218Vk292yHd
 pDW2HabrqHMhgi8U3PjmUSuGh2kdmAgnayABJIxevui5f/WXUmJRogx3fREauyOjjtgG
 aFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MsKcYIWTozxme+e9eFcnhE6g0TcAu7b2IiyOTlBvd0U=;
 b=TxCDZWl/snL65Uq6vDXo8yY7FNBo54sMLej2YgiEu0F0GkjmFtg+0ZTGWLcRslyQK7
 075kGQLqbAOSyJBgx3Cs3799xGhXxcWm7fILYYbXGWskqswuCcjd72mVZgCM32GFcbyH
 oxUp+x1zze9hzswDM5B/tO4h20wTsFeV+eVEy/sxXPFJ9xyJ5++9A3i0ZHeZPoTi7TzO
 ZJJORN7xkh/cZ8RfVagWAIRhA4VratIz767c2NxPBlKvfce5+NJBy4kjC5p3+yYFz5Od
 Js3M8R9mpDVROZKnG15PrInaYhmMijP5sYRHCej8yrRErFauGnL0ZiaCuAiva7pfQ9cl
 JxHQ==
X-Gm-Message-State: AOAM53210NKToYLoEhmKPfTzp+EuGRdHtobc3ew7VwApvGJF8FAqD9K6
 yZTLXbcfx1zX77y3FrVIiStYa/ADbf+SmQ==
X-Received: by 2002:a05:600c:2141:: with SMTP id
 v1mr4827065wml.68.1623932194584; 
 Thu, 17 Jun 2021 05:16:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 05/44] target/arm: Implement MVE VREV16, VREV32, VREV64
Date: Thu, 17 Jun 2021 13:15:49 +0100
Message-Id: <20210617121628.20116-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8TrWs2eAY5oI

Implement the MVE instructions VREV16, VREV32 and VREV64.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  7 +++++++
 target/arm/mve.decode      |  4 ++++
 target/arm/mve_helper.c    |  7 +++++++
 target/arm/translate-mve.c | 33 +++++++++++++++++++++++++++++++++
 4 files changed, 51 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index bdd6675ea14..4c89387587d 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -40,3 +40,10 @@ DEF_HELPER_FLAGS_3(mve_vclsw, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vclzb, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vclzh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vclzw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vrev16b, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vrev32b, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vrev32h, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vrev64b, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vrev64h, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vrev64w, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index adceef91597..16ee511a5cb 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -70,3 +70,7 @@ VLDR_VSTR        1110110 1 a:1 . w:1 . .... ... 111110 .......   @vldr_vstr \
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
 VCLZ             1111 1111 1 . 11 .. 00 ... 0 0100 11 . 0 ... 0 @1op
+
+VREV16           1111 1111 1 . 11 .. 00 ... 0 0001 01 . 0 ... 0 @1op
+VREV32           1111 1111 1 . 11 .. 00 ... 0 0000 11 . 0 ... 0 @1op
+VREV64           1111 1111 1 . 11 .. 00 ... 0 0000 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index e90f5fb5d67..e0bb4755748 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -285,3 +285,10 @@ DO_1OP(vclsw, 4, int32_t, clrsb32)
 DO_1OP(vclzb, 1, uint8_t, DO_CLZ_B)
 DO_1OP(vclzh, 2, uint16_t, DO_CLZ_H)
 DO_1OP(vclzw, 4, uint32_t, clz32)
+
+DO_1OP(vrev16b, 2, uint16_t, bswap16)
+DO_1OP(vrev32b, 4, uint32_t, bswap32)
+DO_1OP(vrev32h, 4, uint32_t, hswap32)
+DO_1OP(vrev64b, 8, uint64_t, bswap64)
+DO_1OP(vrev64h, 8, uint64_t, hswap64)
+DO_1OP(vrev64w, 8, uint64_t, wswap64)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 4e5d032242b..32a8324c5e6 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -199,3 +199,36 @@ static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
 
 DO_1OP(VCLZ, vclz)
 DO_1OP(VCLS, vcls)
+
+static bool trans_VREV16(DisasContext *s, arg_1op *a)
+{
+    static MVEGenOneOpFn * const fns[] = {
+        gen_helper_mve_vrev16b,
+        NULL,
+        NULL,
+        NULL,
+    };
+    return do_1op(s, a, fns[a->size]);
+}
+
+static bool trans_VREV32(DisasContext *s, arg_1op *a)
+{
+    static MVEGenOneOpFn * const fns[] = {
+        gen_helper_mve_vrev32b,
+        gen_helper_mve_vrev32h,
+        NULL,
+        NULL,
+    };
+    return do_1op(s, a, fns[a->size]);
+}
+
+static bool trans_VREV64(DisasContext *s, arg_1op *a)
+{
+    static MVEGenOneOpFn * const fns[] = {
+        gen_helper_mve_vrev64b,
+        gen_helper_mve_vrev64h,
+        gen_helper_mve_vrev64w,
+        NULL,
+    };
+    return do_1op(s, a, fns[a->size]);
+}
-- 
2.20.1

