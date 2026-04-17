Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3150F436BF
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 17:32:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDn2s-000732-IN; Fri, 17 Apr 2026 13:31:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wDn2B-0006iu-N2
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 13:31:30 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wDn27-00020Q-8N
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 13:31:15 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-43d01d6b50cso949705f8f.1
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2026 10:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776447070; x=1777051870; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EmOVB5IZY29iVKWcgfaipTD5+/SR627N344UoUCnzG0=;
 b=azfnU0aXN70ysqfyU80GuL3fTfOuOK1XaWrCc2LiI4Nklvp7PU+amYjSWcyCSk/kN9
 TFEFhv0Qunqi576v0nARKgb7ittiZE4x2JKCzUzBLxD2EuxXjQvcuFXw5TZl9/Dg9ggX
 4NI+asxUMd0n4pNe3TShPmCjlLlvAH+4IbeK70b5QKhr2GeUC/cUNHJIw/yj3CLnx6Ag
 Vc80x9hs5B18tngbNAF+xU8N5ID8NqxvWev0Mg0sbmACJzM0StI3R5ZcjL6Yml/FqMEn
 LXN9hnFve88N6oVW7KYvm1ZAWx0dz9AnYWTqj/wcPFd5xTujzK3NHPqdW9sRQ0w4FgOK
 82tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776447070; x=1777051870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EmOVB5IZY29iVKWcgfaipTD5+/SR627N344UoUCnzG0=;
 b=RivY9qRh516Vv4CtKhxJBPJGZzGG0XfRYxrVFEXNyc4oIAze2eu5Hv6g1EvhrkyzGR
 1rpHcaTadwKJILipNpOcFLKFzqUikjgkQjxeUACu75a99/yWvviro41VyuD0xBXoFDJH
 8vM3mgA0V9beao5IUQRMkjgBRytOyZuWNGFqxCBwnDVibwK2fvzq3KgrLMUpq4pM2NU7
 G0WF0dj6OIhNWxdmf+W6DKCd5DcPLevmRFK/cLAMio99qgrtjBJ3r0DfBE6Ej+27eS0Z
 94navVoBR8FzDjSOViwyuQFJdFF3l6oII1SdYkvkqlNTponv0j4bYhaj50buzgrHsBFh
 sa4w==
X-Gm-Message-State: AOJu0Yzk+bJCfxZMK6gjQE1aR1K+3eAb60D76LTi7NF6d6guGhZZFSBB
 ZHbAnb9cft4/MLXb8AzjLYWUQ6HGStQuRWzIbGXZsqowuRtrsbmCfk3oRkYmn8zdgObWb7HivZh
 QohDhBQQ=
X-Gm-Gg: AeBDietcV1j/Y99zlNXjzxwdU5lEM6zYmJQ3JH8V7Lhv+E3hJIiJUGRSFv6km3hkDq9
 eGNeR1DN4byqYPyx4mSzY/WBYIj5YV066pLtib2rPP47QTqEEPQaDUsob1j8ILJSBW5ZuDNnnWm
 T2u00lZz6iTLu1FMMTUaaCJFYVAygxkjDIcjphkCctrxWMIFT/Sokkp/F0xPFWO7w+HovbFb2WX
 XF5RKyl2ngyTQDoLsxPSjGiMUjT+hDRVrKTuH8LPHjBrVX3dewQFo9tBJTYkt19RuvaJKGKidn7
 /zM7mJaQurjaa13NrP6gNkivTMgU94sJmpGjBSvlkkEk/o1rubTOIS4qF62iV9xbjux39VLjXpv
 zxosUuBt9EAmrJfIFZBoHOi+nrv3PCNWxB+1PzduEH89WAv1pAm3OzYPa7aT6mK7KBzPxPqmyFA
 UJVSzFsEfLZ/087qj5JKRv67/7GwZEe6nPJbOjZbt30G8dyRUMELCWKuR9Vda5ImnYK+dT80ALV
 fkMhdS0WhoU2EegA6QZnoJL90X+mM9NSG23b7x5ZQ==
X-Received: by 2002:a05:6000:250f:b0:43d:1df7:ed24 with SMTP id
 ffacd0b85a97d-43fe3ddffffmr6124966f8f.21.1776447069526; 
 Fri, 17 Apr 2026 10:31:09 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e4ffa8sm5819650f8f.35.2026.04.17.10.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 10:31:08 -0700 (PDT)
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
Subject: [PATCH 01/17] target/riscv: Make get_phys_page_debug handle
 non-page-aligned addrs
Date: Fri, 17 Apr 2026 18:30:49 +0100
Message-ID: <20260417173105.1648172-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417173105.1648172-1-peter.maydell@linaro.org>
References: <20260417173105.1648172-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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


