Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC0BCEACC9
	for <qemu-arm@archiver.kernel.org>; Fri, 14 Nov 2025 20:11:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vK08d-0008Lx-HZ; Fri, 14 Nov 2025 15:11:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vK02G-0006li-CM
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 15:04:44 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vK02E-0004kV-MX
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 15:04:44 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4710a1f9e4cso17431435e9.0
 for <qemu-arm@nongnu.org>; Fri, 14 Nov 2025 12:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763150681; x=1763755481; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rvdpQqu+6tXXSi2BeJVnKSBoAv9PMGvcr8JslOxrI6M=;
 b=KiU904us8oftspXA1TTMuy/gWi46WZ1tqQL5Prex/xC4QMT4hPrRX9O4AIxDXoNftd
 pbqVb9THp0EuYTqKYaAngJCPKDv+dB6U2e7I/fmjW6FcCYDAYsLEEcNFhzZwTsD8q4fE
 KKWAX8fjUtRbucGWayJVJGEbqAR2UljwtdDUcN+7rChSVYmBmpgzeCzR6tnQciF8ZGnr
 ApbEMH0vXztrdnzTi5OTnKVTYcZCErgu7qjQudSNvzTF3QXpo1AkWIaccnp58t3Kl5JB
 sE5m8Zn/r4Kkk9eHgSp8JQKQNAb4VvYvOQILFLP45IKP4BC9A2E4KhfGLgiP3K2Sjjid
 Koig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763150681; x=1763755481;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rvdpQqu+6tXXSi2BeJVnKSBoAv9PMGvcr8JslOxrI6M=;
 b=ursg306FH2ttoek7vUUnnWRkZmOn3Go71Co9eg6IVwb5CN4r1RnCKPipqcZ+HFvePw
 D083tNA8yO+Fb/1JjrR4bmpHvvjuLcs4WWjIvI//k94GnA34VKrZesVaVRMsxIfmvT/M
 9GWFP0IfKkN6uAJmitXdFor7ODP4y9N/bUWzEIWu3GAjp/EWwbYPedbS9fnWY/APYFdl
 PmI5gDMjawhmNNgK2aN+bdNzfBdIuWducPxWrKJmc5ZAFwyzsVQx9kmGijBrY4uNoILx
 uRUP0KBQs6MVrTpGf+XrO9+4qpM07ZPeDfLNPbGbW34VQIi5q74y/pUe7lg3+KCrZ+6t
 nK5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJRB6HfX/ijm3FMqcTzp0e1GHnGYBuwLbclEgRk0SNgvi2xNrTHAvSIPrJVKrRprWK0Lc70Eif2w==@nongnu.org
X-Gm-Message-State: AOJu0YzlXiq/C7vMWpKCDhw+sPBBkesxfLPziBCMG+W5SfX/dsEkwJ/6
 r9eUSs115gquxr77mL3xZ6koRYjGoxxMUYBIg5kF24/cM8sNvS/AF04JSIyolWVECQDgE5vCvbJ
 QvDIDQ+kjuw==
X-Gm-Gg: ASbGncs/J7sJ+zKDE/USWNkg+pIbN8u0qwlY42duJhfLls5mjhztm4/HYCNMptlKjbz
 sWzVXGY03E/9GVxpxu7/BhJxSlF4GzwyEB6spkGMDKUBgz/lT3Y+EtDC4Uv5uHuERCFc6UVWHyc
 S5ZTTA/43PaFfewaRxSk6tFRm4moiruHr0WQrCTSMkqUtLRrOert1G3ZxAulZNUOhhtYW/Eazah
 wVwSq1YvGGt1QbH7eXG43TXSYF4IhhG9PpWgkmdPl9D4L1X4wqsDEUkC5f+yfzJ8Y0p/4ppsUOg
 1LsGzLXHWCg9Wuhq7XMn5LHe1g7/QHJ0uEciRXtFEC7iUkCPJP/xDMjjhZSAn8fXIJdXC+5m1qj
 XbO42HT/SXN1iMfom5g1T0caapYI+LgZqlLwDqvw6FSW/Pe4FjOzXEoa36nI+xci+n+g1p5P+v3
 KKYjksA++JK+RIsnBaPL6SoCoGxElRoFjJIczzHvaE+PWoB9udYA==
X-Google-Smtp-Source: AGHT+IHTprch3yTnnz5rhGFgAVG2lRMB+7nzu9YU92Wc1HgHwxaGUWze/hAC3poy65AAfi6+3zy4Xg==
X-Received: by 2002:a05:600c:1f92:b0:477:73cc:82c3 with SMTP id
 5b1f17b1804b1-4778fe9b3c4mr41368145e9.26.1763150680804; 
 Fri, 14 Nov 2025 12:04:40 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4778bb30e3asm54161735e9.1.2025.11.14.12.04.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 14 Nov 2025 12:04:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Collingbourne <pcc@google.com>, Cameron Esfahani <dirty@apple.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Mads Ynddal <mads@ynddal.dk>
Subject: [PATCH v5 02/19] target/i386/hvf: Use host page alignment in
 ept_emulation_fault()
Date: Fri, 14 Nov 2025 21:04:04 +0100
Message-ID: <20251114200422.4280-3-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114200422.4280-1-philmd@linaro.org>
References: <20251114200422.4280-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
---
 target/i386/hvf/hvf.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 16febbac48f..9a1bf026a4a 100644
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
2.51.0


