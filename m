Received: by 2002:a17:90a:1a54:0:0:0:0 with SMTP id 20csp2482210pjl;
        Mon, 23 Sep 2019 02:11:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwFzPWWMJaQ+e0y4ViNmPfe1vAGmaKglzHrr3qK2T85WFp1xD789SneG54ZSBotG2VNs5wZ
X-Received: by 2002:a17:906:1248:: with SMTP id u8mr4097791eja.172.1569229874755;
        Mon, 23 Sep 2019 02:11:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569229874; cv=none;
        d=google.com; s=arc-20160816;
        b=gy4AVSNL2Cwhh8SrOdV7jUtqxg4b7osC7G70zdIfLUyDWUawYyM3obPC+nSzaqje5d
         WGWVGP0PX6zWLLr7E7AEyXitGUbvON0dREcb/ZmiJk8hiJt/8ZVV5AnAr9yej21WH+As
         zIiQiEyDmv2NeHjNStQ/LJFWnsD87+EfZ9nmewEpYW/axfIkYevLEP5ENM+T2ee/888n
         B5MwkOSRi0IOmLddtfyDc3L8d90L9rzXQMf7E6PJEJOrjuhMrbEGx1HCHIinr9gr3k8G
         vaxucCskoZg3FgB1pB2Z40GCl7z7IQ9bgvVmgR4OkkgjEqYjogx3evtk1wnEX3g43GXl
         HnzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date;
        bh=421av2Jm5iCegxBHxjK13XmASDov1ztnc74ZXtdAKeI=;
        b=nXW7ETq5Fu8+mMCo0aKVpQhs3uQGK5kKm3Ue0J3eHTYxfZAy75DYaIqahVVHfyRUpp
         Y0CxHiCk1LLURJPaDG1U8Nchs/TZoOeDgBoj7sdnWx2+Z1o4MgkbFb9HE0NnHGmQnUk4
         zgCdYx22FQrZJYEfFUU7bpLJkG6cRnFT0gyJ0p1Dpp0Jyz/wDXzCaTVwhMiMYXop4E1N
         a53lih9oGebYU2bYB64UXK7orJ5K9Az0y8XREDANpOLfx+e9TGCUf6b1EVnI3axB1+IH
         KynDYRdAz6HBkSzA16Myk3ggUR1VPj4Bd3g4R7bwIM2egNyIMC9HOe2XSdw8tVZTyUNE
         Pogw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6si6003521eda.336.2019.09.23.02.11.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2019 02:11:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCKNF-0000q3-IB
	for alex.bennee@linaro.org; Mon, 23 Sep 2019 05:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49247)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sgarzare@redhat.com>) id 1iCJyt-0005Z7-GZ
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 04:46:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sgarzare@redhat.com>) id 1iCJyr-00086V-MY
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 04:46:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50682)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1iCJyr-00085u-Ed
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 04:46:01 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 55F68C050DEC
 for <qemu-arm@nongnu.org>; Mon, 23 Sep 2019 08:45:59 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id v13so4547503wrq.23
 for <qemu-arm@nongnu.org>; Mon, 23 Sep 2019 01:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=AT8+uhMVeY+mvWoSfheeycvU0NulLDTjhfvstu4jndg=;
 b=dV3PjdqqkiAo8sUB4/25L7Lg97ptB+Pxy0Geby+U7hLsujv3Pfw+3LKgJsu1Qp4Lb7
 JSy0cNu+fSI/3fUAyVassMsx1nja62e87qmPxwIB9iZBzeuVD+P4L2qmuKkfp6isFpDE
 92p4fFShdw8CqQ3lHnGKOn5Iqq0k8XxsL5gb85z4elPB9lYI8uPmxjBsZSkHYQ/S7IQa
 F37HZqtOgDRsa8EoknryYPqkxXCkQZpxkzp7/KWDg/7ENLQgtuXatt7ryw6Ia993MQR7
 GIBbIuEDsFqdpZMhhWcTy8hijOKxg4u5DvVM4WDjzxqD9tyc2pUWffhIyR4dYORRen1e
 hEIA==
X-Gm-Message-State: APjAAAWH4GPFlwP5mELFBZ4hhLpZgp7tYK2foxEVm8hw+LknLDV/vam3
 h5tMeqVdeecq5hgL08SvOPr0mIPx6Ct18NvQbsTxrk5U+L+bzxCdY22MuwhI5uj8zfzVSIoat7Q
 FDGQYrlwG2Vkb
X-Received: by 2002:a5d:4350:: with SMTP id u16mr20167381wrr.289.1569228357988; 
 Mon, 23 Sep 2019 01:45:57 -0700 (PDT)
X-Received: by 2002:a5d:4350:: with SMTP id u16mr20167369wrr.289.1569228357747; 
 Mon, 23 Sep 2019 01:45:57 -0700 (PDT)
Received: from steredhat (host170-61-dynamic.36-79-r.retail.telecomitalia.it.
 [79.36.61.170])
 by smtp.gmail.com with ESMTPSA id x5sm19339895wrg.69.2019.09.23.01.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 01:45:57 -0700 (PDT)
Date: Mon, 23 Sep 2019 10:45:54 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/arm/boot: Use the IEC binary prefix definitions
Message-ID: <20190923084554.6faurhnaage7t5kp@steredhat>
References: <20190921103405.19623-1-philmd@redhat.com>
 <20190923082919.y2fjn2y6t7lire3z@steredhat>
 <75b5eaec-5e00-6dd0-1a67-b0dafd2d5622@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <75b5eaec-5e00-6dd0-1a67-b0dafd2d5622@redhat.com>
User-Agent: NeoMutt/20180716
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HDL+bC9c6dX+

On Mon, Sep 23, 2019 at 10:43:12AM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 9/23/19 10:29 AM, Stefano Garzarella wrote:
> > On Sat, Sep 21, 2019 at 12:34:04PM +0200, Philippe Mathieu-Daud=E9 wr=
ote:
> >> IEC binary prefixes ease code review: the unit is explicit.
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> >> ---
> >>  hw/arm/boot.c | 8 ++++----
> >>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> >> index bf97ef3e33..59bb2fa0d3 100644
> >> --- a/hw/arm/boot.c
> >> +++ b/hw/arm/boot.c
> >=20
> > Very appreciated!
> >=20
> > What about fixing also this other line?
> >=20
> > @@ -575,7 +575,7 @@ int arm_load_dtb(hwaddr addr, const struct arm_bo=
ot_info *binfo,
> >          goto fail;
> >      }
> > =20
> > -    if (scells < 2 && binfo->ram_size >=3D (1ULL << 32)) {
> > +    if (scells < 2 && binfo->ram_size >=3D 4 * GiB) {
>=20
> Good idea!
>=20
> >          /* This is user error so deserves a friendlier error message
> >           * than the failure of setprop_sized_cells would provide
> >=20
> >=20
> >> @@ -1095,7 +1095,7 @@ static void arm_setup_direct_kernel_boot(ARMCP=
U *cpu,
> >>       * we might still make a bad choice here.
> >>       */
> >>      info->initrd_start =3D info->loader_start +
> >> -        MIN(info->ram_size / 2, 128 * 1024 * 1024);
> >> +        MIN(info->ram_size / 2, 128 * MiB);
> >>      if (image_high_addr) {
> >>          info->initrd_start =3D MAX(info->initrd_start, image_high_a=
ddr);
> >>      }
> >> @@ -1155,13 +1155,13 @@ static void arm_setup_direct_kernel_boot(ARM=
CPU *cpu,
> >>                   *
> >>                   * Let's play safe and prealign it to 2MB to give u=
s some space.
> >>                   */
> >> -                align =3D 2 * 1024 * 1024;
> >> +                align =3D 2 * MiB;
> >>              } else {
> >>                  /*
> >>                   * Some 32bit kernels will trash anything in the 4K=
 page the
> >>                   * initrd ends in, so make sure the DTB isn't caugh=
t up in that.
> >>                   */
> >> -                align =3D 4096;
> >> +                align =3D 4 * KiB;
> >>              }
> >> =20
> >>              /* Place the DTB after the initrd in memory with alignm=
ent. */
> >> @@ -1178,7 +1178,7 @@ static void arm_setup_direct_kernel_boot(ARMCP=
U *cpu,
> >>                  info->loader_start + KERNEL_ARGS_ADDR;
> >>              fixupcontext[FIXUP_ARGPTR_HI] =3D
> >>                  (info->loader_start + KERNEL_ARGS_ADDR) >> 32;
> >> -            if (info->ram_size >=3D (1ULL << 32)) {
> >> +            if (info->ram_size >=3D 4 * GiB) {
> >>                  error_report("RAM size must be less than 4GB to boo=
t"
> >>                               " Linux kernel using ATAGS (try passin=
g a device tree"
> >>                               " using -dtb)");
> >=20
> > With or without the new line fix:
> >=20
> > Acked-by: Stefano Garzarella <sgarzare@redhat.com>
>=20
> Did you mean Reviewed-by?

Yes, sorry! :-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

