Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857AFD35154
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Apr 2026 20:18:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w820n-0001SK-0s; Wed, 01 Apr 2026 16:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w820l-0001Lm-Ln
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 16:17:59 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w820k-0001Y3-1g
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 16:17:59 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-486ff3a0fc1so1046285e9.2
 for <qemu-arm@nongnu.org>; Wed, 01 Apr 2026 13:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775074676; x=1775679476; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D9EJVmPQy6eeZJJyEDHNsSijB+T9mGxWe0hCWzvTRWs=;
 b=iMZGf/e1NpFK/KtUUzMgJQ4nUKsZSw5gppQg5C7biMM9Cn30UzbVW8ntI7BCRuCfFp
 nSGhTBio6ZmeCPVsa0TEEgk6veIDvGo/guCVjf4zFa5+WDljE+H4W6mMZRUOnD4tI49H
 aHkRxGCKiQ4oybE5Wesy3SfLYk5klU6vHTGpJe8ewqv2yX8wzituLaeMUPRyQjxkWCFx
 glYM35bLhlCC22TfIg8EmUUtYaBkrN9zwkRNciS9pwnXSMt+/6Z5hyAiu+yb6glMNY7T
 1vH8uUd6ykIx7d1UrRtxAsYgkdMdLS4g8GoZY+a7V3L7NdnGk0nCAiiIgdvrtCicWqUH
 PdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775074676; x=1775679476;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D9EJVmPQy6eeZJJyEDHNsSijB+T9mGxWe0hCWzvTRWs=;
 b=SIS+o1XtmtKZxxwiQ1fVwdF/vaF+RoHFrQzx70TBf7shnTJn0Yk3SzNJVccYXWRNFS
 Sne/hLlx050w5V8zU5p8wL3jMVpuAmaUobvKVETJBcBa6UDUbG6M1YIT3mR/TYiQiwiy
 gm5oy/e627IrFLvDaPt9oZs1rhC7zIUih9mfTaVQ/fBAPC+eRuGpzH4ybbiO1zsxMhkp
 M0aUQaHddtIHdB2vnW0aeuyFBcktQCp6Bt/Q9PlJy6PdEEoevFhLUdXuXcX3VBW/GjhI
 DKlRbnBsP3U/oy1Y5zSAUTkRiNv1eZOm4y+qFRNsvs4aNBNIXe2muMOoftmuQbvS26C5
 vz0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV11oT3uj/nWsg89weEEbrNCVhmZtFpZ7DT+2ttLQSGRz5zRI5NQHHilKum+g8kiTQIsGcrqmsdyg==@nongnu.org
X-Gm-Message-State: AOJu0YxQ44ySNozdWRTYxLbNV2Da6D5bzep3+Lv32BOI/ul5/y2lHfzk
 XarBjP6BFfOlabXEv6GpIjnLur7mGR6cp2EaNje168AltV2nD7t0q/VuKVBoRxNYRvk=
X-Gm-Gg: ATEYQzy5BBvyrhlWLQ5NFumjViJSf9K6Ni7JmZHGyMU/QeZU/jNtgo7qR7B8lUccwXP
 wIFqXrBXDhbdMGi6pr1wDRkbWvpkpUlYk9DYICnIzDLRqTzWIaNPFbnYRQWYBsU+Ew0xejC81YB
 43IFnQHCXW/R9WCd4pg8r5kDjBUyUJBup9GwpyZdNoJcwmxp298v9L6WLSDPmd1kC6a1yxi2K3u
 lyp+g3jW2qXaVRNfCdu7lYnHn1MH+R7A+82kuoM5f7pQ3fjP5oDWKXEv8ttVlYNn770V8GX4oty
 WmL+sOIIigOqJ8a0kmMZek8GJwlUPkeJ27+AAxLCEUyHXhSbN9sw+teLgipXB7cOOqnuI4ANMuI
 amsLH7U5zjKpCi4TL5mrWUHJP+HHINPlHD9u/cXHVkDqJ885Koau7Sl5MeOClS4wdILN3yTfktw
 6PXuGV1vSYSfL7+nNG5YcBRwMd0kh8sdkvbDgSzaQk+zxY9dFmg5/qytWCc6/moEfQoM8c1BAO
X-Received: by 2002:a05:600c:310a:b0:485:3d3e:167b with SMTP id
 5b1f17b1804b1-4888b6d4a4fmr11059385e9.5.1775074676186; 
 Wed, 01 Apr 2026 13:17:56 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4888a7165aasm24239995e9.14.2026.04.01.13.17.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Apr 2026 13:17:55 -0700 (PDT)
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
Subject: [PATCH-for-11.1 0/8] target/arm: Compile accelerator-related objects
 as common code
Date: Wed,  1 Apr 2026 22:17:44 +0200
Message-ID: <20260401201753.92290-1-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

First drop TARGET_KVM_HAVE_GUEST_DEBUG (all targets but MIPS
support it), then -- after minor changes -- move the ARM
specific accelerator units to target_common_system_arch[]
source set, allowing to remove arm_system_ss[] for good.

Philippe Mathieu-Daudé (8):
  accel/kvm: Include missing 'exec/vaddr.h' header
  accel/kvm: Remove TARGET_KVM_HAVE_GUEST_DEBUG
  accel/kvm: Expose all non-target specific declarations
  target/arm: Compile WHPX as common object
  target/arm: Remove target_ulong use in hvf_handle_psci_call()
  target/arm: Compile HVF as common object
  target/arm: Remove target_ulong cast in kvm_arm_handle_dabt_nisv()
  target/arm: Compile KVM as common object

 configs/targets/aarch64-softmmu.mak     |  1 -
 configs/targets/i386-softmmu.mak        |  1 -
 configs/targets/loongarch64-softmmu.mak |  1 -
 configs/targets/ppc-softmmu.mak         |  1 -
 configs/targets/ppc64-softmmu.mak       |  1 -
 configs/targets/riscv64-softmmu.mak     |  1 -
 configs/targets/s390x-softmmu.mak       |  1 -
 configs/targets/x86_64-softmmu.mak      |  1 -
 include/system/kvm.h                    | 13 +------------
 include/system/kvm_int.h                |  2 --
 accel/kvm/kvm-accel-ops.c               |  4 ----
 accel/kvm/kvm-all.c                     | 13 ++-----------
 target/arm/hvf/hvf.c                    |  2 +-
 target/arm/kvm.c                        |  3 +--
 target/mips/kvm.c                       |  5 +++++
 target/arm/hvf/meson.build              |  2 +-
 target/arm/meson.build                  | 12 +++++++-----
 target/arm/whpx/meson.build             |  6 +++---
 18 files changed, 21 insertions(+), 49 deletions(-)

-- 
2.53.0


