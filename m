Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFDEC9830B
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 13:26:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9My1-0001ze-2x; Wed, 23 Sep 2026 09:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9Mv4-00037k-KK
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 09:22:00 -0400
Received: from mail-dy2-x10.google.com ([2607:f8b0:4864:36::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9Mv2-0007d1-EU
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 09:21:53 -0400
Received: by mail-dy2-x10.google.com with SMTP id
 5a478bee46e88-328664d340aso547203eec.0
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 06:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790169710; x=1790774510; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RGdh00utr6Q+OpO6+8fa0s0hS8SKHylDK/Tx/Y6cmu0=;
 b=cDDfpBCySBH32oiRMbbc3wET7+qAmSUbgRgPbREKfLnwc8Zx+7WVgGLof5BQPPrZxI
 eU98aNmX3P9/z5jzjdUjnfMB60sSF2uu1Wb4jmf0xj+7zPNuVdKKqspWUc+JSvIDvk7n
 dDlZHS8+M/3PLQNkysmhzIB0QL/dODTpTWZJdNgV1OQ2hrBaq/mvYR90hcSKPQK6vGV+
 YcQsaQVj+V3o6z8TdOlxBj8M0GGDZjvocOA50pZA/X0XVA89hHcVrCvX/SKVzZflQQCf
 BuG8y1akNEzv4pHoJAJz52vSR4ESpsNwTlj9ij/W4FWKI/EGG2s+GeecRznq2642U1XX
 GlQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790169710; x=1790774510;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=RGdh00utr6Q+OpO6+8fa0s0hS8SKHylDK/Tx/Y6cmu0=;
 b=my+9SySttm7NVEeeXN4KviNy6ulsTweaYQppPpilqtz9Qtg1sAzYKZaqIAZoFq/vqA
 HWoG425XUIuurYwH9EVrLJC5Y+wxrogMJMPo0gNzqQ9e8tlIXk/IkeJGfcQ6rKp+gPh7
 Jg8c9/tEjX7BmEf94do8akkH2Dp9k1Kx21rNnlRfge1ep1p8tprnY8GxhvxwfzMeEdo6
 j+HAEgwTA+m1R45fhKQAuuM4yb+BqJrvw4Wla4tJ3OCUwqdWpWBX+9To6zF4G67MEL1f
 qvWAD9Ue/ayVszLt9EPNJz/hd0UYYSRx5l8fXDyxRIA595nCO6QWiAeEBOHfHF7nZ/3P
 7Vaw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzU3FsAYHS9nvMbA6yPJ2d8icbqCxRFDTgoUowZnnncBkfi/DgJl3TRYteCVuh0CHPLgGsMpFqIuQ==@nongnu.org
X-Gm-Message-State: AFuF++nXFgKHcNTMcc4ui56H5c6JlzcZg4rmAP5FU+aFI1aRP8CuuaDf
 6TwrgSJpNB3AyNmeIjJbvPQE7GUXgqvuxqY1iqlCbcK0gAE5WJ/ZBfN7
X-Gm-Gg: AYBFou2CnuJHpKtFKgtLQ/yJ3SCmKQxu5IW5fgpHVbC0ZsocqwQTPhXgj2lcQWahsyK
 s74PgxEHKYC/ZBe4lu03uPLUbY+T98gEJZeGiRlCq1kn6RLE/1aIiBfIDEtyRhPxFxP28QmRVim
 L3WfU/IflCzq1FLE1/yoFIIrEHd4lMMB9kzfZapxy3CgsZxOiywDzHJyWLZxr5vQN25h0D5ed4w
 SpKMGxEo8rSia1vtsbMlHJwBlPZ3yJhiqg6qo6jjdYJJXjVXyoemfqwxx3WHLU95mg9LUkKP9nU
 T+nNjwM+RCJmLks7Oda3MnXpNA2JgpOy+Gqzm2L076VzJJziFKD+zPIrfgBkVa3xVa0Sef3pRiR
 h6PvnB1voEaXaWtpEdSoCEWUXyD8sJc7AbdhY+DGcg8GtuGTJZLGiWhInvOvjZp/qGUi3jYjQu3
 M12QQ4zF22oXyihXPvpeDrePQi+Ru/9+lm9DcDB0wlqUvvQdYntJffOuCnsT0HTOjqF/bmodwNh
 W30UKrYehuWKEbJ9YLyN7OBVv0NrKc=
X-Received: by 2002:a05:693c:88d4:10b0:33b:dcbc:6046 with SMTP id
 5a478bee46e88-33e8bc70ee6mr2596067eec.7.1790169709341; 
 Wed, 23 Sep 2026 06:21:49 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:21:48 -0700 (PDT)
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
Subject: [PATCH v3 029/114] hw/intc: send IMSIC MSI via kvm_irqchip_send_msi()
Date: Wed, 23 Sep 2026 21:15:03 +0800
Message-ID: <20260923131635.1894-30-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

- Drop the CONFIG_KVM ioctl path and call kvm_irqchip_send_msi() when
  KVM and an in-kernel irqchip are enabled.
---
 hw/intc/riscv_imsic.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
index 30fb60cc312..033b7813060 100644
--- a/hw/intc/riscv_imsic.c
+++ b/hw/intc/riscv_imsic.c
@@ -311,19 +311,15 @@ static void riscv_imsic_write(void *opaque, hwaddr addr, uint64_t value,
         goto err;
     }
 
-#if defined(CONFIG_KVM)
-    if (kvm_irqchip_in_kernel()) {
-        struct kvm_msi msi;
-
-        msi.address_lo = extract64(imsic->mmio.addr + addr, 0, 32);
-        msi.address_hi = extract64(imsic->mmio.addr + addr, 32, 32);
-        msi.data = le32_to_cpu(value);
-
-        kvm_vm_ioctl(kvm_state, KVM_SIGNAL_MSI, &msi);
+    if (kvm_enabled() && kvm_irqchip_in_kernel()) {
+        MSIMessage msg = {
+            .address = imsic->mmio.addr + addr,
+            .data = (uint32_t)value,
+        };
 
+        kvm_irqchip_send_msi(kvm_state, msg);
         return;
     }
-#endif
 
     /* Writes only supported for MSI little-endian registers */
     page = addr >> IMSIC_MMIO_PAGE_SHIFT;
-- 
2.52.0.windows.1


