Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2393996lff;
        Thu, 9 Jan 2020 09:14:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqz5mjr+lw5CN1w3vgZPMSdSaMA4SuyeHs2eyx0xsq7IJJcjnXHB62MLffrg76f24ngX0kSV
X-Received: by 2002:ac8:2af4:: with SMTP id c49mr8986609qta.367.1578590062940;
        Thu, 09 Jan 2020 09:14:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578590062; cv=none;
        d=google.com; s=arc-20160816;
        b=Qwms2zrcQq6ZuJawDQEFEapQqOBxLotlhF7iGTiODvO+aAJxtg7VfGvwW8vo3fS8RT
         6Dl6eflNM5IZ8A9aV7lqTd9/oe1h8OZ3WNw7HVpnBSUqseHCUXwCIBQLKi4qe2Fv1NKT
         nVJPiCQwmIw0fM6fKNh8hpPXK7MAU83ShCFM+Lb7U4pNe+WTz7Cg1czcNg6/1ztnGzDq
         CTfU3t/WxiafGonysbXDxPODMQFIyZ7Kn/RHVbCrleumnzgB8H5uc5XZxDkZaTRJ1Ccb
         ajG8MYaHZ+uYvLJkmDdXIjmob69tEfDJMO6SNLqlDGXebO6LFHg51nrIhizcYnQNcrL+
         5UtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date;
        bh=J8o1dZQ9pZZoSFW6/kr4tNgORs1pxxDiCaTFQlvJo8w=;
        b=u/RyBkVExI38TbMHnZvul+5ySCLl+RHRbYKDksb9v2yJ/pfa1sDiWa+gUQ2BgSZk50
         kJfH0hTxWo/AATEkw1Egj1a+6cl19Gf7fG9ygSuxyyZWUyppCGB3O/08ArsnW5wrOU5f
         P7uwkkWPIrJZUbuQ3BJjSb3SiYPCtOC9coU3CyD1Q+h5g0fx3OSWbLXzgp0e6VmtL8Ol
         ZIZSlqqpBiFr8UdLJ/fmu+Q9VPVegg8pHQnRb58m68eJMSA2O2YVmZbsgr0wtQTjty+I
         v8zenoecmVfPHU3cqBiCr6aq2qYeIZWDyl88NFuCdnnI0+3Z0HIPMHUG0vEPwTUHqssG
         a2vg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d8si3596308qtm.39.2020.01.09.09.14.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jan 2020 09:14:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipbO2-0004qU-Cd
	for alex.bennee@linaro.org; Thu, 09 Jan 2020 12:14:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36712)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1ipbNo-0004kk-KI
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 12:14:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1ipbNm-0004bH-VU
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 12:14:07 -0500
Received: from 10.mo68.mail-out.ovh.net ([46.105.79.203]:56434)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1ipbNm-0004Y1-NT
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 12:14:06 -0500
Received: from player714.ha.ovh.net (unknown [10.108.16.55])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 0C3D6154DAD
 for <qemu-arm@nongnu.org>; Thu,  9 Jan 2020 18:14:04 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player714.ha.ovh.net (Postfix) with ESMTPSA id 17DDADFA36E4;
 Thu,  9 Jan 2020 17:13:48 +0000 (UTC)
Date: Thu, 9 Jan 2020 18:13:46 +0100
From: Greg Kurz <groug@kaod.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH 02/15] hw/ppc/spapr_rtas: Use local MachineState variable
Message-ID: <20200109181346.5ec5ed8b@bahia.lan>
In-Reply-To: <20200109152133.23649-3-philmd@redhat.com>
References: <20200109152133.23649-1-philmd@redhat.com>
 <20200109152133.23649-3-philmd@redhat.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 6871367133219887395
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdeiuddgieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjedugedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgepvd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.79.203
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
X-TUID: E8ZUR4TE9zip

On Thu,  9 Jan 2020 16:21:20 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Since we have the MachineState already available locally,
> ues it instead of the global current_machine.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr_rtas.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index 8d8d8cdfcb..e88bb1930e 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -281,7 +281,7 @@ static void rtas_ibm_get_system_parameter(PowerPCCPU =
*cpu,
>                                            "DesProcs=3D%d,"
>                                            "MaxPlatProcs=3D%d",
>                                            max_cpus,
> -                                          current_machine->ram_size / Mi=
B,
> +                                          ms->ram_size / MiB,
>                                            ms->smp.cpus,
>                                            max_cpus);
>          if (pcc->n_host_threads > 0) {

