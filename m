Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CB3D277CE
	for <qemu-arm@archiver.kernel.org>; Sat, 10 Jan 2026 05:54:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1veRv9-0001hf-3e; Sat, 10 Jan 2026 00:53:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1veRv8-0001hM-0G
 for qemu-arm@nongnu.org; Sat, 10 Jan 2026 00:53:54 -0500
Received: from mail-ej1-f41.google.com ([209.85.218.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1veRv6-0004YT-Et
 for qemu-arm@nongnu.org; Sat, 10 Jan 2026 00:53:53 -0500
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b7277324204so763108666b.0
 for <qemu-arm@nongnu.org>; Fri, 09 Jan 2026 21:53:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768024427; x=1768629227;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mT5azy9eTop/x7ps35SVvRiOgyNftOAc/6RiwumWPCE=;
 b=kcDE96GHafGkli4eVJF3nSuotro4ufVGwfTfXFjXnzmIBdbYfG/ZF42BpswSlK6MCU
 XnEpMgIKgTMFJRg09qXxFuQgSWfNl8NmFwotEVA1mKdR6i16E3t8n1FWGr9YGK6Lwi6S
 /L8MCo/iv0BTXUlAtZuAVHv4yakUTjr7bFqmobYKeEvESAgj68GMmiOD4kRfsvOOQvy0
 FuLdIOTcqDGxpI81sHjmOYFTQnUDV/GqI5Dhbu6gNtux/79RWiBP7PL1L80qOGhIk+pj
 IJo6AHDYl1UJ4wR2RP8/REd0rW14Of8d8CRy1z8irdeQGz9WM4L0acF2FAPF0Q9RYV7o
 ykRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXPNKVDGP7DqU1lvSkKYXhLjchMW6seSV0cyr4ms2gVidLv0bi8ifNweRC00j10X0UTDngIXIFZQ==@nongnu.org
X-Gm-Message-State: AOJu0YwLiT5ljgS7MtvNbmcPmsd8EzLs1cq1Zv+FzoJNLjPGP5bEXn/4
 tAEDuTxwoHq4MyRroHZGWnGDEI//6CuwJ/YflTKXhtVRo6Mnc42mMDyS
X-Gm-Gg: AY/fxX4p7h9yUx3okxVzQoNQTuhUQ0UrljmFxISppZuvCmrumvt84LOeW7UTpk71VCg
 L1m04GgcpYNo7g2bg4D9apG7uK5IFx/3Dk8mRo+bs3wY+FkDUJFeT/vuiv+ZTuEdnc9FDe7hpX2
 FjiJTZ70enRLQxnlmC3cIYVGiT0eKU2vsMmv2s2dXguwSNE1Y9RAHbUGWpFegryEJvH5D3/403t
 a5dG/Aw/3NKoMK9yNaWtAV6dtmsdGuBerFzaXyyyJGGXrqWC0K1KQmEby/58gTeG3gPm19tziFZ
 3Zyf6C8SOr6SZIIeCGI4NbY5+zY/hReQ2IMeWt8EAT9JhJWj4hG5VFf2C8Z5vZfBh5ejagYDl98
 0zWSVq+qRLKI5AuEBgQjbKvXKGg2IiJfYLgnhK6MP4Rabv8hBwQOrr1fI56zY1/FrCSNYTH6BGO
 VA64RbDW35rA==
X-Google-Smtp-Source: AGHT+IFNSU24NwRSUvhOOLY242Wlu8YeoO8mPHa37E/9wpqhULSpbwfskqGtXXXW59JnEjJTKRRaIA==
X-Received: by 2002:a17:907:2da6:b0:b72:134a:48c8 with SMTP id
 a640c23a62f3a-b8445232b14mr1158177266b.14.1768024426785; 
 Fri, 09 Jan 2026 21:53:46 -0800 (PST)
Received: from tpx1 ([47.64.114.194]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b86f61d2774sm72212966b.41.2026.01.09.21.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 21:53:46 -0800 (PST)
Date: Sat, 10 Jan 2026 06:53:44 +0100
From: Thomas Huth <huth@tuxfamily.org>
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>, Jiaxun
 Yang <jiaxun.yang@flygoat.com>, Bastian Koppelmann
 <kbastian@rumtueddeln.de>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVk?=
 =?UTF-8?B?w6k=?= <philmd@linaro.org>, qemu-arm@nongnu.org, Yoshinori Sato
 <yoshinori.sato@nifty.com>, Yanan Wang <wangyanan55@huawei.com>, Aleksandar
 Rikalo <arikalo@gmail.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [RFC PATCH 07/12] target/m68k: drop cpu_reset on realizefn
Message-ID: <20260110065344.783237f3@tpx1>
In-Reply-To: <20260108143423.1378674-8-alex.bennee@linaro.org>
References: <20260108143423.1378674-1-alex.bennee@linaro.org>
 <20260108143423.1378674-8-alex.bennee@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.218.41; envelope-from=th.huth@gmail.com;
 helo=mail-ej1-f41.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

Am Thu,  8 Jan 2026 14:34:18 +0000
schrieb Alex Benn=C3=A9e <alex.bennee@linaro.org>:

> Now all the m68k machines have cpu reset handlers we can drop this
> extra case here.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  target/m68k/cpu.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
> index f1b673119d6..a540a754969 100644
> --- a/target/m68k/cpu.c
> +++ b/target/m68k/cpu.c
> @@ -392,7 +392,6 @@ static void m68k_cpu_realizefn(DeviceState *dev, Erro=
r **errp)
> =20
>      m68k_cpu_init_gdb(cpu);
> =20
> -    cpu_reset(cs);
>      qemu_init_vcpu(cs);
> =20
>      mcc->parent_realize(dev, errp);

Reviewed-by: Thomas Huth <huth@tuxfamily.org>

