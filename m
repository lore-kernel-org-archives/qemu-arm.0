Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCAA3CD37BE
	for <qemu-arm@archiver.kernel.org>; Mon, 11 May 2026 13:02:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMQH8-0008Tf-1H; Mon, 11 May 2026 09:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1wMQGQ-0008BP-Fy
 for qemu-arm@nongnu.org; Mon, 11 May 2026 09:01:52 -0400
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1wMQGN-0008BP-OD
 for qemu-arm@nongnu.org; Mon, 11 May 2026 09:01:38 -0400
Received: by mail-dy1-x132b.google.com with SMTP id
 5a478bee46e88-2f68f3b075fso5158053eec.0
 for <qemu-arm@nongnu.org>; Mon, 11 May 2026 06:01:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778504493; cv=none;
 d=google.com; s=arc-20240605;
 b=F405Vsay+yDHaIOEzQcg1nA0+Bfg09jyy20E7PHLMfojaSymvd8xuW8fq2N1fZA8mD
 JnrMZ+1cdedJmXh1Scm0BzbFlCp100g0L/aYO5GDaY3ljey5/aNQ1hCa0PlsBOVI2t3x
 OEyYlScpK8y0pYsw7I/BTGaMYw9zw6l+27kcqEfYfPTdog+oogq3CB4dLghY4izgfVT4
 P3G4/ABanVe2j3iHwor/Nl7zXL2a0uYm2q3fza/79sF83gSN0biGvr/TQ82s+4myd9zF
 EICTZlHnGHbitk215Ca310Zev119sBpktbhdnIug3z38XLFIsWZVjn+74z7KS1xYYLaM
 OGIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=xrGfqbDAa0NvbHQFVcegD2ewwESeKh0udY4eiR8vTiA=;
 fh=iPgu6S197FMUMapcFeGEHUsZDnnxi66JleiL2vvHC04=;
 b=cDCd//bXogbOBA9tJVzNh+HxJ2V9ZnThtiEXOivc477uboCa/DdrgGP+iHT+TCmPrO
 471CTrtn/w5RTnesmbmQq6tX46wobANLxznQbTCjceApR49AvjfuexUGYPFZZfdeQfAw
 HtTb891Rgvt5HWaxkc5GTtqnaDY/8AnstroOShumVBk2MgdnDMP+/sOQtUo+5jedDNHT
 0CwTgcBxbykyTcNljVYjFelXk/2WY3QsWW3FR2UzXYVypDIfsu/wRF+Bg8Dm/N0Dw5UZ
 eTKTK3debKfdb1ke+FrcKt+Bg2uxMtmyLQtv0KHFxl+lv5g4YYFVqA8S3ouofMnvAG7T
 RlVQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1778504493; x=1779109293; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xrGfqbDAa0NvbHQFVcegD2ewwESeKh0udY4eiR8vTiA=;
 b=W9x9bHGFlaZg7JhsrdeyaxtRa+IDRa30Nny9/MX2TLSc8MvxqgPV7R4M3DRvyhkaiD
 ZgvQ7Yjyxx2YhKJI5nCj5cI5bRe63rw9azSmLAwpR79o6QvUcygxjhqLHKE0/WpQLSre
 BiV+ltrgKVxEmYULRYzX589HyG2sl5pzKzddCFUyqLo0TAySUuxvyNz8A1S4ftDiL3CO
 uww0E4PtJ21WaNxrF9AMoZXv1YNYR2mQ0eY6FiPjSMrSHtvwVf257IhCfdW4YGgIrowG
 DqhnzK++rHUEGj8cso7UGhVJPIlYqoykjTkihddhbHoKL1gwYZSGASPPvtJ87qz5qe5/
 W/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778504493; x=1779109293;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xrGfqbDAa0NvbHQFVcegD2ewwESeKh0udY4eiR8vTiA=;
 b=tRCRRwAEyd01KbyvRirf/krxHOuV5nSfNnTO0CByrKBU2CcFrWfNvc4zzKvmB9ZW6Z
 zwHULGAirti6m+3rC5lGRBdGVIADrbehmIH25dZNt0C2JgrldRgb3RKpEY0YWUAbUzuw
 qlFdHOBj80F5UnyN0m7zo0eVhn8HA4p8ljYkan/CnOOw1k0YmbIAnhK+H+SyMn0bfeIQ
 qbi92PiPGymvMrT1yECLby896ha57yoDVrh5eADsVKVmZsZT2Y2Ngsk6YBM9+1kr8TPA
 Tl1vrVmDK/wny0YH9mzd9AJjrzxNQAQsTtAWhH5tfX/XZ+pAm2OUoT2U0h8Zvt5TXvsx
 z7Kw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/bhdfKwQBnJQFTIGQIpLFJ5+Joz8S0dG2Fg1GVNixygfm2CnefHlSTzEj6YhPrNDRy/p6xWQFDDQ==@nongnu.org
X-Gm-Message-State: AOJu0YwK5wTq/MiMjit+e4KzdHq3DorNM5J67MA5/E5D76q3jb/0gle/
 PccZWmBeXDr0PZseOUUU7TP9FOHx+/Lfz3vTuIqowPB/INPgGpZGoefcJ8dunb2pkYk16TA4sv3
 j6y8fTvCXEG0X2Q2OmFlGa3V3F1rmkKs=
X-Gm-Gg: Acq92OFWyI7Xri8Y99hH0EsFnyesEYuMZmYHizlaYJ5NYofEDXWLmPWIoK7FL7pxC7C
 xfKH6r9hU4nqix3L8ANmXGGxh7/xi0kYjHqxwoAvmTQ2mI69m/Utk3EcaGyrCgwVTBzrRne3Zmz
 YNUPqGVj1GqT3MS2y36Jeog6VDG9Mz7HRrJgHlt4adrIoiQmMFULnFZO6hLN5qJqfnK2b7CrheA
 iZIXcv+TGPTeiX8ZAykTBGi9WPgBXoY/dKjTBoXVGvTXCZhLEwy1N/1w9h5lIoGHKyz4t+i5JSz
 TFKtP1kCmiYU4bRJCA/DDiw2EEyg4Pd1ur6V9GTMLD27tQSOVA==
X-Received: by 2002:a05:7301:6783:b0:2f2:5c68:5052 with SMTP id
 5a478bee46e88-2f85c17af84mr6126956eec.13.1778504492327; Mon, 11 May 2026
 06:01:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260427-qom-tests-v1-0-c413f3605311@redhat.com>
 <20260427-qom-tests-v1-34-c413f3605311@redhat.com>
 <CAFEAcA-tSqa7SQUE-f5yTq_P9eW6p_XrnNSnHZjw4g=Z2WncAQ@mail.gmail.com>
 <4f90d39a-560f-4922-ac54-2c975dae249d@linaro.org>
 <CAFEAcA_LcHgtAAYFjqm+P68ULwSRJWfr6LipMg9YsviyWDxH7Q@mail.gmail.com>
In-Reply-To: <CAFEAcA_LcHgtAAYFjqm+P68ULwSRJWfr6LipMg9YsviyWDxH7Q@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 11 May 2026 17:01:20 +0400
X-Gm-Features: AVHnY4LUUZJj-Uy0PeC5jOSV9tGBO4n3odeOOGNkax2UoonWn0NhbVICukz_7p4
Message-ID: <CAJ+F1CKFcPy3NtKgVfUruN_Mp1498EiQpRNz65HNE6YeqJD3CA@mail.gmail.com>
Subject: Re: [PATCH 34/41] hw/arm/virt: free flash devices and OEM strings on
 finalization
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, armbru@redhat.com, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::132b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-dy1-x132b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi

On Thu, Apr 30, 2026 at 7:32=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Thu, 30 Apr 2026 at 16:18, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.=
org> wrote:
> >
> > On 30/4/26 17:12, Peter Maydell wrote:
> > > On Mon, 27 Apr 2026 at 20:45, Marc-Andr=C3=A9 Lureau
> > > <marcandre.lureau@redhat.com> wrote:
> > >>
> > >> +static void virt_instance_finalize(Object *obj)
> > >> +{
> > >> +    VirtMachineState *vms =3D VIRT_MACHINE(obj);
> > >> +
> > >> +    for (int i =3D 0; i < ARRAY_SIZE(vms->flash); i++) {
> > >> +        if (vms->flash[i] && !qdev_is_realized(DEVICE(vms->flash[i]=
))) {
> > >> +            object_unref(OBJECT(vms->flash[i]));
> > >> +        }
> > >
> > > We currently use qdev_is_realized() almost nowhere in
> > > the codebase. Isn't there some way to do this such that we
> > > don't have to care about this because the object is
> > > parented and gets auto-dereffed ? Having each object
> > > have to care about the possibility of "inited but
> > > not realized" devices in finalize seems like it's going
> > > to result in a lot of bugs...
> >
> > Why are we creating pflash devices if we aren't realizing them
> > (thus not using them at all)? Destroying them when unneeded
> > would avoid that manual cleanup, right?
>
> I wondered that, but what happens is that we init the pflash
> devices in the machine's instance_init by calling virt_flash_create(),
> and then later we do the "configure, realize, map" part in
> virt_flash_map() in the MachineClass::init method. So if
> you init the Machine object but never call its init method
> before finalizing it, the flash devices are still in the
> inited-but-not-realized state. (This is similar to how with
> a normal qdev object, if you init it but don't realize it
> it will init but not realize all its child objects.)
> (We need to create the flash devices earlier than we do
> the other devices on the board to make the machine properties
> that virt_flash_create() sets up work.)
>
> Since virt_flash_create1() calls object_property_add_child()
> to make the flash device a child of the machine, I think
> we could make that be the only reference, by having
> virt_flash_create1() do:
>
>  Object *obj =3D object_new_with_props(TYPE_PFLASH_CFI01, OBJECT(vms),
>                                      name, &error_fatal, NULL);
>  DeviceState *dev =3D DEVICE(obj);
>
> and then using sysbus_realize() rather than sysbus_realize_and_unref()
> in virt_flash_map1(). Not tested, though...

Yes, in general, if a device creates & keeps a reference to an
instance, it should be a strong reference (we don't have support for
weak reference the way gobject has for ex). It should then unref it
unconditonally on finalize. Is it ok if it is addressed in a follow-up
series after this one lands? I am afraid it would delay this series or
make it longer, and a shift its focus

thanks

