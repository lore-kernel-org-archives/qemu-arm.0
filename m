Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E51EFD20D
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Feb 2026 08:57:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvAhT-0004QY-FL; Wed, 25 Feb 2026 03:56:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vvAhL-0004Ou-0c
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 03:56:48 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vvAhD-0008Dh-3w
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 03:56:44 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-65f980cea07so241214a12.0
 for <qemu-arm@nongnu.org>; Wed, 25 Feb 2026 00:56:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772009795; cv=none;
 d=google.com; s=arc-20240605;
 b=R1ow5nFUMWMGfcEKNYNFB+mPBcojFN/6DbirG7SrC66ebTambo+rG5B2jfCNuEl1WP
 1dZTB/WqV73AlFh5Jp+PQndqAmZyNf/nAAmCQrmiwpiKR1r1WHyRfCDno6MDgh5nYMuk
 eLYHif0E2mJF95oBf+K78YnhBVxO2JCNJteFZgNqQBUUBnong6islesANjBCRKsNmKkN
 kb8nBtV2HP/HRBuJgvmNKanwo0WtvUgrD4Ta9leQzaNnGo7XNGEhBE/Y3jU2KgDTNXG2
 6ZOY6xfQfrNjKsyCyyxX8KV0y0k/f6zWpLRpFXE9xBQVRGLfGQnFPvRXTa754yc6c18P
 s8OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=UzgX8BKWZ1Pr8gzuAA9LuDd0oMCO9HAKIWfwMvDjoKU=;
 fh=ESfS6nJPo2SZs89VGfJmssiWK4TciBQT1g0FGWuSAFw=;
 b=JLoJfhAx3RJ05AP6Brn+Rxj500k+fJEJQtQiFS1xOUGihXdND6jE/SUnMkZVqTyo5+
 mdCqbsEDEohtzO8AtZ0gyuNESR4X8gmlQfFchRWcdfGDqmv1PRnDYquZX2WglfLJterA
 t51lGBg6u+cj4o6kjvaALEK6tKIpNs3zwIB5NMA9GKF6OLCaThSngb77wYhdzkdULeFs
 qqYgQk3CFdUkl/t9l7BYpMGXQ47lXbw2A/h/72nPMNj5Q3HiwTpDefCCJGZHZ9lG0dOK
 1Y5VKHEfxyigQbVwpqyH3/TWq1ACCkLgvosxW3pg982C3NsGKVXXb7y99COZqjSkBLgH
 crFA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772009795; x=1772614595; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UzgX8BKWZ1Pr8gzuAA9LuDd0oMCO9HAKIWfwMvDjoKU=;
 b=IDpqyzDusfGv50cPvXVAGT26dIoMMYDJLpUqQ0aTv1/unL+hqsK1RbeOBDU0yVeeYB
 7fMorPs9+fm2eGM2rsshZ7VFfotVJBl6pRqTshMX4kDC64ipMFgTjtAUFfYUCVCpStnq
 rXCmbVqjeWpl5U1bPxwrgQu0zVenUoTG8B3lpeT4dNlFpaZj1hlxBAKHRHPqtfe6iSdr
 B9y1kNHH4Z/GjBXx+AqO3zRk6+QOuK8oKDQJTYWHFlkgmeiVtNtxlFgS/V2hGPQ9BsbF
 uMHXo5+WP0aZhJLI378oiKEL/M4Lua+68IQFFg/NTEs+YWEBN8oUfRIZA2z02bP5mPca
 U5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772009795; x=1772614595;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UzgX8BKWZ1Pr8gzuAA9LuDd0oMCO9HAKIWfwMvDjoKU=;
 b=Pud+cIi7tl+oIIRDIje1SJy+Nyu7J0dDQ7abe/XB6MM8gZSwjWHyPr5SNouFGvtsJC
 /gZCp7pd/gMlAwP0J7NxxmTeCzwIrD17Iqpb06HPPwYjATYvi7B5EPYGfq05r5t47Tm1
 T5J5mmBcz2YzrVkwQd3jFAp7Ampdv/Rtdvx8EzsPpu3RHWOLrDZn564krpHdgXWB7H0F
 CK5TQjf/JILoX3u7iAdDDympgHA1ihn2haTQV2glDPIopm9gLzrcaWfcoe4i1eOFFLJo
 n8YK+hA+kOYt9+/b21ooO2bGtcYuDikPhfKod2AbnpGnYloqejdeQnY2DjtUliXY9fhv
 vyiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxQumIFgMZcZsjSjq+ZK0glNccfXjNZmuQdJ8jES2tDFKsyLKV1j6YBlHmCpDwZGmcWl2ubtDhaQ==@nongnu.org
X-Gm-Message-State: AOJu0YwCu5r/myt2FZSgcZ1f8CmjfDoCqkKPSwsQyFr8nzB6XXs65lDW
 wKvnODvze7QPXNxwtfxeh/a5GaTzrhaS6zyh4a9te9g/iaCcEVys7wpib8f3+I9Gyq0L6+oeHVZ
 tCPm+STjD/OrlJbDSeyFDO0yLUzYl1a8=
X-Gm-Gg: ATEYQzzc6lYO1sJmzLRY/McOLYzGLe3SRI3tgGMpSxGUvz37hoboqahMw0tUtAbKdXl
 HiTbTW97e8BUjwswSW8lpFu84vegKQWH0HPoy7oVjLgMFNLK+nKEUGTgUHHlYOcvEFKe1zADNdO
 CnyQd/cyogrt9ZF8LmXQ90KimIguzfSNo8pVr+6w/UAqZHIwTufdnzVbe6fGKPurZyXtr/jl2Jq
 YCJ9wma584t+GR0jhnw+bsBSzK8U77AAZXBYcA60q1rqks/m9DeuDGmuzJmW4pZPS+OSrokQtUF
 6/0nuNxe
X-Received: by 2002:a05:6402:f23:b0:65f:88f7:da0 with SMTP id
 4fb4d7f45d1cf-65f88f7101dmr849718a12.15.1772009794357; Wed, 25 Feb 2026
 00:56:34 -0800 (PST)
MIME-Version: 1.0
References: <20260219143332.3316679-1-ruslichenko.r@gmail.com>
 <20260219144901.3317747-1-ruslichenko.r@gmail.com>
 <dd8a92cc-51d6-4404-bd09-75b1798f925a@redhat.com>
 <87y0kj4mr3.fsf@draig.linaro.org>
 <CAN-aV1H0_4LviryDEmDSN0TfdSit-uN31H8g87sRBkJAHYbrdQ@mail.gmail.com>
 <d2d16e2b-d86a-633f-b32a-e063746658d8@eik.bme.hu>
 <CAN-aV1Ezvu1VnQJYiMDrNceaRAG32-DKtV85v2w58R4bpkL=KA@mail.gmail.com>
 <0bfb8cfc-a793-30cd-72c6-98b7a8177d32@eik.bme.hu>
 <233e3622-19b5-ed7b-5fdc-df23d5597681@eik.bme.hu>
In-Reply-To: <233e3622-19b5-ed7b-5fdc-df23d5597681@eik.bme.hu>
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
Date: Wed, 25 Feb 2026 09:56:23 +0100
X-Gm-Features: AaiRm506uL5fWlToQcjPG44K_WPL-F34o0VLTRi0dkKHwo47tjY4qw0Vx6fZ2uA
Message-ID: <CAN-aV1FsyXH=sSDXsmpPr2ZNAkfP7yovGgiaTjyx-btfmBdO0A@mail.gmail.com>
Subject: Re: [PATCH v2 19/33] hw/core/machine: add '-hw-dtb' option for machine
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 peter.maydell@linaro.org, artem_mygaiev@epam.com, volodymyr_babchuk@epam.com, 
 takahiro.nakata.wr@renesas.com, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, Ruslan_Ruslichenko@epam.com,
 philmd@linaro.org, 
 wangyanan55@huawei.com, zhao1.liu@intel.com, pbonzini@redhat.com, 
 Bernhard Beschow <shentey@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Feb 25, 2026 at 1:07=E2=80=AFAM BALATON Zoltan <balaton@eik.bme.hu>=
 wrote:
>
> On Tue, 24 Feb 2026, BALATON Zoltan wrote:
> > On Tue, 24 Feb 2026, Ruslan Ruslichenko wrote:
> >> On Tue, Feb 24, 2026 at 12:55=E2=80=AFAM BALATON Zoltan <balaton@eik.b=
me.hu> wrote:
> >>> On Mon, 23 Feb 2026, Ruslan Ruslichenko wrote:
> >>>> On Mon, Feb 23, 2026 at 2:23=E2=80=AFPM Alex Benn=C3=A9e <alex.benne=
e@linaro.org>
> >>>> wrote:
> >>>>>
> >>>>> Thomas Huth <thuth@redhat.com> writes:
> >>>>>
> >>>>>>  Hi!
> >>>>>>
> >>>>>> On 19/02/2026 15.48, Ruslan Ruslichenko wrote:
> >>>>>>> From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
> >>>>>>> Add new '-hw-dtb' command-line option and corresponding
> >>>>>>> MachineState property.
> >>>>>>> The 'hw-dtb' option allows to specify a Device tree
> >>>>>>> binary with hardware description which Qemu should
> >>>>>>> emulate.
> >>>>>>> Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
> >>>>>>> ---
> >>>>>>>   hw/core/machine.c        | 19 +++++++++++++++++++
> >>>>>>>   include/hw/core/boards.h |  1 +
> >>>>>>>   qemu-options.hx          |  9 +++++++++
> >>>>>>>   system/vl.c              |  3 +++
> >>>>>>>   4 files changed, 32 insertions(+)
> >>>>>>> diff --git a/hw/core/machine.c b/hw/core/machine.c
> >>>>>>> index d4ef620c17..affd24cd49 100644
> >>>>>>> --- a/hw/core/machine.c
> >>>>>>> +++ b/hw/core/machine.c
> >>>>>>> @@ -363,6 +363,20 @@ static void machine_set_dtb(Object *obj, con=
st
> >>>>>>> char *value, Error **errp)
> >>>>>>>       ms->dtb =3D g_strdup(value);
> >>>>>>>   }
> >>>>>>>   +static char *machine_get_hw_dtb(Object *obj, Error **errp)
> >>>>>>> +{
> >>>>>>> +    MachineState *ms =3D MACHINE(obj);
> >>>>>>> +
> >>>>>>> +    return g_strdup(ms->hw_dtb);
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +static void machine_set_hw_dtb(Object *obj, const char *value, E=
rror
> >>>>>>> **errp)
> >>>>>>> +{
> >>>>>>> +    MachineState *ms =3D MACHINE(obj);
> >>>>>>> +
> >>>>>>> +    ms->hw_dtb =3D g_strdup(value);
> >>>>>>> +}
> >>>>>>> +
> >>>>>>>   static char *machine_get_dumpdtb(Object *obj, Error **errp)
> >>>>>>>   {
> >>>>>>>       MachineState *ms =3D MACHINE(obj);
> >>>>>>> @@ -1145,6 +1159,11 @@ static void machine_class_init(ObjectClass=
 *oc,
> >>>>>>> const void *data)
> >>>>>>>       object_class_property_set_description(oc, "dtb",
> >>>>>>>           "Linux kernel device tree file");
> >>>>>>>   +    object_class_property_add_str(oc, "hw-dtb",
> >>>>>>> +                            machine_get_hw_dtb, machine_set_hw_d=
tb);
> >>>>>>> +    object_class_property_set_description(oc, "hw-dtb",
> >>>>>>> +                "A device tree binary used to describe the hardw=
are
> >>>>>>> to QEMU");
> >>>>>>
> >>>>>> Do the hardware dtbs differ from the ones that are passed to the L=
inux
> >>>>>> kernel? If not, I think you likely could use the existing "dtb"
> >>>>>> property for your new feature?
> >>>>>
> >>>>> They have to - the normal DTB cannot define the whole system becaus=
e its
> >>>>> only concerned with reporting what the kernel can see to the kernel=
 and
> >>>>> not defining the whole system including what the firmware sees.
> >>>>>
> >>>>
> >>>> Yes, Indeed.
> >>>> Normal DTB was explored, but there is not enough information to crea=
te
> >>>> QEMU models from it.
> >>>> Thus we need to have a separate device tree.
> >>>
> >>> What additional data is needed that's not present in dtb from firmwar=
e and
> >>> what if that additional data is passed to the kernel? I think the ker=
nel
> >>> would just ignore the additional data that it doesn't need so one dtb
> >>> might be enough even if it has to be more detailed than what the kern=
el
> >>> normally gets. If that works we don't need a separate option.
> >>>
> >>
> >> Here are few specific examples:
> >>
> >> 1. DTS compatibles and QOM type names are all different.
> >> Using Linux device tree would require to maintain some massive hardcod=
ed
> >> mapping
> >> even for devices that otherwise don't require any special handling.
> >
> > Bernhard's patches had the same issue and solved it by adding subclasse=
s with
> > names matching the dtb. I think that would not work but a better approa=
ch is
> > to allow alias names for devices (we already have machine name aliases =
I
> > thought something similar for devices) that would solve this issue with=
out
> > too much additional complexity. Then the device would just need an addi=
tional
> > line registering an alias name to match the dtb name (or more of differ=
ent
> > machines have different compatible names).
> >
> >> 2. Object properties. We would probably need to make sure there is no
> >> conflicts
> >> and all properties are either ignored by Linux drivers or have exactly
> >> the same meaning.
> >>
> >> 3. Devices mapped to Secure Firmwares only. Those are not accessible b=
y
> >> Linux
> >> and trying to initialize them from the Linux kernel would cause memory
> >> aborts.
> >>
> >> 4. Connecting devices to backends such as serial, block devices, etc.
> >> We need to specify corresponding 'chardev' and 'driver' properties.
> >
> > This is probably not part of the machine but a specific invocation so t=
hese
> > should be specified on the command line and not in the machine definion=
.
> >
> >> 5. Interrupt wiring. Some hardware lines are transparent to Linux, but=
 need
> >> be
> >> wired by QEMU. For example, interrupt controllers are wired to CPUs, e=
tc.
> >> If we would want to initialize it from dts eventually, this would need=
 to
> >> be
> >> passed somehow.
> >>
> >> Overall, my understanding is Device models typically need to support
> >> booting existing
> >> OS images and device trees from regular platform builds.
> >> And at least due points 2-4, we cannot use them directly.
> >
> > Some of the points may be solved other than modifying dtb but some may =
indeed
> > need extensions so a separate hw-dtb may be needed in more complex case=
s.
> >
> >> Since we still need to modify the device tree for QEMU anyway, having
> >> support
> >> for unified DTS doesn't really make sense.
> >
> > However it may be worthwile to try keeping the modifications minimal so=
 for
> > simple machines like the e500-ppc that has no secure world or other thi=
ngs
> > not described by the normal dtb it could just use the regular dtb and t=
he
> > hw-dtb option would be optional for more complex machines that need it.

In fact, machine code now decides which device tree binary to pass to
the generic fdt parser.
So e500-ppc can indeed use a normal dtb instead and if corresponding
aliases are registered
then the machine should be created with the fdt_generic framework too.
However, for more complex cases we would indeed need HW dtb.

> >
> >>> This series seems to be more complex than Bernhard's e500-fdt experim=
ent
> >>> (I've linked to that in
> >>> <https://lists.nongnu.org/archive/html/qemu-devel/2026-01/msg05470.ht=
ml>)
> >>> Bernhard's patch only added minimal support for creating devices from=
 fdt
> >>> and then put additional logic in the devices instead of handling them=
 in
> >>> generic code. Would such an approach lead to simpler fdt handling? If=
 not
> >>> why is the additional complexity needed?
> >>
> >> Most devices can be created from generic code. Supporting one common
> >> approach to initialize some specific device class would be simpler and=
 more
> >> maintainable than writing a custom FDT handler logic within each devic=
e
> >> model.
> >
> > I think putting device specific knowledge in generic code is against th=
e
> > object oriented design of QEMU and would be less maintainable because i=
t
> > would not belong to the device maintainers that way. If you have common=
 code
> > for some device classes then those devices probably have a superclass w=
here
> > this code could be put. The problem of mapping property names to device
> > specific properties could also be done easier within a device model whi=
ch has
> > better knowledge of the device and then we would not need a global tabl=
e
> > mapping these. So while at first look it may seem more fragmented putti=
ng
> > some logic in devices instead of a central place it's better fits the o=
bject
> > model and groups device specific logic in the device model which is mor=
e
> > maintainable than a global mapping that does not belong to any device b=
ut
> > touches several unrelated devices.
>

Currently, there are only a few special cases for serial, blockdev type dev=
ices
to set up their properties, but no awareness about any device class. Even t=
his
may probably be improved to be more generic in future too.
All other properties are set without any specific mapping to device class,
so the parsing logic is generic.
The complexity exists because fdt_generic handles the logic for
machine construction,
such as creating custom memory regions, mapping devices to these regions, a=
nd
parsing irq-maps.
Specifically, this generic memory mapping logic was required to instantiate
secure devices and create the correct address space mapping for the PCIe bu=
s
in order to build the sbsa-ref example machine.


> It does not help that Google randomly refuses my emails saying it's spam
> if I cc it to more than one gmail user. See my reply above if you've
> missed the previous mail. Hopefully this gets through.
>
> Regards,
> BALATON Zoltan

--
BR,
Ruslan Ruslichenko

