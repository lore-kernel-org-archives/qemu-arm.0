Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1865842wme;
        Tue, 22 May 2018 12:07:03 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpeCvCXKNuNdli03ElkP8zcExeXjWHuKE+2yWTI1s6yF8mfqhzjyt2OwymyHOnZRSxo01Yt
X-Received: by 2002:aed:2374:: with SMTP id i49-v6mr23830370qtc.412.1527016023716;
        Tue, 22 May 2018 12:07:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527016023; cv=none;
        d=google.com; s=arc-20160816;
        b=U4GvuoUC3h7wc9jClZJtjytcvHj8NLZR4wYDeWEHYTLrCo5W5R0k17m//g4LfM7A3j
         wqvbopiW2NHvExWK0eUg0V+kBYyWVMrt/kNvU/qW7r2RmG284aqVytQr4/oxeWTOp2lC
         XplUFGEnpr0D+yqsoXvTLeoYIvXZfKe2cunhylTLj4QBtV4dmKRRHClv0lJZlD6jdGuL
         cUI4UwreKDmL/QNlWnJuZJbDL9QjiO23GqtQnUaSx6mQJTBSRgGvjPXjA2lLZsVEO5FR
         3XvJB8vKk9SusauLU0ckq83LpYwIbDRSdPwbeNEKXETVPL4JkWCBC+eD8ygLCJiVJS5h
         9a3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=K3Dabk15YfXfGR8FL/8BAwUFZIgVJIKyW+AizoVwArw=;
        b=HPoNvL2IZzt41UQ3FESPbvMoC0YTzn8DI4YqmJZtt90eOVDNZfkUtk0haYKG7FZOTa
         favBOndbMUhzpCXFWqjGYjegcXMFIVl6BFEEFAMAOzag9im2thUM3ee/gEBaqZJrmwwS
         eUJvAmq7vKscgXuQ7UNCxKZmLEHjPdJhdTNhT5QuvwxCuFAIh8Lzrj6J5tKNYJw2a89z
         aKmoA8fgeADbhTxaM8enjX92Jj8PXQMQCPboRDUfqc7VhrOkmkYTe4YYJZ+HWhwQovj3
         bR+L/poz4ntHM3YcGuWkv5XDYaELRvf0wNfWwZiWgdUrsApqSuWjRGhifSMq0W6BBCQe
         4FOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a94-v6si2042600qkh.179.2018.05.22.12.07.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 May 2018 12:07:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57435 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLCch-00061H-6W
	for alex.bennee@linaro.org; Tue, 22 May 2018 15:07:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54788)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fLCcX-000610-Ad
	for qemu-arm@nongnu.org; Tue, 22 May 2018 15:06:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fLCcU-0005ru-4H
	for qemu-arm@nongnu.org; Tue, 22 May 2018 15:06:53 -0400
Received: from 20.mo4.mail-out.ovh.net ([46.105.33.73]:47080)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fLCcT-0005q6-U0
	for qemu-arm@nongnu.org; Tue, 22 May 2018 15:06:50 -0400
Received: from player715.ha.ovh.net (unknown [10.109.108.12])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id 3EBDE1755B3
	for <qemu-arm@nongnu.org>; Tue, 22 May 2018 21:06:41 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: postmaster@kaod.org)
	by player715.ha.ovh.net (Postfix) with ESMTPSA id B05DC1C00B5;
	Tue, 22 May 2018 21:06:37 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180522173713.26282-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d8c13782-48b1-0975-ee2c-0d2ec2eecebe@kaod.org>
Date: Tue, 22 May 2018 21:06:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180522173713.26282-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 7656119367972915971
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrgedugddufedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.33.73
Subject: Re: [Qemu-arm] [PATCH] Correct CPACR reset value for v7 cores
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z2nt2R27isun

On 05/22/2018 07:37 PM, Peter Maydell wrote:
> In commit f0aff255700 we made cpacr_write() enforce that some CPACR
> bits are RAZ/WI and some are RAO/WI for ARMv7 cores. Unfortunately
> we forgot to also update the register's reset value. The effect
> was that (a) a guest that read CPACR on reset would not see ones in
> the RAO bits, and (b) if you did a migration before the guest did
> a write to the CPACR then the migration would fail because the
> destination would enforce the RAO bits and then complain that they
> didn't match the zero value from the source.
>=20
> Implement reset for the CPACR using a custom reset function
> that just calls cpacr_write(), to avoid having to duplicate
> the logic for which bits are RAO.
>=20
> This bug would affect migration for TCG CPUs which are ARMv7
> with VFP but without one of Neon or VFPv3.
>=20
> Reported-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Tested-by: C=C3=A9dric Le Goater <clg@kaod.org>

> ---
> This is sufficient that a save-and-reload while the romulus-bmc
> machine is in the bootloader will work. On the other hand if
> I do a save-and-reload after the kernel has started booting
> then we get the classic "guest hang after reload", so some
> state is still not being transferred somewhere (probably in
> a device in the machine model?)

I see the problem. Bizarre.

Thanks,

C. =20

> ---
>  target/arm/helper.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index c0f739972e..6023bf6046 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -863,6 +863,14 @@ static void cpacr_write(CPUARMState *env, const AR=
MCPRegInfo *ri,
>      env->cp15.cpacr_el1 =3D value;
>  }
> =20
> +static void cpacr_reset(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    /* Call cpacr_write() so that we reset with the correct RAO bits s=
et
> +     * for our CPU features.
> +     */
> +    cpacr_write(env, ri, 0);
> +}
> +
>  static CPAccessResult cpacr_access(CPUARMState *env, const ARMCPRegInf=
o *ri,
>                                     bool isread)
>  {
> @@ -920,7 +928,7 @@ static const ARMCPRegInfo v6_cp_reginfo[] =3D {
>      { .name =3D "CPACR", .state =3D ARM_CP_STATE_BOTH, .opc0 =3D 3,
>        .crn =3D 1, .crm =3D 0, .opc1 =3D 0, .opc2 =3D 2, .accessfn =3D =
cpacr_access,
>        .access =3D PL1_RW, .fieldoffset =3D offsetof(CPUARMState, cp15.=
cpacr_el1),
> -      .resetvalue =3D 0, .writefn =3D cpacr_write },
> +      .resetfn =3D cpacr_reset, .writefn =3D cpacr_write },
>      REGINFO_SENTINEL
>  };
> =20
>=20

