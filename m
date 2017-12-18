Received: by 10.223.159.74 with SMTP id f10csp2941069wrg;
        Mon, 18 Dec 2017 09:53:41 -0800 (PST)
X-Google-Smtp-Source: ACJfBouF2V8W83Ui8XLi6oxkT4ZMHEib/vE9p+AJc5QTHZeWsPEm5mPsEa13q6eZhHH7HrCHhso8
X-Received: by 10.129.152.134 with SMTP id p128mr453019ywg.438.1513619621896;
        Mon, 18 Dec 2017 09:53:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513619621; cv=none;
        d=google.com; s=arc-20160816;
        b=fiolT8Gy2PsJAmSM4Bci+NEWlaT8zVkBEheGWAAHUN7FvOXkgcWeXOWyTfLzuOYw2a
         U0b2nOkIRCqKPKo804JiI3L1t9374eUe1UOixthRLHbFvXMpffRUJZ+RGj9hmfCsKkQ5
         3LZz+PZJgezL7UBwURaZh+CMoMqWZGl77hn9y5/5mI9wQMm9/++M/Hv5NEAGSXHBP5dU
         KxGh9O+zSDrfXZZsEcUfHQ7eMjczgux4EhOyIgjvykvUmArqZ0SOcnINUWIS8C2oZp5o
         ME3aTeK3TnxwbJUL6l1SnKB8+0mlpglg1biPcZ+jC8PjWpVTU8aB4RGJ29yyG7+C2ERA
         0U5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Myp9fkSqrmzznPYOC9jsry5QE/dwryl0WIBa1icRWk0=;
        b=vysiSYyioFwj415IUYrdJQFlosYHFicSKrMAPVwolrz7KWg3ptl41z47x8qiCglwPg
         kLGaqdUOB2/dIgJqLrurbzaISvSTLTkHeyKlXPLlu64s+T/mjXgSTe3JR7RzH+FnNP0A
         IleVZzJtVvTW1++Pi+tQmjeLzoAJDs5Q09pKnMOTWiKzp7hSZGLd5fpaxs2jPE4nW0pb
         jkas0bR5C+ybADqvcUPSk1W9T84iu87ljSXpSqaSWICIe922BkXS2g0N9qnDTGGOQCjK
         WpR+xgNduQCBRfFzVnMKI1N+Ehh/1beiGWMYI6EL/eAs78vnBpIN6PZGRyYsML7DUK8G
         0ckw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cyWnPE55;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q10si2480865ywj.15.2017.12.18.09.53.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 09:53:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cyWnPE55;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59403 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eQzbh-0006db-Bi
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 12:53:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41152)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQz9g-00064d-C8
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:24:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQz9f-0008Jz-Eg
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:24:44 -0500
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:41859)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eQz9f-0008JK-9k
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:24:43 -0500
Received: by mail-pl0-x242.google.com with SMTP id g2so5211621pli.8
	for <qemu-arm@nongnu.org>; Mon, 18 Dec 2017 09:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Myp9fkSqrmzznPYOC9jsry5QE/dwryl0WIBa1icRWk0=;
	b=cyWnPE55v3qlt/Q7zum+OutQTe8/u8iiwVtZk7ueu+LQjIN0SKsAc1pQY6XwQEzC4y
	aaF1f/AURDlsbpQVIZ9GTnArcNhhmgFkt2erLTJRx6a987werKoi0hiqjC47O6apMLQo
	Xo1QKdhrdsOQ/SnJdgvakDgdTI3Pw8WfQ0oJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Myp9fkSqrmzznPYOC9jsry5QE/dwryl0WIBa1icRWk0=;
	b=DT3E7VR+HKC8+hWQbp8UEMJfpuCQDpnbKrOUx9u5GGrnr98l3ifTIS1r7U+Go0vcT6
	x2PorYjnao8VHEWpWEqmNg21z6lYRcCu4fzZExx2LGstnZmiSVSUSIgSgH7ul0GOJxZD
	6peBkxoYIwOgPCCy3OvWUVvYRmjbO4ODMtx4389YvCFULXrwQ7qK4FoOAo2zDRz/TqQG
	11tSdvWQSwahTj/eT2EuNslWI1x2FAr6d88ceph1LxnDysWCu9GJ2j+z3U0rsfM1oVbz
	gss285IB45ucUCf/g4mY5toFMiDq9/jYvjxQRbUTVuJFA0nTLkt+45/6+K0r0CS8Wg1W
	PXCg==
X-Gm-Message-State: AKGB3mLea65O1wPsIXYlof5S+5R0+EE4dxsnBZfNdMXGke2JcgSl2Y2T
	gQAMNJuomYwM2jYaacFpOKSQqg==
X-Received: by 10.84.177.129 with SMTP id x1mr405716plb.217.1513617882392;
	Mon, 18 Dec 2017 09:24:42 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-7-63.tukw.qwest.net.
	[174.21.7.63])
	by smtp.gmail.com with ESMTPSA id m10sm9260469pgs.4.2017.12.18.09.24.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 09:24:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 18 Dec 2017 09:24:24 -0800
Message-Id: <20171218172425.18200-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171218172425.18200-1-richard.henderson@linaro.org>
References: <20171218172425.18200-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: [Qemu-arm] [PATCH v2 10/11] target/arm: Decode aa32 armv8.3 3-same
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kJMoJ7xNdjvk

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 1a0b0eaced..e57844c019 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7662,6 +7662,65 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
     return 0;
 }
 
+/* ARMv8.3 reclaims a portion of the LDC2/STC2 coprocessor 8 space.  */
+
+static int disas_neon_insn_cp8_3same(DisasContext *s, uint32_t insn)
+{
+    void (*fn_gvec_ptr)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
+    int rd, rn, rm, rot, size, opr_sz;
+    TCGv_ptr fpst;
+    bool q;
+
+    /* FIXME: this access check should not take precedence over UNDEF
+     * for invalid encodings; we will generate incorrect syndrome information
+     * for attempts to execute invalid vfp/neon encodings with FP disabled.
+     */
+    if (s->fp_excp_el) {
+        gen_exception_insn(s, 4, EXCP_UDEF,
+                           syn_fp_access_trap(1, 0xe, false), s->fp_excp_el);
+        return 0;
+    }
+    if (!s->vfp_enabled) {
+        return 1;
+    }
+    if (!arm_dc_feature(s, ARM_FEATURE_V8_FCMA)) {
+        return 1;
+    }
+
+    q = extract32(insn, 6, 1);
+    size = extract32(insn, 20, 1);
+    VFP_DREG_D(rd, insn);
+    VFP_DREG_N(rn, insn);
+    VFP_DREG_M(rm, insn);
+    if ((rd | rn | rm) & q) {
+        return 1;
+    }
+
+    if (extract32(insn, 21, 1)) {
+        /* VCMLA */
+        rot = extract32(insn, 23, 2);
+        fn_gvec_ptr = size ? gen_helper_gvec_fcmlas : gen_helper_gvec_fcmlah;
+    } else if (extract32(insn, 23, 1)) {
+        /* VCADD */
+        rot = extract32(insn, 24, 1);
+        fn_gvec_ptr = size ? gen_helper_gvec_fcadds : gen_helper_gvec_fcaddh;
+    } else {
+        /* Assuming the register fields remain, only bit 24 remains undecoded:
+         * 1111_110x_0d0s_nnnn_dddd_1000_nqm0_mmmm
+         */
+        return 1;
+    }
+
+    opr_sz = (1 + q) * 8;
+    fpst = get_fpstatus_ptr(1);
+    tcg_gen_gvec_3_ptr(vfp_reg_offset(1, rd),
+                       vfp_reg_offset(1, rn),
+                       vfp_reg_offset(1, rm), fpst,
+                       opr_sz, opr_sz, rot, fn_gvec_ptr);
+    tcg_temp_free_ptr(fpst);
+    return 0;
+}
+
 static int disas_coproc_insn(DisasContext *s, uint32_t insn)
 {
     int cpnum, is64, crn, crm, opc1, opc2, isread, rt, rt2;
@@ -8406,6 +8465,12 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                     }
                 }
             }
+        } else if ((insn & 0x0e000f10) == 0x0c000800) {
+            /* ARMv8.3 neon ldc2/stc2 coprocessor 8 extension.  */
+            if (disas_neon_insn_cp8_3same(s, insn)) {
+                goto illegal_op;
+            }
+            return;
         } else if ((insn & 0x0fe00000) == 0x0c400000) {
             /* Coprocessor double register transfer.  */
             ARCH(5TE);
-- 
2.14.3

