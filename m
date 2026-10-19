Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B44606A31E
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Oct 2026 16:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ig050lYi
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIq8B-0007ay-Hw; Mon, 19 Oct 2026 12:22:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xIq8A-0007aQ-4i
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 12:22:34 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xIq88-00010N-C4
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 12:22:33 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a1635f7c89so22528285e9.2
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2026 09:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792426951; x=1793031751; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=Iick0y2AGxfKXDLVnntT9WyV/jbAX0Ak+ln5YPzpJ0o=;
 b=Ig050lYiL8CXEIKyvLff7r6qP0COYDt3FqLjsucto+fnvzXBwR7Lex/szBlH7a1ruD
 cxEfL2af5FsRWMr0sLVFDUVkGNztqHkOkdK3Vq3uqfosRe1P3OvBYBO8aJc+kMTWXzkS
 O9OeVKarQkggGL7vNRzM83tF6wxqvB6WL6xaoFos7LjLgJgQARx/TS8diAIT6Vzm91Fd
 lDmfeeCJTXZSf0M5EN3aBG80wih9QRyyjo80AFEffIG8yxHDRLXFtWPAS9zHCVXNV88r
 MvzVMz1lXyjGZgJ32buvHddqPdhr3co8iguoG6kYePWzaU306bdfbPA8lwbj9TRIA+oS
 qcsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792426951; x=1793031751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=Iick0y2AGxfKXDLVnntT9WyV/jbAX0Ak+ln5YPzpJ0o=;
 b=VEtSaG3gfLhlOBG2XTPPOZ2r0AEVyH0T/O1+GEoF++oeEcGXE2I2+QXmLNZ3TV6rds
 oHzn9UOrBo4k+GqDNI5oCs6fzRQFljfSMTu4suGXlW6yHeWfoyL05y6+utDbljHfFOIH
 E5c2GUP8k6+yJk81Kmwj4+jX+zhf+SWs3gK114pT1606CKktWah/dJzeNqJFd+FH6K+3
 yc4H/ISZE090KvYTFbfU2IqNqHln6+B6CdMsxknmkpIGD/AL3vWlumOMccvuchgwGsKm
 LzYI+rJpb0TQABq4arMcdAIch92IM+GhoSQg2qrJVl3/MuZ/7/On7FGYKcqKTptwv5P+
 uZcw==
X-Gm-Message-State: AFq9FYJb9pXG8W3EHa39NHbRxwUwH2slBs+Sl0pY5hNYyyaE67EEZ8b6
 EieayFX7IvMSb14Mt1sRX7GCLfBQhO9B94rfa27asHwHUnruKvetnRrbIHyWtU9djc1KEGMWJxe
 QVe6yEp8=
X-Gm-Gg: AYBFou0Aqxk9047Q2aQUMEA+raWYdnWyyM/B7T23DYEnTe9oS5pRKB8svU8O39lVYQu
 b+n8INgZAdVfTSiwN45YNztF0rcP+Nc2c3W2aix7KZD0ed5KbbzJj2Gw+h+2We4JrQz9GMXUYt9
 gp42ndpGOoiPgGD2MiyJBb23UbL8q3oWkssJcRxH1Jg4a8i/oenhplJwT7Y/WN8JUBRuNEyN6Ra
 B2a/huIGjDJivuMyD+/T2aC50nir+sEJtmq1997rgtdSceJqsViFE9SRpTgZsHaVJ7Pfyc1kJNH
 i3/Ogn2fYlawYJT618m1usG9+OIZOh98OsQ/BgSJXGFZpZrKUH19pfGVBESOMUO3pdXn40P/xXH
 EI6M77L/l4QUULAsKv39H07bjT9Wb/VY7rcDk9vrJLUNfsMRtlrYAqPNq/T2CZ82dPaZUC10rXB
 8lM4NySMsoIHnj0yk/fi4qraa7xXp8/296xCcYvQsRdnkUa8djIFdvxdvFvZ0LEchUyvydBtw/i
 8D8ocGS6eKD1XU3E6DTJaVaxCM606gnpDMd2vQ39O7E1ZqVnXonDUkgpHnmSbwt6jvEkS0RnpPr
 IrB9Y9udWj9/cg==
X-Received: by 2002:a05:600c:3547:b0:4a1:7c56:d4e2 with SMTP id
 5b1f17b1804b1-4a1d7608dcemr170293325e9.16.1792426950700; 
 Mon, 19 Oct 2026 09:22:30 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1f2cdc342sm3100095e9.13.2026.10.19.09.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 09:22:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/4] hw/intc/exynos4210_combiner: Fix group register range
 check
Date: Mon, 19 Oct 2026 17:22:14 +0100
Message-ID: <20261019162217.3272337-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019162217.3272337-1-peter.maydell@linaro.org>
References: <20261019162217.3272337-1-peter.maydell@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The exynos4210 combiner has registers arranged in sets of 4:
 offset 0x0: IIESR0 (handles interrupt groups 0..3)
 offset 0x4: IIECR0
 offset 0x8: IISTR0
 offset 0xc: IIMSR0
 offset 0x10: IIESR1 (handles interrupt groups 4..7)
 offset 0x14: IIECR1

and so on for a total of 16 sets of registers, which puts the final
IIMSR15 at offset 0xfc.  After that come two registers which aren't
grouped, ICIPSR0 at 0x100 and ICIPSR1 at 0x104.  The entire register
memory region is thus 0x108 bytes.

The logic which separates out the "offset is in one of the sets of
registers" from "offset is one of the ICIPSRn registers" is
incorrect, and so a write to offset 0x10448100 (which should be
ICIPSR0) falls through into the code for handling accesses to a set
of registers, and indexes off the end of the s->group[] array.

For an input offset of, say, 0x3C, req_quad_base_n is 0x3, because
this is in the 3rd set of registers.  grp_quad_base_n is then 0xC,
because this set of registers handles interrupt groups 12..15, and we
will index s->group[] with grp_quad_base_n through to grp_quad_base_n
+ 3.  IIC_NGRP is the size of the group[] array, and so we need to
check grp_quad_base_n against it, not req_quad_base_n.

Fix the bounds check, and add an assertion that the code path
where we are beyond the register-set range isn't going to
overrun its array, which we know to be true because of the
size used for the MemoryRegion.

Cc: qemu-stable@nongnu.org
Fixes: 8e03cf1eeb1f9e0 ("ARM: exynos4210: IRQ subsystem support.")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4709
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/exynos4210_combiner.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/intc/exynos4210_combiner.c b/hw/intc/exynos4210_combiner.c
index dbbdee4d316..4f079fedaff 100644
--- a/hw/intc/exynos4210_combiner.c
+++ b/hw/intc/exynos4210_combiner.c
@@ -91,8 +91,9 @@ exynos4210_combiner_read(void *opaque, hwaddr offset, unsigned size)
     grp_quad_base_n = req_quad_base_n << 2;
     reg_n = (offset - (req_quad_base_n << 4)) >> 2;
 
-    if (req_quad_base_n >= IIC_NGRP) {
-        /* Read of ICIPSR register */
+    if (grp_quad_base_n >= IIC_NGRP) {
+        /* Read of ICIPSR register. MR size ensures this must be in bounds */
+        assert(reg_n < ARRAY_SIZE(s->icipsr));
         return s->icipsr[reg_n];
     }
 
@@ -184,7 +185,7 @@ static void exynos4210_combiner_write(void *opaque, hwaddr offset,
     grp_quad_base_n = req_quad_base_n << 2;
     reg_n = (offset - (req_quad_base_n << 4)) >> 2;
 
-    if (req_quad_base_n >= IIC_NGRP) {
+    if (grp_quad_base_n >= IIC_NGRP) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "exynos4210.combiner: unallowed write access at offset 0x"
                       HWADDR_FMT_plx "\n", offset);
-- 
2.43.0


