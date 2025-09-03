Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3931CA0FF2
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 10:17:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utkX7-0008Tv-EP; Wed, 03 Sep 2025 06:16:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkX5-0008SN-LT
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:16:03 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkX1-0002gF-CG
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:16:03 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-61cebce2f78so12041831a12.1
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 03:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756894554; x=1757499354; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yf4kdomIxvqW13orl0RD2fI/Yew6aBRirZc6xfkUNAY=;
 b=GdUAR5VvGTCueZ/1/PKANDsAslWRxx5ihvDmZ9AAv8ZDd4w4phGwxEogcyQ4aTuTfL
 cjf5cb/AOBMcq2F670urAGh/Df+VarXBCOx01UircIUY9mPkkhk557muMaGFbg8ATzFF
 CGn+ndG0Qh6OVZcv4cP2yS4oymgaqFspYpzE7G1mxGKtZkgyohaX/9FQ43xfWICeVCB7
 m28mTgqXn1uwDpCf7I9KL2mvYLCTpS8KOgfj3vA+k7qHwxDZkyJQIiy2L8vurLjqcA7S
 olxUAJzf4tTNtwaITi4PCJeEGuk3tnP8EIHymzgTq16ijNzqKd4GP2AK5kdPvITsVAje
 uGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756894554; x=1757499354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yf4kdomIxvqW13orl0RD2fI/Yew6aBRirZc6xfkUNAY=;
 b=nsUfHV5+1JsCxdI8dNmt5D3Etc+lsPAe3dYAcSMfiO9J1kXsWByLXPLFCycyAf+SJx
 QNRp0JJDEygXxvhT37SiqSosEm/ULE3Hquac1Pq5SAkZgznqM0K4myv3NWwN3eZW/3Oa
 6cw4CH0VRShkMgKw+qB4XWh3kF9Xrii3fQp0PVRtTg+fY9nLDv+eR9nSpxHIR1dmb8Dd
 4P9YLewvF8ELQrxSsRuvwr5KSqXEQIGkTqKTSJBzsB5lmWLhGMqfh0LBArVrWeDJgb7n
 N77Bo5FNZHHNMXtlPu2X9k33R6BwSZx7/CD2z/G5opQf97R0HPpx1CinzINzJBaJT8VE
 Fi5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxFOVuVx5QeJbx4+6eyNSzm/7bi68rWCBVYR9LkH6Q9xTIXdTPM9xcHfWEyl3pfSyvB4YlcIFHXw==@nongnu.org
X-Gm-Message-State: AOJu0YzUd6Gmc9ysSLXbYOhSojzUbq2qFf4NPLto7CkWcaCunlCjns1B
 MNMaIuNESwtLja8091sKZiPz/9Iy1lpYYlz9FrjabcEGO/3gM0duqfu0AcENj5mkdb4=
X-Gm-Gg: ASbGnctur/EdnX1vdNDNnClfV21O7v/hH+zj91+DptP6FgPcZZZOD9VJWnxqLmlGn7W
 xEnG/65pVCyLdr/gey1tpnuAi6+ahLu3ofhOOAAetQUndVwwE73zXYI9gU+OMNCWIw8eznoc97m
 XAfz1TdtNcfo9lQIUNxuIH2SUASOVb+PcuUqgcY0bKOYGrTmRkJIDxnpq4xJcrSeL2iuq0gwCei
 6Nsx5j9WvQ0kGPMrjaJwUQrjmRc5oCKVumJzKKSYQmE8yyUQL3fWXlDlHyr+OMCT4QdtPhKfBFE
 67y5Lgh9zjL/0W2dFLqqLx2Y0lA8KJRFSLAorlSa4yZ5eMd5sLVxhkeieqhSzdpgMSMtHc6gVaD
 0BVWMkvnpwcRAVWK7sHYfKzxGq8DtvJfpAjpoYLJlv20vbDQVDICsSGpC0bSdk6j1c/13ygH7BR
 ABxF6MWD14C+vHGIni
X-Google-Smtp-Source: AGHT+IHQOgMwHD6oDDKECAt5zmKDDOUqxGnAqaTm4KCbQto5aqr8CIpnQHtWWtxQVCkwUEfEsfRmDQ==
X-Received: by 2002:a5d:584b:0:b0:3cd:4ff9:c4a3 with SMTP id
 ffacd0b85a97d-3d1dfa191d4mr12271536f8f.35.1756894075252; 
 Wed, 03 Sep 2025 03:07:55 -0700 (PDT)
Received: from localhost.localdomain (98.red-88-29-180.dynamicip.rima-tde.net.
 [88.29.180.98]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d60d93b949sm12824030f8f.2.2025.09.03.03.07.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 03 Sep 2025 03:07:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 02/24] target/arm/hvf: Check hv_vcpus_exit() returned value
Date: Wed,  3 Sep 2025 12:06:38 +0200
Message-ID: <20250903100702.16726-3-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903100702.16726-1-philmd@linaro.org>
References: <20250903100702.16726-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x530.google.com
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
---
 target/arm/hvf/hvf.c        | 5 ++++-
 target/arm/hvf/trace-events | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index d67372218de..65ac0bd71aa 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1086,8 +1086,11 @@ int hvf_arch_init_vcpu(CPUState *cpu)
 
 void hvf_kick_vcpu_thread(CPUState *cpu)
 {
+    hv_return_t ret;
+    trace_hvf_kick_vcpu_thread(cpu->cpu_index, cpu->stop);
     cpus_kick_thread(cpu);
-    hv_vcpus_exit(&cpu->accel->fd, 1);
+    ret = hv_vcpus_exit(&cpu->accel->fd, 1);
+    assert_hvf_ok(ret);
 }
 
 static void hvf_raise_exception(CPUState *cpu, uint32_t excp,
diff --git a/target/arm/hvf/trace-events b/target/arm/hvf/trace-events
index b29a995f3d3..538af6e0707 100644
--- a/target/arm/hvf/trace-events
+++ b/target/arm/hvf/trace-events
@@ -12,3 +12,4 @@ hvf_psci_call(uint64_t x0, uint64_t x1, uint64_t x2, uint64_t x3, uint32_t cpuid
 hvf_vgic_write(const char *name, uint64_t val) "vgic write to %s [val=0x%016"PRIx64"]"
 hvf_vgic_read(const char *name, uint64_t val) "vgic read from %s [val=0x%016"PRIx64"]"
 hvf_illegal_guest_state(void) "HV_ILLEGAL_GUEST_STATE"
+hvf_kick_vcpu_thread(unsigned cpuidx, bool stop) "cpu:%u stop:%u"
-- 
2.51.0


