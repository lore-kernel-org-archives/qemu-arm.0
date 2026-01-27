Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBCDD2F000
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Jan 2026 12:54:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkiac-00083x-O3; Tue, 27 Jan 2026 07:54:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vkiaR-0007yh-2D
 for qemu-arm@nongnu.org; Tue, 27 Jan 2026 07:54:32 -0500
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vkiaN-0000KT-KE
 for qemu-arm@nongnu.org; Tue, 27 Jan 2026 07:54:25 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-790992528f6so54174087b3.1
 for <qemu-arm@nongnu.org>; Tue, 27 Jan 2026 04:54:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769518462; cv=none;
 d=google.com; s=arc-20240605;
 b=gnYETVJg6TD7nmJIrLhQDXPH5PTbBvJDM4AfgiktDHg7QAE4Nlw9s3AkyIM2SI5IfB
 65K/nbFhZn6kend4Jv/vQJqbI4mnXXgkAA67yd9UW9bvmYzWamwnjadMp65zfTnfnv6x
 fGDU+8IxewQMb9XXzxrTS/mfamm4dxpFP3AhqxzPRmp0W5lyDtHJzVeOIfNt6Z23fx0P
 HFHFd5qitK62yjYYF7LYdUctAR1kIxRRrtHEymlU/a1av6U8i+DTkS7E9YpP7+OhZOtn
 ktOHN17D6wmfAuBeDtY0hFUzDavbYliOIodExrR1YGKbDMFa6odTKYpPSk9vSojJh3WI
 aEDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=pjJvZM2bcvdfsylxzq22IaWA8tQ89V5rS1cP9PpxVLI=;
 fh=UsCk2QTUQh1hjKn5lSjqzkSW0aBGE9hjnrbEWzqrbqU=;
 b=Y88OzFqkggDd7xaeAqM3LeBNi1E25zOulzFWdBoMREwufn1cZzmbpI1p6YDEnxYXOa
 85z+Y51EozMhzuATvPJGnWgMm/MB62Kwo5byMz1lyskvLeBHVNSHUgLl/ocVtu0EUQfM
 3yQMQwpS+j4151u2IFJrkCZUZI1hPqSYDC0MoZJX0zwykv7BrHTm6q18aUDsrP4qBo7i
 3qnJ0edyMKnr1ex3loXOqcKe280H5Rp9i3IHWXI1UHJyJA14EhZhim84q4tDMgPtXMh4
 jFMdiZ95x4yL3oWUzH2jU3ylMu0aKOwWBHtPXDOFlQz/Xj7R0d8uk2e9VLCzEWu7ecW6
 KWdw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769518462; x=1770123262; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pjJvZM2bcvdfsylxzq22IaWA8tQ89V5rS1cP9PpxVLI=;
 b=J0OFpP4Zot/zkitlSh8TBKOKJagazsgOR74CVJVhRgrQ8ncVcnKVgnPpe6+hDAEBWO
 KkuJcHqDPovKbwn8puIynpaMFcjroeeXoWy/pd4vQrw0iENc8J3OmdD1/0bZiwHJrKnl
 IPMJgy0EpizmrH4lqDUb9tlGJNSYlNgZtYeo7AlnEOb2eTbdoLw0Cp/wqP/tTDRjoXe2
 VU1WIq8NFWsppilabA/qXpMHAONFRBisz/jRULbMiEAuUVD2qgkDgGWjsx3ho+4u6X11
 76Jl9iab9vcpm7A8J1oy3oyW4j78RliEQ2FsFujxRN3+uqCcRWr8VOQKIxww9box0X+Q
 7F2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769518462; x=1770123262;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pjJvZM2bcvdfsylxzq22IaWA8tQ89V5rS1cP9PpxVLI=;
 b=McUgqvC7s/K/+vRQNK6Yi1L0B6G5BhZVh5MrIrZhuoe4WHc1RgXMRyeYBqOQ86IArM
 VoYgnaRJOlE1QxP/Q1pkAdAqmGvHY9OTXJTLjkQj/YAe54iYpwjd01IAarUXvCyLVWui
 l3Da2cRk7ckn5jQ7e0DxtVLXIewTDO8SsLZzuERMD6MgOMpzk3nymUlnmJW0B9Yne60/
 yKrWYOdb1vm5Pdffpx+pV4D9SoyKb1H4sccsdnh159EC/D/RTeakMb/aovdixXvszDcP
 7JJYTwTtq/f1ufP9czkHtn5jcM/F0FyGBDACG9Guyj5q9/8oDQG7fxuNgnK/oKXS6eis
 Emgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV652mE8Kb5Y6+HrUvQWbpBtbDvdVSqeWXkhR2sEGz4albybCjzvP4O34GRYiUQVlqCVkxl989Q+Q==@nongnu.org
X-Gm-Message-State: AOJu0YxwjhHkFGIYUKkVD53N2XS/B47B6x4ERlCrHSRh7Mhnr1wa0Ogs
 NcItUkRWOnsRqpgF0sAuJNDHgN2kM7bphooWl0hYEHDGH3VFrAsLiBC5DdJJW58gTxBqhTLEEKf
 k9+euOHGFrvf2oG47G5Of/LSVtsovSFDLyWlOhSkOMw==
X-Gm-Gg: AZuq6aIwEZO373vnimdkpMBeBXHXEVqDNOd0p0JD44DTUYUtkADLkTvEu1piM9xvfPg
 oX8HgPxJTcPPJEAK6P/xpiJI4KMPuK0Yp2yxWV1Eq2wjsg5qKvPfn6hodvfwDkVJVLzg4PHW5Qn
 x4972ulQw+XjCO5+ZPrRpZjQVQSXY0plO+n6uaO4hsNLovX2uNOQZXPpbZFhaKeFtP5xFwNd4OR
 tjxIP4zvfgylEiRVjfJ17XuvrD9wIR/eUtXjeY64vXuTj1lECX09Ii9+wE1amGhfUAn9w==
X-Received: by 2002:a05:690c:c512:b0:784:8994:297c with SMTP id
 00721157ae682-7947ab2ec4bmr13413167b3.24.1769518462292; Tue, 27 Jan 2026
 04:54:22 -0800 (PST)
MIME-Version: 1.0
References: <20260121134114.9781-1-mohamed@unpredictable.fr>
 <20260121134114.9781-4-mohamed@unpredictable.fr>
 <CAFEAcA-GL9UG5MN5tKDzLwQ04cBGa99cSau4=2BLTs0+GGSdJw@mail.gmail.com>
 <51E78FA9-2C66-4E8E-947F-F009A8AEEDFD@unpredictable.fr>
In-Reply-To: <51E78FA9-2C66-4E8E-947F-F009A8AEEDFD@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Jan 2026 12:54:10 +0000
X-Gm-Features: AZwV_QgNC0HlA1MPr4utPBxXleUEBZNKe6e8nSRgWVIeaaKtSNPDbRFTZ7FKyS8
Message-ID: <CAFEAcA_7o-dNFUgMo=UdYD_cf=dwbMCy6b+_2SRSxVbDmmAUmw@mail.gmail.com>
Subject: Re: [PATCH v17 03/21] hw: arm: virt: rework MSI-X configuration
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Phil Dennis-Jordan <phil@philjordan.eu>, Alexander Graf <agraf@csgraf.de>, 
 Igor Mammedov <imammedo@redhat.com>, Cameron Esfahani <dirty@apple.com>, 
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Zhao Liu <zhao1.liu@intel.com>, Roman Bolshakov <rbolshakov@ddn.com>, 
 Ani Sinha <anisinha@redhat.com>, Pedro Barbuda <pbarbuda@microsoft.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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

On Tue, 27 Jan 2026 at 12:46, Mohamed Mediouni <mohamed@unpredictable.fr> w=
rote:
> > On 27. Jan 2026, at 11:54, Peter Maydell <peter.maydell@linaro.org> wro=
te:
> >
> > On Wed, 21 Jan 2026 at 13:41, Mohamed Mediouni <mohamed@unpredictable.f=
r> wrote:
> >> +/*
> >> + * In the prior Qemu ACPI table handling, GICv2 configurations
> >> + * had vms->its=3D1... That's broken.
> >> + *
> >> + * Match that assumption to match the existing ACPI tables that
> >> + * have been shipping for quite a while.
> >> + */
> >> +static int is_gicv2_acpi_workaround_needed(VirtMachineState *vms) {
> >> +    return vms->gic_version =3D=3D 2;
> >> +}
> >
> > We don't need to keep identical bug-for-bug ACPI tables like that.
> > If we were incorrectly reporting an ITS in a GICv2-only ACPI table,
> > that was a bug and we can fix it. (This might need adjusting of the
> > golden reference ACPI data in some of the bios-tables-tests if we
> > were testing that, so it ought to go in its own patch.)
> >
> Hello,
>
> I=E2=80=99m a bit concerned about breaking hibernation in this case=E2=80=
=A6
>
> My intent was keeping this behavior for now and then add a machine model =
version dependent toggle in a follow-up patch.

I'm not an ACPI table expert but my understanding is that it's
OK to change the ACPI table contents without having to make
those changes machine-version dependent. See e.g. commit d6afe18b7242,
which changed the ACPI tables for the its=3Doff case and did not
make those changes machine-version specific.

> >> +bool virt_is_its_enabled(VirtMachineState *vms)

> > Why do we need these? The idea of finalize_msi_controller()
> > is that it fixes vms->msi_controller so that you can just
> > directly say vms->msi_controller =3D=3D VIRT_MSI_CTRL_ITS or
> > vms->msi_controller =3D=3D VIRT_MSI_CTRL_GICV2M rather than
> > having to have more complicated logic.
> >
> It=E2=80=99s because of object_class_property_add_str(oc, "msi", virt_get=
_msi, virt_set_msi) (and the same applies for the its property), is it safe=
 to assume that virt_get_msi/virt_get_its will never be called from that pr=
ior to finalize?

The get and set property functions need to handle the
msi_controller field not having been finalized, but
they are only getting and setting it.

thanks
-- PMM

