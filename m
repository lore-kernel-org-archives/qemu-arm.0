Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF2DFF886F
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 09:43:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wINrN-0005dP-KZ; Thu, 30 Apr 2026 05:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wINrH-0005Ov-FM
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 05:38:59 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wINr3-0002rB-V2
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 05:38:59 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43d6fbd0954so548424f8f.1
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 02:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777541923; x=1778146723; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W5r6sY4D7K54zH8grS/of9kRgg+UMxxamJYZ/28n8x8=;
 b=TsVL3RTWcEeeUZpcs82Ih0fsXtmNBmMMROZvE4P94Fm532pjX7EiTWHxOZCcD/Qe72
 qxHptBcxBHWssPJhNdxmCBD5ya3N0RsHZE1e/oXsyUFFmdpX+MNC/TA1Cs8wJEyqVNZu
 8sFaY0quLM6N98jZm5AsuJYX2+3U/CRURN9ZilP7c0yBbqE9WtJteAF61A0ifhSJyvl+
 PRuAXFfetpV11UR7elXhJ7km5Xc8/wdcKrCN7EesapcLP+iWmvVnnYDyXy0o4LbnJjTy
 W2Cr7s8KzpRg5QZxU5XvdnepgksGXG7iKXqimQ6ziz1tXOBsOVC8k55zohVGovgqvgXt
 x8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777541923; x=1778146723;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=W5r6sY4D7K54zH8grS/of9kRgg+UMxxamJYZ/28n8x8=;
 b=IqKYgGQikg5tkY+3+MmsSzI9NfYnFhHtYUjUt9wS2c63oxQ6k0JP+NuXsWbu/1Cqms
 JxSFaLZ74Otll3dla576o7O6aWf7SZPGyg0c5LaWkAjljtu9crrS8NjVp2BlS3O0MYGz
 BEeuFf7tSePA9ogetDCTak1PYKdFL6MyVxmH/cCJMOsrcDXdugUFTHAdguYfQlOIIHFW
 5lcnX4szx9ZnGHKjVzyXiGOpm47Qikm0hmLrOeWGWnNR/Dpu2owJyg6oYnBww1UAibj2
 y+GQ3JDCU+FBtGa1v9P4klL4OazGMyY+ZpCHH9+NmLjntb/kPkLvUCuMJpo1SEv83iki
 8flA==
X-Gm-Message-State: AOJu0YxHAogUEpz2pAQRW4UQycekV5S20rC1JuKXAogKMwr6en4X2nyr
 DA7wouw87D1ghHrm6d2NeJPgu9RNKduZ1gVCEKBBsX+p6RjDDkaT8QabiXgsXWhTAxw=
X-Gm-Gg: AeBDieufTuYvu4Vws7ieMtU+aR/XBA54u6jtg2yKMkwd3BW6ISFeXzweuJyagMRAB+D
 XWaKERLlizCwDMN27dZUTlFYfaiGu/9Qj2IZMi073NBQzuItpFgflPraNFciod+J69m5kkqdlvE
 WqQiw87t7HC3gtIF8fb9+7K4d3z9+e2m4Zgf/5Nlt1PEg/BNQ06cAm6H3w+rRPbI9v7QyVKukSw
 dbmt4AYty2unTF5KymLburEa1vb0Lx3bjfZlbG9GRooAZGnwrXksdz+0TjY3te8MEjAdhk8FVWL
 Ti+zhRgz8DsGUWR2W1c2UbPWnN7hH/eq6mbo334VJSgHzQXj7JP+63E4uGSfmpK2XlUIAbIB7AR
 KWP1x/JcQJ4pw9bIR2wf6KvnIGidtwlUvpPiZeMTSSyYdEotpiW0h9dFSH79Yqhsixkcy12DBNk
 ybjgEPmUoGtYXH8oUk6H2CqOjaKGp9BzsKARd1kqMannCo1cxzrv4yykMT0UmuHr3jFKXqX2ZPy
 2JyBS9MOIlWRZrlMfpjLA9YrCyYnypdOIWZOYHyeg8QZDVh3kTu
X-Received: by 2002:a5d:438e:0:b0:449:9aee:4575 with SMTP id
 ffacd0b85a97d-4499aee464emr1142625f8f.30.1777541923127; 
 Thu, 30 Apr 2026 02:38:43 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-447b421721fsm10816795f8f.15.2026.04.30.02.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2026 02:38:42 -0700 (PDT)
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
Subject: [PATCH v2 24/25] plugins/api.c: Use cpu_translate_for_debug()
Date: Thu, 30 Apr 2026 10:38:09 +0100
Message-ID: <20260430093810.2762539-25-peter.maydell@linaro.org>
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

We want to remove the cpu_get_phys_addr_debug() function; update the
plugin code to use cpu_translate_for_debug() instead.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 plugins/api.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/plugins/api.c b/plugins/api.c
index c97cc68882..2d5fe9327f 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -617,15 +617,15 @@ qemu_plugin_write_memory_hwaddr(hwaddr addr, GByteArray *data)
 bool qemu_plugin_translate_vaddr(uint64_t vaddr, uint64_t *hwaddr)
 {
 #ifdef CONFIG_SOFTMMU
+    TranslateForDebugResult tres;
+
     g_assert(current_cpu);
 
-    uint64_t res = cpu_get_phys_addr_debug(current_cpu, vaddr);
-
-    if (res == (uint64_t)-1) {
+    if (!cpu_translate_for_debug(current_cpu, vaddr, &tres)) {
         return false;
     }
 
-    *hwaddr = res;
+    *hwaddr = tres.physaddr;
 
     return true;
 #else
-- 
2.43.0


