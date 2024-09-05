Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp612270njb;
        Thu, 5 Sep 2024 12:06:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWtj7xZzHqbNxL0wJN08RR4HKFy91icz/YQiENS8+jCHsqKw6NGlC6l5dp5z8FJSrmcNoNbo9dwuMeyyA==@linaro.org
X-Google-Smtp-Source: AGHT+IEgKvFcqmKB+WBledMqqSaM0pYA4OXQhs40jN7fGx7psBCkw3ox4DV8xvCLV4ASOvqumao0
X-Received: by 2002:a05:6214:3c88:b0:6c3:3d7e:7152 with SMTP id 6a1803df08f44-6c5284f56e4mr4246046d6.25.1725563165257;
        Thu, 05 Sep 2024 12:06:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725563165; cv=none;
        d=google.com; s=arc-20240605;
        b=RaSFUrXxe+6rX0gtPzU2fntwUhnNKLJcwJMvZprm06VAtXq3Ot4DdDJRrf15tw3Nbq
         xbf/y741OY6qDLGt6jZiRGwGodhXe5/EdR/Pt7n/nUblFKIEGyqINj57Nex14vF96OJB
         yFKbsXDC4WnnVjeiMJUOhWoRo91iVnwGLfJ4Y4RfbdqLpSwouDG8e92ITN8dvFvlQfW5
         bcPIykTfkRByO/TrlujGtNq13npuIHyQyprFr2MTeWhYbsCpq11h1kdr5drursR6PUx0
         qwliOGITCIGq++GYVBxQf8tLTiemzf4UIGN5JiC+RKoU66sfr6C1EU0E0MsZVNKwMkJl
         3VxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=d/MP4tMhhHd/mwpBAPnELAzIOaMl8ctE+gXPc38noHU=;
        fh=7go9kyPdHxrcUrQ60a+Sb2R+yXzIjEtjuJkSPAOilS0=;
        b=RZW3vTpog5iDAHfzoeeteAwBENwgbj6OGVdZYWWSCLWpk9ZTBgm5e+2imEhxxADX74
         g5QckuhasYbw6JXJm9ObTNVSPBfJ1Z4Op/A4JC6utGqxf4P6BsZc6zM+VNpmzbt2t9Wa
         XA1h+8Z2VwSdKUROmHxgF7vjdxurbIOK9D2e1FwgDNGXSOVjBcKQwUX/Kw3mtv+9ed60
         7hEQeK7P6OrJhzR1+Wfb50pE2ASl8YBlBmmzRSJf+XIKtOGNrJyJ1WY7FwNRgoPWBQjA
         Z7xitHF1iDk1uyYyLoPx52uvQMAPV20ww1xGKii1SpNqK4zomqKYpGuoXzIIHGKTmuQA
         eo6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hy9kLAf8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c520525912si25728796d6.577.2024.09.05.12.06.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Sep 2024 12:06:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hy9kLAf8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1smHnQ-0004dj-Ld; Thu, 05 Sep 2024 15:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1smHnP-0004cg-GN
 for qemu-arm@nongnu.org; Thu, 05 Sep 2024 15:05:31 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1smHnN-0007f0-Jp
 for qemu-arm@nongnu.org; Thu, 05 Sep 2024 15:05:31 -0400
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2f4f8742138so13684611fa.0
 for <qemu-arm@nongnu.org>; Thu, 05 Sep 2024 12:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725563127; x=1726167927; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d/MP4tMhhHd/mwpBAPnELAzIOaMl8ctE+gXPc38noHU=;
 b=hy9kLAf82OaeRa65lP3X3F3et3OpzzH8uxO1/20urHaFnInn3sV035J2qYiIggKnb/
 Cwatb9CrxnmloHqqv1zc9Fqe5bHGGQlEszGC/R7wf3qABkI7pPIdrqyLBiGstosAwoIl
 shP58fWUq+KuYD6ldPa7kHt8L2z3Jv5U9/mc8anWWUrsugVzKq+vzGj8kIxvmxzKIUWf
 MWS5KDA51qjIX6Jh0lZbyZCCUAso/aBXjCmMI7imJc5A7DsJXW6nUqHkG/CXX4nbCZOp
 Iv2Ph5rP39F0JYYDbrqJycmj8FmjZCoYV3JCfUF7fP5Hjpnri5tn6pqNsXfDDRkfOrr4
 yyug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725563127; x=1726167927;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d/MP4tMhhHd/mwpBAPnELAzIOaMl8ctE+gXPc38noHU=;
 b=Nwe21Wg1WotjJwJa+1WGUTExp5N0hJZMNVo2lXfeEUspCKVu1bZ2SfDqFcV0IYtStx
 nEVq5cMyee2TPkOGRHWFVY/eL49CQ2PsTWGdbMxaINDrsfJIdeAdgmb4CszXP+CHELd8
 FJEdhQU85ht1zOWsSEtZSsNIeZLtWtnDWqteaBR3N04QbJg3WwRhN7ZBmlnSA8ZS3Hqh
 IkMmz4aE9kJBc4L1ntsTsLHeHoQnoIbdsdxhTmas7SJHOjEk4WT64nVfXdPMTKD8Malu
 hLQLPHvDsLaUOrb4RgSljoUI+xY6jehPMBvFSzEgUXKX98PjyiFAOMFRKaPfWZtA/h6W
 MsMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeGzOAKAd9uruuypVPOuQu2Qrtt1lu8Lw7UhecSmKkQf0rVkrP1GgIaR8EaDwRo/3FErNv7K3hog==@nongnu.org
X-Gm-Message-State: AOJu0YwIpLTkCTmbtEKU0lFyHK5W3H01IYQspAQ/jOqL5Eok2SrF5FdJ
 VK7LpCLEBvtcDEqbjEa0tSe8EXYypwKfEzXGZF9AEmc7UwJepiLjoo6NQ+6KmTO6yNP8I9Mgb2O
 TyguqRbIUO7y5GAIPUyj888nqoM1Q34yKf1XhUg==
X-Received: by 2002:a2e:be84:0:b0:2f4:fd6a:be38 with SMTP id
 38308e7fff4ca-2f751eaef73mr856431fa.2.1725563127070; Thu, 05 Sep 2024
 12:05:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240816103723.2325982-1-cohuck@redhat.com>
 <Zr8uNB8gaJTroMBU@redhat.com> <Ztn21z0ZR3_MiVQJ@redhat.com>
In-Reply-To: <Ztn21z0ZR3_MiVQJ@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Sep 2024 20:05:14 +0100
Message-ID: <CAFEAcA9ToJuZwGkJr2gCRf63uJom0b0QpdVv-OrAVVUGwB_2wQ@mail.gmail.com>
Subject: Re: [PATCH for-9.2] hw: add compat machines for 9.2
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Nicholas Piggin <npiggin@gmail.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, 
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Pv7MzKzdKvd5

On Thu, 5 Sept 2024 at 19:22, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Fri, Aug 16, 2024 at 11:47:16AM +0100, Daniel P. Berrang=C3=A9 wrote:
> > On Fri, Aug 16, 2024 at 12:37:23PM +0200, Cornelia Huck wrote:
> > > Add 9.2 machine types for arm/i440fx/m68k/q35/s390x/spapr.
> > >
> > > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > > ---
> > >  hw/arm/virt.c              |  9 ++++++++-
> > >  hw/core/machine.c          |  3 +++
> > >  hw/i386/pc.c               |  3 +++
> > >  hw/i386/pc_piix.c          | 15 ++++++++++++---
> > >  hw/i386/pc_q35.c           | 13 +++++++++++--
> > >  hw/m68k/virt.c             |  9 ++++++++-
> > >  hw/ppc/spapr.c             | 15 +++++++++++++--
> > >  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
> > >  include/hw/boards.h        |  3 +++
> > >  include/hw/i386/pc.h       |  3 +++
> > >  10 files changed, 77 insertions(+), 10 deletions(-)
> >
> > Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> >
> >
> > > diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> > > index d9e69243b4a7..746bfe05d386 100644
> > > --- a/hw/i386/pc_piix.c
> > > +++ b/hw/i386/pc_piix.c
> > > @@ -479,13 +479,24 @@ static void pc_i440fx_machine_options(MachineCl=
ass *m)
> > >                                       "Use a different south bridge t=
han PIIX3");
> > >  }
> > >
> > > -static void pc_i440fx_machine_9_1_options(MachineClass *m)
> > > +static void pc_i440fx_machine_9_2_options(MachineClass *m)
> > >  {
> > >      pc_i440fx_machine_options(m);
> > >      m->alias =3D "pc";
> > >      m->is_default =3D true;
> > >  }
> > >
> > > +DEFINE_I440FX_MACHINE(9, 2);
> > > +
> > > +static void pc_i440fx_machine_9_1_options(MachineClass *m)
> > > +{
> > > +    pc_i440fx_machine_9_2_options(m);
> > > +    m->alias =3D NULL;
> > > +    m->is_default =3D false;
> > > +    compat_props_add(m->compat_props, hw_compat_9_1, hw_compat_9_1_l=
en);
> > > +    compat_props_add(m->compat_props, pc_compat_9_1, pc_compat_9_1_l=
en);
> > > +}
> > > +
> > >  DEFINE_I440FX_MACHINE(9, 1);
> > >
> > >  static void pc_i440fx_machine_9_0_options(MachineClass *m)
> > > @@ -493,8 +504,6 @@ static void pc_i440fx_machine_9_0_options(Machine=
Class *m)
> > >      PCMachineClass *pcmc =3D PC_MACHINE_CLASS(m);
> > >
> > >      pc_i440fx_machine_9_1_options(m);
> > > -    m->alias =3D NULL;
> > > -    m->is_default =3D false;
> > >      m->smbios_memory_device_size =3D 16 * GiB;
> >
> > Feels like we should be adding an "_AS_LATEST" macro
> > variant for piix/q35 too, so it matches the pattern
> > in other targets for handling alias & is_default.
> >
> > Not a thing your patch needs todo though.
>
> I've just a patch that does that now. If it looks good & you want to incl=
ude
> it as a pre-requisite for your patch here feel free to grab, otherwise I =
can
> rebase it after your patch merges.

I have this patch in my target-arm pullreq that's currently posted
and pending merge, by the way.

-- PMM
