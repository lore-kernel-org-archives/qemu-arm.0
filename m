Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1540754ejb;
        Sun, 11 Jun 2023 09:03:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4dizIL0XKyiQ+cIx4RwDFXbhFYA8VrtpWw14mBqAmubp9YOTufXZpJXrOCyI1h3MfqZJ/x
X-Received: by 2002:a05:6102:3659:b0:43b:1d15:31d with SMTP id s25-20020a056102365900b0043b1d15031dmr2666787vsu.1.1686499410073;
        Sun, 11 Jun 2023 09:03:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686499410; cv=none;
        d=google.com; s=arc-20160816;
        b=OvkXsuwCY7jj7vuUNERfoGUIDaUb/RkH4vc5GCVul3CtO/5Ws05nzUeizE6xb8f9n8
         2JuNtKKsXhrQZuK+JM9oWh5OyEbXlRvl03S+pNiIFVsxr3f+WOzIzLyyIsjkuEya8GY2
         IAPIN7TRtHPjDHZk+YhVBidYJuEA1QopjZSwPOIVsw0IqlMwMfNjXbzuXsIoZylPwQ66
         umjwg4Oc86U0S+4DawTTeRL2XzfimQtDTfuCcbhRGg9NszkoSK94NV778i1IooVTb2ft
         1UwL9OZODDhFe0GFaETRtNZdlGYNde9/pLU/vnT/OVV6XFQnYy7/yY7uhiLukfnbqbHw
         Y7xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=AvurtF/dISSi4a7QlYCrOBVBZSeEKbEVU2dJJafv7aE=;
        b=YQXmdA4OGK2L2ddNcwGpOrBc2SSgn4PQUEnwYk4nxpT/uoCMKqZ0w5oQrlJki02giM
         i8Wcr/bwXsThhoBQ3q5l3uwB8RTf5uYGcesLjwqf25AvR/xAe1DZeG+u9NsAkyNRY0lZ
         mB5SrGObBqxw2H8M/gt7YtjjzqYoEmdSvel6zfYC7uUHdny5dBSo65oIJgNLueEmFGfj
         Sm0b/Ze8UJ6vTG+jmRDKSCXv1pV05eZ3wJzpoSrpAtywiD6WojoW/yODq4Jou5XnKPg3
         xOCGaiAkTe1r05CMY2fsNShuc3E8e2uND2PpYzC04RUKbAl956u9St2YnXAyCNavWCAU
         aCpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AAYNsKbi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9-20020a0561020c0900b004357809847asi510955vss.134.2023.06.11.09.03.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Jun 2023 09:03:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AAYNsKbi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q8NVc-0006Tu-NJ; Sun, 11 Jun 2023 12:01:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q8NUi-0005qy-57
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 12:00:50 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q8NUc-0000S0-FV
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 12:00:42 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-30af159b433so3329100f8f.3
 for <qemu-arm@nongnu.org>; Sun, 11 Jun 2023 09:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686499237; x=1689091237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AvurtF/dISSi4a7QlYCrOBVBZSeEKbEVU2dJJafv7aE=;
 b=AAYNsKbiH3xVj1kO2lpQ0CQX6nZPoLq3b1Sc4hMnsnokSAUnS+E4bd+Gcpmlb7o5jo
 ur78Hd+apLcoD/ojf5o5KqmR55+hYVQcRFVqH3TpeFc2YzVXP1hgSQK8Urlx7ZYd0yWO
 n6B2UmD3a4LtcSv/DlO2sg9zoBMqJLL3CmcRrSg+Vvb++S0JVAD6ZnL6pAsRBlNVILiD
 5mS9PCxvJO3skZwVKLkRWeBJauRbyb+rJsZ3HdFvIrlrLUeEuLpuDDdk4+0/vLSg7tJR
 kn/pAnXLKh2MFeXpfA+V6W6yU78Q4McORhfOIMUsElUSV84AcJL6TmiIWVv2txuYAL9Y
 hjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686499237; x=1689091237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AvurtF/dISSi4a7QlYCrOBVBZSeEKbEVU2dJJafv7aE=;
 b=OwKBVcEi00JsHXpDYAD74JUB/3dyGww0Ei4ZuikKgGZGXPx+D2p9IQZFlAuaywd2mF
 1/UjPbqfch+GOmodL//GFlEhdAfrH+Tnars76ihzgETtpRFvw2SEx8HNHb143PtGwm/t
 YvmUjn9c+UoJ1ih/dLw7AFTEPlNRPCnG3AvujGo2hqCk4I6LOoavuRkglBoS0tibwQJN
 jEdV1Llzm9ne/LwZtiwmCvatGO5tLO4kWYfs/C3kYJXQpk3mojirpMYTm6bZqA0cBMXd
 lJHJ7mP5nSQQBgGNs1H6EujndZjgFCiH0B3HAiBaJB9Eh0hyBJv7jnToEYPXjjF1/1YR
 we9A==
X-Gm-Message-State: AC+VfDwQK3Izzu8EOzi9OqyfSOF0us1kOTBdlIR+gOKDAeBl9BHnURQH
 iQP9YlrSUda64+9E94MlFx5UQ5qVop/qubsmW+4=
X-Received: by 2002:a05:6000:136c:b0:30f:c243:d7e7 with SMTP id
 q12-20020a056000136c00b0030fc243d7e7mr200062wrz.68.1686499237201; 
 Sun, 11 Jun 2023 09:00:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a056000008900b0030ae499da59sm9923022wrx.111.2023.06.11.09.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jun 2023 09:00:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 06/23] target/arm: Convert barrier insns to decodetree
Date: Sun, 11 Jun 2023 17:00:15 +0100
Message-Id: <20230611160032.274823-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230611160032.274823-1-peter.maydell@linaro.org>
References: <20230611160032.274823-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: pOhufxLGAQ5M

Convert the insns in the "Barriers" instruction class to
decodetree: CLREX, DSB, DMB, ISB and SB.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230602155223.2040685-4-peter.maydell@linaro.org
---
 target/arm/tcg/a64.decode      |  7 +++
 target/arm/tcg/translate-a64.c | 92 ++++++++++++++--------------------
 2 files changed, 46 insertions(+), 53 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 1efd436e175..b3608d38dc9 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -181,3 +181,10 @@ ERETA           1101011 0100 11111 00001 m:1 11111 11111 &reta  # ERETAA, ERETAB
   # that isn't specifically allocated to an instruction must NOP
   NOP           1101 0101 0000 0011 0010 ---- --- 11111
 }
+
+# Barriers
+
+CLREX           1101 0101 0000 0011 0011 ---- 010 11111
+DSB_DMB         1101 0101 0000 0011 0011 domain:2 types:2 10- 11111
+ISB             1101 0101 0000 0011 0011 ---- 110 11111
+SB              1101 0101 0000 0011 0011 0000 111 11111
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index eb8addac1b3..088dfd8b1fd 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1812,67 +1812,56 @@ static bool trans_AUTIBSP(DisasContext *s, arg_AUTIBSP *a)
     return true;
 }
 
-static void gen_clrex(DisasContext *s, uint32_t insn)
+static bool trans_CLREX(DisasContext *s, arg_CLREX *a)
 {
     tcg_gen_movi_i64(cpu_exclusive_addr, -1);
+    return true;
 }
 
-/* CLREX, DSB, DMB, ISB */
-static void handle_sync(DisasContext *s, uint32_t insn,
-                        unsigned int op1, unsigned int op2, unsigned int crm)
+static bool trans_DSB_DMB(DisasContext *s, arg_DSB_DMB *a)
 {
+    /* We handle DSB and DMB the same way */
     TCGBar bar;
 
-    if (op1 != 3) {
-        unallocated_encoding(s);
-        return;
+    switch (a->types) {
+    case 1: /* MBReqTypes_Reads */
+        bar = TCG_BAR_SC | TCG_MO_LD_LD | TCG_MO_LD_ST;
+        break;
+    case 2: /* MBReqTypes_Writes */
+        bar = TCG_BAR_SC | TCG_MO_ST_ST;
+        break;
+    default: /* MBReqTypes_All */
+        bar = TCG_BAR_SC | TCG_MO_ALL;
+        break;
     }
+    tcg_gen_mb(bar);
+    return true;
+}
 
-    switch (op2) {
-    case 2: /* CLREX */
-        gen_clrex(s, insn);
-        return;
-    case 4: /* DSB */
-    case 5: /* DMB */
-        switch (crm & 3) {
-        case 1: /* MBReqTypes_Reads */
-            bar = TCG_BAR_SC | TCG_MO_LD_LD | TCG_MO_LD_ST;
-            break;
-        case 2: /* MBReqTypes_Writes */
-            bar = TCG_BAR_SC | TCG_MO_ST_ST;
-            break;
-        default: /* MBReqTypes_All */
-            bar = TCG_BAR_SC | TCG_MO_ALL;
-            break;
-        }
-        tcg_gen_mb(bar);
-        return;
-    case 6: /* ISB */
-        /* We need to break the TB after this insn to execute
-         * a self-modified code correctly and also to take
-         * any pending interrupts immediately.
-         */
-        reset_btype(s);
-        gen_goto_tb(s, 0, 4);
-        return;
+static bool trans_ISB(DisasContext *s, arg_ISB *a)
+{
+    /*
+     * We need to break the TB after this insn to execute
+     * self-modifying code correctly and also to take
+     * any pending interrupts immediately.
+     */
+    reset_btype(s);
+    gen_goto_tb(s, 0, 4);
+    return true;
+}
 
-    case 7: /* SB */
-        if (crm != 0 || !dc_isar_feature(aa64_sb, s)) {
-            goto do_unallocated;
-        }
-        /*
-         * TODO: There is no speculation barrier opcode for TCG;
-         * MB and end the TB instead.
-         */
-        tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
-        gen_goto_tb(s, 0, 4);
-        return;
-
-    default:
-    do_unallocated:
-        unallocated_encoding(s);
-        return;
+static bool trans_SB(DisasContext *s, arg_SB *a)
+{
+    if (!dc_isar_feature(aa64_sb, s)) {
+        return false;
     }
+    /*
+     * TODO: There is no speculation barrier opcode for TCG;
+     * MB and end the TB instead.
+     */
+    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
+    gen_goto_tb(s, 0, 4);
+    return true;
 }
 
 static void gen_xaflag(void)
@@ -2336,9 +2325,6 @@ static void disas_system(DisasContext *s, uint32_t insn)
             return;
         }
         switch (crn) {
-        case 3: /* CLREX, DSB, DMB, ISB */
-            handle_sync(s, insn, op1, op2, crm);
-            break;
         case 4: /* MSR (immediate) */
             handle_msr_i(s, insn, op1, op2, crm);
             break;
-- 
2.34.1

