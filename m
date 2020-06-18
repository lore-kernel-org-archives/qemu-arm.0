Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1279332lfm;
        Wed, 17 Jun 2020 22:01:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRoHuoGVyFVTvEgDr7atWvhmrX62s56H6UC8ZD/a6MHFpSuAJ5c2yKmdf9Rhb6zIKte5Ek
X-Received: by 2002:a25:544:: with SMTP id 65mr3682780ybf.309.1592456486668;
        Wed, 17 Jun 2020 22:01:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592456486; cv=none;
        d=google.com; s=arc-20160816;
        b=vqB8i456mY+zL2JjhzvptPYqCdzQTGyD8nlMNJnvEmW+16LEneeaF0/KptFZ+jRjmU
         Tr0OLAUWiNuovc+ShmqltCEyadt/5ECQBHu21ttglghGQQiwFf/aGMUu7Q9f3LfAc9LQ
         W7nqRC22iwtkH2UaPP7knhiLZmFpoSdL2zQKQDs3uQhdfPge36AwlPDIvg2PW6HdPFCK
         7l8Zg7VbPChWkbjT0ULp7OU3gDDr+paDrjZDIXax4L3dpD2JcoGBVYrlSbVPGTRatcUr
         p68K/6MndvM8JR9pzoSmoHEDkXpocWEjxYnR8+GCCb51t9OG7YboAEH7icCz2Mfcqlqu
         X/vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3xtlpb1WwGZiRpO7W3OfThl71V0T/0uQ3DRTvjquBPA=;
        b=qo6D10MNrYqwz1pi39FK2Ku4/xCfX5yCIymeCIpDYIRqcLDjle9WRgs9hDv/rjdmTb
         Cf2KrIpBd+Fk7tgRnRXUo9ctLgxK4thmb/L8B1y0RiL+f1mfUO/fpAJz8oDZ4yWLyhGz
         Mc2bRtl+j8fSz5HIsa4VzM7D2pZGOZZ6GPHYtbO/vDGqy4yFBRfeHks4ElPbFvENRmIc
         Ab2fSB2aAAeSvCaF6lNBfVAF4/ZR9FJpZpa/F7qtxB0nZ9NuRwxyYmQw0DrVxpR0+4vq
         HPYxdXGkua8cz/xyDFA70JNs5ba4er6f1ENEpUzbhb9WaB5+hiN24AAAygvaUaVpFCg3
         kvEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PEK3WGfk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q66si1635609ybg.144.2020.06.17.22.01.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 22:01:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PEK3WGfk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmg1-0006Ka-Sh
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 01:01:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmCu-0003Mi-Ua
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:31:20 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:38761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmCo-0003JC-EY
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:31:20 -0400
Received: by mail-pl1-x630.google.com with SMTP id d10so15117pls.5
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3xtlpb1WwGZiRpO7W3OfThl71V0T/0uQ3DRTvjquBPA=;
 b=PEK3WGfkzkbk/S+s2T8emApTb2CoyDrPCwYi3Ylt0pGzX0EdkJ3nUeZaM4/d/SbMIt
 j2FpPOZ3vT3cEXWiIQgtz3UFuYNzUy3WywfYMRiKBkFBr1pYFOUgjolAdMQFD8kpEFVA
 yzhcnw/YK1dAjRy5YQY1g2PUJ97w8tC4eQK89alD4kFdLSYqrmk++EXwuylFyWDVdCzc
 J1djcRHGYlK5hUJ+9/fjZekoHXEo3UzEANWwCJBdcEYl+dmSqXJ5a3vNQBnKaCq0to5l
 79mvnNrArisa6+0ZOQ/ZuaGXPPghRRbrIH49UZ3vdDjPI81cYS1/Sev+hS5v+KuEIYKr
 TztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3xtlpb1WwGZiRpO7W3OfThl71V0T/0uQ3DRTvjquBPA=;
 b=ZVJWS/3P2JaLzzHfYmDwnrZO8KoiXkHqAAC4Vw+QrtD6r36HDs6WTEJz4/mPBxx+0Z
 Qc4z4vlxcX5AohmiSNnaHPRR8s2t6aPmVo/QL5JYjSqPCFsrJlSrHGZD8OSc6tnhQ/xp
 Op1zNuMc357KT6OQBgS2FWr4GNzyOGVXL1udHPH2aubzBl6Il21+dYJZ53J7QbOLog5/
 KyxaDcBdOeGk0oDaIOuTDm/0IiuzPqQmC0lqliTUm6HuEqj21JMhakeEppBy6PfjRadj
 TlvKOCtFoCjisbmSyEqyWXxAIsT/WN7OVakeOP70tqOMLpJx/a8I682CE7KZ9+frgOeX
 aMzQ==
X-Gm-Message-State: AOAM530iOSLmQXnpzK+T2F5WjMbhtCQaRABvjbDGvNhwbQn1dJYluOcG
 u3FHb2KSJ5poWukSs+sBLpQmqg==
X-Received: by 2002:a17:902:aa42:: with SMTP id
 c2mr2246393plr.216.1592454673120; 
 Wed, 17 Jun 2020 21:31:13 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id o1sm974337pjf.17.2020.06.17.21.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:31:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 061/100] target/arm: Implement SVE2 gather load insns
Date: Wed, 17 Jun 2020 21:26:05 -0700
Message-Id: <20200618042644.1685561-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /kYOByoQLJiH

From: Stephen Long <steplong@quicinc.com>

Add decoding logic for SVE2 64-bit/32-bit gather non-temporal
load insns.

64-bit
* LDNT1SB
* LDNT1B (vector plus scalar)
* LDNT1SH
* LDNT1H (vector plus scalar)
* LDNT1SW
* LDNT1W (vector plus scalar)
* LDNT1D (vector plus scalar)

32-bit
* LDNT1SB
* LDNT1B (vector plus scalar)
* LDNT1SH
* LDNT1H (vector plus scalar)
* LDNT1W (vector plus scalar)

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200422152343.12493-1-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 11 +++++++++++
 target/arm/translate-sve.c |  8 ++++++++
 2 files changed, 19 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index dc784dcabe..1b5bd2d193 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1389,6 +1389,17 @@ UMLSLT_zzzw     01000100 .. 0 ..... 010 111 ..... .....  @rda_rn_rm
 CMLA_zzzz       01000100 esz:2 0 rm:5 0010 rot:2 rn:5 rd:5  ra=%reg_movprfx
 SQRDCMLAH_zzzz  01000100 esz:2 0 rm:5 0011 rot:2 rn:5 rd:5  ra=%reg_movprfx
 
+### SVE2 Memory Gather Load Group
+
+# SVE2 64-bit gather non-temporal load
+#   (scalar plus unpacked 32-bit unscaled offsets)
+LDNT1_zprz      1100010 msz:2 00 rm:5 1 u:1 0 pg:3 rn:5 rd:5 \
+                &rprr_gather_load xs=0 esz=3 scale=0 ff=0
+
+# SVE2 32-bit gather non-temporal load (scalar plus 32-bit unscaled offsets)
+LDNT1_zprz      1000010 msz:2 00 rm:5 10 u:1 pg:3 rn:5 rd:5 \
+                &rprr_gather_load xs=0 esz=2 scale=0 ff=0
+
 ### SVE2 Memory Store Group
 
 # SVE2 64-bit scatter non-temporal store (vector plus scalar)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 7fa1e0d354..77003ee43e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5622,6 +5622,14 @@ static bool trans_LD1_zpiz(DisasContext *s, arg_LD1_zpiz *a)
     return true;
 }
 
+static bool trans_LDNT1_zprz(DisasContext *s, arg_LD1_zprz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return trans_LDNT1_zprz(s, a);
+}
+
 /* Indexed by [be][xs][msz].  */
 static gen_helper_gvec_mem_scatter * const scatter_store_fn32[2][2][3] = {
     /* Little-endian */
-- 
2.25.1

