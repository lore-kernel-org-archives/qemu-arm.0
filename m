Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21ACCCD1BC
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 14:32:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBwLQ-0002XT-NP; Thu, 23 Oct 2025 10:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBwLO-0002PJ-KL
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:31:10 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBwLL-0001qY-CV
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:31:10 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47103b6058fso7004775e9.1
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 07:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761229863; x=1761834663; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T/5WvYcYJ8yp0ccFt2pcnpeZY9JJpwnARpW25qBUYws=;
 b=RWXF7h3YTI7xEfZYCMyLx7/YS+gdwv+VjIC2WiRCtBgKEfc2UEercQwxCvwiXBIH8K
 8gujDFK/M9LINUld/Dk61sTd6nY2jhpHmN39KeXCc1yp0ZdK0p1SR48FlzIKeXLXn1Hw
 fmlpAR+xsmBrc+fCCby//8wnxJaypGolbOroHAs/sThykHk9VbcTPrFthWiEqDXxb7vi
 VeIuxJhvawKZADYJB7FP7swfUexO7VafzFPRL4ZxTFQo062RTnRtQyIN6fhffOh+zMPw
 C1PHGYLbUKTIj5rPCLbnCwRCJ+l8aloXlQr1MjHxahFH5jGolQW2C1DPxe8GQ9/x8wGo
 Bf1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761229863; x=1761834663;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T/5WvYcYJ8yp0ccFt2pcnpeZY9JJpwnARpW25qBUYws=;
 b=C+/r+l2MYUpvbi3L5LsQnmhFVU1HVQdVxSVHZT/Itsxwi5AVh4KFHTpp92ckFyz9Y9
 aLQ0IzOQWmOI2OgQ+6ZDT0bwlSnJoA7xl9oml4CDuC7jB8JbSnykrXycmd8eN4Tifcoh
 2sk3WDB/8H6IsyMObFcTvYpVE6L40aEO6pAHsKXkV/lLsV1n1qvLZ5dhTBz+EA7kv666
 EaTPT4DKgGHXLKOl7z3P5RUxTHLELENdNFdS+oVI1JJA3UGAKdpasd1SMA/rW/r3RSwM
 Ptl+GqvHM9/V752vjiHYDV+mKfAbK2C/W+IhqosLs9LYMIXfFakQTtySJhDBH8H7s2Um
 bcTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnyimRgRzaZTw/Rm+ZX12N7TqT1Xv3HJ0Ns5se0NxZvHgCJ12rzxr+cyrDjRdOZECsr/odXmXSJw==@nongnu.org
X-Gm-Message-State: AOJu0YzLmSNEwlhOsAQR34s/Wg853paXpyiGcV7TNyVoi9oOHLtSpyPP
 Kh8c2vXlb1g1GQ1lt6QeEDB2Mp8T7UujKBBy9n6NFu3GGzbzSsbr5BuvQPj5AK/MY2k=
X-Gm-Gg: ASbGncs3eHZFYv18JRthqBrqBk09R5LiMIxZ92EvDmlylUUh8rN/21Y4YnPX1/oi6xR
 5Kb6OYzdldx/Ckk9Iaaq0SMTQg+u7Jnch2wEAHM+wq4my0e7thX/MG4fH44v9i/jP52Ij8DjluD
 qQT0Tt1r+jzR8hPsSNEsZH4Xi71d2DZ1DxKr4W1n80ogdNFMUuan47EV538AgOAOeuu2IAJc54m
 Zmx3qkGZS7SvqhBWH/MuxFtH9giGBDn6jT8zkgCYmNXxu8XxBjVN5XPc2PD3AhiXvvy4TxRkJ6r
 237Z3PvnueAY9VfgMnF+HbTHB+ufIBrWoYFzl8a7L7AR06Sy+zIohnVztNARHyizYpb0iwIFloe
 9iHOdnM/aDyS0UwT87V337bs65NMPavZwLVN+jKThPKU+XyyrVetXvSRfFpdmz699jJ91YjcAN6
 ekQnkud0at1gXBeS+1F2vfYImVGg1u6OYf2ujmV3ffAF99X2Zpp7Q23bmmOq/q
X-Google-Smtp-Source: AGHT+IEqpoi13AH0kldXC38uycff9piRT4TNbZHtmzsemW55pwWAXcaSN0OAkWJHRuwpkfCzmkGtoA==
X-Received: by 2002:a05:600c:a4a:b0:471:665:e688 with SMTP id
 5b1f17b1804b1-475c40013b7mr53414085e9.17.1761229863263; 
 Thu, 23 Oct 2025 07:31:03 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c4342373sm119172675e9.12.2025.10.23.07.31.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 07:31:02 -0700 (PDT)
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
Subject: [PATCH v2 22/58] accel/hvf: Guard hv_vcpu_run() between
 cpu_exec_start/end() calls
Date: Thu, 23 Oct 2025 16:30:43 +0200
Message-ID: <20251023143051.11195-3-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
index 2929a92defe..ab59381b500 100644
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
         /* handle VMEXIT */
         ret = hvf_handle_vmexit(cpu);
     } while (ret == 0);
-- 
2.51.0


