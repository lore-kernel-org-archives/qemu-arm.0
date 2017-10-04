Received: by 10.223.197.9 with SMTP id q9csp5938743wrf;
        Wed, 4 Oct 2017 11:53:16 -0700 (PDT)
X-Received: by 10.200.43.110 with SMTP id 43mr17908055qtv.255.1507143196626;
        Wed, 04 Oct 2017 11:53:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507143196; cv=none;
        d=google.com; s=arc-20160816;
        b=AZX5kvDYBePTqJrino0iRr+Sx5QGCxq5WbQ7EowppjE656DLUDI+jPux0IqZmmFQ9A
         UcWeZmRORTnE5INGVsBoyy9yeQqnc20ewcMBMQfSu2DLmBWYaHhyC9dZVc7Lk7jJBYBr
         DDpV1EiRMqUZT4LpJuS5Z16kgJE2dLG2rtMYZhA17GQ+ANgQGcomrS4MkANzPzby6h2h
         56buPzrWKvQHaEXlvqQKA5Km9PIKku2WzXwGnp1VCnTPSCTakwv+JFIkpXB5t49uFJ4z
         I83XdKiWsJ8Jsk7r7mFzwIQ1P27g62hhxAjX1te+m4XdUPhMEqCXga+Y/rh107MRKGYv
         Ki7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=D7rb8sEpg57Abfpq/Hs+zG/oGldB+7gmKb7zTbQn9qs=;
        b=mQ/Yh785vCbp0KUBKipMEuJnZ0xwyke10W1ybssP5kyBJhHd7Eq1F5UH5GxajzYBfx
         ulWLE14KbmAFawQ/LiXS0sP7fz3EMDOUly0vnqlPkEjx1gcZCy6bkWKlpjNDV2lPXUns
         HaBW+XyyMlKlxTx6YpqPr8UoVUKzVFmhFeBA3/Gxl5h0M3mLpBkPE/UAjjbeewhggPLc
         bR1EkWBGXjPJdSR7qr6o6qVG8wMUHKwaAAQZ3T5JfYBT0mOrCDua6FwHdOvE8DhZjtNx
         Tyf7CCFwxY88WY8Nci5h6JwbHOhHzTJ6mL8uJ6rAqOZlj0HTKr5ts/I51aA7UDDkGu66
         qYkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DbiCmeac;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id p3si844723qtg.223.2017.10.04.11.53.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Oct 2017 11:53:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DbiCmeac;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36477 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dzonE-0007pF-3Y
	for alex.bennee@linaro.org; Wed, 04 Oct 2017 14:53:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38336)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dzoe2-0008Jt-Ih
	for qemu-devel@nongnu.org; Wed, 04 Oct 2017 14:43:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dzoe1-0002rs-Ns
	for qemu-devel@nongnu.org; Wed, 04 Oct 2017 14:43:46 -0400
Received: from mail-qt0-x234.google.com ([2607:f8b0:400d:c0d::234]:51667)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dzoe1-0002rI-Jd
	for qemu-devel@nongnu.org; Wed, 04 Oct 2017 14:43:45 -0400
Received: by mail-qt0-x234.google.com with SMTP id q4so21062241qtq.8
	for <qemu-devel@nongnu.org>; Wed, 04 Oct 2017 11:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=D7rb8sEpg57Abfpq/Hs+zG/oGldB+7gmKb7zTbQn9qs=;
	b=DbiCmeacsPI6hu5+SiNN1nwqhp4IfLsJ2S+t7nA0fQeu00J4GYliajqmwT5bJqfAmJ
	lgfdgU4anWlyYHdj3NgEbrdvHey/6mJxqSRPyH+9fH+FRuNUwrUPEgSLYvv280nh+2Rx
	OHst/f2rZM1SIq6WQ1M8steLC3VFCaHLT2PnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=D7rb8sEpg57Abfpq/Hs+zG/oGldB+7gmKb7zTbQn9qs=;
	b=T4r9yM1kdjqhPvdwiXDUQ4d+G86fI+XlD3iScNMs7/s470uP16EMCOJG874iR3sl2A
	ZgV93m9s1WRdDmIFTKspsg0ddeyAjX/wA0/RUVc5yLlZyWe/2ITEleh93PZe1HGmfCyt
	L9B5MtnDKXooDGcAEisiNfYPGHo8YA0MTOji3idKaXFYLQoGd7z1B1Y5Z7EhNWJ6LBFm
	7ZEPKV9mFsCKDeqhhpti+aLerGYtyzAWT/1XGKanjFIOI2HfvORRDvILQ67bKhaZquQX
	7iS3M2nYCTan1FuxEZJTmv9REf7oRbiP/WfvuTh8pMu6FRZRnQ6MuvkhK0LErSMDhssl
	HbWw==
X-Gm-Message-State: AHPjjUiX4idjQkiDliSp+SV2fyqnP5lycRfaIso7va4o4nxv6WTaihNT
	xo6kI5BPRfLUfpgUS+pwEbv06HC4vTY=
X-Google-Smtp-Source: AOwi7QAY2yEMV6UZza/5+B+PjaLE7nxLIBJ8uTMK9HWTiJUho6iex+qZWBwL3f0YCHqyBWb6ieaLSQ==
X-Received: by 10.129.74.87 with SMTP id x84mr18233827ywa.81.1507142624664;
	Wed, 04 Oct 2017 11:43:44 -0700 (PDT)
Received: from bigtime.twiddle.net.com ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id
	o64sm3020464ywe.12.2017.10.04.11.43.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 04 Oct 2017 11:43:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Oct 2017 14:43:24 -0400
Message-Id: <20171004184325.24157-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171004184325.24157-1-richard.henderson@linaro.org>
References: <20171004184325.24157-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::234
Subject: [Qemu-devel] [PATCH v1 11/12] target/arm: Decode aa32 armv8.3 3-same
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t5MUftYWKj7a

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index ee1e364fb5..48f30e2621 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7630,6 +7630,69 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
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
+    if (size == 0) { /* FIXME: fp16 support */
+        return 1;
+    }
+
+    if (extract32(insn, 21, 1)) {
+        /* VCMLA */
+        rot = extract32(insn, 23, 2);
+        fn_gvec_ptr = gen_helper_gvec_fcmlas;
+    } else if (extract32(insn, 23, 1)) {
+        /* VCADD */
+        rot = extract32(insn, 24, 1);
+        fn_gvec_ptr = gen_helper_gvec_fcadds;
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
@@ -8345,6 +8408,12 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
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
2.13.6

