Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7266AF4BB67
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Feb 2026 17:38:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuwM2-0007B6-0z; Tue, 24 Feb 2026 12:37:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuwLy-00075k-Cp
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 12:37:48 -0500
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuwLw-0003qa-ED
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 12:37:46 -0500
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-64ca6595c8aso268015d50.0
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 09:37:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771954663; cv=none;
 d=google.com; s=arc-20240605;
 b=buZjKlwCuMqTZun5HQWpWPCWcpGVvGLdskAN1FzYqScfipiUDsTdAKUdATxw/azjzJ
 qAK3vjmWCFCwOa0skuUKW6kGC5aPuhO+jlRPwVcU7J5ZInu5K/T+K+OwN740DNCtgd4K
 aGFEkf2ypDxxWE9w19oZwz18p8mJtw+59XtrYg5REWgc0aHmkUwUxzKto/I4+3nNM1V4
 0ZyLKbwF6XWjmYcGarcJRAjz3UV+u24Zzf3oF8YTsMVZzaUv5hpyg8t1StA4gFabYUWr
 0uz0yGmUfA++FAoHB5iYdwdNBmux0nehzEMMcgP0griQAjRlWxOc4iH+UPtNiexJmVXf
 7ikg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Tdh36pSD+tLfnMZN3vf5DS5AcaUa9J8WbbRp77AylTg=;
 fh=u+tdDXjzZnPT8FH2vzpGJddHnMcTNCYzlPw0Spt2g5Q=;
 b=RkGehFbYSB4njev5B3qr3KtaGIl0PxlI2jPl0DxcBMWFkeOpmrXb7IgCfRU1NlTGeo
 t2qnEWVWUPYo23As8SElI4n32K1yyi+AiIjeB1rGFC3p3F6cBeFS7LwzW+YKf82Q1SmF
 UZCCA1ToMZVtyoNWJKirYmdg2CqFcVp5Y6G2qqQO7Ts5AYPtnTgJMuCfJ5+XSjno8giw
 xVSXw8pnNtoRb3coStupKTH8tga4CZiZ5X7rIGmn2H9UbR35O+01Oh/q97DTnRzG6+df
 wtbeo4rEohgE6FDlOTjyLOjAjt/UHdCuDBx8DkwImQsSxUdEcvtOdjS8r8sMc2gfK1ct
 A0Jg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771954663; x=1772559463; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tdh36pSD+tLfnMZN3vf5DS5AcaUa9J8WbbRp77AylTg=;
 b=UV9SIGjdAjBAkZ4qmnOk8rbpvq2rjkkkCJVUBKPsCDMa0A7v4l7aKMN7ZGZ4b3dhdt
 6lCmYFuULI0xLHBq2gJQ5aJT88N5csVXUSBtR3/kpRis9zS3aqqMuUmfAJHun0/TJ7nt
 e4MYtN3+rUh/T07pD/bhDqNO/FPoSbVgTRcSxN4LJH19ab5aRmOgqQzFUO1pD3fXLd1w
 Nb9FZYIIw+wNGhl3qphUHQ5FDA1MqZBrAd1xLzI3PUJUsmotbGFMltqZEB4pU9qGWe2U
 JypgkhSQmlrGOOGBiRu4bumw+LzS8MWIts13AdtT1Y889JfiCl5nAucW7pVMDnCrIXU+
 2COA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771954663; x=1772559463;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Tdh36pSD+tLfnMZN3vf5DS5AcaUa9J8WbbRp77AylTg=;
 b=mUdUwIuX0JKULDzB8ynunln7JYq/KyvigB7WmePbZfJHMdszt3B6TZfKrVb99RqlN9
 HesCKR4BRbbguhrt6SXRm36MvF34OWpoXy2r7iSpHvE2U3OMPc3+rk7MIP4vLiPe/31S
 z77gWQxHqYrGmWnu2vQglxWGTxMbQC3p2pADSYoktSnfHnoVK0wGYacxKhXyMY3TAIPr
 EfoRkVamHQjplBRGXHOaBYfzcQ/p25sW2KFtLe6b5IRQLFeWrp+wyT0rsZ2LEhaS8UAr
 NZ/w5FiHRftgfR3mXzSArKZUpZbxGOuNfIVpSwt539Kk3ot/ZTSqgoMn2b+spCTsZxwW
 KHIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIqwTRyHgkQuGwzVtWxI7HbuiIVOSwO/B8PUtcDdnRIR9BGflgcAQVEqMJIbtIBDNN8ZILjjGlVw==@nongnu.org
X-Gm-Message-State: AOJu0Yz/9oXCKvnqcVgmuIWKLdS0v3d45U0rYjrYL9u4zp3RghYAEZpl
 CiOKrRHyPjF/xUm+VoR8crc12dqZ2LGHOKf/xiW2JzHYPbeX1ybkjEn6gITHf6tUOht4RpQyXic
 Zl1VS9Wv3/c/5XKMnl3ar1LmdjlfZ5tNiWq6J7Mw1gA==
X-Gm-Gg: ATEYQzy3gVxOkK6hnknxs/PaMTkk5M2dByzgL3FnUP9+2Me51cHbkmWdi5E5B1CG2KQ
 1ax5nUhxYEu1zPOVwjrv/zVBRxcQtv3ofpWX2LjSh/QrHXERrlVkrK6AYPcwvyp04nklzRuaPXG
 KF6NBkW+VqjsetWIDfIIIKLMIi/1CUx2eYZrZlC5pQvABsTL0F3NPE0Rp4A5F5iKAdJyEZfWgD8
 xPprp9XOmN8X4N4FCX8z0cFVIao+SsojeNxeKnMJqZOj/PA0hO1dqktO0ItPLSGeU52csqC86vk
 op7GLnwh9U7fzlGt9oz+hNt78m9suWPiwvktruieIF9O5q+XEB7Kl8Y1uYyyDTqLO+uV6LbHVy2
 wKQ==
X-Received: by 2002:a05:690e:d4c:b0:64a:ced1:4fa6 with SMTP id
 956f58d0204a3-64c788d282cmr9683307d50.12.1771954663283; Tue, 24 Feb 2026
 09:37:43 -0800 (PST)
MIME-Version: 1.0
References: <20260219171810.602667-1-alex.bennee@linaro.org>
 <20260219171810.602667-4-alex.bennee@linaro.org>
In-Reply-To: <20260219171810.602667-4-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Feb 2026 17:37:31 +0000
X-Gm-Features: AaiRm51OBLSPJe1_nI5Tcc3wkfFFTGvqTYeKCQ4XRDuIx756xp6sVyNLXUQUg_s
Message-ID: <CAFEAcA_gi319MwW8pV0doMxpvKx6H4pCeMA=0vmFm8ynyWP5Uw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 03/14] hw/m68k: transition virt machine to
 multi-phase reset
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Yoshinori Sato <yoshinori.sato@nifty.com>,
 qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <huth@tuxfamily.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 Aurelien Jarno <aurelien@aurel32.net>, Jim MacArthur <jim.macarthur@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Bastian Koppelmann <kbastian@rumtueddeln.de>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Aleksandar Rikalo <arikalo@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Zhao Liu <zhao1.liu@intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Yanan Wang <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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

On Thu, 19 Feb 2026 at 17:18, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> We don't need to re-create the architectural reset behaviour now it is
> handled in the core m68k CPU reset code. We do however need to add
> support for direct kernel booting so we stash that value in
> env->direct_kernel_boot_pc and enhance m68k_cpu_reset_exit() to use it
> if set.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---
> v2
>   - re-write to use proper 3-phase logic, so dropped all tags
>   - favour cpu_reset over resettable_reset(cs)

The commit message says it's doing three-phase reset, but
the actual code is not:

> +static void virt_machine_reset(MachineState *ms, ResetType type)
> +{
> +    CPUState *cs =3D first_cpu;
> +
> +    qemu_devices_reset(type);
> +    cpu_reset(cs);

This first resets the whole system (going through its
three phases) and then the CPU (which does its phases
separately). Three-phase support would imply having the
CPU do its enter phase at the same time as the other devices,
its hold phase with the others, and so on.

If you wanted that you could do it by using
qemu_register_resettable(OBJECT(cpu)) instead of having
a MachineClass::reset method, given that the only two
things you're doing in it are the default thing and a
cpu_reset() call.

> @@ -315,6 +300,7 @@ static void virt_machine_class_init(ObjectClass *oc, =
const void *data)
>      MachineClass *mc =3D MACHINE_CLASS(oc);
>      mc->desc =3D "QEMU M68K Virtual Machine";
>      mc->init =3D virt_init;
> +    mc->reset =3D virt_machine_reset;
>      mc->default_cpu_type =3D M68K_CPU_TYPE_NAME("m68040");
>      mc->max_cpus =3D 1;
>      mc->no_floppy =3D 1;

I did have a plan to look at making MachineClass a subset of
Device so that it could be three-phase-reset aware rather than
having its own special-snowflake reset method.

thanks
-- PMM

