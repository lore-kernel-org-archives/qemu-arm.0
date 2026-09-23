Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC0FC9830C
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 13:35:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9Mzv-0003b2-4D; Wed, 23 Sep 2026 09:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9Muw-000314-KD
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 09:21:50 -0400
Received: from mail-dl2-x10.google.com ([2607:f8b0:4864:38::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9Mus-0007ax-CX
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 09:21:45 -0400
Received: by mail-dl2-x10.google.com with SMTP id
 a92af1059eb24-142dd04edb5so1438858c88.2
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 06:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790169701; x=1790774501; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BQcT2TCunpJ4XJOGDsLRORw+wafc2yMdlkK9/vuTXoQ=;
 b=OdDA58sqjAYv0kiOVtJ9vfzQQws+8/0BbFX/eNIxkhMNnhjkjA77LFqLFMDYzNzb3/
 dsJ2DtR+kRz8ynfItiX7J30zL9JHVOa0u0Uhsy6vVrg77Vfk4H/YK/EVYBjLn84Ki/8R
 e2AEiEyyVUHSdrv4qR8IO/fpYIoPavOmne104tmzsNSYMk34LJy04WbTWelXdznNWNiA
 CscdzKH/ok9DEYDyQCSMeuS5uMFeyiZzxsnlV1pK7SJbaxz8b2HeLtaTfTCv22QfU/5N
 vm7Av3CV2uz9XWVeiRRxg2RmzYjhRo8lED5vJo962dzQVTS2B/IcywiqjpBNiY+HP+b7
 oW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790169701; x=1790774501;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=BQcT2TCunpJ4XJOGDsLRORw+wafc2yMdlkK9/vuTXoQ=;
 b=i8PBmM1GIBsO7E/LvC5p+s9ZrNo9hgt792OkfcvKZ6L1P1jViFsLfqbD9eagDU8fVg
 j5Jp1e7iLMIcmkH0D6RkODECqI0i/TpAwp4yjE+4tMoCT3nUlnrD8Zu5MtY2KHbr6ntW
 KS3Ylu+ptg7K0pX1dl9WFh/87SlCB3nRWPlBYswvZ2zPyYb/dSuUabGf7Rd/n57ccEhJ
 qmp/EBBHp+CgSctgfh7khMoa9hzeLGaowdM6l06jNgEPRQVK2uCUsBi0RsLWUQilamW2
 uoWhCOdsL3xD8vFOKnRPhnPHLmKP9zQ8HF977qsQ9tVLv81nXLYTTgxi5gcKI/j6T7SX
 U74g==
X-Forwarded-Encrypted: i=1;
 AKwUvByMQ2eINy4P/C5rmWWU/WDi2LyC6shOBdAvAIdS2oA5JTA2BqmyPwVgNC3aPhI8li2w8VqwVbKRaA==@nongnu.org
X-Gm-Message-State: AFuF++mFfD+7mdtIIYy9lHUE6nnygD788I4taL7xpQkhhbDrMVjhyJuY
 RHLJ0Lgw/kmE47MVFsIPKyQOQvN7gHZEDvxswXiGD4RlRLBceIftzx7I
X-Gm-Gg: AYBFou1EuaTKcVpL337m6oafVMLUJ+9KYcgLKw4+g9O/vA1S+IXhe3qnSzpeYRtYF/x
 oFOWMO1gO2TjXvh0RWhigbizYvA2n6Sce2K+b6A98Z8oKbXOh3+5jiY/O6EMuL6acD3JjAssEsv
 infDgLScPvyT9C0lHb0U7MGqu8qy9LZyPMOU4qYwKQKOkNg6NUc21h2RFBgHB/XTKwm4EgneJ04
 ZAADAB7XlsVaU4sw4auRtZovPt+Qcupa5cl+abttCrL6+4DvOkh3fbQY0TbgLRVso/KzcIk1fXV
 fEkq9lFrrtf5o96q0TrRZjJZo0A6sFb3VEOb6ePeXm5NRM/+dzsoVWIhvOjqt6TQhTpCjUziXbS
 nA/UiJtshdOEMUHyMsWhMgtS7KcK7PeeKkyAwd8RsRXoYV/SiatXc1oFIQDn0Sv53YWN4UaugNJ
 qVlAt2F14vvN7EKM/lMxmozprnl1jpLAJF0FNRCpdT+B8g4g9vGrccNfWYw+8HSG25ofyy+ELtE
 olOrjT4W+hOqtNevMSqTOTS867kB7JMJnCGejPUZJo=
X-Received: by 2002:a05:701b:4551:10b0:144:fd7c:84f4 with SMTP id
 a92af1059eb24-144fd7c8641mr1564469c88.5.1790169700288; 
 Wed, 23 Sep 2026 06:21:40 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:21:39 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, xen-devel@lists.xenproject.org,
 Chao Liu <chao.liu@processmission.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Fabiano Rosas <farosas@suse.de>, Xianglai Li <lixianglai@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bibo Mao <maobibo@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 kvm@vger.kernel.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Song Gao <17746591750@163.com>, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH v3 028/114] hw/intc: use kvm_enabled() in APLIC AIA helpers
Date: Wed, 23 Sep 2026 21:15:02 +0800
Message-ID: <20260923131635.1894-29-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

- Replace CONFIG_KVM ifdefs in riscv_use_emulated_aplic and
  riscv_aplic_set_kvm_msicfgaddr with kvm_enabled().
---
 hw/intc/riscv_aplic.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
index d8e25bfda14..03a0852b8b8 100644
--- a/hw/intc/riscv_aplic.c
+++ b/hw/intc/riscv_aplic.c
@@ -167,7 +167,10 @@ bool riscv_is_kvm_aia_aplic_imsic(bool msimode)
 
 bool riscv_use_emulated_aplic(bool msimode)
 {
-#ifdef CONFIG_KVM
+    if (!kvm_enabled()) {
+        return true;
+    }
+
     if (tcg_enabled()) {
         return true;
     }
@@ -177,21 +180,20 @@ bool riscv_use_emulated_aplic(bool msimode)
     }
 
     return kvm_kernel_irqchip_split();
-#else
-    return true;
-#endif
 }
 
 void riscv_aplic_set_kvm_msicfgaddr(RISCVAPLICState *aplic, hwaddr addr)
 {
-#ifdef CONFIG_KVM
+    if (!kvm_enabled()) {
+        return;
+    }
+
     if (riscv_use_emulated_aplic(aplic->msimode)) {
         addr >>= APLIC_xMSICFGADDR_PPN_SHIFT;
         aplic->kvm_msicfgaddr = extract64(addr, 0, 32);
         aplic->kvm_msicfgaddrH = extract64(addr, 32, 32) &
                                  APLIC_MMSICFGADDRH_VALID_MASK;
     }
-#endif
 }
 
 /*
-- 
2.52.0.windows.1


