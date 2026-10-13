Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1DFCC6B13
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:46:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY3q-0008Bq-CV; Tue, 13 Oct 2026 04:40:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3P-00071k-UG
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:13 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3I-0007bl-Ja
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:09 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-49d0da752ffso24453105e9.3
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880792; x=1792485592; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=UViGHcknrDhUYElC9wgz9XVN/w6c0++pkoJaAEN1syM=;
 b=GlGX8WyUZLOKbjKxltbHUCmR1yyx2myOzaF/2wgOIZplRM7kcGv9gud1A+ZKKAgIJ3
 zY6VvkdVG5DW0ETewJDu7FxLAdZpYUqsK8lHE/NAK7HplN4BvPMsKFgMF8kJkieQV9Bo
 ZpaNe0XQns9TYUcwRpx7zCnZj/ZA7HSeupth86XmcohhhUYV91sdgawQ/utW6TX/Dx3n
 uUAGufd5LZc1h1TiTO0z9svuw3AjzuACX6BYimYhA06jT1qTRDP0UK9c83BlY0u/13OT
 Hxf+miaZ+H6G2UR5QfghCzvVGlOqLzHH6jN1wRlROPtM0UQYCxDxxD+JCQjg0CTrwWkm
 khQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880792; x=1792485592;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=UViGHcknrDhUYElC9wgz9XVN/w6c0++pkoJaAEN1syM=;
 b=WK3zZPNrQOZcmyAZcWM7pK8G3qx78Q6qTy3DCQFO+Z578x7lxxVm9Mx1U5Jyxc6a6G
 7DSOtyKF3ZTL1/HWQNB5TBYYe+hsuCYdBSnKhfa2NkdoW/nkqnlndoEjYwcj5HrQiHXi
 gEvyZLdzKta+6l1zyugVwV7o6ZV25SM743YRi5v8/ikUeBJW+sVO9mbJCi+5/SCrA6i1
 8jSJin8O7qE42cwwYLhnOY8TC0uUbBCj8kFu1lo3Px94ycAs4ggm4Kzs3LJXJXs96a2N
 g9W1ZvJBKhvFdUh+XlfCfzlW2F71r7SNyhZ65eQapWlUCrD7lIBAQ5/jly+HzrMX+CCR
 dyRQ==
X-Gm-Message-State: AFq9FYK//P4mQOA+zFrH4WTBhd0sogIahieDi6fq3p4Ym0BUGol+rh0l
 XjDqXBn2zEmBwBe5A1Ts7i7wJAMMr/aTEv+h6wml+d2rcikulyxjdD9mqBKgdxrAzLKTgiWlu6q
 wIj6rW9E=
X-Gm-Gg: AYBFou2SX1XnFl10EUMAfk2hxAoPejn+gSMRuy7o0IKFhgRPK5fu8P+Ka0a93Ezfxje
 ySBmJtzPamTNVLNOx1KzdyFNTKZ+oFEcZjZIGoyJJme09Q+QUJMKwD3kgoIVGBSMVmNU6Ux8qNe
 Appa/C4Afu2KJcrXCp6z0j67ZPLiBsSAWaolJye1Iyr9WUFJiHpY77wnfkKqj1lMynQ4Z7zMV2t
 ekr3MtAwqgET5M24YRtTe11oxMHu6ZxLQZi7G8KLxG8mK6dIBKfRI6m33fuIExikoPV+fqrRxcT
 VMR1VdFqs3jdX/sSUAvFJLGGdJjg0apRsy6zyvrgX+fGCsVZPHxHSvZnQjCC4ZNFCTICai+pY+D
 skdQ2UYcLlupQCq2oKoQpjFKWwdoOzUkjsUjmv6vSgxc9ZDLXOhSQnoYkum0RAEgO6UMPVjRQdw
 YM6EHeCaGzHMiPqXS+GDanxfY+5rNNEil3V9hthEkOUe1Dcf0jcOXQP/fhPjInlHB6mkb66beH7
 qr2GbIghfQrr6gt4dGpx6DP8zmnSc12N7h8W6r99uvx4pgW5VACzONIoxMNpD5mvMxYqvEiha/j
 ToU=
X-Received: by 2002:a05:600c:e549:20b0:4a1:9438:719e with SMTP id
 5b1f17b1804b1-4a1943872ecmr113069885e9.9.1791880792088; 
 Tue, 13 Oct 2026 01:39:52 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:39:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 12/86] hw/intc/arm_gicv5: Relax QEMU_GICV5_MIN_LPI_ID_BITS to 0
Date: Tue, 13 Oct 2026 09:38:19 +0100
Message-ID: <20261013083933.1024405-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

The GICv5 specification allows implementations to declare a
MIN_LPI_ID_BITS value in IST_IDR2, which specifies the minimum number
of supported LPIs which can be configured (both for physical LPIs and
for virtual LPIs in VMs).  It also notes (I_ZKLJR) that it doesn't
expect most hardware implementations to require a minimum numberof
LPI ID bits, and that this is mostly useful for the virtual IRS that
a hypervisor might expose to a guest.

QEMU generally prefers to offer the guest the highest-flexibility
setting when it comes to this kind of IMPDEF value, so for instance
we set our supported ID and IAFFID bit size to the maximum the spec
permits.  Since this value is a minimum rather than a maximum,
"highest-flexibility" means allowing the guest to configure a very
small LPI range if it wants to.  Our current setting of 14 for
QEMU_GICV5_MIN_LPI_ID_BITS is the least-flexible the architecture
permits and requires that guests always configure large LPI ranges.

Set QEMU_GICV5_MIN_LPI_ID_BITS to 0, as the spec suggests real
hardware would.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/intc/arm_gicv5_common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/intc/arm_gicv5_common.h b/include/hw/intc/arm_gicv5_common.h
index 59ac1c3880c..a47f639e84c 100644
--- a/include/hw/intc/arm_gicv5_common.h
+++ b/include/hw/intc/arm_gicv5_common.h
@@ -146,7 +146,7 @@ struct GICv5CommonClass {
 /* Number of INTID.ID bits we support */
 #define QEMU_GICV5_ID_BITS 24
 /* Min LPI_ID_BITS supported */
-#define QEMU_GICV5_MIN_LPI_ID_BITS 14
+#define QEMU_GICV5_MIN_LPI_ID_BITS 0
 /* IAFFID bits supported */
 #define QEMU_GICV5_IAFFID_BITS 16
 /* Number of priority bits supported in the IRS */
-- 
2.43.0


