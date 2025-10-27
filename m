Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAE4CCF9EA
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 11:20:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDL9x-00070q-Kg; Mon, 27 Oct 2025 07:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL9e-0006Ym-1N
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:12:50 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL9D-0007dn-BE
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:12:49 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b6d76a9eadbso394466466b.3
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 04:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761563538; x=1762168338; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GGapUoTaewrM/kono1/xvH1foLM0vdOPsMqSeCNHNKo=;
 b=TPCnbBCw+kIl9OKanfgeySBuGrIOk05JF4J9dLOG/QEUv8A+CAsGD0YyXOR324ou7j
 ArSgi0Qfq6kAQxmzjZshsuZdkjTPg1PvKabFsqvA5Ie4k2UST/wu4tcz6BQF5hppWDfE
 iTx3r+h0rGIrFY0Bwip8YymWXy4JRKLfzlYJl6KOB7tLQq58FkNzM6mluwQpjjiedBKA
 77TtnMJArEO6degYPA7P3MrYpEUsLurHWtwaHMGYfFqvEPOvq8+i8oUDsx+/dBkn9mdJ
 UeO3PjYjW/l6mXbG/YSnnzQn9gvIas//U+iNrhX0R75kUBWhYKoTxXEXtjxbTehV10Bj
 r1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761563538; x=1762168338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GGapUoTaewrM/kono1/xvH1foLM0vdOPsMqSeCNHNKo=;
 b=E1YQSyJuq/qbYu4OP6b6d57Xk37V4RVn03zqc4Quo7UsIENEq0kegyP9dIQ5wwEqVW
 cNt9NYsQLw04q2UHnyEPLI8PtUxROEHlDkRLnxRRjeJKx0KMjnmJpD47mwEB8i99RJ+1
 8k5IWHng4v+CKQOy9qHUj0Y483fvtHXPpKh8g/7N5gaDxgM6hROf8pYR27oQyse0uUW+
 eAJPOlzhqpyijiCuiuUdJGbQj5bvmKn8tqgTUBySq+0yn2VVw7R8QfSCdF+kNqEodRja
 ArqZjrpPTsROJMD/WT55cqYQTY1Emhz6pNEzeIPLXPeAkyAzRZ/uVBhiPAhqEXLko9k1
 SiMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgW5uJb4VOYU0tXo0hFZvvV75ojm23NewelEXo67GduPlVE89Qb7i6nrGl5i54alds+rqPMGg3Vw==@nongnu.org
X-Gm-Message-State: AOJu0YwGRS7k2PzmdWaizWbMhM2hntxaYa2SXikKzvrwW4do00+SqvJn
 YYGQcvqxsBh4ZyztMyJ9ZW2bSXbDKdvTsZKZyQyr2QFdNwWJS/Dxiq4Vv77SNqI6I7g=
X-Gm-Gg: ASbGncuzzYM6iSiMEAjqQ3juYCUiXM8SLuSC+hUNfgDnq2DZsmS8CcNkhVnEU8W9dlm
 fQLHcjFqhwDBsPUkiEuHBOOIkhfDX8yvyj+PLbU+A0q1X9y2d5bRNDWoV99ww9YQgoDBI5Ip+5J
 GY4dHDQDsfTna+5b3U2LuU+2woTHxJokx34lDucBHojQWqZltTSIiq/bdi11axYBLrUfeN4hur1
 sRoM1N76vz7ylC/PRWcFd8NZbXI+SmuAKGad5jBU7BsdoUUjzxJXhuwM7j2wxWqToPrqglGznYP
 B//BEU74oaENY/iwmWUGrvubO7Lfa0ttHTWfD/pP0lDuC6K3YtUFmMl+8BYItpejNMi0PH07ODB
 16LaECHA/B7YvuEZmJAdaDC/0vaaUhLvFM8qJ+RtE91ha4qkjArOJdcvPHfjamGFXGkEFZZBa0R
 dQ0cFOi1LPiZI=
X-Google-Smtp-Source: AGHT+IGtBMpHIebheyONrWsxP0glj3ZoIlLecwrjIGlCGS2qBmkZj9gRmSWXNpNrJHhHYenJu4IrlA==
X-Received: by 2002:a17:907:1b0c:b0:b6d:2f32:844a with SMTP id
 a640c23a62f3a-b6d2f328766mr2021446366b.22.1761563537679; 
 Mon, 27 Oct 2025 04:12:17 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6db2b010d9sm87578966b.43.2025.10.27.04.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 04:12:12 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A2BCA5F909;
 Mon, 27 Oct 2025 11:03:46 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chinmay Rath <rathc@linux.ibm.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <arikalo@gmail.com>, Julian Ganz <neither@nut.email>
Subject: [PATCH 27/35] target/tricore: call plugin trap callbacks
Date: Mon, 27 Oct 2025 11:03:34 +0000
Message-ID: <20251027110344.2289945-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027110344.2289945-1-alex.bennee@linaro.org>
References: <20251027110344.2289945-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
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

From: Julian Ganz <neither@nut.email>

We recently introduced API for registering callbacks for trap related
events as well as the corresponding hook functions. Due to differences
between architectures, the latter need to be called from target specific
code.

This change places an exception hook for TriCore targets. Interrupts are
not implemented for this target and it has no host calls.

Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Julian Ganz <neither@nut.email>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/tricore/op_helper.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/tricore/op_helper.c b/target/tricore/op_helper.c
index 610f148a237..2c8281a67e0 100644
--- a/target/tricore/op_helper.c
+++ b/target/tricore/op_helper.c
@@ -19,6 +19,7 @@
 #include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
 #include "accel/tcg/cpu-ldst.h"
+#include "qemu/plugin.h"
 #include <zlib.h> /* for crc32 */
 
 
@@ -29,8 +30,11 @@ void raise_exception_sync_internal(CPUTriCoreState *env, uint32_t class, int tin
                                    uintptr_t pc, uint32_t fcd_pc)
 {
     CPUState *cs = env_cpu(env);
+    uint64_t last_pc;
+
     /* in case we come from a helper-call we need to restore the PC */
     cpu_restore_state(cs, pc);
+    last_pc = env->PC;
 
     /* Tin is loaded into d[15] */
     env->gpr_d[15] = tin;
@@ -90,6 +94,7 @@ void raise_exception_sync_internal(CPUTriCoreState *env, uint32_t class, int tin
     /* Update PC using the trap vector table */
     env->PC = env->BTV | (class << 5);
 
+    qemu_plugin_vcpu_exception_cb(cs, last_pc);
     cpu_loop_exit(cs);
 }
 
-- 
2.47.3


