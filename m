Received: by 2002:a05:622a:6187:b0:4a7:49b6:ba6e with SMTP id hh7csp3704685qtb;
        Wed, 2 Jul 2025 05:35:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVppzLZG4MhmllCQ3gy1AZlXrDIIBNmrEmWwKJFWF/cjrhtabfq0L7BmcatVsKZ+sKTkpnf9XHAMAHIww==@linaro.org
X-Google-Smtp-Source: AGHT+IE9si0GdHuBx88yYzA5SREKGg0MfO7LNUZ5uWdZ+MOMLL0hu8uGWJJzFt2PHXdOLkp6hiuf
X-Received: by 2002:a05:620a:17aa:b0:7d3:899f:da4c with SMTP id af79cd13be357-7d5c5145fdemr359436085a.16.1751459714348;
        Wed, 02 Jul 2025 05:35:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751459714; cv=none;
        d=google.com; s=arc-20240605;
        b=MXJwBjCsXceFwy0AbVXEXMAxzkCBHJSA80lHoHCf8dnfrn/x6zDLt4mv6jb24RP2lw
         jB4WqtaMsmODUOkZX8lLfDLkKhkOBziU77pow/+XxnKPaZjMy7icHKW3L2zILWavcK8A
         Pd9Z98ZZAPNfWz2daAYaCj+kMI/PAMvLWXaVaL3vmNgHHd6o+coVgtjQwJclRad7FU37
         uI9eN60LNx9Ep5ZMyrRGlGWX+R1paXHGoBxy8uGU+1kTZLtf8bc8xTsnAbafcLXuIT+r
         3mFz+safpOqxqsSrixrq9AChAL9AcGf/ReLD4pKsESkmCIB8Iy5T+AE7OL3+T68ikhVz
         qUOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+5o41MPLL6siTUnGgQzMRLhBRZ8WRwHHp5dQcfQlvV4=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=VVLwfdm5SMWVerTeuW0u3S7jPC0YKlFa+MgfAVxInq1mxs5fKJLcIWHeGGLZV3qLp0
         ZnOvzMK6HdYS/ntXiZSMzfpK73hXPxkCeZ2bf98Uv2vjUE+ZYoo3D+b0qe9s3DbGH1i+
         ePUUfvWs2DhRIxHN49GSjoBqbC0aREPsUnDGFQkW83Spbbpk3+QiRJT+qmVCpUzBwqk5
         MX7DeB0oOFOev0d2LA2WlYvPj7WnbsDXcIkY5Bkoooijza+5dp3S/F3SLlBnWtyNvzYm
         EGAaRjBZ75a2DAWwEK4jLx0qg7OHqn/aRXjdGe8FlxjdU3Uo5j5s0Q5ytMhDGpwW4LEq
         DIvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NPnJgAhD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d4509c0478si800128885a.289.2025.07.02.05.35.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:35:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NPnJgAhD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwfk-0007YD-BU; Wed, 02 Jul 2025 08:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwfb-0007Ss-T2
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:34:35 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwfQ-0000wN-NF
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:34:35 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-2ea65f5a0easo3848634fac.1
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459662; x=1752064462; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+5o41MPLL6siTUnGgQzMRLhBRZ8WRwHHp5dQcfQlvV4=;
 b=NPnJgAhDhrGUxGEA2LY2YR98Hdxf55fC9sVSoe9SL5e16bTTOswJjU2+Z0I1rUKIYu
 5ibXQsRtsL4UUSNrzCRnPSS+7QDFAFk4MlGe79RWEaXtqm6tyhY/vVKFaYxu54bXVlse
 Ja+96F/QHA0KyPWVIduKsEoSRKcKJc1NMbgae1rI0DMLYe7Lx8IYNib9XbuORdfrEfUk
 Xp0Paaex/ulsKMHBoPUlSXOXliYCt4XU6hXSQObm+zIfM6JI7PL1E6VlK5T5I69wvJJr
 +ffoeibODUeWFDuLxImk0TjSkIV6DIgn/onp8FQWlS60kmGLVc/bAXgEBOT2uzTVKaNW
 9AEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459662; x=1752064462;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+5o41MPLL6siTUnGgQzMRLhBRZ8WRwHHp5dQcfQlvV4=;
 b=lIRP/sXculA+27goCeSKpOHsvRSoe6CtBh19hla9XpXKm3tX/sc9azev0zTVCLr0yQ
 7fhxbaKDIhg65Isy+lUNSt2nhD2bD6QzH+c54QaH7wCayyhZcvL3drZpoco+2sqSyD90
 l0x8ZdHjF0qAOVa2ho61o5DBADTUa2biSpVHLVqmcRBBv28FXa14wGQUa1FVd/NZj1Jp
 ealLC0EJDHF/v1TlK5Fb0uyS+ODXxqxJvKfWC6/aaZZZtqudh22etJ+APhyqb/dW5e7z
 UTbXHXAidNtCIBmZVMTaMjgSuuXFc/Nrhpr63DfFVzzbNxs4DajThKRIlWyRSJtGWMm6
 56sA==
X-Gm-Message-State: AOJu0YwfjnZgQE1R6lPsUPRPTMMIvKq/K/qCA2NyXe7+6+mvSjmRNdmz
 8nH1Ur3kAqR1a7H8fL9OmWKoEVRMnu3R2vo727pULW6jb3pJk1dVXjQkL0bhAgAUsfY=
X-Gm-Gg: ASbGnctmE8gTpBIaL6O2pEWSA7HXHQOvF09GQ5KP0lSa7y5ujR9NIjRF5Bdd/8mARAg
 oJTU2QS68ERcvuU8O8T9H0l5PDXnOBXg8WU54zzMG17CNURIYdQmBkbwMA0JIobCcG4LAECrhTS
 fjk+DAnYY2ca2cIituC8YjBx9Pg2Oap7JRz6OAsM08PHkvED69pUUmccpQ+n29AldoxZZlbXQah
 PvGjEPJzYfKwRSZtC+7BhryKV1UNwoieJ3o0na1aq6vrehY8fByhH0UzZp/QMqxP6Qh+UiuqLDh
 e0ORxPdjJPrI+BM1AqX7U9uXZWQTy5Q5E+qQvgx0UJFdfenO2porcs+PQd8AdMUPKG0UaQ==
X-Received: by 2002:a05:6870:2b19:b0:2d5:2360:4e7d with SMTP id
 586e51a60fabf-2f6472b3431mr1988802fac.8.1751459661889; 
 Wed, 02 Jul 2025 05:34:21 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50b1b2fsm3864281fac.32.2025.07.02.05.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:34:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 07/97] target/arm: Implement SME2 ZERO ZT0
Date: Wed,  2 Jul 2025 06:32:40 -0600
Message-ID: <20250702123410.761208-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x29.google.com
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
X-TUID: r4I3T9ArX2eQ

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/syndrome.h          |  1 +
 target/arm/tcg/translate-sme.c | 26 ++++++++++++++++++++++++++
 target/arm/tcg/sme.decode      |  1 +
 3 files changed, 28 insertions(+)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 3244e0740d..c48d3b8587 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -80,6 +80,7 @@ typedef enum {
     SME_ET_Streaming,
     SME_ET_NotStreaming,
     SME_ET_InactiveZA,
+    SME_ET_InaccessibleZT0,
 } SMEExceptionType;
 
 #define ARM_EL_EC_LENGTH 6
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index e8b3578174..246f191eca 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -27,6 +27,19 @@
 
 #include "decode-sme.c.inc"
 
+static bool sme2_zt0_enabled_check(DisasContext *s)
+{
+    if (!sme_za_enabled_check(s)) {
+        return false;
+    }
+    if (s->zt0_excp_el) {
+        gen_exception_insn_el(s, 0, EXCP_UDEF,
+                              syn_smetrap(SME_ET_InaccessibleZT0, false),
+                              s->zt0_excp_el);
+        return false;
+    }
+    return true;
+}
 
 /*
  * Resolve tile.size[index] to a host pointer, where tile and index
@@ -130,6 +143,19 @@ static bool trans_ZERO(DisasContext *s, arg_ZERO *a)
     return true;
 }
 
+static bool trans_ZERO_zt0(DisasContext *s, arg_ZERO_zt0 *a)
+{
+    if (!dc_isar_feature(aa64_sme2, s)) {
+        return false;
+    }
+    if (sme_enabled_check(s) && sme2_zt0_enabled_check(s)) {
+        tcg_gen_gvec_dup_imm(MO_64, offsetof(CPUARMState, za_state.zt0),
+                             sizeof_field(CPUARMState, za_state.zt0),
+                             sizeof_field(CPUARMState, za_state.zt0), 0);
+    }
+    return true;
+}
+
 static bool trans_MOVA(DisasContext *s, arg_MOVA *a)
 {
     static gen_helper_gvec_4 * const h_fns[5] = {
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 628804e37a..dd1f983941 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -22,6 +22,7 @@
 ### SME Misc
 
 ZERO            11000000 00 001 00000000000 imm:8
+ZERO_zt0        11000000 01 001 00000000000 00000001
 
 ### SME Move into/from Array
 
-- 
2.43.0

