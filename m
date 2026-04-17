Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B031BF436BF
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 17:34:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDn34-0007Lk-Ml; Fri, 17 Apr 2026 13:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wDn2H-0006k7-Ul
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 13:31:30 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wDn2F-00023R-Ra
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 13:31:21 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-488ab2db91aso11366465e9.3
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2026 10:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776447077; x=1777051877; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zwAS7ZT+4GzIr0Ax+jfMns5onR8BsHM96TfH2Ah3gOw=;
 b=Pk/sCSTQWMV8Ubx4sHHac9RGirQNpPqCxE+HVSVHiS/SEmKY6cph9xy8PIO4uLBlHP
 X74i2zpM5kThNHpOBUe5L4SL56inAvM+7jaPXbfZT4F1yGTYl9zKCs0ozK1xPzdWOE8W
 0myznrJi+zspWkn4eiFNLH3rH7tKPg/kWDb7pLZpf3X6n3sfh+NE535qO4chpBPXlTo6
 q5osqA4KMl/BV5T3BGltfzYjHgKyI1+g64Y8A4TGCG2ksxgIWQtqU8hEq3FdI+Q7IVeT
 SN7CLsBSoPABKWtvL9c1Kns2CwPudATycY/RMa4uZ6ArsWJw8uks2CqxIcbreD6DIRh1
 QVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776447077; x=1777051877;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zwAS7ZT+4GzIr0Ax+jfMns5onR8BsHM96TfH2Ah3gOw=;
 b=PdKV9yyUuMAQKxmaHx5CuCascaGWxfEdDSD0cwbeCwZoBGHnyag82H3po1v6SGKMQA
 avcUBDDMPAbWnt2yq4wf1ix8qNrBdT4RjMoHwdsVRjdQl/wy6Y3Yrffq7o6BGjTOPbq2
 6NZ09q8Y1atGZ2s4d+ChLQ6DjI6WkrJNtEOxv5//QWGtPhi4AVqfZHSsw0ydOiyMXmED
 uO/jazHcu26P4/CQjOBaDvs8Xz/mcRivTzPu/B8oigCmVG99EMU7MIQZBxGiqb/WJjva
 /SX7Foq8C405mYsVA+GXFQwE4kGDs5HGRXfvyCR0s5bKcy45+OE6fR1Ae6BIoNEd0Dej
 KU6A==
X-Gm-Message-State: AOJu0Yyo9CMdMKUxgjzWsXyBe0FrKgYuS1adQhiMxcD1ubjdTE5oBXFm
 iSLidekaGdYxrYBChhvt4NCjUfOKdBlhhAvSZJ+ReyTrMai0jGX8wuoF41KiUZebKLsCFn70s5I
 9xZufHOc=
X-Gm-Gg: AeBDieujLQ0uQMB/CMVaHljd/E97GoAFP9I8pB38vBjDx5a+eAl/oXOlLWWshFvucnj
 HS5dg0jt7KcDywsb5p3JmCqjspVkD6uUTthPRcW5ujOuv2vQBGA5RASPh0Yt2ItBVRvRcv0nxbD
 9r98bIGJyKFqDNHTwRgKrIdef738VeKBIpkve33hH4z4605WYSfVHG35JIdeViQCxRLK9v2cdI4
 iDIDTaElPEa65fMsIPP8ZzqaoYSDoiuVGmr89xfKclQcPkhKcUAb5jvx8qqr2R1EMNANrQrC1t8
 FvZjhoYtusUMsMR+LAEzn7PrDEowSuSZE2JB1De2lahUo3NbZSRlqwyEg5zeE7993s0dtMGTrSn
 S9R4kdAOClKNK41IIVwPLqPXhozmBEfIJP+VxaTUGf88dedmNNkin8Rdm3I/HrZWRI8L1joBQpV
 wi7xuT0GE4qsSf6hI6brLXpLklOdGlRQrZU8cT1Wj+j/Mq6JOFgypH3aUrYRsO0h1QtXm8LmvYC
 sp9YJeL0QOA+33kIJucMbwYnAxlHhxa+bOjfAY4wA==
X-Received: by 2002:a05:600d:8447:b0:487:338:b4f3 with SMTP id
 5b1f17b1804b1-488fb778734mr47380405e9.17.1776447075887; 
 Fri, 17 Apr 2026 10:31:15 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e4ffa8sm5819650f8f.35.2026.04.17.10.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 10:31:14 -0700 (PDT)
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
Subject: [PATCH 05/17] target/x86: Make get_phys_page_attrs_debug handle
 non-page-aligned addrs
Date: Fri, 17 Apr 2026 18:30:53 +0100
Message-ID: <20260417173105.1648172-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417173105.1648172-1-peter.maydell@linaro.org>
References: <20260417173105.1648172-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

For x86 this is simple: we just need to stop rounding down the
input address to a TARGET_PAGE boundary when calculating the
result to return.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/i386/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/helper.c b/target/i386/helper.c
index c397a6fde5..108b02396d 100644
--- a/target/i386/helper.c
+++ b/target/i386/helper.c
@@ -372,7 +372,7 @@ hwaddr x86_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
 out:
 #endif
     pte &= PG_ADDRESS_MASK & ~(page_size - 1);
-    page_offset = (addr & TARGET_PAGE_MASK) & (page_size - 1);
+    page_offset = addr & (page_size - 1);
     return pte | page_offset;
 }
 
-- 
2.43.0


