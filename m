Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5FCFF8875
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 09:46:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wINrI-0005Rx-Mc; Thu, 30 Apr 2026 05:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wINrC-0005BZ-2o
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 05:38:54 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wINqy-0002mT-8S
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 05:38:53 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43d76dd4ee8so575071f8f.2
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 02:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777541918; x=1778146718; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WDQ7la2K8WbK8u2/23ch5pBkMkaDcwKmzot+lA8IzKQ=;
 b=pdNILHMJZ7QVh0cmQ6Y6dadwjvmv63QU75CS7bYaPTq8IkSxG9BxEg93lhFBL7+0mh
 zGa8XhGMK+TbUcPplaSDcxOjQ3qt4ENXLid7WNgb8FeHulS9+1jj8jBo+owRLU8xHLtV
 GKDVN8pF847wC5Y1nE9vNuDR8tqgNgAfmgKqpuOcJhlsEiGDozPwlQvTo/+jY0hOOWgd
 r66FXpy5Aw3y3E4+M2dSNCO+03hLUdljAHNYrvD7CsOJrD3ndhnK8289YdWyhBgtXI5u
 CYX4YPkLLzIEcKz5PoEOUqgW6nU/Mx5OYEgzVXBxxcL5qZC17y4g0dEtSprjY2vZKogo
 GEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777541918; x=1778146718;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WDQ7la2K8WbK8u2/23ch5pBkMkaDcwKmzot+lA8IzKQ=;
 b=KMc3n6Kmhqy4ykaC+sXBTYgJQpLOY5g8kvwHtFbX1RDCNne0O3knDh10SQ7bRolESj
 Z4iYyIQaoycJrDi4JIQq5/1yVAF6rK/SERNFNr45QoCkiig6mHueLOZC1FJWRypisA8R
 NwP7SetDPhjlrBVvQXjXsGoJauwLQuKLGWTMzbK8DrUefyoMsvSSyjx9Q6v889u3WGVp
 7NnWw8KJBMGp+oHchsyPcvaoYC977GH+b7YdtH8da8pfOF9T1WaC5ektCMe++/yMXFtK
 mYG2i6HQh9fjE6E+yzGxTmDiF5XQachPIPeLQZd9SgFUCta0kXbRCVB3+skCdXv1DXCS
 66sw==
X-Gm-Message-State: AOJu0YyJHS2PCy3xtBBiuSXo0RpfZ71R90JXCpbICJXevRwNd8B8syj2
 92NN9/YIhGnIjaSJV5pX0d4c2u4MNUoA6QBrjb5pY6st3MqGri1gD8cWHCnW8EbqFCfoeP84Wqu
 ++QFe
X-Gm-Gg: AeBDieuLPkOPAWfty3qoIqXMCVij+V2zBizi8mrNEj5+t13ChLS6EsbbhkRNw+3P+xo
 FsTrj44Ds4RSjjaYL1P+IQoZBbyslcdaHqS6RgK7XDfssay/LGpPkXhtze2xancH728EsJepgxY
 +tEGgTKDk0AbYdHjSKxpzd4QrLMQFiTwzydDtukCmSagIitrVehigZuL2dh6yVp6/eSjewqixyi
 LheN19hJ8XA1aHuomtihoPpT2cPERN9L0nkf60kb6DnJRwEc43c07ir1ufzk5fcAaFTOI+gl/v8
 sL2fi6+qJtv8eamkwuXYWYokAZQ7XFtsPyGvfy/2vkYWMGLgA2h4SghLfdz/ApwIeJsjqwTd4cx
 MylWWhdsoxRe1/xaLip8JQ3Yt2XGNu8R5+tAx5SJRgPUaAYaigadNANh6q0PogWIF2Iv8rk10qm
 AMcduXVZZ6behn2jGfxtYhPnzRS34vA0UNIXvqjRoCyI/JOVDt6mpJ85XnBjISifUJ/R3bj+asT
 OPdRgOEHBCGmJdKu+G7nRnFvUVptgrSjHzbcawbbA==
X-Received: by 2002:a05:6000:2585:b0:43b:498f:dceb with SMTP id
 ffacd0b85a97d-4493c37ef0cmr3506822f8f.9.1777541917911; 
 Thu, 30 Apr 2026 02:38:37 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-447b421721fsm10816795f8f.15.2026.04.30.02.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2026 02:38:37 -0700 (PDT)
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
Subject: [PATCH v2 20/25] target/sparc: Use cpu_translate_for_debug()
Date: Thu, 30 Apr 2026 10:38:05 +0100
Message-ID: <20260430093810.2762539-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430093810.2762539-1-peter.maydell@linaro.org>
References: <20260430093810.2762539-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

We want to remove the cpu_get_phys_addr_debug() function; update the
sparc dump_mmu() function to use cpu_translate_for_debug() instead.

The "mmu_probe succeeds but debug translate fails" cases are probably
not possible in practice; since cpu_get_phys_addr_debug() would
return -1 in that situation we make this conversion retain that
behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/sparc/mmu_helper.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index e1abd520c4..e441ffb8f7 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -360,26 +360,39 @@ void dump_mmu(CPUSPARCState *env)
     unsigned int n, m, o;
     hwaddr pa;
     uint32_t pde;
+    TranslateForDebugResult tres;
 
     qemu_printf("Root ptr: " HWADDR_FMT_plx ", ctx: %d\n",
                 (hwaddr)env->mmuregs[1] << 4, env->mmuregs[2]);
     for (n = 0, va = 0; n < 256; n++, va += 16 * 1024 * 1024) {
         pde = mmu_probe(env, va, 2);
         if (pde) {
-            pa = cpu_get_phys_addr_debug(cs, va);
+            if (!cpu_translate_for_debug(cs, va, &tres)) {
+                pa = -1;
+            } else {
+                pa = tres.physaddr;
+            }
             qemu_printf("VA: " TARGET_FMT_lx ", PA: " HWADDR_FMT_plx
                         " PDE: " TARGET_FMT_lx "\n", va, pa, pde);
             for (m = 0, va1 = va; m < 64; m++, va1 += 256 * 1024) {
                 pde = mmu_probe(env, va1, 1);
                 if (pde) {
-                    pa = cpu_get_phys_addr_debug(cs, va1);
+                    if (!cpu_translate_for_debug(cs, va1, &tres)) {
+                        pa = -1;
+                    } else {
+                        pa = tres.physaddr;
+                    }
                     qemu_printf(" VA: " TARGET_FMT_lx ", PA: "
                                 HWADDR_FMT_plx " PDE: " TARGET_FMT_lx "\n",
                                 va1, pa, pde);
                     for (o = 0, va2 = va1; o < 64; o++, va2 += 4 * 1024) {
                         pde = mmu_probe(env, va2, 0);
                         if (pde) {
-                            pa = cpu_get_phys_addr_debug(cs, va2);
+                            if (!cpu_translate_for_debug(cs, va2, &tres)) {
+                                pa = -1;
+                            } else {
+                                pa = tres.physaddr;
+                            }
                             qemu_printf("  VA: " TARGET_FMT_lx ", PA: "
                                         HWADDR_FMT_plx " PTE: "
                                         TARGET_FMT_lx "\n",
-- 
2.43.0


