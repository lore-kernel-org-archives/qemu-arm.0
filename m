Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FE4CCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 05:51:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDcc7-000241-RT; Tue, 28 Oct 2025 01:51:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcc3-00023P-VQ
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:51:19 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcc1-0004L8-LX
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:51:19 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-475c9881821so33900535e9.0
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 22:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761630674; x=1762235474; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zY05lUWL5hjS7DHXCd+KmMwND4lCTa4Rhsa0suClLwM=;
 b=m9xTbZUMWNbnlKrulpQiMlu1UIBc4mZnBNOU3hi42/HYt2beErL1VwKbjf0C1o8mxp
 TJigR9j6lCiegiKU7r9aOZm6BwIbTUZ3cq5xMQ0yUzX+jEl1TDxwm2wV3ytxg9q7cwMs
 VRU75dubJS9b8d4GJgUvUW8mOy407FLijVVSsiofEcJT6nnXXSu/3fC+D1UVoJB9Zejk
 oz7wGMIx7t3xVkj65oZzVZi5vMikxducBNLv1zwetk0D29b3pTV4ueOrUo29vvF/K+Sp
 sQB8Xy/uvZqP62FQt8dl298oO88EP80cGvlY3hkR9++5C95EMUE1Q6tOabwcXN3/KqVe
 dvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761630674; x=1762235474;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zY05lUWL5hjS7DHXCd+KmMwND4lCTa4Rhsa0suClLwM=;
 b=P37yHWiXBo/SsqxMTL7P1GCwJoK078s2bxrMDY6EZaUNI8O2rFfZPn1vXqn1jMQEOT
 AVpLdsMu2FFosMHb92hCyhx6lz0KdBDzp5vbv9BzrV3IU24x545jid6+HbVq+ntJQmQi
 JOYTqUVud75Ol93y5PXjOfKfDJlaPaIA6LyUkBZ8GlcX626WGqU8r2s+eojWCW20BSea
 TDZEhhj9/N36pmQzYvirq8qBtJaxDBDtt2zdQ1dg7hYyFqijn6HXKoFr+UDdh+jJRJ7S
 LOMmHe3xU4JlBNMJR2D9g0mwp82C0j0Ap8poCDNUGeBPVkxy4fG4yc2P9miF4Hs7A0zE
 LaRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUy0dVFnzbpRwAz54RVFd6idS/x0LD9AAU0FaQMVhctwA2HVonitb5w9+q+JTR+UprIhXYzxi/XNA==@nongnu.org
X-Gm-Message-State: AOJu0YxTZOy6uBPkpYK+ims8vcAzHmC9fzqd0hvmw//pRriFAURk5wk0
 trwlPCk32kC5lPirArm9DyC2RTUNqGJ2UU+UxHtz2A11L0lxPQACjPgWjoOng/CVH7U=
X-Gm-Gg: ASbGnctXMvzUSQpn/DMEB1IS7ibCi/Zs4gI5otlcUrtrLk4djFmDpx00hm3UEWiD7KJ
 DfRS5HgQsJapcFzRtkledT4INBeu9zm55aPywh3ehTauCtMHoAqkinYA4QEBBT2SH7kkecYD8fd
 0nWrG6Y/VIBctXI1AdRfoA/++ie0iyXSdJniE7Onpq//BkITvZyGUP8Ex0nL2Mm77WcIVrsR0C3
 yQZewSiX7gl05Q0iFECZ+f7eZCHHAqYW8U3UvO3ARaF8iqprq5xCdQa2iAGjNr6gv/Ggfqq8m19
 erXvDkEv+VaI2bExSzCpc/8N5YrXOifqm8uYz0GubApl7c9z4VTR5a6Ms3/lEHDyA7pjfPcywlH
 O3G9MjkTOHRMsJGwl+OhTwfOA7MMKfsyQLIc1o0ipax+xcmhFIuqPf3QuCxFnix2CjYTaB47xi+
 NVPvAjGRDg5PcWibCOrs/K6DExyuK/b2yeua0MKn2BOXmyl4QXUpUqVJE=
X-Google-Smtp-Source: AGHT+IH2ZCMij5u/HguG9ium9J7tXLPq23syhivrY//lJInzKCk8P5thzvwXA6OLMlk+1oHn1CEZAw==
X-Received: by 2002:a5d:5f54:0:b0:425:70cb:9ba8 with SMTP id
 ffacd0b85a97d-429a81b1f42mr1411013f8f.1.1761630674361; 
 Mon, 27 Oct 2025 22:51:14 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952cbb2bsm18327270f8f.13.2025.10.27.22.51.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 22:51:13 -0700 (PDT)
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
Subject: [PATCH v3 12/59] target/arm/hvf: Mention hvf_inject_interrupts() must
 run on vCPU thread
Date: Tue, 28 Oct 2025 06:41:48 +0100
Message-ID: <20251028054238.14949-13-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028054238.14949-1-philmd@linaro.org>
References: <20251028054238.14949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

Since hvf_inject_interrupts() calls hv_vcpu_set_pending_interrupt(),
which must run on a vCPU, it also must. Mention it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mads Ynddal <mads@ynddal.dk>
---
 target/arm/hvf/hvf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index ee04943b0f8..0d8ff49ae15 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1664,6 +1664,7 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
     return 1;
 }
 
+/* Must be called by the owning thread */
 static int hvf_inject_interrupts(CPUState *cpu)
 {
     if (cpu_test_interrupt(cpu, CPU_INTERRUPT_FIQ)) {
-- 
2.51.0


