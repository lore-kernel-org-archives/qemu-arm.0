Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp1457611lfb;
        Tue, 22 Mar 2022 04:21:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwu/PqFhXmUuBcEgngI9cgdPlHyj+ruf7QED4gsNLRjEPsAPC8tWTsVFHeWLt1ZyY4cS+Gp
X-Received: by 2002:a05:6214:f27:b0:441:1380:99a0 with SMTP id iw7-20020a0562140f2700b00441138099a0mr9711345qvb.112.1647948092187;
        Tue, 22 Mar 2022 04:21:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647948092; cv=none;
        d=google.com; s=arc-20160816;
        b=Pg5cHBu/afaMfJzAlxffiA0fEfLLXQHuI7fyEWV9t1uBqnlW/+pZJeeAW3+4ke3/ge
         boS6OZoN22m2UiBPqfG7Wo9htYe97T1TsXMtwddJgwE/2eunVMmeo2mBL1DO1Ytc3P1X
         lzeR4fIEv3hBG55vOvYZb2NfG72jXISkxeeB6MmWFMXOx5gtlZkBT24wCMA9NX9LN6P2
         NFczkNwXDduv2cfUwg4ktUDoym0k6lbT69j7e+G2ggvkAJwtkYAy84lchw5dxNvUuOYM
         IKR+c0SLKEALJb84/XMS0kZlkAWWbPDiRjVb2IforUHRTVi52JuJePddFPGYIhTBlfal
         SgBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=sI/gJK8PHjVhsB9l+0a1Cbfqayf1bW3iE9HELjmMQqg=;
        b=zXVM9XWrllnOt1Bc58BQCiyvftRc0OuPGRjbM0A8J2FqOU80nmH6bNkCnCT4xtCkCF
         6kcCWInTQqgYDjBWMzcRe1+fYrJtxEKOXCOwcuNlgHcR6iYNE0xfMh260TqO3xdVPG6Y
         K7/wtCAaZVS+QSkLCs26sthn+XXPh/tkf3D0oj7MYSxkm0RdYhYUgzMCyPxkraOvQoGZ
         y9L3ozCiTQPa9MfNhSI2xpN7PronhJFOPGjrRRhaULoeFLvZ89kUQN3IthxAtEyP2H1z
         w++SYxmQn6WbACmu45DpuTeWBeOkpoLik03x2P/xqS4/r5ijkH7ByvuI+EEtV9vCqJv6
         pQfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EftSiD3P;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id l21-20020a05620a28d500b0067e4be23899si3128313qkp.222.2022.03.22.04.21.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Mar 2022 04:21:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EftSiD3P;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647948091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sI/gJK8PHjVhsB9l+0a1Cbfqayf1bW3iE9HELjmMQqg=;
	b=EftSiD3PcX0shmtuC/wExefjbPvgP/G5RmGp7fZkwO9KfOVA/BXzV+Rl6cgjmuk7K0cNtd
	fHRArcPWQc3aE0kx4Byg9c22l5gygZZeGTjvEkDi7K+pK52YT0vx959D5OcD/1//bi0N2U
	5wVsvhHXdW4iqcrpPJ7bRimVj7XNA0g=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-PSjwuRpxMd-N_u9Vaj-XEQ-1; Tue, 22 Mar 2022 07:21:28 -0400
X-MC-Unique: PSjwuRpxMd-N_u9Vaj-XEQ-1
Received: by mail-ed1-f70.google.com with SMTP id b71-20020a509f4d000000b00418d658e9d1so10256565edf.19
        for <alex.bennee@linaro.org>; Tue, 22 Mar 2022 04:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bx3w8/lhlewJ7oUWvr/1eh6laDl4Abf2g0d4r2c9J7s=;
        b=4OXL3gzukjITNR0+HhiUVWYeGnrkqw5Zlu+ve+pKgczP7M3g6r/7389f3/2bwr0vWp
         o6bQ+6k4QHtOA975Kl3vugUfYhHXac0h8Fuu9FuRxxI6hL5WDKK0/0q1k23ayCRiU2qa
         RM8H4m3LoiRgLiyoafy9xlSKxUKpOxgLPYdeLckd8F2xxh/foryhphuOvGkKqXvbncMU
         gIY2gNbmNoUnwmCTS/Yru/rgEgVBRnAsVFFCpB/iY5Jfk4vlGfbwIBi31xdUpoc99VlZ
         r0aoXuIZwMGHGe9fwODtTbDzkG9z98HGplnp6x58vl5ivW1LljRkGTErg2sXeHEHN78j
         HMWg==
X-Gm-Message-State: AOAM533wPWNW/2w372xDASekbHR1a71SDjSRP1Am7BfvfoYQszxmzcfl
	NiFqAsIdS9EPVUXRSUoB+5s/an1lhX0FsIX1oYqidDEurh+8cZ62EKqMbAQGqn4cg6brmqCTgoK
	wwYUSWTzrarOZOvks
X-Received: by 2002:a05:6402:5243:b0:419:4ce2:cb5c with SMTP id t3-20020a056402524300b004194ce2cb5cmr6931851edd.151.1647948087467;
        Tue, 22 Mar 2022 04:21:27 -0700 (PDT)
X-Received: by 2002:a05:6402:5243:b0:419:4ce2:cb5c with SMTP id t3-20020a056402524300b004194ce2cb5cmr6931812edd.151.1647948087187;
        Tue, 22 Mar 2022 04:21:27 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id hs12-20020a1709073e8c00b006dfd7dee980sm4080173ejc.30.2022.03.22.04.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 04:21:26 -0700 (PDT)
Date: Tue, 22 Mar 2022 12:21:24 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Gerd Hoffmann
 <kraxel@redhat.com>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?=
 Lureau <marcandre.lureau@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>, Laurent Vivier
 <lvivier@redhat.com>, Amit Shah <amit@kernel.org>, Peter Maydell
 <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Corey Minyard <cminyard@mvista.com>,
 Patrick Venture <venture@google.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Peter
 Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>, =?UTF-8?B?Q8Op?=
 =?UTF-8?B?ZHJpYw==?= Le Goater <clg@kaod.org>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, Greg
 Kurz <groug@kaod.org>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <f4bug@amsat.org>, Jean-Christophe Dubois <jcd@tribudubois.net>, Keith
 Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>, Yuval Shaia
 <yuval.shaia.ml@gmail.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Fabien Chouteau
 <chouteau@adacore.com>, KONRAD Frederic <frederic.konrad@adacore.com>, Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko
 <atar4qemu@gmail.com>, Alex Williamson <alex.williamson@redhat.com>, Eric
 Auger <eric.auger@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, Juan
 Quintela <quintela@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Konstantin Kostiuk <kkostiuk@redhat.com>, Michael
 Roth <michael.roth@amd.com>, "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Alex
 =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, David Hildenbrand
 <david@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>, Kamil Rytarowski
 <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>, Sunil Muthuswamy
 <sunilmut@microsoft.com>, Cornelia Huck <cohuck@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Eric Blake <eblake@redhat.com>, Vladimir
 Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, John Snow
 <jsnow@redhat.com>, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 haxm-team@intel.com, qemu-s390x@nongnu.org
Subject: Re: [PATCH v2 3/3] Use g_new() & friends where that makes obvious
 sense
Message-ID: <20220322122124.4f1d76e9@redhat.com>
In-Reply-To: <20220315144156.1595462-4-armbru@redhat.com>
References: <20220315144156.1595462-1-armbru@redhat.com>
	<20220315144156.1595462-4-armbru@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: eMYPmiMFsOlY

On Tue, 15 Mar 2022 15:41:56 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
> for two reasons.  One, it catches multiplication overflowing size_t.
> Two, it returns T * rather than void *, which lets the compiler catch
> more type errors.
>=20
> This commit only touches allocations with size arguments of the form
> sizeof(T).
>=20
> Patch created mechanically with:
>=20
>     $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocci =
\
> =09     --macro-file scripts/cocci-macro-file.h FILES...
>=20
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


for */i386/*
Reviewed-by: Igor Mammedov <imammedo@redhat.com>


nit:
possible miss, see below=20

[...]
> diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> index cf8e500514..0731f70410 100644
> --- a/hw/i386/xen/xen-hvm.c
> +++ b/hw/i386/xen/xen-hvm.c

missed:

 pfn_list =3D g_malloc(sizeof (*pfn_list) * nr_pfn);


> @@ -396,7 +396,7 @@ go_physmap:
> =20
>      mr_name =3D memory_region_name(mr);
> =20
> -    physmap =3D g_malloc(sizeof(XenPhysmap));
> +    physmap =3D g_new(XenPhysmap, 1);
> =20
>      physmap->start_addr =3D start_addr;
>      physmap->size =3D size;
> @@ -1281,7 +1281,7 @@ static void xen_read_physmap(XenIOState *state)
>          return;
> =20
>      for (i =3D 0; i < num; i++) {
> -        physmap =3D g_malloc(sizeof (XenPhysmap));
> +        physmap =3D g_new(XenPhysmap, 1);
>          physmap->phys_offset =3D strtoull(entries[i], NULL, 16);
>          snprintf(path, sizeof(path),
>                  "/local/domain/0/device-model/%d/physmap/%s/start_addr",
> @@ -1410,7 +1410,7 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRe=
gion **ram_memory)
>      xen_pfn_t ioreq_pfn;
>      XenIOState *state;
> =20
> -    state =3D g_malloc0(sizeof (XenIOState));
> +    state =3D g_new0(XenIOState, 1);
> =20
>      state->xce_handle =3D xenevtchn_open(NULL, 0);
>      if (state->xce_handle =3D=3D NULL) {
> @@ -1463,7 +1463,7 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRe=
gion **ram_memory)
>      }
> =20
>      /* Note: cpus is empty at this point in init */
> -    state->cpu_by_vcpu_id =3D g_malloc0(max_cpus * sizeof(CPUState *));
> +    state->cpu_by_vcpu_id =3D g_new0(CPUState *, max_cpus);
> =20
>      rc =3D xen_set_ioreq_server_state(xen_domid, state->ioservid, true);
>      if (rc < 0) {
> @@ -1472,7 +1472,7 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRe=
gion **ram_memory)
>          goto err;
>      }
> =20
> -    state->ioreq_local_port =3D g_malloc0(max_cpus * sizeof (evtchn_port=
_t));
> +    state->ioreq_local_port =3D g_new0(evtchn_port_t, max_cpus);

[...]
