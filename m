Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2892CFF886F
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 09:42:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wINrF-0005Kp-7j; Thu, 30 Apr 2026 05:38:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wINr4-0004xr-BX
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 05:38:47 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wINqq-0002bJ-80
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 05:38:45 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-43d73422431so625015f8f.2
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 02:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777541910; x=1778146710; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f0EYnWZKYPS/YsHeLRPLDp7EfXxXLD9+8hyam2As9ks=;
 b=JwG2lVF2tTRyRaCsoXst8LZPO90SmPevlgNqWD32+ouHOJ0SOKqDI3FW1KLKqLmle9
 VIG3nv1NzoW5Y2Ct7P0uKJl2Bt7UxeSuxewZrOWAZJKMWE4jZB+Bpu7shLioDiqmQvkD
 kXYACaj6/4dsqFGl501ZjleHNdIL7H4Ru97o6IcwjS4/n+mW7LVfFAWIglGsFRI98gU7
 FqXGD0J+dZP+WRTlUjsEahOddn1qd4aEhYT1BkQ27yCxWIVODovvYe5HjFtQvxLKXKzq
 N9OaypyEDyl4BDOR4HiFhKSkBfdcPH9ygfxERNwNlia+wMflwp2RMZ/7i6EWlt8EF0eB
 46Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777541910; x=1778146710;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=f0EYnWZKYPS/YsHeLRPLDp7EfXxXLD9+8hyam2As9ks=;
 b=f6fgdet+mtSlASIe2Ej/d+DE9I2iZm/qF3eHA8C9XsWSliInJusKY6qTmL3nGsHE4g
 jIDiHoJJRdmTq0/nzTv/kMKMFTo3Zp/HOsumyw4jKuBLkiVmUsbPrsbnWYjl0XHkfW2v
 WxKkLuQO2tD89+IQxCFvEzAeH8mOPHqSO0ciAn5ZRxace9RfEJF4XpOzrEKaTXq+xVAL
 D58oC5l5COvigsBzRyzmFXkrqU74WQ8QeL0W7nyP+N/TOBpMpm3XmHQ3vy1CaDbHx2/J
 /SkC01dldHaBP7PhuepgQLITOpwnlroB7I9orDZ+Bw58HJkQMmdRTWWJnXe331YLHuwO
 xqjw==
X-Gm-Message-State: AOJu0Yz2232/lEnNk/rg77szMVE7EthBqbDSzsCwAyWGApyML/mS4+qP
 EA/erjzopwkIeEtfdyofAvMbXJTbAdDSm4/0JN/AcPg/IxPEY3v1uWFUBc8/YSIKjiU=
X-Gm-Gg: AeBDievgGdzlTtssmks+UA5HqHZjsmVb7XbNXhVkks19H8K+bvA8qj1UmHrPLGLYUpV
 cLYpvgIkF8D8NP3wxPPA8VuWZzxQOIXazpKQwZK8eIhcyGlH5RF+FBn+DzOQcbwj3zp8ATdkmZO
 BFjIIeVltzERP/loFZo0Mk6wmgZWMfW7gzDQ8UW0Nva5+J9VDkBwJk5+s1pViJOZbp6RATq9JEh
 zbibGFK4k8E0l3pM3fTQ0hsD9B+RoIfvIwZjKWaXP8AIVtk+hXGhWEC8H1lX3eX8S7BG/JtQ2CP
 T8MJrs04wkDTvT7SdkFZmEp/c6lh67e/oTqPwBX7iQ5eGoza5DapmPLB1PGs9T2RaKhTLWKa9cm
 eGaJYQwm/dwLI012/D/bLb6tGM9hy/O3/i8niudB88WnSwz4WAQn8Bv4/RwsxjXjIItV3/MSnuG
 dOBSUGwCQBpPg4C7teHPcKRt3WEeSFZ9ONrB9MeG6ZMZM0+FA9BRMEBC1P7Az1cSvTnEk59cLAv
 qisOrifg14rY/tcgLMTWYlf0gjsMG4rnbelbyvsbA==
X-Received: by 2002:a5d:5f91:0:b0:43b:5672:efe with SMTP id
 ffacd0b85a97d-4493cb42f75mr3233148f8f.9.1777541910362; 
 Thu, 30 Apr 2026 02:38:30 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-447b421721fsm10816795f8f.15.2026.04.30.02.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2026 02:38:29 -0700 (PDT)
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
Subject: [PATCH v2 14/25] plugins/api.c: Trust cpu_get_phys_addr_debug()
 return address
Date: Thu, 30 Apr 2026 10:37:59 +0100
Message-ID: <20260430093810.2762539-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430093810.2762539-1-peter.maydell@linaro.org>
References: <20260430093810.2762539-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

In qemu_plugin_translate_vaddr() we have a workaround for not all
implementations of get_phys_addr_debug returning an exact physaddr
for the input virtual address: we OR back in the page offset to the
return value.

Now that we guarantee that get_phys_addr_debug returns the exact
physaddr for the input virtual address, we can drop this workaround.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20260417173105.1648172-14-peter.maydell@linaro.org
---
 plugins/api.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/plugins/api.c b/plugins/api.c
index 4b6fad4999..c97cc68882 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -625,7 +625,7 @@ bool qemu_plugin_translate_vaddr(uint64_t vaddr, uint64_t *hwaddr)
         return false;
     }
 
-    *hwaddr = res | (vaddr & ~TARGET_PAGE_MASK);
+    *hwaddr = res;
 
     return true;
 #else
-- 
2.43.0


