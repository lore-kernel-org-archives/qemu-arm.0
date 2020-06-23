Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4350363lfm;
        Tue, 23 Jun 2020 12:52:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFpU/katGADtQ/iNuELz0kItiyEUciRKvCmeVrvGOLpgbD9Fdi2kWpof5xDoM0Ie+VTZmS
X-Received: by 2002:a25:1085:: with SMTP id 127mr36931333ybq.254.1592941974268;
        Tue, 23 Jun 2020 12:52:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592941974; cv=none;
        d=google.com; s=arc-20160816;
        b=tRR4nfKQDxBOIc9EAD/Lxx/cdpXKWn2pg4TrBFd7r/PguIL+WhwbvcOBsx/G+efpmR
         dxRTmmyud1Mm0jUxNyZ93dQo/Oyt0pm/z+mNfANm9huO5XA8lAdiLK6dkYrR44rR/Y/l
         FlPZWyD0uTcIYzlrN0vr2C0ZujPZKSQYq8Nobip9jiy7GVoXeWywCwHLpRsPJ59O8YDg
         aYEn3e4Xx0/ovxt5cccJBMiAB2ILJkmHDo7AjwNn5m69RQAJMREIsFf3Q/V1763a8Csp
         mt5RYn/3SW+ct/cy53phP9H9CGfSA8Orid67Rdyrjzsxsg5a0k9xMgRUWxRkCgCXNdcq
         /h5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=x8aLnTbJaNLIaCAiz76x9Qe9dWMjhM4HvVRSF6yOJsA=;
        b=N8w3itvX//ZIPOTTq6ngvutuij6eJppU6O0u+Gtg51t2mE60Q6C8YYXdA5ha3IHEGW
         n3VCMuIVqDzU8Gfqr4SbOcUtnb22K9O2lxi4CqIvf1PFVFsj7tuAV1XaLpnwXVeyafrb
         m+N8qswkJapqYgllxNUFm4PYU7VMJkxCXYRFK4mJn/zCmpbdJZ9WFHgv1/DQdeUAyLSu
         zWSqq/iuGAGcNrXNoR4iWpki8bLg9pXopv7XxDUt9x9K2aPBNmhljLO1leyOu/afSjsk
         H7vbwxTgkWckGEl++8Jq6QAFImPk9QTo/gM8dLY2IWC5GPne0rEHIgSjk9hVAhnx0nWd
         KnxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GcBxor4W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c84si16805016ybf.33.2020.06.23.12.52.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 12:52:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GcBxor4W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnoyT-0007nR-LV
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 15:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnok0-00052a-QG
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:56 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:40123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojv-0005su-7N
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:56 -0400
Received: by mail-pj1-x1044.google.com with SMTP id cm23so1955709pjb.5
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2020 12:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x8aLnTbJaNLIaCAiz76x9Qe9dWMjhM4HvVRSF6yOJsA=;
 b=GcBxor4WIP3+Ief5TrQJb9n5RvCon3vQJ2ucPPEstnKSu09KllXQqe/uqHGlcNwZS1
 s9Qgsx/L70jdi6kPCkVB5CtorO10gw9YUN8WPs+6ULapqxik9iSddip7Ge1GkZF+fmt5
 QppPfqryLrj8N7YAkHn4BHHMxBvuXcnJgc9uOYa0B8VC5rCYaKNCZUr+STvLULPWUy23
 9Si05+bPTMiHukfQe7oMx9x4o2moLspgti/zYOOwd0bFAT5J54l/BT1oFLIUT90H3i1P
 Ebhz7Bb3yogW5ZwPMbry1TmVUlthk8lUPwPDvBZRH46fCcpSeog7vJjNwUdczZ8AEyav
 lM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x8aLnTbJaNLIaCAiz76x9Qe9dWMjhM4HvVRSF6yOJsA=;
 b=MFmOLINyJ6lkUp5ahQqZGXSqyalDXDkwRP8IXtx1alN2/P/fYNhLVcPWzHl3p9BxOe
 A+jP16yR/dlZO7EfbUSnyWP2GGiVGTe5UF8InJUJlOWKo2Bx6QTJ6iSET41unltyLwmD
 2Ugr+J0iQpOniX/ZL2ELqREbC0zDsYih+ByGBlNKs8gCEB2fyBuHjCaG8iPxfHtfgpLe
 BU3xKXy/cpgsVKZUUThk1j1taqzciRYJS2i+eW8LShNZ+RPfrCkhjzgKGsxqdDWOaC9n
 f9Q/0co8UGRT0/5czxySprAbTYVjI8LXZCijXoeidZNHHfIKsV7b9NapiSb6T90s26lK
 I+7A==
X-Gm-Message-State: AOAM531rSGu/zwrlbZllXSViSxxVnd/gkORG7HD2wEOqzO2SN7jXdLDa
 NTO63fjdFsVBfTF3RBMyfGmlJg==
X-Received: by 2002:a17:902:aa92:: with SMTP id
 d18mr25328419plr.210.1592941069985; 
 Tue, 23 Jun 2020 12:37:49 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p12sm17927642pfq.69.2020.06.23.12.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 12:37:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 36/45] target/arm: Handle TBI for sve scalar + int memory
 ops
Date: Tue, 23 Jun 2020 12:36:49 -0700
Message-Id: <20200623193658.623279-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200623193658.623279-1-richard.henderson@linaro.org>
References: <20200623193658.623279-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CgHNLWvqygCT

We still need to handle tbi for user-only when mte is inactive.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h | 1 +
 target/arm/translate-a64.c | 2 +-
 target/arm/translate-sve.c | 6 ++++--
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 781c441399..49e4865918 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -40,6 +40,7 @@ TCGv_ptr get_fpstatus_ptr(bool);
 bool logic_imm_decode_wmask(uint64_t *result, unsigned int immn,
                             unsigned int imms, unsigned int immr);
 bool sve_access_check(DisasContext *s);
+TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr);
 TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
                         bool tag_checked, int log2_size);
 TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ec2295393d..f35b122ded 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -215,7 +215,7 @@ static void gen_a64_set_pc(DisasContext *s, TCGv_i64 src)
  * of the write-back address.
  */
 
-static TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr)
+TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr)
 {
     TCGv_i64 clean = new_tmp_a64(s);
 #ifdef CONFIG_USER_ONLY
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e4fbe48493..04eda9a126 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4587,9 +4587,8 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
      * For e.g. LD4, there are not enough arguments to pass all 4
      * registers as pointers, so encode the regno into the data field.
      * For consistency, do this even for LD1.
-     * TODO: mte_n check here while callers are updated.
      */
-    if (mte_n && s->mte_active[0]) {
+    if (s->mte_active[0]) {
         int msz = dtype_msz(dtype);
 
         desc = FIELD_DP32(desc, MTEDESC, MIDX, get_mem_index(s));
@@ -4599,7 +4598,10 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
         desc = FIELD_DP32(desc, MTEDESC, ESIZE, 1 << msz);
         desc = FIELD_DP32(desc, MTEDESC, TSIZE, mte_n << msz);
         desc <<= SVE_MTEDESC_SHIFT;
+    } else {
+        addr = clean_data_tbi(s, addr);
     }
+
     desc = simd_desc(vsz, vsz, zt | desc);
     t_desc = tcg_const_i32(desc);
     t_pg = tcg_temp_new_ptr();
-- 
2.25.1

