Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3920706wrt;
        Fri, 19 Oct 2018 07:44:49 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62SSIfejOBYLwBO2pICEklFl+cdx3GxFMCDdy/OTu0ZbppLNfW3cFEBZgm5cXSuSDjgUjID
X-Received: by 2002:ac8:71d1:: with SMTP id i17-v6mr6515673qtp.382.1539960289592;
        Fri, 19 Oct 2018 07:44:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539960289; cv=none;
        d=google.com; s=arc-20160816;
        b=zFeb3Gh8VC9EWDVl5dt8xN/OVZxop5shlQapb3MCj5YM4FNoznLpgw6pJRaV1SPn+Z
         YKjL8ozA2ExQQBx3jeyi3vMIFNeEu2XXzOARkC7fcTYDbVWzpFXYn3KqNxXgqvYVQ0Xb
         vZXizmu9rM7ImHO+g3lmgwRqw+H/EvuhfD3xCrMwunC/KjTXqi4tbfDRqQHwKs49sOl7
         c0KxHkEj4FkzCD/6mCzzQdZC05Pxd+FoKbaIC6I2XBX+rMlgGudkoea+cq7fgxcM0ESW
         wFJMM3Gorg5ZiQt2gpZ5RPWvpXvAowfq03ANF6Um3VSPFpCYa0t3D5G/2InDFcY4K3Cv
         v+Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=h4P8NZqfIfRxikUP4cxCCZVDGyfefsbzGFBe6AT3JD0=;
        b=ZgV1fm8sB7NQ/bjnT1dMD8/EYlkzZ4qCEQh17ccaGeXuUcDXUTGEIjQjd+FCpcA9az
         T3YVNpjULb27+2amw3AQy/Z86b0KK5MW9mdH67YHMpj2t8SBc9IPIPS3WrKKxnhCyu63
         yyTLVAgn+6Kmc6XMUTcRas9JWbThEBImA4VmgI961Dl1YgLhbqdi3GnD/ycwrnxzIe8u
         KUDza35BnvXp2dDIYJPS8FgxiKZr3SPe6ZdXkmkEkcJ/ppDxCRj7kzuTB4GKWdN1q/NF
         ykY30YdP8DD5d7nP/0h8MglJwD6rZedLhjk4TbsV5khR4H++cQpfdRx3oeJCWXlbtn6m
         XsWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XVeJAs6x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z17-v6si3431618qtj.337.2018.10.19.07.44.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 07:44:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XVeJAs6x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50960 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDW1B-0006zd-3w
	for alex.bennee@linaro.org; Fri, 19 Oct 2018 10:44:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60192)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gDW0x-0006yP-So
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 10:44:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gDW0x-0008Rs-5a
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 10:44:35 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:46439)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gDW0w-0008RJ-VM
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 10:44:35 -0400
Received: by mail-ot1-x343.google.com with SMTP id o21so33394359otb.13
	for <qemu-arm@nongnu.org>; Fri, 19 Oct 2018 07:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=h4P8NZqfIfRxikUP4cxCCZVDGyfefsbzGFBe6AT3JD0=;
	b=XVeJAs6xvPqkjQ0WoP/56y2C4/CFzjtFd06ITCQXXRz25vBS8wYdvVV0KVmhiRikFB
	4PJEelUjhvR8vxSbOikgknH8qmvCLinJiyv1JwwWZs383Bb6yGyRPf5hHxvXeM8QvUn2
	Ncj/TVZ6rI9+r52U4hMCKSNY1QBUaRRbEt9uU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=h4P8NZqfIfRxikUP4cxCCZVDGyfefsbzGFBe6AT3JD0=;
	b=B97upSHkya3A9qwz8pyayyI/jV/+KcSbGIkFY5NmL5TrvwLcUABWbbK5ION9KWmYEG
	scnApw8Fg9LxKsYKWdvGiwS1PPenN9NyymsjDeBZX3J1uUgAtUbGaLSaNjx0ue5zN5LT
	eXx2ggKq/wTDsPR1jGiQCwlgPG2/VUyMtntLsN3yQktlNdtb+wdCCO31Iy92r2jzM5iY
	ssMStLTyxaWqaoW5xPABBP9mx7QUh2qFrsvK8mxWCE1WfGEJhgbfxmGbDeG9IeoacL/M
	S3uArzv+WrhmrFif17z24VA1/U4+/3gCTFYRNlEicvmlP+TYKBiOMNNwR9Awi4oWyWN8
	hVrw==
X-Gm-Message-State: ABuFfogcusx/k4fj9z0G4lcJLh2MYIiZO+ygAo3kG2HjgQ7uMZjNdogw
	bJhS6hBDORomz6RWoZMyVPCczRbdN4QfqVUGeG0ilgzfju8=
X-Received: by 2002:a9d:1ea3:: with SMTP id n32mr21315946otn.352.1539960274414;
	Fri, 19 Oct 2018 07:44:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Fri, 19 Oct 2018 07:44:14
	-0700 (PDT)
In-Reply-To: <1539954845-26716-3-git-send-email-thuth@redhat.com>
References: <1539954845-26716-1-git-send-email-thuth@redhat.com>
	<1539954845-26716-3-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Oct 2018 15:44:14 +0100
Message-ID: <CAFEAcA-w9pwEXZfitppX=ybHfgnA4R2=z6UaHLqyLCk=ueN1zA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH 2/5] configs: Add a CONFIG_SPLIT_IRQ switch
 for the split-irq device
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
X-TUID: MUHylMtqAsDL

On 19 October 2018 at 14:14, Thomas Huth <thuth@redhat.com> wrote:
> If the user only wants to compile targets that do not require the
> "split-irq" device, we should also not compile split-irq.c. Add a proper
> CONFIG_SPLIT_IRQ switch to be able to choose this more flexibly.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  default-configs/arm-softmmu.mak | 1 +
>  hw/core/Makefile.objs           | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index dc6a581..a3a3b66 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -5,6 +5,7 @@ include usb.mak
>  CONFIG_VGA=y
>  CONFIG_NAND=y
>  CONFIG_OR_IRQ=y
> +CONFIG_SPLIT_IRQ=y
>  CONFIG_ECC=y
>  CONFIG_SERIAL=y
>  CONFIG_SERIAL_ISA=y

Generic device, not arm-specific.

thanks
-- PMM
