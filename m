Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2393534lff;
        Thu, 9 Jan 2020 09:13:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqz63FNGagU/jMKyW8QOEy0AtdZDS/Te4CNAV4xH9vDPj1e8FLbGT0bPYtu8SJ3qILJJhlom
X-Received: by 2002:a37:c24b:: with SMTP id j11mr10132696qkm.57.1578590039411;
        Thu, 09 Jan 2020 09:13:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578590039; cv=none;
        d=google.com; s=arc-20160816;
        b=VuPErijxE/XjzZlknbNcMIJHB5sum1MBSq4xE79exnhbTvKoevjwFGFqbB1UJtoW/m
         rhGbiTxK6siWAEMFDJwMYpf10a6/WIroXocar8VbJzzA3mM4+rTfJ97Zeq++0cxlkdql
         oYRhW6ViNcY6tVWzFOqnRMb2hULPRc5TTGiSUcXrgC4Y0xhLKbDUoAZHu2bwe80E2ZGC
         bGnOURFVLKhlHyxl+1QGBZ0bbhBElDdhj3iejb509V1CfQHdfQKWCwtIf8PWsCHrPLvL
         SHjR6ycNS+OM3QNjrMTKNLDyhspbW/AADRiRm5eBpJsz5y3WoUguM3Hl+kgYraEh17kL
         ZMNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date;
        bh=R6NTb4IK5PNr3MIcdDaBGxOwnX1wUEvPlAnFVrpIpP4=;
        b=JmquyvYHGT3pEWACGKwRg+OrTB3uVSBPyyHcn1tSiwEUQ5jUbv0++WA1wPoMjGtnLD
         4aYog7cBhZ7ygn1c4LCp1Ii49Tk1Ac+1iB4S8KPDsHu9iaFY5Yn4NTnSu9Bh7GDYjTfs
         npR5QiJbZIG106RNM9GxCnKyQEHCLcPTxtlBhhgA05DCPED9NJehTpvj0aAvVe1OCW9q
         TmONIVVGybJ4/epaiHWOhRtppBZUUVh+jPQJgWmCZwcZuFWWd8DBFB+gi87ITCo8lB0v
         dIOAqC0BA0Wf6Syi/DFZ4asmZePmooSKexmE8znemy6HUHFKdtlrXQoQbxMmr7TKwYbu
         6uXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v23si3631562qtk.131.2020.01.09.09.13.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jan 2020 09:13:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipbNe-0004BE-I0
	for alex.bennee@linaro.org; Thu, 09 Jan 2020 12:13:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35513)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1ipbNT-00049F-8R
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 12:13:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1ipbNS-00039v-3b
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 12:13:47 -0500
Received: from 2.mo4.mail-out.ovh.net ([46.105.72.36]:45856)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1ipbNR-0002xW-TT
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 12:13:46 -0500
Received: from player786.ha.ovh.net (unknown [10.108.1.121])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 7E08121E887
 for <qemu-arm@nongnu.org>; Thu,  9 Jan 2020 18:13:43 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player786.ha.ovh.net (Postfix) with ESMTPSA id EDC85E344AED;
 Thu,  9 Jan 2020 17:13:26 +0000 (UTC)
Date: Thu, 9 Jan 2020 18:13:25 +0100
From: Greg Kurz <groug@kaod.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH 03/15] hw/ppc/spapr_rtas: Access MachineState via
 SpaprMachineState argument
Message-ID: <20200109181325.776d75a4@bahia.lan>
In-Reply-To: <20200109152133.23649-4-philmd@redhat.com>
References: <20200109152133.23649-1-philmd@redhat.com>
 <20200109152133.23649-4-philmd@redhat.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 6865456160021846307
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdeiuddgieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeekiedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.72.36
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Juan Quintela <quintela@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LEOFIfWFZbfo

On Thu,  9 Jan 2020 16:21:21 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> We received a SpaprMachineState argument. Since SpaprMachineState
> inherits of MachineState, use it instead of calling qdev_get_machine.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr_rtas.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index e88bb1930e..6f06e9d7fe 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -267,7 +267,7 @@ static void rtas_ibm_get_system_parameter(PowerPCCPU =
*cpu,
>                                            uint32_t nret, target_ulong re=
ts)
>  {
>      PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
> -    MachineState *ms =3D MACHINE(qdev_get_machine());
> +    MachineState *ms =3D MACHINE(spapr);
>      unsigned int max_cpus =3D ms->smp.max_cpus;
>      target_ulong parameter =3D rtas_ld(args, 0);
>      target_ulong buffer =3D rtas_ld(args, 1);

