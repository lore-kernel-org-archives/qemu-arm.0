Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2A7CCF9F8
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Nov 2025 10:20:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFrfz-0007tE-OU; Mon, 03 Nov 2025 05:20:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFrfr-0007eo-N4
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 05:20:35 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFrfm-0004J6-Li
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 05:20:29 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-474975af41dso31518975e9.2
 for <qemu-arm@nongnu.org>; Mon, 03 Nov 2025 02:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762165221; x=1762770021; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cAPRFLr9vuEGB6NuD3MRzbTtng8wcNEQ/2tGtl9RYyM=;
 b=fK0OcrQUz6BXCoWWNSlYQygeFyt/ZDcswDwmBU1wtXbcsi09DDJ4bIU3CqtlBeu+uL
 VKyGcV7D4tMOngLEZk81/IVyGSWWnIfJZyCGAIRVicxxx9olL71zGEAAs+BjNzVzee6S
 icQ9to1LX/xt2HAv8WElILgy8/TH0WCos8gT7+d52wXP63bvHXCO9efa2kMqByutGky9
 nTrvYz7Hww31touVbDTFCNkJg1O3xA7Kg7gEGFPZVthDFHmTvDChqg89R/hLozc9it53
 jS504nzOnxJTXfH5RRERan8CWqXmYtbq6ZHoYxzJvGCmafZuqP9jz27MKhsXTTCYaiZb
 RRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762165221; x=1762770021;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cAPRFLr9vuEGB6NuD3MRzbTtng8wcNEQ/2tGtl9RYyM=;
 b=wNobHYDEBJcolyezcJpCuNoBeHF9eVleasfmB3bZITMEN2tClrwB7qRrKhgx/TaUU8
 slh116w/AZPuBKcR5YvipTGl5kTZE9w5eKeDw19JYL84QHEC3c3Y5Me5vQBKnu+d35B9
 oTDoZc6S3UsY9K2/fMcypR7esQPi3mNj6mV2ezKJ1nMZL8Dj3dEN1JEJcla9MDVVdCQA
 9FAFTyf+em7R9ejRc2PoPqZmHRRlF0M/xa6sHDS5bcqEgs/XOyNl19+8OlLCFdvhWf5s
 BrY4hsT6Mz/1w7Qm0Og41WwuZrjvK1mEM1G+WNJ5j6+emuLbeFFOLSITZRUkvp1xvOpi
 c/1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8UJJk7x+yU1PfIT0xsXQYToF5+U6pMn3DmC2k5coQj5zh6IYpwb+r0GDJbxDaZDNfuMnei9Dx7A==@nongnu.org
X-Gm-Message-State: AOJu0YwB2f2kEJcRBsNbpaDs5Es64ekggvuc6YRgjuQ3yYDHy7WyF9ai
 1dzQcQv+ropnUgJI6j+SU6g/D+XEq7pLfkUoUbSD5fkwsM4xS+3VmeZb68/DLTa+uYE=
X-Gm-Gg: ASbGncsyd1qaiSTlBthJqXjoEt1TQ0HTxIoVkF4KrMFa7dFXe0E0NEOpoqLYJYCmjMg
 Eyk6uV7S4KN74vAToID62KMGE069Ex6fVvENUulrTlSFqwJ+kFU4V/jsIW9srozXFfD0IVRPlgX
 xfCcOexTaiAM0Uw0gTKnQ/dF1tjrgCV2Bx4wOLxNVBYcdOoSQXrOf5GBHwZoI0V0Pz2xcpUdoHu
 8EObdvlPp/twMA7HZIwKu5kIY4xF9QmUejiO+2wGtxBCvxYSLgchfMWoHvlP8qpdyxfTi/kgHA8
 StLLiFawUIJ4UE3Og3EDyXPHVHAmeg1eZwynUkshEDDS5yBiZRnDhEvnfwlPzZJb2c5uhm/22ih
 U8R9KPVEs80kCm6bIPZGIXkpJQoC8Xt2sivXjmIoUo4eODzK02h0sqFqoq6X7rNWgt6HrQYTbIw
 BvpgvVw7l05JC1UAhT3ACbgtdhkfFKC5/V7hZh9pzkOXHQ3MKSz+vkf9MSGMiHVVuu8199wg==
X-Google-Smtp-Source: AGHT+IHEoxliw9cXSsdZp0YQd5iXI7NQiNi1ypvJIzxIwL+gGSs3u8a/R+/JP6HzjWE9rlVljY4wlQ==
X-Received: by 2002:a05:600c:190e:b0:471:669:ec1f with SMTP id
 5b1f17b1804b1-47730791083mr125530505e9.8.1762165220747; 
 Mon, 03 Nov 2025 02:20:20 -0800 (PST)
Received: from localhost.localdomain (ip-185-104-138-122.ptr.icomera.net.
 [185.104.138.122]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c13ebfe8sm20110383f8f.35.2025.11.03.02.20.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 03 Nov 2025 02:20:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 Phil Dennis-Jordan <phil@philjordan.eu>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Peter Collingbourne <pcc@google.com>, Cameron Esfahani <dirty@apple.com>,
 Mads Ynddal <mads@ynddal.dk>, Mohamed Mediouni <mohamed@unpredictable.fr>
Subject: [PATCH v4 22/23] target/arm/hvf: Flush vCPU registers once before
 vcpu_exec() loop
Date: Mon,  3 Nov 2025 11:10:31 +0100
Message-ID: <20251103101034.59039-23-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103101034.59039-1-philmd@linaro.org>
References: <20251103101034.59039-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
 target/arm/hvf/hvf.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 8d0a528dceb..268a0bcd8ea 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2019,6 +2019,7 @@ static int hvf_handle_vmexit(CPUState *cpu, hv_vcpu_exit_t *exit)
 
 void hvf_arch_cpu_synchronize_pre_exec(CPUState *cpu)
 {
+    flush_cpu_state(cpu);
 }
 
 void hvf_arch_cpu_synchronize_post_exec(CPUState *cpu)
@@ -2034,8 +2035,6 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
         return EXCP_HLT;
     }
 
-    flush_cpu_state(cpu);
-
     do {
         if (!(cpu->singlestep_enabled & SSTEP_NOIRQ) &&
             hvf_inject_interrupts(cpu)) {
-- 
2.51.0


