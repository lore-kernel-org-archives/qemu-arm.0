Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C14E9A05F
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 20:41:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vtApg-000624-Id; Thu, 19 Feb 2026 15:41:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1vtApe-00061T-TL
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 15:41:06 -0500
Received: from mail-wm1-f54.google.com ([209.85.128.54])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1vtApc-0005gH-Hk
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 15:41:06 -0500
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4806f3fc50bso15503075e9.0
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 12:41:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771533663; x=1772138463;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lpCJ4yK0EhxXrpfAUy/1yE7iDOO5l0g6PAD+CZYQJ64=;
 b=VMmu7DjQFB4wWsZ76mUqyFuDhCwUBXwcCY0l51+s0JAHB2EQe9KjWD3tb1luaoUZdl
 eQ2PusE5/vGZm5vYdDQ9wB6Ka3te8lq+s0zNIgBSKYYCH7b1OM9O7qv2tMFLKYFrq2Rk
 8xobW036hbci0igAydVMNvUI/yF6rJLlBVLptOTgbfwC2REcTCcK3LxspFGHq69iLU6o
 v+pHnAzeLCJLZ8lG+kfcbYJv0sKsMAZqJm93nDQEI0KzRPwJe2Oy9P1bWeN0700AJPFZ
 RsI32Wq0gCXL91HYLAMWoMORvcUrY1ICjufCyCIZ/uEziftGEHBn7hqYf1cJ0nXmKV63
 w8Ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJllXM9q2l58U2BXFVjZ84kOvn9kTAi3lSFGSqiqL3OaVUkTRJwU8DwbcSxhQT538KKX5rh65keg==@nongnu.org
X-Gm-Message-State: AOJu0YyJNa13qDONjkIHYCFy70cO8d/Ux1ty8bmtGiAQUB/cDubGNrRz
 pSI1Yn6mN2ZcKtX+uVOKGhXnd1arqe1rNgtVH9Tu2IEKUOV6o4gCz9AB
X-Gm-Gg: AZuq6aLk84KkSq1n00pRJDIfT/PrgSNbmxIJqCyJTy+hAUg6Zz8isNtEqIeNcPslzJe
 +5z+le6y9jl4F8b3HYC1cnG4HAUVP6swnLc83pXSxgy68DlbKmeiw2REJzrWHnqX5QOyMGKTX1T
 rnFAERfeYGiFFP/fCa5lMI0hzJZ8ltzszFV3CwQLHhmvMph1PSGMS3ZwRy9oWxOKU+FrRTN8Rcn
 3uR5y8vrjjoWfCkE9qL0q7MjrfDyw5oR6UthTCDax8eiY6lt2cfELmqT8VTffE6ilbj6btGVEPw
 7nGBcW/N7wwMgiYEiH/10mT95j3J5VsQHsI08HmJwlIYg2pKNB2Gzw6gZw9hX2nan9hdivq3LJH
 bPrdShy5N6B1KzfrgxGjzTRUUg9JY5KiDnvNNcieUkVipXwQ7hHvlA5NUNQshUxXTcvBhyuyBNH
 NSrMAly8bpTbI=
X-Received: by 2002:a05:600c:8b61:b0:480:1b65:b744 with SMTP id
 5b1f17b1804b1-48379bf7907mr293190815e9.28.1771533662760; 
 Thu, 19 Feb 2026 12:41:02 -0800 (PST)
Received: from tpx1 ([47.64.113.117]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31c54bbsm26708005e9.9.2026.02.19.12.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 12:41:02 -0800 (PST)
Date: Thu, 19 Feb 2026 21:41:00 +0100
From: Thomas Huth <huth@tuxfamily.org>
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Yoshinori Sato <yoshinori.sato@nifty.com>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Aurelien Jarno <aurelien@aurel32.net>, Jim MacArthur
 <jim.macarthur@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, Peter
 Maydell <peter.maydell@linaro.org>, Bastian Koppelmann
 <kbastian@rumtueddeln.de>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, Aleksandar Rikalo <arikalo@gmail.com>, Richard
 Henderson <richard.henderson@linaro.org>, Zhao Liu <zhao1.liu@intel.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v2 02/14] target/m68k: initialise pc/sp vector
 during reset
Message-ID: <20260219214100.07991ef8@tpx1>
In-Reply-To: <20260219171810.602667-3-alex.bennee@linaro.org>
References: <20260219171810.602667-1-alex.bennee@linaro.org>
 <20260219171810.602667-3-alex.bennee@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.128.54; envelope-from=th.huth@gmail.com;
 helo=mail-wm1-f54.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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

Am Thu, 19 Feb 2026 17:17:58 +0000
schrieb Alex Benn=C3=A9e <alex.bennee@linaro.org>:

> All 68k chips should be able to follow the architectural behaviour on
> reset which is to load the initial sp/pc from the first 8 bytes of the
> address space.
>=20
> To avoid any potential issues with un-reset memory controllers we
> punt the final setting of the register to the exit phase when
> everything else is guaranteed to have been through the hold phase.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  target/m68k/cpu.c | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)

Reviewed-by: Thomas Huth <huth@tuxfamily.org>

