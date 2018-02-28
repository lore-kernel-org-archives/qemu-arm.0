Received: by 10.28.91.67 with SMTP id p64csp993608wmb;
        Wed, 28 Feb 2018 11:42:53 -0800 (PST)
X-Google-Smtp-Source: AG47ELts6M5rQX3XXr5dOKAmt6EySHM5cBVGfaMfy4pjWoZ8XBR9Prwy+lrY3Kk0zXjqfwAHWZtx
X-Received: by 2002:a25:41d4:: with SMTP id o203-v6mr663403yba.141.1519846973181;
        Wed, 28 Feb 2018 11:42:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519846973; cv=none;
        d=google.com; s=arc-20160816;
        b=rD4amDLmIqOP12KWfFWI7RUD8dzkG47TO2mjIOHFJZI6Ykr9Gx7FDmbWpqc43jly/M
         8M6WwNsbd/oHGAWFMfZAzx1dXudIo82xr5RsCzqEDgGKE9r6LGpc2RRauElYIHnJ/HsW
         eCTCrFHipOzg9TusA79bM952dYmizzLmNT2fdkXyh7L2dpk0PNdiWi2U5xlrWGoRjlI0
         /ty7PiigDSZ/HrDoQ8bizx7u3Xcnwgytjxjo7ZyEqaIs28T+mSnhLYZCqG0rN2rLEt07
         qisW7J+NmVVLbVx/MfJQ36Ho84FUKtUAfv+4rPPIULgxI14iC8tAgAWoZzNVRN367Vkl
         XFMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=MR0QyCTB5IcqskwTEuIEWG45RpBZgoQ7B3ACJOcXyLw=;
        b=P/GtYNHRtgSs/9rCSDwmTnxjkN39KyTRPfTvkVmrxi5EZCJhAc+0JCobUfw5hF8GHb
         aFuSVx07D2+pWfumWkJ2Uwv0Dy+nUGZXF10t4DclWtdm948KQ+lkxszuLUKUwTjpNgKf
         +iSC3pXO03SzQvWUUUqsT6dB16vQcVxECE8/ojTThm98tqTbX6zXEoBNfsR8dUp/pEQr
         qXjIL5k/UzKoatyHC/0KtcacKV9QfnushbS8F9YEs+j1TvlFPaNlE294SLEvX9PLRISI
         6SUhCG0ciykeFYx1px9qZEd++PCjRtPIM0ZNuehghqm++oVFmYbPVIfry6LngJGzZnJx
         y9yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=arH32oIb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m11si382721ywm.79.2018.02.28.11.42.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 11:42:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=arH32oIb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46484 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1er7cq-0004VK-Iq
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 14:42:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35817)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er7SB-0003Yn-Ob
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 14:31:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er7S9-0006Tz-Bx
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 14:31:51 -0500
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:41274)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1er7S9-0006TQ-6E
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 14:31:49 -0500
Received: by mail-pl0-x243.google.com with SMTP id k8-v6so2116198pli.8
	for <qemu-arm@nongnu.org>; Wed, 28 Feb 2018 11:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MR0QyCTB5IcqskwTEuIEWG45RpBZgoQ7B3ACJOcXyLw=;
	b=arH32oIbspbm54RggbZKolyK/Cqk/EWOY/wLgTsmOPYS/lp4d8mVtGqVoksaRRQ7J/
	gWNXq6Y7p0xYsUtQmxAMTdVpnZXOZMzrJqMgdOIuD02scACN5r1jtuOBS9n6maiVaT9u
	Xz2rXn7GokZKuKCueDcwW0Vvcp8EN4nm3oUKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MR0QyCTB5IcqskwTEuIEWG45RpBZgoQ7B3ACJOcXyLw=;
	b=iujHIjLkB8/yQ3Ce1j9o0598sgpzIJ5jiCMbnnJbwXf66+Fp7AOUnFjwgC3qiwL9fa
	wsJ7tssAlD+T3NAX08Gvjh/C/FdYi1xbgdbeSxuJ96HaRfJiZmmepOUK15s7TSUSQCrH
	I8JLO5DtgGzrMYx/zsHkm/ABUyiMJFJZHoyC/85gluvuXRRNPb009HjUdpx3K5wEmvbl
	SK1GSpxweGx0kfy7LtlyEdNxhGYis37t1DTvSe4UxdRAqUN7yG6yCDuKvpHQYHFt1FaV
	ZnTvGo4Cw+J8aArUU2pmqiqkoN9XTEr8l6yHBRMARPTBJDR4akHTGS7/D751Yxh94OvL
	kBwg==
X-Gm-Message-State: APf1xPAg8+LL1lBUSrWd8ficH9T69N8d65xAyHIK5UX9aSuDf7WRQhJj
	t7spyXwsDYV/vUg3fw5OhY67Q1jknOw=
X-Received: by 2002:a17:902:1763:: with SMTP id
	i90-v6mr2804459pli.309.1519846308154; 
	Wed, 28 Feb 2018 11:31:48 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	k185sm4200212pgk.94.2018.02.28.11.31.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Feb 2018 11:31:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Feb 2018 11:31:23 -0800
Message-Id: <20180228193125.20577-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180228193125.20577-1-richard.henderson@linaro.org>
References: <20180228193125.20577-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: [Qemu-arm] [PATCH v3 14/16] target/arm: Decode aa32 armv8.3
 2-reg-index
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6dx77gYpNIXt

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 61 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 45513c9d86..3ad8b4031c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7742,6 +7742,61 @@ static int disas_neon_insn_3same_ext(DisasContext *s, uint32_t insn)
     return 0;
 }
 
+/* Advanced SIMD two registers and a scalar extension.
+ *  31             24   23  22   20   16   12  11   10   9    8        3     0
+ * +-----------------+----+---+----+----+----+---+----+---+----+---------+----+
+ * | 1 1 1 1 1 1 1 0 | o1 | D | o2 | Vn | Vd | 1 | o3 | 0 | o4 | N Q M U | Vm |
+ * +-----------------+----+---+----+----+----+---+----+---+----+---------+----+
+ *
+ */
+
+static int disas_neon_insn_2reg_scalar_ext(DisasContext *s, uint32_t insn)
+{
+    int rd, rn, rm, rot, size, opr_sz;
+    TCGv_ptr fpst;
+    bool q;
+
+    q = extract32(insn, 6, 1);
+    VFP_DREG_D(rd, insn);
+    VFP_DREG_N(rn, insn);
+    VFP_DREG_M(rm, insn);
+    if ((rd | rn) & q) {
+        return 1;
+    }
+
+    if ((insn & 0xff000f10) == 0xfe000800) {
+        /* VCMLA (indexed) -- 1111 1110 S.RR .... .... 1000 ...0 .... */
+        rot = extract32(insn, 20, 2);
+        size = extract32(insn, 23, 1);
+        if (!arm_dc_feature(s, ARM_FEATURE_V8_FCMA)
+            || (!size && !arm_dc_feature(s, ARM_FEATURE_V8_FP16))) {
+            return 1;
+        }
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
+                       opr_sz, opr_sz, rot,
+                       size ? gen_helper_gvec_fcmlas_idx
+                       : gen_helper_gvec_fcmlah_idx);
+    tcg_temp_free_ptr(fpst);
+    return 0;
+}
+
 static int disas_coproc_insn(DisasContext *s, uint32_t insn)
 {
     int cpnum, is64, crn, crm, opc1, opc2, isread, rt, rt2;
@@ -8492,6 +8547,12 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                 goto illegal_op;
             }
             return;
+        } else if ((insn & 0x0f000a00) == 0x0e000800
+                   && arm_dc_feature(s, ARM_FEATURE_V8)) {
+            if (disas_neon_insn_2reg_scalar_ext(s, insn)) {
+                goto illegal_op;
+            }
+            return;
         } else if ((insn & 0x0fe00000) == 0x0c400000) {
             /* Coprocessor double register transfer.  */
             ARCH(5TE);
-- 
2.14.3

