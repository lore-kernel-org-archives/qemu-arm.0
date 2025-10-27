Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757E2CCF9E0
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 11:15:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDL9E-0005Li-Fe; Mon, 27 Oct 2025 07:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL99-0005BP-7q
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:12:19 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL93-0007af-Kk
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:12:18 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-63c21467e5bso499154a12.0
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 04:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761563531; x=1762168331; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sVtx82IqB8qzVQiPKkt82SS7lmyo0Iaesq+DA5MG3VA=;
 b=dBtxloko77tJdQBnLGiOGwxo95WR7gd0CJ8AjQmz65aZL1o67cgsV1R2crtBmKREEv
 qU36vmGvxWgYGIzhLdxHt/3f8SpzTzRTEhPz+3Mm+fwTIuc7gdY72fcjiDaxiRgVQw+Y
 Q291/7oDbpcS8hI2Jf9Oa8m57Kx1ydf7u79BI+cCZJz3z1AJZTuWpIDXev08z2EkTeq9
 4ZoI3NDr+HbPNGj55QmTYG5hRlMw3K284oPIWM3dIKxbmet5pu4PrASwjOjM5JI7DqsG
 L/UcxaX6rxw5TlE+MVD4qEvwsC6CITNSiN+1g2UM0bJnF/8ygOgDsed0F9lVOU8txLqz
 6W6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761563531; x=1762168331;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sVtx82IqB8qzVQiPKkt82SS7lmyo0Iaesq+DA5MG3VA=;
 b=vhlO5LrKiOERRaTvPkE5LO+hrn7Q6LHgT9ysQkqCXE3ueCvfh64rVGcAGwLa9iQrjv
 Z2xC+vRcxbYSofGvx5Y0O2dRcf7nlnwr2xg0cilCezInhbauwXhFY3isuJMDXYaqRKcW
 1A8deoRlKDt1t1o1YMOdW1CAtTZMhJFaQwtNMJ6AIw1Lsj2uhFYlHQg99LJwWrOpdStY
 cGJ782OLBTvHTu5tN68J2VuK7oFcVhIL1VTGvODYd9l0w4SQtYW9GLIeu2G/HQV0Ua5v
 Rd6FA+/Z9KuIuXzLFO30j+QvfjWG8vbd1QprxVWcbXBxVn0ypBSoi3d86RNqWMTyzvNU
 t36w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEUJhOD57c1Uh5ti/Rc0xrisOEnWo1y/OkQ+VvuZ9EFYFuIR2X0PTsI22lGYmvInelU8hAUHeQrQ==@nongnu.org
X-Gm-Message-State: AOJu0YzUlrOPNYcE3ouvN9rEg1qXJog39Jc0fFw2YZ4PPCvGffT9LyKZ
 PFzXWABlYWX1HXw3FPgHirXNivMlISYc80K2+xJaC1h0Cj4jRPywtOXTw/725a6K4z8=
X-Gm-Gg: ASbGncseQHiguYDOm0/3l3hbSZnW36F8EDYbcTm03pgN2aF05VOc8PifmAj5zdRBdi/
 ZLdN2/dBvsJh5R4BmEfPd/m5As8P6SOIZwos2ScNrgpHzivJnfb6F9dyxz2b//FZ+S9dqBm3sOZ
 1T+BsCv9oVrHDLftN4RhD35Eyr9SYpdR8Kozyu7KAiYgx0XZ6qA1yNielvJvtSFGPoYucRDNO6j
 8U4KGAU2ZpxKjWRQGlRpGC5L9UUIcFPrPMFj31SeLlMh/SqmF5dfYcr8Q1zv351O9rI7+1MtWFl
 1ImrEbRD4CQwtJC7xU5xzf/pmlq1BrsLRXRLR8u+c+P3INSWCMR6TFaCANLevipVsLLHqeVJIk+
 zFyK14ns8GF1F5fgcR7zs83IwlT/cQ1OE7lrmPqVIJwHiUyp3xe3z+YpzfQsFmQu5sl05k7aJjm
 NomIxovHVYflQ=
X-Google-Smtp-Source: AGHT+IEGqI7c2U07bxg2uAm6b33YE7flAC6uooFc7mct1Dclg/qMpPcTcoi/nCsPRkV1rI2TUSCRzg==
X-Received: by 2002:a05:6402:909:b0:639:f7b5:9c2d with SMTP id
 4fb4d7f45d1cf-63c1f641924mr34968200a12.9.1761563530678; 
 Mon, 27 Oct 2025 04:12:10 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e7efb818esm5802190a12.24.2025.10.27.04.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 04:12:08 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 5851660E7B;
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
Subject: [PATCH 24/35] target/s390x: call plugin trap callbacks
Date: Mon, 27 Oct 2025 11:03:31 +0000
Message-ID: <20251027110344.2289945-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027110344.2289945-1-alex.bennee@linaro.org>
References: <20251027110344.2289945-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52d.google.com
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

From: Julian Ganz <neither@nut.email>

We recently introduced API for registering callbacks for trap related
events as well as the corresponding hook functions. Due to differences
between architectures, the latter need to be called from target specific
code.

This change places hooks for IBM System/390 targets. We treat "program
interrupts" and service calls as exceptions. We treat external and io
"exceptions" as well as resets as interrupts.

Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Julian Ganz <neither@nut.email>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/s390x/tcg/excp_helper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
index 0ae4e266065..c6641280bc6 100644
--- a/target/s390x/tcg/excp_helper.c
+++ b/target/s390x/tcg/excp_helper.c
@@ -35,6 +35,7 @@
 #include "hw/s390x/s390_flic.h"
 #include "hw/boards.h"
 #endif
+#include "qemu/plugin.h"
 
 G_NORETURN void tcg_s390_program_interrupt(CPUS390XState *env,
                                            uint32_t code, uintptr_t ra)
@@ -502,6 +503,7 @@ void s390_cpu_do_interrupt(CPUState *cs)
     S390CPU *cpu = S390_CPU(cs);
     CPUS390XState *env = &cpu->env;
     bool stopped = false;
+    uint64_t last_pc = cpu->env.psw.addr;
 
     qemu_log_mask(CPU_LOG_INT, "%s: %d at psw=%" PRIx64 ":%" PRIx64 "\n",
                   __func__, cs->exception_index, env->psw.mask, env->psw.addr);
@@ -531,21 +533,27 @@ try_deliver:
     switch (cs->exception_index) {
     case EXCP_PGM:
         do_program_interrupt(env);
+        qemu_plugin_vcpu_exception_cb(cs, last_pc);
         break;
     case EXCP_SVC:
         do_svc_interrupt(env);
+        qemu_plugin_vcpu_exception_cb(cs, last_pc);
         break;
     case EXCP_EXT:
         do_ext_interrupt(env);
+        qemu_plugin_vcpu_interrupt_cb(cs, last_pc);
         break;
     case EXCP_IO:
         do_io_interrupt(env);
+        qemu_plugin_vcpu_interrupt_cb(cs, last_pc);
         break;
     case EXCP_MCHK:
         do_mchk_interrupt(env);
+        qemu_plugin_vcpu_interrupt_cb(cs, last_pc);
         break;
     case EXCP_RESTART:
         do_restart_interrupt(env);
+        qemu_plugin_vcpu_interrupt_cb(cs, last_pc);
         break;
     case EXCP_STOP:
         do_stop_interrupt(env);
-- 
2.47.3


