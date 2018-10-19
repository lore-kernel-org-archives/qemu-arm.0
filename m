Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3924121wrt;
        Fri, 19 Oct 2018 07:47:23 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62gY2+rZcSgkfbfvdin7EIMmgLHakLAAr6qb/BAMZRrdpzx7NqDJQU1y5QI4tjxEkHDRAan
X-Received: by 2002:aed:210e:: with SMTP id 14-v6mr33780283qtc.9.1539960443640;
        Fri, 19 Oct 2018 07:47:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539960443; cv=none;
        d=google.com; s=arc-20160816;
        b=W2lFpKtjuwgAIq2/Q6fy4cNm09WaMnFVcrofOGJqIiGXCRCCgtYoM89LBvhT/eoj0X
         BsR1OSEcchp2I8OQ3pK3N35Kr+SYAqUhiYxc+VDmznfAIQq00OJawLIA3CVC2XfoGXm0
         q+tyon8H6/DUinql9IIiarZ45u7bdtXLvVXkbXYt5v8Gu6VI8Am/t1TATGEm8s5h+u+n
         NFd+r8aooRVimXKxWz9l2TBdnpvevn8ZHu3Mzmf24gFdlhtoYLdK9wMUXuY/HkgBVMrl
         y6Dcb2zmYjCmuLbbQi5XIQIVLo5mw6+0x40Ffmsmjhv3xccylOT/5PwAztMDcXObtWJN
         Yc2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=YBrZf6bkQy7h9FyG6Fa/j5bhGbVGDNVm1DDhkKP0DPo=;
        b=NEFLG/oYfwVGoBEhwqlSeXQ/GgLJKUCduB6Mj5hu2IzeLzLz/dEnq5f7V9pvggyBzF
         FX4d6ERraK+8x2dnIqao0hEh5w68J5JDm40VFvijf3H7nzPqeIH6DezOwijBc9K2dEDN
         IIx+f57uOxQkpdYDKewgs2SiBxl0nc7b9eHW2ETu5qbbbiPZJuZA6GplkDw5wGlPxZeK
         TZBnRUWYaRQ5iYCKH3weKSZMVkOzNfWjS+LG+u7++2T7yGoZUd2FcDH94u3wTDAxlHLl
         wV8G+A6wnyTLVOv2MpGb4C1yPW0MXzeVIJgBLCFynMmfrqbkByRQUuE9c6i6Zdg8Ojus
         Hieg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XYYE5EXI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k18-v6si8970170qtq.319.2018.10.19.07.47.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 07:47:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XYYE5EXI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50978 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDW3f-0000B4-4K
	for alex.bennee@linaro.org; Fri, 19 Oct 2018 10:47:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60944)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gDW3O-00009D-JF
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 10:47:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gDW3M-0003Bd-O4
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 10:47:06 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:34083)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gDW3K-0002wZ-MV
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 10:47:02 -0400
Received: by mail-ot1-x344.google.com with SMTP id v2so26294273otk.1
	for <qemu-arm@nongnu.org>; Fri, 19 Oct 2018 07:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YBrZf6bkQy7h9FyG6Fa/j5bhGbVGDNVm1DDhkKP0DPo=;
	b=XYYE5EXIWPQO0blXRnVQ45Liepm4R9RNZMwBReLt7RmvWPyXzRxNYfGtwN2CskfOya
	1sZ8Rgph05cNeBa387B5ZbLSwdq1xKtPailVkXDsgBB/JGuFl7yryOnDxUxmownjwcBc
	hLTI8HzigNEIS07jv9NtNytrKmBPsbEbGj7P0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YBrZf6bkQy7h9FyG6Fa/j5bhGbVGDNVm1DDhkKP0DPo=;
	b=Wfo5uTVJFsg8jT2vu+ui1IBPaplohgfXvcZ5RpvLxuVFkmeXTt9pNYaIFTRq0CL2AN
	0iXk31VvkAIt8T+Tv9amFXqnsC7OCVnOueuThF0evTDvIWPfXVY04mBrNRhmp8TQhaLs
	7xvJdYXIrFNCkfk/xA8m4XnIMMe2zts4qLV11hv7cyidbtpNHOOiXbJzwon4AvT1dg3y
	ZmrOkzar2pSUruRk0dBAfebwzyibeEhihv/UBWX+ddM5OP+IfAa2WnV7yyc4vcZoAwwF
	3iwr64+vyCe19H/IpisVEZfmazj7lmNKV/YN4W6Glug0XwZDwlYZWBYIfmI6IYCf7eJ0
	C51g==
X-Gm-Message-State: ABuFfojwzyWlCLnz1aBU5277mnl398d0chZPixhu+FKr01x7Wg81IMrq
	YjJhe/xaB/hXONtmfjRlbCaDQfxK2j4S8WV2Zhwbrw==
X-Received: by 2002:a9d:420c:: with SMTP id q12mr23474041ote.317.1539960417395;
	Fri, 19 Oct 2018 07:46:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Fri, 19 Oct 2018 07:46:36
	-0700 (PDT)
In-Reply-To: <1539954845-26716-6-git-send-email-thuth@redhat.com>
References: <1539954845-26716-1-git-send-email-thuth@redhat.com>
	<1539954845-26716-6-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Oct 2018 15:46:36 +0100
Message-ID: <CAFEAcA_NkdZtbM9n4633_hSr38eb9FJsi92=+Eeuky+U=eDtZA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH 5/5] configs: Add a CONFIG_SMC37C669 switch
 for the "smc37c669-superio" device
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
X-TUID: KDs3lmuf8NuU

On 19 October 2018 at 14:14, Thomas Huth <thuth@redhat.com> wrote:
> This device is not user-creatable and currently only used for the
> "alpha" target. So if the user does not want to compile alpha-softmmu,
> we should also not compile this device. Add a proper config switch to
> be able to compile this more flexibly.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  default-configs/alpha-softmmu.mak | 1 +
>  hw/isa/Makefile.objs              | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/default-configs/alpha-softmmu.mak b/default-configs/alpha-softmmu.mak
> index bbe361f..eb58b40 100644
> --- a/default-configs/alpha-softmmu.mak
> +++ b/default-configs/alpha-softmmu.mak
> @@ -19,3 +19,4 @@ CONFIG_IDE_CMD646=y
>  CONFIG_I8259=y
>  CONFIG_MC146818RTC=y
>  CONFIG_ISA_TESTDEV=y
> +CONFIG_SMC37C669=y
> diff --git a/hw/isa/Makefile.objs b/hw/isa/Makefile.objs
> index 83e06f6..9e106df 100644
> --- a/hw/isa/Makefile.objs
> +++ b/hw/isa/Makefile.objs
> @@ -1,9 +1,10 @@
>  common-obj-$(CONFIG_ISA_BUS) += isa-bus.o
> -common-obj-$(CONFIG_ISA_BUS) += isa-superio.o smc37c669-superio.o
> +common-obj-$(CONFIG_ISA_BUS) += isa-superio.o
>  common-obj-$(CONFIG_APM) += apm.o
>  common-obj-$(CONFIG_I82378) += i82378.o
>  common-obj-$(CONFIG_PC87312) += pc87312.o
>  common-obj-$(CONFIG_PIIX4) += piix4.o
>  common-obj-$(CONFIG_VT82C686) += vt82c686.o
> +common-obj-$(CONFIG_SMC37C669) += smc37c669-superio.o

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Should isa-superio.o also go in its own config flag?

thanks
-- PMM
