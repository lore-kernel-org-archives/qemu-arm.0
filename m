Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D370CCF9E0
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 16:03:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDPh9-0003Rc-Ld; Mon, 27 Oct 2025 12:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDPh8-0003RE-Mj
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 12:03:42 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDPh4-0002ml-Bm
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 12:03:42 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-63e393c49f1so5468137d50.0
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 09:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761581012; x=1762185812; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RR5BznuAUZ5//5K4fKsbv/PX3i2neLhRixVpX04AB5M=;
 b=xly0LVzHw88qf36MStGnklTLaK4DHLEG9V5KkLWXSwSV6NeCpluHF6gmaz0QtNd1JW
 be6innh9YwV+dSVTvKEF/Ihr27bx3n9zwWin8z/OvEmW7xRlyPYaKFGY+izIDCXdpRXG
 g/WgQr9x2aKurZlpU0Ii1KteWM7rbuI4rQ1gcyz/uU88BiP4WqLfX+OlDyNw8l05G9NE
 H8FY72ddZU1qu3JRlxJaJ2KC2Iy60TeAd0uMOfCM/0f4PAe/u4WHzrpRUqGy4WaW0xOb
 tr5nNctP4jp0yxo7UkfUeJAmN48OavQvXNPX4o+5j5QzE7hTtP4Bvls+6WGLuOOxC7VB
 dVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761581012; x=1762185812;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RR5BznuAUZ5//5K4fKsbv/PX3i2neLhRixVpX04AB5M=;
 b=HT8rFQEbg7banWX3cPnobOEoK65pz8BuHazAvOPOZXbOMp5DX2D1NX0AlB9A/qXIRZ
 f23DBHa1yEyszm/am/uJUsaOCrDXC92hBgodCU2G2Uf6uu6z49gjeakPdm81Wil2aPUx
 VcwtkHprWKqajkZDqHdOYOEcEg6jo4Gt9/4Kiz9/TmOE5rioIbSFcl0wmtMohNODl7Au
 r67w4bAzu5mU4Au6dSG9kl+EIkbFg5M5M9F8Jmho8hihKILF7Ut5LwucF3EaWrgJ/kCb
 hOS8o56nLoLrAsFFcQwqFy878rM1N0Vhl1rJUf3sZIZmctEuVnnqR3Slr0p8gedr74xK
 VQEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsbYVcVf3+jdld/tdTILwbFXkxJLB2DGGJJHO1IIJoY78dr7ZJXOtmVpl0BtMC90ryVLrz9ds3kQ==@nongnu.org
X-Gm-Message-State: AOJu0YxWjc0MEHulLiHdInkSVtiUlQK1xKZKmmyFSFo1pXDSkV02jpe9
 l5RiAOTLBmEtZIGdoMfaktuFwMHc07THdMNBfN8twbH7XtcTKV24gonONMO7N54OAwP7ihm+Unh
 DJihq8dYTn2Db/pxJgl6SiO362bFaVVbonS0AmXSw9Q==
X-Gm-Gg: ASbGncu3vlZDqKSm+VBJxRFJyYPwXHKBzDz5O7u8tSQNbCBxo7XUkeEWHHZTRHW+Xgz
 dm5d7wv6qsl2RZDmhhRnVbJoVPl2zj5aS7phyimlH7IvucBqZ7TbhiA0D7dekGePAq6ZwhEzmxa
 5M9e6pAsBvQwvtra8Tnh51g6pccnSKZuN9fWydf7ioHhfzBgLebCTLdBjT5i5VKgLTB3TbMqmvy
 ItjLx1M6gMs91LMdqx+7fb4E+80W3nHttWsKygKXuPcbkjqQzi2qrbi5hHel5kY2g1zLu0I
X-Google-Smtp-Source: AGHT+IEUrN/EysgI2nB2F9WdFzaJ1hhJHQ7VjfW/gyaI669aRQl1+Q6hp6c/yY+VSNAPuRW0/bPat1D3KnOCnNmBZY0=
X-Received: by 2002:a05:690e:c4f:b0:612:891a:9ecc with SMTP id
 956f58d0204a3-63f6b9b05b7mr479893d50.9.1761581011690; Mon, 27 Oct 2025
 09:03:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250920140124.63046-1-mohamed@unpredictable.fr>
 <20250920140124.63046-4-mohamed@unpredictable.fr>
 <CAFEAcA-398ZMeLUbHWyUw4np81mLikEn2PkQnFQMY4oY_iWRFA@mail.gmail.com>
 <29E39B1C-40D3-4BBA-8B0B-C39594BA9B29@unpredictable.fr>
In-Reply-To: <29E39B1C-40D3-4BBA-8B0B-C39594BA9B29@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Oct 2025 16:03:19 +0000
X-Gm-Features: AWmQ_bky_gDkaMRbeQ688zuYHzvCneYcGVItHtc3zS3XRWMV3shJhZg-0iZCeos
Message-ID: <CAFEAcA93e6GL9agaCBZ2AabB21JrS6KS6MsbRHGPwdc_vj7xDQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/23] hw/arm: virt: add GICv2m for the case when ITS
 is not available
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>, 
 Yanan Wang <wangyanan55@huawei.com>, Phil Dennis-Jordan <phil@philjordan.eu>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Mads Ynddal <mads@ynddal.dk>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Cameron Esfahani <dirty@apple.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, kvm@vger.kernel.org,
 Igor Mammedov <imammedo@redhat.com>, 
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Roman Bolshakov <rbolshakov@ddn.com>, Pedro Barbuda <pbarbuda@microsoft.com>, 
 Alexander Graf <agraf@csgraf.de>, Sunil Muthuswamy <sunilmut@microsoft.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <anisinha@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 2 Oct 2025 at 05:30, Mohamed Mediouni <mohamed@unpredictable.fr> wr=
ote:
>
>
>
> > On 25. Sep 2025, at 18:24, Peter Maydell <peter.maydell@linaro.org> wro=
te:
> >
> > On Sat, 20 Sept 2025 at 15:02, Mohamed Mediouni
> > <mohamed@unpredictable.fr> wrote:
> >>
> >> On Hypervisor.framework for macOS and WHPX for Windows, the provided e=
nvironment is a GICv3 without ITS.
> >>
> >> As such, support a GICv3 w/ GICv2m for that scenario.
> >>
> >> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> >>
> >> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> >> ---
> >> hw/arm/virt-acpi-build.c | 4 +++-
> >> hw/arm/virt.c            | 8 ++++++++
> >> include/hw/arm/virt.h    | 2 ++
> >> 3 files changed, 13 insertions(+), 1 deletion(-)
> >
> > Looking at this I find myself wondering whether we need the
> > old-version back compat handling. The cases I think we have
> > at the moment are:
> >
> > (1) TCG, virt-6.1 and earlier: no_tcg_its is set
> >   -- you can have a gicv2 (always with a gicv2m)
> >   -- if you specify gic-version=3D3 you get a GICv3 without ITS
> > (2) TCG, virt-6.2 and later:
> >   -- gic-version=3D2 still has gicv2m
> >   -- gic-version=3D3 by default gives you an ITS; if you also
> >      say its=3Doff you get GICv3 with no ITS
> >   -- there is no case where we provide a GICv3 and are
> >      unable to provide an ITS for it
> > (3) KVM (any version):
> >   -- gic-version=3D2 has a gicv2m
> >   -- gic-version=3D3 gives you an ITS by default; its=3Doff
> >      will remove it
> >   -- there is no case where we provide a GICv3 and are
> >      unable to provide an ITS for it
> > (4) HVF:
> >   -- only gic-version=3D2 works, you get a gicv2m
> >
> > and I think what we want is:
> > (a) if you explicitly disable the ITS (with its=3Doff or via
> >     no_tcg_its) you get no ITS (and no gicv2m)
> > (b) if you explicitly enable the ITS you should get an
> >     actual ITS or an error message
> > (c) the default should be its=3Dauto which gives
> >     you "ITS if we can, gicv2m if we can't".
> >     This is repurposing the its=3D property as "message signaled
> >     interrupt support", which is a little bit of a hack
> >     but I think OK if we're clear about it in the docs.
> >     (We could rename the property to "msi=3D(off,its,gicv2m,auto)"
> >     with back-compat support for "its=3D" but I don't know if
> >     that's worth the effort.)
> >
> > And then that doesn't need any back-compat handling for pre-10.2
> > machine types or a "no_gicv3_with_gicv2m" flag, because for
> > 10.1 and earlier there is no case that currently works and
> > which falls into category (c) and which doesn't give you an ITS.
> > (because we don't yet have hvf gicv3 implemented: that's a new
> > feature that never worked in 10.1.)
> >
> > What do you think?
>
> Would it be wanted to provide MSI-X support in all scenarios
> even with its=3Doff?

We should prefer to provide MSI-X support. If the user
explicitly asks for a config that doesn't give MSI-X
support, that's their choice to make.

> And there=E2=80=99s the consequence of that making GICv3 + GICv2m only
> testable with auto and not with TCG or kvm, which doesn=E2=80=99t sound i=
deal.

I guess that would be an argument for the "give the property
the right name so we can say "msi=3D(off,its,gicv2m,auto)". Then
you could say
 -accel tcg -machine gic-version=3D3,msi=3Dgicv2m

to test that setup.

thanks
-- PMM

