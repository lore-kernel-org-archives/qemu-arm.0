Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD3DFF886F
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 09:39:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wINqp-0004fB-44; Thu, 30 Apr 2026 05:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wINqj-0004a4-QB
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 05:38:26 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wINqg-0002UB-Bh
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 05:38:25 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-43d77f6092eso438572f8f.2
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 02:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777541898; x=1778146698; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HT5u+p0qjQEaNXx84eQO2RGfa34EknNr47WRL7RZ/Fs=;
 b=VATf0LZ5eLgfWlcYXeqrM5rN2BCKp/NTuu6HkWzrsGJTiDpvZpNLRyaLNko1L1emr0
 I688w3Kv5YFnaPg+WL+U6SA6+nvUriZEYkb/k/PSrvrmhGcf8Wqa53Rk9HFz/z7uoeTV
 xmp/vNy9yPj6jGW7xCqZzJFv1yY3k+Mipt4O8uummAzAkNEQDE37Iovb9wwRIW2LibX8
 SbCK2Z0SO8FRcfnWh3cr8ArECYlswaWlquM6AIzicX1kjcqd6oLkN5xiSrsLFRV0BlB1
 37f+itSSwbWKFhuFO86ZPSOLI1XOYhNwun9Masaq30Uq36gn8mq/L27MXvEl9wTRkgLt
 1a3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777541898; x=1778146698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HT5u+p0qjQEaNXx84eQO2RGfa34EknNr47WRL7RZ/Fs=;
 b=jrKAu0JN96zx1rstIc40OqIDPmoMJX8JzBHo420KHge4i+FFVJQjHnKG+oLzJ6burI
 OctcmrZtX3ulG4HEqoYNfRa2pvnoSrr257A2F3XJC9beArvQGXtgdOt63rYsSm1Jmrp4
 PUqDa/YmTA3z0f1inQ4rU+C95ycR+SyfbRZQ7VHVWJsayzQyL/t5RzTvVCjljMgnvapg
 ty6eaFwFk48ExZnS2LpZUxNdrvEF+enjKiIz9rwZJL/eJ1mAW1J5PPl6Z5fCANzM3+iL
 uPF9iGZF63Ckl4Bj6P9S1L7K9QePu7MzgifMkX0eNcCNajEaiukMPJ38xtQ5BgLkJW90
 1dGw==
X-Gm-Message-State: AOJu0Yyu4GMsyJiY6T8exgqqOzgCjGCZZfQ0CdC/HCfpl3/Tn+XQtzYr
 A1wzWK0uiUzQoSoGrjwHIHTLW0+IAbSEz9BC7oRFaSxATwMy6DrE9q4SP/S9Zi8vNBo=
X-Gm-Gg: AeBDievt5rxFg8VbpBdBLV2lMSfUkxrELvpN9YBWeviB+ciFRR3amlU0FzvCYEjU0b/
 f3wDYlNlIFTZVJNM80DF0zexiD000dNHBluf7Lxw52kiwcN/3ZkHw2jTAus3yxHwDZW2GTyYqaC
 7LJ7G/zALxOTTU4DpP/pdcWzUPJ5bTCsZRbH8dbVcOJ6LlpE8oOMm/im21Gw49vv/ycHkWYLiME
 +nx0EFMrZrwxpNrRxlx1mY62aeCKT3grjvdO2X7BgaJpbQQWgSrSP0Xj47/Jfia4mXSJsKoqKEA
 i+QdwjG5hh4Ap6x7AIYu025Ap0ymm2A0TSLSZsEZt+6gHowQzWrUhCRfQgb9CSxI95yl/D9wUcf
 +MzVGum++wgQh1H7RVygxQpAuWhC/V5r4Kcj9EF4+wZFHbu5halpwZGUO0fIoMCCluxtX2lHjfN
 cvPvmBUxXLtnQQer6BdKTaZR7wzHB1oTL19VfLD7Cr1aeYGIsLfeEV7ysyfz+rIriO85WwGJCeZ
 +sMpJuPP/X7EYnR07G8j7N3vWVRyNn5iXngxxbLFnhOH/T6NSib
X-Received: by 2002:a05:6000:2f85:b0:441:1d53:cd9e with SMTP id
 ffacd0b85a97d-4493faf7702mr3049961f8f.37.1777541898314; 
 Thu, 30 Apr 2026 02:38:18 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-447b421721fsm10816795f8f.15.2026.04.30.02.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2026 02:38:17 -0700 (PDT)
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
Subject: [PATCH v2 05/25] target/sparc: Make get_phys_page_debug handle
 non-page-aligned addrs
Date: Thu, 30 Apr 2026 10:37:50 +0100
Message-ID: <20260430093810.2762539-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430093810.2762539-1-peter.maydell@linaro.org>
References: <20260430093810.2762539-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

The sparc TLB lookup code can handle non-aligned input addresses but
will return page-aligned results.  Rather than attempting to change
the internals of the lookup code, we take the simple approach of
ORing the page offset back into the phys_addr result.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20260417173105.1648172-5-peter.maydell@linaro.org
---
 target/sparc/mmu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index a6f76a1ab7..25f8a85fae 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -913,7 +913,7 @@ hwaddr sparc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
             return -1;
         }
     }
-    return phys_addr;
+    return phys_addr | (addr & ~TARGET_PAGE_MASK);
 }
 
 G_NORETURN void sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
-- 
2.43.0


