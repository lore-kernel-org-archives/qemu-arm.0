Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2155CCCF9F8
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Nov 2025 10:11:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFrXI-0002wk-4z; Mon, 03 Nov 2025 05:11:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFrXG-0002wM-45
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 05:11:38 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFrXC-0002X5-LC
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 05:11:37 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-429b895458cso2700687f8f.1
 for <qemu-arm@nongnu.org>; Mon, 03 Nov 2025 02:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762164692; x=1762769492; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rvdpQqu+6tXXSi2BeJVnKSBoAv9PMGvcr8JslOxrI6M=;
 b=EF6jwDrxSTYt0Wq4ilEpWSO62nclplJ8ttOH7ZAhAqfjupBjJ+TckZ75Eji4lMyj6+
 ZWqHusYfhoX97ttuex0wh7I0OD5HRlQNTBvPKSF3aH7bOk0F5yycZdP4Ts46IjfjwdO5
 pDRbugWJ/eVxMUSwdhUB8hVk3jDgiyQgQfNLZu6izIfgJVc4DuXN9W5IPBQXfroOW0zQ
 9+2oABCuD2L7c1hpGXTqwqF7nKeBjd8UKynceNLexmm/ff6K37JpWoxRAkG6h0CZ+j/o
 8b5fkP0IqchGRngARpw9vBXQPXWzjdNwcxEFne4aG0kx76wus+gVoKCfD1hhdZ1dan2l
 sQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762164692; x=1762769492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rvdpQqu+6tXXSi2BeJVnKSBoAv9PMGvcr8JslOxrI6M=;
 b=RUv8BT5wheEAqQDOd3l/KJSX6NvzGd/e1t1DaR+jg6h0KOzgbXej9L3Tx1QgEHsA52
 PFOuHrTVZS7wkhSMuGyqesxNOh3bbqoROQvPEdt4kfZ/230v10fQKGCtexnba6QIp1G+
 lPI6PbbuaYOy2YWXIP3nJ7ZzAv13LyAyUgPcE81jqicox2l3p2CEtJTwd071wmKASDAi
 ILhJcGByAoIWpFkqN+z3lykCCR7KP0wHgwZO6cZNi8ijLtiUW9kZRutcAf/YZtURClX7
 GObuagkzElYQuIFSM9ZFB3RMfK3le4Wy+593uS4/XBi3TYfvYMnhv9OzKWTvPQyp8Mmm
 Jl9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0W3AFTG121q+KF77Nf0l0TmmYP7HfC8leGk8env1H/kK3naasyKkY6fPYx216vYMFSloP6ehoCQ==@nongnu.org
X-Gm-Message-State: AOJu0Yznqp6IUh4QBNamJOQU11CkszqZ4CiWZ2vOjp4RqfYW554YR1Xs
 f03jZsVqKdsNB0CxowQGsbLaz+rJUwxDeEq9KQZ8aUShiYVmKUw3Xx4HFc7wX55oslo=
X-Gm-Gg: ASbGncua91z8fBj3k5yuNBuO/A159BEe7m9b5qac9Fg54nAidLTu4nUV+HAhUJzQLe0
 FhE4b2gLeev8Q2GXel1c2JdwGOYI/HV5xCqejA+tfkVgCMd9Ujn4m7a3qNj9TQBzYiyNOiJzrM6
 z8shCFql3xqxO1uXBqCAncuzDkgA/F6pQbk2Q24HgZ2COc2ZP2lPTALWsqQS5afOLMHo2UhdIWy
 RKhynra2+qnVvviCxP1IUv21oHtjT18SPml4wfG9FLEjCxzyJwz24wDK0HDuzUDw9CZV9I2RbGI
 kcfClXT33QPa+WAhqvYGe3xvWUjMXcjzq2r0Ascl3KGvPfgqeP6q1oz0+0M7s/T5TD6VBJ8KaHA
 smXmuc5HqLQtOYmuVYAhwkDIzkslMPa6Zd7EKPEzsxICUfflukLFoys5rwTgJxYwS8LGLJpm3k/
 dziE+a7knrg2rlqzcsX2DmHCsx04ZH1RK7rwfv+BvWZsrvDJc9xE1UihdhryjAvoYW2Jp3cg==
X-Google-Smtp-Source: AGHT+IE9lsqLlSOEI/P1WSyQb3ydqWLetKEiFWATx2PIl7ZWPsfmfrIBEEo13jhxiaVxfTlw1LQltw==
X-Received: by 2002:a05:6000:2510:b0:429:d6dc:ae0f with SMTP id
 ffacd0b85a97d-429d6dcb154mr1113674f8f.49.1762164692269; 
 Mon, 03 Nov 2025 02:11:32 -0800 (PST)
Received: from localhost.localdomain (ip-185-104-138-122.ptr.icomera.net.
 [185.104.138.122]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c1125ad0sm19770172f8f.13.2025.11.03.02.11.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 03 Nov 2025 02:11:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 Phil Dennis-Jordan <phil@philjordan.eu>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Peter Collingbourne <pcc@google.com>, Cameron Esfahani <dirty@apple.com>,
 Mads Ynddal <mads@ynddal.dk>, Mohamed Mediouni <mohamed@unpredictable.fr>
Subject: [PATCH v4 02/23] target/i386/hvf: Use host page alignment in
 ept_emulation_fault()
Date: Mon,  3 Nov 2025 11:10:11 +0100
Message-ID: <20251103101034.59039-3-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103101034.59039-1-philmd@linaro.org>
References: <20251103101034.59039-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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


