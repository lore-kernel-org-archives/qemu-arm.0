Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870D710FCAC9
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Apr 2026 20:18:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w821A-0003LX-JF; Wed, 01 Apr 2026 16:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w8218-0003H8-Sw
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 16:18:22 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w8217-0001bM-Ds
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 16:18:22 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so1067425e9.0
 for <qemu-arm@nongnu.org>; Wed, 01 Apr 2026 13:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775074700; x=1775679500; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YVG35mCjYbI6WSVBV9wk5F4umnWgTK95HJKmzFc6eOA=;
 b=vMmmsl6yfM229XaAZ/TumRcEFcKomjt+KWnkY2F2GuMHjMRxwVBGGYF/Vth6m7BjP3
 3cEqaBVwacNIDSorYkPrwRtJVfuG/jLuWyvQbw2NzCKwnjq9cZfn705+nTq7RpeSOY1z
 PcW6QHiSK+s41Ysz+QwTaH8Q3YPjRe9h/N462nLa2jKk/g5O7k6VzfjeUnIqNwCpGlAy
 GrTA9GeEV94Xj3ME42YVijPvqqIJ7YEhBacN9BVBrel4dFa43RK9oU5JLGjnS15OTrkg
 CcEhfWed51fVhIuUscnvblPKCLhmxXSye2mkENEcSbeQ3m4JrCDJTZzDlfw3/hJ7q5gY
 8xTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775074700; x=1775679500;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YVG35mCjYbI6WSVBV9wk5F4umnWgTK95HJKmzFc6eOA=;
 b=WFCkxgliN1QchksHYu+YWyTlzRlbaOSupjIQKWTDWe9y3EuBCL5ZtQzfRq54XlbgIw
 Gdzc6pw2SfAzmdJUA22S5hSo4ecVewS7v04bLAd64BmzOWbg4e0kSciyN8rrLzKnwgzU
 1M3tjhRovjHEg/C8VCcVIZJdIo0vdskFjTCaJnxo/u8VLXi4dP7Pa6gHCCn23P/lQ5+S
 ay5M6Osad389HdtVHG4xr5qRdTFF+KqEt9t4pK9ZI5QD7Dd35Gir9/ShEMOxr2+1wsk6
 tPIXFxMCupMp2PmwEe9FKjiXtbQmFF3c77vuty+45jrEWfGm8YkLDWGjr4BR4ezdX2JG
 ZLXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtJNuD9uUVb4CZ2Nu2uQH4PtjKo2Q/2mwhtfQsb6z11TAzYNCF3RnbvFyYC0fdmCirDhTbyKmy3A==@nongnu.org
X-Gm-Message-State: AOJu0YyQsBAvRT5Y/Bu0sYzY8ci9cxh9od63upgOQMi95+KDES/ru3L2
 f4PhtEkQZzp26ISmdO0kWvWpg16teqJ2Y9vMIShDD1rDXxmdIjNceMOb6hXu9v1FxJg=
X-Gm-Gg: ATEYQzzMNqoOsyKdj6Nw/w0t4lm8kY6T+1XGvd17wyj7HxEiVavGgQlzdR0LIgwch4K
 79Hmh6fmjQh3SJAkpa4YmKmxfA3HBCOoMQqzf6UMZdK5+S7Iigz5Gebt44B+ZzYcBb3Kjw4B93V
 L6Qs8JunnyViUTuLwi1+/eAp+CkSZqeKFh4OlG7zoOyPeZgzYOHVdAAdAhwcoPulkN9YQwq5TZG
 b15G9TtyLDhUPkMn+5h3JprAKLYxFH2/j6eEw4JlgKxHNzUj5CzPNpUGpp9M3QA4yodbs2VG/h5
 fCtfaHtJqDS4dkMGXnDAdSQyukaoaXp9fG9aKig1AFidCrAFZ+92kHL/AtitwkweQfBQpFf+3hX
 AD1rlJlDMZ7xSe4sALcgEOxrwaWY8lxTnychY04U0tSgGGlAXExh/wx8uK2NF12CEM3o2lBvqdq
 6fFAQPANEYePB1ynLiA2bSvJpEX33+CFpkXc/6fFAEcFhFDZ0CJ4AlCilIAYKs+0GvwtoTXBaem
 yG9FQhGRMA=
X-Received: by 2002:a05:600c:3e1a:b0:488:7784:d06 with SMTP id
 5b1f17b1804b1-488835abf84mr81848365e9.31.1775074699871; 
 Wed, 01 Apr 2026 13:18:19 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e93cf2dsm128270145e9.11.2026.04.01.13.18.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Apr 2026 13:18:19 -0700 (PDT)
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
Subject: [PATCH-for-11.1 3/8] accel/kvm: Expose all non-target specific
 declarations
Date: Wed,  1 Apr 2026 22:17:47 +0200
Message-ID: <20260401201753.92290-4-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401201753.92290-1-philmd@linaro.org>
References: <20260401201753.92290-1-philmd@linaro.org>
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

None of the declarations guarded within the COMPILING_PER_TARGET
checks use target-specific declaration. "cpu.h" is not required
since some time (maybe commit 4fb54de823e "meson: build target
libraries with common dependencies"). Remove the restrictions.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/kvm.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/system/kvm.h b/include/system/kvm.h
index a2463a3ac3f..8bf7a10deac 100644
--- a/include/system/kvm.h
+++ b/include/system/kvm.h
@@ -224,9 +224,6 @@ void kvm_irqchip_add_change_notifier(Notifier *n);
 void kvm_irqchip_remove_change_notifier(Notifier *n);
 void kvm_irqchip_change_notify(void);
 
-#ifdef COMPILING_PER_TARGET
-#include "cpu.h"
-
 /**
  * kvm_update_guest_debug(): ensure KVM debug structures updated
  * @cs: the CPUState for this cpu
@@ -449,8 +446,6 @@ void kvm_set_sigmask_len(KVMState *s, unsigned int sigmask_len);
 int kvm_physical_memory_addr_from_host(KVMState *s, void *ram_addr,
                                        hwaddr *phys_addr);
 
-#endif /* COMPILING_PER_TARGET */
-
 bool kvm_arch_supports_vmfd_change(void);
 int kvm_arch_on_vmfd_change(MachineState *ms, KVMState *s);
 
-- 
2.53.0


