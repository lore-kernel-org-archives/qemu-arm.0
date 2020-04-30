Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2211037lfm;
        Thu, 30 Apr 2020 11:27:50 -0700 (PDT)
X-Google-Smtp-Source: APiQypIVFDs33brgJGIMdgAsQ9pi7So5mlaP94M/OuTZSmn3Lt6UFoV2e3QVZTpA01y011uw+3LK
X-Received: by 2002:aed:2542:: with SMTP id w2mr5146846qtc.43.1588271270257;
        Thu, 30 Apr 2020 11:27:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588271270; cv=none;
        d=google.com; s=arc-20160816;
        b=HdApWCuPdOmxwkgGzBmGB1FiyKtHnYwoHQ71X06deBE8htFOn3inf5anBO/proqEG0
         cCn53vs6u5E7eVpId2TqYxT5p3Dnag4BhlZFBZr4TTFvs+3pfhIzzqm+yz9zNqW2eLcM
         A+wyE8/mAOy5JZW+/5VzG3aqje8hmYE/olR+PMGu0QDGmbKEHumhHYjeY9Qe2KGlN4/H
         mUHsuNRT91QOBh9z3rXRECiGRhVK0FiCoS5S2VO8Yh22eDr6o+ZoxiEp6UuAXJtsV/Rv
         1VjfjIOBsMlfJdTAkg/tD+W9PKxx2TAGyMKXMSq2/gJMwa9JE6yYOKY8fnr8EkzPyhc3
         wYnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gCVovwKxXypZUnAhID6Hfz/S5fE2/epvyEFf8xPlaPE=;
        b=OQbAM5q2gvXkwNW2iWzp/m3tX0IR0/DJfJ8CD3ooM8NfzAfhRkPmvLYsv3eR7oprry
         uigJ+4LOy3XjUqjTODa0EqjGehc8WOBpwfZhaWXEc5v1dR9exgrkvonL7OLjIycA0gIn
         2EVT0fq4D+eCK8SM9POqqhtne0+j6uxAjhBpYo+Rmj+VPy1K+ucENMzczcSLhXS21134
         OCFROnTq/AVOtqAMmzsrlas80iV3SQsKrqq0mkEjTYDpwxmSytzNorO+Gy5SPhwG9V7p
         rWPbxEKZaTIfg9sm1bDPDB2ie9S+I+JWjJgkmLVTRL3awUPYQViegAdv1haiT7TwR8wQ
         N/Yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AyNAyUz3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id i19si324538qvu.43.2020.04.30.11.27.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 11:27:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AyNAyUz3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUDuX-0001e3-JK
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 14:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36336)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDeH-0001nQ-RH
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:11:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDdn-0001CK-Io
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:11:01 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:34861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUDdn-0001Bp-3k
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:10:31 -0400
Received: by mail-wm1-x341.google.com with SMTP id r26so3081205wmh.0
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 11:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gCVovwKxXypZUnAhID6Hfz/S5fE2/epvyEFf8xPlaPE=;
 b=AyNAyUz3IwmAVdTLv8WJ5f/oWKKJqbSIt6kBEbA57zG8eL9JvNOQpqYRpQ3yGlIx4+
 foIyUkXJDakIm+V7gBaM3eLQPbQjflR4rmFSF8mIcKEV841mUR5B2IAUhcmQvpx/LhJx
 DJbMkw3jtfpFC+Ikmfx8K1IOv7Ar4bsXUMnTSODCBzAZS/4sHB9lYxZpwKNp6RFLwF8/
 Ttglr6rXokYjSrlHH0GSAsKEkZkALQ0KAVs/nrmACzyuVAgGUuSp2LuMoByV7xLjBFG0
 2QAAtAeaclcsFMpBLHQrJAGL5fiSbYXZQCfQ7MqBwvUeU6HCCQmTpTDSbNhyOd0KblSk
 uQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gCVovwKxXypZUnAhID6Hfz/S5fE2/epvyEFf8xPlaPE=;
 b=T/WO4NLxkwyR8JUtJr+PiIK/kky9jD0+hUJyG44iaazNCaQepOoWBCVHY1lsVcFrIg
 vMJkN2a8JKfhFEr/+kC+i31B/ytT2TCViaj0vcnotaIstFTMs7ujTEgatKYm4PAnf36K
 h0ghJFcioO0jK4ZxHl+D5rIhkeylMjxI3aGLiPoMa7K3rf+5Jf+e48Yb9s3I7ZzV+p4F
 upRrX1pD6lQe11wcHWWlX2Y1KjiuhVRi8Do3Rky3t7TUoPGQavmW26UrtRcJY3JH54Uu
 N2JXF9G4D0G+glHlJ3qpjikW8DceonQ1v+UzyeB2Clb2QBz8KYWrnVBEA/lQ7Y4s0S2U
 Bl/w==
X-Gm-Message-State: AGi0PuaxI7nN/pJ57XqXk9LkR54yHQGGqYBDvn0baAVrbdzllcfDnUCr
 b3Hid4d5w53pLJYKWc82WK9xHsgpei6IXw==
X-Received: by 2002:a1c:7d4b:: with SMTP id y72mr4418635wmc.11.1588270229454; 
 Thu, 30 Apr 2020 11:10:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t8sm652421wrq.88.2020.04.30.11.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 11:10:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 18/36] target/arm: Convert Neon 3-reg-same VQADD/VQSUB to
 decodetree
Date: Thu, 30 Apr 2020 19:09:45 +0100
Message-Id: <20200430181003.21682-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200430181003.21682-1-peter.maydell@linaro.org>
References: <20200430181003.21682-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::341
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
X-TUID: fJgeICd6/jyt

Convert the Neon VQADD/VQSUB insns in the 3-reg-same grouping
to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-neon.inc.c | 15 +++++++++++++++
 target/arm/translate.c          | 14 ++------------
 target/arm/neon-dp.decode       |  6 ++++++
 3 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 952e4456f5e..854ab70cd79 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -653,3 +653,18 @@ static void gen_VTST_3s(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
     tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs, oprsz, maxsz, &cmtst_op[vece]);
 }
 DO_3SAME_NO_SZ_3(VTST, gen_VTST_3s)
+
+#define DO_3SAME_GVEC4(INSN, OPARRAY)                                   \
+    static void gen_##INSN##_3s(unsigned vece, uint32_t rd_ofs,         \
+                                uint32_t rn_ofs, uint32_t rm_ofs,       \
+                                uint32_t oprsz, uint32_t maxsz)         \
+    {                                                                   \
+        tcg_gen_gvec_4(rd_ofs, offsetof(CPUARMState, vfp.qc),           \
+                       rn_ofs, rm_ofs, oprsz, maxsz, &OPARRAY[vece]);   \
+    }                                                                   \
+    DO_3SAME(INSN, gen_##INSN##_3s)
+
+DO_3SAME_GVEC4(VQADD_S, sqadd_op)
+DO_3SAME_GVEC4(VQADD_U, uqadd_op)
+DO_3SAME_GVEC4(VQSUB_S, sqsub_op)
+DO_3SAME_GVEC4(VQSUB_U, uqsub_op)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7e4a57157c2..538e4be8f1b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4848,18 +4848,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
             }
             return 1;
 
-        case NEON_3R_VQADD:
-            tcg_gen_gvec_4(rd_ofs, offsetof(CPUARMState, vfp.qc),
-                           rn_ofs, rm_ofs, vec_size, vec_size,
-                           (u ? uqadd_op : sqadd_op) + size);
-            return 0;
-
-        case NEON_3R_VQSUB:
-            tcg_gen_gvec_4(rd_ofs, offsetof(CPUARMState, vfp.qc),
-                           rn_ofs, rm_ofs, vec_size, vec_size,
-                           (u ? uqsub_op : sqsub_op) + size);
-            return 0;
-
         case NEON_3R_VMUL: /* VMUL */
             if (u) {
                 /* Polynomial case allows only P8.  */
@@ -4892,6 +4880,8 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         case NEON_3R_VTST_VCEQ:
         case NEON_3R_VCGT:
         case NEON_3R_VCGE:
+        case NEON_3R_VQADD:
+        case NEON_3R_VQSUB:
             /* Already handled by decodetree */
             return 1;
         }
diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index b89ea6819a9..ab59b349aaa 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -42,6 +42,9 @@
 @3same           .... ... . . . size:2 .... .... .... . q:1 . . .... \
                  &3same vm=%vm_dp vn=%vn_dp vd=%vd_dp
 
+VQADD_S_3s       1111 001 0 0 . .. .... .... 0000 . . . 1 .... @3same
+VQADD_U_3s       1111 001 1 0 . .. .... .... 0000 . . . 1 .... @3same
+
 @3same_logic     .... ... . . . .. .... .... .... . q:1 .. .... \
                  &3same vm=%vm_dp vn=%vn_dp vd=%vd_dp size=0
 
@@ -54,6 +57,9 @@ VBSL_3s          1111 001 1 0 . 01 .... .... 0001 ... 1 .... @3same_logic
 VBIT_3s          1111 001 1 0 . 10 .... .... 0001 ... 1 .... @3same_logic
 VBIF_3s          1111 001 1 0 . 11 .... .... 0001 ... 1 .... @3same_logic
 
+VQSUB_S_3s       1111 001 0 0 . .. .... .... 0010 . . . 1 .... @3same
+VQSUB_U_3s       1111 001 1 0 . .. .... .... 0010 . . . 1 .... @3same
+
 VCGT_S_3s        1111 001 0 0 . .. .... .... 0011 . . . 0 .... @3same
 VCGT_U_3s        1111 001 1 0 . .. .... .... 0011 . . . 0 .... @3same
 VCGE_S_3s        1111 001 0 0 . .. .... .... 0011 . . . 1 .... @3same
-- 
2.20.1

