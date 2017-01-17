Received: by 10.25.205.13 with SMTP id d13csp718218lfg;
        Tue, 17 Jan 2017 14:13:38 -0800 (PST)
X-Received: by 10.55.127.129 with SMTP id a123mr37109471qkd.129.1484691218637;
        Tue, 17 Jan 2017 14:13:38 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d15si17617770qta.154.2017.01.17.14.13.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jan 2017 14:13:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37968 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cTc0V-0007YN-US
	for alex.bennee@linaro.org; Tue, 17 Jan 2017 17:13:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cTc0R-0007YC-HH
	for qemu-arm@nongnu.org; Tue, 17 Jan 2017 17:13:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cTc0Q-0003Gx-J5
	for qemu-arm@nongnu.org; Tue, 17 Jan 2017 17:13:31 -0500
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:36461)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1cTc0Q-0003G1-Cs; Tue, 17 Jan 2017 17:13:30 -0500
Received: by mail-wm0-x242.google.com with SMTP id r126so41856738wmr.3;
	Tue, 17 Jan 2017 14:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=gksX1rP5+mIxV9gz85U8ZVKiXMPfKQ+GvduAqJT7+7c=;
	b=fqPZsw0NwY3cFSciGnWgJHnzkmZYFf/3aLcdbkfNJmo5u0tAqgx0hmD/kA+utoLU0e
	yPnzrg30PSs0MUdoAxvJ2nx8JvgJDfElj3psimiPbF3QzXy+r5rlGYXBaZtF4jkId+Qw
	KFGr2MKQWp0uPnFfotVg730wio7MJLdNW+lkI0ZuuynPa6fT9W18kiAaP6RBzXpfkDcg
	O/ySH0wm2tZnwNcQc/s7+4ZsCR5fhakVy2X64nQbToOcmhNG+L9KbjSWHQR2F05bkXU9
	wvtAgESBkWQcW6aLtBoarXlF4iREcVw9fatGFV/Bs4V9jnOQO2n8gjQaN4WiOWT25wPY
	vOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=gksX1rP5+mIxV9gz85U8ZVKiXMPfKQ+GvduAqJT7+7c=;
	b=UFIQkM4flmIxR1QKWKyBcFur4VczXt5EDs4IlDilTbXSzUULANmyVWej5eZQ3SDwwg
	BgYjFUaTCqii+3nYYLsrWtwuzgI1/J57no8VYcqTN1cw44SZd6QDzVfF2GvwSLEsITTV
	ZMCoSysvsTHP7dMTSIJyNQNySzvT1tRXSqkuRTY7dYb+Byz60KmtXkEdW+gU7OANhQDQ
	KZhXvYBpkCLZRbbCZiomf+h0sHcH84q0BJI8RsgjZLKE6MGUOFWE+Meo243Dub4mzIRm
	5C6ofYHI55+ET2GD4tfnorQXbGdd2WXKzjhHAtyY2ZnHEADV2XQzWskJD406LVOs7OUa
	tA4Q==
X-Gm-Message-State: AIkVDXI9iRmIWs6/r1Ct1bdMx8F9ONR5dUDnbaN2G4O3nuMLJyH2a/DLzMiGp+Nhhxo97WjfiRalCo9jLi61pQ==
X-Received: by 10.223.169.114 with SMTP id u105mr30178975wrc.173.1484691209336;
	Tue, 17 Jan 2017 14:13:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.154.68 with HTTP; Tue, 17 Jan 2017 14:12:58 -0800 (PST)
In-Reply-To: <1483977924-14522-6-git-send-email-peter.maydell@linaro.org>
References: <1483977924-14522-1-git-send-email-peter.maydell@linaro.org>
	<1483977924-14522-6-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 17 Jan 2017 14:12:58 -0800
X-Google-Sender-Auth: PCgbMk3RUgZnG82-vf73blYXV1A
Message-ID: <CAKmqyKN+8Uy5H4V9tOF-k4xr_OT2DimS5a+wpjZjYf8TyQwWXQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 05/18] target-arm: Add ARMCPU
 fields for GIC CPU i/f config
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Andrew Jones <drjones@redhat.com>, Patch Tracking <patches@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iaF0I5Z+ORMu

On Mon, Jan 9, 2017 at 8:05 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> Add fields to the ARMCPU structure to allow CPU classes to
> specify the configurable aspects of their GIC CPU interface.
> In particular, the virtualization support allows different
> values for number of list registers, priority bits and
> preemption bits.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Acked-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

> ---
>  target/arm/cpu.h   | 5 +++++
>  target/arm/cpu64.c | 6 ++++++
>  2 files changed, 11 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 764b511..28c5d8f 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -659,6 +659,11 @@ struct ARMCPU {
>      uint32_t dcz_blocksize;
>      uint64_t rvbar;
>
> +    /* Configurable aspects of GIC cpu interface (which is part of the CPU) */
> +    int gic_num_lrs; /* number of list registers */
> +    int gic_vpribits; /* number of virtual priority bits */
> +    int gic_vprebits; /* number of virtual preemption bits */
> +
>      ARMELChangeHook *el_change_hook;
>      void *el_change_hook_opaque;
>  };
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 549cb1e..73c7f31 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -147,6 +147,9 @@ static void aarch64_a57_initfn(Object *obj)
>      cpu->ccsidr[1] = 0x201fe012; /* 48KB L1 icache */
>      cpu->ccsidr[2] = 0x70ffe07a; /* 2048KB L2 cache */
>      cpu->dcz_blocksize = 4; /* 64 bytes */
> +    cpu->gic_num_lrs = 4;
> +    cpu->gic_vpribits = 5;
> +    cpu->gic_vprebits = 5;
>      define_arm_cp_regs(cpu, cortex_a57_a53_cp_reginfo);
>  }
>
> @@ -201,6 +204,9 @@ static void aarch64_a53_initfn(Object *obj)
>      cpu->ccsidr[1] = 0x201fe00a; /* 32KB L1 icache */
>      cpu->ccsidr[2] = 0x707fe07a; /* 1024KB L2 cache */
>      cpu->dcz_blocksize = 4; /* 64 bytes */
> +    cpu->gic_num_lrs = 4;
> +    cpu->gic_vpribits = 5;
> +    cpu->gic_vprebits = 5;
>      define_arm_cp_regs(cpu, cortex_a57_a53_cp_reginfo);
>  }
>
> --
> 2.7.4
>
>
