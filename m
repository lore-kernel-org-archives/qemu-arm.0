Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37616F8DFF9
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 17:34:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDn2y-0007Fr-Us; Fri, 17 Apr 2026 13:32:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wDn2P-0006ko-7r
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 13:31:35 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wDn2L-00025S-5U
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 13:31:28 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-43cf8d550bdso875658f8f.0
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2026 10:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776447083; x=1777051883; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eHyMHLlx5igXR+yw1MChRiibsNdSLH75zIK4yP1cYmM=;
 b=f7eWhYaL58Mnvl++MAJq/aeAT7dimrHLdd609H2Va3sNYb6+8ssYAmRUcE6wao6uaj
 muXd5M90sUF7lLPlOD17Z9FnpZgOz/r1ubqqjPBtB6qO6OdkpGHu72wtngYgdEEUxKLm
 XmaePfYy2Nud7fQbTBaL7Tpl9QQuMjROt42dfBwIPiz3dHLLZTosGFAqM5MeCQqQ/fgm
 68yy1yislmxItWdjf2xtMdTcwjPSLWIQZrT6bjkxaxW3vuVq4jDByNro/Ao4bTkVWEHJ
 wemPOAFtgXr0YEWlhW+6lEBwTiEuHa/GYeIobk3yClsRnxdMs4Evc9MnyFiiiEsam7nz
 nEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776447083; x=1777051883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eHyMHLlx5igXR+yw1MChRiibsNdSLH75zIK4yP1cYmM=;
 b=fikgx6J4mbEb2FxgAj9x6IL2RbtAkTZO+SHQdXlA1ZchdW3B77iKb5mbIdfyguODbK
 pAuUzHfdS09AUSrlbQMxLv6dAJIk0M89Y7AdLNz0e/IyRHQKvXe2F16CwhsY3tQ3nGqk
 fXtL3TY/xYFRY7zQw93XbCCTNAHkj6D8DkFXgMqHA22IFcpLjD3Qo09eQ6KDtBrI4Wsk
 LHHwsivRQK0slSTof0babqO6hbJApVipjwPC+IAmkxD0qxNt8NxD0qJgvqcl7B2wEe3c
 D+5beJolKSoiHkUjOfc6nrkFyNBnTsXKk3o+oeSRZSUDbhuSaVjl7nOuqrWJmlqff2C3
 ZLtw==
X-Gm-Message-State: AOJu0Yz91lzEymDjSB6X1Jng9R4i7OYBeAaX5L6Px2I0CauzezHnJFRg
 KX6nSPeWhyNMrRfgkxi0F7QC2j5VZOgKrEQQlkd2bH1vMY8gM/P4LxhpUga+W7NmbD/J/oveG/o
 RlSIGnfQ=
X-Gm-Gg: AeBDievFgS3E9BBHlD9/j07MNFbvo46GSqCKyNPiVXhB6eSnPgFtowJ7jDg9IEF0W+c
 +6h1KqZEpDfapZd7xm3Fkp8tdO1Xufxi9HhUnMEJsXUX7vpzPvb75ck49P2DhmFzOAieQ9IwNcD
 4QxciwDksY3I2IWVJa244QLRd3EhiKCgXv0Qt8ES+kG0ekzQkDnJIft9CJ7hFffXzeFYMXK+PTd
 X0jYWU4gwtphnhIAF8tIAPeBXO2RV95eyJrP6rR+FaZ46M8d/gPLub0ZcXiyW/uBF5C/BQB336y
 mQJKv854xApG/HEiKS+NhQsIfOTLunnv0l9Ec3ptFzIjbjMuwH8TApuEeBO0ItozDsi+bGZPpUr
 ZfYX0LeKPqZiuSaQTiJomuBIMiuj5Z3Xo2AlGQobV75EfRAOkFcqX78NiKIXlWfAHFGS5hC0nET
 eP8QY2K3H2TkTlPjP3EcXKZI89+AlLcLezd8p/3PFzpTkbgDdFRgUtKTJaQVPRsTyoHb3LX5A/s
 aZKYRborg9jL2pQGqMdSCmx3OCzPvMlu9kkf9ChRw==
X-Received: by 2002:a05:6000:186c:b0:43e:a703:3665 with SMTP id
 ffacd0b85a97d-43fe3e0c6femr5984589f8f.25.1776447083356; 
 Fri, 17 Apr 2026 10:31:23 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e4ffa8sm5819650f8f.35.2026.04.17.10.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 10:31:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
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
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH 07/17] target/ppc: Make get_phys_page_debug handle
 non-page-aligned addrs
Date: Fri, 17 Apr 2026 18:30:55 +0100
Message-ID: <20260417173105.1648172-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417173105.1648172-1-peter.maydell@linaro.org>
References: <20260417173105.1648172-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

The ppc_xlate() function can accept a non-page-aligned input but may
return a page-aligned output; we take the simple approach of ORing
the page offset back into the result address after calling it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/ppc/mmu_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
index 52d48615ac..a1345df716 100644
--- a/target/ppc/mmu_common.c
+++ b/target/ppc/mmu_common.c
@@ -863,7 +863,7 @@ hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
                   ppc_env_mmu_index(&cpu->env, false), false) ||
         ppc_xlate(cpu, addr, MMU_INST_FETCH, &raddr, &s, &p,
                   ppc_env_mmu_index(&cpu->env, true), false)) {
-        return raddr & TARGET_PAGE_MASK;
+        return raddr | (addr & ~TARGET_PAGE_MASK);
     }
     return -1;
 }
-- 
2.43.0


