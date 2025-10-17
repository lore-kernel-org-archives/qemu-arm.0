Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC915CCD1A4
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 13:17:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9kE9-0005Uq-8k; Fri, 17 Oct 2025 09:10:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v9kDg-0004XQ-25
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:10:08 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v9kDP-0004fB-2o
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:10:06 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-470ffbf2150so17429225e9.1
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 06:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760706587; x=1761311387; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i9jwimuswCJOfHVj53S93paKIotqSGwUVxc74CBqNFg=;
 b=sg8AYn9m8ovp7nJJzSI/d2X9DuAWJ3Q78qGpjLKT+lto26fmNRHJXCy8SaqymNvDD9
 +ifpYEbHaAjmhnDt6ACyxUT/lww1aFuED6014bSjOlilAZM/V0tbgvRE5Pqr4Qt1LE2t
 kr1uP/ckO89sk+dllZ2CaIF+E2Bxso4gRVwvaPg47HOqXYyvB5fsaq90q/1H0XtUtoMp
 9GKEseSoAByFO6WmyTIjMFP7y8F7z3L5AkshSAVzanDOY1BWm3BY6qTuOiocRA40ghcv
 a4zxLOyUkgH4m2JzMSIACke+TW7I8I71i16XJmbPLNlzfVoZNeumuEm79s/pbrUjHmUT
 Cfkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760706587; x=1761311387;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i9jwimuswCJOfHVj53S93paKIotqSGwUVxc74CBqNFg=;
 b=sbCU8XqBoZiehcAYj2wApV1uLZoRfl/HqoKygt6Fl6O9FYYRLKbGRRCHBfuKMikKLW
 PDgcq3n+nFE01rNEm4mPgST6rmRL/YUGIdFQFENeWXHrX6Pkfes44FxrFcQmCG1kUyo2
 cRj3n/UFP4RG8tsLtc1tg/xNW8Fb/CmcMCp+685Pa6MrDoU6oUWtn5fwh1yMNdn+QMHV
 8Jopp8D+EkqWgxBaZQegRS56QqVjFn+0xpuWK14ImeI2clypKQE0zUHcj9OKwuUAAcI+
 qxCxoR/2SSUtwPKZ0maxaFgAPEdhEkhOqDfGtmivfxuCNdD+XBfjlU2vGwvNV0gDKeCF
 oSFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvy6ghUU2nmQRbgmOYfc+1G13gn757Rrlx6+SYpJhJ4DfHLb1c99SBOkAVrkCXVTFz7Ve6rUlngw==@nongnu.org
X-Gm-Message-State: AOJu0YxYgSW9APqKQlrIzcuNBFP3PZJhRsRZDxB1jp4h0dWtBvq1BrbZ
 Av12f5iOMpbYhBTu23KlkFmjognMXon4zK1pTUB8I5IMSNSuper6ZPjEN+aEgqWOtyc=
X-Gm-Gg: ASbGncs3Rt8YHzvt2as3gWENkRgf3Ob1qwHrPsv7Bl9vD3fVzo18cqXeU7mGCKoOlVz
 fjb44sETDPSS7Pe3SezQH0LAa36j6s6No5AZIOBWS8UY5olVCu2ccmCUez6r9sY1mXuo0aFLXV6
 peBs9nI0IloIZClw4laS40uOn8YOGhkzsKG5eucQj/gRMoLP45w9Pwo9TUmBNcPeXAddNsE7xyg
 X3v3tJEyHu6E96wrgMPnow4UoQYVO/ligCCQV90ckXZjc/gwz5G05V8k6meGiRIfF78Lxq/4Y67
 pp2eOEJAfw3cxNovzFaRIN9wMqkG+BNODt1ue743AwkzsKtinTq7d5bCndU+hRVChweodi1jTj6
 58yVb/p6u26ieVggA0g6VMyI5Rbeno/I/fHzPH6IzE3+hYixzyIWnYHQow8lkC2aJhgkkMVjQEe
 0G01KR3OVhcrroi+twz+nSqoN5rGZSAEUPG1kUQxowCpOkQ+tUyQ==
X-Google-Smtp-Source: AGHT+IHKf+HcKG+LKZBmy/HAKb+DDrZfqCNI6AIIv59fVkhu5r51SbYonKP6tk82eDYmrVXEyUAWfA==
X-Received: by 2002:a05:6000:40dc:b0:414:fb6c:e369 with SMTP id
 ffacd0b85a97d-42704b3db2dmr2572248f8f.5.1760706586721; 
 Fri, 17 Oct 2025 06:09:46 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4270a62427csm650576f8f.30.2025.10.17.06.09.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 17 Oct 2025 06:09:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-arm@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 17/20] hw/arm/virt: Remove deprecated virt-7.0 machine
Date: Fri, 17 Oct 2025 15:08:16 +0200
Message-ID: <20251017130821.58388-18-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017130821.58388-1-philmd@linaro.org>
References: <20251017130821.58388-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

This machine has been supported for a period of more than 6 years.
According to our versioned machine support policy (see commit
ce80c4fa6ff "docs: document special exception for machine type
deprecation & removal") it can now be removed.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index eb0e0e1bee3..7218badc8c7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3597,10 +3597,3 @@ static void virt_machine_7_1_options(MachineClass *mc)
     vmc->no_highmem_compact = true;
 }
 DEFINE_VIRT_MACHINE(7, 1)
-
-static void virt_machine_7_0_options(MachineClass *mc)
-{
-    virt_machine_7_1_options(mc);
-    compat_props_add(mc->compat_props, hw_compat_7_0, hw_compat_7_0_len);
-}
-DEFINE_VIRT_MACHINE(7, 0)
-- 
2.51.0


