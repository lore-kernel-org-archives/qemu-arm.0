Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp1971593ejt;
        Tue, 28 Nov 2023 07:32:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+aPYuFmAc26XUZaBfoCpeNcUP7NaDPo3+SUyXpTJ20cz4rTv/zOU6zoPs8kYHr+VeDrrI
X-Received: by 2002:a05:622a:478d:b0:423:e3da:101b with SMTP id do13-20020a05622a478d00b00423e3da101bmr240328qtb.47.1701185551172;
        Tue, 28 Nov 2023 07:32:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701185551; cv=none;
        d=google.com; s=arc-20160816;
        b=XjRtMHdFuflFm9JMUR85+2mPQaomqKtkpFne8Y6Fmo8/Y1iXNjgmjKHvKCC7POf9r5
         bdnkAs4DTd5caH+I0fd9gKGhr/exdcqmOsMFJ8IoLm4beJAPs46lzE4C2WthsXnvKXM4
         oft+oYVds7TWcttweHMZXCV4Lg3oBBGjGv6L16uN0Wv7+YuDMHU0va549LWpcUPIK4gv
         PE/16gSqC3ONtj8uTbpKov34HFudN4biIArmygqp0lYR/6wWRAm63aFdCv+ktJ/XzbWj
         iIz/CEQvK9d4R+G7fYXmh2bqsLT14Tlx92sAJkiAJWBDXmULOB5XTT7lhRRMbi1dTuW5
         wuLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=bv8Xp/zwSVjcKOTD+mr4DvjM72pTURLrqcD4Sj9gONM=;
        fh=wV6b0TL7corVRWTR29RPx4Qkj2+2+kgqvIqkMoPpvnQ=;
        b=JS+XsO/YNKLh4ulEqsRPcVSOaAB/r9fRNJqE0n2AUP8/mIpz0kMrHzWZp1aYAkUcDG
         FD+pHLh8eNpMEYXmz1GY/qBnXhd2ZYfza3PNiJgzSUaoFRCjPlXvM/awGPe6uCPRNY+O
         g+jmr12+/2nBapukG+ZYPNdj25XVeroam66mibq0rW0Bkd+SSDvu4JlxaExmL6jGicAQ
         l4FVyA8fXxcDfG+hrn7Tvp73IL57/xwvBc9gE5QHfSRn8E/9TgJfuGmO8TooFfpdK/gQ
         +pzmYbitPO8w9YvBTngLRLIOuvkhqs0WaQBDDEq63UL24XVMiP8hwErTLQqGyerbR3hS
         0gxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LxL1BZX7;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id a8-20020ac85b88000000b00423745f1117si11318464qta.712.2023.11.28.07.32.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 07:32:31 -0800 (PST)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LxL1BZX7;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701185550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bv8Xp/zwSVjcKOTD+mr4DvjM72pTURLrqcD4Sj9gONM=;
	b=LxL1BZX73t8HjAxLy65OOfBTPEzLwNfJkG680UQwGgi9iybll8kJiIF/GY64YRw4fnT4fR
	dDc5jseXIA+ZVLpQLmY4pDBJ5Dg5rf9mS/0/XEVVZpM6TsQ4NHf6WmD7C6bCk/q0GL0uny
	YxsEv17BX3qmsCbZespz1f6wyAQhTWE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-Zc3FHYQaPzG41Z9-ERi_Bw-1; Tue, 28 Nov 2023 10:32:29 -0500
X-MC-Unique: Zc3FHYQaPzG41Z9-ERi_Bw-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-54acdd65e8cso3250618a12.1
        for <alex.bennee@linaro.org>; Tue, 28 Nov 2023 07:32:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701185545; x=1701790345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tg6RYWeqCpwUoQCzRfUgguApc1UmfoSk7iO/0ub4xnQ=;
        b=WM+KKeDWAQVdcbl1O3QtMtGi0Frl6C7evq4V1F4KsbWvf+4Ge5E5S9/OQSpjMRiV6b
         z1blqufnEQyTAFafPlqzRoh5ztrSYRON/MhaWw4zUHoPP1oVrewEGO0I3SfjgoKBOSWu
         ydkmptRo0ipuXIXLS2MEafjSuQZkvoLQgi8D9RG7neEfchbCe053R+MbHZVvMb8j5HhI
         xh1iJ/8RCp9XWTI/uGlH+w+cosZYPsRTkULXY2bKbT8SzBho0HBK4RHbUkWkcvEH7eHq
         65zuG35PeMmo9Zvx8fhf4UM3n9Kabsu6qbHVvnlhOwtd50U+OPOr2Nmjq/CEYTmnCgEd
         TC4A==
X-Gm-Message-State: AOJu0YyAxjajYsNzyhl5tvlG5ZMIkzbVO1Z7Mv0qGJvtBg+TN/G5LpCQ
	NTunoGNc+tlBAQXcIU+muMMNRbVKF/BrF5igCuK+6WhWwLwDw40FTWeTTloTHK6KAR11Xuj53Es
	yqqqjalp8BW7airlu
X-Received: by 2002:a05:6402:ca9:b0:54b:8a3:33d4 with SMTP id cn9-20020a0564020ca900b0054b08a333d4mr8894215edb.21.1701185545209;
        Tue, 28 Nov 2023 07:32:25 -0800 (PST)
X-Received: by 2002:a05:6402:ca9:b0:54b:8a3:33d4 with SMTP id cn9-20020a0564020ca900b0054b08a333d4mr8894200edb.21.1701185544908;
        Tue, 28 Nov 2023 07:32:24 -0800 (PST)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id z40-20020a509e2b000000b0054b79a10c5bsm2011932ede.1.2023.11.28.07.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 07:32:24 -0800 (PST)
Date: Tue, 28 Nov 2023 16:32:21 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini
 <pbonzini@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, David Hildenbrand
 <david@redhat.com>, Peter Xu <peterx@redhat.com>, Anton Johansson
 <anjo@rev.ng>, Peter Maydell <peter.maydell@linaro.org>,
 kvm@vger.kernel.org, Marek Vasut <marex@denx.de>, David Gibson
 <david@gibson.dropbear.id.au>, Brian Cain <bcain@quicinc.com>, Yoshinori
 Sato <ysato@users.sourceforge.jp>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Claudio Fontana <cfontana@suse.de>, Daniel
 Henrique Barboza <dbarboza@ventanamicro.com>, Artyom Tarasenko
 <atar4qemu@gmail.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-ppc@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Aurelien
 Jarno <aurelien@aurel32.net>, Ilya Leoshkevich <iii@linux.ibm.com>, Daniel
 Henrique Barboza <danielhb413@gmail.com>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater
 <clg@kaod.org>, Alistair Francis <alistair.francis@wdc.com>, Alessandro Di
 Federico <ale@rev.ng>, Song Gao <gaosong@loongson.cn>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Chris Wulff <crwulff@gmail.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Fabiano Rosas <farosas@suse.de>, qemu-s390x@nongnu.org, Yanan Wang
 <wangyanan55@huawei.com>, Luc Michel <luc@lmichel.fr>, Weiwei Li
 <liweiwei@iscas.ac.cn>, Bin Meng <bin.meng@windriver.com>, Stafford Horne
 <shorne@gmail.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, "Daniel P .
 Berrange" <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Bernhard Beschow <shentey@gmail.com>, Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-riscv@nongnu.org, Alex
 =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, Nicholas Piggin
 <npiggin@gmail.com>, Greg Kurz <groug@kaod.org>, Michael Rolnik
 <mrolnik@gmail.com>, Eduardo Habkost <eduardo@habkost.net>, Markus
 Armbruster <armbru@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH 01/22] target/i386: Only realize existing APIC device
Message-ID: <20231128163221.6c91e013@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230918160257.30127-2-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
	<20230918160257.30127-2-philmd@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: pxrGfJ/VrLOT

On Mon, 18 Sep 2023 18:02:34 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> APIC state is created under a certain condition,
> use the same condition to realize it.
> Having a NULL APIC state is a bug: use assert().
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  target/i386/cpu-sysemu.c | 9 +++------
>  target/i386/cpu.c        | 8 +++++---
>  2 files changed, 8 insertions(+), 9 deletions(-)
>=20
> diff --git a/target/i386/cpu-sysemu.c b/target/i386/cpu-sysemu.c
> index 2375e48178..6a164d3769 100644
> --- a/target/i386/cpu-sysemu.c
> +++ b/target/i386/cpu-sysemu.c
> @@ -272,9 +272,7 @@ void x86_cpu_apic_create(X86CPU *cpu, Error **errp)
>      APICCommonState *apic;
>      APICCommonClass *apic_class =3D apic_get_class(errp);
> =20
> -    if (!apic_class) {
> -        return;
> -    }
> +    assert(apic_class);

if errp doesn't lead to error_fatal/abort, wouldn't that effectively mask
following error
 apic_get_class():
      error_setg(errp, "KVM does not support userspace APIC");
      return NULL;
???

> =20
>      cpu->apic_state =3D DEVICE(object_new_with_class(OBJECT_CLASS(apic_c=
lass)));
>      object_property_add_child(OBJECT(cpu), "lapic",
> @@ -293,9 +291,8 @@ void x86_cpu_apic_realize(X86CPU *cpu, Error **errp)
>      APICCommonState *apic;
>      static bool apic_mmio_map_once;
> =20
> -    if (cpu->apic_state =3D=3D NULL) {
> -        return;
> -    }
> +    assert(cpu->apic_state);

it would be better to explode in one place only inside apic_get_class(),
provided !kvm_irqchip_in_kernel() case is dealt with properly.


>      qdev_realize(DEVICE(cpu->apic_state), NULL, errp);
> =20
>      /* Map APIC MMIO area */
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index b2a20365e1..a23d4795e0 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -7448,9 +7448,11 @@ static void x86_cpu_realizefn(DeviceState *dev, Er=
ror **errp)
>      }
> =20
>  #ifndef CONFIG_USER_ONLY
> -    x86_cpu_apic_realize(cpu, &local_err);
> -    if (local_err !=3D NULL) {
> -        goto out;
> +    if (cpu->env.features[FEAT_1_EDX] & CPUID_APIC || ms->smp.cpus > 1) =
{
> +        x86_cpu_apic_realize(cpu, &local_err);
> +        if (local_err !=3D NULL) {
> +            goto out;
> +        }

better move 'if (cpu->apic_state =3D=3D NULL) {' from x86_cpu_apic_realize(=
)
to the caller, instead of repeating test again.

>      }
>  #endif /* !CONFIG_USER_ONLY */
>      cpu_reset(cs);
