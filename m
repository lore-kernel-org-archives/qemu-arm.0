Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DB2CA1009
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 10:11:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utkRE-0005hl-Gl; Wed, 03 Sep 2025 06:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkRB-0005av-Jh
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:09:58 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkR4-0008UD-6y
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:09:56 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3cf991e8c82so3585139f8f.3
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 03:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756894188; x=1757498988; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gEfPabvomn383Kvb9BVWwQgaJJGjCsfNW+1Gzb6ZBJ8=;
 b=Hd1ctOC6zKbMPpmxd4eN/1IxotdTudqg1Ml84TVzbfl3e/AZJkEvNhrPnv/WHaYHjj
 hYjPawjSQljSlb+7UV6+F55s2SfP0oZ3ZHwGT7APy3lzYTFu7GyJz31bdfcfOmGvPWep
 AOqGVyVubzkmQn3xx0rvaO4bMDIrQn8XHmqH3zCqVpRkCBSONKZGiOZ0V/ejwNS8t+fF
 PKiAxkF1W/hUfheSDJolRffPB0QGQ5Ch/IRqSB0Gj8ws4CKCN4MfmDMiYQ9Grprcybda
 gF27MhO+Vq3BW0qVQ8goTSFk0waEgWnxLPEYZdXNaRUKX+TTVVUfOmj9C9Aex9CC4BRg
 IdGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756894188; x=1757498988;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gEfPabvomn383Kvb9BVWwQgaJJGjCsfNW+1Gzb6ZBJ8=;
 b=LokeJ/Bh75RKMFIsFjFPuztGS9SgYxM3flgqv+3/8Thi1yYcWbuBNJmx1TZLZq31cH
 vxzlj3ayEGLggxEEgiwFO8P/Pg8EQOVp5H3n73UZsnmUCIL5PhhiUusZbrcas5gKDF6A
 MQ73tr2CC5B09fnYEMi8eK9YbQSlNYNYpvTjcGgE4iNSfoVYC+CuYDbXWyLovlXBmfve
 m+NL/8FbeNL+4siXCVBEkt6F8CLp1s1iRrgjzoHJ/XW4xoSM2fIOvniP0zAjph+Y+5EQ
 58k439d9k/gW4Hwd3ZecRrpGKpc+jOARqvc+jdogDQSAkwtcf4mT3hs5BkS42N2CK/WR
 1VjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVGFxyjcAnCcaKpLD9TR/kYEnwDqMlRMl2+eZASbAzJAcNPjvsO28f0Kqot2iTgcbTpdxPnesqLg==@nongnu.org
X-Gm-Message-State: AOJu0Yw70dn58FnW9W1BO/MFQUKnZAUUc9Wllox5NGy71iWPACoZvdzW
 LkJQSptlIwCTl7+gkqiCBdLClEyxnp7S9XHFCHL2G/7NKRvP2xCGScNsc62BPJrA8Bk=
X-Gm-Gg: ASbGnctKzd+83XGFGECIL3KT204Vf3oz/04sjHDkAlcIuRyXsMdZgrdnKjVu6sQUim4
 A8tF/2ydFzVoU8JXl9N2jt5sjEMwo7dce9SBpLQjo/J6ElOER8BqfFR3D1YrwPcjr9JTaaJ98pL
 g6ad/7Ac7syjOVpwo7DbKgWl7VJfVyMvDHa+BcoK1iYhLp5Jto4pX40urmVvKkOsFM2xPv8bJM4
 m02toNhiXsy1RRUvVoWmZ582OGcPF6t/KKSwspWU9W2rTHuYs6AN+T/MObPHStNM6haH11O4FNu
 8JcX9RSW+WKEbd/Ajh8PbQ1jRdQs5SomVcO8VzG6Ego6IqrSojj02CBgk3MHAI+4OSCCbfOTtN6
 sZsRXf0DVBPzMccHFhPHXLheigAbvDkmC+ilEzIxud4xikNzyFGgyp9qIVR9hDD4p2rBhT/9fPq
 0bbNLz17zOD9PAvpc5
X-Google-Smtp-Source: AGHT+IHjeaXBZbON+AmbQcwUe0SBB9pAgd5tx8CaxlcG5omgkudltDqO1g1YjTt5ypja3T0r9Tow3A==
X-Received: by 2002:a05:6000:2f84:b0:3cb:cc6f:734e with SMTP id
 ffacd0b85a97d-3d1dcb74345mr11728532f8f.14.1756894188421; 
 Wed, 03 Sep 2025 03:09:48 -0700 (PDT)
Received: from localhost.localdomain (98.red-88-29-180.dynamicip.rima-tde.net.
 [88.29.180.98]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf276d5e5fsm23234058f8f.27.2025.09.03.03.09.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 03 Sep 2025 03:09:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 19/24] cpus: Trace cpu_exec_start() and cpu_exec_end() calls
Date: Wed,  3 Sep 2025 12:06:55 +0200
Message-ID: <20250903100702.16726-20-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903100702.16726-1-philmd@linaro.org>
References: <20250903100702.16726-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 cpu-common.c | 3 +++
 trace-events | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/cpu-common.c b/cpu-common.c
index 152661df8e9..614391fb9bc 100644
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


