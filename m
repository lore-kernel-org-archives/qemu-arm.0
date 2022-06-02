Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5203210lfh;
        Thu, 2 Jun 2022 15:05:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIrkZPEoI0LF0aLScwAieFXBr+UP6KJ38339DvQ6l/K1dUALtqo9wQS3KBhCbpC1PG7QPa
X-Received: by 2002:a05:6214:629:b0:461:e291:6c4e with SMTP id a9-20020a056214062900b00461e2916c4emr5064224qvx.33.1654207500184;
        Thu, 02 Jun 2022 15:05:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654207500; cv=none;
        d=google.com; s=arc-20160816;
        b=Spj2d3Kxr0ydKh+XCwKTJ8H21Sb495/EZOc14EynO8UC8UQL1gqXrpIqgeTovzhUXM
         n9oUPvCaAsHkm9CYWGNHutMs0TIfY+tZEfaRiW5obWKBVOXKWRH5pEY9dplhUl8gAkCI
         4QQlKumw7DNXUXLmjVo60qH8GwA8QJ76fd/Q295eYFAY0x4kUKlT9p5AelpyiSjm9+4A
         OyrH/e8D1c5TFvVdBaMbEbwdyR62+2/JwlkLO/8tzgPyIGjkQXpaFWtbv2Aqa7w89gs0
         9iu284zdiMdBx9dlVFkS7UJvWMMaPoI/yvCc3p0XbqzHt9/4Ncd+/9n+s3LySIspNHL1
         WkJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=X6UniaTwDbuA5UKJMjAhDBE/HQvImNJGoq3x6BiPqWc=;
        b=0+4USnWB7lj5kgNQsa+dJa98+SrpchVjtvv1TYPFBV9oEsOuBjVVdi9Xsxjaei1PjQ
         rDPX69Oa62DShSFEWpFzd0o+d3Njj9jPV1iJViD/ZRDkJhX2v252IZMUj3TLkEZA3XfA
         CkmQEIUKZ8+rU0O3Hf/6Xi3WoRqipmHySo8wBqWGFyZilZYiNaJRFp9hHH6Y3bZhQaZu
         gf2PCi9cbxTFUBDcXkZIzzfCqehOIW6UmGjbAYCOudwkHtdqbDHNPztg23HiR9bqnn1m
         O8xR4H/Zk2VIHPeQXuNgDQEXC5ju29p1TERAOWtubBgyongA8m1cmRByBsknTvkOH/k3
         mVAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YtN47zOi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 20-20020ac85754000000b002f1d1cf12d2si1086421qtx.620.2022.06.02.15.05.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 15:05:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YtN47zOi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwsw7-0004FF-O4
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 18:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgv-0004oc-P3
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:49:17 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:34431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgu-00009k-0U
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:49:17 -0400
Received: by mail-pg1-x52a.google.com with SMTP id g184so5817477pgc.1
 for <qemu-arm@nongnu.org>; Thu, 02 Jun 2022 14:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X6UniaTwDbuA5UKJMjAhDBE/HQvImNJGoq3x6BiPqWc=;
 b=YtN47zOi6GR70z+u5XEwOInZdwUc+wonASgIGlrm8JbWLaUltBuSuqeC0uXCsNGSLO
 lDYGcFJ1AseqmYJKz5xZnI47fzK/t4O0C2k5fRs7G9eV2Yml+Ldmpsizz7lP0KjqOghQ
 5uC4oTm5o078blBIRBMyPM+TFumYQp1qirSHmH0yakAEzMaQMpQ6JhtkBLoYQR9rPvgS
 6Xa65U7JraT1XE1thgyD62gR6PUgaGgwMXT3n/GeX7MovkEgceKC36HVJUtJmWhHlrfe
 2MguEOC0BzWuAzxxp5U4/RiTrGyGfVdqvMbLy6wcFN41YT2qCNDVRBrtkrUHExGaK78k
 kSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X6UniaTwDbuA5UKJMjAhDBE/HQvImNJGoq3x6BiPqWc=;
 b=mXomfLfwDFor1Kf42rCyZ5285imjg9iHhmN38kBiWj81ijz4ux38Ur74vxN9iZls0v
 EOGKBxc3Fa3v+ocPuJfHzyjxdBLcMaAm93A76au7MEcMscgsyR6nOkzyCL/phGcia11J
 O52y/IfTMvS57sF02mHb2HgvpyXMnZ9EAAsoM5ODWc8lfNBDNK5G9XJyoFTg3MoIvv2O
 npcT6Ct82nOQ3uMxZjjRNTnJIHtEy2a57eLjsn+kwzTPdhe2mRFl75HIocCbRc4YLT1I
 PaICv/jS/8VS3pn/5QkHVGXvPnvtwzWaL8liz6KuDmTlnHYEF3cEDgv6Ygtai6Ea3BNm
 94zg==
X-Gm-Message-State: AOAM530kiI8LfQg9ccBLhZPF5LVb7bKFQcSMZKqT5iJwBZR/3EyRhJG+
 57DktiDgDbaxm8UTyz5afeC015wbyJgaIw==
X-Received: by 2002:a63:ce58:0:b0:3fc:6966:b614 with SMTP id
 r24-20020a63ce58000000b003fc6966b614mr6095175pgi.234.1654206554509; 
 Thu, 02 Jun 2022 14:49:14 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 23/71] target/arm: Add syn_smetrap
Date: Thu,  2 Jun 2022 14:48:05 -0700
Message-Id: <20220602214853.496211-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1FsnmLF9H/Et

This will be used for raising various traps for SME.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/syndrome.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 0cb26dde7d..4792df0f0f 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -48,6 +48,7 @@ enum arm_exception_class {
     EC_AA64_SMC               = 0x17,
     EC_SYSTEMREGISTERTRAP     = 0x18,
     EC_SVEACCESSTRAP          = 0x19,
+    EC_SMETRAP                = 0x1d,
     EC_INSNABORT              = 0x20,
     EC_INSNABORT_SAME_EL      = 0x21,
     EC_PCALIGNMENT            = 0x22,
@@ -68,6 +69,13 @@ enum arm_exception_class {
     EC_AA64_BKPT              = 0x3c,
 };
 
+typedef enum {
+    SME_ET_AccessTrap,
+    SME_ET_Streaming,
+    SME_ET_NotStreaming,
+    SME_ET_InactiveZA,
+} SMEExceptionType;
+
 #define ARM_EL_EC_SHIFT 26
 #define ARM_EL_IL_SHIFT 25
 #define ARM_EL_ISV_SHIFT 24
@@ -206,6 +214,11 @@ static inline uint32_t syn_sve_access_trap(void)
     return EC_SVEACCESSTRAP << ARM_EL_EC_SHIFT;
 }
 
+static inline uint32_t syn_smetrap(SMEExceptionType etype, bool is_16bit)
+{
+    return (EC_SMETRAP << ARM_EL_EC_SHIFT) | (!is_16bit * ARM_EL_IL) | etype;
+}
+
 static inline uint32_t syn_pactrap(void)
 {
     return EC_PACTRAP << ARM_EL_EC_SHIFT;
-- 
2.34.1

