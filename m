Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1250974dyc;
        Fri, 4 Jul 2025 07:24:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2qxYv6rm1CLTm2BnH1CdqZKDuSyBA8Xc1goFccWOeyOGgnl21gprYakljEDsdgvkXhos2JqZlvyyrXA==@linaro.org
X-Google-Smtp-Source: AGHT+IHg7xklzspv0/oUoPohF1Jje2J/r33qC8f0fRPUoXYR1lZjgJVYUd2h+dSTosNQp6pKGFJ6
X-Received: by 2002:a05:6214:469f:b0:6e8:9e9c:d20f with SMTP id 6a1803df08f44-702c8bc1841mr30056836d6.21.1751639067293;
        Fri, 04 Jul 2025 07:24:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639067; cv=none;
        d=google.com; s=arc-20240605;
        b=irUV33tB3dy6HywF6CyPcZXzSLKG9GqG/3cffr1ciOgDQEjUlhLmluOxIR3rkU7zSk
         ZGywTU3da7VBUKajjul196yYysNIFXUYC6hmAjLaaOjA6Tl3izKEb7WaD7IOwb7foLEW
         ZJZ+g1NJDrgaRKLw2MiIbrnyyly75Dr57m12CjtkBh7j3FD4RJ7ZkvLuWX35SQpsLXOc
         ubjvotuxQlLtRpoGXfev8mJT2UEQLOC67CUIQfrePUBAnmVnTa50fc8/Z2hfo7nBPIew
         ihPMSJEJQg1/DZLuG3piioMD9DguYytz1LDVMkKLL1StjZb2M1OLcIkxCLdQ6BZgYZO8
         GGtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+5o41MPLL6siTUnGgQzMRLhBRZ8WRwHHp5dQcfQlvV4=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=Oh5TSKZ4mNa+2zCMfL1SW0J++SEagtVbDpBfl0F3uLmK2RYP0oWB5KYj0rgiCe6xhb
         Qe7UEPrax+CqbFLkc83Yp/H2tcowkNOUpFvOa3pnqDqGLmN/+agfSgUgrBd3vWpq1YyE
         YNrsTu9Ezkr/Dge37AcMiSgAWP9ZBS2XpFeae6MA6iV+ceIz5oIJ+gptI9rzoRYjTuDI
         /VXTDFfv590hbxZzO5svXCmh4ikeTETpnZxAJKHZxgoQTrm3AbQ4bzQVXj/3da04/W9P
         0pOAHrmcsuOQ4L/oTBEGQWYiru97HH86BH94Y/MzCKF7WTqui+jKqA+jhJ6Fd0wxLG9u
         gXMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s6XUyBs2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d5dbf0467fsi214992785a.631.2025.07.04.07.24.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:24:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s6XUyBs2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhKa-0000NC-SS; Fri, 04 Jul 2025 10:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhIJ-0005G9-Dz
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:43 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhIG-0005hV-3s
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:39 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-2ea58f008e9so1150008fac.0
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751638893; x=1752243693; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+5o41MPLL6siTUnGgQzMRLhBRZ8WRwHHp5dQcfQlvV4=;
 b=s6XUyBs2B7WJuiMhew3/1377AYD0le9WDaDvRtFfpPjzN4d52xbxSdXEKhGY445/kb
 y2O1pHK8qhfIWONiQlbC8dczJCZuS73Y7gO3JlP8I4/90rVErZbmw8gn2hg6Z31W5oCe
 GkbbXJn/FZulV22x6PLbWMUSILH+RgNB2RBpRv+dBrF1j5KN0sR/j90To968PAVJiUz0
 jv3xIVO260BMWyYr2stA3Arr3x5lzpkEXknhzFvwWOmDHl34fx8QSORFznpFPfUjYd4j
 J6V4G/oz4f5MiAgujCbWiZt/GlB+MACPG1kL1N69u52vcQNEY4keEbBCTYfZloJO6ey0
 QImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751638893; x=1752243693;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+5o41MPLL6siTUnGgQzMRLhBRZ8WRwHHp5dQcfQlvV4=;
 b=Q9aeKhkhzX8krfTBw6U8+H2tlSrmo45Kv7jGnOzKTl004gDjEgrr3CcUdH3wbuKnjW
 9bnssDkbirSXOa2EH8sNIFMTLYRZVuNBOIkQ4UArusBayHp0zxCMD5BfDskxYC6iF52F
 OW6d5J4LcdWsfjNGjywnx21VqEjsVIIGmlFW7ak9T5Bp8h6wi/GD29ITf5RcWagHP4HX
 Xk7O9TwF7OHULHb9k7k0BjZqfCF2AzVm1EFeYCH6Vfw31ZBN/i/+fIafGGI6h0FPsq3Y
 GAcGx6VDdqjtFqKYXjlcFK9ndLwjlnJbTu7Oco/Od1Pliz8/L3eIEGCvXUOilsCR11XG
 kIlw==
X-Gm-Message-State: AOJu0YziDAwacWzSRQeMr1qyDOgnGbfF18adahXgiKurOGy8WSxEITJg
 0N+F4Rkxc37dWDONDSRX3KsQ+RNnkXgSrj2xfTkfRXfARiatrkNhy2OeAz2NJXdoOo4VC4thkO9
 RZgn13Gw=
X-Gm-Gg: ASbGncuT38qK74lGOX0j45AHadkhmS5xvG7WXutay+6+liOuxpYCBz3eT/ZdGD9jJht
 2KtCWmN29nx+I91oFXCCTuXIMX7H/AQ+db1/JWeo1uPDT3vR74+0rB/8XppEh5EkL2iQcF6gLuE
 yHNdyGhKpEyksGWsmg2MQ9XHg9JwMpINaLcqiuH54M1ttjtp2MKCW5UQpHQCBD1N+Fpzr/6o5wz
 lt3vMmt6Ees1nBwMr7Tnu2dArP+vE/PBIJiNzen+606+mIWdjDTCKb8ZlxF75MHoH6Hp873A4mS
 nUshT8J6gGskbm7AoomRm9cXrwY1l3ZDp6x0NDwVICsAm92JmXbhfWVZlO4EIQYM2rzVk3EQ10b
 LI6Qp9+maduWK+5+bYfjbKTiuaRtG7yGf4/Cy4bw1jowFwCPA8dmiEbGHPzA=
X-Received: by 2002:a05:6870:220c:b0:2d4:ce45:6990 with SMTP id
 586e51a60fabf-2f7969bc3f9mr1720258fac.7.1751638893263; 
 Fri, 04 Jul 2025 07:21:33 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff0471esm528016fac.3.2025.07.04.07.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:21:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 017/108] target/arm: Implement SME2 ZERO ZT0
Date: Fri,  4 Jul 2025 08:19:40 -0600
Message-ID: <20250704142112.1018902-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2c.google.com
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
X-TUID: TU7CrEm+tlLE

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

