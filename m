Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E839ECCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 06:06:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDcqe-00065T-Pl; Tue, 28 Oct 2025 02:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcqa-00064i-EL
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:06:20 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcqW-00063f-ME
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:06:20 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-475dae5d473so31169355e9.2
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 23:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761631575; x=1762236375; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=00VoYdC8InBsegxgwoexYjYht16HaFBR+CXcPMHb2Dg=;
 b=z2KFfQiOam4XtzZqW9316dSt6oBV9/R20QEhEaq0ZJavEAv4eun8owDXxBxq3B1oro
 TQ8H0Kj+4fZNqgfs5nJmiimnrhPfQz3F8bgb19Y3FGIkE0KUx0CtLEvq3X/8D0KPSyM0
 dP61GHfKM0lOHPOHmLR13sUIfHrmwEbRE+RD29OnDgM/E9ofs9ud/lSZhCrJ/dFA20X9
 OH2vCSyRiDmP8GS8USHwW2+1lyvevGXJNqDUTTlswCbj6MPFyhssRVMfds9cER2CFFCV
 2CHboe5vTiznJ95uKqgcX07CwHNhf9DCVRqfdypALB/YVzjkUZ3Innd5FyeKAeGKPiKm
 9B3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761631575; x=1762236375;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=00VoYdC8InBsegxgwoexYjYht16HaFBR+CXcPMHb2Dg=;
 b=uegFvCcfVFU07Ca1jtdtUN4dkXaVlah+2riv7JeBSfjmde635s4P2hc2Fmg3ifxJ2A
 Gh9Ik1u0VtFLvyisqOhqPFXIG8+hR4Fqu/QWtJ5a5fDxMcDcwasfnuklDqEN4X1ot6BU
 OD9wLll/2alOuw9odmE2Dmj92ikMFJHWTWo9iNdxvHMdCWdwMhUo3ukv5ixVY3WZt4PR
 h8AAuQJ8aBaqEsm3l85cvH8Xs3AuD0++MkNpD4VRokPm0Py77tYAY4HB2ety0V6MG1hE
 bgMW87GHYybGg6V45hHc6+X+Id1DDs8DZsqMapHgVh4eofc5KPX0SgRG39MEZaEpcqWI
 /99Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVzgujQPP712pO6ENYn25wauJe/lkDtKqtMEflXlQF7QKkKpQCuZD8zY/YjsMkrgxlymrFiylqaw==@nongnu.org
X-Gm-Message-State: AOJu0YxwsCjVcfuJBF9pYoAH9b5Drf+njR97wKqCzPtFA3KYtaNstIyV
 tF5w7sGMTcqXVUR5ZxJnAD8Vg8pISn9xuiTvqJr2PyZtORTpMIoua9yGQ2eXUx6MhHg=
X-Gm-Gg: ASbGncugxIOYHnUcEoI0/r84zxa0fnwuR6m30v3QfImeLktKydRjvJxNmQcbwTmg9Y+
 toMDz45426H1C3NYMgEwqQbOgcsKOx4TsrhsaP1IyrcGGpB6hMFSebWz/9/xHkXyZbjz0sNIN+O
 olu5Ti3NC2YUEvKUmTNUbqI5epqkrOmOEVwBbldXi1R5tqz8eIV/GJg4IQWDR6BCysAfqe5VYG4
 MolI9f/Vakk6/3bLQE4dHvKIr4p61Znndl+dYnSrJGGVdhWPy8G9Q8o3T0sxsAUaISmMLGuzdVM
 BZHwp9ewtOonCZbBjY7VB+SpyuHFA4uPizYWXAGHaaUjXo86fCU3zko923pmetX+29xgRb1KbJV
 EUb9plfNUlXUenIOsoRhDkMg+OLOmTgd/sR3aqDwDvi8g75cR9VNoUmkw8cGjNqtJGNb0Y1f8rj
 ufFD96idr/dg8Momc4vfMQ0974H4bQUGb6z1McgufbkuLo4CsHxOiR0+o=
X-Google-Smtp-Source: AGHT+IFJkB0BTUKzJ3G9O0QOasNRl83wrQ1f3eP0Qvm5iWg0pZrjqRykw9M69F2Fr0HkNzsz2v+wcA==
X-Received: by 2002:a05:600c:45c5:b0:459:e398:ed89 with SMTP id
 5b1f17b1804b1-47717df5366mr17887055e9.1.1761631574837; 
 Mon, 27 Oct 2025 23:06:14 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952d5678sm18098843f8f.22.2025.10.27.23.06.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 23:06:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 33/59] target/i386/hvf: Use host page alignment in
 ept_emulation_fault()
Date: Tue, 28 Oct 2025 06:42:09 +0100
Message-ID: <20251028054238.14949-34-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028054238.14949-1-philmd@linaro.org>
References: <20251028054238.14949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/hvf/hvf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 16febbac48f..c0b2352b988 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -76,7 +76,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/accel.h"
 #include "target/i386/cpu.h"
-#include "exec/target_page.h"
+#include "exec/cpu-common.h"
 
 static Error *invtsc_mig_blocker;
 
@@ -137,9 +137,9 @@ static bool ept_emulation_fault(hvf_slot *slot, uint64_t gpa, uint64_t ept_qual)
 
     if (write && slot) {
         if (slot->flags & HVF_SLOT_LOG) {
-            uint64_t dirty_page_start = gpa & ~(TARGET_PAGE_SIZE - 1u);
+            uint64_t dirty_page_start = gpa & qemu_real_host_page_mask();
             memory_region_set_dirty(slot->region, gpa - slot->start, 1);
-            hv_vm_protect(dirty_page_start, TARGET_PAGE_SIZE,
+            hv_vm_protect(dirty_page_start, qemu_real_host_page_size(),
                           HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC);
         }
     }
-- 
2.51.0


