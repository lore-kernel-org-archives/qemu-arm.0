Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2198982lfm;
        Thu, 30 Apr 2020 11:16:06 -0700 (PDT)
X-Google-Smtp-Source: APiQypLyQyJtO49Fhfj4tFH9GthB4TgqRehmlmfR6Vxa8ZXoyaxbFWFb3d2L4xS9ArjImrD0wPF9
X-Received: by 2002:a37:b93:: with SMTP id 141mr4865803qkl.192.1588270566531;
        Thu, 30 Apr 2020 11:16:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588270566; cv=none;
        d=google.com; s=arc-20160816;
        b=NKbKBp515P0/NZkEKqLTP3crrWFtNIVhyo+iulXIS2KXqUQIvLWIGvIgBh+6YEuVQG
         fkdoY7cu+FAvMYC2WDcwoqxWsp4exukWdZsLAYy1ygnE+mcDcf5RLKbiSPb5TRAl2X9H
         /ZxxZm3WO8BhyPyS1kQ5f4CCwOoyUc3hTNzBe9+IIl3Di1N6dOfZbaW5GQoToX/z3Ulo
         e4yCyoDuXB0Ctrr07QYYVT3IrHnEaE56pJ1kmNWqADl4AZgaqW/hfzSw4L7kExNV5/+R
         O1Iy8YCV/NLf9KsCHwF9zVhm8UWkvJkNqD3TkeleXxQBuRpeFgJAxUapFoN/OdWcTFCR
         0SlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=QSstU/hy0hxmLdJnSbMYcJkvE1JZD3c/6g24zzTlD3s=;
        b=SWxK/Pg/N12C1OwdLYxmCPxUyH9ogtXzgXFDF0Ror8o2iwVgIz0rZWNxkjqFukqVVu
         FR9nOvoSMfjhF0F5mAV5Gal9A+UViU5TCWJNZxHxB7pzoUDlcyPvG7YLlAHjCqWaOPsN
         Yb58e8l4XkhxMoD5tBrvfH8J5IWo6dEM+P4VAcSbrT1dlY9wzCLBgV7LWqxG59ywExy8
         jJkGiva8VLuJKS0V17g3/ievhG1HWOIReU7YsVDwua5CV6SBCuHREsXpOd80G2fQOvHB
         tiYmQ8snxHyvXOj8cmpE3/gizbps0fO+o+ImWYUKnzAFbGkAi4ESKCc5y2Nye5KjbJ4E
         i12A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TQODx0fz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id k72si213689qke.28.2020.04.30.11.16.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 11:16:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TQODx0fz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUDjB-0001Ri-PE
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 14:16:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36294)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDeE-0001gL-N9
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:11:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDdk-0001Ad-PU
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:10:58 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:38631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUDdk-00018G-94
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:10:28 -0400
Received: by mail-wm1-x342.google.com with SMTP id g12so3072470wmh.3
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 11:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QSstU/hy0hxmLdJnSbMYcJkvE1JZD3c/6g24zzTlD3s=;
 b=TQODx0fzZx7rChF7QmAN+Rd3oDdcTFGVkhZZ/JA8lPtRyG1DUaOu2W+7ZdKSEdCFBi
 chkyZmPawfF7ps3EqcFQ0ivSUI1GXal0Qwt/i/Fh22nufp/4GUIHtIxI/OAi3KEUIKA1
 Qf/ZI+OIAnixnyc/j8XCr7BgGpXg8s2pJMKkrH1qQwL+I2yY0E2+96P2tcM20rmfOSYI
 Xpfj9su896J5OtvE3dcz3dwCBBFtSa9Op0hXc7mklMF6D7M62FEuGG+D3yMJdzTaZzEF
 URGp7QJQT+KhQYDyvH8rRjhau95lFdsDIN8MB5hrkRHVIUDvtX4prhhGIk7MoTVsYqaH
 CB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QSstU/hy0hxmLdJnSbMYcJkvE1JZD3c/6g24zzTlD3s=;
 b=pL1RzWRFYEjcKD0OsgOrBf84P6E1j31pzl3HqDoRHHdoYcTwiGZM/UeqWkbzeUAX7Y
 wgrM6Tl3i+nabVTR1iAlF3i6sCoBt/7TuDNywHXDsx/3f7biPPxyOffYbpMR8U1mlD26
 cgXVh+FIO8huHTlbnFLCeoQBap59VSyQVaAl5t66GwswG+IRHkYPKdKh7bGigOywtZlh
 1xzKZVXTfsj3OnlROAZLNZql/JfJhGXtGU4geLE4byWdBxj5vYAa8HYRHlGnIMU+WlO7
 Re6IsMa8OW7sJLSJbosYTzOCafB29xTtu/G8egDPwp5tw+QAUTl48JVDSFOG/PulGexW
 4mTg==
X-Gm-Message-State: AGi0PuY29snO1HcEYJJQq/cb7hL74DXw9KEobTUI3dn8IYDrxihYm7KI
 PQ28sCnRKx6jE2P3FY7jCs0meyu3+lcH1w==
X-Received: by 2002:a1c:e90a:: with SMTP id q10mr4244076wmc.22.1588270225441; 
 Thu, 30 Apr 2020 11:10:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t8sm652421wrq.88.2020.04.30.11.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 11:10:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 15/36] target/arm: Convert Neon 3-reg-same logic ops to
 decodetree
Date: Thu, 30 Apr 2020 19:09:42 +0100
Message-Id: <20200430181003.21682-16-peter.maydell@linaro.org>
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
X-TUID: bHxZnVVPLCnW

Convert the Neon logic ops in the 3-reg-same grouping to decodetree.
Note that for the logic ops the 'size' field forms part of their
decode and the actual operations are always bitwise.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-neon.inc.c | 19 +++++++++++++++++
 target/arm/translate.c          | 38 +--------------------------------
 target/arm/neon-dp.decode       | 12 +++++++++++
 3 files changed, 32 insertions(+), 37 deletions(-)

diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index bd9e697b3e2..507f0abe801 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -598,3 +598,22 @@ static bool do_3same(DisasContext *s, arg_3same *a, GVecGen3Fn fn)
 
 DO_3SAME(VADD, tcg_gen_gvec_add)
 DO_3SAME(VSUB, tcg_gen_gvec_sub)
+DO_3SAME(VAND, tcg_gen_gvec_and)
+DO_3SAME(VBIC, tcg_gen_gvec_andc)
+DO_3SAME(VORR, tcg_gen_gvec_or)
+DO_3SAME(VORN, tcg_gen_gvec_orc)
+DO_3SAME(VEOR, tcg_gen_gvec_xor)
+
+/* These insns are all gvec_bitsel but with the inputs in various orders. */
+#define DO_3SAME_BITSEL(INSN, O1, O2, O3)                               \
+    static void gen_##INSN##_3s(unsigned vece, uint32_t rd_ofs,         \
+                                uint32_t rn_ofs, uint32_t rm_ofs,       \
+                                uint32_t oprsz, uint32_t maxsz)         \
+    {                                                                   \
+        tcg_gen_gvec_bitsel(vece, rd_ofs, O1, O2, O3, oprsz, maxsz);    \
+    }                                                                   \
+    DO_3SAME(INSN, gen_##INSN##_3s)
+
+DO_3SAME_BITSEL(VBSL, rd_ofs, rn_ofs, rm_ofs)
+DO_3SAME_BITSEL(VBIT, rm_ofs, rn_ofs, rd_ofs)
+DO_3SAME_BITSEL(VBIF, rm_ofs, rd_ofs, rn_ofs)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 81a0df78e40..a3eaf9a82b7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4848,43 +4848,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
             }
             return 1;
 
-        case NEON_3R_LOGIC: /* Logic ops.  */
-            switch ((u << 2) | size) {
-            case 0: /* VAND */
-                tcg_gen_gvec_and(0, rd_ofs, rn_ofs, rm_ofs,
-                                 vec_size, vec_size);
-                break;
-            case 1: /* VBIC */
-                tcg_gen_gvec_andc(0, rd_ofs, rn_ofs, rm_ofs,
-                                  vec_size, vec_size);
-                break;
-            case 2: /* VORR */
-                tcg_gen_gvec_or(0, rd_ofs, rn_ofs, rm_ofs,
-                                vec_size, vec_size);
-                break;
-            case 3: /* VORN */
-                tcg_gen_gvec_orc(0, rd_ofs, rn_ofs, rm_ofs,
-                                 vec_size, vec_size);
-                break;
-            case 4: /* VEOR */
-                tcg_gen_gvec_xor(0, rd_ofs, rn_ofs, rm_ofs,
-                                 vec_size, vec_size);
-                break;
-            case 5: /* VBSL */
-                tcg_gen_gvec_bitsel(MO_8, rd_ofs, rd_ofs, rn_ofs, rm_ofs,
-                                    vec_size, vec_size);
-                break;
-            case 6: /* VBIT */
-                tcg_gen_gvec_bitsel(MO_8, rd_ofs, rm_ofs, rn_ofs, rd_ofs,
-                                    vec_size, vec_size);
-                break;
-            case 7: /* VBIF */
-                tcg_gen_gvec_bitsel(MO_8, rd_ofs, rm_ofs, rd_ofs, rn_ofs,
-                                    vec_size, vec_size);
-                break;
-            }
-            return 0;
-
         case NEON_3R_VQADD:
             tcg_gen_gvec_4(rd_ofs, offsetof(CPUARMState, vfp.qc),
                            rn_ofs, rm_ofs, vec_size, vec_size,
@@ -4962,6 +4925,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
             return 0;
 
         case NEON_3R_VADD_VSUB:
+        case NEON_3R_LOGIC:
             /* Already handled by decodetree */
             return 1;
         }
diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index a61b1e88476..f62dbaa72d5 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -42,5 +42,17 @@
 @3same           .... ... . . . size:2 .... .... .... . q:1 . . .... \
                  &3same vm=%vm_dp vn=%vn_dp vd=%vd_dp
 
+@3same_logic     .... ... . . . .. .... .... .... . q:1 .. .... \
+                 &3same vm=%vm_dp vn=%vn_dp vd=%vd_dp size=0
+
+VAND_3s          1111 001 0 0 . 00 .... .... 0001 ... 1 .... @3same_logic
+VBIC_3s          1111 001 0 0 . 01 .... .... 0001 ... 1 .... @3same_logic
+VORR_3s          1111 001 0 0 . 10 .... .... 0001 ... 1 .... @3same_logic
+VORN_3s          1111 001 0 0 . 11 .... .... 0001 ... 1 .... @3same_logic
+VEOR_3s          1111 001 1 0 . 00 .... .... 0001 ... 1 .... @3same_logic
+VBSL_3s          1111 001 1 0 . 01 .... .... 0001 ... 1 .... @3same_logic
+VBIT_3s          1111 001 1 0 . 10 .... .... 0001 ... 1 .... @3same_logic
+VBIF_3s          1111 001 1 0 . 11 .... .... 0001 ... 1 .... @3same_logic
+
 VADD_3s          1111 001 0 0 . .. .... .... 1000 . . . 0 .... @3same
 VSUB_3s          1111 001 1 0 . .. .... .... 1000 . . . 0 .... @3same
-- 
2.20.1

