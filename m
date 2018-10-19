Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3859279wrt;
        Fri, 19 Oct 2018 06:58:53 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62Xf7Sy9VcsTBa0/TwV9KMMI3OdI9B4tLOEVeB1S228MgTg3Nwg8m+WbMDETIkZ+4tpdRE4
X-Received: by 2002:a37:fda:: with SMTP id 87-v6mr2187757qkp.42.1539957533182;
        Fri, 19 Oct 2018 06:58:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539957533; cv=none;
        d=google.com; s=arc-20160816;
        b=MyWxRY6IrLwZfkX7qoTwodnnDSYv0glG7D5LPOKoAyeUhNC7XqSAMJuiq4K6aLCIwd
         eSkcF4+cjLO6959wtCantjkgmzI+tCAVUGa2dqfWmCdiLJGxxK9xrh9KCaANM3F/LnSw
         qk86ZFMnnnPUcuiZiPKxzMlPl1icA5D8/l0Ewp5nyygwNplgT87l4XJIIVXyft+3uueu
         eQyoyd0Aav7esvdtvNE+lnKY1UxTZCBVeuhy/DFsTAVNT3MHS+OSTUi8lqHj6FEVxbES
         /s1cqjDIqhBQKojJWm/Vhxxh686UxiDxmZbydetSX98H84NFmqV6Z9XryglO2ZWFEAuv
         JaDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=5yQPgrFq+iyQ5ks2yCqj/tq1kYKgIpZPv6lLVwd6NM8=;
        b=oTEtLOj5D8Wpke0k09vFKBSHFnUiXDCEggQ7/eN8WsbvXjVcMZw1K2sYKPRTqCAbC8
         nXuvhddSCbeos/vafcmGibFx3Gg1dRwR32wQXnu19NWtezGv9+I1neXsjT9fn4GUhNyS
         nbSSA5v0RWVarSpqbTWCYz+LDCXpd7KmRnVbGYHZ1keIHCyrwMXHRNZ2MKDc76guyGqR
         +SlyIz/ojjNctxMsjWkoR6qfOHHDK0+dLcqB3ORlzU6asI88ldqxLWltrLu80PoO419T
         p/inqN0dIXnBsIYKhaqERmkRV7zM+ctG5nX37s9fShUJlqHc/mS6w/icK9FaZOx2IaL5
         HSYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gnoSdx71;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m3-v6si439663qtf.328.2018.10.19.06.58.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 06:58:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gnoSdx71;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50763 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDVIi-0004PS-KE
	for alex.bennee@linaro.org; Fri, 19 Oct 2018 09:58:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45921)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gDVIZ-0004PH-8f
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 09:58:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gDVIX-0000hI-3f
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 09:58:43 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:44617)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gDVIS-0008Mu-UW
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 09:58:37 -0400
Received: by mail-oi1-x242.google.com with SMTP id u74-v6so26857547oia.11
	for <qemu-arm@nongnu.org>; Fri, 19 Oct 2018 06:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5yQPgrFq+iyQ5ks2yCqj/tq1kYKgIpZPv6lLVwd6NM8=;
	b=gnoSdx71xmlf+wiGkOzNtjiKTngHOgBbUSJfpbv2xA0dtH1IkMtQwcAOON4TEbIMJY
	AUA01UlSRrNyiozPCUp+pmXphLyjmVTl9o/9dhf9vzyPNuJDTKqimVYcdtN5OjKzs+T1
	spWy4iRbf7TvJCN4o9z0KvvEpo21e+NxR3uRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5yQPgrFq+iyQ5ks2yCqj/tq1kYKgIpZPv6lLVwd6NM8=;
	b=DBSXmwvXrr8M6s10PAvVg49efPe5eX2OJoEilubnOD+6lc0D8oLbA0h2OY/oSyZjbc
	GJi1VWF70vfyT96xpeqXpk9dHdj8xgOC/DKk4eVLghJOEAVIEJKRkEJBlMLZAtT850Mf
	KFnn3sQ7/57jAOiQKmn8KE3nY9zNawPlwRPZ5u+iBvOo8TN12hb0yAmQL6WL33BQB5Ak
	D8bPqKuWBw/WAX5//NJiS0vTKcnzB/0zY4GUn9YPxdaJUKAg0MQ1w3r1I55hiHe2MFBQ
	BRm1v6pLCy6lZsk9hwBbWsJa94Z41Yvt0QfTYUNTyzAsMaa6t1d7rIAr3ql9wFrikTiL
	Fs9A==
X-Gm-Message-State: ABuFfojx/7csY1EbDIyNYCgkJ8M4ljwoC/F2ihgBgdN0dVPp1EHaThgH
	vBg/Aw8MbWEgfS54GPQafW8uDAsXJ8+tW/4V5AzkXg==
X-Received: by 2002:aca:f156:: with SMTP id
	p83-v6mr19272988oih.332.1539957496135; 
	Fri, 19 Oct 2018 06:58:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Fri, 19 Oct 2018 06:57:55
	-0700 (PDT)
In-Reply-To: <1539954845-26716-5-git-send-email-thuth@redhat.com>
References: <1539954845-26716-1-git-send-email-thuth@redhat.com>
	<1539954845-26716-5-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Oct 2018 14:57:55 +0100
Message-ID: <CAFEAcA-ahq3Y4sgs=Vijq_fsDPgX4JuG0gGdMwE5oOLOrsvxjQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH 4/5] configs: Add a CONFIG_UNIMP switch for
 the "unimplemented-device"
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
X-TUID: jsN6FFh6vGXJ

On 19 October 2018 at 14:14, Thomas Huth <thuth@redhat.com> wrote:
> The "unimplemented-device" is currently only used for one arm board.

? It's used in all the MPS boards, several of the imx SoCs,
the nrf51 SoC used by the microbit, and by the stellaris boards.

> Let's add a CONFIG switch to make sure that we only compile it when
> it is really necessary.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  default-configs/arm-softmmu.mak | 1 +
>  hw/misc/Makefile.objs           | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 6f2ffc1..dc9730f 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -7,6 +7,7 @@ CONFIG_NAND=y
>  CONFIG_OR_IRQ=y
>  CONFIG_SPLIT_IRQ=y
>  CONFIG_REGISTER=y
> +CONFIG_UNIMP=y
>  CONFIG_ECC=y
>  CONFIG_SERIAL=y
>  CONFIG_SERIAL_ISA=y

This seems awkward to me. The 'unimplemented' device is supposed
to be an entirely generic thing usable in any board model.
If we only turn it on in the arm-softmmu.mak then it means
faffing around with the default-configs/ whenever it gets
used in a different architecture.

In particular, there's a pull request on the list that uses
it in a sparc board, so this patch will break compile on sparc
once that pullreq lands.

thanks
-- PMM
