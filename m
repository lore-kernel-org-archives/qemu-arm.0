Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2200485lfm;
        Thu, 30 Apr 2020 11:17:36 -0700 (PDT)
X-Google-Smtp-Source: APiQypKFGOpiDFhUrRldBLoH6ziBWL5t2ju0rSSfQB8VxJO5MmsVh5i9HfYvVPEOvHcQAkmnQf1M
X-Received: by 2002:ae9:e011:: with SMTP id m17mr4990794qkk.103.1588270656309;
        Thu, 30 Apr 2020 11:17:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588270656; cv=none;
        d=google.com; s=arc-20160816;
        b=u717j4cQ+sgpBF21Xtq1LMbJrhDUm2mZB6hUZusYdVKV/ogTA3xXcoXk5HPHM0eK45
         sde3tYNE/xALCNm+PSj3/ye6tx9G2SEYxkP/l8d1kiseKObgpjtNNisNGjQ4+IqsJTOm
         N5u1oA+nc5LzHYvAuzKApEdfW0nB1l3gl33jE3Ptg1RI4nw2l/R+9rdgX+G/K5NyipFv
         gtVyfQqDMbYsFEoF2cHmtqQS/mC4XS5DH4cmMgJ8hXuG+dGtJH1M1xuGihmONDtG3PHf
         OkBJWbM3Vu9tIf4a8XFzCdb9kp0Ojj/eRZyfFpAHeyY76tLDszn+QdIBxeyZRjt5aXDj
         0BcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pxfsuF90gF/QlbN2JtQ5HjFSNuD7mNzJPj+VVM2zoKo=;
        b=S/GxNVyjkZ/jcVcO7Ujq7HSk/JKBOM+SFWocF8jpiI9i7Rq81lp4ch7OkjYMeLW3PG
         kzyV+VESqiWHzDhyiMYqMYUtjRiSuOSO+a/ZY+nWIUNGKEtQNS884BfaKB1MKGdpiuNS
         lSTFu9R6xMS4FfhwASsz5zlWgypKmm9CN12v3iVwAU+8YIG0XSp59O/uAvB4zk2CfdC5
         iRqRVdTFwSIBLf6sHJt9Uulyz/DQmvWj0HHPj6+plY+urTyBo5ciK8FqSGDH1s7SUmIj
         Qskhv70lLMup3p00n5xoepitP4Y2iHwRw3pzru6K5trDSW56jFdzc84nDKjQW2CRBAvD
         g75Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cwZPcSth;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id 6si290957qth.171.2020.04.30.11.17.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 11:17:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cwZPcSth;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUDkd-000451-Kf
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 14:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36116)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDdz-0001QN-03
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:11:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDdc-0000ll-6h
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:10:42 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:55755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUDdY-0000Vh-3I
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:10:16 -0400
Received: by mail-wm1-x342.google.com with SMTP id e26so2975057wmk.5
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 11:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pxfsuF90gF/QlbN2JtQ5HjFSNuD7mNzJPj+VVM2zoKo=;
 b=cwZPcSthHybqTQCL3yyXcxaqrdS+/yNB03OCiNsLxoGAgCtofedkUWy4//0ZDRIzG/
 ZMg6lxJUMBw3XmCTaneK1318a8nQZMlBl7QLLq3Mzl22x8ccAU++uQfG5kSOuaTu4+KB
 gBBfstJDRJiC865ATcltSgo0R45Lb1vF1n19d83/iLKLMJUvQ9v/I17xcah07wKyAmx0
 MAYZMgjBebzdws7AxXVCrpJdK5cdlgB0XbF/EwWAR+Kz9pEQEMlY7YPJZqu79sgaffiq
 IVoYrh+7lSwifSgDhRyc56odpb/TP6AJQWuI1+/p4jW3qjbLZD0b+Q4mD31d7TpnPTuQ
 BJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pxfsuF90gF/QlbN2JtQ5HjFSNuD7mNzJPj+VVM2zoKo=;
 b=ECKOAZxIx8E2BFs/isN5q/SfOWJRYN55O4ikgG6Gb40/VzEuXmnHK59PwJFUBNH+lL
 BkVcqVySR6O/itfZX4gEJcEYyhm5Zqsr288QbPRJmAkSpKJq65P5OMc7P0s4CvRoC8UI
 g69oG6LMAU1iQ8B4aAG+at/bprse2j4f4DnGLneMqj+IOQMpEm+/nML1gkFfztKl3Dyg
 gvgJAnRqOvn2FFIWvHVYIYAPoNEtlfUA1uSQdPr5NaLhHY+hidUr2gcxmspnPKSfv30d
 GAk9GH+ha+EIX85isdr2tFGNxcgFSJxBIb701Y6qqpWSNaHeO1t6YwXPxDxpTIGLV4Cn
 DR5A==
X-Gm-Message-State: AGi0Pub/wfKgSqS00PmnjF2xDX4UEguQVe8bvFuKP53M+DlIpXcOo7m2
 k+Q1WNP5YCALXHyutd8APgtLxxIx0eKcsQ==
X-Received: by 2002:a1c:8141:: with SMTP id c62mr4305922wmd.87.1588270214400; 
 Thu, 30 Apr 2020 11:10:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t8sm652421wrq.88.2020.04.30.11.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 11:10:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 06/36] target/arm: Convert V[US]DOT (vector) to decodetree
Date: Thu, 30 Apr 2020 19:09:33 +0100
Message-Id: <20200430181003.21682-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200430181003.21682-1-peter.maydell@linaro.org>
References: <20200430181003.21682-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::342
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
X-TUID: E6Z+9o+hOvHy

Convert the V[US]DOT (vector) insns to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-neon.inc.c | 32 ++++++++++++++++++++++++++++++++
 target/arm/translate.c          |  9 +--------
 target/arm/neon-shared.decode   |  4 ++++
 3 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 28011e88d9e..6537506c5b6 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -104,3 +104,35 @@ static bool trans_VCADD(DisasContext *s, arg_VCADD *a)
     tcg_temp_free_ptr(fpst);
     return true;
 }
+
+static bool trans_VDOT(DisasContext *s, arg_VDOT *a)
+{
+    int opr_sz;
+    gen_helper_gvec_3 *fn_gvec;
+
+    if (!dc_isar_feature(aa32_dp, s)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_simd_r32, s) &&
+        ((a->vd | a->vn | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if ((a->vn | a->vm | a->vd) & a->q) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    opr_sz = (1 + a->q) * 8;
+    fn_gvec = a->u ? gen_helper_gvec_udot_b : gen_helper_gvec_sdot_b;
+    tcg_gen_gvec_3_ool(vfp_reg_offset(1, a->vd),
+                       vfp_reg_offset(1, a->vn),
+                       vfp_reg_offset(1, a->vm),
+                       opr_sz, opr_sz, 0, fn_gvec);
+    return true;
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 571b64aa89d..1190ad17cfd 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7048,14 +7048,7 @@ static int disas_neon_insn_3same_ext(DisasContext *s, uint32_t insn)
     bool is_long = false, q = extract32(insn, 6, 1);
     bool ptr_is_env = false;
 
-    if ((insn & 0xfeb00f00) == 0xfc200d00) {
-        /* V[US]DOT -- 1111 1100 0.10 .... .... 1101 .Q.U .... */
-        bool u = extract32(insn, 4, 1);
-        if (!dc_isar_feature(aa32_dp, s)) {
-            return 1;
-        }
-        fn_gvec = u ? gen_helper_gvec_udot_b : gen_helper_gvec_sdot_b;
-    } else if ((insn & 0xff300f10) == 0xfc200810) {
+    if ((insn & 0xff300f10) == 0xfc200810) {
         /* VFM[AS]L -- 1111 1100 S.10 .... .... 1000 .Q.1 .... */
         int is_s = extract32(insn, 23, 1);
         if (!dc_isar_feature(aa32_fhm, s)) {
diff --git a/target/arm/neon-shared.decode b/target/arm/neon-shared.decode
index ed65dae1809..c9c641905d3 100644
--- a/target/arm/neon-shared.decode
+++ b/target/arm/neon-shared.decode
@@ -39,3 +39,7 @@ VCMLA          1111 110 rot:2 . 1 size:1 .... .... 1000 . q:1 . 0 .... \
 
 VCADD          1111 110 rot:1 1 . 0 size:1 .... .... 1000 . q:1 . 0 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp
+
+# VUDOT and VSDOT
+VDOT           1111 110 00 . 10 .... .... 1101 . q:1 . u:1 .... \
+               vm=%vm_dp vn=%vn_dp vd=%vd_dp
-- 
2.20.1

