Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp807987njc;
        Wed, 22 Jan 2025 06:20:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWJ8t/VjKcPXt+ZDRiFJiBOOKAmA5zkyFkRtqZEK+03stwhPyM5JPuFoJxvHGFW/xRn3uRuOZxhaGdnNA==@linaro.org
X-Google-Smtp-Source: AGHT+IEDXpQpszP/jBUA6ZIq5epv8z5Mtz+tovDtRGOO50yAMEQusLpdzDYoJyVS+oso3MsMOzg7
X-Received: by 2002:a05:620a:800f:b0:7b6:dc74:82ac with SMTP id af79cd13be357-7be631e72b2mr3554170285a.1.1737555636032;
        Wed, 22 Jan 2025 06:20:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737555636; cv=none;
        d=google.com; s=arc-20240605;
        b=hzaOwKuFN48K761yBgjylabS8Ffr8E5oY+jI9fGxmcSW+zBfdv4ftGcR4SKdK2dspY
         IB5VKAWthYm8uZlwPcO3Nr6HGRdEOxsYCII9zHqdLkIxnMFmpZxaMdnoCGNnfBl5BRuj
         R1HzdpP8CN6OYaSo9EISk6VJ4WlfWrEBCcBmUHlRT3LqLbibdIAAGTDA/K2XRWDB+L0z
         24i4R3holancsAIFoKZo7SKr6CtIK8MO77biGxzgS+IgFd8rtfW8lC7aaDrD+7RX6/qI
         /3j92syPjCZgFEsSy3YMlHtE+XqprO6NoUgd4EdWPwgxSg7Ciju/qP3neONDkYcEZhC2
         7aSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=hA+rZJ5GcDFgsjh2IUI+9lMrJYjCKdYHEsuzgSkYNk4=;
        fh=RNWVUN2wppbT+nrOzYvpkM8kid0kBN5RZeauMRIress=;
        b=BPp3Po2OEjH3Df9KR0T3WsVmm0JGhqsXbSFH5A2Nvr/jnlz+IKtbxFACQO2annRmlB
         SUbjq4TLnXMUuq4YCWPQY6fKb12pWvmWPnZNQu4z8whhsFAF8sxXNg1mcQwMHLRDqhWk
         kyXelSWr02OjDE2o0MldT073O884gjC1QT6P4iFdhiQhCt0w8bP/bSNYX649ijTo7CVf
         VGoUMZ00UJZMrMV4tRSFxjkfB0+7l+4a/XtAAGnau+pJ2f/F/1kjGUnuoYjOjuRvoh6/
         EvidF0pYokAzPQDAn6nT0a4jd8DmKSilfdXNX2r+YOFJY2De6gq4HFotXGYRYznpYYQn
         SRdA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QUoJFt4L;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-46e102f17f4si163644021cf.48.2025.01.22.06.20.35
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 06:20:36 -0800 (PST)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QUoJFt4L;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737555635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hA+rZJ5GcDFgsjh2IUI+9lMrJYjCKdYHEsuzgSkYNk4=;
	b=QUoJFt4LAPjZxWdAsrbAf7bMcpS4EFySeIqHAzBow6dnMujDsWCOlUxTbZJ+WTbBUGsjWm
	pK92yZUTTI2lZlDZAMVPeWvvvlszqLJgAn28ZIVW7mpZXRE/uZYuFBIn7ZsurP8cpFkQy3
	nDnS9+yyuXckOciE0vQ18UlGQOgvrWg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-xrEGxNIvNrKj_j8jlT3Yfw-1; Wed, 22 Jan 2025 09:20:28 -0500
X-MC-Unique: xrEGxNIvNrKj_j8jlT3Yfw-1
X-Mimecast-MFC-AGG-ID: xrEGxNIvNrKj_j8jlT3Yfw
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43625ceae52so37872755e9.0
        for <alex.bennee@linaro.org>; Wed, 22 Jan 2025 06:20:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737555628; x=1738160428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dut6hZbDd6BfAIsiyGgJ+kYCdZA4Ogbk5rArrmutuEA=;
        b=IA2NjnYKHqgXdp5cg4o5jSIExBvqaj1U/nt+ftMu8gGNsQi14GRqMgdIofUmpWy1OV
         lMmpyyLDJi/vLBOM7ASegYlV+48DPiwR+OpQ9NeYbscExP13SKUD3iGjIb7aGaaDiadx
         FQYva2NNj+fti14a+zcAmdbUuBOykvSrFhamgZGP11gM7aA5yQjihynUTAFNaydooEdL
         QGz4hbTmY6nemD+c5dhUlWsErEN9XkfDEttUDevcCl732Y7S+FKjaJ0n/lqIeUN/qLVw
         QwJNZ9aYbF5e2JPYWm1PG3OXKSBGnpEGO12VyvWCIs2YC4XTcg+Xwn/DE9YQl1iIUG4S
         qU5w==
X-Forwarded-Encrypted: i=1; AJvYcCWMEbAsc68xONbHZt7nz4XeAHRQ1p7REGerqvTYs8p0d14lKV3dbVIOonii8/8v+R0QqXpwbB0KLkZM6w==@linaro.org
X-Gm-Message-State: AOJu0YytFZwmTgRuYKxfvE0nxZ76d2Te+26ZXns8osLOVtitu9x3M1nV
	S0HJvtIR8JMdnMmla5XC2KyCBaok8PIehTCuQsadV+ksO/XPtxjrkndGBKZIjKadMiHjZlUa1YF
	tqE/EA1Kr7Sz+zmtyZGo1uUASRhTRjK4e+ZdQzBHzIm2p+qIkXXjm6Q==
X-Gm-Gg: ASbGncuDvaLwqY/HhxQBEzR3AweipWp2g1/oU307bsGDk3YJD5mHc0xHgy83dw2jdAa
	cEktk/H1IkC/4tk3G+GBJ16iq/8xtzyGa0UZzxv5WEmp0KizE/Trhn0Lt45OeFJPzezBvrvPajl
	UWQpzulQbS5BoudF+H8OfsYSOWEMSEDwW4ETa2CEZRiBD2jOGeNKcKRsTGD7inr4WcWrf8S5s5O
	yMhSB4rGMAj1wrd1jRT0+Udp1pm5p6C9W5V8fo0TXY0Dcqwi3mUjBECdxS7HHlnspVCR4RcwJiJ
	7cVhmYWHujtZxiAfNZeKiqx3AXKtYRZaU9JbKKPc+g==
X-Received: by 2002:a05:600c:4710:b0:434:a59c:43c6 with SMTP id 5b1f17b1804b1-43891451388mr174742565e9.26.1737555627670;
        Wed, 22 Jan 2025 06:20:27 -0800 (PST)
X-Received: by 2002:a05:600c:4710:b0:434:a59c:43c6 with SMTP id 5b1f17b1804b1-43891451388mr174742065e9.26.1737555627147;
        Wed, 22 Jan 2025 06:20:27 -0800 (PST)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31af925sm26918075e9.23.2025.01.22.06.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 06:20:26 -0800 (PST)
Date: Wed, 22 Jan 2025 15:20:23 +0100
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
Subject: Re: [PATCH 06/22] exec/cpu: Call cpu_remove_sync() once in
 cpu_common_unrealize()
Message-ID: <20250122152023.5ee90f50@imammedo.users.ipa.redhat.com>
In-Reply-To: <5f25576c-598f-4fd7-8238-61edcff2c411@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
	<20230918160257.30127-7-philmd@linaro.org>
	<20231128174215.32d2a350@imammedo.users.ipa.redhat.com>
	<5f25576c-598f-4fd7-8238-61edcff2c411@linaro.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yagOErThxIiG15M1ZCZvAW6qDjI6EfkQSeA-V_rEDTs_1737555628
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: aRo7U9zsqHxn

On Thu, 16 Jan 2025 19:05:46 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> On 28/11/23 17:42, Igor Mammedov wrote:
> > On Mon, 18 Sep 2023 18:02:39 +0200
> > Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> >  =20
> >> While create_vcpu_thread() creates a vCPU thread, its counterpart
> >> is cpu_remove_sync(), which join and destroy the thread.
> >>
> >> create_vcpu_thread() is called in qemu_init_vcpu(), itself called
> >> in cpu_common_realizefn(). Since we don't have qemu_deinit_vcpu()
> >> helper (we probably don't need any), simply destroy the thread in
> >> cpu_common_unrealizefn().
> >>
> >> Note: only the PPC and X86 targets were calling cpu_remove_sync(),
> >> meaning all other targets were leaking the thread when the vCPU
> >> was unrealized (mostly when vCPU are hot-unplugged).
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >> ---
> >>   hw/core/cpu-common.c  | 3 +++
> >>   target/i386/cpu.c     | 1 -
> >>   target/ppc/cpu_init.c | 2 --
> >>   3 files changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
> >> index a3b8de7054..e5841c59df 100644
> >> --- a/hw/core/cpu-common.c
> >> +++ b/hw/core/cpu-common.c
> >> @@ -221,6 +221,9 @@ static void cpu_common_unrealizefn(DeviceState *de=
v)
> >>  =20
> >>       /* NOTE: latest generic point before the cpu is fully unrealized=
 */
> >>       cpu_exec_unrealizefn(cpu);
> >> +
> >> +    /* Destroy vCPU thread */
> >> +    cpu_remove_sync(cpu);
> >>   }
> >>  =20
> >>   static void cpu_common_initfn(Object *obj)
> >> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> >> index cb41d30aab..d79797d963 100644
> >> --- a/target/i386/cpu.c
> >> +++ b/target/i386/cpu.c
> >> @@ -7470,7 +7470,6 @@ static void x86_cpu_unrealizefn(DeviceState *dev=
)
> >>       X86CPUClass *xcc =3D X86_CPU_GET_CLASS(dev);
> >>  =20
> >>   #ifndef CONFIG_USER_ONLY
> >> -    cpu_remove_sync(CPU(dev));
> >>       qemu_unregister_reset(x86_cpu_machine_reset_cb, dev);
> >>   #endif =20
> >=20
> > missing  followup context:
> >      ...
> >      xcc->parent_unrealize(dev);
> >=20
> > Before the patch, vcpu thread is stopped and onnly then
> > clean up happens.
> >=20
> > After the patch we have cleanup while vcpu thread is still running.
> >=20
> > Even if it doesn't explode, such ordering still seems to be wrong. =20
>=20
> OK.

looking at all users, some do stop vcpu thread before tearing down vcpu obj=
ect
and interrupt controller, while some do it other way around or mix of both.

It's probably safe to stop vcpu thread wrt intc cleanup.
Can you check what would happen if there were a pending interrupt,
but then flowing would happen:
 1. destroying intc
 2. can vcpu thread just kicked out from KVM_RUN,
    trip over missing/invalid intc state while thread runs towards its exit=
 point?

If above can't crash then,
I'd prefer to stop vcpu at least before vcpu cleanup is run.
i.e. put cpu_remove_sync() as the very 1st call inside of cpu_common_unreal=
izefn()

> >> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> >> index e2c06c1f32..24d4e8fa7e 100644
> >> --- a/target/ppc/cpu_init.c
> >> +++ b/target/ppc/cpu_init.c
> >> @@ -6853,8 +6853,6 @@ static void ppc_cpu_unrealize(DeviceState *dev)
> >>  =20
> >>       pcc->parent_unrealize(dev);
> >>  =20
> >> -    cpu_remove_sync(CPU(cpu)); =20
> >=20
> > bug in current code? =20
>=20
> Plausibly. See:
>=20
> commit f1023d21e81b7bf523ddf2ac91a48117f20ef9d7
> Author: Greg Kurz <groug@kaod.org>
> Date:   Thu Oct 15 23:18:32 2020 +0200
>=20
>      spapr: Unrealize vCPUs with qdev_unrealize()
>=20
>      Since we introduced CPU hot-unplug in sPAPR, we don't unrealize the
>      vCPU objects explicitly. Instead, we let QOM handle that for us
>      under object_property_del_all() when the CPU core object is
>      finalized. The only thing we do is calling cpu_remove_sync() to
>      tear the vCPU thread down.
>=20
>      This happens to work but it is ugly because:
>      - we call qdev_realize() but the corresponding qdev_unrealize() is
>        buried deep in the QOM code
>      - we call cpu_remove_sync() to undo qemu_init_vcpu() called by
>        ppc_cpu_realize() in target/ppc/translate_init.c.inc
>      - the CPU init and teardown paths aren't really symmetrical
>=20
>      The latter didn't bite us so far but a future patch that greatly
>      simplifies the CPU core realize path needs it to avoid a crash
>      in QOM.
>=20
>      For all these reasons, have ppc_cpu_unrealize() to undo the changes
>      of ppc_cpu_realize() by calling cpu_remove_sync() at the right
>      place, and have the sPAPR CPU core code to call qdev_unrealize().
>=20
>      This requires to add a missing stub because translate_init.c.inc is
>      also compiled for user mode.
>=20
> >  =20
> >> -
> >>       destroy_ppc_opcodes(cpu);
> >>   }
> >>    =20
>=20
