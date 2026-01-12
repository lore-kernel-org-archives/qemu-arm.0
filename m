Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41680C9EC68
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 10:32:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfFCW-0000iR-DD; Mon, 12 Jan 2026 05:31:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFCJ-0000Q0-0i
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:30:58 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFCG-0001eD-Ll
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:30:54 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42fbc544b09so4910674f8f.1
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 02:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768213850; x=1768818650; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iuteZZxP72AdlZG/ZllJpEmgG/znqQ6KfrKPEYlPSPU=;
 b=RHIpCqsehl4bge5RejRPLxpoE8U3D9o8Os0ghh2qzGztC5QWXAFrfxU7ldi5Z10eAm
 9bn7ny7I+U4KtmXFGfbgoODIa7oBtFJTVlbeoo5ze1eCfLpNtql7au4+dJwtlW//qhdc
 11krX4N99bfSnhQX8KTj+qDRXQv84qXHkAyvnH6VUONGljGd4EUmYOFU9tTZcuzp0/pf
 Glar4sQA1dHxz8QniQMFJZIZjWtY2PV9VW0DmRQXy2jQAJFzXTeSKWprnbZBYTQbGXU/
 McMH+butvmsCWMv29s1Xtc6uLKgCnHUjHGDkNKqnzCGKmLd6K4gUAT6zN6ZErLvK9Xg4
 Z9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768213850; x=1768818650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iuteZZxP72AdlZG/ZllJpEmgG/znqQ6KfrKPEYlPSPU=;
 b=uKlFKbuFDpZGboJtzZtSXmDYEnLdteJO4NXhK3Tjt3KYCD/UT58sf2HP23HWxrBaW2
 OBtxmXkKm7u5lWq8d5MeLaZXvf+doGS/wdhwrD4PULj2uGtS0XGOkyPew8QcnkSwgDLQ
 cKcWFGCI5ztwMcZ+xWXUMsPBYnYqP7J2UKxBktcx4cGyPn1qHWMcZeKVAtK8eRnsl3hr
 DAZs4H5pMhO1As54G1ka2x6lTD5LdUF0r3eaJoP+vyhpQS9kNGryLKDEmMGQZkqaFiSi
 Ag/lkeTydedhoCtq8VXKsjPMUuiBRiIKc9DtMRTx3is0NSKslMdWsQvsJldxNpTVITsO
 uZ7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3W1YfWjE9P/nfssTRAY2j/iBBMti/Lk22eY8wap9cVWPWNiLK2xCSGuRqlNiROAeS4Ma0rdqG9w==@nongnu.org
X-Gm-Message-State: AOJu0YwTdAhFdwEgYORvIy+93+atrsbb2ysfcQhQhyoowsKUEkRLLbo2
 aVpwOrTG1e64BCLPVbNkOYADfMs+LJFPW34QMsMF9Vi5mGVaB+b908ax/Su/bwUIUxE=
X-Gm-Gg: AY/fxX7tiPo/2aw/QVtJlt7SgXGiZwc26jCz3+bhwCxHzj1lVh83O6ZTuxqs995K3rX
 eTZY0leLPXHcI+s71UUgE8U4HhvvHaZRrv9dPELp7Hx9FtiFpb2k+z+zTSQbAxOolrYhGwARFx4
 ipw+7jsYFkSrXJ+YXJZkonVKlsejZON9/hXa0edgpg/a8zk8DdyO8mriPHyXYEEHcYV/zBy8peF
 kkOqqtH94hSColSMQY3441KS/XxWfq/rtIwX44i1Yy4LMdERHjtci3NC3VdvjRfW03FeUouA0q8
 hFgtoM6LKbgwqrMGPKIZvjXhfW6wDiP2cz+89/qHq4d1mXzW+YHhie+3W9nzrRhcIDAB7ZMkZFL
 SiPOx81nepf+olvH2UEanzBSF7YkKFH5+D4GnVEuuiufTcUadobnSeBpgB4bT9XFeDUFgMNUlSo
 Y9dlwKyyJ3gXmMLZsX2iLbZqWAekBBX3r0snbydhQE5NpWjbetDlqBwRcmZtQf
X-Google-Smtp-Source: AGHT+IF3ZTbLdnzutbrVwqWTwnPZgqWmiDXh0eTf7bS3s1GZRQU2C189gzuaYXrsvaFVRd2tv+1gxw==
X-Received: by 2002:a05:6000:4313:b0:433:1d30:44c with SMTP id
 ffacd0b85a97d-4331d3005d3mr1641586f8f.43.1768213849925; 
 Mon, 12 Jan 2026 02:30:49 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e19bfsm37495823f8f.18.2026.01.12.02.30.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Jan 2026 02:30:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Joelle van Dyne <j@getutm.app>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Nguyen Dinh Phi <phind.uet@gmail.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Peter Collingbourne <pcc@google.com>, qemu-arm@nongnu.org,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 02/19] target/i386/hvf: Use host page alignment in
 ept_emulation_fault()
Date: Mon, 12 Jan 2026 11:30:16 +0100
Message-ID: <20260112103034.65310-3-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112103034.65310-1-philmd@linaro.org>
References: <20260112103034.65310-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

While on x86 the host page size is fixed to 4KB, it is
better to call qemu_real_host_page_size() for consistency.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 target/i386/hvf/hvf.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 2023a7bfbb0..731cd954630 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -76,7 +76,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/accel.h"
 #include "target/i386/cpu.h"
-#include "exec/target_page.h"
+#include "exec/cpu-common.h"
 
 static Error *invtsc_mig_blocker;
 
@@ -137,9 +137,12 @@ static bool ept_emulation_fault(hvf_slot *slot, uint64_t gpa, uint64_t ept_qual)
 
     if (write && slot) {
         if (slot->flags & HVF_SLOT_LOG) {
-            uint64_t dirty_page_start = gpa & ~(TARGET_PAGE_SIZE - 1u);
+            uintptr_t page_size = qemu_real_host_page_size();
+            intptr_t page_mask = -(intptr_t)page_size;
+            uint64_t dirty_page_start = gpa & page_mask;
+
             memory_region_set_dirty(slot->region, gpa - slot->start, 1);
-            hv_vm_protect(dirty_page_start, TARGET_PAGE_SIZE,
+            hv_vm_protect(dirty_page_start, page_size,
                           HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC);
         }
     }
-- 
2.52.0


