Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2818368lfy;
        Mon, 27 Jul 2020 05:39:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXbuHcPXIhMRoSKo0q39ahSfyu5ZW5fKwT6xgT/hTavd+vRWEYw6UeiDc+7qhlpMbrW0L+
X-Received: by 2002:a1c:7511:: with SMTP id o17mr21649636wmc.49.1595853587653;
        Mon, 27 Jul 2020 05:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595853587; cv=none;
        d=google.com; s=arc-20160816;
        b=hIyjwv2e6z5JYdPKEKiWxE8vvq8gk+4gAhQqqz0I+5E3UmvYJEFfEWtG/gV2DtOstO
         W3Hv6eEEXiQZ5vKOQe1338KeelS/5lI3VltvQL39BuNtF4Uj3RJMmp7lVDgwf4yHphtf
         y6NfaItfEXEMR16u012yg77Kpkbt5qKAc1BR77/fD86sACynTS7szx+MvZk/MQrMhmrR
         pFaveMHm6veFco+gUWrsrtEDVb6OxfE7wA24zJIbk4qtmAsxtWPNl5YxeKhwI7hE2ijP
         TtHNGVKrDK5q3Ql/imb5LgDihStyddm/FCzB3FgfO4vbaZ9ZZNqIE7TqAGgPyJwEfe0G
         I0Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=3st66k585KxSTKXc8mhUNWsQtp2Vc4VaYrUB1OfQYhk=;
        b=vqh3VeZ9xf+/Vfvgch+uDhY++Z6bkOKaDMqBrKbFYQ4dvImYXMDe36kT6EtwPPlami
         N/A/by46ZrkakoG/fhUDVWMh7rHZg6g9fd9IVrA0z54gbXsPax3JKf6JWi2D5KxgNssV
         snRqZPb35rpuSCcXaJdp0sTsqpCxpH23cVchaJgkCOng+UFrmmdKxktlquC24IHglY6X
         8uEmVsn/cA8a6gB+TwHn1aXLXZk2iARXwFzKi88CKfg5XWJMq9e0qbWxfABKysc64013
         qfLuzvQNcBFnu9p/g+o/hkBe1O1rNOs+rj6GVHumcQ1OFtFbNYpLPhM5JbLbKgb5Cwxr
         wlsA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of groug@kaod.org designates 46.105.58.226 as permitted sender) smtp.mailfrom=groug@kaod.org
Return-Path: <groug@kaod.org>
Received: from 3.mo2.mail-out.ovh.net (3.mo2.mail-out.ovh.net. [46.105.58.226])
        by mx.google.com with ESMTPS id m13si8201537wrj.78.2020.07.27.05.39.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jul 2020 05:39:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of groug@kaod.org designates 46.105.58.226 as permitted sender) client-ip=46.105.58.226;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of groug@kaod.org designates 46.105.58.226 as permitted sender) smtp.mailfrom=groug@kaod.org
Received: from player746.ha.ovh.net (unknown [10.108.42.82])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id 21E671E281D
	for <alex.bennee@linaro.org>; Mon, 27 Jul 2020 14:39:47 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net [82.253.208.248])
	(Authenticated sender: groug@kaod.org)
	by player746.ha.ovh.net (Postfix) with ESMTPSA id 1DC8714CBA9FA;
	Mon, 27 Jul 2020 12:39:24 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-104R0054f66621d-bfbe-4f88-83ce-bb5e27d65248,
                    B7B50C960922AB26A7D550ED897AF9E452A9EBFF) smtp.auth=groug@kaod.org
Date: Mon, 27 Jul 2020 14:39:23 +0200
From: Greg Kurz <groug@kaod.org>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>, Paolo
 Bonzini <pbonzini@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Peter Maydell
 <peter.maydell@linaro.org>, Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>, David
 Hildenbrand <david@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@redhat.com>, Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v3 2/8] target/arm: Move setting of CPU halted state to
 generic code
Message-ID: <20200727143923.20c23f09@bahia.lan>
In-Reply-To: <20200723025657.644724-3-bauerman@linux.ibm.com>
References: <20200723025657.644724-1-bauerman@linux.ibm.com>
	<20200723025657.644724-3-bauerman@linux.ibm.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 14632758139787057454
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedriedtgdehhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgsehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeukeejkeeiffeftdevueekvdetjeegieevhffgjefgtdeluddvgfefleekueevueenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeegiedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegrlhgvgidrsggvnhhnvggvsehlihhnrghrohdrohhrgh
X-TUID: YZfIt9zIjCbk

On Wed, 22 Jul 2020 23:56:51 -0300
Thiago Jung Bauermann <bauerman@linux.ibm.com> wrote:

> This change is in a separate patch because it's not so obvious that it
> won't cause a regression.
>=20
> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/core/cpu.c    | 2 +-
>  target/arm/cpu.c | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
>=20
> NB: I wasn't able to run this patch on an ARM machine. I did run it on
> a ppc64le pseries KVM guest.
>=20
> diff --git a/hw/core/cpu.c b/hw/core/cpu.c
> index 594441a150..71bb7859f1 100644
> --- a/hw/core/cpu.c
> +++ b/hw/core/cpu.c
> @@ -258,7 +258,7 @@ static void cpu_common_reset(DeviceState *dev)
>      }
> =20
>      cpu->interrupt_request =3D 0;
> -    cpu->halted =3D 0;
> +    cpu->halted =3D cpu->start_powered_off;
>      cpu->mem_io_pc =3D 0;
>      cpu->icount_extra =3D 0;
>      atomic_set(&cpu->icount_decr_ptr->u32, 0);
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index ec65c7653f..b6c65e4df6 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -175,7 +175,6 @@ static void arm_cpu_reset(DeviceState *dev)
>      env->vfp.xregs[ARM_VFP_MVFR2] =3D cpu->isar.mvfr2;
> =20
>      cpu->power_state =3D s->start_powered_off ? PSCI_OFF : PSCI_ON;
> -    s->halted =3D s->start_powered_off;
> =20
>      if (arm_feature(env, ARM_FEATURE_IWMMXT)) {
>          env->iwmmxt.cregs[ARM_IWMMXT_wCID] =3D 0x69051000 | 'Q';
