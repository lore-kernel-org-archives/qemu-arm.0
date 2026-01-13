Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1E9D29DE7
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Jan 2026 19:53:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfkS5-00009S-34; Tue, 13 Jan 2026 14:53:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1vfkS3-000090-Ev
 for qemu-arm@nongnu.org; Tue, 13 Jan 2026 14:53:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1vfkS1-0006V1-7u
 for qemu-arm@nongnu.org; Tue, 13 Jan 2026 14:53:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768333991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UE/hHvW8ULqyYx4f0hDbS6RkLM1EPuUMxsiLVij5OWE=;
 b=A5ti1H+2RMtrIGm8yllD2/3c+IZH6uaCmHciJThcRSTwzF+eX0LMHpI14Ce5+HxIRZ19RM
 sxg/3taJ5sRT3uYRFlgCWpYob6PmkAZyDJrzaM0hXKu1GyTfzteAuj1/ACeh8kxeQjTi4s
 z0LalP+c5U4C9ldb8E+z6rL6yRoS9+Y=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-uRwQgiG9Ne2bcdDQjSy0lQ-1; Tue, 13 Jan 2026 14:53:08 -0500
X-MC-Unique: uRwQgiG9Ne2bcdDQjSy0lQ-1
X-Mimecast-MFC-AGG-ID: uRwQgiG9Ne2bcdDQjSy0lQ_1768333987
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-7903fc98229so85165347b3.0
 for <qemu-arm@nongnu.org>; Tue, 13 Jan 2026 11:53:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768333987; x=1768938787;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UE/hHvW8ULqyYx4f0hDbS6RkLM1EPuUMxsiLVij5OWE=;
 b=FRIsat0qiP7p4VYu/LO0Y7Wh7DOxFYLh7WLCsmu3KJAwJ5SvVLrZMG1aFN8baDlm6l
 yz/L/cdMB4WGszurztiBqpZ0YckhX3/1A5cuFs5nf2rOb0PrTcb5l+CUl178PkIQ0UlS
 lQFMctLp8JMf9lRBSqVfz6KcX9b1OcV2Z5ymb3pZL7kvSTfhHs1OvU1XpPi6Ebz5GC7x
 eq7AhiS7YKaWGU3vUlhsUN06L51K0FtlQfai5lWaJMNWUK9CI/e3bOeZ7Eor9z1eODvY
 7Ue3fQdufUEOUNIEmc/sFmUIKOi0Gkv+UtcX2J3MjK7uGlQtincpHCdyNvYDH940JYWC
 y6Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxDbkPyFksM/1S1Sv99wfDklWXh4ZIPCB7VorjeahL0GIlIFRq1JnnBxyzyN7BTdY1ajyy1ljC0A==@nongnu.org
X-Gm-Message-State: AOJu0YyeoLyNG7U4+C7T1eiO+OoJZ1o79c/8P5/RXOxnn862YMAM/7aw
 7WrDoZSmzeB1BgeWfLmMPkoci3GZ1gQcb+WMFWkcyedHrpbDtnhVpf+GNe95RiY2tKujTE0eiWK
 55NT/bGLTh7CeyRRw0KxN4bftDepFLbWlxteWg1dTBFKaVthGq/MLSUoTkrmdqZBjveocqoUilE
 Q/NEjmo3A0MSm8Iyk6827Ywqn9JhKi
X-Gm-Gg: AY/fxX4ETNNqXuERd8cArqJl3CHbbWkBuDkH98Vv3pgXsRVpHOCE43NreoeIUAmy5Rg
 6GPFEjXtiFSSHFqxxpyN3z4sEeV35EvpIIm0dfnPAnliELEK3S84RvXvbRGpeIAHFTEBsluxINT
 VtfVn38bBd/TS+ZZwbBpaKjIQ/KRJyNtoBQChAVJ5M/Fuj4mK39A8dvPSDJsHXBngeq227qlJAg
 QMcGHn/skHsYZMLSO4aya/ppQ==
X-Received: by 2002:a05:690e:408e:b0:644:7398:6676 with SMTP id
 956f58d0204a3-64901ac0644mr373121d50.32.1768333987560; 
 Tue, 13 Jan 2026 11:53:07 -0800 (PST)
X-Received: by 2002:a05:690e:408e:b0:644:7398:6676 with SMTP id
 956f58d0204a3-64901ac0644mr373102d50.32.1768333987164; Tue, 13 Jan 2026
 11:53:07 -0800 (PST)
MIME-Version: 1.0
References: <cover.1767716928.git.mchehab+huawei@kernel.org>
 <CAFEAcA_TMuZG8VJMs2JZ49Xq+wVxcq_7UGOMF+2FUe0k7AUgwA@mail.gmail.com>
 <aWY10BYoJjck3xX8@redhat.com>
In-Reply-To: <aWY10BYoJjck3xX8@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 13 Jan 2026 14:52:56 -0500
X-Gm-Features: AZwV_Qg3rc0n3MUq0eNw5dVDZR-BANYePulTIyE9nvJGYn2SeBbl7mY6TUQ1D6k
Message-ID: <CAFn=p-YzSP_v0TAzGOGH+mGMczqQLpN5OTda3c1MdbNGETcd4A@mail.gmail.com>
Subject: Re: [PATCH 0/1] Sync kernel-doc.py with Linux upstream
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Igor Mammedov <imammedo@redhat.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HkUUS9yK74fh9gpOnxuqes1zzED9sD0_FVdGS_hGBlA_1768333987
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, Jan 13, 2026 at 7:09=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> On Tue, Jan 13, 2026 at 11:44:51AM +0000, Peter Maydell wrote:
> > On Tue, 6 Jan 2026 at 16:38, Mauro Carvalho Chehab
> > <mchehab+huawei@kernel.org> wrote:
> > >
> > > Hi Peter/John,
> > >
> > > There were several updates at kernel-doc upstream fixing bugs,
> > > doing cleanups and a couple of improvements.
> > >
> > > Better to keep QEMU in sync with such changes.
> > >
> > > Worth mentioning that we did some changes on Linux at the
> > > kernel-doc.py script itself, to avoid Kernel build to crash
> > > with too old Python versions, as there docs build is a
> > > separate target, and python >=3D 3.6 is a new requirement
> > > there.
> > >
> > > On kernel, if python < 3.6, it will simply ignore docs
> > > build (emitting a warning).
> > >
> > > I opted to not backport such changes, but if you prefer
> > > doing that, I can do that on a v2.
> > > ---
> > >
> > > For now, I opted to keep kernel-doc libraries at the same
> > > directory as before - e.g. at scripts/lib/kdoc. On Linux,
> > > we ended moving it to tools/lib/python/kdoc. It could make
> > > sense to move it on QEMU too, as it makes a little bit
> > > easier to keep things in sync.
> > >
> > > What do you think?
> >
> > Hi; thanks for doing this backport. I checked that the output
> > with this patch applied is still the same as with the old
> > kernel-doc, and eyeballed the diffs between our kernel-doc
> > and the Linux version, to confirm that we have kept our two
> > minor QEMU-specific modifications and haven't missed anything
> > from Linux's version that we ought to have. So:
> >
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> >
> > On your two questions:
> >
> > (1) As Dan says, QEMU already enforces a new enough
> > Python version, so we don't need to handle 3.6. I think
> > the main thing driving a choice to backport or not those
> > changes would be simply keeping in sync with Linux's
> > version of the script so we don't diverge. We want to
> > make future re-syncing of the script as easy as possible.
> >
> > (2) Regarding the location of the kernel-doc libraries:
> > we seem to have two things here, possibly in tension:
> >  - we don't want to gratuitously diverge from Linux
> >  - QEMU's directory hierarchy is not the kernel's
> >
> > In particular, I'm not sure tools/ is where we would
> > naturally put python libraries used during the build
> > process. Maybe that would be python/ for us, but I defer
> > to John or another Python expert on that.
>
> I tend to see the 'python' directory as being for stuff we formally
> maintain as a python API for use by multiple internal consumers.

I more or less agree with Dan - that is how it is currently arranged.

In the past, however, I have suggested moving certain other modules
that are bigger than a single file into python/ for the sake of being
able to maintain them more aggressively: i.e. I do not regularly check
for Python regression and compatibility issues for things under
scripts/, except for qapi, which is also something I proposed moving
to python/ before.

The current state of things is that I aggressively check and test these thi=
ngs:

- python/*
- scripts/qapi/
- docs/sphinx/qapi_domain.py
- docs/sphinx/qapidoc.py

Everything else is just "best effort" which generally means "I fix it
when I notice that it is broken". If it is not a multi-file module and
not necessary for configure+build to run, I think for now it is best
kept outside of python/.

>
> This is just a bunch of helper files exclusively for use by the kernel-do=
c
> tool, and so the scripts/ directory is a decent fit for it, given that th=
is
> dir is for a collection of arbitary supporting tools & scripts.
>
> As precedent, see the tracetool, which keeps all its helpers under
> scripts/tracetool too.
>
> TL;DR: I would not want to see a new top level tools/ directory
> created, and don't think it fits in python/ either; scripts/ is
> a fine home.
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


