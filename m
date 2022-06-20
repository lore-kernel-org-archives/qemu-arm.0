Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp608123lft;
        Mon, 20 Jun 2022 11:13:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vq/L0H9L/AYM336KWKzJIeSqA+OA6CDTh7PcxrC9iXbkWKdxXdPj0wI5C1BiYN/FmM4gt1
X-Received: by 2002:a05:622a:1792:b0:305:d833:159f with SMTP id s18-20020a05622a179200b00305d833159fmr20774029qtk.217.1655748799837;
        Mon, 20 Jun 2022 11:13:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655748799; cv=none;
        d=google.com; s=arc-20160816;
        b=pqy0KwfjeydBXUFtLwJascyqYGBMXp2I+7nM2vuVTJsc/hibT4kUUiOBfz1GnrVSOe
         9TI5stypZ6eBWBF15bQV4mWzZLSKjEG1eXXK1LCL3cEFef5noKbAFRUTY9Fl2GlB9pvr
         cix30IKe8cGDIP9nxUYiCXVHNMiFKScDnatw/jM83RWZfCANEZ2pvwN5KgLwMd1NlAGf
         wASaGz0661HS0wge2le0TR/xvOUG3Vum6Xzbi2t0mQWvBjY9aN7VhNHSiztEBGkZ93Zl
         IW3d9VEdAFzmwnp2h0Iy8p32veVLZLjtq37qs4p1BI3zWxdYJKpwJDDtyBXyl/cmHRfW
         6Wyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ObPjRYCBYg0ta/HJlgzuWa8cJ/RISLyvtPkHb2X+O5M=;
        b=dSw5IsgjDdAODadPkKusWyoumw7rBHGN1e1MfmgGr0aJcnL+MVs3cGeTrU2N0z/vox
         lqSRWLwub/S6vPgSVKWo/oClO7bvdYPpfNJuHwo9QyICMJBlBk0Lypg35/yQYbk2VHQ2
         CTu7nvxI7RJN8DA590QmQEoAFrCsVA+TnsamCbslI063RKFLFZFcEbtTOwWN5C5fazzU
         qZQXyoJRDfvgE3ET7E11sMCsdPr4eyabNynPxjT6Hv4mA27Mc0laET+HE/ByQw5PiPEO
         ul7HsD444ijB2JhRqjXOBymoqV3cOz2oN69aeXKhUoDzCdrM3F60wINCrZG+SBpphMpg
         XtxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FrVXZxkj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z2-20020a0cd782000000b0046b881299b5si6647408qvi.144.2022.06.20.11.13.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 11:13:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FrVXZxkj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3Ltn-0002SU-8R
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 14:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3La9-0006Fs-GB
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:53:02 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:38053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3La5-0001Uo-Re
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:53:01 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 p3-20020a17090a428300b001ec865eb4a2so6310879pjg.3
 for <qemu-arm@nongnu.org>; Mon, 20 Jun 2022 10:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ObPjRYCBYg0ta/HJlgzuWa8cJ/RISLyvtPkHb2X+O5M=;
 b=FrVXZxkjks9BMVDU5Zq0TUUXxBlBTGjE+9+0I7Hj4S58VXgloELnAQ7ckXzhDFZx88
 crsNlpSAgJ2Yd8Us/SSA2TpcVZRHCpl30iaVCOWEUYB+ZWEpCyg5iljffojOUsN/3aH/
 z7EJp1tHUsbRDP50pMgqXAYw73Vw8FuvW2SViryuXQToNwDvmKTVcyyB99rB3cH7NXBT
 5cYLGF2+ApDOZYqmgAz3GqiXDCkbuS2cJnUh/5Ej51j00H2y7aQKHOA/hs/pJS+sZVnM
 NdGfUYvd0p4QrGp4Na6inHXLfZFNO/XfioVLzxouF3Ko5x9SR0gOo1pYmp8XZKZXZ4Ye
 9Omg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ObPjRYCBYg0ta/HJlgzuWa8cJ/RISLyvtPkHb2X+O5M=;
 b=HPLObH43xhXNtNsE+XXSRd/OYLa7Vlbp0iudN9eq4imz71jLzPDKhOEOfHNiqjZGot
 9t0D1GrC8mR1270rnSsARqlEcpd3dzgtnDaAWSbhtSGWevTP0POK0eJK2A6wyVyaLoA7
 THIkkxubMOCEBAdcZGRocOciuxopUIqVBiPmOPMHee1JC8Bt0m0uJRS+Tbat6wUFyxlK
 Ebmzfrx8Ix1UD0LZBqwN+4eucE4Rztup7AXPupcQwLXvxBlMyD+VwQrfzybIefwoLhYV
 jNol+YddyBvGCUGM8lwmAriCk+0kb8W5xQjM6NiPLqrCZwjSviQLoExbujlbC4Ui7HUd
 SJxw==
X-Gm-Message-State: AJIora8HS+LuzkZpZqGmZQcmqAHaY8odLa6hP9ydvqd86EDN9qB4nSSU
 cKEWMtrM8CO8TzhUmLgoUGdMzQ==
X-Received: by 2002:a17:902:d50c:b0:16a:d46:9f48 with SMTP id
 b12-20020a170902d50c00b0016a0d469f48mr16031920plg.159.1655747576498; 
 Mon, 20 Jun 2022 10:52:56 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 23/51] target/arm: Implement SME RDSVL, ADDSVL, ADDSPL
Date: Mon, 20 Jun 2022 10:52:07 -0700
Message-Id: <20220620175235.60881-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
X-TUID: 9g51fiJfICDB

These SME instructions are nominally within the SVE decode space,
so we add them to sve.decode and translate-sve.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h |  1 +
 target/arm/sve.decode      |  5 ++++-
 target/arm/translate-a64.c | 15 +++++++++++++++
 target/arm/translate-sve.c | 38 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 789b6e8e78..6bd1b2eb4b 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -29,6 +29,7 @@ void write_fp_dreg(DisasContext *s, int reg, TCGv_i64 v);
 bool logic_imm_decode_wmask(uint64_t *result, unsigned int immn,
                             unsigned int imms, unsigned int immr);
 bool sve_access_check(DisasContext *s);
+bool sme_enabled_check(DisasContext *s);
 TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr);
 TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
                         bool tag_checked, int log2_size);
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index a54feb2f61..bbdaac6ac7 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -449,14 +449,17 @@ INDEX_ri        00000100 esz:2 1 imm:s5 010001 rn:5 rd:5
 # SVE index generation (register start, register increment)
 INDEX_rr        00000100 .. 1 ..... 010011 ..... .....          @rd_rn_rm
 
-### SVE Stack Allocation Group
+### SVE / Streaming SVE Stack Allocation Group
 
 # SVE stack frame adjustment
 ADDVL           00000100 001 ..... 01010 ...... .....           @rd_rn_i6
+ADDSVL          00000100 001 ..... 01011 ...... .....           @rd_rn_i6
 ADDPL           00000100 011 ..... 01010 ...... .....           @rd_rn_i6
+ADDSPL          00000100 011 ..... 01011 ...... .....           @rd_rn_i6
 
 # SVE stack frame size
 RDVL            00000100 101 11111 01010 imm:s6 rd:5
+RDSVL           00000100 101 11111 01011 imm:s6 rd:5
 
 ### SVE Bitwise Shift - Unpredicated Group
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index efcfb919ff..498970f653 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1216,6 +1216,21 @@ static bool sme_access_check(DisasContext *s)
     return true;
 }
 
+/* Note that this function corresponds to CheckSMEEnabled. */
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
 /*
  * This utility function is for doing register extension with an
  * optional shift. You will likely want to pass a temporary for the
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 62b5f3040c..13bdd027a5 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1286,6 +1286,19 @@ static bool trans_ADDVL(DisasContext *s, arg_ADDVL *a)
     return true;
 }
 
+static bool trans_ADDSVL(DisasContext *s, arg_ADDSVL *a)
+{
+    if (!dc_isar_feature(aa64_sme, s)) {
+        return false;
+    }
+    if (sme_enabled_check(s)) {
+        TCGv_i64 rd = cpu_reg_sp(s, a->rd);
+        TCGv_i64 rn = cpu_reg_sp(s, a->rn);
+        tcg_gen_addi_i64(rd, rn, a->imm * s->svl);
+    }
+    return true;
+}
+
 static bool trans_ADDPL(DisasContext *s, arg_ADDPL *a)
 {
     if (!dc_isar_feature(aa64_sve, s)) {
@@ -1299,6 +1312,19 @@ static bool trans_ADDPL(DisasContext *s, arg_ADDPL *a)
     return true;
 }
 
+static bool trans_ADDSPL(DisasContext *s, arg_ADDSPL *a)
+{
+    if (!dc_isar_feature(aa64_sme, s)) {
+        return false;
+    }
+    if (sme_enabled_check(s)) {
+        TCGv_i64 rd = cpu_reg_sp(s, a->rd);
+        TCGv_i64 rn = cpu_reg_sp(s, a->rn);
+        tcg_gen_addi_i64(rd, rn, a->imm * (s->svl / 8));
+    }
+    return true;
+}
+
 static bool trans_RDVL(DisasContext *s, arg_RDVL *a)
 {
     if (!dc_isar_feature(aa64_sve, s)) {
@@ -1311,6 +1337,18 @@ static bool trans_RDVL(DisasContext *s, arg_RDVL *a)
     return true;
 }
 
+static bool trans_RDSVL(DisasContext *s, arg_RDSVL *a)
+{
+    if (!dc_isar_feature(aa64_sme, s)) {
+        return false;
+    }
+    if (sme_enabled_check(s)) {
+        TCGv_i64 reg = cpu_reg(s, a->rd);
+        tcg_gen_movi_i64(reg, a->imm * s->svl);
+    }
+    return true;
+}
+
 /*
  *** SVE Compute Vector Address Group
  */
-- 
2.34.1

