Received: by 10.28.91.67 with SMTP id p64csp988114wmb;
        Wed, 28 Feb 2018 11:36:34 -0800 (PST)
X-Google-Smtp-Source: AG47ELs9OvNjcb4qR6eBqF8OIGvCp1Wq3RKigVdwA4erl+Ro0Yxo2ZW+08wVV4PdahaaCWoVqVF1
X-Received: by 2002:a25:2087:: with SMTP id g129-v6mr13255988ybg.4.1519846594438;
        Wed, 28 Feb 2018 11:36:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519846594; cv=none;
        d=google.com; s=arc-20160816;
        b=1LCcAlxK8s/0IdgjVb3lUXTDIqWQQgRsbReQdTpc/xQNn6Vuxy2vlfJ/P4ljZMNdwN
         oq8Ydkxy2SPRqlp6UuP6kzl8eRi0ZycG9/E0NZenG0SHK98DmSF4msNf/ArpOxZzWt1p
         chaYK0KzkbrEcwis5PXUAk1AlGNhDfoAhP2Mki3TCzyz3mL3l5zSPQ1KKfJ4+IWh4yXa
         1tVdqbmhr0nG46ZFQQKpJplM+1Yku9+ElM61FdyQ6T+6qgCsaOEU0oF/5b+xb/YuvcGX
         jnwgbaWISQn83Zh+/95v7SLbG+WmADSYnC16NVxNpX06PW+8N4bhWE0eTTQq/Vx+kJP7
         2KGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=+IjtdbWqvx3AZfTdSO3VOPJQx410/iAUTHH31n2BAlA=;
        b=tkU6QH/HrP9OQh+8gibsYrK9cYSmQV1zEc/U2V4zKCSJlqj9RHzqyxn1msgeQwn34j
         Ry+EuLrWhDxZgNiTvGoB2XN2GFEDjqs8y8kapQ315wGQnHXV+94a1CbVx7WJ3AcYjd8q
         ewWXHl4xuBCjASjiMk3GSKyktbLlWn218bLeAIsw7wDm7L0urnHvl652dh9pwr6YSzWv
         R+yA6zD+YJBJG5SuhK8jwMpu0ZiwhHvEDkj4AlNBkfLft1fyyBU/mEsiXQE3j3OSJ5ME
         cKdQWOnA3ptbqU/N8+k7qUkDTjRMbkjTLFiGHiZOLwCFpIawLSDMwDFmYv3F+7oiJyom
         Xhbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PNu6YCRw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h130si379991ywh.404.2018.02.28.11.36.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 11:36:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PNu6YCRw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46436 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1er7Wj-00079r-Oi
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 14:36:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er7SB-0003Ye-Nr
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 14:31:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er7S8-0006Sq-3B
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 14:31:51 -0500
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:45704)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1er7S7-0006SU-TM
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 14:31:48 -0500
Received: by mail-pg0-x243.google.com with SMTP id i133so1317508pgc.12
	for <qemu-devel@nongnu.org>; Wed, 28 Feb 2018 11:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+IjtdbWqvx3AZfTdSO3VOPJQx410/iAUTHH31n2BAlA=;
	b=PNu6YCRwHJHFtFZhBB4Vn6aEFu7cfRSPOO9ygFKYijqD4L03jsISkixNpi3UssTaoV
	K54eMOFqrtQsHdAY+V2aLlT//eVJuuyrN11KaTt/nwaJz4RreQLVyIoE4iruOPBOFL7R
	n3vRsl4UzPr1mozKgXQVtR1ODFZD8uBmVjhWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+IjtdbWqvx3AZfTdSO3VOPJQx410/iAUTHH31n2BAlA=;
	b=Wveuo/7iPQznxrTs8fXhnx0KcdPAyHfBKr1uFau1FN5VW6RaT/Vw16Th1+eBh9nIsY
	P7XHgqDIfx87FwwxfXhUgg4mSP4hFOBQsNGI3pN5j3y9tuaBVVjUQxR1U0N20BuSYuC8
	KNNRPYu/wf1F+kezr3Qzo7fYkuRO4X1dKC3zXAqmNeficQMP4x4DEDn5sbW6SwoddyiQ
	mNhVp+p6D5Sp5dhwCheATfX31/13wCS8BCcDg12t9XcuybvrUScx+SO8ekCHZ4dC2Y7H
	TpTGLJz2kCO9/EvEQ3uSNC7VKnBn8nfKd/i2C5iDvbF5UqBjYZejZUSaJdwlexDycqj5
	3P9w==
X-Gm-Message-State: APf1xPDBrSJm2SHGkxYcOU68KaVzhWgCi7VDwJEpOwE3U3/o9jxr8/If
	MATw4tH+paxbSFDkJ6cR1ptA09Q68BA=
X-Received: by 10.98.91.5 with SMTP id p5mr18770272pfb.163.1519846306634;
	Wed, 28 Feb 2018 11:31:46 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	k185sm4200212pgk.94.2018.02.28.11.31.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Feb 2018 11:31:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Feb 2018 11:31:22 -0800
Message-Id: <20180228193125.20577-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180228193125.20577-1-richard.henderson@linaro.org>
References: <20180228193125.20577-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-devel] [PATCH v3 13/16] target/arm: Decode aa32 armv8.3 3-same
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
X-TUID: EDOw6t4n2GLb

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 68 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9169b6b367..45513c9d86 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7680,6 +7680,68 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
     return 0;
 }
 
+/* Advanced SIMD three registers of the same length extension.
+ *  31           25    23  22    20   16   12  11   10   9    8        3     0
+ * +---------------+-----+---+-----+----+----+---+----+---+----+---------+----+
+ * | 1 1 1 1 1 1 0 | op1 | D | op2 | Vn | Vd | 1 | o3 | 0 | o4 | N Q M U | Vm |
+ * +---------------+-----+---+-----+----+----+---+----+---+----+---------+----+
+ */
+static int disas_neon_insn_3same_ext(DisasContext *s, uint32_t insn)
+{
+    gen_helper_gvec_3_ptr *fn_gvec_ptr;
+    int rd, rn, rm, rot, size, opr_sz;
+    TCGv_ptr fpst;
+    bool q;
+
+    q = extract32(insn, 6, 1);
+    VFP_DREG_D(rd, insn);
+    VFP_DREG_N(rn, insn);
+    VFP_DREG_M(rm, insn);
+    if ((rd | rn | rm) & q) {
+        return 1;
+    }
+
+    if ((insn & 0xfe200f10) == 0xfc200800) {
+        /* VCMLA -- 1111 110R R.1S .... .... 1000 ...0 .... */
+        size = extract32(insn, 20, 1);
+        rot = extract32(insn, 23, 2);
+        if (!arm_dc_feature(s, ARM_FEATURE_V8_FCMA)
+            || (!size && !arm_dc_feature(s, ARM_FEATURE_V8_FP16))) {
+            return 1;
+        }
+        fn_gvec_ptr = size ? gen_helper_gvec_fcmlas : gen_helper_gvec_fcmlah;
+    } else if ((insn & 0xfea00f10) == 0xfc800800) {
+        /* VCADD -- 1111 110R 1.0S .... .... 1000 ...0 .... */
+        size = extract32(insn, 20, 1);
+        rot = extract32(insn, 24, 1);
+        if (!arm_dc_feature(s, ARM_FEATURE_V8_FCMA)
+            || (!size && !arm_dc_feature(s, ARM_FEATURE_V8_FP16))) {
+            return 1;
+        }
+        fn_gvec_ptr = size ? gen_helper_gvec_fcadds : gen_helper_gvec_fcaddh;
+    } else {
+        return 1;
+    }
+
+    if (s->fp_excp_el) {
+        gen_exception_insn(s, 4, EXCP_UDEF,
+                           syn_fp_access_trap(1, 0xe, false), s->fp_excp_el);
+        return 0;
+    }
+    if (!s->vfp_enabled) {
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
@@ -8424,6 +8486,12 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                     }
                 }
             }
+        } else if ((insn & 0x0e000a00) == 0x0c000800
+                   && arm_dc_feature(s, ARM_FEATURE_V8)) {
+            if (disas_neon_insn_3same_ext(s, insn)) {
+                goto illegal_op;
+            }
+            return;
         } else if ((insn & 0x0fe00000) == 0x0c400000) {
             /* Coprocessor double register transfer.  */
             ARCH(5TE);
-- 
2.14.3

