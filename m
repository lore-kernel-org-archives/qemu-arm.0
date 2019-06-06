Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4758535wrg;
        Thu, 6 Jun 2019 10:58:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzifpqUtmX1cb4ZcUDIDDiuYwyZZAV9nrJB/1UHoJS6ECU3cukFYkXC9i/uEdQ5DalWku/3
X-Received: by 2002:a37:a4d3:: with SMTP id n202mr38921823qke.84.1559843932984;
        Thu, 06 Jun 2019 10:58:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559843932; cv=none;
        d=google.com; s=arc-20160816;
        b=o8T41V6TUsqjse1QMsiNaYsv6S2krpmsveQeOkE1zGgv4fj6+ah2VFk0gBeesCamef
         kw8tDMxJjM/y/n5nBz9VloyvReFOHteVWSi6t54uRGtGQyf93yzFU501JGYWbsHA9PiP
         IueNQW6NUgdFin5BtM5l5ey7G8uNRtFFtVZ87fDNOPdAIHHQz6qCPOyfbwMvjpnriivx
         3WqTyv6ZMEBoVmBrUYwem9/OSeTDbcFAtqOumFxj9vrhKJA8j9oGiKUOuK/M3cnlBKE1
         UUL7Ztxmflpwr0+a4xA9EFjcll+Dd6F5NBNNOnuWZP9oTqMcuRIcGJUPXel4wMohkkB+
         LbQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=Tdfj1n4qb7O+HPsYY1oC15eFNJxwWAq3hszzU9QN31E=;
        b=k6xDmOv4qZVidq3gsk0tarpV2FhdrImy0X1SXkoWGHQ+vU4sUAdZW2pv0NhU7pB30d
         dsDklB3cox0Q2V3McUC+xRp5hUVXt53IeCng8NjNyF5xG6CuNAU2Pt27F1MOC50DpT62
         jcQjeIz6yicx6ob/E7fwmU732eaAViRgf+ygceJic8pEv0aGJPYDRUBOei2lkeoNgJh5
         06n6m+xcM6qHmzdefnYBxX1BTh5C798JRCGNFYZSuaqMpgPM8VWWWrY22+rMGXk2u3ZZ
         tUdmjX/UG8VOyIs9l6EcPK2+NPIhnKP3AY1QtinAQE88MMr2NIQKULXiA3vuDET8oBHy
         PzlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DEmxOXkO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g37si1224449qvd.137.2019.06.06.10.58.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jun 2019 10:58:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DEmxOXkO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36059 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYwf6-0006FS-DY
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 13:58:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44580)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTx-0004HT-25
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 13:47:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTr-0003ko-Q0
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 13:47:17 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:50912)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hYwTp-0002wi-2S
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 13:47:14 -0400
Received: by mail-wm1-x334.google.com with SMTP id f204so813786wme.0
	for <qemu-devel@nongnu.org>; Thu, 06 Jun 2019 10:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Tdfj1n4qb7O+HPsYY1oC15eFNJxwWAq3hszzU9QN31E=;
	b=DEmxOXkOiScq3eCcZa2Zd0jPB2xwAxtBCdrbZaUVfdH4lHmcrVtbHxqJcLrCYKI9NV
	l1zbFhMP+VwmC067BhloAmGdmHwTrgRzw0tBv/4vrri7bq02Ux2g2bH9k+kGgpiisf+n
	Xxv5LpgOODfYGwy0x+hiJ1rPGr6P5hn50K3MML+1saJarRVXAJj1e05MxMil9BJclnDE
	oGscRmc12FLb3bVtoYm9PbDCrJNsCHopnaNMvEIo4v4sPTjTsktH+xPYn5SFmkSSIgUf
	aRYGtua6uIHl+QwsKyt8uHecnSVJIckGTjMUp15j8XQzXWzC+2Dvga59q2tqBK4LG6Vi
	8T2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Tdfj1n4qb7O+HPsYY1oC15eFNJxwWAq3hszzU9QN31E=;
	b=kQiQeDHZ0eVNNvnhfw2M+ANgV+2V4xCRfisHuLCXiXdiBqENi/FJleJDrPUqPcBivV
	1IdrRnAKzgj2eTjVCrSsCLrTMh/oXl/f+hFeXVr62tMw+ie17A6H/pGnlq+s6ur/CoWv
	d741NXZ6JHo0vgTHCUbmJ5ya4fZbNKsmAQWPercIs0Amg+NdIj2qVuoPIdThfeuv6I/j
	WF3j+CEKWZnM6W7YTWSBKME9OXHYapwdjpNlgFQSHO9/MIeQyhj7N8zq/vv8Gv87F2d1
	dqk+THKKGWP3QJ0jAihtoL3wDk5sBBZHz0bMmvuZ57jpDX6K//OQFDnMC19BWnAAUWJp
	0/eA==
X-Gm-Message-State: APjAAAUSaUCV+4BMVo4Pjl9RuwvLxwuwE18ICma7G6AvOkjrMs2QmRD4
	2ydq70ckk1rgL3NRK4LGyZzyumKfKvW/zQ==
X-Received: by 2002:a7b:cc97:: with SMTP id p23mr868304wma.120.1559843184988; 
	Thu, 06 Jun 2019 10:46:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	z135sm2596784wmc.45.2019.06.06.10.46.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 10:46:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 18:45:39 +0100
Message-Id: <20190606174609.20487-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606174609.20487-1-peter.maydell@linaro.org>
References: <20190606174609.20487-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::334
Subject: [Qemu-devel] [PATCH 12/42] target/arm: Convert "double-precision"
 register moves to decodetree
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WPg/4GGa8rV0

Convert the "double-precision" register moves to decodetree:
this covers VMOV scalar-to-gpreg, VMOV gpreg-to-scalar and VDUP.

Note that the conversion process has tightened up a few of the
UNDEF encoding checks: we now correctly forbid:
 * VMOV-to-gpr with U:opc1:opc2 == 10x00 or x0x10
 * VMOV-from-gpr with opc1:opc2 == 0x10
 * VDUP with B:E == 11
 * VDUP with Q == 1 and Vn<0> == 1

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
The accesses of elements < 32 bits could be improved by doing
direct ld/st of the right size rather than 32-bit read-and-shift
or read-modify-write, but we leave this for later cleanup,
since this series is generally trying to stick to fixing
the decode.
---
 target/arm/translate-vfp.inc.c | 147 +++++++++++++++++++++++++++++++++
 target/arm/translate.c         |  83 +------------------
 target/arm/vfp.decode          |  36 ++++++++
 3 files changed, 185 insertions(+), 81 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 24358f3d3eb..8b0899fa05c 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -475,3 +475,150 @@ static bool trans_VCVT(DisasContext *s, arg_VCVT *a)
 
     return true;
 }
+
+static bool trans_VMOV_to_gp(DisasContext *s, arg_VMOV_to_gp *a)
+{
+    /* VMOV scalar to general purpose register */
+    TCGv_i32 tmp;
+    int pass;
+    uint32_t offset;
+
+    /* UNDEF accesses to D16-D31 if they don't exist */
+    if (!dc_isar_feature(aa32_fp_d32, s) && (a->vn & 0x10)) {
+        return false;
+    }
+
+    offset = a->index << a->size;
+    pass = extract32(offset, 2, 1);
+    offset = extract32(offset, 0, 2) * 8;
+
+    if (a->size != 2 && !arm_dc_feature(s, ARM_FEATURE_NEON)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    tmp = neon_load_reg(a->vn, pass);
+    switch (a->size) {
+    case 0:
+        if (offset) {
+            tcg_gen_shri_i32(tmp, tmp, offset);
+        }
+        if (a->u) {
+            gen_uxtb(tmp);
+        } else {
+            gen_sxtb(tmp);
+        }
+        break;
+    case 1:
+        if (a->u) {
+            if (offset) {
+                tcg_gen_shri_i32(tmp, tmp, 16);
+            } else {
+                gen_uxth(tmp);
+            }
+        } else {
+            if (offset) {
+                tcg_gen_sari_i32(tmp, tmp, 16);
+            } else {
+                gen_sxth(tmp);
+            }
+        }
+        break;
+    case 2:
+        break;
+    }
+    store_reg(s, a->rt, tmp);
+
+    return true;
+}
+
+static bool trans_VMOV_from_gp(DisasContext *s, arg_VMOV_from_gp *a)
+{
+    /* VMOV general purpose register to scalar */
+    TCGv_i32 tmp, tmp2;
+    int pass;
+    uint32_t offset;
+
+    /* UNDEF accesses to D16-D31 if they don't exist */
+    if (!dc_isar_feature(aa32_fp_d32, s) && (a->vn & 0x10)) {
+        return false;
+    }
+
+    offset = a->index << a->size;
+    pass = extract32(offset, 2, 1);
+    offset = extract32(offset, 0, 2) * 8;
+
+    if (a->size != 2 && !arm_dc_feature(s, ARM_FEATURE_NEON)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    tmp = load_reg(s, a->rt);
+    switch (a->size) {
+    case 0:
+        tmp2 = neon_load_reg(a->vn, pass);
+        tcg_gen_deposit_i32(tmp, tmp2, tmp, offset, 8);
+        tcg_temp_free_i32(tmp2);
+        break;
+    case 1:
+        tmp2 = neon_load_reg(a->vn, pass);
+        tcg_gen_deposit_i32(tmp, tmp2, tmp, offset, 16);
+        tcg_temp_free_i32(tmp2);
+        break;
+    case 2:
+        break;
+    }
+    neon_store_reg(a->vn, pass, tmp);
+
+    return true;
+}
+
+static bool trans_VDUP(DisasContext *s, arg_VDUP *a)
+{
+    /* VDUP (general purpose register) */
+    TCGv_i32 tmp;
+    int size, vec_size;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist */
+    if (!dc_isar_feature(aa32_fp_d32, s) && (a->vn & 0x10)) {
+        return false;
+    }
+
+    if (a->b && a->e) {
+        return false;
+    }
+
+    if (a->q && (a->vn & 1)) {
+        return false;
+    }
+
+    vec_size = a->q ? 16 : 8;
+    if (a->b) {
+        size = 0;
+    } else if (a->e) {
+        size = 1;
+    } else {
+        size = 2;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    tmp = load_reg(s, a->rt);
+    tcg_gen_gvec_dup_i32(size, neon_reg_offset(a->vn, 0),
+                         vec_size, vec_size, tmp);
+    tcg_temp_free_i32(tmp);
+
+    return true;
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index fd2abd87202..ff9c6a43d84 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3151,87 +3151,8 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             /* single register transfer */
             rd = (insn >> 12) & 0xf;
             if (dp) {
-                int size;
-                int pass;
-
-                VFP_DREG_N(rn, insn);
-                if (insn & 0xf)
-                    return 1;
-                if (insn & 0x00c00060
-                    && !arm_dc_feature(s, ARM_FEATURE_NEON)) {
-                    return 1;
-                }
-
-                pass = (insn >> 21) & 1;
-                if (insn & (1 << 22)) {
-                    size = 0;
-                    offset = ((insn >> 5) & 3) * 8;
-                } else if (insn & (1 << 5)) {
-                    size = 1;
-                    offset = (insn & (1 << 6)) ? 16 : 0;
-                } else {
-                    size = 2;
-                    offset = 0;
-                }
-                if (insn & ARM_CP_RW_BIT) {
-                    /* vfp->arm */
-                    tmp = neon_load_reg(rn, pass);
-                    switch (size) {
-                    case 0:
-                        if (offset)
-                            tcg_gen_shri_i32(tmp, tmp, offset);
-                        if (insn & (1 << 23))
-                            gen_uxtb(tmp);
-                        else
-                            gen_sxtb(tmp);
-                        break;
-                    case 1:
-                        if (insn & (1 << 23)) {
-                            if (offset) {
-                                tcg_gen_shri_i32(tmp, tmp, 16);
-                            } else {
-                                gen_uxth(tmp);
-                            }
-                        } else {
-                            if (offset) {
-                                tcg_gen_sari_i32(tmp, tmp, 16);
-                            } else {
-                                gen_sxth(tmp);
-                            }
-                        }
-                        break;
-                    case 2:
-                        break;
-                    }
-                    store_reg(s, rd, tmp);
-                } else {
-                    /* arm->vfp */
-                    tmp = load_reg(s, rd);
-                    if (insn & (1 << 23)) {
-                        /* VDUP */
-                        int vec_size = pass ? 16 : 8;
-                        tcg_gen_gvec_dup_i32(size, neon_reg_offset(rn, 0),
-                                             vec_size, vec_size, tmp);
-                        tcg_temp_free_i32(tmp);
-                    } else {
-                        /* VMOV */
-                        switch (size) {
-                        case 0:
-                            tmp2 = neon_load_reg(rn, pass);
-                            tcg_gen_deposit_i32(tmp, tmp2, tmp, offset, 8);
-                            tcg_temp_free_i32(tmp2);
-                            break;
-                        case 1:
-                            tmp2 = neon_load_reg(rn, pass);
-                            tcg_gen_deposit_i32(tmp, tmp2, tmp, offset, 16);
-                            tcg_temp_free_i32(tmp2);
-                            break;
-                        case 2:
-                            break;
-                        }
-                        neon_store_reg(rn, pass, tmp);
-                    }
-                }
+                /* already handled by decodetree */
+                return 1;
             } else { /* !dp */
                 bool is_sysreg;
 
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 28ee664d8c3..8286bdc0729 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -26,3 +26,39 @@
 #  1110 1110 .... .... .... 101. .... ....
 # (but those patterns might also cover some Neon instructions,
 # which do not live in this file.)
+
+# VFP registers have an odd encoding with a four-bit field
+# and a one-bit field which are assembled in different orders
+# depending on whether the register is double or single precision.
+# Each individual instruction function must do the checks for
+# "double register selected but CPU does not have double support"
+# and "double register number has bit 4 set but CPU does not
+# support D16-D31" (which should UNDEF).
+%vm_dp  5:1 0:4
+%vm_sp  0:4 5:1
+%vn_dp  7:1 16:4
+%vn_sp  16:4 7:1
+%vd_dp  22:1 12:4
+%vd_sp  12:4 22:1
+
+%vmov_idx_b     21:1 5:2
+%vmov_idx_h     21:1 6:1
+
+# VMOV scalar to general-purpose register; note that this does
+# include some Neon cases.
+VMOV_to_gp   ---- 1110 u:1 1.        1 .... rt:4 1011 ... 1 0000 \
+             vn=%vn_dp size=0 index=%vmov_idx_b
+VMOV_to_gp   ---- 1110 u:1 0.        1 .... rt:4 1011 ..1 1 0000 \
+             vn=%vn_dp size=1 index=%vmov_idx_h
+VMOV_to_gp   ---- 1110 0   0 index:1 1 .... rt:4 1011 .00 1 0000 \
+             vn=%vn_dp size=2 u=0
+
+VMOV_from_gp ---- 1110 0 1.        0 .... rt:4 1011 ... 1 0000 \
+             vn=%vn_dp size=0 index=%vmov_idx_b
+VMOV_from_gp ---- 1110 0 0.        0 .... rt:4 1011 ..1 1 0000 \
+             vn=%vn_dp size=1 index=%vmov_idx_h
+VMOV_from_gp ---- 1110 0 0 index:1 0 .... rt:4 1011 .00 1 0000 \
+             vn=%vn_dp size=2
+
+VDUP         ---- 1110 1 b:1 q:1 0 .... rt:4 1011 . 0 e:1 1 0000 \
+             vn=%vn_dp
-- 
2.20.1

