Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE26FCA9ED2
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:53:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY4h-0001tK-4B; Tue, 13 Oct 2026 04:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3r-0008Dv-Pi
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:40 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3p-0007zQ-EO
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:39 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-49d0da752ffso24461455e9.3
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880836; x=1792485636; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=xzgSRPibV+W+TuXoD9LFFebcGlaP5K/iGBnAO14/huw=;
 b=YoRRJsqEJnzWcEg2WqDBQrzvSQsyjmJTmriLnw65nQo24cHuKTYcIAwo4ODIeDTMoo
 0GjRGi/+bOugV0YQsu1AALL7l22frSSdZlWmkJqnB/lG9hfnnlwKdNkUgCYWlKscIAZZ
 ogNp0gGxpzbrpAjmHsT7WFA2BAhNWsOxb4uhGxLDY3SqkI78Y8Of1bgeuod/eyOzpjVX
 9Tly1DfWSaEDxULtTUHGj2qimsssz4xUYzJzD3I+ClEFyZsZHe4IJHEo/++JcOclnrx3
 grdkNh7SHhyLNVtwm+i6qCfwDa0UlzbipNHFqIKUgAo/3tfhXXhhbfGFN5p8nCT2FFGQ
 62yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880836; x=1792485636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=xzgSRPibV+W+TuXoD9LFFebcGlaP5K/iGBnAO14/huw=;
 b=hyz0B5SptEHo222npM2lx7UK1XHmzJUTFKwIPUQUM7x1HSUlRegJzjkDP2YgkgjKe9
 lQja2Pmgzp568tm5F2DUmBTePppadfJc5GtF8uZCW0z40OyGUP0PIWhipgBSDkGmuG9A
 xrqSMjm3A5SNSy1fqrtyxktFxCC79TPONRDMgfjVByMfWLD3A3Ky5qjTLKNHjPlyCRJk
 Wtju1tM2+t1ErzHS6pQoDsyiaa9qN9LhIxHlLtzd8Kj19QDxg6eI2KaHSdNC72qRjlaR
 vM439zaXk/jOSU9SridQh4WCj35QwOTIXa12xhPG7IvF1S1aEnmi19/S+eJbNkeHIovW
 S5Iw==
X-Gm-Message-State: AFq9FYJLX3eJYJAkKtdsHSRq6/LifYjcMuURl1mJSDJz8UbtiKC2c5Ky
 x5b36jUKP48BBwTJfHvoMBYmB5cwClQ3f4y/5TNVTpsNUynuqJnGQ5J6OJTOixTPgSb9CBngbsN
 kM3r4fUU=
X-Gm-Gg: AYBFou1TEPAe5CSo2j7Sss4hZezGbfEtgosUdbhGap8R4FHsK2rctXMQFGNxtf1UCvP
 Y9vnb3SAVEjeUMZaHUGAzBR9Y2hyx6c2PcB/gADTFvDowRh9FB/TO4jszg4fWxTBMavaHOsKhpi
 YzOLUzqWE+i/b5cEZIWfJR3Rbm1pE0lXJfN90p2IOeZs18ATcVPRIXvsw4F7k2rTzro53xFwatH
 FjeOa1CVpCwEhCkZ2UkfL9dyr+ZhPXMWRy+HltFE/36N+wyJ1oDehsQZ72tJqTvpmwCgUWtFdTC
 m8/NagIcIWn+cnq4wfMiWWrHqMDoqM5LotdKpe6R70wnWiC8Pwb2dLQDDx+f2UiZj2CFGfhYbms
 KJn0Azzo2vISw14yCmAXCb9UhwC90cs0dwmAtv4nhWkE5WJXKtlOcIkBa8/IMCKHxWTSakHSXe2
 lcNMZ2scXU+bSF5xalaASIVB3Yex1EsN75SXx4nplbP3gyTZYoCs0yiAR6WyixS28dxjNa3mZRs
 EV3WocyvM7T/goDjTHY18fYPZzclmEn1n5aFp9JeI14wt187B8PseoGnBKoYIMPhmVYwRv33FGl
 ths=
X-Received: by 2002:a05:600c:8716:b0:4a1:62b8:9aa1 with SMTP id
 5b1f17b1804b1-4a18e44885dmr236696575e9.2.1791880835847; 
 Tue, 13 Oct 2026 01:40:35 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:40:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 43/86] target/arm: GICv5 cpuif: Implement GIC LDnnn insns
Date: Tue, 13 Oct 2026 09:38:50 +0100
Message-ID: <20261013083933.1024405-44-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The GIC cpu interface has a set of GIC LDnnn insns which behave
exactly like the GIC CDnnn ones except that they always operate on
the logical interrupt domain.  (EL3 can use these to examine and
update the state of the interrupts in the physical interrupt domain
for lower exception levels.)

We won't need these until we implement EL3 support, but since
we've put in all the necessary groundwork for the reginfo
structs to just work, we might as well add them now. The writefns
will select the domain to use based on the opc1 field.

As with VD, there is no LD insn for CDIA, CDNMIA or CDEOI.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/gicv5-cpuif.c | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 64e59589cc7..69e51359f22 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -1501,6 +1501,46 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
         .accessfn = access_gicv5_ich_reg,
         .writefn = gic_cdhm_write,
     },
+    {   .name = "GIC_LDDIS", .state = ARM_CP_STATE_AA64,
+        .opc0 = 1, .opc1 = 6, .crn = 12, .crm = 1, .opc2 = 0,
+        .access = PL3_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .writefn = gic_cddis_write,
+    },
+    {   .name = "GIC_LDEN", .state = ARM_CP_STATE_AA64,
+        .opc0 = 1, .opc1 = 6, .crn = 12, .crm = 1, .opc2 = 1,
+        .access = PL3_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .writefn = gic_cden_write,
+    },
+    {   .name = "GIC_LDPRI", .state = ARM_CP_STATE_AA64,
+        .opc0 = 1, .opc1 = 6, .crn = 12, .crm = 1, .opc2 = 2,
+        .access = PL3_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .writefn = gic_cdpri_write,
+    },
+    {   .name = "GIC_LDAFF", .state = ARM_CP_STATE_AA64,
+        .opc0 = 1, .opc1 = 6, .crn = 12, .crm = 1, .opc2 = 3,
+        .access = PL3_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .writefn = gic_cdaff_write,
+    },
+    {   .name = "GIC_LDPEND", .state = ARM_CP_STATE_AA64,
+        .opc0 = 1, .opc1 = 6, .crn = 12, .crm = 1, .opc2 = 4,
+        .access = PL3_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .writefn = gic_cdpend_write,
+    },
+    {   .name = "GIC_LDRCFG", .state = ARM_CP_STATE_AA64,
+        .opc0 = 1, .opc1 = 6, .crn = 12, .crm = 1, .opc2 = 5,
+        .access = PL3_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .writefn = gic_cdrcfg_write,
+    },
+    {   .name = "GIC_LDDI", .state = ARM_CP_STATE_AA64,
+        .opc0 = 1, .opc1 = 6, .crn = 12, .crm = 2, .opc2 = 0,
+        .access = PL3_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .writefn = gic_cddi_write,
+    },
+    {   .name = "GIC_LDHM", .state = ARM_CP_STATE_AA64,
+        .opc0 = 1, .opc1 = 6, .crn = 12, .crm = 2, .opc2 = 1,
+        .access = PL3_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .writefn = gic_cdhm_write,
+    },
     {   .name = "ICC_IDR0_EL1", .state = ARM_CP_STATE_AA64,
         .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 10, .opc2 = 2,
         .access = PL1_R, .type = ARM_CP_CONST | ARM_CP_NO_RAW,
-- 
2.43.0


