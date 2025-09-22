Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842FBCAC592
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 09:39:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0d12-0004xf-Uv; Mon, 22 Sep 2025 05:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0d05-0002dr-G2
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 05:38:30 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0czH-0000gz-Us
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 05:38:21 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-46db5bb2e9dso2364205e9.1
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 02:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758533847; x=1759138647; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HhK8fyrcFTNAXAyMAUB3RJqIdZ7kdSjQMi97UpXe69Y=;
 b=X7LpoajZW+Rw2cWLMTTqy4HXpPLkYIY3ypSaeEMiTr7H4vKai4EZ/bU5aNVxOhFKCq
 pRqYGmaSY0JPhKgBbVEoEMJS2MiuDa0I8yj+8fKGCpAbdEKa++QRD6cCeAM0+52hfGv3
 eYwcWgIq/8vx9rl35SrM5OPGbgllYReg2l9hth5U0kA1G06BYpwb2ePsl3cUf2FiEbSd
 h0nsgObv2V0gCY7xHzzkdUZB61hCiFI1OsAGFWk1duaB5oo35Yx9YKZHWux8/gj8+nZ2
 /tDGCJyTKbPlm3ZhSjBLcEQE6S1zH+YI7QgVZiyjQAFhiVVx5RA+4r62D2SJFgDeKv1K
 S1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758533847; x=1759138647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HhK8fyrcFTNAXAyMAUB3RJqIdZ7kdSjQMi97UpXe69Y=;
 b=gHZIoDp+i3UqQbbEzBOmu46ypL15ua4ijo1luWYfuTDUTlP22jYS6wUW1RJ1HsPgn7
 1l/EuErY9hjGDZWxbbUWpEMM2LoAvkmIQ+b9iW+oqDydNCNUqDGL9BRuonhOhVcxBiwM
 cJpWv/w6+v+LEEkfZgFnGOq7yuZmP/TdHfeAhyO131JW2Do0bIN7n9x5i/vcb+ntMjAp
 izeyYyczMK178mUsuA0O+hPb3XWMdertYvmrIbRKSbRPZeSk2L2egEhctwY5bLydvDaN
 rMia7g9RHFPv1aJN9whgRGT0GCKlpuxFv9yrU0LdVnDBtWGHELAx7okanKlS+O+Gpt9H
 nFtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyLANPf3NfocIJwUwdUzQ6AsSevdfQavMAmNWR4gfS7YjSHo7WaWf1twjHKN3lGsqpFqZqzV0rxQ==@nongnu.org
X-Gm-Message-State: AOJu0YyyAH9/rUsg8+kXQ7Yj2d5893FKIAq0hVZR5/OWFJkYDYMmaA4t
 yFTVMJn8Eodft3RcM0elTgvDhv6KBIL8XvaB8Nv/tAS87njMo24LCZROwKcYJH5njkYWm1i8zfe
 R45DT1Gs=
X-Gm-Gg: ASbGncsTogpcVVnLffwzgPOgQ+HVp2zCoC2EZ0oRHKI661+IE5o8ubf/EKM54WrqL7W
 Nq1kxhkjox66mZzkfcKP3a8kxaUdBm+CbzREf0hMLNFcXNv1lJAiW83kJ2CPOAsdtWaELJbk85U
 gKLYjrzZ5c2KF0urI7ABsrqw/iJm0fyTRcOjnj1/PzGIXftUgdw4yvTl/9g4YJi15ujrmWshwiz
 E/j5iuO6hUicip3nsw+r/ef4Kx2OXxLFQ2xVCNsdQudXaRQ+EliNdJKOG67WDFQlhRv4/MSp4bB
 E7FZzeCH4DMDpKVD+pnB/TWbAA1f4hJHpw/bgJmTSnSml/6aDKG+SELameAejKfeeE17FcD2+C7
 o9WkKCXB667tSihjcK7SHks8=
X-Google-Smtp-Source: AGHT+IGvQykugjERs1DlA2LnPsomQf1DGNlnVD8bMHEgKSQkEZejic/RFQxHWt2Vc5BbiDz5w/FJrg==
X-Received: by 2002:a05:600c:a415:b0:45b:92a6:63e3 with SMTP id
 5b1f17b1804b1-4652c9ee679mr123352865e9.9.1758533847227; 
 Mon, 22 Sep 2025 02:37:27 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee074121b2sm19130261f8f.27.2025.09.22.02.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 02:37:24 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id D9C655FA16;
 Mon, 22 Sep 2025 10:37:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 14/25] semihosting/arm-compat-semi: remove dependency on cpu.h
Date: Mon, 22 Sep 2025 10:36:59 +0100
Message-ID: <20250922093711.2768983-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922093711.2768983-1-alex.bennee@linaro.org>
References: <20250922093711.2768983-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, TVD_SPACE_RATIO=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-ID: <20250822150058.18692-12-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 semihosting/arm-compat-semi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 3c9192d8684..61001267965 100644
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
2.47.3


