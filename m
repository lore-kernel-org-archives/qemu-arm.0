Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B370CCAC599
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Sep 2025 11:42:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uyU4F-0008Kt-Bu; Tue, 16 Sep 2025 07:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uyU4D-0008KB-8s
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 07:41:50 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uyU43-0003N6-TG
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 07:41:49 -0400
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-ea3e0b4a98aso2926219276.1
 for <qemu-arm@nongnu.org>; Tue, 16 Sep 2025 04:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758022896; x=1758627696; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=r1vRkHG3XPxQYR5TC9t05+Hh0Ojf9SICD0yuubEt+7k=;
 b=v8BtyWPDVFtqXLGbXqf5etzZk13jK+vpNh8J1dI4nGS32JvU0mQvPpNYAu63D39EcA
 SlnT825vPGqyi6bJYXeaE3Yt6r350aMCIXSFIcbMl98SlVqqC1JZMb7S4ljRCWdRB78P
 zyFG1yc2fQZbVFpdQZX/CEfoVruOK1vrbpmrqRaellECb2n7rf+JkTc/3yTccY+BbaR5
 KOSV2ZwmK+te2V/ttK93OyRCkzEWikgJFFrnbwOlVGKDOGeGYPyBLoPrtqNvoRVpaCx0
 /rE5k3f8FLbN8wFRWv4+9l7dabYilySJCix2RF/Qlye8pjC7RYfzL8/KSsgXHjZhHo5j
 1tDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758022896; x=1758627696;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r1vRkHG3XPxQYR5TC9t05+Hh0Ojf9SICD0yuubEt+7k=;
 b=jVd1AzJxKASOlldWdTs9yRapOSwJEatTmJk6eIq6Om9ZlWGkusW3/7DkF5jB9qkfPe
 BDE2ELRPngl/m0hVVPFt2rCd7nn4PdyCBXjp+hN403jjdhJR2PbyHCNRqMBWfAdo0Srh
 aPivqHFlYn2gODRAhHooW4aZdbG0CV/GpuC1ixMoPx8onRZdNBZ2LbtapywNMpi74Lzx
 mriun/BeweyC80uXoEhn7Be9P3BLmJZs3Tp6MARwFDiPR89f7rcCSmAVNHD2BwZ0vN9E
 ZCQrUPYN9nodzg7ZL7LJNZTEYx41s6oqkVHk+nWjcqtpGYEQPloolgaoDzOKkub5xuWc
 UXjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwqpK7EAmvtgNcygAtUaSRlfin/5PmL1s4CDQn5ucH+y+NiPfKZ6yE/QwLqTYNtidzKvBvX2W3xA==@nongnu.org
X-Gm-Message-State: AOJu0YwFYRsWIUlCCVXX6kV6Q/WVGZaRWCeesPoVHhypD0IiY7V57g2V
 issZ4LieXbK/zXJkaFY7eoi3faHEuizzII3giFWwqMQ5lM64Xn6rDQGdEIt/yKMFJ5pOj7NAb20
 qtOJ5Xe4LRjZESpRUbmD8FsS7mCqOmt+lsYr1gjpdoQ==
X-Gm-Gg: ASbGnctO88jkV9q9cnRu0cnvQ9ZDAp7NJgmpaLaVDdDEnaSBmnygcBx1uZpbcG4vGO9
 +yE13P/zmquT55CL/2CicA8LAHuKTH7KL9XX3lg8avmZzcA6UGThoawNwIpKUI72Vpxwy0RzZF+
 xqbL7F7tbzZcHiCWWpNcwdaUMBX7/tysoech7mJwrfoRnEsvog5tJT/owY3SQxLalyU4hg333M7
 RRnYu6H
X-Google-Smtp-Source: AGHT+IFkijY+U0whVyTBmw6irnpS1KNJtzTmIXCWTH5ZkrPg50cqCtb5XjiXA44OTS6b7ANd3vR5WUzcErFLasZXrLo=
X-Received: by 2002:a53:b987:0:b0:633:a090:c0a8 with SMTP id
 956f58d0204a3-633a090c493mr1727968d50.22.1758022896042; Tue, 16 Sep 2025
 04:41:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250225163031.1409078-1-kraxel@redhat.com>
 <20250225163031.1409078-25-kraxel@redhat.com>
In-Reply-To: <20250225163031.1409078-25-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Sep 2025 12:41:24 +0100
X-Gm-Features: Ac12FXwhFnCrg2PfmE6Sm48wCtS0lCqDCZzT4EjB2TI9Uezn-yNTkxm76WjNCsM
Message-ID: <CAFEAcA_MUnTbQNiCLv_HjucNZxC3NyS_0_1VQBcz5RRdtqoS9Q@mail.gmail.com>
Subject: Re: [PATCH v5 24/24] docs: add uefi variable service documentation
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-arm@nongnu.org, Ard Biesheuvel <ardb@kernel.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, graf@amazon.com, 
 Eric Blake <eblake@redhat.com>, Michael Roth <michael.roth@amd.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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

On Tue, 25 Feb 2025 at 16:31, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  docs/devel/index-internals.rst |  1 +
>  docs/devel/uefi-vars.rst       | 68 ++++++++++++++++++++++++++++++++++
>  hw/uefi/LIMITATIONS.md         |  7 ++++
>  3 files changed, 76 insertions(+)
>  create mode 100644 docs/devel/uefi-vars.rst
>  create mode 100644 hw/uefi/LIMITATIONS.md

> +The ``uefi-vars`` device implements the UEFI virtual device.  It comes
> +in ``uefi-vars-x86`` and ``uefi-vars-sysbus`` flavours.

Hi; a bug reporter points out that this documentation says
the device name is uefi-vars-x86, but the code does

#define TYPE_UEFI_VARS_X64       "uefi-vars-x64"

https://gitlab.com/qemu-project/qemu/-/issues/3106

I guess we need to update the docs?

> +The advantage of the approach is that we do not need a special
> +privilege level for the firmware to protect itself, i.e. it does not
> +depend on SMM emulation on x64

Our name for the 64-bit intel architecture is "x86_64"; we
should use that consistently, not "x64". (Ideally we would
also have been consistent in the device name, but it's been
released now...)

thanks
-- PMM

