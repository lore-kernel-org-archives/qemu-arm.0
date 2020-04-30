Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2201590lfm;
        Thu, 30 Apr 2020 11:18:41 -0700 (PDT)
X-Google-Smtp-Source: APiQypKuTTWjEgQwGXJoEUg35yYL0mdTi3zQtFGX2qkJDx3ibcF+pmu9CaEAGVvzm6+Fg4nQMyBQ
X-Received: by 2002:ac8:6c24:: with SMTP id k4mr4954200qtu.257.1588270721004;
        Thu, 30 Apr 2020 11:18:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588270720; cv=none;
        d=google.com; s=arc-20160816;
        b=A9lpRAIAyPqdJFeokyZ1p3/Z9XpPksuWW/lTXFegVY8N/uF9+g7l1YXhDbJ98nwlq7
         gYS0hJAaPuxMfhl0YX1vEoeZCnLQtwZiNmy3Tb/vXuvDzBsJbZPvSZmTD87p5b7eQ7Jq
         Q4BS2jt7NTw49AIM75RkuAGvuQ6CTkCZARzzZ/9If2TuI4IRYxcw+QAyUDRj96PLIy2C
         GWzFxLR1Lgp6PB5Z37vDf62Ou9H1BqASLjmAZbQxtEMp8KHcnFkVEWEyL6h6jgYLPwbG
         fLM6l1XSQAoQ3pO6gGqR0Lg4REK3CY5z85WnOqyjy0yKFX3c9qBXQ+1umGAHkiZZ4UJ/
         A2iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=podrIWc2Sg2T1gwDLYmZIz4NN7yExiQdpITVed1EL5o=;
        b=MdoB7V3tDc6Za2xl19U2Oky5KIeLnQ31KzunnQ7izA4Q1FKG92Zfr0h5jp3pOMIkSn
         sb2l71A87MCP89PHLrsLoVk5XYI685yoGXSZyG27iHyeCws8xg97qwDA+Ykebk77k8or
         ExbZ+p2xbXBrd5I4Y1sZGi5wBCsRC0o8c66fieyHp/CeisDb3PyiFrIQXrk0+FdvWe+y
         JGd44r9tADgUF4nh+WfTsodT/dSAKn6W0FpN9xzZPL2g2CZPQcpvFFcFH9UTzf6gjLhJ
         SDPIq9JNa8hnCgvyX7SsSOdm0C7beRnCnwUMJNdG31QIFk87uXT3C8QOqc1MPlqd7KaK
         KFlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qKR+eVS9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id b10si263255qtg.328.2020.04.30.11.18.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 11:18:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qKR+eVS9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUDlg-0004zN-BC
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 14:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36186)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDe5-0001XI-FM
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:11:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDdc-0000nt-HI
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:10:49 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:54355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUDdb-0000kI-Ue
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:10:19 -0400
Received: by mail-wm1-x342.google.com with SMTP id h4so2975979wmb.4
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 11:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=podrIWc2Sg2T1gwDLYmZIz4NN7yExiQdpITVed1EL5o=;
 b=qKR+eVS9xd2Xe8Sn0TeaNcVA+4Po3Fsa+mQrf26dtaUd3CLzCGPjR+VWhEDUplgYJ0
 Z/e2/Yvm2gP/kfONJa5Z41D4e8zEb0/Ah1jAUyAMESjxVzmmF7WIecZXcUddAPiAkFvJ
 mXHxze8CvoEvfEtCMLxo6/e3dGamfyNdTK1NR/3Ldw0X2USwMuUmOKX15Z7gIJRZswBu
 BTO8Us/719U7ZEIXl74w/RGZbDQUpJBAUVqywACKZ4Q1zA/UKlKWAzR85z3CuLlQSvus
 zW3DqsSPhZIfFP7GqmKeNbm5gRTHcSRidKZty7MXPPDazxqmUZcZB4kBJ485Igr/lx8I
 91kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=podrIWc2Sg2T1gwDLYmZIz4NN7yExiQdpITVed1EL5o=;
 b=iqJJjyfnRzsS7WePdg5jn6fGJ8y7taGFCeL0qxHHoXrCcszdM9BHn1aE1YzC+vTi/1
 LVPFcRS9CIe6YFU5HbhALQuABmw9Iu8PeNUep3P1Fnodb3MDZ+C8v3f+yfzG8b1aZr/s
 ZHtB/52dK8MQ/KkbMCgtNG8Zk8tSApA431lK/YIQarz631Mg3wPSp/eEMQVuJU43DjEB
 CblDDsX2WabxQglNf7BPwxtMVJhvI9GZEoDElJ/ifPJj81GXO6xA4tCnMfbiweIt254K
 q+o0SgGFd2+bpQkA/FcIP71QrWb8i3r1kYCLfP/OYG8fY0dUE1Ahn45/Mmj79Rt6rELr
 CUfA==
X-Gm-Message-State: AGi0Pua/mBDro/OvpqDOQ8ZhnrDB0bF2c/k1xSDz9IkLy8M4NMaH/RZK
 tux6vBPPzoVEkomjohaQJeemDcIaZemh5w==
X-Received: by 2002:a1c:bd8b:: with SMTP id n133mr4522363wmf.175.1588270218239; 
 Thu, 30 Apr 2020 11:10:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t8sm652421wrq.88.2020.04.30.11.10.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 11:10:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 09/36] target/arm: Convert V[US]DOT (scalar) to decodetree
Date: Thu, 30 Apr 2020 19:09:36 +0100
Message-Id: <20200430181003.21682-10-peter.maydell@linaro.org>
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
X-TUID: 7I2bqlXMD+6h

Convert the V[US]DOT (scalar) insns in the 2reg-scalar-ext group
to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-neon.inc.c | 35 +++++++++++++++++++++++++++++++++
 target/arm/translate.c          | 13 +-----------
 target/arm/neon-shared.decode   |  3 +++
 3 files changed, 39 insertions(+), 12 deletions(-)

diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 92eccbf8236..7cc6ccb0697 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -207,3 +207,38 @@ static bool trans_VCMLA_scalar(DisasContext *s, arg_VCMLA_scalar *a)
     tcg_temp_free_ptr(fpst);
     return true;
 }
+
+static bool trans_VDOT_scalar(DisasContext *s, arg_VDOT_scalar *a)
+{
+    gen_helper_gvec_3 *fn_gvec;
+    int opr_sz;
+    TCGv_ptr fpst;
+
+    if (!dc_isar_feature(aa32_dp, s)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_simd_r32, s) &&
+        ((a->vd | a->vn) & 0x10)) {
+        return false;
+    }
+
+    if ((a->vd | a->vn) & a->q) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    fn_gvec = a->u ? gen_helper_gvec_udot_idx_b : gen_helper_gvec_sdot_idx_b;
+    opr_sz = (1 + a->q) * 8;
+    fpst = get_fpstatus_ptr(1);
+    tcg_gen_gvec_3_ool(vfp_reg_offset(1, a->vd),
+                       vfp_reg_offset(1, a->vn),
+                       vfp_reg_offset(1, a->rm),
+                       opr_sz, opr_sz, a->index, fn_gvec);
+    tcg_temp_free_ptr(fpst);
+    return true;
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index b82e54b7b23..af2714292ea 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7049,18 +7049,7 @@ static int disas_neon_insn_2reg_scalar_ext(DisasContext *s, uint32_t insn)
     bool is_long = false, q = extract32(insn, 6, 1);
     bool ptr_is_env = false;
 
-    if ((insn & 0xffb00f00) == 0xfe200d00) {
-        /* V[US]DOT -- 1111 1110 0.10 .... .... 1101 .Q.U .... */
-        int u = extract32(insn, 4, 1);
-
-        if (!dc_isar_feature(aa32_dp, s)) {
-            return 1;
-        }
-        fn_gvec = u ? gen_helper_gvec_udot_idx_b : gen_helper_gvec_sdot_idx_b;
-        /* rm is just Vm, and index is M.  */
-        data = extract32(insn, 5, 1); /* index */
-        rm = extract32(insn, 0, 4);
-    } else if ((insn & 0xffa00f10) == 0xfe000810) {
+    if ((insn & 0xffa00f10) == 0xfe000810) {
         /* VFM[AS]L -- 1111 1110 0.0S .... .... 1000 .Q.1 .... */
         int is_s = extract32(insn, 20, 1);
         int vm20 = extract32(insn, 0, 3);
diff --git a/target/arm/neon-shared.decode b/target/arm/neon-shared.decode
index c11d755ed14..63a46c63c07 100644
--- a/target/arm/neon-shared.decode
+++ b/target/arm/neon-shared.decode
@@ -54,3 +54,6 @@ VCMLA_scalar   1111 1110 0 . rot:2 .... .... 1000 . q:1 index:1 0 vm:4 \
                vn=%vn_dp vd=%vd_dp size=0
 VCMLA_scalar   1111 1110 1 . rot:2 .... .... 1000 . q:1 . 0 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp size=1 index=0
+
+VDOT_scalar    1111 1110 0 . 10 .... .... 1101 . q:1 index:1 u:1 rm:4 \
+               vm=%vm_dp vn=%vn_dp vd=%vd_dp
-- 
2.20.1

