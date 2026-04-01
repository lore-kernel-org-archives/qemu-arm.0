Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABF810FCAC9
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Apr 2026 20:19:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w821i-0005mH-DZ; Wed, 01 Apr 2026 16:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w821g-0005W4-Cl
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 16:18:56 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w821c-0001fH-1H
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 16:18:53 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-483487335c2so929815e9.2
 for <qemu-arm@nongnu.org>; Wed, 01 Apr 2026 13:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775074731; x=1775679531; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BRPUYAczpQfrNB7NESGbjTZhQXyZHZILb2QpR9Q7LQM=;
 b=CAkDVZDH2Q6erSmNyphZqMXt/0ZH2UdWnMk80YQ3x8SexhC887YyJV72FzqVHAtGbP
 OiF89GicKQDXFzoicFBhPuZF+B9/OY4T5aA1udRe5FYEo+0SfXz1fHl6vyEvomP8gzPO
 L9/XkKrF2CyxfZApU8JoIW5Qehm92sZ02OkWfmWBefkssWfJHCT99zRcmg2ewvxIdC7p
 1fl48BDZqYMrr7Hgnki7xQ+wexLbnfXcNLuz90WrmigPyUI8+F3P1U9Tv4iOm+WanWaE
 5g+HfBGVt5uGLGBZV2CHdp1Xn+2CiiXPQQSVFHvhBIAVRvOiZHAfaBJ6kkagy//ATNzh
 N8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775074731; x=1775679531;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BRPUYAczpQfrNB7NESGbjTZhQXyZHZILb2QpR9Q7LQM=;
 b=sGTzS1c/EmHdkbEZUhYqakWCR3H0VWuU9bbudAV7dGgGsDRU0Nnp38Bm+B9RnOa7LB
 VUaLKy1rKDhDlEMsfbtWVSonburM1CbTLQopl6FNjzCxe/ZR1nezZ9K+NlesibNUUwGv
 DgeMrrjKgX8hePnMXqOzCfBiF0t6JnpuIGaA5qZ8qYrJjjlIdFtaQyxgHH5LbTRYRv93
 HzUsg6rZe9xwqMGkrCA7fUNUfxaHJ8W+DarqclW4mBpRpE6iYnr610sxzcrUDvc2Sfk3
 7D5VvwFez5U/3yCvNmaLsh/JevN0qCxNJpqsTcHlxJbP/sUuugHiBM0CS41XCHAmGnC4
 2EUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkvB7rmwFzAzttaCjqAybC7wQPtHVwZMX9DjSCafiXBzIoJ5lzM7x47y6zONgR7wUnoa3GjPiLdQ==@nongnu.org
X-Gm-Message-State: AOJu0YwkrKwU7pcQtzYzChjb1xqfGAyT40i+xsfGJU9X58kDx/k5C0wn
 XZ2ZzbxPJbftPxSwMlYLvyK/YFbFbtDiYdNpszoGlXjGqQXJz4MpYs9gOXAhLkKz8yo=
X-Gm-Gg: ATEYQzzkuYtHWDDFGtckHLdLkBCwBG/9cbyPNZkfGQsILfZJ8GQ19a0pVcOjVGz3D68
 PiTYIU/0ayk0Isot23lgjjH60Xl/BBE5rYgakRHy44y45UbP/vsih1pCtzUnya5gxNNBxfT454T
 bhTdB8kPiT6rqdFpte9SLky1j4KRkV/mneiwNvMZ52jsvjWLjtTQfv0a+XvD/SMw+Y6wkDK+zug
 PJ7vKZ0BPoBBejoPDNuxQOIPfCyFBe+PXdYx5leNCOoB9J2OFhDJdq5S1igLT22tCm/cD6ERLd0
 bc38TdSEd1S2Ygie6qgp6V9Q6BHQumLS7/mMlM7c7i3L7MBu+juZZnTfQYUGuriTk8aTe8mH7L1
 4lQCFxo2RomnL/FP+jye6oFO+AlB5ijqr+WDNcktJKT3LwLGG2KL1WvxIOX7WOHPCNCwWyXfxgZ
 Gt7LlFUjggvyUrvEMOqSxeaizS/mRpdYudwhHVKDyvJuxvFWa/GrfcowQwZfp2KiuRuHrVIAgc
X-Received: by 2002:a05:600c:810a:b0:485:3812:36f6 with SMTP id
 5b1f17b1804b1-4888359db64mr87355785e9.21.1775074730644; 
 Wed, 01 Apr 2026 13:18:50 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4888a567bfasm49538465e9.0.2026.04.01.13.18.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Apr 2026 13:18:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eric Farman <farman@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-riscv@nongnu.org,
 Alexander Graf <agraf@csgraf.de>, Pedro Barbuda <pbarbuda@microsoft.com>,
 Anton Johansson <anjo@rev.ng>, Song Gao <gaosong@loongson.cn>,
 Weiwei Li <liwei1518@gmail.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 Chao Liu <chao.liu.zevorn@gmail.com>, Bibo Mao <maobibo@loongson.cn>,
 qemu-arm@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-11.1 7/8] target/arm: Remove target_ulong cast in
 kvm_arm_handle_dabt_nisv()
Date: Wed,  1 Apr 2026 22:17:51 +0200
Message-ID: <20260401201753.92290-8-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401201753.92290-1-philmd@linaro.org>
References: <20260401201753.92290-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

kvm_arm_handle_dabt_nisv() uses a uint64_t type for its @fault_ipa
argument since its introduction in commit 694bcaa81f4 ("target/arm:
kvm: Handle DABT with no valid ISS"). Use the proper format and
remove the pointless cast.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/kvm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index d4a68874b88..c09dc4cb3dc 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1453,8 +1453,7 @@ static int kvm_arm_handle_dabt_nisv(ARMCPU *cpu, uint64_t esr_iss,
         }
     } else {
         error_report("Data abort exception triggered by guest memory access "
-                     "at physical address: 0x"  TARGET_FMT_lx,
-                     (target_ulong)fault_ipa);
+                     "at physical address: 0x%08"  PRIx64, fault_ipa);
         error_printf("KVM unable to emulate faulting instruction.\n");
     }
     return -1;
-- 
2.53.0


