Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp122807lfc;
        Fri, 19 Feb 2021 22:03:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMNALhkpjBD/KTadx89lL9iT7d5F5YidYGYcT6QpVrWusmAkoU2vE1Az/JMj621v18ixjz
X-Received: by 2002:a25:ae14:: with SMTP id a20mr19413868ybj.129.1613800992459;
        Fri, 19 Feb 2021 22:03:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613800992; cv=none;
        d=google.com; s=arc-20160816;
        b=uSvvmdObaV48W06CTqXunR2HwoKjtkj63EywNv8sIHsxHy1eaPcdG2xnr8XcCC5D4j
         9nz6PBJpWz479Ha07rVnzNQpXg4Oso14RMIkHBI6iNEvGfMwJtYVvmDHTbxXCm+gIkwZ
         SgH8Y+ws+eP7asaiCRQHeAUZRZiIP1OgUHMW/xjwX5YoeCbbdv9FrUDApk9j9dBFqG/P
         PdyqTiDfxPMNuJyxJgea9/wOA88etQCiE88Du9dfiMYCIezQ3IdTj075JmWRTv0sNfgM
         R6oQCpMJPfmc4yEW7jKzBeB5uU/gfz4jKgh7l+LKu66ZSZeKGyMTdfKNahmOg0wX9iJ3
         Do3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=JBL7IjR2/50kVUvtZ1o5ZQ0ZZAtIdlBAq7Jr7Vz2siw=;
        b=doG8y94hsGrxPt0Cf5t8pLYmUarMjcgWLoUv9rEMBUDKKqD9ZY4RM2el+mKhCvkRfo
         j1RqkfxNz18WEuAQTAZFioqYQZzpn2e4ZDMLQGfIUbgztA96GYZUHRGNyPSMPQA+6dNy
         1ZEz/g9Oz9+sWuB4Oob4uP/Msu2C8pGR4+kPnOneV6b60nOimcHCBrAGE+gOVI2s3FKQ
         p6X+3lmOArf7zjplmPDIhEjKteanJ65mnX/zZ+TGyqTLS4RVeGUxBxJyIxccy0qkhXah
         uiL31kCM/f/9gS7VfkhwzzQQVoSMAWISh4+9ZyewXeeA4iSMDFvX319yVAAzLwxVVTfH
         8nVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@kernel.org header.s=k20201202 header.b=YSQAOBZj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8si11588063ybq.95.2021.02.19.22.03.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 22:03:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@kernel.org header.s=k20201202 header.b=YSQAOBZj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1]:44514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lDLMF-0000yw-UD
	for alex.bennee@linaro.org; Sat, 20 Feb 2021 01:03:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1lDLLY-0000yb-L0; Sat, 20 Feb 2021 01:02:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:38162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1lDLLW-0001p4-Ej; Sat, 20 Feb 2021 01:02:28 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C83B864EE4;
 Sat, 20 Feb 2021 06:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613800941;
 bh=ShcGVisZXSeMg1DM1Ug/ltlAeszRZetvwkkEgFVlNas=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YSQAOBZjx77Ns4trHoOsngxkQa38xVjltXBABkfbX425KuGX5umsxwyesIcw3M9m0
 E1CBeP+KT/7ktq3qJsK+8ztsAyUo1Y+szBDMXVBUy0LssKWNWODnxjYIHb7kwI0p/U
 OMtv1pX83FzJa09GTTmNeee7rrVKV5Rx57K2tgRQUkoBozsoihRJj5tAd3g/guoNFq
 6dYliAq0igKoimsq0gG8LbZNbMgmQ/dhvUaUHgPv0ypgHnSvTgIePgQyXuaLXydf1z
 grZ/lAFZ3Vje1rb1fjKjkE0NPbbhKxxJZc4dBaGoIP5s/mLVrydINYb/OD9SVtUKPj
 TNTNGsBRQIZHA==
Received: by mail-il1-f180.google.com with SMTP id m20so6341516ilj.13;
 Fri, 19 Feb 2021 22:02:21 -0800 (PST)
X-Gm-Message-State: AOAM531A/qujD8gDWX6GxDv9qF8ALPBvfuH+RMsv04QZmEKb3e3VMwAh
 3xVZ8v497OWumrstV6xKrM/nHkKoPqKhEf2v9hY=
X-Received: by 2002:a92:6907:: with SMTP id e7mr6713495ilc.134.1613800941002; 
 Fri, 19 Feb 2021 22:02:21 -0800 (PST)
MIME-Version: 1.0
References: <20210219173847.2054123-1-philmd@redhat.com>
 <20210219173847.2054123-6-philmd@redhat.com>
 <31a32613-2a61-7cd2-582a-4e6d10949436@flygoat.com>
In-Reply-To: <31a32613-2a61-7cd2-582a-4e6d10949436@flygoat.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 20 Feb 2021 14:02:08 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6TJyP8diBUu4EsSWSNrVP7YxxPaMNnm2uuZJfdGY40Jg@mail.gmail.com>
Message-ID: <CAAhV-H6TJyP8diBUu4EsSWSNrVP7YxxPaMNnm2uuZJfdGY40Jg@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] hw/mips: Restrict KVM to the malta & virt
 machines
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=198.145.29.99; envelope-from=chenhuacai@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm <kvm@vger.kernel.org>, Paul Durrant <paul@xen.org>,
 David Hildenbrand <david@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2R5dTP1cY6PS

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

On Sat, Feb 20, 2021 at 12:56 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrot=
e:
>
> =E5=9C=A8 2021/2/20 =E4=B8=8A=E5=8D=881:38, Philippe Mathieu-Daud=C3=A9 =
=E5=86=99=E9=81=93:
> > Restrit KVM to the following MIPS machines:
> > - malta
> > - loongson3-virt
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>
> > ---
> >   hw/mips/loongson3_virt.c | 5 +++++
> >   hw/mips/malta.c          | 5 +++++
> >   2 files changed, 10 insertions(+)
> >
> > diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
> > index d4a82fa5367..c3679dff043 100644
> > --- a/hw/mips/loongson3_virt.c
> > +++ b/hw/mips/loongson3_virt.c
> > @@ -612,6 +612,10 @@ static void mips_loongson3_virt_init(MachineState =
*machine)
> >       loongson3_virt_devices_init(machine, liointc);
> >   }
> >
> > +static const char *const valid_accels[] =3D {
> > +    "tcg", "kvm", NULL
> > +};
> > +
> >   static void loongson3v_machine_class_init(ObjectClass *oc, void *data=
)
> >   {
> >       MachineClass *mc =3D MACHINE_CLASS(oc);
> > @@ -622,6 +626,7 @@ static void loongson3v_machine_class_init(ObjectCla=
ss *oc, void *data)
> >       mc->max_cpus =3D LOONGSON_MAX_VCPUS;
> >       mc->default_ram_id =3D "loongson3.highram";
> >       mc->default_ram_size =3D 1600 * MiB;
> > +    mc->valid_accelerators =3D valid_accels;
> >       mc->kvm_type =3D mips_kvm_type;
> >       mc->minimum_page_bits =3D 14;
> >   }
> > diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> > index 9afc0b427bf..0212048dc63 100644
> > --- a/hw/mips/malta.c
> > +++ b/hw/mips/malta.c
> > @@ -1443,6 +1443,10 @@ static const TypeInfo mips_malta_device =3D {
> >       .instance_init =3D mips_malta_instance_init,
> >   };
> >
> > +static const char *const valid_accels[] =3D {
> > +    "tcg", "kvm", NULL
> > +};
> > +
> >   static void mips_malta_machine_init(MachineClass *mc)
> >   {
> >       mc->desc =3D "MIPS Malta Core LV";
> > @@ -1456,6 +1460,7 @@ static void mips_malta_machine_init(MachineClass =
*mc)
> >       mc->default_cpu_type =3D MIPS_CPU_TYPE_NAME("24Kf");
> >   #endif
> >       mc->default_ram_id =3D "mips_malta.ram";
> > +    mc->valid_accelerators =3D valid_accels;
> >   }
> >
> >   DEFINE_MACHINE("malta", mips_malta_machine_init)
>
