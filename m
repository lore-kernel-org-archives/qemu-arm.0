Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8739BF8E49F
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 17:33:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDn30-0007Hl-Fv; Fri, 17 Apr 2026 13:32:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wDn2G-0006jJ-7w
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 13:31:32 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wDn2B-00022T-RI
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 13:31:18 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso9188415e9.3
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2026 10:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776447074; x=1777051874; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hx5mHEmjy/ymmHAzveA8k8qKhyafNUszJu+T9FqcJ2Y=;
 b=YxSLEa8uLrDJwTC2Z8nRRE73iiel+uwGajoxFbH8/Kw+xR4cqh4e7QOULhL99LSHwh
 rjPVl0fpQLgH847AkZ4pPzx6iM54cISDori1VqnBfBw05E4pvx6VzzVVERkDfTvK4Bj7
 bxF4EJTKAoVPkCFhVntCeKO8Vd2ySDyH3D2WhnODX+ZMguuueTVNFs7Im17VdfTxjaiE
 P/g1ckVzPlZrb5eheNvRyIIu6nIH8TimE5LxKnk5lln5D2u7qPcKJxjmehTnv4+s4TTs
 IRvS9GKIOeEqtUH9DT5MD4O3HPKpfPLU9wvXAbjHq9otXMiekvtHQ6mST83ZiquC5fkw
 UAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776447074; x=1777051874;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hx5mHEmjy/ymmHAzveA8k8qKhyafNUszJu+T9FqcJ2Y=;
 b=HqqzFoLG/ttKlTyYieADI1DJpIegdUP4VH9HCPLmtUSOL+8vgT+N1sWfQR136BkGDh
 Ga6440fyuSriTxf/UbL1ePXXF2SivycxcZArjbiuG9kC6o0OdgIEZNXmGJNU/iwuU4mQ
 XEhY05LyfMZaspiunPyaopCfiCcgWwTOgTEw0p1Y+XM6GnLIibMjdLTttZsxkRtH2FQj
 63GeUfGpeXuiRMWIdL4Lb2TdW8L1++W8Lltr1v9+93iewBQ/5ZMi1YKyzKpt5eHLODPT
 R/as8jbZrH9M9glWiYdRihwpLQlEw3Ak5EU9HWpnKiD32MIdlksQLQHOGcmbftxCmJym
 jRxw==
X-Gm-Message-State: AOJu0YxxtyE1jl+PptYVssmuItiahqLfMuIEsmk/LBdAX15guiMB5Dls
 bWjbeV4f+b7oFmpvkjtiXaRSscf8KXXoIAHDOQOC1oSzUdDSRzbgX062h1SUkj/V20xAAbnW/Qz
 SiqodWFg=
X-Gm-Gg: AeBDievz0p0laUMqEihT+x8S8IlyrHILIg4SVdDIA2zaKvGWxgA4af+HxBh/E67mcua
 pak3PHoKbhYko2K229aJfgGp+vzGdVStHpHmYwKRIWubW0Ea3qMKcar4VllXcAjTfSRPqGny4RY
 ryUCQBJ/Y83bzUQKSt4amnm67SMyfbI4kXfKZOp5RB2638K7hpNIit1CHQNInPmLtazx0+oUOrf
 4MXaa4mfnwdUdL+JIkFq6M9t+5ILFeiAII7s0dflx81A1h7sRKFlSHDzKL+MKoxBfHTpidOd1xJ
 MRa2fq3d5Wa8poCKKDjvyCfELqMHblz7AIq3IhyBe0xik+j3OVPVON8EXH6K6PwJBu6P9PFIWTR
 +TGramQ2QCVkR7c6iWtBYchp2UIHylHUBjkl618juOrxvFhST5olqB0iiRGkcomMA97ml2MKsks
 138rP6oDO1cdgDNYZh3j4I2IxEeP56MYi6iIBDfEyh2UiqhLWKOjdY2d08aFTP+YhsHFkeI5gFS
 4KSzj5K2hUw+Kcl5QjQK3b4Bfn3lnsD9uMltTAuJFGgcLdj5Vtq
X-Received: by 2002:a05:600c:888b:b0:485:4bd1:4c64 with SMTP id
 5b1f17b1804b1-488fb796f95mr43537165e9.31.1776447074179; 
 Fri, 17 Apr 2026 10:31:14 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e4ffa8sm5819650f8f.35.2026.04.17.10.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 10:31:13 -0700 (PDT)
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
Subject: [PATCH 04/17] target/sparc: Make get_phys_page_debug handle
 non-page-aligned addrs
Date: Fri, 17 Apr 2026 18:30:52 +0100
Message-ID: <20260417173105.1648172-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417173105.1648172-1-peter.maydell@linaro.org>
References: <20260417173105.1648172-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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


