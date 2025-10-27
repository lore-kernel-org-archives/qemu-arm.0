Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4378CCF9EC
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 11:07:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDL1u-0000sS-1z; Mon, 27 Oct 2025 07:04:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL1O-0000d2-VC
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:04:19 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL1G-0005e6-MD
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:04:14 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-63c45c11be7so7450156a12.3
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 04:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761563033; x=1762167833; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RbvPrANYvJj3gNO97dH7gcz+uNRb8G5R8cbjz6SvgpA=;
 b=wRK/WRiWjNekM6KHFoSK3HItdhVpi7y5gpnTlQtaCvnOrB1wvKXxM/tgQSm98aWeM/
 VIsUCpZP3fe72O7AD+ZCWnXj73EwvDXWUN7tcdKAPBNSFY+ohEL06Zujqa2grjK+PkCv
 giS4BqgbzUMxgcNa8fef0nS1rwzf2GrHk4WXw+Ry3A1Nz67AkAVWTsYclrX8yQPy9FxA
 lN22VQM27woLbeNyYSqdzyMC31Bsh9Bh+4JtbvTsEB9syufUvQsk9WavYP3Vwb/AK/Gu
 HeukaiVfmO3Y3LGSsx4t1Y5bHMxj/u8X6Ct70KprzvG/jonbgpWc9cUPSpGrj0q3uywa
 Kr6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761563033; x=1762167833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RbvPrANYvJj3gNO97dH7gcz+uNRb8G5R8cbjz6SvgpA=;
 b=Vc0tYFTdFb07jbU66MjBqcDxSKhnEiTvHkk8iNCt1bhzkT+ozYAgoE9e/JnxHeMnxg
 s4gZr/r1yuyqfuOlxE9KEU+u0lKjN0pwD2BJbfyLxpQmhMhoCY1QWXzqkCNpoGM5UGOQ
 uMJfHumn47A9xn1ZhYAX/lmCCvOmNj9mm+Le4aLtzZxAnG9zwyHc1vxFhkIR9Sw+jTOp
 Q7mNs2TTzRIlahwLMiolXOs9qXREfC/nQSquwHCyoShv9KdzmbQs3SoGE7QrL9XwAnfT
 TbKwFyP57skBkenTHLZKnkSIy5rAErbhaQY4sJWOVjFbgCqH7RDfXfxnb6E50Ymt58Gm
 Pt0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWabQQ0g+7tXKWiL73yONyC6DbmjmEolab/pg3I7vqeRh4ZSQUuCSU1lmbPshIyXiHrX6X4bzkB4w==@nongnu.org
X-Gm-Message-State: AOJu0Yyh7d7R4SdexH/kTgt9MSYNteAn8oRj0zzs+oES+oLaykaX6AzE
 3XOwbDAMfmn/l9nXNuVnVYVSVYoHzRhlVm+lqmPGCubM9gCapI3rSBCsF2CHoNT6uxs=
X-Gm-Gg: ASbGncv2vaAhkcAwUKUYIKa/NfbstJ7p3RrGlRpFAJyX/N0N+deG2LrA5wyDRznkIXh
 uEhl8JwY8EEGYX1mHom66ebqduWOnexjQL22EernVJTHcLdCXWR4BJN2fRSLH9QIHbpkrRKgQC4
 Fhzhzgna5Tfk9/ykw88FVqcXG6Cn5E4ivMobcPR44fscnJCqkfEPTLonMdTGxmPsZqAnMKQ/+lY
 tKOJaV1d9P3XdE1esGfvnS1z4BaCgYux+Qv9+c56LERHOMTVCO4gx0q0xu1CbFSuOSbk5YIRVyr
 HNXVoNNLGv9emPxCXIVTAjCOMZJYP5gaYrCZ4a3rzTScvRF9DTqGl2iquTv6rej1xlIyzgXO3+o
 RuZoUBVy04neC6/WkVA07/cp1ZYGnPFfstSmiFlJOOPZbhYp7oAz5raP+6R5L6yZvIQ+reeLFLP
 Tp
X-Google-Smtp-Source: AGHT+IEgl+c4dRH+StKwomTRbDfEq8j/zmTZSSPAaJlwzgoFWODFr2XsptD7H1CqAq3BBX3xhzNDKw==
X-Received: by 2002:a05:6402:27d1:b0:639:f54d:9274 with SMTP id
 4fb4d7f45d1cf-63e60003a6dmr9269873a12.2.1761563032820; 
 Mon, 27 Oct 2025 04:03:52 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e7efd0bc5sm6013871a12.32.2025.10.27.04.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 04:03:49 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 277AE609B7;
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
Subject: [PATCH 11/35] target/alpha: call plugin trap callbacks
Date: Mon, 27 Oct 2025 11:03:18 +0000
Message-ID: <20251027110344.2289945-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027110344.2289945-1-alex.bennee@linaro.org>
References: <20251027110344.2289945-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x534.google.com
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

This change places hooks for Alpha targets.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Julian Ganz <neither@nut.email>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/alpha/helper.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/alpha/helper.c b/target/alpha/helper.c
index 096eac34458..a9af52a928f 100644
--- a/target/alpha/helper.c
+++ b/target/alpha/helper.c
@@ -27,6 +27,7 @@
 #include "exec/helper-proto.h"
 #include "qemu/qemu-print.h"
 #include "system/memory.h"
+#include "qemu/plugin.h"
 
 
 #define CONVERT_BIT(X, SRC, DST) \
@@ -328,6 +329,7 @@ void alpha_cpu_do_interrupt(CPUState *cs)
 {
     CPUAlphaState *env = cpu_env(cs);
     int i = cs->exception_index;
+    uint64_t last_pc = env->pc;
 
     if (qemu_loglevel_mask(CPU_LOG_INT)) {
         static int count;
@@ -431,6 +433,17 @@ void alpha_cpu_do_interrupt(CPUState *cs)
 
     /* Switch to PALmode.  */
     env->flags |= ENV_FLAG_PAL_MODE;
+
+    switch (i) {
+    case EXCP_SMP_INTERRUPT:
+    case EXCP_CLK_INTERRUPT:
+    case EXCP_DEV_INTERRUPT:
+        qemu_plugin_vcpu_interrupt_cb(cs, last_pc);
+        break;
+    default:
+        qemu_plugin_vcpu_exception_cb(cs, last_pc);
+        break;
+    }
 }
 
 bool alpha_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
-- 
2.47.3


