Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA08606A31A
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Oct 2026 16:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xP7BEx8s
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIq8E-0007dB-82; Mon, 19 Oct 2026 12:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xIq8C-0007bt-BI
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 12:22:36 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xIq8A-00010h-JY
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 12:22:36 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a1ec92f655so9284555e9.0
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2026 09:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792426953; x=1793031753; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=rb/hV+kc2y+cyLc/E9FJoAdgtXpSI/AdRDMtqVqJdQo=;
 b=xP7BEx8sbtRQxwMnmkiaeR51cBUgHel9slKrK+UnZ99WMFSE2gxxY0s8XV+VTwFWLt
 LRNUVKXzlQX/9KqMFgmFUKevpgFcYMQGBr9l2RwM/W60u6DFbHOP6bUAmQsfb8FAxamT
 FubrzBIPra6qxDKckfj/ZYa7g3Kiczf+U3VxEldUOqOfMsEfcH96xO9126g7t6LyGIAh
 wxj4D/PNqzDpl8/xWhROnLnfl4heIRM3atbH5v+ar2/PdSLwcMFz4/yQCRYRuINnUs+J
 33CJWBsGHrMgVf0miHE+yPzFllsnsAzTSOqAoocOfliDldxfR+2HS6lNqOOGJpaf4kgN
 Tl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792426953; x=1793031753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=rb/hV+kc2y+cyLc/E9FJoAdgtXpSI/AdRDMtqVqJdQo=;
 b=FMYjrIkujbltRBk2AKHOea+aiH/yZ+un4Kbw+oG1CQoEcI6M59uzUHX9SJrx+8nl5a
 htiCeid6g7O/zXYw2t+NcMS8r7Lx2Vw74ugj7g8F68pCZWmFwEQJ/2DQ8UsLvpoGck65
 q3o0Uuv/u+zdE9T4VE9CWu0yD9vxCjv6Cmt4zXMFY2ZRWt/hXnS9VzuJnTk38cZtLf6D
 t0/Pi9RsrrYBQGUATPJ7tketdbco9f5tpTgEwiZiN4v15TTtra44IDoSObOBlLqDE8a3
 p6m5oMvp1vgaZ9EBkMKqCtOwGiN2TkKtyvojlu1zKLkcxq/oWc0z+VUoA2uUQqfsZDDn
 rr0Q==
X-Gm-Message-State: AFq9FYJxy9HxHS6/MmwrYhJJ32pZJ8JVjECfArqgM2W98wsbUguEqpB0
 cnsd8ZViRtfdKFStW+Y8EhgB9VOnZZtM5XO/bHOcyzld64GENu+SFwd0Ye6oewDqvciUyGGt03t
 9YQI8gns=
X-Gm-Gg: AYBFou37SoRo7da0An9LUOms3t+1UOoXT85jz6H+WzjwRWkJQis20PLFcwZwsWqHj09
 ABUZFuVue+zjx6lbx5eaV6TDWYaylIX7TlT3Wn3TJUgDc4QtbEl8/0imMGeEzDC3gPS0K722nFS
 rw1TQFEFLJFMH8LETnx2oGGl2qcJFu92mXby/SlVkBImeSABEJby/8mj094aqtZW2XYHgG6dXOJ
 7KyNK2wVu59DemZAK8hzr1bovlVBEfVtmFkpT9JU3sZFWLcLZauKFGDfc6cKQqZza/Sncr3DwRI
 UAr/Jn7+nAS3l2v9Q508ujlY2KqGbqUh0El6uczGnBLnydWIthjNxErabaIxJhI61ES2BMOFcoe
 hN0Ka+3YsbYJ9vWK+MGYy76IE0tDC4GXO//oQTkNiSbwCpJDwbhhumfu7QjyZyLdz1Bo6YFqwT2
 nMbMb4jzR976bht5Jzc5gcsMpZL90vyLkBJAikOIzmdic52e4cHY5/wLYj+yiA/8Ib4V9xxpmA8
 Oi7r27/t6Eq3iXv6kMB7pMpKHktwc1T9sajWvzINlZymwmLMXuwJRcw74RLBXgx5LKwYByVe04Z
 14M=
X-Received: by 2002:a05:600c:4f88:b0:4a1:9c71:9f17 with SMTP id
 5b1f17b1804b1-4a1d75fe190mr168114545e9.9.1792426953065; 
 Mon, 19 Oct 2026 09:22:33 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1f2cdc342sm3100095e9.13.2026.10.19.09.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 09:22:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/4] hw/intc/exynos4210_combiner: Make reg_set[] only as large
 as it needs to be
Date: Mon, 19 Oct 2026 17:22:16 +0100
Message-ID: <20261019162217.3272337-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019162217.3272337-1-peter.maydell@linaro.org>
References: <20261019162217.3272337-1-peter.maydell@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The reg_set[] array holds the register values for registers in the
"sets of 4 registers IIESRn, IIECRn, IISTRn, IIMSRn" part of this
device, not the extra non-grouped ICIPSRn registers at the end.  It
therefore needs at most 0x40 entries (for registers at offset 0x0 up
to offset 0xFC), but we oversized it at 0x41.

Reduce the size to what it ought to be. This is a migration break,
but we don't care for the exynos boards.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/intc/exynos4210_combiner.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/hw/intc/exynos4210_combiner.h b/include/hw/intc/exynos4210_combiner.h
index b1db48cb880..94177827196 100644
--- a/include/hw/intc/exynos4210_combiner.h
+++ b/include/hw/intc/exynos4210_combiner.h
@@ -39,7 +39,11 @@ OBJECT_DECLARE_SIMPLE_TYPE(Exynos4210CombinerState, EXYNOS4210_COMBINER)
 /* Number of groups and total number of interrupts for the internal combiner */
 #define IIC_NGRP 64
 #define IIC_NIRQ (IIC_NGRP * 8)
-#define IIC_REGSET_SIZE 0x41
+/*
+ * Number of registers in the IIESRn, IIECRn, IISTRn, IIMSRn part
+ * of the register map.
+ */
+#define IIC_REGSET_SIZE 0x40
 
 struct Exynos4210CombinerState {
     SysBusDevice parent_obj;
-- 
2.43.0


