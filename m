Received: by 10.223.197.9 with SMTP id q9csp5939087wrf;
        Wed, 4 Oct 2017 11:53:42 -0700 (PDT)
X-Received: by 10.237.33.188 with SMTP id l57mr4333817qtc.270.1507143222007;
        Wed, 04 Oct 2017 11:53:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507143222; cv=none;
        d=google.com; s=arc-20160816;
        b=xCgZurLC8eb8vBDtCv0Of3siuIG42C43ocoLtu/Icx3OQ7DFeMCxeqpqR/KI5eqs7j
         WJKqnvd3X6vSyOTipUYpB0zD+KdphJ8MYpL7B1KrjFv5kQoTayVCwTaSOhYN8ZCy7YQI
         aQyaopRUftHymA+mUbByyRUkIFQOazWL1FzHT4wqEMz6ehowjdeppuG+9GBc/FRvw0Lr
         uaaydBlrPuRkuAwqVwSScj+tdrYCRXT9SdL2FzAABzosITjDhaLkLpUcjmQBPOileSI7
         HKLW1g172NewNTYY/cMciNsg9r3bY+/qNO6N7sbN3S6Q8v7GiiZq3iJIQBd/jiuGCygJ
         /SVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=RF27WMiW7xZoIZt9j6TbVCEpaATPf5edbCN/DE5E1gw=;
        b=W9eQCQYTvy2lTx5Ry7Y5rBpSaXCA79rVqLlOYMeXJxLotIi1X6sM7S/gF5278zz19p
         KtEiqUaKoqSqUXvn+kmtzU802X0VSqcnzFWUIfhPxYReQQ1FX9ILaOEKA+h4xrMjProd
         oJHvElMXc07ZQ+cZhJUo0jx6Rv8eFTqx/c0RCHn5WkfRwj17RdduiWCoFPjbUomFRXPu
         enmYG34Go5E6sdZmmK2zysWk9YMS7PRfvK4taIPuYXoFr+aS2c2ydVQeLoGHH7+YuLxs
         TOlwc8jM9iggpoFx81ktlAtZ48sJo5Lt2zGqccTS7gFPzUPKh+cucy4VGwxtGGH4UpKr
         WiAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I33H4hwe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r1si860167qtf.38.2017.10.04.11.53.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Oct 2017 11:53:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I33H4hwe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36478 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dzond-0008B3-IX
	for alex.bennee@linaro.org; Wed, 04 Oct 2017 14:53:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38369)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dzoe3-0008LS-Lv
	for qemu-devel@nongnu.org; Wed, 04 Oct 2017 14:43:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dzoe2-0002uZ-UT
	for qemu-devel@nongnu.org; Wed, 04 Oct 2017 14:43:47 -0400
Received: from mail-qt0-x22a.google.com ([2607:f8b0:400d:c0d::22a]:48046)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dzoe2-0002ts-QP
	for qemu-devel@nongnu.org; Wed, 04 Oct 2017 14:43:46 -0400
Received: by mail-qt0-x22a.google.com with SMTP id z50so16036423qtj.4
	for <qemu-devel@nongnu.org>; Wed, 04 Oct 2017 11:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RF27WMiW7xZoIZt9j6TbVCEpaATPf5edbCN/DE5E1gw=;
	b=I33H4hweFXN3RMlvsEC/q9YeaZzuO+HqSOX7LDxROMvhHx+1kw0laz706mLw6Hxpcs
	BWNFqluoclCcoHP/scE7DaFPijTzkkbtqVhzbU1eFDuirAvSRoN3uckucEnsaosbYmRY
	jQYHlsZoacmhd3l60eNcwquL76hRXSSYF1d6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RF27WMiW7xZoIZt9j6TbVCEpaATPf5edbCN/DE5E1gw=;
	b=Y8r5ezjSuuO6YyO/Te3fasWl94BulpdSexgfGEbahO37kWz4w4Y36y0ttakeJR3IJX
	w5Z+cMRQ9Ce6jEcBKr5bH3IVoEKn05N05Eve48kOGc5kfVRuccTp1t5OXCjZI3rI0EP4
	89K/MlWZQ0pI6f0u0urWn+5zbWXK/pUDybEEfbtuuzQ5ZjM9zfyUmUsGi0CrEFoBbB6T
	oJajeSW9UG1Tdicoe9Hyq1fXU2DTjAUohc5CR/HlsFTaD/KvUTYB1MYVyFJip6ChO9wi
	RrSNFVViqAkBAhshrp/55a9p+D5ybBorDfaxYAA9U5NrCQlVxOcfyyTDOf91+8A28XWO
	MGfw==
X-Gm-Message-State: AMCzsaUXe5R9qslhpTOXEQjwstbLaHy7SuLrkm0TMxqAbOC4qUfa9Cu5
	szv/nJ4wIY+PVK8IEvVFZRzC4LCCFnY=
X-Google-Smtp-Source: AOwi7QA2M7R3rHotspdsBi/FQ2mWzmsPm9d5scZqPCeTZJpdQlpzY3xQTxoA8Za+GaYAphr5Qe+PKQ==
X-Received: by 10.129.110.133 with SMTP id j127mr4010605ywc.305.1507142626013; 
	Wed, 04 Oct 2017 11:43:46 -0700 (PDT)
Received: from bigtime.twiddle.net.com ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id
	o64sm3020464ywe.12.2017.10.04.11.43.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 04 Oct 2017 11:43:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Oct 2017 14:43:25 -0400
Message-Id: <20171004184325.24157-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171004184325.24157-1-richard.henderson@linaro.org>
References: <20171004184325.24157-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22a
Subject: [Qemu-devel] [PATCH v1 12/12] target/arm: Decode aa32 armv8.3
 2-reg-index
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
X-TUID: E7B7cQghV5Yz

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 53 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 48f30e2621..50ef2f1f21 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7693,6 +7693,53 @@ static int disas_neon_insn_cp8_3same(DisasContext *s, uint32_t insn)
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
+    if (size == 0) { /* FIXME: fp16 support */
+        return 1;
+    }
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
+                       opr_sz, opr_sz, rot, gen_helper_gvec_fcmlas_idx);
+    tcg_temp_free_ptr(fpst);
+    return 0;
+}
+
 static int disas_coproc_insn(DisasContext *s, uint32_t insn)
 {
     int cpnum, is64, crn, crm, opc1, opc2, isread, rt, rt2;
@@ -8414,6 +8461,12 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
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
2.13.6

