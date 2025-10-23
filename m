Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBF6CCD1BE
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 11:51:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBtmh-00062G-8e; Thu, 23 Oct 2025 07:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBtmV-0005CI-W8
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 07:47:00 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBtmT-000211-Hg
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 07:46:59 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4710022571cso7299695e9.3
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 04:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761220015; x=1761824815; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ywx1NTEVaZQkKaXvAYoeY9Xrt/iLLGXyjyipFG87mzI=;
 b=p+rGj4ev3/BLxl6GblkpoIDN5Dcm+0AtOKdp9C+MjOEYnABzElWgspt2brlxkzHDFJ
 CNR/SJQnfIJcTexjLPCzN2qYt+ycSL3vin3qju+FT0zdcaiBGRcdA0Jcl7YLcP97TeHn
 mrVCJZ3FMva8rJia4F91+tlsTHkJO4i1LGWAXB5w2JY3rxeTwUxY0NcE4W9f0lBEE2PY
 53fNOpPymsBFEOKtdcxiZjA+Wejb1erhdByPFDH7Tf8tuQGtQrhIF9X5yr7KIMU7lAF9
 O6pVQdg7MjpgaGY5XFfyMN4Aup+Luq/5D47Bsd5UAutb1wFu5Lykj7QQ7Ch9oEcU9/gV
 qUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761220015; x=1761824815;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ywx1NTEVaZQkKaXvAYoeY9Xrt/iLLGXyjyipFG87mzI=;
 b=Uv4NKKwnrsb2TEWRvSdnjUHxWmOX0FM71q7uv6eUr/PvY6fcOfeo4Qvx9yJiXcU/T7
 aQZVocqIFQeTK6T3PgUsm8jR4HrJXJJSg+3L4yyA0vMA3YZu9YmeBvxkMso7lgjcpyRY
 P69TzaZMiXFNd+OO4cjs5Oh9t9J7TPC7/HHEEgZx2UQMidhbMR7+Ajd2hRFL0Y/ohQlf
 2ioHeK/gbMCGtCpHogmN7DPjR58gUF1PKytHnvY/ulKTii7tuPE0bZQIpuUURDG4/lk+
 v/1fBRjmr5ewpbe+UKVrZoAEtGMWtc72zwJTulU2bn3iljUKZuW311l3ft4kNV4Jv46f
 VoEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVycs2vsAeeGM7eadlM7H2sLdjWcmsoHPhXMPfeCoCsQAET+5CZQKKg0xgEjlNFQS0LKwqakglAow==@nongnu.org
X-Gm-Message-State: AOJu0Yzlw5Wox4qrbEq+8d6OsJjUmE4PApkwT2s2vcP0+mH5m4PPwJeD
 cHj9C6eBXgyBydMO0e8YnLkSd4CtYLc42x1ykmw1Kyd55Q2uVjE4o1NiyOWZhwQLc+g=
X-Gm-Gg: ASbGncszaF/Ap1ti+kQx4Qv/qUu1eVjzghdsvfHCpexu4Pf9XUPMVa2MG4mX7B57+T5
 z7WyzqFJy5eICperUbRPgaG22Wsld3uWsmwtP7O8JCKNLYwbc98cdP7nzcB/H8xN1FCOoYpzAnc
 kty3FxJo+7sG0XAP5NSRp5AJwlP5wI3K4NSiOnpjSTIgC+0z9Io1K00uHFBMoH6StlIjf9fAsjl
 rLbHjdp68Oe4Kic+1bMxHYJScSoUulh0tIf1h1KvRBz3gFuGzs+81TEqTqj4iEDOqtZ4vQ7YATt
 Yo/fwi5CBFm38Nz9HgP/1mi97StWLk3ba+QzfnyQ3Qfh81yccfps/wGk43iBqo57H/nW1/kRYhj
 MmQzkgJqo77kAvWAsrbcf+v1d0rhnVIB4lkuATMFUH/qIKqNApjDh9IcMhcEnGlHXg6GZz20son
 DqMUwGxjGJA7mwze9sAEXsH38Lz7LVEqDdMnTKMW3HQAVTL8hJxRsgLAPvKxeG
X-Google-Smtp-Source: AGHT+IGw4gglu7O8489NpdACo5UWYvNq0w3S3tF8X+OJgaau/h3nWhaz0mON5L13y0rSiQoVefgHqg==
X-Received: by 2002:a05:600c:548a:b0:46e:6d5f:f68 with SMTP id
 5b1f17b1804b1-4711787a2cdmr168135995e9.12.1761220015353; 
 Thu, 23 Oct 2025 04:46:55 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475caea0468sm35327155e9.8.2025.10.23.04.46.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 04:46:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Mads Ynddal <mads@ynddal.dk>, qemu-arm@nongnu.org,
 Peter Collingbourne <pcc@google.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 03/58] target/arm/hvf: Check hv_vcpus_exit() returned value
Date: Thu, 23 Oct 2025 13:45:40 +0200
Message-ID: <20251023114638.5667-4-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

hv_vcpus_exit() returns a hv_return_t enum type (defined
in <Hypervisor/hv_error.h>). Assert we succeeded, as we
are not ready to handle any error path.

Suggested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mads Ynddal <mads@ynddal.dk>
---
 target/arm/hvf/hvf.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 91bbd3a6aae..4c98faebbed 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -963,9 +963,11 @@ int hvf_arch_init_vcpu(CPUState *cpu)
 
 void hvf_kick_vcpu_thread(CPUState *cpu)
 {
+    hv_return_t ret;
     trace_hvf_kick_vcpu_thread(cpu->cpu_index, cpu->stop);
     cpus_kick_thread(cpu);
-    hv_vcpus_exit(&cpu->accel->fd, 1);
+    ret = hv_vcpus_exit(&cpu->accel->fd, 1);
+    assert_hvf_ok(ret);
 }
 
 static void hvf_raise_exception(CPUState *cpu, uint32_t excp,
-- 
2.51.0


