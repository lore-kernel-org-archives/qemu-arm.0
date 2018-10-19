Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3859766wrt;
        Fri, 19 Oct 2018 06:59:18 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61TUNghu+PHLAXmlkA7/xWA4qHhnaBPDx/0BNhR3C/9PqMmdV7epGiMKh9NV4i33swXXCxh
X-Received: by 2002:ac8:7584:: with SMTP id s4-v6mr33846007qtq.161.1539957558895;
        Fri, 19 Oct 2018 06:59:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539957558; cv=none;
        d=google.com; s=arc-20160816;
        b=LglT2PG/Pts1CwXkkLm4UzRFfc2G+OPzs08VFa0kyOJQnFFgPN1ajji8afElHx5nBL
         AhHcfsdgv7/dbwtBUZDMLuqjYZBb3MMFcz0wQ/WPiuGxIvy6FuPUs4OxB8brCxESVv/F
         D24edb3ZXFQ0u8YUPcjQ7ynHZB9xXkdvpFJ7un95XVHu3C+/ZSJBFLHmun1NCADFRsBy
         GIpfyZBficqDDZGGmKcKcwCzKqvLV/g7nptwd9nFYJo6nFDIPI77fjVm0H4VKfLJPWkl
         v64ffz8QhcXF/sgGBBt/rjaB1IVF5M9gMpbPSTxNnrUPdsiCIEVTNgi9OMg76/DW58yQ
         VOVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=Ka1i+d87JlC/0Rx+R7gi69lBQF7XR/tSbG2BfoLYq/c=;
        b=N5byOa7onuFWBQElDllihKrNFqhoqv9EVO7x4GKn0c4kGVLw6mJobennUDtrfxiIuA
         nN+tCLjRIoAepcsMEr935w/1ZB0igNtC4+UlyNPEZRbChG33PBAN0/eH0BofVu1X6dxH
         fNZaElukfPdVhwQfSp5MixcONq+lq1DwMfgR1pwb0wcgtSv2jrY/zFoSvQ0XKTy6c6rE
         CnrX7qFNCJ9ABQTkY+dbHGcdmOe5p9fcy41lio6iBoZy1fd98JZ4J2JOnYWuMC0/yoJ0
         KRmSHTqiWsQnJ6/SZTS5Wu05Mg9X4KiFZdV2JfKfu18/Ux+rGtZk4KvJiyIV1FhScneK
         DHoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="iF+/LPdq";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r10-v6si1048946qtk.15.2018.10.19.06.59.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 06:59:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="iF+/LPdq";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50767 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDVJ8-0004c8-Do
	for alex.bennee@linaro.org; Fri, 19 Oct 2018 09:59:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gDVIv-0004b2-Gt
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 09:59:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gDVIu-0001lm-KK
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 09:59:05 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:41121)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gDVIu-0001lM-Dq
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 09:59:04 -0400
Received: by mail-ot1-x342.google.com with SMTP id c32so33271726otb.8
	for <qemu-arm@nongnu.org>; Fri, 19 Oct 2018 06:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ka1i+d87JlC/0Rx+R7gi69lBQF7XR/tSbG2BfoLYq/c=;
	b=iF+/LPdqnBhmWhLp+WtlPsDTfidrUW8FVLb+ssvHpwaMKP/QzXGNRpaaSi34cmJTmw
	5QDeOHwAlUAIKJcqLyQTNICNMNCuflNl87p8ttrdj4leS/R4saimPPPetqw7MjyNetit
	9l1/lEEuGH8i2F4/mFvW6DTc39UwmYjgWCwaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ka1i+d87JlC/0Rx+R7gi69lBQF7XR/tSbG2BfoLYq/c=;
	b=MF6Sy010fngi788g486jdHxpnz/vC4yVdcEJd9yF6hSkLMpuyXII0ux5lMuP6XYSzP
	WzanttrSMMY4K7L6q4KmdHFu0cVzI/Q0S0Ukp1gfCT1uQInaRwP7/akRjmvMVjy0H+mD
	e1Z+qwvG4WNCsr0hHoI/JLMyx/ncFlA9zXz9rhUVtUmAX8NpU5fLwY+zJtNJ4KYFVjx3
	KWltMyiMhCgdYoxAIu/HxLK45rQ4DHtUjhHTJ6u9pA9itqFWMxw+XDNW2FvGRsGIkZrq
	0g+e580ESU4QcN5TVa94a90hq+3d86spuVNJjgcX87K/iWk0Ewla7XBeEJwqm5tJ+ljL
	NROA==
X-Gm-Message-State: ABuFfoiUfI2U9vCWnxddmN7hLB3AbS8DCxIrmiV1gd0pPMXS27DmkeCP
	ecvThyg5/DI6V7WDICR89z7KWaTxxua1kSIX6+LZyA==
X-Received: by 2002:a9d:64d1:: with SMTP id n17mr15288944otl.151.1539957543370;
	Fri, 19 Oct 2018 06:59:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Fri, 19 Oct 2018 06:58:42
	-0700 (PDT)
In-Reply-To: <1539954845-26716-2-git-send-email-thuth@redhat.com>
References: <1539954845-26716-1-git-send-email-thuth@redhat.com>
	<1539954845-26716-2-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Oct 2018 14:58:42 +0100
Message-ID: <CAFEAcA8EzuwgobawU3KhCcHRyMWG=5d2pZ5KSe0rHeRkUteU9Q@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH 1/5] configs: Add a CONFIG_OR_IRQ switch for
 the or-irq device
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rlu/Z0e9gMzT

On 19 October 2018 at 14:14, Thomas Huth <thuth@redhat.com> wrote:
> If the user only wants to compile targets that do not require the
> "or-irq" device, we should also not compile or-irq.c. Add a proper
> CONFIG_OR_IRQ switch to be able to choose this more flexibly.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  default-configs/arm-softmmu.mak | 1 +
>  default-configs/ppc-softmmu.mak | 1 +
>  hw/core/Makefile.objs           | 2 +-
>  3 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 2420491..dc6a581 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -4,6 +4,7 @@ include pci.mak
>  include usb.mak
>  CONFIG_VGA=y
>  CONFIG_NAND=y
> +CONFIG_OR_IRQ=y
>  CONFIG_ECC=y
>  CONFIG_SERIAL=y
>  CONFIG_SERIAL_ISA=y
> diff --git a/default-configs/ppc-softmmu.mak b/default-configs/ppc-softmmu.mak
> index 3181bbf..83235af 100644
> --- a/default-configs/ppc-softmmu.mak
> +++ b/default-configs/ppc-softmmu.mak
> @@ -68,3 +68,4 @@ CONFIG_PC87312=y
>  CONFIG_PCSPK=y
>  CONFIG_IDE_ISA=y
>  CONFIG_CS4231A=y
> +CONFIG_OR_IRQ=y

Again, this is generic. We shouldn't need to mess with default-configs
files if we use it in some other architecture.

thanks
-- PMM
