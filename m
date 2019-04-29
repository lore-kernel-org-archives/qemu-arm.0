Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3765147wrh;
        Mon, 29 Apr 2019 10:34:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxCIZXZ+XTEmzLMB7zT/6gOkmvsB+9yVoLmBB+0FtgYE8Zms9HxOVwlc51SaRhj0BRfebwt
X-Received: by 2002:adf:f310:: with SMTP id i16mr27411157wro.291.1556559275948;
        Mon, 29 Apr 2019 10:34:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556559275; cv=none;
        d=google.com; s=arc-20160816;
        b=fnwPK/GmffIxhBN6LHsY8zRKo+dnZYz45K/w068l5RmJHmF4tC7CozXaDxB2uJnK11
         kfjR/U7iYlhkm/4B82tShKHhdMQFaPS+o+JaXqvZ3AVitpmDsCr7c1l+NJ84KDS07Aih
         9iHG1CsA+hjgf78i5E+UcDCeDAdMOAexEqhhFHuvbq4sxIMPzj8dERGza2H2lcv0xMDq
         wFiPdebiBMa/XNFeC1PwS8P2tcyoWBbAkfHCXu3MQN7msClTjr1OXMn243bol88U1nWp
         IdUYrPtoGp0K2/Sf94xgRff8Kd3/eKKLpzirtiDzu/sxQ75/eFRCBO8Rni32OrCpKmRT
         b4lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=a3DPUEIRyecRUGS47p5FmLdqBTx4B9Jqf0Eml2oDI5A=;
        b=zy631iSl3FtH1KuBYJwsr3NwjrbqHRR28s1KaVw7HB1Db+SF23MM0EwgyAh/eArbEr
         PeO+n1vgiatQBOMj34Df4tvIIUAGXMI/ls2i1w6ipn4dnpFE73IEbwCWBx1UrZo0wFus
         0JVQ6Uuq0fhZgkQ5YDdWh3R8BR0pJ9Km5OFUakjsMz5VxWNHqqd5Ib4o8XXG7tjA2dI6
         Ux6hBbbywE+tm3/qo7JgPXrIaInjGtITPR4a2qD7Y1ObUYJnHADAAvTPwOYwrG1iGgvX
         BMmfhl/ZMWnUVZp8g2mcD3wNxknN8JLSx+nKXLjncMfsIWpz3/Rr7F0e3CAaXT2lPxkx
         OQnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dvO7IKoZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n10si92826wmk.17.2019.04.29.10.34.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Apr 2019 10:34:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dvO7IKoZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:32840 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLAAl-00083d-2H
	for alex.bennee@linaro.org; Mon, 29 Apr 2019 13:34:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41846)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hLA6L-000527-7m
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 13:30:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hLA6K-0006OM-C9
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 13:30:01 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:35827)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1hLA6I-0006NG-59; Mon, 29 Apr 2019 13:29:58 -0400
Received: by mail-lj1-x244.google.com with SMTP id z26so10164142ljj.2;
	Mon, 29 Apr 2019 10:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=a3DPUEIRyecRUGS47p5FmLdqBTx4B9Jqf0Eml2oDI5A=;
	b=dvO7IKoZ/NCO+KgP0M4oOoruQBLoRFLX1iMYIYIUw9QZYvvR51PPyysV0U0D1qWosQ
	sbBLKj1kOjyhx/Q1u7aSYImkJcElfBLLGNeydnYaBmQSOH0nmNYYC5qtXm6O6L7LDhIc
	oyebTT9bkwxWruARMnVSyPoqYFYsO1HG0N1RJzylSvk7pZK1ee0OGChereLdE9DKuzq9
	DsDmuwkX6KAtxLzJArG8Rjdff9ZsVenXrLT+O6WyBAbuOkJU2O8aNPxTWqh0S68HtwMF
	wRB/WxbVYkOmKODoQtXqfSjw6NsJzMXv9NeUDI43v3/s5jSJ6wzCaUEDePeThR4aduvY
	oGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=a3DPUEIRyecRUGS47p5FmLdqBTx4B9Jqf0Eml2oDI5A=;
	b=iIVi9dPT0gIhWTHN7E9kuP8zJOcFatwHR4GkyxPcj/TgXH31QBE5QUP58PPizK7l6E
	NKxNEZZ7rOFYpueu/DCVYUUBgkK+XdgHJoikJbnui0uqAQBOjvn/5a60Hz5kfFmZ9M04
	SNoq5onJKttNX9ErT6UEuNGNMhPyMRPrlP+fISi1x3daqQwLXugADu991fzG4k4tPQZ/
	AyGWsVhMBHpAUHAJtSjEmeWekPTnLG239w6jhMG6VqucFzPzCFbZlBSQFlJtC2tCLFXn
	ypOKCFOc+Pk8ZcplYNyCNFKovsM2APR359AecCCJQEFwnjSZQ1vqe8mPd/hwVskenMdh
	s3RQ==
X-Gm-Message-State: APjAAAXp6AchYIdKK/WUvW35H6JI4lhIf8UA37pObuqdwsBA6My1LXpb
	CY3LKC6govP/IfkOAuiFh9+k29yIoVNmri+Ydrs=
X-Received: by 2002:a2e:9ed3:: with SMTP id h19mr33593853ljk.129.1556558996905;
	Mon, 29 Apr 2019 10:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190427141459.19728-1-philmd@redhat.com>
	<20190427141459.19728-3-philmd@redhat.com>
In-Reply-To: <20190427141459.19728-3-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Apr 2019 10:29:28 -0700
Message-ID: <CAKmqyKMMTQtq2sxSH85oPzsK-vVX1jELaQALPhAEJ6EpTSD66g@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-devel] [PATCH 2/3] hw/intc: Only build the
 xlnx-iomod-intc device for the MicroBlaze PMU
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2sqv+DTIGO5X

On Sat, Apr 27, 2019 at 7:17 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> The Xilinx I/O Module Interrupt Controller is only used by the
> MicroBlaze PMU, not by the AArch64 machine.
> Move it from the generic ZynqMP object list to the PMU specific.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/intc/Makefile.objs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
> index df712c3e6c9..247e8016cb8 100644
> --- a/hw/intc/Makefile.objs
> +++ b/hw/intc/Makefile.objs
> @@ -3,7 +3,7 @@ common-obj-$(CONFIG_I8259) +=3D i8259_common.o i8259.o
>  common-obj-$(CONFIG_PL190) +=3D pl190.o
>  common-obj-$(CONFIG_PUV3) +=3D puv3_intc.o
>  common-obj-$(CONFIG_XILINX) +=3D xilinx_intc.o
> -common-obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx-pmu-iomod-intc.o
> +common-obj-$(CONFIG_XLNX_ZYNQMP_PMU) +=3D xlnx-pmu-iomod-intc.o
>  common-obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx-zynqmp-ipi.o
>  common-obj-$(CONFIG_ETRAXFS) +=3D etraxfs_pic.o
>  common-obj-$(CONFIG_IMX) +=3D imx_avic.o imx_gpcv2.o
> --
> 2.20.1
>
>
