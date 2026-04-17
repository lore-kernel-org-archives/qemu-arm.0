Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D9AF8DFF9
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 17:35:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDn35-0007Mx-Cz; Fri, 17 Apr 2026 13:32:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wDn2b-0006tY-En
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 13:31:48 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wDn2X-0002DX-1y
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 13:31:41 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-43d43e09de5so539281f8f.1
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2026 10:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776447094; x=1777051894; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DaHo77KFkT8Px7cBdcv5JOj+A13ipNoa8Ob819EY2bI=;
 b=tQGlt1GZEojDuX9Dg/lQDy8T4nru8/CFiRct/cnw/92Z4UegPtrB2okmRUI70A6QhL
 6Lxr/3LFPOLQi8UgDCG03xA0fRvfN4zta/7D80q8pk1UNNXr1glWBXcfhfDHElwEKuQp
 vwQXAgK2Pwvf+FtgLTVe7rEHHRpxDsL91R+AQ04Vg+FRdjnNW5o/KwSzHWV365Fu8yLP
 CZeh2/CU8ekuuKnGNqo02PmbonGAGsUmFPurZNQdNSxry99aaNlwC8zyeBCAww7fZ3lF
 ttOgT7xrv2CuYfB9q3HSBHAS0dbE+2Yc4LhbAt1nCteiZRxzXyvDgLfxLt48X52Ofh75
 nW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776447094; x=1777051894;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DaHo77KFkT8Px7cBdcv5JOj+A13ipNoa8Ob819EY2bI=;
 b=aRacrde5+sKepnZLzGrYmasGYeyYw27XQMOQkVdpDWViTOuFval/xHVAnsJo9l7ArN
 Qg4ssxaDakJkezwTGv93IoShVSYvdtOym5TDdBO8wBGiLKhBCTV1HnOJ0G/RM/YIkLcP
 c9T8CyI5HDFz6niTVmsGlKrxo10+z5ivs4fD4KBvgH0oh/l4iLEy0vb14i1S1SuLUGJA
 6H2tMu/fJ9mudRA4826RXrMsxaklPQp98skTudI1pIqQIUd7yd5zgSPujHBSiQBoCi5l
 9uPtN0BBKB4DCEP8LUx9iHg0KPGynHUAEmtynM4GbFaSFgLWLGv1kP/Og4pOlfoinrtj
 +BxA==
X-Gm-Message-State: AOJu0Yzc/4r2B90mENrV8CJnZ5VzVPujNKXxNZUnHsO4o65rmW77SnjW
 LMPakioyjnJH2YQ/S65D/oY5vew+JQdGFTT6cNv3JxRY75eWGJ6KeCXD0cVGiw/3be4zFnRKIhd
 z5EjrhqY=
X-Gm-Gg: AeBDieuVy7AIoXVJTC7rHt2ZBi9gk34ySfTt/xHtnOcQQj6X8FtefazocLTlVYFmWvR
 C6VTceTthqERu6anqUqQYurEQpU8kaM0TItqcnnUwIrFJKRglRc94ji3hIQDPXG/4yXZJIKoYL+
 kIly5Oo1h5YY5TSuNrZ1K1iJ8R6eWr+B89nXgMBEf1zKmMtAJSLSVT02ZTqW91I9RzDgcVIaB3d
 wpLtxiHgH4NS7ycQpbEzcFiU4a41Ka+kKznr41I65/N58zKEs7RXllR4ffLKXcLXGMXtGf0v583
 eDtPfWhEwMtQmnhVi3IkgkIka7+eHHewBygBlWtqudXTsbs7uG3qaXzmqLjpwpC9gwo4qiShwxL
 UpOsIrTZbdmLWVvv8/P/eF55OeInTz9UQ7C0yCLBIGi5V9taNX1WrGE+jpH0sBtqFclivD/Ipi9
 9EPJaKL7U/Qn/vs4So7MRWlnFpjOi0bRBfoMblxHr8MXMUifootREL+Aw8bR1tY6gNMlcEysdRU
 uUGwayu5wLSi8QUpxcRM7nIYcKXPV23wYS50IZ+zw==
X-Received: by 2002:a05:6000:40dc:b0:43c:ffee:ee94 with SMTP id
 ffacd0b85a97d-43fe3dca95cmr5737764f8f.11.1776447093977; 
 Fri, 17 Apr 2026 10:31:33 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e4ffa8sm5819650f8f.35.2026.04.17.10.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 10:31:32 -0700 (PDT)
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
Subject: [PATCH 13/17] plugins/api.c: Trust cpu_get_phys_addr_debug() return
 address
Date: Fri, 17 Apr 2026 18:31:01 +0100
Message-ID: <20260417173105.1648172-14-peter.maydell@linaro.org>
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

In qemu_plugin_translate_vaddr() we have a workaround for not all
implementations of get_phys_addr_debug returning an exact physaddr
for the input virtual address: we OR back in the page offset to the
return value.

Now that we guarantee that get_phys_addr_debug returns the exact
physaddr for the input virtual address, we can drop this workaround.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


