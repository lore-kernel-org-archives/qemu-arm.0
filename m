Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73100CCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 05:58:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDcix-0007kU-DW; Tue, 28 Oct 2025 01:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDciw-0007kI-K5
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:58:26 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcit-0005Ae-77
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:58:26 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-471b80b994bso76849385e9.3
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 22:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761631101; x=1762235901; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IQes5LeOA8vkPfaUoODaZwI5RRRB72LYmxLKv5qcwg8=;
 b=mRky6laQi+8EPLKrgCspLQf9bJcaCucSVTaHQXgn5s/2e1GPVjHE9hOTnBpWPXnQF3
 5z5RkOj35sFdkTSVdmqteM1xHC1Oe67j4ykvEDFmOXXr244Ezx/y3vgUhu2G2QrV/0ZX
 c+/QWLqFvsDt+rURSzCbruRv1tzEKtBFrhr+a8kd+rDrCjGTTSilp7NCTzrild/hlG0B
 Z0Q43EmCeA+p1oy9XRxOsegflDrdKm6AQCkUY3F2TjGY/52D+bY8ilD60QcG3kB0SkSh
 JHm/zREmGQdbfJT1H8b2wmCRlVR7NA2mbf49BnIEEt/wo95Wilh9Pr9Y1S+huBPLht1S
 5j0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761631101; x=1762235901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IQes5LeOA8vkPfaUoODaZwI5RRRB72LYmxLKv5qcwg8=;
 b=FYTTtcLh+hfudCFSuzgjkeOLKo0sLjWRyXfDE0JmqBgZmCzUC6C9lhjT+QyHPnIH0p
 wvwTGOP8gRIrRdiQufCtlnRD2ZKg11/TIxCR9KznmvAxwq1XelccHbMqP5A3cS69Rrx0
 j7YJ/3nyycZotu2iz+klzVl2HHmeAv8LmUpgQw8POznagDDdOS2yPA2vPdwP/oaGhBMS
 i5qYe/cm6ane5KwEIeV54z43NLdueC9vQ48wfPJ3+Bb+rU5TrUHzgUybTBwMU/GGPv0P
 MzIDyjCMNOaMB78IDCYu/nsHitc25N+ncOer6++Wq3tBWzr1t/RClLC6ike3QMY5wVuZ
 491A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRm0HouGMdR84bC3UcFYcvbQZaHWW7pVFIV1DvLiWA1LEn/rAle7gt6A/PMf8GMG8Y3Gsp1LUkRQ==@nongnu.org
X-Gm-Message-State: AOJu0YxwGyVsS+Byz3AkKa3HZgg1CFp1himTw1jg8cUZj7dWSFFO0Bib
 u0fQFsaJc6kzRmvHfcfdNaIBqXdu7RbNCVbPc+GjqLC0QN3AUVCUe/H+TCCbYy9etGU=
X-Gm-Gg: ASbGncvRk8iuNHWcq1IBDfgsOsb5RMV8pWPFQkAy3e2+f8K9SHXQ13+hw117P8TchJ5
 OKpiWZFqN8xWVH6NsGQiG4cVqGo3aqInxxaS6UOU3oMOAQE0ZagjlLZd53197BMV4GyFeS69RBU
 JuUFkUj0p5rorUeYqz4V4PFYVhyoa9IFowZYTaOHacr/vH00mmoWlCPYC1k7DlRsPXS1CVnxFO/
 MuccfVXBCFWkilphBwW2B/rYonJtSnrOOddLWsUkycGGd/6QssOhnhgoABVMztkkBze1JkapR6k
 uAlbdGqtxlJ7Ycxt+mIjikmyngEdKBRmQ83W9o+8DMbznMHWeD2m+6IizYQiOQeQRacDZeBUrwC
 T/70y6WtPXQNukD1WPLJAaP0BsdkEuo5Bt/KCpJGgKq1zEcp/Iz3t3eBBEP0xnESFdIFM9K13J6
 xBG1QURXFIQVmrWFOfN0MbJD+cXEHnpnQzhOdesZDy8V5v9SfAAQxrfoo=
X-Google-Smtp-Source: AGHT+IFp8VT48Ql+53i4mrWS48pgyMYG3Z/P3ai2L3tGtyhJlFPRkbyVaAlOMAuIUrBwr1iAYW9TXg==
X-Received: by 2002:a05:600c:8209:b0:46e:326e:4501 with SMTP id
 5b1f17b1804b1-47717dfe812mr15272855e9.10.1761631101359; 
 Mon, 27 Oct 2025 22:58:21 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771906af34sm10491105e9.14.2025.10.27.22.58.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 22:58:20 -0700 (PDT)
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
Subject: [PATCH v3 22/59] accel/hvf: Guard hv_vcpu_run() between
 cpu_exec_start/end() calls
Date: Tue, 28 Oct 2025 06:41:58 +0100
Message-ID: <20251028054238.14949-23-philmd@linaro.org>
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

Similarly to 1d78a3c3ab8 for KVM, wrap hv_vcpu_run() with
cpu_exec_start/end(), so that the accelerator can perform
pending operations while all vCPUs are quiescent. See also
explanation in commit c265e976f46 ("cpus-common: lock-free
fast path for cpu_exec_start/end").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c  | 2 ++
 target/i386/hvf/hvf.c | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 79861dcacf9..c882f4c89cf 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2026,7 +2026,9 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
         }
 
         bql_unlock();
+        cpu_exec_start(cpu);
         r = hv_vcpu_run(cpu->accel->fd);
+        cpu_exec_end(cpu);
         bql_lock();
         switch (r) {
         case HV_SUCCESS:
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 28d98659ec2..16febbac48f 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -992,9 +992,13 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
             return EXCP_HLT;
         }
 
+        cpu_exec_start(cpu);
+
         hv_return_t r = hv_vcpu_run_until(cpu->accel->fd, HV_DEADLINE_FOREVER);
         assert_hvf_ok(r);
 
+        cpu_exec_end(cpu);
+
         ret = hvf_handle_vmexit(cpu);
     } while (ret == 0);
 
-- 
2.51.0


