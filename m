Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp338316lft;
        Fri, 8 Jul 2022 08:28:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ujHWIG00fuWvFKZJ+LKZXpexzCjmGbDkAvpkCunYGMpoM9Owzr7Kxbn0WCrx72VwXI0dim
X-Received: by 2002:a05:620a:270e:b0:6b3:5922:a291 with SMTP id b14-20020a05620a270e00b006b35922a291mr2724537qkp.528.1657294139010;
        Fri, 08 Jul 2022 08:28:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657294139; cv=none;
        d=google.com; s=arc-20160816;
        b=COiYAqxB56Ss3eatEHHO+43HQ+ZoZ2m8Wtn525uNIJIaJ2hIkFS3p0n/6OefKYragT
         YIJ39/Y2d5wT1IzPyXJe6MRUKloZfF8um23MTQ+8OzKANY+q9HPKapjA/fgjTPbNRVUu
         m7OKIs/DqVKzFnti1GEJPo9sVD7APhaZKf3kLUF7CZiPzO+KkLALACwCRja1h5xri7mB
         280Cj+RJq/cf2sGkwRXZfGI12+CtHQBUwFWwEXZEr29fp6laVNNK2K7q8MgLGI3BIYwS
         F30r9j8TP39eDsSEgnO1hXdJ2C2ie8X561Lc+zJnN5U+SqniLTdntGMFNMphXoate+kd
         mQhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PhJtFSrquOFUVO5QY9Q5zh4pNEWnYjCw2RgtobhuW2s=;
        b=QItNJMhZUbjORPcpZ2BJElHJtJL3dqFM4zIEv04lMo9Obl9bpMISKNwdggFTbyoCL6
         /FVDJyonP+6DQFhWWvacP2Rplg5OF6XSfDsfcolcYF+GtgC0AagQGoBgVhiwcYdT9qn7
         oqHJ8hALP2GFyvUFVRm+LSlGiO0erdh9v8aUzIqoYNKoszOXs8NZGs7KSYQBizcOJ7nk
         mZfS8fI1/9uUs/9I9nxsvr5JTdmymeBChMW6hoOW1UjU55crWc7pkBmejQybvm38QgWJ
         qfAU3+gmYjcT3o/9FWLxjjgZ7My9IYXCeJH1yK2zakWCpIKhbZeu1t0VG+eqfqhmJR0i
         cPsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lWMF37XJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s15-20020a05622a178f00b0031b9d9d62f4si20948905qtk.481.2022.07.08.08.28.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 08:28:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lWMF37XJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9puc-0003m5-EG
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 11:28:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pid-0002bB-2u
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:16:36 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:33423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pia-0002J8-Qt
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:16:34 -0400
Received: by mail-pg1-x530.google.com with SMTP id 72so1107401pge.0
 for <qemu-arm@nongnu.org>; Fri, 08 Jul 2022 08:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PhJtFSrquOFUVO5QY9Q5zh4pNEWnYjCw2RgtobhuW2s=;
 b=lWMF37XJ1jJ0MLY6VWKtYw/pp9ZqCPFDYoUDGnTqI6tvWpYlox6HKjlbtbjvpK0d+C
 rWWjUSmZrEEICbn/tVKAxOBnfU+ws2kR1YK2qf+hPqFCaB0+I6Fg+Pu5enn4HDoY2Vfn
 9YFcS2FTz5lTyTYZDb+QsB1YqGfIDiHpDSN74bJoeKqk1pb1bnCgJxlNBtRvrz/WQ50e
 Rjco1rdq8GO8YZ9pZWBLny5j77IV0OjXG9ua/lQloW1YOtZzqM45PCQrGOSWnsv4e53R
 IRMNASxmT6a5TR1hNBLZZSu3lAea+0K5UkOTisqiUpABrKAfCHITMprcJMy4ZA1399HQ
 r77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PhJtFSrquOFUVO5QY9Q5zh4pNEWnYjCw2RgtobhuW2s=;
 b=JJbCxDSR0RtJp8gjdy49hU2FKTsS4yvV3d4Q/OPIAGvF+m/XcfpI1RD01cU6vt5m/t
 v333v6ZqF3iKBp6wAZGSyosoF2m+hA7SKzH45/hCsACL3XIams2G8Uh0fu/PdgmuP5gs
 yowPYaJf9Uf1VWywIoZfCtmjQ/jflaX4qP6GAxKV4jmmFoD5lMrDyIpXgpgItq73VB8U
 amj9QZGSJhmqAMDaB5wR32KFdKi5k3Lezh6xjdZ/L1rRf/et6O2YlvqzDQK8RSsZefQM
 iCk1zxeD86RWyuW5lJnA6YvDeJ6+if2g1ch6zrGqQmRqFWKASnWoe67b/F3inENfLZ5o
 BvQA==
X-Gm-Message-State: AJIora+1uNZ/EcK69sSuk38BGf3rvmsui1OEav0eLUOmwg4keQNvlJGB
 lpKWNNlo8YVW4nPIyazNpojMIg==
X-Received: by 2002:a63:6703:0:b0:413:1f40:6cb5 with SMTP id
 b3-20020a636703000000b004131f406cb5mr3771235pgc.614.1657293391467; 
 Fri, 08 Jul 2022 08:16:31 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:16:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 15/45] target/arm: Add SME enablement checks
Date: Fri,  8 Jul 2022 20:45:10 +0530
Message-Id: <20220708151540.18136-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
X-TUID: UX0Z4jXe/71j

These functions will be used to verify that the cpu
is in the correct state for a given instruction.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h | 21 +++++++++++++++++++++
 target/arm/translate-a64.c | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 789b6e8e78..02fb95e019 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -29,6 +29,27 @@ void write_fp_dreg(DisasContext *s, int reg, TCGv_i64 v);
 bool logic_imm_decode_wmask(uint64_t *result, unsigned int immn,
                             unsigned int imms, unsigned int immr);
 bool sve_access_check(DisasContext *s);
+bool sme_enabled_check(DisasContext *s);
+bool sme_enabled_check_with_svcr(DisasContext *s, unsigned);
+
+/* This function corresponds to CheckStreamingSVEEnabled. */
+static inline bool sme_sm_enabled_check(DisasContext *s)
+{
+    return sme_enabled_check_with_svcr(s, R_SVCR_SM_MASK);
+}
+
+/* This function corresponds to CheckSMEAndZAEnabled. */
+static inline bool sme_za_enabled_check(DisasContext *s)
+{
+    return sme_enabled_check_with_svcr(s, R_SVCR_ZA_MASK);
+}
+
+/* Note that this function corresponds to CheckStreamingSVEAndZAEnabled. */
+static inline bool sme_smza_enabled_check(DisasContext *s)
+{
+    return sme_enabled_check_with_svcr(s, R_SVCR_SM_MASK | R_SVCR_ZA_MASK);
+}
+
 TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr);
 TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
                         bool tag_checked, int log2_size);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 7fab7f64f8..b16d81bf19 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1216,6 +1216,40 @@ static bool sme_access_check(DisasContext *s)
     return true;
 }
 
+/* This function corresponds to CheckSMEEnabled. */
+bool sme_enabled_check(DisasContext *s)
+{
+    /*
+     * Note that unlike sve_excp_el, we have not constrained sme_excp_el
+     * to be zero when fp_excp_el has priority.  This is because we need
+     * sme_excp_el by itself for cpregs access checks.
+     */
+    if (!s->fp_excp_el || s->sme_excp_el < s->fp_excp_el) {
+        s->fp_access_checked = true;
+        return sme_access_check(s);
+    }
+    return fp_access_check_only(s);
+}
+
+/* Common subroutine for CheckSMEAnd*Enabled. */
+bool sme_enabled_check_with_svcr(DisasContext *s, unsigned req)
+{
+    if (!sme_enabled_check(s)) {
+        return false;
+    }
+    if (FIELD_EX64(req, SVCR, SM) && !s->pstate_sm) {
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                           syn_smetrap(SME_ET_NotStreaming, false));
+        return false;
+    }
+    if (FIELD_EX64(req, SVCR, ZA) && !s->pstate_za) {
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                           syn_smetrap(SME_ET_InactiveZA, false));
+        return false;
+    }
+    return true;
+}
+
 /*
  * This utility function is for doing register extension with an
  * optional shift. You will likely want to pass a temporary for the
-- 
2.34.1

