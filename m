Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5183060ejb;
        Tue, 7 Feb 2023 02:10:48 -0800 (PST)
X-Google-Smtp-Source: AK7set/9AnIBby8a05GhBBN5V3X2/7Z/glctykEgJtLcCHDK6MaVJsLprig7PXRRphrqgP0Aik0g
X-Received: by 2002:a05:6214:5191:b0:56b:4e51:acd5 with SMTP id kl17-20020a056214519100b0056b4e51acd5mr4038710qvb.12.1675764648647;
        Tue, 07 Feb 2023 02:10:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675764648; cv=none;
        d=google.com; s=arc-20160816;
        b=XJ1as/2gNm3+tUIRXS3S8OMrSedZLtSfRrYqw8yL1n8eUDhFM9IV1Prn0UybynDqmA
         l61ESLWSMtSSV9ejwWuQoUNkfp7PZmeM6CVxNSbUcB1v+OQUrh06hLj+oxifL0ims+QK
         2V5tSeAKjpB6CAQiXgeQc5Ue5HbsBix8J+MPpYLoJREoeV3uXeidQN/CtJuDThOQDkbl
         WJJCnfOUCABPp0sdlww/BbJP258QZ4m/Gwi8bAsJmvoiUmTBRNoAHvQXkpv0wxTKCAfW
         VHiXlqA3zEvhvxzU/Irco7Moawz1PSEKJmXKuoMnHtDaNEb6Z6VnCJhCGf/W2H+iwMsd
         8zSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=+e/febQ2qRKJMoMl3CWoUaU0wqC7VTWD48Z13Fs/5x4=;
        b=KT2tD2pV0AgQek2DDB8J+qrULD4ww3NnRHtWpOg6JxQQvQ4HTL3HyuEfCHTGwFD9ZE
         hH7zGIt8NZ/wOwV6Ra5LO2KeNIiUGAp59oDupJGLqq17xL0siAnKWxCMwmsUEFHk0SuU
         kvP4K2u4t1H/jj3UexOmWnHCnOhyPzUWHWQC2BXaGI713OzBhDv1XqbNxSHKSNKmkKgu
         u7Z0IJTp18T5pGO94wtwSBoGInmLxZGntFcgThz6PDTXoxBHMe+UWQAsuuqQnR7LkmEP
         Eee8H6AmnIvhJn1NuLKBE8TBmtKy9+YlQG93IfCEhuTiqu8GBWNl38l9Ye1Z3ZVYydz5
         78Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c1-20020ad45ae1000000b0055863bf61f8si10810774qvh.272.2023.02.07.02.10.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 02:10:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPKuM-00012P-FJ; Tue, 07 Feb 2023 05:09:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKuH-0000qI-3s; Tue, 07 Feb 2023 05:08:57 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKuF-0002UP-2q; Tue, 07 Feb 2023 05:08:56 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4P9zP16mTpz4wgv;
 Tue,  7 Feb 2023 21:08:53 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4P9zNz6dZpz4xGR;
 Tue,  7 Feb 2023 21:08:51 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 23/25] hw/arm/aspeed_ast10x0: Add TODO comment to use Cortex-M4F
Date: Tue,  7 Feb 2023 11:07:42 +0100
Message-Id: <20230207100744.698694-24-clg@kaod.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207100744.698694-1-clg@kaod.org>
References: <20230207100744.698694-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=a43c=6D=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Q+Ucu/NKsUx3

From: Philippe Mathieu-Daudé <philmd@linaro.org>

This SoC uses a Cortex-M4F. QEMU only implements a M4,
which is good enough. Add a TODO note in case the M4F
is added.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_ast10x0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 5c794c2420..649b3b13c1 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -420,7 +420,7 @@ static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
     dc->realize = aspeed_soc_ast1030_realize;
 
     sc->name = "ast1030-a1";
-    sc->cpu_type = ARM_CPU_TYPE_NAME("cortex-m4");
+    sc->cpu_type = ARM_CPU_TYPE_NAME("cortex-m4"); /* TODO cortex-m4f */
     sc->silicon_rev = AST1030_A1_SILICON_REV;
     sc->sram_size = 0xc0000;
     sc->secsram_size = 0x40000; /* 256 * KiB */
-- 
2.39.1

