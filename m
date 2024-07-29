Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp1738681njb;
        Mon, 29 Jul 2024 04:54:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV7oiP0y3DbBNxhlgjDS4EkZTQXN/0UR2uOYNGqpc17tRX6Rkx96RW+axf2on0nIrb6bHBm8xCBiM63b7GMhXNWcV51eR9N
X-Google-Smtp-Source: AGHT+IE792qxRsBm+RF0lSZrRDBlEpqHMQz7ez0hknfeYJq57fRNdw/ILoufKfmrdCDAMb1se+vW
X-Received: by 2002:a05:6214:2024:b0:6b5:44c2:843b with SMTP id 6a1803df08f44-6bb55a83d8emr100526396d6.46.1722254098825;
        Mon, 29 Jul 2024 04:54:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722254098; cv=none;
        d=google.com; s=arc-20160816;
        b=jDvfej2wSDXkDeZenr0sAcutDC3W4LZVV70mDkOqPKuaa4qpXnknCYpjMakg9DTt0b
         NGwIPU1+X90B7kwlenwObmxIWE74mUy02l4Boq4l8E+py9YDY13a1FyFxUni0MWObSXh
         agGhOJ1JVF3iti9mAHQhctovU2DxgPWQPxTbyctVxTXWaQ68zP9bvL5r7QWU/rL+yoFV
         TWLfaqsDBnqb/f08tu51FCO5PwivbMqZ7ckA3jwrtjxUunzV6+9ZepGRSANsWzFmaKiJ
         JCG4zML07zK196izfxGSCAfaiPVPahqqzAE7YEw72+9ZVBqolG1rEjaHV5hY8/F2zJJG
         7TZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a4NZQE0a01E7gkys5wMB3DntjcYY2NgIlYja4WDLw5Q=;
        fh=7NgbE2xgFh44ZGz60K7OrDIQXzACx5dbAHzqOPcgkL4=;
        b=MuYl6ScXkmTzRBJL50TE1+0CvCMBsesjQYxD3qWSFopaumKOs2s6BqIrLOLfCDgDTi
         loDPAyLaD9e5EsLVqHNir8HW+VoSdHQEufuutTH7LN9PHsCe9B37VHA9xN3Lo9dibTdq
         f2jloy6qDI0xNIDqkhsSThWVhDp3UDYxL8iawyXqyBXewwcdDkDhmxG3sVspTi3K2wJo
         kCAhni3ZegXrws5E+7FNcNMGPkqJXTNebKk5b+0y7Qzp3ASnXFXF/FsGN1iPHdEekHpl
         SFzpvOpMqlz0V6kxT422r6Voy8VradApLkmQmUwnUDhXZiSnFiyEM0MF5QZcKXNO1QO/
         k6UQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HBMRV1H7;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb3fa87053si100954916d6.305.2024.07.29.04.54.58
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 04:54:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HBMRV1H7;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722254098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a4NZQE0a01E7gkys5wMB3DntjcYY2NgIlYja4WDLw5Q=;
	b=HBMRV1H7K8T14Um7t+AFXffwMWTK7jvIc4zS62pBWK8HpSv4w0okKEcxgbdPGUed3dGoJA
	9T0J5sPkpVbuCUVAFrE+T3kKts58H0lg0OTOn3vh2lPkMs01AyoMqp3A+dXSikLrdRaeNO
	eJpqPCFZlClCHeNZ59IljsWo/qYJcR4=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-_u-zRidJOj2bN_5rqRPBLA-1; Mon, 29 Jul 2024 07:54:57 -0400
X-MC-Unique: _u-zRidJOj2bN_5rqRPBLA-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-66a2aee82a0so47220617b3.0
        for <alex.bennee@linaro.org>; Mon, 29 Jul 2024 04:54:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722254095; x=1722858895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a4NZQE0a01E7gkys5wMB3DntjcYY2NgIlYja4WDLw5Q=;
        b=rxTSmdVsUAYWxvUdbF0xoovqa0vaB9G5/lCNKN1WjLELBL7FFikHvi0tRe3s94kiXm
         HkuEWHp8bOJvkdGCqJ66j5XVmqppKwLy3ZWHViqJ/E5H1qbK+/wadNn8qz1DAKC+tsdm
         btUhtKfSfMHMv4eKTv+4YsgUZTumNKx1XutiOSXnAl2vStXMjzTBv16HeLTAFEi9JwBH
         uO5bUHX0qflSKMgOLwVyPl0KY/UeHGEoiB85Dp2AVKLDky+Nlfpy0h+sEhBiuverS27u
         KZuUiL50TSDt8IbRpMwjLWhIZOTxRnWyCLp1Q2ExCwXPdG++BazFB1RD3IbW6ZHA+HDR
         /YPw==
X-Forwarded-Encrypted: i=1; AJvYcCX4U/hx+6+r4qqxCqi09VYVw2qK+uaJkHBDhRKlOnSouNyvde4fAci9MsB3on4FocgdL5gtDsvmq1ajVFo7kVvdc3x+qZ9Z
X-Gm-Message-State: AOJu0YyXXQPMpq5yW6XTd2qneZfeTyTvv+r1CZ257P+YtIdEbob+rNik
	tKM8IZaigLefmkMcafcx4v48/Xc8AiMEIHm1dwBKqln/5Zs/JzTqdrtTx/vjbDe6b1KTocpnMlu
	n6fDOIlV+xK+MpXKxzUubxODjvrpx/N5rq/yDJgW8DmEFbKTjz4/CNdb6Aswu0FMsNkzyGuuKw8
	Hj+bd4mAoeBFPI4M/LnzptqVc9vYGd
X-Received: by 2002:a0d:cd45:0:b0:66a:843c:4c38 with SMTP id 00721157ae682-67a09b7279cmr66399207b3.37.1722254095615;
        Mon, 29 Jul 2024 04:54:55 -0700 (PDT)
X-Received: by 2002:a0d:cd45:0:b0:66a:843c:4c38 with SMTP id
 00721157ae682-67a09b7279cmr66399057b3.37.1722254095312; Mon, 29 Jul 2024
 04:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240726134438.14720-1-crosa@redhat.com> <20240726134438.14720-6-crosa@redhat.com>
 <ZqdwJRRBjj5DsWh8@redhat.com>
In-Reply-To: <ZqdwJRRBjj5DsWh8@redhat.com>
From: Cleber Rosa <crosa@redhat.com>
Date: Mon, 29 Jul 2024 07:54:40 -0400
Message-ID: <CA+bd_6Jj-DgpkouznuDC-ViOhi4zLu-SxnyrnyV6ceycHhEBiA@mail.gmail.com>
Subject: Re: [PATCH 05/13] tests/avocado: machine aarch64: standardize
 location and RO access
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, David Woodhouse <dwmw2@infradead.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Leif Lindholm <quic_llindhol@quicinc.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, kvm@vger.kernel.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org, 
	Radoslaw Biernacki <rad@semihalf.com>, Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: galZSAKewCy4

On Mon, Jul 29, 2024 at 6:34=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> On Fri, Jul 26, 2024 at 09:44:30AM -0400, Cleber Rosa wrote:
> > The tests under machine_aarch64_virt.py and machine_aarch64_sbsaref.py
> > should not be writing to the ISO files.  By adding "media=3Dcdrom" the
> > "ro" is autmatically set.
> >
> > While at it, let's use a single code style and hash for the ISO url.
> >
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > ---
> >  tests/avocado/machine_aarch64_sbsaref.py |  6 +++++-
> >  tests/avocado/machine_aarch64_virt.py    | 14 +++++++-------
> >  2 files changed, 12 insertions(+), 8 deletions(-)
> >
> > diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/m=
achine_aarch64_sbsaref.py
> > index e920bbf08c..1275f24532 100644
> > --- a/tests/avocado/machine_aarch64_sbsaref.py
> > +++ b/tests/avocado/machine_aarch64_sbsaref.py
> > @@ -129,7 +129,11 @@ def boot_alpine_linux(self, cpu):
> >              "-cpu",
> >              cpu,
> >              "-drive",
> > -            f"file=3D{iso_path},format=3Draw",
> > +            f"file=3D{iso_path},media=3Dcdrom,format=3Draw",
> > +            "-device",
> > +            "virtio-rng-pci,rng=3Drng0",
> > +            "-object",
> > +            "rng-random,id=3Drng0,filename=3D/dev/urandom",
> >          )
>
> The commit message doesn't say anything about adding virtio-rng.
> If that's needed for some reason, do it as a separate commit
> with an explanation of the bug its fixing.
>

This is actually a rebase mistake.  virtio-rng was removed in 21f123f3c.

I'll fix it in a v2.

Thanks for spotting it,
- Cleber.
