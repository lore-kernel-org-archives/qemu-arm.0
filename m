Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4192837njb;
        Wed, 11 Dec 2024 08:36:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW6VNwYsn3sTEK5BIdEWXKHkHU0OXUNsCc7wLwHJ+bvUSxNopQHZj2o2WmRGgAogsMROPYdU0FoRA5sYw==@linaro.org
X-Google-Smtp-Source: AGHT+IFj/xyenPOJ2tiGH9sxTZvFcQz8DyTY+qaoqMdRRzxT3x3xjY+b7gT1dxHBY8ZOytk2SVHT
X-Received: by 2002:a05:6214:ac2:b0:6d8:8289:26ac with SMTP id 6a1803df08f44-6dae2ae19d1mr6629726d6.45.1733934987008;
        Wed, 11 Dec 2024 08:36:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733934986; cv=none;
        d=google.com; s=arc-20240605;
        b=fIGsiGJf33q9F94SBeJz1CQ89p1gn0a/AuRHoz0aBCPfp2ob/EsvPKktU+zchY0xWE
         lMLh6IMhv4bw2JfpW04SMMrJfeFyifDzMqgRAUH9mweL/i1OU5rIIoehIlu193WMw1Xl
         Hc0ebHRIRyQa+IwDUtlJGwhUnFkWfw7jGCaLrhfEDle+G1vNnklkawQAsZYlAH6HtevJ
         anLPVm6bDqG7CkS+/mmZkrE4kVZwbxNiceZ858BuVDW3ZIbPhEOpiERWRMoZzqIOP14b
         N4nqfYaHMNuirMF9uqrEBv5A/MSEQfhtcbjDcCA2oiRWuHrxB36CAvHYuczmrzGy3gx7
         jYiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UFmX4MjvTdCOOGQhoYxzX/rl0jVQPPh/e9AQv9Zr6rY=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=SvhnGGxHetxkERmMDs5Kdnt1x1nhrV2WFEi+ihTBofhW+/ckK90aiCMrTPq6rJebME
         4TiZ/LU+m9F4BipRj/xKNWGA9DO1n0Rwd7MpYq20VBpSti1CB4sTAqyCFPLlMiD9kEDV
         22mkNGO975p9KizYgaz03H49KHXdzc4ZkHJZhLh8WdgH0Be/Tg3m4DtoUNMf1EQGaqzX
         3GSp6B/IhEnxzriFO6BC34os4TerLNl513tm+Jn5lSJP9N79EsrA4qGmXkjOx0mpTbwd
         Z/oLCEm7U9OCvaRL97Job7aQkKpOEdyyfzc5ERuwQJyCsTYwMO9an7IKTkUv7MN6RQ8H
         L2bA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fontk107;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6ea9c4dacsi264872285a.339.2024.12.11.08.36.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:36:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fontk107;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPdz-0008AS-KX; Wed, 11 Dec 2024 11:32:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPdO-0005nq-Tw
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:32:23 -0500
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPdM-0001QP-9q
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:32:22 -0500
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-467777d7c83so20589261cf.3
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934739; x=1734539539; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UFmX4MjvTdCOOGQhoYxzX/rl0jVQPPh/e9AQv9Zr6rY=;
 b=Fontk107ceL0iVJY/TgvLqR+136IiqQchuCHg1aSr4YT/y9vAFokptZDF2QheR17BD
 DEI4GKF0+dDXEx703+oY/4l8qnEhRHmcYRY6AOd8xKckYMRISDTmqRrv/PZKR4eLt4ER
 giL9f9oRowG9i/ot3uwEMoP7OMkI94qHzNkr/1D6fBdXdFN7fwjQYWiu3KDWjmaPxP3t
 RN/qejuq1QaYqK5LdWdzzbIDOit/M94zqW+jrVidZn+8ZxpV8asMYqO8dA/c4bceg8qm
 imBs24sM4RmFhGTt7+GclMIrjBw9Q6LhKMyMlBvfyTwNSuxnwg89w9ACKw9JLSW4pR2Y
 Hk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934739; x=1734539539;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UFmX4MjvTdCOOGQhoYxzX/rl0jVQPPh/e9AQv9Zr6rY=;
 b=NAdei2q3XEV5QCMAQtZBnA9Nr+K09CIUedDXlzZjmdCwxOn18G/T7nTTOepEmBktBS
 Y8go1OIC9826wx/BU93VdG0uWprcK/7mdcN88iTpQb/i2p1U9Ojcy1mgwViYeAh6VnLL
 6Qv13PDW3qCyrWDcb2+vsJTl+B9ebU+IMYUFvs9AnU9+L0O4v3wGWb/vtvUvs23mHnqL
 W4dunPTvA97BGexAfM2+qrX3jzzYeffzaLon0KIHpI6SOTS7NojbDteht0QHcizdFBQR
 R1WT8MMUl9bxsIgyx4yMBtIG56nQVRlZrJgxOAvvt+WyHDrJbowkK2BOnVEzuVbmsWhb
 dTVA==
X-Gm-Message-State: AOJu0YwGSbJ7kKMrIJjp+5yrCdBWpePJ7bTnmdwO3p5rESEYuyq/UVjB
 B/Zb9JE4jZoDCGKMaa6bNohOLGVgvCk3Zn5WXF0eny2kr7MpPXQ8g/qad9kCYONoxA8EGImV6Aq
 L9WB0/QyJ
X-Gm-Gg: ASbGncsYKRjwCcCQsiHsJPF3PCwZ7oBNqL4WaSjpecSAYvwjO+H2TgwCD3uIcDhFLpd
 pjh1LCbdb5+bezcafQRVlFDVpqCMONcLf+F8iT4Zfo9c64RDE8XlyJ/W9FqPhAe25A3OAuauUUH
 REG7ZoPDVIdRHYeGKheRYvcyjiCUJwz9EvLPQnfTtTdMuBY5IOZLe93WDwOQR9+0sEZmXHEyNYs
 R8DlNoKIbpVN3WxloJ9qok/6edR2lY/L/iVPDNluMNZXsC+wLs6O581307FHw==
X-Received: by 2002:a05:622a:1194:b0:466:b1a2:c03a with SMTP id
 d75a77b69052e-46795422301mr6930701cf.37.1733934738967; 
 Wed, 11 Dec 2024 08:32:18 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46755db613csm43849381cf.70.2024.12.11.08.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:32:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 31/69] target/arm: Convert FCVT (scalar) to decodetree
Date: Wed, 11 Dec 2024 10:29:58 -0600
Message-ID: <20241211163036.2297116-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x833.google.com
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
X-TUID: 6ub1WZ0QbbP7

Remove handle_fp_fcvt and disas_fp_1src as these were
the last insns decoded by those functions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 172 +++++++++++++--------------------
 target/arm/tcg/a64.decode      |   7 ++
 2 files changed, 74 insertions(+), 105 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index e48dd308fc..b31a6d4dff 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8443,123 +8443,85 @@ TRANS_FEAT(FRINT64Z_s, aa64_frint, do_fp1_scalar, a,
            &f_scalar_frint64, FPROUNDING_ZERO)
 TRANS_FEAT(FRINT64X_s, aa64_frint, do_fp1_scalar, a, &f_scalar_frint64, -1)
 
-static void handle_fp_fcvt(DisasContext *s, int opcode,
-                           int rd, int rn, int dtype, int ntype)
+static bool trans_FCVT_s_ds(DisasContext *s, arg_rr *a)
 {
-    switch (ntype) {
-    case 0x0:
-    {
-        TCGv_i32 tcg_rn = read_fp_sreg(s, rn);
-        if (dtype == 1) {
-            /* Single to double */
-            TCGv_i64 tcg_rd = tcg_temp_new_i64();
-            gen_helper_vfp_fcvtds(tcg_rd, tcg_rn, tcg_env);
-            write_fp_dreg(s, rd, tcg_rd);
-        } else {
-            /* Single to half */
-            TCGv_i32 tcg_rd = tcg_temp_new_i32();
-            TCGv_i32 ahp = get_ahp_flag();
-            TCGv_ptr fpst = fpstatus_ptr(FPST_FPCR);
+    if (fp_access_check(s)) {
+        TCGv_i32 tcg_rn = read_fp_sreg(s, a->rn);
+        TCGv_i64 tcg_rd = tcg_temp_new_i64();
 
-            gen_helper_vfp_fcvt_f32_to_f16(tcg_rd, tcg_rn, fpst, ahp);
-            /* write_fp_sreg is OK here because top half of tcg_rd is zero */
-            write_fp_sreg(s, rd, tcg_rd);
-        }
-        break;
-    }
-    case 0x1:
-    {
-        TCGv_i64 tcg_rn = read_fp_dreg(s, rn);
-        TCGv_i32 tcg_rd = tcg_temp_new_i32();
-        if (dtype == 0) {
-            /* Double to single */
-            gen_helper_vfp_fcvtsd(tcg_rd, tcg_rn, tcg_env);
-        } else {
-            TCGv_ptr fpst = fpstatus_ptr(FPST_FPCR);
-            TCGv_i32 ahp = get_ahp_flag();
-            /* Double to half */
-            gen_helper_vfp_fcvt_f64_to_f16(tcg_rd, tcg_rn, fpst, ahp);
-            /* write_fp_sreg is OK here because top half of tcg_rd is zero */
-        }
-        write_fp_sreg(s, rd, tcg_rd);
-        break;
-    }
-    case 0x3:
-    {
-        TCGv_i32 tcg_rn = read_fp_sreg(s, rn);
-        TCGv_ptr tcg_fpst = fpstatus_ptr(FPST_FPCR);
-        TCGv_i32 tcg_ahp = get_ahp_flag();
-        tcg_gen_ext16u_i32(tcg_rn, tcg_rn);
-        if (dtype == 0) {
-            /* Half to single */
-            TCGv_i32 tcg_rd = tcg_temp_new_i32();
-            gen_helper_vfp_fcvt_f16_to_f32(tcg_rd, tcg_rn, tcg_fpst, tcg_ahp);
-            write_fp_sreg(s, rd, tcg_rd);
-        } else {
-            /* Half to double */
-            TCGv_i64 tcg_rd = tcg_temp_new_i64();
-            gen_helper_vfp_fcvt_f16_to_f64(tcg_rd, tcg_rn, tcg_fpst, tcg_ahp);
-            write_fp_dreg(s, rd, tcg_rd);
-        }
-        break;
-    }
-    default:
-        g_assert_not_reached();
+        gen_helper_vfp_fcvtds(tcg_rd, tcg_rn, tcg_env);
+        write_fp_dreg(s, a->rd, tcg_rd);
     }
+    return true;
 }
 
-/* Floating point data-processing (1 source)
- *   31  30  29 28       24 23  22  21 20    15 14       10 9    5 4    0
- * +---+---+---+-----------+------+---+--------+-----------+------+------+
- * | M | 0 | S | 1 1 1 1 0 | type | 1 | opcode | 1 0 0 0 0 |  Rn  |  Rd  |
- * +---+---+---+-----------+------+---+--------+-----------+------+------+
- */
-static void disas_fp_1src(DisasContext *s, uint32_t insn)
+static bool trans_FCVT_s_hs(DisasContext *s, arg_rr *a)
 {
-    int mos = extract32(insn, 29, 3);
-    int type = extract32(insn, 22, 2);
-    int opcode = extract32(insn, 15, 6);
-    int rn = extract32(insn, 5, 5);
-    int rd = extract32(insn, 0, 5);
+    if (fp_access_check(s)) {
+        TCGv_i32 tmp = read_fp_sreg(s, a->rn);
+        TCGv_i32 ahp = get_ahp_flag();
+        TCGv_ptr fpst = fpstatus_ptr(FPST_FPCR);
 
-    if (mos) {
-        goto do_unallocated;
+        gen_helper_vfp_fcvt_f32_to_f16(tmp, tmp, fpst, ahp);
+        /* write_fp_sreg is OK here because top half of result is zero */
+        write_fp_sreg(s, a->rd, tmp);
     }
+    return true;
+}
 
-    switch (opcode) {
-    case 0x4: case 0x5: case 0x7:
-    {
-        /* FCVT between half, single and double precision */
-        int dtype = extract32(opcode, 0, 2);
-        if (type == 2 || dtype == type) {
-            goto do_unallocated;
-        }
-        if (!fp_access_check(s)) {
-            return;
-        }
+static bool trans_FCVT_s_sd(DisasContext *s, arg_rr *a)
+{
+    if (fp_access_check(s)) {
+        TCGv_i64 tcg_rn = read_fp_dreg(s, a->rn);
+        TCGv_i32 tcg_rd = tcg_temp_new_i32();
 
-        handle_fp_fcvt(s, opcode, rd, rn, dtype, type);
-        break;
+        gen_helper_vfp_fcvtsd(tcg_rd, tcg_rn, tcg_env);
+        write_fp_sreg(s, a->rd, tcg_rd);
     }
+    return true;
+}
 
-    default:
-    do_unallocated:
-    case 0x0: /* FMOV */
-    case 0x1: /* FABS */
-    case 0x2: /* FNEG */
-    case 0x3: /* FSQRT */
-    case 0x6: /* BFCVT */
-    case 0x8: /* FRINTN */
-    case 0x9: /* FRINTP */
-    case 0xa: /* FRINTM */
-    case 0xb: /* FRINTZ */
-    case 0xc: /* FRINTA */
-    case 0xe: /* FRINTX */
-    case 0xf: /* FRINTI */
-    case 0x10 ... 0x13: /* FRINT{32,64}{X,Z} */
-        unallocated_encoding(s);
-        break;
+static bool trans_FCVT_s_hd(DisasContext *s, arg_rr *a)
+{
+    if (fp_access_check(s)) {
+        TCGv_i64 tcg_rn = read_fp_dreg(s, a->rn);
+        TCGv_i32 tcg_rd = tcg_temp_new_i32();
+        TCGv_i32 ahp = get_ahp_flag();
+        TCGv_ptr fpst = fpstatus_ptr(FPST_FPCR);
+
+        gen_helper_vfp_fcvt_f64_to_f16(tcg_rd, tcg_rn, fpst, ahp);
+        /* write_fp_sreg is OK here because top half of tcg_rd is zero */
+        write_fp_sreg(s, a->rd, tcg_rd);
     }
+    return true;
+}
+
+static bool trans_FCVT_s_sh(DisasContext *s, arg_rr *a)
+{
+    if (fp_access_check(s)) {
+        TCGv_i32 tcg_rn = read_fp_hreg(s, a->rn);
+        TCGv_i32 tcg_rd = tcg_temp_new_i32();
+        TCGv_ptr tcg_fpst = fpstatus_ptr(FPST_FPCR);
+        TCGv_i32 tcg_ahp = get_ahp_flag();
+
+        gen_helper_vfp_fcvt_f16_to_f32(tcg_rd, tcg_rn, tcg_fpst, tcg_ahp);
+        write_fp_sreg(s, a->rd, tcg_rd);
+    }
+    return true;
+}
+
+static bool trans_FCVT_s_dh(DisasContext *s, arg_rr *a)
+{
+    if (fp_access_check(s)) {
+        TCGv_i32 tcg_rn = read_fp_hreg(s, a->rn);
+        TCGv_i64 tcg_rd = tcg_temp_new_i64();
+        TCGv_ptr tcg_fpst = fpstatus_ptr(FPST_FPCR);
+        TCGv_i32 tcg_ahp = get_ahp_flag();
+
+        gen_helper_vfp_fcvt_f16_to_f64(tcg_rd, tcg_rn, tcg_fpst, tcg_ahp);
+        write_fp_dreg(s, a->rd, tcg_rd);
+    }
+    return true;
 }
 
 /* Handle floating point <=> fixed point conversions. Note that we can
@@ -8982,7 +8944,7 @@ static void disas_data_proc_fp(DisasContext *s, uint32_t insn)
                 break;
             case 2: /* [15:12] == x100 */
                 /* Floating point data-processing (1 source) */
-                disas_fp_1src(s, insn);
+                unallocated_encoding(s); /* in decodetree */
                 break;
             case 3: /* [15:12] == 1000 */
                 unallocated_encoding(s);
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 4f7b3ee3d9..211346c4d9 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1345,6 +1345,13 @@ FRINT32X_s      00011110 0. 1 010001 10000 ..... .....      @rr_sd
 FRINT64Z_s      00011110 0. 1 010010 10000 ..... .....      @rr_sd
 FRINT64X_s      00011110 0. 1 010011 10000 ..... .....      @rr_sd
 
+FCVT_s_ds       00011110 00 1 000101 10000 ..... .....      @rr
+FCVT_s_hs       00011110 00 1 000111 10000 ..... .....      @rr
+FCVT_s_sd       00011110 01 1 000100 10000 ..... .....      @rr
+FCVT_s_hd       00011110 01 1 000111 10000 ..... .....      @rr
+FCVT_s_sh       00011110 11 1 000100 10000 ..... .....      @rr
+FCVT_s_dh       00011110 11 1 000101 10000 ..... .....      @rr
+
 # Floating-point Immediate
 
 FMOVI_s         0001 1110 .. 1 imm:8 100 00000 rd:5         esz=%esz_hsd
-- 
2.43.0

