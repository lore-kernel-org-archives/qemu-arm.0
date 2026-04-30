Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D47FF8875
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 09:39:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wINr4-0004xZ-2x; Thu, 30 Apr 2026 05:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wINqq-0004g1-0V
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 05:38:32 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wINqi-0002Sk-HE
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 05:38:31 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-43cf7683a28so463979f8f.2
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 02:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777541895; x=1778146695; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WbM3cM2bDzJO93KlH0zKhh0sYblzAm78jBIigZVtZpY=;
 b=cnpgdseOmEmem2a4jVGY6WNxdMGRES52bT2c4AKy582VMgCcSYclXF7cBgKqzJNfj8
 Onbu0CqFZvD/bJNC0Er+v5PQ8AfvlqYXwFjaZcwL7NG64qlSkCbpowHD39XY+HX60r6w
 anVJdeAaMukWKXwajyprueMEFyvpvztrHjI2HTZgRRdOS5bBVcV7PmJOOd21XrnK7GcP
 ke5N7gSOd0cHz5LlDL0wsDmGVxYmxDxpm9wUEgX9exxkNgxRb0WDTAs1NvyRN+cwgsbm
 6b05pS0AdkI1IH+zfVlXjI3sI9vxvLZHCztfOZtDSgPmCuQABS2b5ZW76h+FUbUL37D1
 Drsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777541895; x=1778146695;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WbM3cM2bDzJO93KlH0zKhh0sYblzAm78jBIigZVtZpY=;
 b=q7RWZAn2ETrPTR0cVQW8n+QirN/keQVYJcUl9aBFCl0UKGufweK/XcnjwXCW5wyCsH
 RxbgV5GLQjDob+bYvH8QBDDHWrsBaMNu5PMmz8B5EYqaVz3YdcOAvQID9DUBMrlMsKtb
 +Cbq4eETUzQIjd0MtqVO2pH7QEdQ9ETr1uCFyAg+qf5i3WxtZOhrd9/+IMRpZCmbDHoK
 kMuKHv2N5CgJiHm7+XoTuSRHMCSvWA5hYCUWbyf5Ub6Ed9BZRA0LA5rAgCVsFTB8CQHk
 Jmv/1g5Pf97fVOikKOF2fDOHE1atHmhHQ/EJWdlRQtnE1XCOTNgGb+aw9vqjreEcxY0w
 4H5Q==
X-Gm-Message-State: AOJu0YzelC9Ggeek3stKi7y9IYTvxnVgODEEioY1U/NX/Eai5atRIEtK
 JBeXn+x8fSy86008tZEO/Xx7HxBYFLxlA1CopWzAI2cLZgJaH1xGWF4vvoMmGV0lM30=
X-Gm-Gg: AeBDievTipdc1aPT0d07AJQ4gB2SP5Pd0AOfC/WONaaAViboo56GexEEl61rMG2F2SN
 lQd6tZ4Dc3Ihhi1pAJa0G7SRq+B2ITeqFLVSxlqrzyhgcIrB8tdwzpi1Cq9sd+DyC463tPVCZx9
 V6IZRRMxZqkjbL2Wx3QH7vHpIihTVjCBRYqPqrx2FeACJszxApy0LE2JfwH4rNFGQpHL1go/Ggh
 Bw/zPRmmkwv07MfsI65StpS/uSDFkdXwnsIhDOPgomal/T3flznyBCGQIyKnE8xxMDsRpmPMnOO
 jJGkbTid4qjwcGJv13/SzxmB+Ts2ihyP9G2flQz/8UP4wYsgANarZ+5oOTmWs4yyTguqPha3gIk
 OBZtXosec5nQdao/FKfdNMg1LUHkt9xTyv7qvGgEYs/5r8HasajslQCAOa100EfK/OkIWH4ACdn
 WDWzwp6x2WFT9ZiLj/rkHU0yfiNLU9WHAq4XnKL6bahDoaXPC8rewqFA60lURD1MvvVnsDEeIak
 /8KlaY5JE45p32yqanXCi+qfsHaDyRYfNtkSyubGw==
X-Received: by 2002:a5d:5f47:0:b0:43e:a70d:763c with SMTP id
 ffacd0b85a97d-4493f71a4f1mr3482410f8f.42.1777541894561; 
 Thu, 30 Apr 2026 02:38:14 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-447b421721fsm10816795f8f.15.2026.04.30.02.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2026 02:38:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Peter Xu <peterx@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 02/25] target/riscv: Make get_phys_page_debug handle
 non-page-aligned addrs
Date: Thu, 30 Apr 2026 10:37:47 +0100
Message-ID: <20260430093810.2762539-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430093810.2762539-1-peter.maydell@linaro.org>
References: <20260430093810.2762539-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

Currently our implementations of SysemuCPUOps::get_phys_page_debug
and SysemuCPUOps::get_phys_page_attrs_debug are a mix of "accepts a
non-page-aligned virtual address and returns the corresponding
non-page-aligned physical address" and "only returns a page-aligned
physical address".  This is awkward for callsites, which in practice
all want the physical address for an arbitrary virtual address and
have to work around the possibility of getting a page-aligned
address, and it doesn't account for protection being possibly on a
sub-page-sized granularity.  We want to standardize on the
implementation having to handle non-page-aligned addresses.

The only thing in the riscv implementation that we need to fix
is the place where we explicitly round the return value down to
a page boundary before returning it. Drop that.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20260417173105.1648172-2-peter.maydell@linaro.org
---
 target/riscv/cpu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index dd6c861a90..475e9cfd57 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1677,7 +1677,7 @@ hwaddr riscv_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
         }
     }
 
-    return phys_addr & TARGET_PAGE_MASK;
+    return phys_addr;
 }
 
 void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
-- 
2.43.0


