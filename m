Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12D6E9A03B
	for <qemu-arm@archiver.kernel.org>; Tue, 17 Feb 2026 20:49:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vsRzh-0005zC-4m; Tue, 17 Feb 2026 15:48:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osama.abdelkader@gmail.com>)
 id 1vsRzf-0005yf-Tj
 for qemu-arm@nongnu.org; Tue, 17 Feb 2026 15:48:27 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osama.abdelkader@gmail.com>)
 id 1vsRze-000480-Iv
 for qemu-arm@nongnu.org; Tue, 17 Feb 2026 15:48:27 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-48069a48629so43563375e9.0
 for <qemu-arm@nongnu.org>; Tue, 17 Feb 2026 12:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771361305; x=1771966105; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m1hBELbbkMX18hRUqpO9MNGDpcn4R+jjBIPGvu40z1k=;
 b=LNbL2NqmIECDeHByzN6M1igOTNLcsc0W374TWGzGBVHTHt0ndgDN6jfk8BD506VjAe
 pl/RHflR1nM59gV2gTN4n+UKkM13J6pjjWk16ITZNJq4m+CiHxua7cZxiIr4NgDNITky
 wrIsi7/2D8Cyri7U+nNszfGuGxIH1lm8RaDtFY2QAHsNg1vDnBkYvMlgzXkZbvOc8ohb
 5dHcXy0h/QWwOihw7/wgn3NFekSC1J5swCybRWuWv1YpF0nbxCuHAdD9XzcTDlYcbYJ6
 fnkjVoCr8pCTL5U6x93m+5ulgoXT4e7l+tFwMegaSOzovp31mx7IJWI+3Lu7FNi8W/fc
 ZlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771361305; x=1771966105;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m1hBELbbkMX18hRUqpO9MNGDpcn4R+jjBIPGvu40z1k=;
 b=O1JoL1UwBHmTcPuKaO60/WcUu6R87DLMGtP9ElhokQhxwO8gy4I2ILKVJQomgNMZXw
 aGu+mBkIFuNyuc/aoqcEqT0IeVcOFWWpc7C4hmTHDmSvHoiKvPoo1Zi6M73gFXjInsfg
 CAjSXVVHvTj0awc4OJ3F5NH1o4zGQK9ySy4hfgAPEgPL2i7CWe/lTs+LPGoA6PdQcwuD
 Q+a/atWR4Cyr+NdEXzWS2nE9OHfwqU+BB/vcivIrSslImPu249qmzZ4HLx5PGTa5YJyP
 USunDczQ1XNz64rYBaXrkTBlXgcXMkgPZIJNVQMIy6kJ2yLi4AirtANhRLichNdeA2bO
 WlwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwdQsV4+WSlIaZoO8VCWE9gNbR7VGedeMuWVUsobATlWOfo7WcxK+BZXXF8svdIg1ggvS3mEXqjA==@nongnu.org
X-Gm-Message-State: AOJu0YzccxIQ26bR8Jukfqbdkil7f5fxduGi83g+uu/bHmgE93VDFvUD
 2+tMw/uKKAYpxo1vx5KGPKUbb74fI4+EuX6Bbm965+Sw9I+fJ/jADXfE
X-Gm-Gg: AZuq6aJ1/bzagi4pN0UrJMNmkOqs1hIDvkpphSouhx3Brvb2DfAgSs84XyrN2ZpzROa
 Supeq1Bj7RbgyKdA3hhmlSAvLq9U/qZwpsHtReAjQm+Ffo2GcYEU/Fwu9ZkdI/LJfKIYD9rWlNo
 fGT7XKw7J7mIwdLDCGVLoJw3BenobB7cmVc2IhO6bAyiibflVhDq6lLbjMhR0jNxYwDcMvJZepu
 yuAbQFBYR1FvMG/Qq8kpWmqLLAZa6G2t3d9A/kEa2KAIItTOPf052BvLSdTP99fFZw1qcSFowHv
 vCeWbYbbr2pMYPJHVBYQPTC8fuJ7mRCRz03Bm8BNHZXng4FP0WW2qBAVFNp5kA8BWJHeGRER139
 fGL/UblWT1LXNh15Lnw1rRGTMaYLoROgyhTu0SsSqz/QzEbP7td3RAl6IBG1RzY7KcC4GeFvWa5
 iiPac2Z2hC11bd0uXC1ZC/BgHlPc1eXSA9edTaUoBOoi3X35YMEHN4mDs=
X-Received: by 2002:a05:600c:3f0c:b0:47d:5e02:14e5 with SMTP id
 5b1f17b1804b1-483739ffa1emr283738315e9.5.1771361304468; 
 Tue, 17 Feb 2026 12:48:24 -0800 (PST)
Received: from osama.. ([41.46.249.95]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483983d0df2sm1637055e9.8.2026.02.17.12.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Feb 2026 12:48:24 -0800 (PST)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] whpx: remove duplicate include
Date: Tue, 17 Feb 2026 21:47:54 +0100
Message-ID: <20260217204754.101223-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=osama.abdelkader@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

cpu.h is included twice

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 target/arm/whpx/whpx-all.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/arm/whpx/whpx-all.c b/target/arm/whpx/whpx-all.c
index 36c5e30a03..b0602266af 100644
--- a/target/arm/whpx/whpx-all.c
+++ b/target/arm/whpx/whpx-all.c
@@ -27,7 +27,6 @@
 #include <winerror.h>
 
 #include "syndrome.h"
-#include "cpu.h"
 #include "target/arm/cpregs.h"
 #include "internals.h"
 
-- 
2.43.0


