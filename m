Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF74CCD1BC
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 14:33:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBwLI-00026n-30; Thu, 23 Oct 2025 10:31:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBwLG-0001yM-Bh
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:31:02 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBwLE-0001pD-By
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:31:02 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-4298bada5bdso577320f8f.2
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 07:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761229858; x=1761834658; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V3asS+wXSq9uXqx9Uo0sg1PGthTH+0LCho3xSIRojV0=;
 b=sCSsVL88yvXQg3Rb+fraQGP96heFco3YXo2KWh8in54YgGs4eHkRO1TlbYlJKEnok5
 ZDi+g7Yb8Hrrs3MLg4sWkSGs66r+8gQPGFcdPWeFKwC7cxpBI25FpIBGQk06N3IFGLgb
 iJX7MsRmVEigvH3iEMyG3Hy979dDnVky9Fo8Tleiq9iEx1YcJKyy5cIG7dEueJP4phb/
 mdiYBN051FuRgv3veDz6bLOcRzu+sUXYeIg0nQh6c0SyfEjBZCQI7Kj2/s2tDjkgZStw
 JUwIkvdhxGyWKcT8sFJb8Up8xmr7l0jagOKvkWDnq4aFyc/MFO/24zujMPipaOpf9V+9
 SuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761229858; x=1761834658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V3asS+wXSq9uXqx9Uo0sg1PGthTH+0LCho3xSIRojV0=;
 b=wL7opIi9u9RMBa+f8nkbFI/hl/jZlvO2ieFl6QMfFkzAjMG582PHFjWWTJ49oqgZ04
 YPJyr2qykurotho1XNxcNDP+K906+FAKKw3b9f0+CYUKxU7z2USfuKhqKtalUUfnUhj4
 5q6F5smJAZ+tSmOpKQWvJoi6eNYg3zPYMVTux1w1d0rppxMed+m0V67Na5bdd9UztjRn
 9Q1XvLZkqgAqbzgmiRT9wAA1ZguKq4Q7WEc4rp1vN63V+PWlKWICOAYJZonfRLcAoEZn
 +Maz0oijbQ+INZH8LzVnKUwszOm/l4lDHlTfgfYEA830BDmLEUfQKFDvCuCkEH5LCsST
 8T7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVvFLsC+0v1XLkKgQYZk6Fs4Q4hEBxfYo11BMbmGrWFwQT87CV1IvDA36674yr75Lm5sGIq7+7Lg==@nongnu.org
X-Gm-Message-State: AOJu0YxHnGja+pS1sdkqDgV+7eV7n54DpcBu72kBmVWrEH71rjKOskJU
 YieZyiimAb4E5t6qXaxmsRKlywFAcqodiLmj4VwTbDachtyYRNc4AP4ZtY3gP7NcPPw=
X-Gm-Gg: ASbGncsj0uVYVQPTNt1jRB7l6wonovRtLNk5u5XkF1XAqj9PEBNb4rFGvXhSB4uIaQW
 t/YpfwubXb1RJ6q4Kez+hamuPeGebaEgVTstZg84yO/aflEec5JvXq0PlKVsDov1pXTeiSE2xKV
 CnQqT7XkAfgkYKnAZNCfjA3Wg+J9csqKKJW9S5EeozTqwkea87dm79XtHZ+IFTtjCmL6mgC542h
 YF7/sl507s9VizAg4aO3vS4ARD65UdVasX2vSdR1m2dBEH2A3UOj6czW+2rlR8jxyTa/lVJCqGD
 wRTk+vCiS2mBVGr46WLc01fDJjeG9lvyzDHZv4eo6VwdP3Fnf6Uz3hy6jztgaXQPzQmRHo/bocD
 RCAQW/TGeoC0uxdTZhe8brd95sPEM+pokvUUHJpsdPNpxLVlYGO3cEx9C0uScLDG+PQKwQjktCz
 YzfE+hpzKCUwxeWj2lbL6mbkVQmKnjvF5bL5QBEGtLN3BOYtqPMg==
X-Google-Smtp-Source: AGHT+IGoiG1ypgp6u0o2eygJfvnSdOL16Gmj8TSbis2d0fZH1lLt6/otLz3iJWWC4wjzu4wj9fwj7w==
X-Received: by 2002:a05:6000:2884:b0:428:3f70:4b3 with SMTP id
 ffacd0b85a97d-4283f7007b9mr13762176f8f.59.1761229858242; 
 Thu, 23 Oct 2025 07:30:58 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429897ff371sm4293487f8f.21.2025.10.23.07.30.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 07:30:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Alexander Graf <agraf@csgraf.de>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Peter Collingbourne <pcc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cameron Esfahani <dirty@apple.com>
Subject: [PATCH v2 21/58] cpus: Trace cpu_exec_start() and cpu_exec_end() calls
Date: Thu, 23 Oct 2025 16:30:42 +0200
Message-ID: <20251023143051.11195-2-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 cpu-common.c | 3 +++
 trace-events | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/cpu-common.c b/cpu-common.c
index 0eb5c7b8f24..988d057d844 100644
--- a/cpu-common.c
+++ b/cpu-common.c
@@ -249,6 +249,8 @@ void end_exclusive(void)
 /* Wait for exclusive ops to finish, and begin cpu execution.  */
 void cpu_exec_start(CPUState *cpu)
 {
+    trace_cpu_exec_start(cpu->cpu_index);
+
     qatomic_set(&cpu->running, true);
 
     /* Write cpu->running before reading pending_cpus.  */
@@ -319,6 +321,7 @@ void cpu_exec_end(CPUState *cpu)
             }
         }
     }
+    trace_cpu_exec_end(cpu->cpu_index);
 }
 
 void async_safe_run_on_cpu(CPUState *cpu, run_on_cpu_func func,
diff --git a/trace-events b/trace-events
index 3ec8a6c7202..faeba6242fa 100644
--- a/trace-events
+++ b/trace-events
@@ -29,6 +29,8 @@
 breakpoint_insert(int cpu_index, uint64_t pc, int flags) "cpu=%d pc=0x%" PRIx64 " flags=0x%x"
 breakpoint_remove(int cpu_index, uint64_t pc, int flags) "cpu=%d pc=0x%" PRIx64 " flags=0x%x"
 breakpoint_singlestep(int cpu_index, int enabled) "cpu=%d enable=%d"
+cpu_exec_start(int cpu_index) "cpu=%d"
+cpu_exec_end(int cpu_index) "cpu=%d"
 
 # job.c
 job_state_transition(void *job,  int ret, const char *legal, const char *s0, const char *s1) "job %p (ret: %d) attempting %s transition (%s-->%s)"
-- 
2.51.0


