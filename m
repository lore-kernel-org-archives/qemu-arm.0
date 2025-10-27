Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCE6CCF9E0
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 11:16:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDL9R-0005v2-1k; Mon, 27 Oct 2025 07:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL9C-0005IG-Fh
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:12:24 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL93-0007aS-NY
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:12:19 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-63c12ff0c5eso8919385a12.0
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 04:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761563530; x=1762168330; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3K5oRo7LWMzZl+QpfA7sUsVfS53Gw1PvvtIAKjntjao=;
 b=gXgWuVMU/FI2ra3vVJZPW5fa5VnBGpIDFbMV/o191w87/CZ4MObZHSSpHmPBRCAKDo
 uA2MINhFLbIa+g6hUs3qFC8g85f9QBhDZqQEU0PO9G3IBMqDY/xL6kwcOLXsIAlFDGCj
 qHe5frxXa7Q+HHqdyfGTtloMBNOKOeELhRxbJmylO/lNirFtk3C7q+uXXn6SOPwRyoB5
 jWKdpoMQ5DWiACPKcLd1AAINNzPzYlnnOMZEHniCEmK3Rak6qGILODiOfbZ3whYik40t
 hAAZr2mjNO9D9InGATr1ENUeLiyAfmj1CvKuK4ph8o5YwPgpj+MbyGS4DGcGSBOtAgSy
 CVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761563530; x=1762168330;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3K5oRo7LWMzZl+QpfA7sUsVfS53Gw1PvvtIAKjntjao=;
 b=QXOz0a+WKQ+H2Xt8QS12no3gv9tp50BekUly8iVdaJBxQLTjTkyR+lHv5YqdcOiXQy
 ibYkYCcAGUyoXeDv/30SkFY5YCcGvWahYOP5dgIH+yGnO9SpX2an2fGK1WtXzgeZ276f
 TcKZ/NeOn/KOD3m3nXVPAHvYHtQ8zUCDLn5Q+EdSr78yZnz+tE02kfWanALLF5y1ub8+
 P2KnD6sPSxGDP2Jc8HXz6mCtgxFzk3IoUNsz3gcdgOo+vr/BRj7PRm5cOzaUJMZrNlFO
 u3zNV3s/lAD5HwnQcVsa/bgtwyc17nR4PcEA8wuAGP8UXRjxIKobu+CN/tquf3JefKr4
 EKAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9vgcQfIAGisf+j0xo6K9Vcm3/qMSA6rXRIJzuCwEzxvYvgt/s2gJHDLYBVZwFscTCFT49eHBu9w==@nongnu.org
X-Gm-Message-State: AOJu0YwRiaO9wlTlaB6KAH8Pi13u7dc7gbgrVE1IW4kt5LxKqXSMkVXF
 7PbK/9a2hJHR7yswSEHTzg4FTOCYCpQFPR0Xh0BBwFgwPrxrXFcgbMT2Cn1oeM/RSmc=
X-Gm-Gg: ASbGnctxLflcS4B+GEOYnNSEPZYvHL64HBXlQyBSJcDKoPFIZvYtHMruNkO69yvQzL0
 T6sUwFvgMIAoTdJNmN+ZOJsnIGtRqXJhkWrEFWV3blOGvnVMIraoisc84ayIhKMJYpN5eB4lF0Z
 ajCV1joJ8lGPh8EifAGC9ATGTdX9idalMhNdOsopX7Swmct1smaC0MzVUlW2icVXMfhs6ofRTx/
 IitgILfkJ66cP7iaYdCZPFwFjqAoK+HZ1k0A1xQBBRGiSf9rmqbq+3/yqLVrpjoVqN99R/7OOG6
 SsS8S0CkrdvZ6P10Rk3U9FHnRksa+b8UpHfx2PtwcC4XmruZolj5LOU0DVKTQ97q8JE5h/JMz1C
 LNrhS2UE6eWNsmaAHRmSTEl368alwUnmXaNKLAWVeLSe/76824QPa8FIldBBFb0GZvNuXxRRz1r
 aXgqW5ToZxTpA=
X-Google-Smtp-Source: AGHT+IGRNtHaeBs6dkf1tkgtMQn/OMS4FTT0K2dUS+olDng6buVSaegQ/gjnJk3ecwVpMDLXGGR0GQ==
X-Received: by 2002:a05:6402:51cb:b0:62d:6601:a6cf with SMTP id
 4fb4d7f45d1cf-63e5eb18e5cmr10018586a12.9.1761563530082; 
 Mon, 27 Oct 2025 04:12:10 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e7ef95cb9sm6162656a12.17.2025.10.27.04.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 04:12:08 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 2C36161528;
 Mon, 27 Oct 2025 11:03:47 +0000 (GMT)
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
 Aleksandar Rikalo <arikalo@gmail.com>
Subject: [PATCH 32/35] plugins/core: add missing QEMU_DISABLE_CFI annotations
Date: Mon, 27 Oct 2025 11:03:39 +0000
Message-ID: <20251027110344.2289945-33-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027110344.2289945-1-alex.bennee@linaro.org>
References: <20251027110344.2289945-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
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

Most of the memory callbacks come directly from the generated code
however we have do have a a direct from C callback for the slow-path
and memory helpers.

There is also a reset callback that calls out to plugins.

Like the other plugin points we need to disable CFI as we are making
function calls to dynamically linked libraries.

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/3175
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 plugins/core.c   | 1 +
 plugins/loader.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/plugins/core.c b/plugins/core.c
index 35a252d2729..8f8bc7219c2 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -668,6 +668,7 @@ void exec_inline_op(enum plugin_dyn_cb_type type,
     }
 }
 
+QEMU_DISABLE_CFI
 void qemu_plugin_vcpu_mem_cb(CPUState *cpu, uint64_t vaddr,
                              uint64_t value_low,
                              uint64_t value_high,
diff --git a/plugins/loader.c b/plugins/loader.c
index ba10ebac993..0dbe7bea263 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -318,6 +318,7 @@ struct qemu_plugin_reset_data {
     bool reset;
 };
 
+QEMU_DISABLE_CFI
 static void plugin_reset_destroy__locked(struct qemu_plugin_reset_data *data)
 {
     struct qemu_plugin_ctx *ctx = data->ctx;
-- 
2.47.3


