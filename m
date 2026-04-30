Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC35FF886F
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 09:42:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wINrL-0005ZF-Iz; Thu, 30 Apr 2026 05:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wINrF-0005Lj-Nq
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 05:38:57 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wINr1-0002pw-C9
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 05:38:57 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4891cd41959so6386485e9.3
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 02:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777541922; x=1778146722; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WCh2RmxvYZV/ZNYedrXNpgq7MB2RbmztWhGGLEAmQKE=;
 b=NHMMIryZJ3T0hN38xfIijGnCf6Gw8wVkfFH1I+E29DBm1sJpIJZ0vsF9Dh8o/iKtiC
 Bd93aGXbK/Js1KG9eRYV61nCmNTDrOWdVB2LNtpBNX+PGIXIJ8olM/IMDOcoP0E2KW7J
 o7fGSV3UfSEzq/jl+U5whM0poja+AmzweendhOcIcxtiFTq6CEOLAeCf/fSvKwu4+1KZ
 AwHBRFfb9IyCROYjEf23KbOtv4yvNcdRSOyINrsNNvWyJH8dFldZ1KGQx/4eQ7RviPwt
 XhafervI6ScriK1YxUG3GuFGgEgc0MgdxnNi9nx2hl1JlBYSsHDi63sdFIqLieuHcJr8
 YXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777541922; x=1778146722;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WCh2RmxvYZV/ZNYedrXNpgq7MB2RbmztWhGGLEAmQKE=;
 b=ZaBPRIyYy3sb8E0ItB3nNCaY8dG8PToYGpkYTUyxtW6e5PfJNoId18Q7P+Ra8PvKmr
 Vg5EHsllJpck4fv6Y19gN2z3lmqUuFlQGavbXZ94hI2iJ4YMmp9MHuWl+b79Vlzsf23Q
 dEs2iKtB1rNoKaqfXkAxXSvoJZdG2/ZmfTsso8Sbpe3EzH6BfhjWH8AXmuKr4QKfQBy4
 9j09EaNnUyAYmAh+DvBkk0lgou+7S4w2ZL/PjQCE451ILY9K67aLYKSmO+MUQK21PlOK
 JybYrxsrwg/KBhX0cecqhVums1NQ371qh2JWkO/F6GcXznpK8xavbqnONnBUtycOw2nV
 cyLw==
X-Gm-Message-State: AOJu0YxJbsG/mU1jdbNLEqPPQ2PqevvgqCssFLc+KDf7gFRP3yUMTrok
 LpnaPhu8MhVpg+7gzqH2Fu15jEAfBFiR8etk88sCIKpCJcKCqnCw9+thViTfPKRAIvY=
X-Gm-Gg: AeBDiev6X/Aq2ZsXJu3AVxqqcHGzd+OOf7Ry2RfCCZjKHvWSQplnkH87fJHsnIPrzR5
 FGlDoBaTTfV44gJQdrPkLTp7nEb1n6edqEodV/m/xE1CtJOFFX9VBCTOS4VB6Yv1VMb0COEg3XB
 8oP9WGvaXIlpko93DFSpDKZ2XmB5ti7Vn9z+/e7W/qQai5Dph4yFnIe0xPx4oT7AVYrDkBPzaNl
 FSRkJnQBkZFjwUA0sHVIgTvQXcZ/6Fr4COODaAe8+k770P35djxoT2H+4LcMIopHUESnMe78pkB
 ba6nDp49eFZReduZr6dZ4GpfbY2ND6zchpxWqDe5kiXiMMtVcU3kAt0CJG6RPq279ViCbZrUwOk
 b0JWvQiP7mWjhf77NcNYErdXhHsUAQpC6ZgHjuaIwLtqFFU9iqS31nRGdX7g6snSKqM+4qhYStt
 KMHn9hUUxlhJ01Xmp2GW8kMzZo3WXIMaFqh/AhSA2HIG/Xdpi6HP9yVmKGOdQ2uSY4rC1Sxkgna
 JmvZw82aX5tlId/IBiI9hLGiV6LfAAi2eGs4ve89A==
X-Received: by 2002:a05:600c:4594:b0:488:e7e4:8425 with SMTP id
 5b1f17b1804b1-48a8445d10cmr36275865e9.23.1777541921847; 
 Thu, 30 Apr 2026 02:38:41 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-447b421721fsm10816795f8f.15.2026.04.30.02.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2026 02:38:40 -0700 (PDT)
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
Subject: [PATCH v2 23/25] monitor/hmp-cmds: Use cpu_translate_for_debug()
Date: Thu, 30 Apr 2026 10:38:08 +0100
Message-ID: <20260430093810.2762539-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430093810.2762539-1-peter.maydell@linaro.org>
References: <20260430093810.2762539-1-peter.maydell@linaro.org>
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

We want to remove the cpu_get_phys_addr_debug() function; update the
HMP gva2gpa command implementation to use cpu_translate_for_debug()
instead.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 monitor/hmp-cmds.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index f8380bda58..2acdcf7d78 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -713,18 +713,17 @@ void hmp_gva2gpa(Monitor *mon, const QDict *qdict)
 {
     vaddr addr = qdict_get_int(qdict, "addr");
     CPUState *cs = mon_get_cpu(mon);
-    hwaddr gpa;
+    TranslateForDebugResult tres;
 
     if (!cs) {
         monitor_printf(mon, "No cpu\n");
         return;
     }
 
-    gpa  = cpu_get_phys_addr_debug(cs, addr);
-    if (gpa == -1) {
+    if (!cpu_translate_for_debug(cs, addr, &tres)) {
         monitor_printf(mon, "Unmapped\n");
     } else {
-        monitor_printf(mon, "gpa: 0x%" HWADDR_PRIx "\n", gpa);
+        monitor_printf(mon, "gpa: 0x%" HWADDR_PRIx "\n", tres.physaddr);
     }
 }
 
-- 
2.43.0


