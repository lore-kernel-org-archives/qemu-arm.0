Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368B5CD8C92
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Jun 2026 13:09:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWZin-0004eI-Da; Mon, 08 Jun 2026 09:08:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWZij-0004cT-6o
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 09:08:49 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWZih-0007Rx-LP
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 09:08:48 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-660ea43107fso4148010d50.0
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2026 06:08:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780924126; cv=none;
 d=google.com; s=arc-20240605;
 b=lOWpygmFBy0V8nMJZt9fb/AyH4YiS/sWmFjPa/zjpKZhuJFYdzSBxyqyzrBIOGD6PR
 kzqt7DXRLaKSN6JCSjiNism4pCFO8vlWyik2filaWQ3/xVtK/pecVCWNRdpvb2M4+zLq
 YTipxsEFHMcDSkSavHCIZLh0K75o5U8AYdUPEALfjdCFVnNUSWgIOYGFzTFJK7YvndGS
 Flarl1zh+OIdjNEGmefGBlshPUgB46M6a5736mHygyj9iffSIrVj4yJ6FuwUFUYUpRr2
 b2TEgQRIrzW2m2ueNGzEtoAM9z93nREu/dHjPL8owsWhOqPARXm/umOwUze24T9BkGG9
 XoGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=x/oBKlX15FX/SgQITgQB/o2DRuL+/xg12kYzT10J5q4=;
 fh=WiHQLSDhWrz1lmFYYMSCXeMAfk++VW/gXAN7LjOeLaE=;
 b=TsmoA24yOhbBXlVv2uQOg6DNQAzolLXQe6smFb7YFeRWWas0AmCYaDWhj2QseG2R4m
 agL4zmnZkgcbqtX5IldaLqJcQUz6K4dC7lwRPha3J09B9mFa5z7QF9kVS3NDVOCObzKS
 VXxJ31UH4olfEf4xDyGLjPG3TgwWTlaycoeoMCD+HTawA6ctM/M6Zt/ZE44zxX7sykKe
 rrWjR6DuhzqvuiXGAbBevdQYoswWKQDnpnxBJGm9vZcN5Mms+tr9ZtWbJC02np0H42XU
 wyTi2T8JO26R4PSzWFuuhiqBSh6nAmgXIYVDhFWRsiS+iuxUiicuMbs9o5YLKkcyFRwI
 VaDw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780924126; x=1781528926; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=x/oBKlX15FX/SgQITgQB/o2DRuL+/xg12kYzT10J5q4=;
 b=ranf24ikM0BAjnm3LFGLypwChUx0xGizORABx5YOh+cBJJlo04C3Xg4zTkW5CMJsQK
 PxB4pqMIbaKf4b4F/+tb+0dNDzMgwb4FSBinmCeUxGnPB6Jshn4oCWlzzx+PNp5dDz1z
 RzxtrDXScJoAH5lVLUcQbcyJ9heEoHfQDd0F7/4gOrsZLFXvNjGtUfxkLNVrucKQQKwe
 +cqY89lIpIiAyOQZyFZYJ0N6qD16HAhtn8IM+Q3kyeak3YP5mHOr2L2cXb17SyVWtUE3
 j7gFdKdrYNuhFSAUQW/0wpYJ6typ0GokG/pIxLsjb1FTxcTfCAb6PZKqVRKA3n7OL18Z
 0Kew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780924126; x=1781528926;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x/oBKlX15FX/SgQITgQB/o2DRuL+/xg12kYzT10J5q4=;
 b=sCue6obK7oI73F/XNJKSM8uI0HNY8n+fKPvP1oTuYoYZBNFA3fXKWlqmLxFpx0vwSd
 BGzw0IfSfk3TSqrRsDxzUE76GaHlwTHij4xRK99FnxsIfW1gL9G9b56vFQPi0NURL5F6
 BirWiYnVELe0cwGrOwH4Fin43uOK1yTXC+kpfoqa86bL/zRujHr5COo/uv3wWRV+TvRa
 YGDESFl4hzJIfr6g94nmUw5MIRE5wQNnj3PTzH6Fke7CqzPml2avnFXH+uM+NtP+2OAm
 dME7td0ahrJQA5kvKxoWrpHud3P27MGMZpJ3RpJ3cpZ3TAOh5/t4ACagJYvk0+ALssMu
 6oAQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8ilZ1QZcxKWbxBfxNVLDYf4ndr00MSFyqOBVM0k68GfeZHVsdvBKIOOwBnFAmi65bfpzesCY8kYQ==@nongnu.org
X-Gm-Message-State: AOJu0YxJWeX9WuvpmLIrn17UeAWCGVpmmrODwELRGeoMPfaHiVtv/jWb
 AnRWBwoxun20kDQxfha5BCqgo1RznbrSi0bK9XnvtcTWLGOW5Q4zCsoAJf3vlavXgBib1zW2Gv2
 3k3vapjELpitiUfyQitaTAgYjR0px8xL23/ht+yTiTw==
X-Gm-Gg: Acq92OEmPkvYsTAIR0tP4zWN+SPP94GLljMYJFTz13bIkW7IYAQCxZmfNWCcIXgvI0W
 +mD+ipEhpYwdtReQKxn71JIii4xTvDRGLTuZEm9oO46buWTeHF1x7dMTHR8eTjQAXOyIXN99JR7
 KMvmcizfGeMJzAQGL6fas5+9R3CXHrV2tgR5EkReK7lsN9e5qCckJ3F3gVReyTu7IhaE6PepT/p
 ZPdQ8EIdJoO8UTytUKp4O3P0BAXaxLeRTWMo2TGHGiPvbr4NSyA2XsGG6KMrWZ/ZfO0+xl272Wn
 3/xB0bqzkM7DPiga2peKCF0SYgyCwHBgJ5xQ2cpBrHE/OUb/H89CbqZ1xKxDu+gWt3D0sBX+kE4
 +rw==
X-Received: by 2002:a05:690e:4403:b0:660:5694:9e5c with SMTP id
 956f58d0204a3-66106ff8070mr9173381d50.63.1780924126375; Mon, 08 Jun 2026
 06:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260521112806.504961-1-kraxel@redhat.com>
 <CAFEAcA8hbObntY8Tp+kOV7btb-io92O9GW99-6SPxigPJUjPrw@mail.gmail.com>
 <aiE5LrpfnJRbkx-A@sirius.home.kraxel.org>
 <CAFEAcA_ow2ro3h0nfhY3jA_XToAnjdVFNPrF25aWLd=X2cnmaw@mail.gmail.com>
 <aia8iXGozAclWQCb@sirius.home.kraxel.org>
In-Reply-To: <aia8iXGozAclWQCb@sirius.home.kraxel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jun 2026 14:08:34 +0100
X-Gm-Features: AVVi8CeXy9uosj154vjgCmjpHJhyH-RK93mZXlvitdwuq5ib0V8AjiCggpUYcC8
Message-ID: <CAFEAcA9oB_-ao5C8fGYonE7njUMWLHo5-iETeN_XtnFL4PzyvA@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/arm: add support for shim loading
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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

On Mon, 8 Jun 2026 at 14:03, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Mon, Jun 08, 2026 at 10:24:28AM +0100, Peter Maydell wrote:
> > On Thu, 4 Jun 2026 at 10:27, Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >
> > > On Thu, May 28, 2026 at 03:28:05PM +0100, Peter Maydell wrote:
> > > > On Thu, 21 May 2026 at 12:28, Gerd Hoffmann <kraxel@redhat.com> wrote:
> > > > >
> > > > > Also little refactoring in preparation
> > > > > to avoid code duplication.
> > > > >
> > > > > Gerd Hoffmann (3):
> > > > >   hw/nvram: add load_image_to_fw_cfg_file()
> > > > >   hw/i386: switch shim loading to load_image_to_fw_cfg_file
> > > > >   hw/arm: add support for shim loading
> > > >
> > > > Any chance of some information on what this is?
> > >
> > > It passes the shim binary to the efi firmware,
> > > in addition to the kernel binary.
> > >
> > > x86 has this for a while already, this brings arm on par.
> > >
> > > docs update with some background below.
> > >
> > > take care,
> > >   Gerd
> > >
> > > --- a/docs/system/linuxboot.rst
> > > +++ b/docs/system/linuxboot.rst
> > > @@ -17,6 +17,15 @@ Use ``-kernel`` to provide the Linux kernel image and ``-append`` to
> > >  give the kernel command line arguments. The ``-initrd`` option can be
> > >  used to provide an INITRD image.
> > >
> > > +The ``-shim`` option specifies the shim.efi binary.  This is needed
> > > +when using direct kernel boot with UEFI secure boot enabled.  The
> > > +verification chain used by linux distros requires shim.efi.  Typically
> > > +shim.efi is signed by micsosoft and verified by the firmware.  The
> > > +linux kernel is signed by the distro and is verified by shim.efi.  So
> > > +without shim.efi in the loop secure boot verification will not work.
> > > +Usually you can find shim.efi as ``EFI/BOOT/BOOT{X64,AA64}.EFI`` on
> > > +distro install media.
> >
> > Thanks. I'm not sure why you'd want to enable UEFI secure boot
> > when you're not booting via UEFI, though.
>
> When not booting via UEFI you can ignore that.

But if I'm doing direct kernel boot then by definition I'm
not booting via UEFI, I'm directly booting the kernel...

thanks
-- PMM

