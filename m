Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6F3CCF9EA
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 11:13:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDL2K-0001ZR-Lb; Mon, 27 Oct 2025 07:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL21-00014q-7U
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:04:57 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL1S-0005hE-9r
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:04:56 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b6d70df0851so608944566b.1
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 04:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761563039; x=1762167839; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GGDtkgFr/GHLtEa0jhJz7Y8ig7qb2phfciaJVqoCnCs=;
 b=hnKY54IH9fXypyNJXpQ9FpSySGdP9h7lEeAPh3pC5vJHTrbI3EnVs5IhzLccDkhs15
 mE8vnD1wgK1fdbBSewbzDKfVkQ+NzA+9sj35Tf48I9e4McjGWvhkxa4SJgFq57tQZGAL
 nTxXRk4DN9mg025DBYI35/48yP7PiklW99oMIe8/Lz8pV5r0/w2EhVEWfZKk5TXPSNOv
 yRSa57w/CePdayDHVMkK4DNLLB/RWwnqVAxYV8+W1CfLZhub4sO3WtQfTEt0SRdhLtBS
 WzGw15OHVWfptb3sDgkDSDbpDgyI2gYpGTV8uBfI9MYeXw2cxf12XI6VgEFjnOk34Tka
 cMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761563039; x=1762167839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GGDtkgFr/GHLtEa0jhJz7Y8ig7qb2phfciaJVqoCnCs=;
 b=OanG/gU8i3u+4OjioLCFL5wTGWvZXCIEZIvQQbLh3oP82ZWH6INAfniw3XoNv0HypO
 YIi7CnBl/23JXVADxJiujH7zttZmxShohgSZMbQ9M0X21yGUL3lSLWyPJDAcPUCQILBF
 uaUuqe2IKAuxV9g221J5m4p4gRD7ScNAeIVjgNezVzJXn7N7T89FE+x3UDgJqfcyGhST
 xIFoAVreyRU5EiNEfC2qbvLBOmZqVH/A6jUlBfh5MJ2tiwx9LUUFj1p/2kp38+4VKwuG
 cGtNbK1pw2IeUuqYVwRGVRT5MxrOtvosfi3EwcpQcRQaAJG5RyEFq+onU6tYp0cIbJwr
 Ypxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHQwBf+5LnhXgspFu8i0BJOa/gfvf0KWssSmtzT2FNO3s89xhyOLx59j2YYEuqd8tnGjJ5nO+eUA==@nongnu.org
X-Gm-Message-State: AOJu0YzJZak5yY+SsMeWloNUu16c9ZaPyvN2OGQ8PZlfn+Lt3n3wDYMc
 QPwOphLNqh9huXCX0QeUAlVCbAZLbrcykl37W3d75VLjS1gj5LLLS9M3Fi4TVJkRPho=
X-Gm-Gg: ASbGncu7v8wbaQAKWdbMrYjOx1YjmZQr3bmRAzrZR8pGgctmy/FU+94QYfGFJTNsLBy
 vN6rQpJLnXJDYfVF77lnQ+zKamO+uUKiX7J4QWy+MhFS8NWmM2aa3eu8uRa1d5nG9T2b/lqKnSq
 u/fMEri5S8rmP8qZaswd+KW+2gyF53WlKSaFrve+W300ujoxC0/qx2+Bl9zNSkf5DPWHLeX0hTx
 zWI8BB7NgL2X0hwtARf0ehNN4HSuYXQ5vzUlKrKz+caywjkmC4g3FkIgT0WE35PRB2/CoYk24S/
 UxJIV723yz/iaNcnsgncSZM2vyC7BSuBoRgF0cTG+8CghCMTjCSa+p0g2MB7lh3MKCehiM0cuEc
 9ZSDq9c3oRXehO0Q7cqrdShMQkhH92g8yXy73sJgZq3G6cK0G6fUrguQSAKXWqziuNlAF5BKCwa
 8al1OAEEQBCdA=
X-Google-Smtp-Source: AGHT+IGQty3nqHvOvQICE9Rlly5V3h17LXnXWbLrIdqb1N8ODcrMwUJQb0dJNUF1TXud8Qjaz914fQ==
X-Received: by 2002:a17:907:c11:b0:b46:897b:d759 with SMTP id
 a640c23a62f3a-b647443b9c2mr4453853166b.40.1761563038954; 
 Mon, 27 Oct 2025 04:03:58 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d8548ed8fsm735153366b.73.2025.10.27.04.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 04:03:53 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8E0B860B4E;
 Mon, 27 Oct 2025 11:03:45 +0000 (GMT)
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
Subject: [PATCH 16/35] target/loongarch: call plugin trap callbacks
Date: Mon, 27 Oct 2025 11:03:23 +0000
Message-ID: <20251027110344.2289945-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027110344.2289945-1-alex.bennee@linaro.org>
References: <20251027110344.2289945-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

This change places hooks for loongarch targets. This architecture
has one special "exception" for interrupts and no host calls.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Julian Ganz <neither@nut.email>
Reviewed-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/loongarch/tcg/tcg_cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/loongarch/tcg/tcg_cpu.c b/target/loongarch/tcg/tcg_cpu.c
index 82b54e6dc3c..9d077c56d9d 100644
--- a/target/loongarch/tcg/tcg_cpu.c
+++ b/target/loongarch/tcg/tcg_cpu.c
@@ -8,6 +8,7 @@
 #include "qemu/accel.h"
 #include "qemu/error-report.h"
 #include "qemu/log.h"
+#include "qemu/plugin.h"
 #include "accel/accel-cpu-target.h"
 #include "accel/tcg/cpu-ldst.h"
 #include "accel/tcg/cpu-ops.h"
@@ -80,6 +81,7 @@ static void loongarch_cpu_do_interrupt(CPUState *cs)
     int cause = -1;
     bool tlbfill = FIELD_EX64(env->CSR_TLBRERA, CSR_TLBRERA, ISTLBR);
     uint32_t vec_size = FIELD_EX64(env->CSR_ECFG, CSR_ECFG, VS);
+    uint64_t last_pc = env->pc;
 
     if (cs->exception_index != EXCCODE_INT) {
         qemu_log_mask(CPU_LOG_INT,
@@ -190,6 +192,7 @@ static void loongarch_cpu_do_interrupt(CPUState *cs)
                       __func__, env->pc, env->CSR_ERA,
                       cause, env->CSR_BADV, env->CSR_DERA, vector,
                       env->CSR_ECFG, env->CSR_ESTAT);
+        qemu_plugin_vcpu_interrupt_cb(cs, last_pc);
     } else {
         if (tlbfill) {
             set_pc(env, env->CSR_TLBRENTRY);
@@ -208,6 +211,7 @@ static void loongarch_cpu_do_interrupt(CPUState *cs)
                       tlbfill ? env->CSR_TLBRBADV : env->CSR_BADV,
                       env->CSR_BADI, env->gpr[11], cs->cpu_index,
                       env->CSR_ASID);
+        qemu_plugin_vcpu_exception_cb(cs, last_pc);
     }
     cs->exception_index = -1;
 }
-- 
2.47.3


