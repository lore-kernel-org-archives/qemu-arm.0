Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F75EC561E6
	for <qemu-arm@archiver.kernel.org>; Wed,  5 Aug 2026 15:32:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wrdZf-0005qw-Mz; Wed, 05 Aug 2026 11:30:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1wrdZU-0005nn-LC
 for qemu-arm@nongnu.org; Wed, 05 Aug 2026 11:30:21 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1wrdZR-0007dK-Nk
 for qemu-arm@nongnu.org; Wed, 05 Aug 2026 11:30:19 -0400
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-4955cd5da3dso434374b6e.2
 for <qemu-arm@nongnu.org>; Wed, 05 Aug 2026 08:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785943814; x=1786548614; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PoXfMDRAQIj+y4/BPWtH1Tl3SZCP6UaSej1RFcIEr2g=;
 b=POHWM1ewxHIkMhmxdfM22pg2ttz9Ev9AfgMMQUhQIcl7XJMSmMSNM7LJymWjQbCZTX
 o2b1dCWY5JUrPACdC2aLHw8wc7HtkOoenaPKsGkXIMYi9YEg3dBJqb4P+yH7rQc8u7yK
 Lg8C2lEQsJFZatl5INmaKmCPcyQMHe0FpK/TteAVA0dGNJEH7nZwWDWt8NIowAhaMOhM
 1GLeJE9uG6TPTjOsaRkxYE27AQhuY55Nh4g0Eh3N9G7CcDanRUc5U+QgF0Ge+T5zNS65
 IHCk3M5m9kIIgaCMA2PzcfWKnuqGImadSYd7bSWqI0LgRqBmcxW9jWrvgPcRXYQ0LucN
 p8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785943814; x=1786548614;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=PoXfMDRAQIj+y4/BPWtH1Tl3SZCP6UaSej1RFcIEr2g=;
 b=kEzuJlqqgCALTM5fVRO/KoClWXPSgB6M/hqJiRA0WOveTNfDKgVwURTDV5nrkp6URh
 aFlZZGne2wUHT8UyQ6+KZ1mhHFsY/TWgDzL8tfWcTUHmYMJiquI+px3F43wqmMly/Z4C
 ToAfbIiCM5BGpxW84ruHJiqCa0uN/maoSHB5dR1Y3ldE48cV5MSY/aR55XrTP9US0uPu
 xp37p03bDCEQvNv4TtJsoHiwKFmgbD0XXpEQXanNUPNoXWmZl7RQSthtl3uK3LWlkxII
 zxpoTPFNoMufrp01gaf3/VWg6O2mP5qlZkLa8+gxM9YQamNVINwYCxH8oOFR1YcjXqmz
 Iypw==
X-Gm-Message-State: AOJu0Yyp+Re4EHRQDv399rWaOMUTKbUhlH+FIejW0+qLO9dNxueya2wG
 +wOI32+h7lrzvk4E4c22vasFCpRkRgZeyagvN/CMQUaiPz++j1WqCP0y
X-Gm-Gg: AR+sD12atQRNTg1IfCb0D9gE7Lcnn+Fs9MdyReZ/ETuXoHNgQisDC5mJ8MTax8/6JJa
 0Bnm+jjteSkvZH4S//YtJYY8bBIhKjVO6ZjbT3GKkcpsq3OYLOmz6tqFQ7saZPPnhnn7zGRurLl
 iA7L/CbHh+YsRSzE0NUq6SB1tILH/8M0KN5TtZN9jrnKSy+J3RsnmZN9thOpyy8NCK91jC1EvU7
 EW4MR25ML6M0XyDoPYeOv0NiKUPF6rk8eEjsGJzBSOBGiBqw5j9decZwh/hToVUlUp4APgfcE7h
 xA+cKbOvOWm4OmCG7XoSUX1XyRKJO6tp/QCHUjdCENcNzfWkdyy6pjKudTb6kT4dEL/a5GuXyl4
 ERUYgictdp5nb/xbgQh5EOZdTA2/ybOV3urL7Fp04PxvipQ8B/So3u4B9nfybgac5vMj5eiUDlo
 JeB1+VmCfx8gF+MbbFOy+2zbVRE7pdPSRhzSvcpcX2m32we2yw944tPf7hbayre8DjNFxYRZYHZ
 fswF7ki6gNt
X-Received: by 2002:a05:6808:444c:b0:4ab:6662:4e97 with SMTP id
 5614622812f47-4afae1e8f4fmr3995544b6e.16.1785943813687; 
 Wed, 05 Aug 2026 08:30:13 -0700 (PDT)
Received: from HPE-2MQ6131DV6.ams.hpecorp.net ([170.85.99.9])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-4afae75ce1bsm2185614b6e.15.2026.08.05.08.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2026 08:30:12 -0700 (PDT)
From: Simon Xu <simonxhy0404@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Owen Giles <owen.giles@hpe.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Robert Elliott <elliott@hpe.com>, Simon Xu <simonxhy0404@gmail.com>
Subject: [PATCH v2 4/9] hw/misc/iotkit-secctl.c: fix AHB secure read
Date: Wed,  5 Aug 2026 10:30:00 -0500
Message-ID: <20260805153005.9989-5-simonxhy0404@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260805153005.9989-1-simonxhy0404@gmail.com>
References: <20260805153005.9989-1-simonxhy0404@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=simonxhy0404@gmail.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Fix AHB secure privilege to read AHB instead of APB.

Fixes: b3717c23e1c0 ("hw/misc/iotkit-secctl: Add handling for PPCs")
Reviewed-by: Owen Giles <owen.giles@hpe.com>
Reviewed-by: Robert Elliott <elliott@hpe.com>
Signed-off-by: Simon Xu <simonxhy0404@gmail.com>
---
v1 -> v2
	Noticed this bug in the secure read function
---
 hw/misc/iotkit-secctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/iotkit-secctl.c b/hw/misc/iotkit-secctl.c
index 54bfe1ba59..93753c2ced 100644
--- a/hw/misc/iotkit-secctl.c
+++ b/hw/misc/iotkit-secctl.c
@@ -195,7 +195,7 @@ static MemTxResult iotkit_secctl_s_read(void *opaque, hwaddr addr,
     case A_AHBSPPPCEXP1:
     case A_AHBSPPPCEXP2:
     case A_AHBSPPPCEXP3:
-        r = s->apbexp[offset_to_ppc_idx(offset)].sp;
+        r = s->ahbexp[offset_to_ppc_idx(offset)].sp;
         break;
     case A_APBSPPPC0:
     case A_APBSPPPC1:
-- 
2.53.0


