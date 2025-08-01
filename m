Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1BAC87FCB
	for <qemu-arm@archiver.kernel.org>; Fri,  1 Aug 2025 23:33:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhzDR-00064x-P4; Fri, 01 Aug 2025 19:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhz8x-0007WQ-Pg
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 19:26:31 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhz8t-0005y7-FV
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 19:26:31 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-76b0724d64bso2472044b3a.1
 for <qemu-arm@nongnu.org>; Fri, 01 Aug 2025 16:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754090785; x=1754695585; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zlUXIhi6h78CRePZELfzHeitKJjJ5bn9ta1i4YKR6R0=;
 b=C9VOhYYAMsIIqMhQ53njXNd9yo4/D5OAYr9vKGYtQ+smofTjnZPj+oEUL1Eb+4IsHS
 tpWEndfMj0a1EBihIhRrLAVq0dWZtcvabL1fa0iwp9RGTbDAzoCyJMfnF273w7Avoo9H
 3OTh0h2IOJ3aiz/uKFU8Z9CFhKCn+23JFH1v7CaJYAGnROay+Gw+KEW2BWpVd1gfA6pP
 +XqSf6Saql8M4gK9KS9hdP+QNe6uTN28tpYt8aoOs0M8C0Y0mVNNXQBlkAalHk3JVUYt
 azbhgWMOj+cVMD3xFtKjiwqdLi78kpgGO5pE1Jkyx3HcRxUNs2+9aTAqMmTrxaTrm/Lz
 MihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754090785; x=1754695585;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zlUXIhi6h78CRePZELfzHeitKJjJ5bn9ta1i4YKR6R0=;
 b=gmTZ9qKQuum6VS7B9JGsVyBHLuT/hOtDE3hgCJ0eJgnyp26Y3TF/iL3ePViPWQKUcR
 Yo5RG29/9VCQc7W9yC8Tw9uOg7HXXUYD1EaahRSOMm0vVF9OHwGEBumyg/rGAPOA4o8e
 nzuDpBvxR2aw1ch9rYNviu5chLwtAQpazDcnYgMveRNMK3Zg6NwXtdnXSZzEi8Jb+EVv
 U6+v27hg2uuqbWIEG2Lu4x2+FpeUeTZDH61i6sdqSi6dQUeFTb1wHLMPGs0z7+fvf72K
 xdRq08oS9TuSoOZBEYRC5poLWRjY2vZjLVTmxQ19duagdkykx9zrZKL8Tu+IFaYGyNjA
 +k4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmDbg2H8tLcYYYW4pRrtfM6Iy1K2CJbIGS92M66QYT2jeBei0ViksQJ20q2XdAS2gqdOA5jCzI3w==@nongnu.org
X-Gm-Message-State: AOJu0YynogOJxnQAO7/Y8EpTXWozcIh2V0J2AEWvcVxplfxVJUpHOxaa
 Ya0UtLyLDvrfUCiizmb9oQi/+36N/UHINrmvGh1mLycD8r8amllaJZP39WfZ84eSjDI=
X-Gm-Gg: ASbGncs+xbJN1fRw2xvNVse39tfndXxnDD92l/tjdit57jPQQz/luYJ8v6LBCR7UZmK
 8n76Fd+Tuj8Jdu/TqIzjX+4CPddAnwqxQcySFiVdfOntYDdvZzRmUyrjXL3zobTA0a2b1VR5Ccy
 LZn2iVgDV8WJCtuZXLpAAsDdhtX6XZ3awarLnSxHry0Kzp1ugOCvHYG8BSkSozoZ6dUoHXPX2Mj
 KpjSUzj5YwpIFWKlg4FhLZf5C3CyyM/GvxxXCzFgmUFei4zrnHzhebU2+L5Bh6xWeKvAYl1r7zQ
 4FnQlmC0+NnRVzZI80dzgsmIwP6zvUnOKo0C7/KEkeRcAbR5Q6CgEZUMOVlzi+f8NKxWsiVXA1l
 JJHQHwQ/yO9L0oezi7eCqVA==
X-Google-Smtp-Source: AGHT+IG01OBI7okrRxwg7bAA0tgYnaGw3fGVkgDnGnSC6XEP6eNOkzi1zRbpLsNj3l3FgdepOmRzEA==
X-Received: by 2002:a05:6a20:2448:b0:23d:dbe7:9557 with SMTP id
 adf61e73a8af0-23df8fa4df4mr1667364637.16.1754090785550; 
 Fri, 01 Aug 2025 16:26:25 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3207eca6d3asm5628217a91.23.2025.08.01.16.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 16:26:25 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, richard.henderson@linaro.org,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 10/11] semihosting/arm-compat-semi: remove dependency on
 cpu.h
Date: Fri,  1 Aug 2025 16:26:08 -0700
Message-ID: <20250801232609.2744557-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250801232609.2744557-1-pierrick.bouvier@linaro.org>
References: <20250801232609.2744557-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42e.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 semihosting/arm-compat-semi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 550c8f3589a..f4c92ab6660 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -34,7 +34,6 @@
 #include "qemu/osdep.h"
 #include "qemu/timer.h"
 #include "exec/gdbstub.h"
-#include "cpu.h"
 #include "gdbstub/syscalls.h"
 #include "semihosting/semihost.h"
 #include "semihosting/console.h"
-- 
2.47.2


