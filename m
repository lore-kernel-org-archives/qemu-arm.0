Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388FACC6B38
	for <qemu-arm@archiver.kernel.org>; Fri, 16 Oct 2026 09:41:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHeRY-000869-HF; Fri, 16 Oct 2026 05:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1xHeRU-00084u-Pi
 for qemu-arm@nongnu.org; Fri, 16 Oct 2026 05:41:36 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1xHeRT-00072K-56
 for qemu-arm@nongnu.org; Fri, 16 Oct 2026 05:41:36 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a1d293b293so1154005e9.2
 for <qemu-arm@nongnu.org>; Fri, 16 Oct 2026 02:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792143694; x=1792748494; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JaV6zcQXKCHcnVPOydiraqRohmCcTct76VZifDwNpIQ=;
 b=nqQuQc3GRWy28yL2eAc8Mh00PBpPCLFuaVsTc9nwOaGd4mstH3scZxEe/sB2wmiOsH
 aXBKTvuDWWJ70XFZuAzTP3R6j4QWs+QjT7G4Y7c6Q7O6G4rLCHST7Lac61dATJ79Zvd/
 +oILprUmhjh4Ifasx0yJFxyRuJ8tmmKf2q0thTq0Uxi4ZkXLHb+ifFLm42Vnl4q5pomz
 g32KX8wLhqWKlYSnw8DhxTH2y2/b/8tgxrp6Ze8KFvHdg6+6RZ6zxhAwhU353P84onq0
 kLXKau1ZvFml/3mfmvuGvKVdMB+RsbW2sjqL3tO9jSxmdyGZCjC7aujydHuLJ0FexJBc
 c2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792143694; x=1792748494;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=JaV6zcQXKCHcnVPOydiraqRohmCcTct76VZifDwNpIQ=;
 b=aOZj+BqSBjaxHZLhN4CkGTucnpgcuFrgs1TovgBr3bAAgsKMRLRmPPJOsoz7QC8GUl
 /Zmff071/az/VVKc2yMjVx8VmSEsjktqB0hxxwW++qLObRtMgyKG2YuCsMNXZP4saIwa
 xqRRPj8d2zEfHaURQB7quPvDHGKF0j7uWrzyvGwQqjFExfzlEqiwO8E86XTCfgIGMCjy
 QiejeR8Xc8XH0aKA4gqGgR/y/1naXUq4nj0OBXGuhI3jnSTHEsunVhzavyhbxPkaHG5A
 mYFbgjXrxgeZ1nHsRPVdRryj/Jr30tnUTweysnTAMDulpEauf5WzgZXAPyXpMkYt1AHF
 Jysw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzVNSLlN+IfvUm8k71d4YdEuC+65G0PL8JKRCU8FRyxrpuWpB22GVEjbWO4E986Pv3wpeGxzCFvtQ==@nongnu.org
X-Gm-Message-State: AFq9FYIVxkIGRuVYasK3H9Ajat3YBrEexwa/JNGTQeyZPcKMdc6KzaEc
 muZhLyJAWsUWXie+UJ7h5C8I2psFikziCIJYTsHdLENlBnC4TxkFFXD6pwLu0gzVpDE=
X-Gm-Gg: AYBFou1KUUqNqdBmiTEIGvRiF5o17vqzmXWZt/MOrIv2vk2ZBdSRk5xUN9bcogxzAa9
 AAO39ldJeI+N4Ded0xta7CKQYi39S0hocM4OOfidmz1G33BB+FaNlt9BvDjhwmOiZzrd4UM6MZI
 M6et1uSz0qVSGp2FJ+M8AAmZGRMK7GadoiaY4CDc9feEB3uGn8VfEdSomonrSD3cGYpv00HKEZl
 7+dfMlIgcQKDIws+2CpnA+pweccGrtE34SvNTJMnTuu3JgsVT7hk4iTq/4ht2/Z4iFwMasHxzcR
 rVaOr/HffsoK1v+vU4txWTiSC1HnBQtHQn80e4FD4CqnBLBwcwV+0P3tplMWIjwxGWGI93Rc5oX
 OyHJLJ22Cz91WF/4sN7CT+DPuq6mSLsg2+jeNkywLZxmGsVPm6bymWbVEehsffQxUEOLQwrvC5k
 bM7Epp1rgzspk50mQolkCbZKI+Mp629+0Ge8hNmVi349ySNx8gv20KSmTVcMAwGuvGkwOCwDuP6
 chzXgaQ9dx2
X-Received: by 2002:a05:600c:19ca:b0:4a1:7e76:d02f with SMTP id
 5b1f17b1804b1-4a18e4ac650mr436698005e9.14.1792143691853; 
 Fri, 16 Oct 2026 02:41:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:8f73:128f:8f43:e3ec])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1cf05009csm28649385e9.10.2026.10.16.02.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 02:41:31 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Date: Fri, 16 Oct 2026 10:40:52 +0100
Subject: [PATCH 2/2] hw/arm/sbsa-ref.c: Increase SMMU space for Root registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-jmac-smmu-root-registers-v1-2-e78e8879d347@linaro.org>
References: <20261016-jmac-smmu-root-registers-v1-0-e78e8879d347@linaro.org>
In-Reply-To: <20261016-jmac-smmu-root-registers-v1-0-e78e8879d347@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.17-dev-6be7c
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wm1-x32e.google.com
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

In our implementation, SMMU Root registers are directly after the
non-optional SMMU registers. Realms registers will be added above the
root registers later.

Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
 hw/arm/sbsa-ref.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 158b461eb4..0747f5ca9f 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -129,7 +129,7 @@ static const MemMapEntry sbsa_ref_memmap[] = {
     [SBSA_GPIO] =               { 0x60020000, 0x00001000 },
     [SBSA_SECURE_UART] =        { 0x60030000, 0x00001000 },
     [SBSA_SECURE_UART_MM] =     { 0x60040000, 0x00001000 },
-    [SBSA_SMMU] =               { 0x60050000, 0x00020000 },
+    [SBSA_SMMU] =               { 0x60050000, 0x00040000 },
     /* Space here reserved for more SMMUs */
     [SBSA_AHCI] =               { 0x60100000, 0x00010000 },
     [SBSA_XHCI] =               { 0x60110000, 0x00010000 },

-- 
2.43.0


