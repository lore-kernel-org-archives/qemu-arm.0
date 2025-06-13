Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp479642njc;
        Fri, 13 Jun 2025 12:37:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWFPRsyEqLHXeCrTf2dKOBfCzJfKweldsvIkgtvbSbmu9ogH4UdMRpvKqiEssXRot/DQ1GVaDni9jxl3A==@linaro.org
X-Google-Smtp-Source: AGHT+IF9wRMJcBqPztQIAmg643ZvurVIYa8ouiZmSKRkIrQMKoB2ZiYqx5jl3ng9HfUjoqIuFnqg
X-Received: by 2002:a05:622a:5c6:b0:4a4:2c46:26a2 with SMTP id d75a77b69052e-4a73c5754fcmr6624081cf.10.1749843427345;
        Fri, 13 Jun 2025 12:37:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749843427; cv=none;
        d=google.com; s=arc-20240605;
        b=AuNjnbezArp6UGFSpBzAq+TWKPyxOinPp91Zggm0x2oOU6LgMPh7wLMKYp/1BzIntQ
         +qCdT33KaVi8oHskqGELe3NDN19F/AgAlKlty7gQa0k51CpQchtZLxUcxCmadWhozHZ5
         1PP2Ikn1PHSNWaCjjViewnI9t4/Wtx135Fa5yIkuKRnSAll/+/8JGxOOLDy8L0lm5urx
         yC3KyeTYoV6ja5kzmeXWPnVJk6ydsAfZHVzZfefusTTNOYXF1Mr0ccGLKMAWnjLWtOG/
         k2hYLbXmnhV9kObtvTbYlXSteEel6tpwzWm8ocpMoVekT0U5i/r8KLx63k+UHElMCYt7
         bljQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=v6KgViuFjR1WJCP8hMyuFp9zVb8OEl6/pzjbqiT4YPc=;
        fh=7I6Vaybl9LpsnZx0Lyzz3upjfaldOUhJu36v09IwdTE=;
        b=hh//4kPjBiNar8x4jz+8JVyNCs7CDiTvd0evDL11+b+BN2a0EFfC34SrT45iZR2ucb
         MvCbeKiMUCG96CYam8Npz0svXaTRjdr+PUcS0BmH1TAttmoU/tm915f8J0km+aOsZwc9
         Ae2Z/BEioIelHIkqq3RtLtZHuIoTwcA0UULoR5RBGWLxkLe+T+AxiMdGy48Et3VoFHur
         LaPUe07yeAklqzUco7sypZr9ksXp42KYfDOqZWGtY3ETrvgNSHRT63Gi0Qr58gUOPbkb
         fj5Dt9joZoOy+qZW5DTrX7y/GKmNW1g/oc7PuXF70PhiVPDWln/iWc+a5inFoXQ6cAmk
         us5w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Uh8l4aNP;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb35bfd57asi46299666d6.278.2025.06.13.12.37.07
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 12:37:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Uh8l4aNP;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749843427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v6KgViuFjR1WJCP8hMyuFp9zVb8OEl6/pzjbqiT4YPc=;
	b=Uh8l4aNP62V2Oad3LQpfZIlYh+gAVTYpsQ3bGx0NygW/YZ0wGej0NmPnoj406Jmk3mjD75
	pcyzobC6vMi7VWDC1uYvatGCcrR7zkNCV4Dr8o8lvx3n0noQJPnZ2J/3Gym76cjkzU4WMN
	d6IRpR+L71zdiwp1NjLQALE938EubnY=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-86G6fen-NJyj0k9ATfkI8A-1; Fri, 13 Jun 2025 15:37:05 -0400
X-MC-Unique: 86G6fen-NJyj0k9ATfkI8A-1
X-Mimecast-MFC-AGG-ID: 86G6fen-NJyj0k9ATfkI8A_1749843424
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31218e2d5b0so3678034a91.2
        for <alex.bennee@linaro.org>; Fri, 13 Jun 2025 12:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749843424; x=1750448224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v6KgViuFjR1WJCP8hMyuFp9zVb8OEl6/pzjbqiT4YPc=;
        b=AutTWwFMp77R3V6jgSLQFHbKroeh/Xer5sc30w1mS/h12LzO36SjS5QYDWbuRk+kqF
         wNLeia7ODDdXFHZYpNYxAGFnQ293X+9N4EfQhvEghzqzoPo6U7KIFCYtcyx3V/PENuLV
         RaXZkY9CC3iERHMqMMQeNhtWDLJ7uMP44EXGYO4TR6k5saJvlXJ/6KSo1z2qNGPOZs1p
         2YSVoSyPoRgXJ8B4Os5535/NVE6Xepi+RGHkccByyJEWVH5Q5srfNQSL0qeFhh9L9jX/
         8IgWhnl2Ut9W3EoiLGlGFJUp2srO3KBeP1hEtLLRwQio92ELo242uELlY6KrURcXS1vN
         bc/g==
X-Forwarded-Encrypted: i=1; AJvYcCWpiUS1xPlcik/VEG2u5kLROMtlUq9rSZ/LXOYjeKeerBy28fo6wtKF9G+MK3MIHsa8IeZDGmYfU/0bnA==@linaro.org
X-Gm-Message-State: AOJu0YyGGJjBW7W0rAE/hiPPDtpg1c6/Y7HXIZGR1fA3E5k0GK2Efx6c
	ybyvEYtZ/qOVU7VDlbpn+5xFYc6caKjyPPyxg7Q4CcGM2VNEekOfsKCySVXHaEqSZoDXL0tv1Ya
	zd3Gw3z7UeByuG1+CKbTNVwRmibaAOR6qn1MMdUsw4E8267Ym8wOrFAyU/bbSGHM8HS7Ln2GCjD
	OqJP9zBNV0ezFsXNYA7UxEqcE8IHkLWDFV
X-Gm-Gg: ASbGnctDF3gHR3kfSsNU6hYU/HJmX4xvfXfQqTg8lIW6JtF8es0j3dbpjx/glZia0K2
	aSaEi+VmFZFlIWdboRtZ4FYbzDDhaKHErpN2j/YujjxUT2WZL5Za37i8hCgBsac+qhih/D3tcfW
	2769FScKftfe83YAcxr2LCRTvWNEGRqx/xjII=
X-Received: by 2002:a17:90b:38d1:b0:313:d79e:1f48 with SMTP id 98e67ed59e1d1-313f1cd5fd7mr1412193a91.16.1749843424219;
        Fri, 13 Jun 2025 12:37:04 -0700 (PDT)
X-Received: by 2002:a17:90b:38d1:b0:313:d79e:1f48 with SMTP id
 98e67ed59e1d1-313f1cd5fd7mr1412109a91.16.1749843423695; Fri, 13 Jun 2025
 12:37:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250612205451.1177751-1-jsnow@redhat.com> <20250612205451.1177751-2-jsnow@redhat.com>
 <7e66e758-da47-47eb-9114-22f07e1ffdc9@redhat.com>
In-Reply-To: <7e66e758-da47-47eb-9114-22f07e1ffdc9@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 13 Jun 2025 15:36:51 -0400
X-Gm-Features: AX0GCFuiAeQBZnODkOUFiBBQ0SwoPYSj3-6O0mDgbYSey7x4h5zk9dtghUBJoLg
Message-ID: <CAFn=p-aZz51W14-v4jd2J6wXqzO6ZKvo8L5ckhA=RGsWE9D1UA@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] python: convert packages to PEP517/pyproject.toml
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>, Yi Liu <yi.l.liu@intel.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Helge Deller <deller@gmx.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Fabiano Rosas <farosas@suse.de>, Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>, 
	Leif Lindholm <leif.lindholm@oss.qualcomm.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Ed Maste <emaste@freebsd.org>, Gerd Hoffmann <kraxel@redhat.com>, Warner Losh <imp@bsdimp.com>, 
	Tyrone Ting <kfting@nuvoton.com>, Eric Blake <eblake@redhat.com>, Troy Lee <leetroy@gmail.com>, 
	Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, Michael Roth <michael.roth@amd.com>, 
	Laurent Vivier <laurent@vivier.eu>, Ani Sinha <anisinha@redhat.com>, Weiwei Li <liwei1518@gmail.com>, 
	Eric Farman <farman@linux.ibm.com>, Steven Lee <steven_lee@aspeedtech.com>, 
	Brian Cain <brian.cain@oss.qualcomm.com>, Li-Wen Hsu <lwhsu@freebsd.org>, 
	Jamin Lin <jamin_lin@aspeedtech.com>, 
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, qemu-block@nongnu.org, 
	Bernhard Beschow <shentey@gmail.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Mathieu=2D=2DDrif?= <clement.mathieu--drif@eviden.com>, 
	Maksim Davydov <davydov-max@yandex-team.ru>, Niek Linnenbank <nieklinnenbank@gmail.com>, 
	=?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Paul Durrant <paul@xen.org>, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, Jagannathan Raman <jag.raman@oracle.com>, 
	Igor Mitsyanko <i.mitsyanko@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Markus Armbruster <armbru@redhat.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Anton Johansson <anjo@rev.ng>, Peter Maydell <peter.maydell@linaro.org>, 
	Eric Auger <eric.auger@redhat.com>, Yanan Wang <wangyanan55@huawei.com>, qemu-arm@nongnu.org, 
	Hao Wu <wuhaotsh@google.com>, Mads Ynddal <mads@ynddal.dk>, 
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, qemu-riscv@nongnu.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Michael Rolnik <mrolnik@gmail.com>, Zhao Liu <zhao1.liu@intel.com>, 
	Alessandro Di Federico <ale@rev.ng>, Antony Pavlov <antonynpavlov@gmail.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Hanna Reitz <hreitz@redhat.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>, 
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>, Daniel Henrique Barboza <danielhb413@gmail.com>, 
	Qiuhao Li <Qiuhao.Li@outlook.com>, Hyman Huang <yong.huang@smartx.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	qemu-rust@nongnu.org, Bandan Das <bsd@redhat.com>, 
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	kvm@vger.kernel.org, Fam Zheng <fam@euphon.net>, Jia Liu <proljc@gmail.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Alistair Francis <alistair@alistair23.me>, Kyle Evans <kevans@freebsd.org>, 
	Alexandre Iooss <erdnaxe@crans.org>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Elena Ufimtseva <elena.ufimtseva@oracle.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	=?UTF-8?B?RnLDqWTDqXJpYyBCYXJyYXQ=?= <fbarrat@linux.ibm.com>, 
	qemu-ppc@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>, 
	Beniamino Galvani <b.galvani@gmail.com>, David Hildenbrand <david@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, David Woodhouse <dwmw2@infradead.org>, 
	Eduardo Habkost <eduardo@habkost.net>, Ahmed Karaman <ahmedkhaledkaraman@gmail.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Harsh Prateek Bora <harshpb@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kVVY-QR0wFJWjeI1kUO3nKmHRVn2InuGINptwkPy780_1749843424
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000aeb5fa0637792b4e"
X-TUID: 1Q5Qat6bxFfn

--000000000000aeb5fa0637792b4e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 4:36=E2=80=AFAM Thomas Huth <thuth@redhat.com> wrot=
e:

> On 12/06/2025 22.54, John Snow wrote:
> > Newer versions of setuptools increasingly expect that packages are
> > defined using the pyproject.toml/PEP517 packaging layout format. With
> > 3.9 as our minimum, I believe it's finally appropriate to make the shif=
t
> > away from the legacy packaging format.
> >
> > Update documentation and dependencies that change as a result of the
> > different build/packaging/installation pathways.
> >
> > This change has the effect of fixing "make check-dev", which has been
> > broken on newer versions of Fedora for a while, now.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   python/README.rst        | 33 ++++++++++++++++-----------------
> >   python/Makefile          | 18 +++++++++---------
> >   python/pyproject.toml    | 10 ++++++++++
> >   python/setup.py          | 40 ---------------------------------------=
-
> >   python/tests/minreqs.txt |  2 +-
> >   5 files changed, 36 insertions(+), 67 deletions(-)
> >   create mode 100644 python/pyproject.toml
> >   delete mode 100755 python/setup.py
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>


Thanks. If there are no objections, I might stage at least the first few
reviewed patches here so I can get this stitched up sooner than later. The
more disruptive parts I might wait a touch longer on.

--000000000000aeb5fa0637792b4e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 13,=
 2025 at 4:36=E2=80=AFAM Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com=
">thuth@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 12/06/2025 22.54, John Snow wrote:<br>
&gt; Newer versions of setuptools increasingly expect that packages are<br>
&gt; defined using the pyproject.toml/PEP517 packaging layout format. With<=
br>
&gt; 3.9 as our minimum, I believe it&#39;s finally appropriate to make the=
 shift<br>
&gt; away from the legacy packaging format.<br>
&gt; <br>
&gt; Update documentation and dependencies that change as a result of the<b=
r>
&gt; different build/packaging/installation pathways.<br>
&gt; <br>
&gt; This change has the effect of fixing &quot;make check-dev&quot;, which=
 has been<br>
&gt; broken on newer versions of Fedora for a while, now.<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0python/README.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 33 ++++++++=
++++++++-----------------<br>
&gt;=C2=A0 =C2=A0python/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 18 +++=
++++++---------<br>
&gt;=C2=A0 =C2=A0python/pyproject.toml=C2=A0 =C2=A0 | 10 ++++++++++<br>
&gt;=C2=A0 =C2=A0python/setup.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 40 ---=
-------------------------------------<br>
&gt;=C2=A0 =C2=A0python/tests/minreqs.txt |=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A05 files changed, 36 insertions(+), 67 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 python/pyproject.toml<br>
&gt;=C2=A0 =C2=A0delete mode 100755 python/setup.py<br>
<br>
Reviewed-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=3D"=
_blank">thuth@redhat.com</a>&gt;</blockquote><div><br></div><div>Thanks. If=
 there are no objections, I might stage at least the first few reviewed pat=
ches here so I can get this stitched up sooner than later. The more disrupt=
ive parts I might wait a touch longer on. <br></div></div></div>

--000000000000aeb5fa0637792b4e--
