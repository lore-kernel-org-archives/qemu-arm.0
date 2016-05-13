Received: by 10.25.208.137 with SMTP id h131csp279477lfg;
        Fri, 13 May 2016 10:46:46 -0700 (PDT)
X-Received: by 10.140.170.132 with SMTP id q126mr17559905qhq.103.1463161606906;
        Fri, 13 May 2016 10:46:46 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 10si3593565qks.223.2016.05.13.10.46.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 May 2016 10:46:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35452 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b1HAk-0000f4-GI
	for alex.bennee@linaro.org; Fri, 13 May 2016 13:46:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b1HAh-0000dk-7G
	for qemu-arm@nongnu.org; Fri, 13 May 2016 13:46:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b1HAf-0006uR-Uj
	for qemu-arm@nongnu.org; Fri, 13 May 2016 13:46:43 -0400
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:35321)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b1HAf-0006uD-K1
	for qemu-arm@nongnu.org; Fri, 13 May 2016 13:46:41 -0400
Received: by mail-vk0-x22e.google.com with SMTP id f66so146230859vkh.2
	for <qemu-arm@nongnu.org>; Fri, 13 May 2016 10:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qRcA7dfo3A20+jtIvuJIOwnUxjQqo5VXfqS1o9SaYKU=;
	b=Xd7KCdV8SUlzW6C81NV7/halzJMdAihrCWFY+mSi+HTUyNOgDWLTGJcE960b1YiZ9I
	g3nK2jbwwaWCmowBsk0xbWQOJxYUi5XnIGTDgtieZLUoTH2NGmUAyM+++0zBY0fXdwxi
	0UaZTCNU4f1j/XfrPADikUh3Bk/1xZ4KZRRwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qRcA7dfo3A20+jtIvuJIOwnUxjQqo5VXfqS1o9SaYKU=;
	b=IycqTE5BFzA2schgCX2/BqbCiR5cuUr0vPpK336UVfGeejBX/jIIAYu6ZifL1/ViTa
	Mcovypk3k4cl085H9k7H+I5GyYVj+9PT3Yim5kKungGPIi6/Td0418Bv/ZmbE8Igz9bc
	5pxkNmgdRLSTfkKZJpWhmWCHFpI3TnUQeEJcAdNfGIPecAmPnDCudkA848BE+R3Ruigv
	4AmjmEks8L0kgEZmy62hJDWNslAjc4Y1wl8PcpfkAThOdCjFLYHFf2srNFjp0uETe4rV
	TVUf0OR0IaW5qpbP4a0AiFCnQYkd3cUIoHxhGBcgTBaIwXi/LKkpuq2b4tWJ3tjXPRhJ
	AJLQ==
X-Gm-Message-State: AOPr4FX2sQTSdM/hRqT79OwX6U0daVNsgAvoKJxLjsX5i/2jE3RA6K4+wchg4h+jLGP1QJO5ttYP1nEQb4S3t+QO
X-Received: by 10.176.6.100 with SMTP id f91mr7345466uaf.38.1463161600803;
	Fri, 13 May 2016 10:46:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Fri, 13 May 2016 10:46:21 -0700 (PDT)
In-Reply-To: <77db20f0411ab4e6c62cc307e390bfd415101282.1462557987.git.alistair.francis@xilinx.com>
References: <cover.1462557987.git.alistair.francis@xilinx.com>
	<77db20f0411ab4e6c62cc307e390bfd415101282.1462557987.git.alistair.francis@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 May 2016 18:46:21 +0100
Message-ID: <CAFEAcA_JKxAZZG+D4NLm-nu6FdFD57GgGVpQsxoEWuMUJJsDQw@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Subject: Re: [Qemu-arm] [PATCH v1 1/2] target-arm: Add the HSTR_EL2 register
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1MaesBIbPVgn

On 6 May 2016 at 19:11, Alistair Francis <alistair.francis@xilinx.com> wrote:
> Add the Hypervisor System Trap Register for EL2.
>
> This register is used early in the Linux boot and without it the kernel
> aborts with a "Synchronous Abort" error.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
>
>  target-arm/helper.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 09638b2..65e8ff1 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -3470,6 +3470,9 @@ static const ARMCPRegInfo el3_no_el2_cp_reginfo[] = {
>        .opc0 = 3, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 4,
>        .access = PL2_RW, .accessfn = access_el3_aa32ns_aa64any,
>        .type = ARM_CP_CONST, .resetvalue = 0 },
> +    { .name = "HSTR_EL2", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 3,
> +      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
>      REGINFO_SENTINEL
>  };
>
> @@ -3703,6 +3706,10 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>        .opc0 = 3, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 4,
>        .access = PL2_RW,
>        .fieldoffset = offsetof(CPUARMState, cp15.hpfar_el2) },
> +    { .name = "HSTR_EL2", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 3,
> +      .access = PL2_RW,
> +      .readfn = arm_cp_read_zero, .writefn = arm_cp_write_ignore, },
>      REGINFO_SENTINEL
>  };

Can we have the 32-bit version of the register too, please? (I think
it should be possible to do this with a STATE_BOTH stanza).

Can we have the el2_cp_reginfo implemented to be a reads-as-written
to a hstr_el2 field in the env->cp15 struct? That way we won't have
to come back to the regdef struct as and when we actually implement
the trap bits to do something...

thanks
-- PMM
