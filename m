Received: by 10.223.159.74 with SMTP id f10csp2947682wrg;
        Mon, 18 Dec 2017 10:00:06 -0800 (PST)
X-Google-Smtp-Source: ACJfBosp1IBDoV4YHyL50RUpamZKQu3l5kE4Rc6csGf5nhmGtwqzEdeYHb+r8BcVy4Dp1dTbwgdP
X-Received: by 10.129.89.193 with SMTP id n184mr437345ywb.469.1513620006494;
        Mon, 18 Dec 2017 10:00:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513620006; cv=none;
        d=google.com; s=arc-20160816;
        b=O6GP2PNoVOGkoTv7exvHimpfnFMUwVRUIMB1/rqqtRDRIJkdpy02WVlDyMgAt3lEpn
         oZY2hMcItkftLiONBVA+bRNDtNfKLr1QIB+RB596uRXmFsNNugut6HD3ZXYlmEU7uExO
         SsHoaleRWl6Eq6Ty7h6B79IIR6NHL9mQCfPIzgp4R5cRe0CetlOcxUzbfp9Si5insN2E
         y1W3i+bdXtj2WyG0/XYkQMKBT3aV7zamDl6S1P6rCwFJaXMIwKFX+pVjVxFP89fNmVeT
         lECL+/74kBcSKZFY0RupU77irnbGavor1sxYdVlKXIVTeMZpzAlNE0cqGHgG4STiggDg
         rkjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=gAw2GU1hArBTBiaBmC/mbH2LgFYCyNViMQ9q1WhHXJ0=;
        b=ut9C9E78SBBBvmvPV4PmmYpprkoA2fTAbu6CvUqhKuIIhlm1lY4/OoOi/lRJ/BQds/
         OLI6KtxZb6y5uDTRTnYWpx1WQ2lfzGwSj+vR8ZlLCYz1uWumnFKtKJOm/QxOfksou80C
         eoEB1StSVfeNjEW1L7dOGNSROhY9lhj5NEr4C13A9fRimsmDOQ2fbm9aMvgeUF8pzh7J
         iEsbcZgB7BxDr6M6edsKVElS5LGkEx/mtc2f8/73fd8+F7a4UIgjTjyNON4RigDWjf05
         yJwQMaohhjxrkBNORgiXJhcnVhrRYUiJ73oRz0T1BQpdzEBWYUa2d1G88Ugol6pS983P
         RH1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iok9JsDG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r127si2674985ywh.285.2017.12.18.10.00.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 10:00:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iok9JsDG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59740 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eQzht-0004A4-Ts
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 13:00:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41192)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQz9h-00066M-Nd
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:24:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQz9g-0008M2-P8
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:24:45 -0500
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:40485)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eQz9g-0008Kl-Jf
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:24:44 -0500
Received: by mail-pf0-x243.google.com with SMTP id v26so9944382pfl.7
	for <qemu-arm@nongnu.org>; Mon, 18 Dec 2017 09:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gAw2GU1hArBTBiaBmC/mbH2LgFYCyNViMQ9q1WhHXJ0=;
	b=iok9JsDGp2a8Z3xdVJZ4/LUedqb1GdV6BREM1Fi1oToE+ihvLYcRhehXef71U6mTI0
	y3ugiwWy2ubaECutob6q2yQrs4fG4/NoINmSaKLZGTASmI2R8kjDwmtErdbZvNmxb4OJ
	clHUxSX2HqdKWgNZwikHzYiuhRvZO2RHeffGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gAw2GU1hArBTBiaBmC/mbH2LgFYCyNViMQ9q1WhHXJ0=;
	b=p+s9ldwM8w8slCTt2dMNy3sJCZZJkrGpbD++831EpPb6qJMs5wxSz7pWgHq61oGCPi
	/dhcRvjelMjlna2/tQHJ2LCs0GEcoDt//nI2ZQDbmodMdqGDLgHoFDFaqkuPRV18Ei5C
	+sjX6zpFIcgyhcjOqgMlXgR2EVskwfcPYrM78/SOEzc0w0kPSKh4YtsLM6PClucx1JHd
	RM3PLdrA6L4Tla5Z7mvZgip+/YPtAa1UPWzF7jE0XWhjuu7v8RcRWBCJrVJFpTDTuASG
	k2qX8fA0OjvS50pJlFm7Wl4UiyEqAzg9wLWxk3iJkWVeY7vc4kmUo+fUg51i9nuy96NI
	11tw==
X-Gm-Message-State: AKGB3mK3/2GvVjp32/NaIUOXz4TG/ZOISQGYwyrkg8NV34S2IH0cva3H
	2UN85lnL1j1h77QME+LlZdkNoA==
X-Received: by 10.99.176.76 with SMTP id z12mr376467pgo.358.1513617883767;
	Mon, 18 Dec 2017 09:24:43 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-7-63.tukw.qwest.net.
	[174.21.7.63])
	by smtp.gmail.com with ESMTPSA id m10sm9260469pgs.4.2017.12.18.09.24.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 09:24:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 18 Dec 2017 09:24:25 -0800
Message-Id: <20171218172425.18200-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171218172425.18200-1-richard.henderson@linaro.org>
References: <20171218172425.18200-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [PATCH v2 11/11] target/arm: Decode aa32 armv8.3
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JU/DYc7UucqQ

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index e57844c019..490e120b0b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7721,6 +7721,51 @@ static int disas_neon_insn_cp8_3same(DisasContext *s, uint32_t insn)
     return 0;
 }
 
+/* ARMv8.3 reclaims a portion of the CDP2 coprocessor 8 space.  */
+
+static int disas_neon_insn_cp8_index(DisasContext *s, uint32_t insn)
+{
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
+    if (!s->vfp_enabled || !arm_dc_feature(s, ARM_FEATURE_V8_FCMA)) {
+        return 1;
+    }
+
+    q = extract32(insn, 6, 1);
+    size = extract32(insn, 23, 1);
+
+    VFP_DREG_D(rd, insn);
+    VFP_DREG_N(rn, insn);
+    VFP_DREG_M(rm, insn);
+    if ((rd | rn) & q) {
+        return 1;
+    }
+
+    /* This entire space is VCMLA (indexed).  */
+    rot = extract32(insn, 20, 2);
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
@@ -8471,6 +8516,12 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                 goto illegal_op;
             }
             return;
+        } else if ((insn & 0x0f000f10) == 0x0e000800) {
+            /* ARMv8.3 neon cdp2 coprocessor 8 extension.  */
+            if (disas_neon_insn_cp8_index(s, insn)) {
+                goto illegal_op;
+            }
+            return;
         } else if ((insn & 0x0fe00000) == 0x0c400000) {
             /* Coprocessor double register transfer.  */
             ARCH(5TE);
-- 
2.14.3

