Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7F0CA1010
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 10:09:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utkR3-0004ka-24; Wed, 03 Sep 2025 06:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkR0-0004VE-By
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:09:46 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkQy-0008Sv-40
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:09:46 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3d44d734cabso2522370f8f.3
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 03:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756894182; x=1757498982; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bgrvAPRPeMpRVzKH2lCQLrXhLFRC0uspct1gvGRvd5o=;
 b=idHSQB5PKqcCEAUyuesySpHVRT98KfUM6rOpbHYwpaIxO9I55ATvnu+AjpJyNKr2S4
 g8NpAAq2KazyriBCUUo3UlWFdV1tRh+LNqrRyZf5vl+G4LhrI37U+ufnehsGhEck7cqF
 SpWneG/YUKCRUlskVtoAAnW4bPHmZzPNQJKFsshH7XtnQrWtfmIsn+YIv+6wtjM1Y10s
 KK8zKp9aBs+Ltytzb5g34oht+JjvtSCoGQZ5szJMB3kMY3WQSzXNmhqA8nwikNEY+KHh
 AZyElJ72kLnmgorJVSn12iqtorZjTdLd5d8cKlHzYvx1pQI1pmKjQ2qH1P4KLsc++Psr
 0ndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756894182; x=1757498982;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bgrvAPRPeMpRVzKH2lCQLrXhLFRC0uspct1gvGRvd5o=;
 b=ivfLJe5cD2zw6Y11AXJrJ7Z6nq6MMcOdsCkRpoWim1HrNNrkUHwmmK7bqNK1GEfo7e
 Hjoohi8kh2AzF1gv7VMEPgLFbg+c4ZOmFjye46ZveEID6yLbk9cOEwRNLpmIfyBxofWz
 gfdgCrAkhWe8RzcCY9NlZ7Xmcr73BNW2onkHtDEpUwLwVTm8s6Un5/Ki255YriaBKHeP
 Mw7xRe4TNq83wLvnaJ8rSc8WI4r07mJLYVdsOscmax/a/1/9M9GJbRnnDZnRzObxE1I6
 kgW0390Wy/B5Cv0kz+uH1eGa8sMc+t6qiVzonFvM9KktLTX+7qSs2JZu9Dio+gjSiTO9
 Wj0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU07GPR/sxzVjXTY8KxOcMuL5Vbfu08BN1dNxdXhVqBbjQ5ApdFwUk86881BMsQDhm/WffdfgvGtw==@nongnu.org
X-Gm-Message-State: AOJu0YwjxZTOA3AigzFJTR8ANzSrs7mKX1i+wzPhEOrKVqzR7GP2ztXw
 lZc7vt3NqevBo059Aju24dL897xkIL3PW3ED1/ZQvuxh/uQPJDYpwkBCrUp5YNEvB0M=
X-Gm-Gg: ASbGncsmtfhVumw9bn0ftifYVzzR4j+XGbiuKSUy7ySv40g8I5kCKTpyIP3Yzw/sk9U
 xNmtCwcNVU+sUmtc0xPgHFiVPQRxvTy9sBMVDkVHSPYaa1FazNLpzS8egUSYUXkywuqRCdYTTy0
 hCtCt7DUpsnsHMOrvcmWpRHJF1+eukTiuxaQotT7BJSnpPdo5Cmh0q6RqD0dOy0lf3ccryy54Kj
 LbFWWjxJIAdudyF00RUyzJp36T7eq2eyGBNtgNL4IIv2ZKCIZcQMZ5YyNRnCUBthSrsxOn+bdEy
 tnnMFHChnozaMoPrNYJQyLayRPch0xpRv55nH4eHbVaDQxOdBgyAihXZzezsQfKZYvaV9xgnCzV
 QJZwVqyiEUIbr0wXkYgRPIE56pjYfC7Che+SiJWlxtqa/wCePgg4H3gSDr62Z2Q02TVrFbnzlej
 brz4zgcA==
X-Google-Smtp-Source: AGHT+IGpAYTJvKczYgPz502O2hrnnyGSytgRVzbTcMu5SGbXAQoimSXFtd6+tdyLFjun6Wvu9GpRfg==
X-Received: by 2002:a05:6000:2681:b0:3df:1a8b:ff40 with SMTP id
 ffacd0b85a97d-3df1a8c028amr755192f8f.43.1756894181967; 
 Wed, 03 Sep 2025 03:09:41 -0700 (PDT)
Received: from localhost.localdomain (98.red-88-29-180.dynamicip.rima-tde.net.
 [88.29.180.98]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d53fda847dsm13940922f8f.0.2025.09.03.03.09.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 03 Sep 2025 03:09:41 -0700 (PDT)
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
Subject: [PATCH 18/24] target/arm/hvf: Keep calling hv_vcpu_run() in loop
Date: Wed,  3 Sep 2025 12:06:54 +0200
Message-ID: <20250903100702.16726-19-philmd@linaro.org>
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
---
 target/arm/hvf/hvf.c | 40 +++++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 0cfe3066c23..b60efdc1769 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2141,30 +2141,32 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
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
 
-    flush_cpu_state(cpu);
+    do {
+        if (!(cpu->singlestep_enabled & SSTEP_NOIRQ) &&
+            hvf_inject_interrupts(cpu)) {
+            return EXCP_INTERRUPT;
+        }
 
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
+        flush_cpu_state(cpu);
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


