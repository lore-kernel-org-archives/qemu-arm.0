Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F02CCD1BE
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 14:31:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBwLD-0001sb-En; Thu, 23 Oct 2025 10:30:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBwLB-0001nD-83
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:30:57 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBwL9-0001ns-7r
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:30:56 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3f99ac9acc4so884175f8f.3
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 07:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761229853; x=1761834653; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T0MAWX3PF+zlZmdiNXq5RCA26mpljCPV09k/qwEJKNk=;
 b=bl6deGFKeu9YvkdRPVRZcnsM2BM77hiVvjBkz+8Rc5YM+LaaIgWO0kppd+yP70Azfz
 NnzMrzpOv3elZ9GPspJWVYMTlxHrODrrWz2x+zOl6Gt/5B40E6s2t+AqwCCL3V7046TH
 bmQr9b+MBRmvalhyya3Tof7VgdazWMKzEJoRfukLhgV+xWLBzhX2nQSN7iv4JLJgLfWS
 qn32gvOrYo6EAydQAhQhCTDE7FxJdmFbyKA28l4TtHmJ4eXbAmXmw6H8wyfre4YkoARt
 V9qS2xVgzKgKUDWZ0UtHgHTzxZ2KDH8dLD/38gNVvzgpspz6V8aNKdhSqkzYkchlD/H5
 do0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761229853; x=1761834653;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T0MAWX3PF+zlZmdiNXq5RCA26mpljCPV09k/qwEJKNk=;
 b=PXai5OuEg6xxit01ge5SHFH1MHPrPRz3M6iR0GkJFczKT4DHcV78c69tYip5AZPenR
 SujQ92NbAB/iZNE5vckTfhPF8PPI1+VKM5WLVMiWxZDsZrMqB+A9LVm8JFrWrJhnHBH0
 WDa01K1jVceUCQ0ynDjspm2XuJC2A8a4JW9NVC+a2R25eL8G77Q1pbCuDome1oQLk2Dn
 OyyiiT+vC4hOWgxF3FUB4PHuVOpEVeDDRrzLCMi8fAYBmriPdzlnEq7TelnVjtHG8jYq
 tORaHOvOGyuUjOJExJnEwTBXyPpp0miGsWEjMqoHvOGJ2Wxz96efBN8cN4WfDZLMQ2fh
 geqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWf3uhuntuAjl8UJ1yb7lGeWzU12U6TrK65VMFitfFfMuzXQgAkhJtxuVh99cxF/EFhSZ4ICcWSeQ==@nongnu.org
X-Gm-Message-State: AOJu0Yysljfdlq8uJDy1kGtXOtDo4z2k6xULBGkhwuN/9eF2rDOc0PRq
 IMpDOm1vs6bz+VOthV4Fb6MtPJqdbPKjpg/n8Ov2ooIDX5GgB+UiIXKvLSyxmGU/FqY=
X-Gm-Gg: ASbGncsuOxautnvotcFvkISWyN8ZAYUe6CuDzNs3HIASr9rrpxZckG8qSiNqcWx0T3r
 nYA18fl7BCZMi2UdH0cDCJ1ildheexmIMPgnyoutwPnOqhnCxndyABLrKxHIN1rRtb6WQCTSFN6
 X9cDLeMO+GaKh2n+0ZpCXo5woGAWt/evfsDaxdtQ/9ie2+/NwJIJtIH8VU+z8nQD/IY7I2Auffj
 Tbd/q0r3tzFCQYMcJXxFP4RQFq0rfAg4AHW+xs79X2bbvGFXdsBD+bPUD7Fft1h3W+v/kcbpN2a
 HnCY4JC8Aw+JAtNiHVmWnMjXu4JlhvsIyE/IOFUIMyAUZcab+1O3u48o7GevZBdR2ixOT4abzF9
 lMrzAYg1C01tl9a3UomcLCKaspgemP0B/qgmCtBkLrcbP4+4stgLcdOOgmuPWWhGFQn8zrgrsYy
 mfoKxSI8EfbqLnLcRixNhjjcuLtFZskPlq1NB4UJXl8H2rSVFEsBJ3gmulja7y
X-Google-Smtp-Source: AGHT+IFCOAMqiZnDqEZh67V77IycAuiZ5c73+EWw0KcxV1hMftPod+iLrhtZSp1Ej7xvfFANsgZOnA==
X-Received: by 2002:a05:6000:41c7:b0:427:652:8e6b with SMTP id
 ffacd0b85a97d-42706528e8cmr17357051f8f.31.1761229853257; 
 Thu, 23 Oct 2025 07:30:53 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429897f57d9sm4337292f8f.20.2025.10.23.07.30.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 07:30:52 -0700 (PDT)
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
Subject: [PATCH v2 20/58] target/arm/hvf: Keep calling hv_vcpu_run() in loop
Date: Thu, 23 Oct 2025 16:30:41 +0200
Message-ID: <20251023143051.11195-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
Reviewed-by: Mads Ynddal <mads@ynddal.dk>
---
 target/arm/hvf/hvf.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 27c600148f9..79861dcacf9 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2013,30 +2013,32 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
     int ret;
     hv_return_t r;
 
-    if (!(cpu->singlestep_enabled & SSTEP_NOIRQ) &&
-        hvf_inject_interrupts(cpu)) {
-        return EXCP_INTERRUPT;
-    }
-
     if (cpu->halted) {
         return EXCP_HLT;
     }
 
     flush_cpu_state(cpu);
 
-    bql_unlock();
-    r = hv_vcpu_run(cpu->accel->fd);
-    bql_lock();
-    switch (r) {
-    case HV_SUCCESS:
-        ret = hvf_handle_vmexit(cpu, cpu->accel->exit);
-        break;
-    case HV_ILLEGAL_GUEST_STATE:
-        trace_hvf_illegal_guest_state();
-        /* fall through */
-    default:
-        g_assert_not_reached();
-    }
+    do {
+        if (!(cpu->singlestep_enabled & SSTEP_NOIRQ) &&
+            hvf_inject_interrupts(cpu)) {
+            return EXCP_INTERRUPT;
+        }
+
+        bql_unlock();
+        r = hv_vcpu_run(cpu->accel->fd);
+        bql_lock();
+        switch (r) {
+        case HV_SUCCESS:
+            ret = hvf_handle_vmexit(cpu, cpu->accel->exit);
+            break;
+        case HV_ILLEGAL_GUEST_STATE:
+            trace_hvf_illegal_guest_state();
+            /* fall through */
+        default:
+            g_assert_not_reached();
+        }
+    } while (ret == 0);
 
     return ret;
 }
-- 
2.51.0


