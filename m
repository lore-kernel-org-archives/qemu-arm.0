Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE65CFF8875
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 09:44:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wINrC-0005Cm-Oy; Thu, 30 Apr 2026 05:38:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wINr0-0004ps-J2
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 05:38:42 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wINqn-0002ZQ-EC
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 05:38:42 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-43cfd832155so452522f8f.1
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 02:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777541908; x=1778146708; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AI7nq+06MysQl4C2bToWwnO/0PNTAhpGl0/yIqXSqvo=;
 b=Bs3QqhPaCD7mR7Xqjf/p6sZumpLIX+6gBAyoBrqx9LXyJJR9ghlZwdyp5pcsEzYQTK
 TQA3KUi1YVo9oYd+f2m7yLV2nE+9ORGafHP1odyp7y9Td+guN0ZG6wzsvyQwLRlReozo
 kYBP1aIwLr5vstbuh4wpjYQmrWbdOYtm030CM0a2bkGgue7Yy1o6wyXjWV1uUNp77IuW
 1NTi2m/VM4mIPLLfRLdbzQw9sKWHhlrhjeAb4K9pfvRWvXG0rHs3jImP94czV0duvl1z
 qX10EDuGLPvGRP9Ql7NtkWRysfrvFuyiLlKBVYKZFo/gH8VqLNKQnrKoQ2sokZ2hhjh3
 p2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777541908; x=1778146708;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AI7nq+06MysQl4C2bToWwnO/0PNTAhpGl0/yIqXSqvo=;
 b=QzGwIk56uV8GgdFsHsbf/IndKtm/3WqrBaxE6WtOJ7ckqAXfdDrnmGCZkIv9Z44f6j
 QewibONozItKjtbZYpETnvJriMq4QHYxlBt2xjKuEOqV1WQXZA6h4y6+kIt5ipxQG9dU
 jSghP7dIezdBbFlQO7l4lAnpssnH9EEeM8RMFAWgtdV8eIQkaSKr/dD8cXJZ2ivy9mDC
 jyIcUP9Gb4YoPUBqQqlDUTar/THruFCpNUpgNw7lTGZ8SHGjCPDv/8XTtFYiUgWFQiaa
 aYHADzulvoL6Ijbp2kHZRbsSOUpDk6FRxghM6ypMqQPzpvOaAIYQulX9dUItWy2aOUoI
 JGdg==
X-Gm-Message-State: AOJu0YxccUXFMVt+IWxn6HI7i+2g9UJZID2/LreTKIfA6pHrkb28e0mx
 LC+z2Lhgec+yU3XSOqK1G9YR9RilI5X4YaQTf8UBw79keA1EElMs5n62QDu/fnzjkkg=
X-Gm-Gg: AeBDieucna2EgRX8K+IeAIcRhxBZI24OhiTxOtGRsnKWDjRG5dJPwFxNp9/S3ItIMgq
 GkOgEs+G/uh0F9omr7oVdVYDY0IGQJHg6q6Nn0J/8XqlOKms6HbwbQXRdcaCuhLcLIhUDv09B7T
 Qi4gfeyRr6U9e/MSgoN9VkqFaGWS7/fAmqXKMom14D0nGOTZMvD6tOaa69B/QnoFuQezoicBL1A
 iEroeBOP0BR86TZIBFqVtzlw4nF/xlQaZkXRL/qqZ4yTrJgi5rymW2IC+kuRP11sc5EMuwy/POu
 0XkpLaOphp9MNRLu2DfbNkqh0Ktnwr7r8qvHZgCuPw+q3+5V/MhklgZtcy/3XC7erG2lMiqO5nX
 53yyEFS2eIfjOX8CPJKloIKNlSuTKUw//xI5XVwPC4XigQTdDhcH6u2yvp56MfbExrD1DA4wbdT
 n7HYq882vTbb4NnWLSxfuj5UK1UbYbX+FfLQtbcHMjitNY5+XDgsrjBtBB8jubTniniEUp75efb
 hHa8j07j0kAHrOWZVZI4uo7+xTzcpsSN8DviKJBBA==
X-Received: by 2002:adf:e690:0:b0:449:6a23:dd1f with SMTP id
 ffacd0b85a97d-4496a23dd94mr1720147f8f.15.1777541907803; 
 Thu, 30 Apr 2026 02:38:27 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-447b421721fsm10816795f8f.15.2026.04.30.02.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2026 02:38:27 -0700 (PDT)
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
Subject: [PATCH v2 12/25] target/arm: Rename arm_cpu_get_phys_page()
Date: Thu, 30 Apr 2026 10:37:57 +0100
Message-ID: <20260430093810.2762539-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430093810.2762539-1-peter.maydell@linaro.org>
References: <20260430093810.2762539-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

The internal helper function arm_cpu_get_phys_page() is named that
way because of its use in the get_phys_page_attrs_debug method.  Now
we've renamed the method, rename the helper to match, since it can
handle non-page-aligned addresses.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20260417173105.1648172-12-peter.maydell@linaro.org
---
 target/arm/ptw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index f5f624c7c3..8be6f243e6 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3922,7 +3922,7 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
                              memop, result, fi);
 }
 
-static hwaddr arm_cpu_get_phys_page(CPUARMState *env, vaddr addr,
+static hwaddr arm_cpu_get_phys_addr(CPUARMState *env, vaddr addr,
                                     MemTxAttrs *attrs, ARMMMUIdx mmu_idx)
 {
     S1Translate ptw = {
@@ -3950,7 +3950,7 @@ hwaddr arm_cpu_get_phys_addr_attrs_debug(CPUState *cs, vaddr addr,
     CPUARMState *env = &cpu->env;
     ARMMMUIdx mmu_idx = arm_mmu_idx(env);
 
-    hwaddr res = arm_cpu_get_phys_page(env, addr, attrs, mmu_idx);
+    hwaddr res = arm_cpu_get_phys_addr(env, addr, attrs, mmu_idx);
 
     if (res != -1) {
         return res;
@@ -3964,10 +3964,10 @@ hwaddr arm_cpu_get_phys_addr_attrs_debug(CPUState *cs, vaddr addr,
     switch (mmu_idx) {
     case ARMMMUIdx_E10_1:
     case ARMMMUIdx_E10_1_PAN:
-        return arm_cpu_get_phys_page(env, addr, attrs, ARMMMUIdx_E10_0);
+        return arm_cpu_get_phys_addr(env, addr, attrs, ARMMMUIdx_E10_0);
     case ARMMMUIdx_E20_2:
     case ARMMMUIdx_E20_2_PAN:
-        return arm_cpu_get_phys_page(env, addr, attrs, ARMMMUIdx_E20_0);
+        return arm_cpu_get_phys_addr(env, addr, attrs, ARMMMUIdx_E20_0);
     default:
         return -1;
     }
-- 
2.43.0


