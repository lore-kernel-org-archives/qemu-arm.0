Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BAB1CD8C92
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Jun 2026 09:25:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWWDv-0002TP-B6; Mon, 08 Jun 2026 05:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWWDr-0002Sm-NL
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 05:24:44 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWWDp-0007No-VZ
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 05:24:43 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-6606678420bso4119241d50.1
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2026 02:24:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780910680; cv=none;
 d=google.com; s=arc-20240605;
 b=b15Jj6xYewlOpGLgcnKAzF3cdnpW9Xla6FPfwSQeYw8rAFvjmxaSCQgxlTjnRndlwQ
 RjpATLPwNlJVrRpHmPoDLX3FC9Rej9vIA8jp/0YerAO0GLI/MIZs13hIUULAyn3Rs4xH
 eb5q9MAvY1PL/k+ltoFNSEBnM9J0LKPg/aKN5KzHTrU1SAHccL3IKQ3c7Sb89cg0pRzN
 uuxywX2QX+DAny+07fvCyhUIyNlCHtUgl1z25TYQriJWwelAtprkvktR6h0c2Zobw688
 fZI99+h5niELqQYfJf6Dms4JqMCBjyhlU4tWbCPoyVN4cpvHfs7rr5KIE4tGtCVUq0/y
 GpAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=vPidOw72KGAxsKvn0SeAXzVGd4KUgMOCY/GVTBKBj00=;
 fh=SClF9TiPHRxGPgmN3Q9D4r8nFl5qiDPsh2kFhVz7/JM=;
 b=HM0c7o4vVit+61SruTGbs5Pvt4UC2YjqRaZJmMfi02ckIBxTfaJAvEeVTm6SlhX1+N
 kN1bdTea9byVxfcIz+CHQ+jrW4IXzZuGiOxN7Noz51fOYSv0KbttBR/bNuuB13EQaZzU
 NpypXymUnuOaGqfERigUdZSYTSjg/94IjV0/cy0b3/YqiMGUAiI1YAdWCOP8rJJKywKg
 g5shKHnihQlUa+iHjMKQV1X9/HOlDb9ryuQiNuxrET0rmJSYf2rhjKm55039NYuwXPaP
 bM0EXuseRIAdtELUf//D79sGMZT5ff6LyYrtJV5BDZoZWfAjOFTSpGbGuQjGba6ad5aK
 qV/A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780910680; x=1781515480; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vPidOw72KGAxsKvn0SeAXzVGd4KUgMOCY/GVTBKBj00=;
 b=X3koX8J3/KmEFmnChMsOqIGT4/GsUEwgq9t4VfDywsoo4pvxXJ7H0gXjLE4Oz3bF+n
 FHZjL/fCKUUw0a/dIhOyud+myQJyIPq9dDjtfg1em4hdUhwExUujuzstGmsiEq2mdObn
 ASnLE54EhokCLDsTM3wVWktzdXklp5Yyp1D/7qv15lXVtnxED+GxXnjiIPYKwpXI/8QO
 5IN9zXB25Z+eXJ2LllkATGWy1pqkT+5nv1lV2m6PcGeb6rB8Iry1eF2qZiZgMZ1jk587
 /HGfwJmvJ+TYTuR2zSMGU1LSUZzkXMFLhpKwKnKT0LJWHAuUud0w3ACPDuArF3LKiIlx
 dKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780910680; x=1781515480;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vPidOw72KGAxsKvn0SeAXzVGd4KUgMOCY/GVTBKBj00=;
 b=cyACYj4QWWlTwXdw3gcKfEHWjLj+/KOK7di7YTb9lwCD59UaguyClJYlnzYAH3scAU
 W6e/ULfP4yUZunXqKNn333EG6KTWacoFjAlt8p4kWdhatewaQMB/9cnzldZKPPXxEBJr
 xoXGO1scK233rwjyJrgdbqZDvwCakvEG+edaapvCAAv5fvkpDtMi9ScaDyfEfEaEtIQ3
 V8OJvryVMn+WxPmuGXaolXiDyPwZazz3kuIrS/NZSmXwmoi6+9HqWM6I1EqBfOLKZs7Z
 F7VgC79VaYZO+lx4Rh1dS0hmyAeS5t2NrklIctCy0EM9qJejutkS0dPydfKdC9IG9f+s
 iBEA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+yrXJPam0PUpyOr2jLZuDu9FANOnfYBAV4IoE/di768hQ+5boYFZSd7WgtHqn8U9X8rnX2qpu0jg==@nongnu.org
X-Gm-Message-State: AOJu0YysUZEmeFBsdZ2AP6DRn6c/cBtXirCF6eR2KgscsLCLwn5bv6Hn
 wTgkOGvlAa+QN/XRXc7+Kz3EyViOHOmAm+OkPGh3ytykvknBLLYMDPsWyHBsn0Z/v5gvZYtwdYX
 edMJkvLYkYq1ksiCCCwUPsC70vg15VZmKluEGQM5Xzg==
X-Gm-Gg: Acq92OEr3nzEhcjAdvUHI5k0e+YoJ5/FSkzNUSDVCDN7btKFjRqebcTzMWxAa1Vk1q3
 I0zhXucfDYZvIh0iDTKi6VDb+TGCvud0Vl+2E80P+x2bj+dKkNJmpMUL8YDCQ7up2mtcfbymy1+
 o0iRQKjbpYz+mAr2SVXXI12OJlWAynO8ZYNZ0w1OOkMUD9NM+6uu8JPSi4pdMwKGZEryiqUYfSG
 AYLP4GzUXhKaU6JIPu3Vc3qG9UCyNxqCQm8OBhKbJBDHcGn0O4mHXCiN9n+yL55RydMXVzkrj89
 8thBoLKbfczbNnIwq+kozm82S39vEX78fkLUmf+PCGQISh7wsCtV2IErSw4l14BAMaTbeTtyc9Q
 6DllxvwQDbl3f
X-Received: by 2002:a53:d005:0:b0:660:71c3:aadf with SMTP id
 956f58d0204a3-66106f171e7mr11183960d50.39.1780910679706; Mon, 08 Jun 2026
 02:24:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260521112806.504961-1-kraxel@redhat.com>
 <CAFEAcA8hbObntY8Tp+kOV7btb-io92O9GW99-6SPxigPJUjPrw@mail.gmail.com>
 <aiE5LrpfnJRbkx-A@sirius.home.kraxel.org>
In-Reply-To: <aiE5LrpfnJRbkx-A@sirius.home.kraxel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jun 2026 10:24:28 +0100
X-Gm-Features: AVVi8CdENXUQ5vy8mT0gx7QJrIkh525pM64K1wcDTX4Imtu2W-EYWjQ_XZpwpe0
Message-ID: <CAFEAcA_ow2ro3h0nfhY3jA_XToAnjdVFNPrF25aWLd=X2cnmaw@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/arm: add support for shim loading
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
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

On Thu, 4 Jun 2026 at 10:27, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Thu, May 28, 2026 at 03:28:05PM +0100, Peter Maydell wrote:
> > On Thu, 21 May 2026 at 12:28, Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >
> > > Also little refactoring in preparation
> > > to avoid code duplication.
> > >
> > > Gerd Hoffmann (3):
> > >   hw/nvram: add load_image_to_fw_cfg_file()
> > >   hw/i386: switch shim loading to load_image_to_fw_cfg_file
> > >   hw/arm: add support for shim loading
> >
> > Any chance of some information on what this is?
>
> It passes the shim binary to the efi firmware,
> in addition to the kernel binary.
>
> x86 has this for a while already, this brings arm on par.
>
> docs update with some background below.
>
> take care,
>   Gerd
>
> --- a/docs/system/linuxboot.rst
> +++ b/docs/system/linuxboot.rst
> @@ -17,6 +17,15 @@ Use ``-kernel`` to provide the Linux kernel image and ``-append`` to
>  give the kernel command line arguments. The ``-initrd`` option can be
>  used to provide an INITRD image.
>
> +The ``-shim`` option specifies the shim.efi binary.  This is needed
> +when using direct kernel boot with UEFI secure boot enabled.  The
> +verification chain used by linux distros requires shim.efi.  Typically
> +shim.efi is signed by micsosoft and verified by the firmware.  The
> +linux kernel is signed by the distro and is verified by shim.efi.  So
> +without shim.efi in the loop secure boot verification will not work.
> +Usually you can find shim.efi as ``EFI/BOOT/BOOT{X64,AA64}.EFI`` on
> +distro install media.

Thanks. I'm not sure why you'd want to enable UEFI secure boot
when you're not booting via UEFI, though.

Do we actually run the shim.efi code, or is it just there to
be "verified" ?

-- PMM

