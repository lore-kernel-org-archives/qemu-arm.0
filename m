Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0320AFF8875
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 09:43:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wINr2-0004ul-Jq; Thu, 30 Apr 2026 05:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wINql-0004cO-Uj
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 05:38:28 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wINqi-0002W6-8g
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 05:38:27 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-43d77f6092eso438624f8f.2
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 02:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777541902; x=1778146702; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MY7hfUPLGJ8oz6CMVQMMmJ8m7WR8XRXo8hMX7o/HlFQ=;
 b=tKEkum9QimQVYzY1ThGrCRNAIavfKnifNx/EqcA4I4522+3XVmkDhCPE9aH9wxHIrb
 8afbHTm0lddR/xRpJQnGhthgrqIyIGZkCXG/vyXNU0FpiWDo6I8YmwJ7XlBGKLpr3JQC
 wlzDdxGYDBpXykjHByTmNu+924PRIyKCbxnauGAj6iKMWGJrM7zmHs7C7E0hA7/ucKBu
 D0aRFIlXGmNgxGSO/1K4CBXgX2AmFlv1cbvfzAap9619Fyxam6/KmNKqTJsscs3o4sgJ
 m9fCBwojC3zKEePscOVckKSBpn6sa4cMpnqXtBht6xWfgewj5kTFyptvenKU89gAZgsm
 Kojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777541902; x=1778146702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MY7hfUPLGJ8oz6CMVQMMmJ8m7WR8XRXo8hMX7o/HlFQ=;
 b=lyOt84SxsvzfR6ie1nQEQ50Eu6SuD3x50ZA4Ap5AmjwdXxkvVL3ZOv+X+VbMuj4V+b
 fHSlkpqOOc/AhL4E795GeQu36XThzmdYyyUrkfDZh52J1YV+DL0YYy2xQp8qdFNJj9ld
 3NMQf2hfwMYRssf1wRwAyTwEWhDOsMx+p6XyYnSdQD6iQVBFadnESwGsk5+f++DuodlM
 ornd135nVVkCjeiOQTPR8IY31X4Ef2H1fd2xwrr6mowbrLgZGrtXDm+BAOxES0TV6wEH
 Iou3GwZ/dvyswFfye7068rLfy9XBiuShbV4TinD3pWH2Jc1kP11V4QJWdv7NIEcKMlDW
 afpA==
X-Gm-Message-State: AOJu0YxugokbW3xf3urAu4RmfAH2mxyyqCrGORoOZ8veD+lB/UhYuMXW
 e+Oyywb6llx24UFFBBDLQDsG59cgnvgZO70rA49aJ2aYzp9MBChVbOKSFHmU7LbAUTU=
X-Gm-Gg: AeBDieurluKGHAj/j34NZZPUemzcu72zsLW6tM42nSy8FJmTIBc1qhdGqMqzQ00ZIzY
 224b5isgI5bM499QyKqkn0dJj7h+A1MB2oclyj6QybMSYpcA25lCYJ/isll3v0MP0JEp+z/l0mP
 P0eZo8jTNKnq7QaAe5BPWlOAtHEtba5kdXdIqYtmhyXonRj2jWzeFQmUw9yVxK5e3nBq2f+5DZn
 90qlFhToQc50QUMfJbwU48TuiDZ98HM2tAn68s+wRuHJ1TeaFmkhxvnYSfBZ7/f/bUkkMcxfdur
 3SQe6DVXyFIsFJ8IFdmqcuSEiLUyI0WUGDr6702qtzqbAx2OgBBLobsIWop8QPoWJrRF4RubDn8
 C/9dSnsHtowL/pNOLaeZkR65hdgCxcDvhcHTRerX16SNFPs+SFMfai+nSgPDiOwf3t0SeFEjFet
 ENCHInekRtINctL8EMU4ZodNxPo+0OF8+cc3i8i+wBUzdggbFvKXTV2OM9chnAJaUBMqLycVGzU
 1fyGtjXJcuMx8AfSexU6C24zPvIOKEL9O3Bwi/Itw==
X-Received: by 2002:a05:6000:25c1:b0:43d:7e11:1b72 with SMTP id
 ffacd0b85a97d-4493d7f9ea1mr3315847f8f.9.1777541902024; 
 Thu, 30 Apr 2026 02:38:22 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-447b421721fsm10816795f8f.15.2026.04.30.02.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2026 02:38:21 -0700 (PDT)
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
Subject: [PATCH v2 08/25] target/ppc: Make get_phys_page_debug handle
 non-page-aligned addrs
Date: Thu, 30 Apr 2026 10:37:53 +0100
Message-ID: <20260430093810.2762539-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430093810.2762539-1-peter.maydell@linaro.org>
References: <20260430093810.2762539-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

The ppc_xlate() function can accept a non-page-aligned input but may
return a page-aligned output; we take the simple approach of ORing
the page offset back into the result address after calling it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20260417173105.1648172-8-peter.maydell@linaro.org
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


