Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp880568wrt;
        Thu, 3 Jan 2019 09:42:22 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5RU8wG/4WHTwIEhW1+BkKTJgypPrQig73eV8NEQWAJE6V16cSD2IUDML4Wp7FwgKpxf2co
X-Received: by 2002:a37:9281:: with SMTP id u123mr46505117qkd.0.1546537342422;
        Thu, 03 Jan 2019 09:42:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546537342; cv=none;
        d=google.com; s=arc-20160816;
        b=XfT/GROzQeyQGdeSdGLR3g15+JbeBUM3nu9zufATk2W2yBIsMJpTJuumd4Mlq2HgKf
         LJi8S7tzcl1ZkLs8j6KD/m4qWKIUk/Hn2EZ967m+gBF2NYVjWU8it8nVElG/tFOmZAdt
         Yrbq3JJNiPO5UeuwDsgOokc1trBYfOK1o9GfEGYNBwhmXO+Gr3bVS+7jLiuL1e7Nxy1g
         GLI9uknUkDVk8P2nvWty8nZgV3ft1X/39vTxMMNDua+rD9aWVe3U0toc40I08qGwYSQ+
         wf1oSOnaFZ7ti3Q+EMREl7+CzW1TeySLVq7j5V6A3nwMyuKUpgD9H/PWelPDgOIKtD1Z
         LdYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nbjUEu9v1S709dYS2XNa5uPV6wCtjcswsIM/kPJierc=;
        b=hLHBLAOFSXegnvM9Lh5gD3Sd8/qKbV9X9f0CAaaHqxdGDrnS4sSkTArn0R62uEPMvr
         Pjqs0ewu+q97Zxy4ajoaa5eroECdi3HgmTQRbh6yrpaF/Mziq252WIRqgCECm9wQ8l+3
         T8qDLcG7q67Zg4vmyltP6X/42HOx7/KnacQaX0+TQX9AA3VlgIjcij/8moFdaqayHB74
         661X0jM22/br16HA66XceMIxCf/k9jI1LjC2TFCwDt5/K2obOACFRBdn6ZT41N5b/rij
         /Nm8yqYNNZ0A/VTTFKCSy637SSL04jKM3ThwwtsKIjyZHfQwpl2Forj8QOaf+9bQAJe/
         2kdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Mj7qMls8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id n64si2441186qkd.12.2019.01.03.09.42.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Jan 2019 09:42:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Mj7qMls8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:56797 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gf70f-0001dG-P9
	for alex.bennee@linaro.org; Thu, 03 Jan 2019 12:42:21 -0500
Received: from eggs.gnu.org ([208.118.235.92]:44265)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gf6mK-0001mL-SR
	for qemu-devel@nongnu.org; Thu, 03 Jan 2019 12:27:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gf6mJ-00014q-F6
	for qemu-devel@nongnu.org; Thu, 03 Jan 2019 12:27:32 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:40213)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gf6mJ-00013p-7s
	for qemu-devel@nongnu.org; Thu, 03 Jan 2019 12:27:31 -0500
Received: by mail-ot1-x341.google.com with SMTP id s5so29963492oth.7
	for <qemu-devel@nongnu.org>; Thu, 03 Jan 2019 09:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nbjUEu9v1S709dYS2XNa5uPV6wCtjcswsIM/kPJierc=;
	b=Mj7qMls8MqNCOeatjm3687Q/s5sgU9xy00D4dIS6WkqsViQubWW7pUyjg36oCsET2S
	VWsp3IfbYpB6EosCmT7dzo3SuMnLhMoexPvPJX9DYXAResTt6kgmmafT4XdsOr3xwXnW
	vc7sRM1xPswPwg6bLoQDPRIHrzMUvPFE9Vr6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nbjUEu9v1S709dYS2XNa5uPV6wCtjcswsIM/kPJierc=;
	b=d8mqRiF21j/35ltaygqckOUwQV4btrKi+kkbl9fvjK3ohEN4rjLcV0UjeeEIsjWR8k
	SR1XsFPYXzTn9GlMWMNTSOZSMtp2OOeM7WR0o5mu+0q/1ShmImfRcEDfCoiF2jIG2vUt
	YHKUi795ztu7IhkjhVXxT2ypJok7b1gMzZsg3pecnLvUFlx3D+xmsrS21Vxlah79eZiK
	DmThQJz3g0nWZcGNM0SJJGg7KUpdtwsMeaiTJnGcAmJQShjhyXO59xwNo7C5E/AVBWw6
	DIMrrinroumiU2r9D2qRbpdSH3mSilt0QTZ5l7D3YYQYP5Sw0jy0jVPbKF7j2zz32hHF
	2Hmw==
X-Gm-Message-State: AJcUukdf2KzxIvJ1jry3kuOPSNiHIjaYMrR8apsH7CnMwq5Yvqcmr5eA
	/Z03vM8X868EIb/Zh1Aw4D2XiuyPcj5llnDVBSPAPA==
X-Received: by 2002:a9d:3786:: with SMTP id x6mr34189109otb.238.1546536449972; 
	Thu, 03 Jan 2019 09:27:29 -0800 (PST)
MIME-Version: 1.0
References: <975b9131-9937-cfea-3b5d-ef36d0c2b761@gmail.com>
	<CAFEAcA-2tWtEqd-Z0xqNMeocf4rns+FihrAPudiQGz+85HFjJg@mail.gmail.com>
	<7b61db39-7059-6286-2282-b90f45a85faf@gmail.com>
In-Reply-To: <7b61db39-7059-6286-2282-b90f45a85faf@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jan 2019 17:27:18 +0000
Message-ID: <CAFEAcA9HkBC4M8vNsHd9M0YrAEYPb=3vd9jj8zkPruMKrtP=mA@mail.gmail.com>
To: Nick Hudson <nicholas.a.hudson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH v3] Support u-boot noload images for arm as
 used by, NetBSD/evbarm GENERIC kernel.
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uq7/fdeQYQGm

On Thu, 3 Jan 2019 at 16:50, Nick Hudson <nicholas.a.hudson@gmail.com> wrote:
> On 03/01/2019 16:20, Peter Maydell wrote:
> > On Tue, 11 Dec 2018 at 12:27, Nick Hudson <nicholas.a.hudson@gmail.com> wrote:
> >> --- a/hw/arm/boot.c
> >> +++ b/hw/arm/boot.c
> >> @@ -30,8 +30,9 @@
> >>     * Documentation/arm/Booting and Documentation/arm64/booting.txt
> >>     * They have different preferred image load offsets from system RAM base.
> >>     */
> >> -#define KERNEL_ARGS_ADDR 0x100
> >> -#define KERNEL_LOAD_ADDR 0x00010000
> >> +#define KERNEL_ARGS_ADDR   0x100
> >> +#define KERNEL_NOLOAD_ADDR 0x00000000
> >
> > If I'm reading the code right, this requests that noload images
> > are loaded at offset zero into RAM, yes ?
>
> Not quite.
>
> They're loaded as if the full noload image (including uboot header)
> was loaded at offset zero, but as load_uboot_image doesn't load the
> header then the image body (minus the header) is loaded at offset
> zero + the size of the u-boot header, i.e. 0x40.
>
> > That's not a great
> > choice, because we put our little mini bootloader at offset 0,
> > and so the two will clash.
>
> Fortuntately, the bootloader fits in the space that the uboot header would
> have occupied.
>
> My commit message has
>
> "The bootloader fits in the space that the uboot header would have occupied."
>
> to try and described this. I could add more of a description if required?

Ah, I missed that. This seems very fragile to me -- 0x40
is only 64 bytes, which is 16 instructions. Currently
our boot loader code is less than that, but only by four
insns or so, so it's very plausible that some future
enhancement to the loader code would take it over the 0x40
boundary, at which point handling of noload images will
silently fail. At a minimum we should have an assertion
that we stay below 0x40; but I'm not keen on restricting
ourselves to 16-instruction bootloaders.

Will a noload image ever in practice also be a Linux kernel
(ie hdr->ih_os == IH_OS_LINUX) ? If not, then we don't lose
anything by not allowing those to be loaded. (And if anybody
does in future complain that their image doesn't work, we
could make it supported by allowing the mini-bootloader to
be placed elsewhere in RAM.)

thanks
-- PMM
