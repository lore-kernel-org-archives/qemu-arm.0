Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C9DEC1113
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:10:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZK0-00013w-Ju; Mon, 23 Feb 2026 12:02:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vuZJx-00010l-9f
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:09 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vuZJv-0008SC-9j
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:08 -0500
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-7d18d02af68so3130001a34.2
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:02:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771866125; cv=none;
 d=google.com; s=arc-20240605;
 b=QP5AEw4Rs4P77vO1yXuoCog0dU9ek8kR1oBp/kqnp5MfG3mR4NqL9JnE4F9hmKDrWc
 Ox6FXQ+thRqXSI1EsdbCVX6N4Ww/rN35yZIzeniCTDi98R4fVqZpYjdASSuCienOwmtM
 jSYo/gMnMx9EpP7ySZulbh393BAj9Klc6gbdM/3TzVCRx5X/jKw/RlqlmSVvPNIx4FpH
 tE5q6T3xiWk4muzqtNGMbm7kX47b2EWjwCu6tnqW856HE02sWM8Y53/ftb9IjllB6OT1
 q4t936/cM4m9m882C3nLqQX3iO1J3Uroe7wqgHVCg7DzDsXczpW0MfGaaSok9YEzGJZO
 wcEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=uKapdWTYg4/AfpMV73PJXifaSo/eyOCqm8bePMIHZK4=;
 fh=So9fRRej9givN4QeFeSOQxkYO1aWosf4oD0gweYMyvo=;
 b=b2E7oSrThdqPB+Fu2my+Ca+OwvNBCbhQ8Lx2/94zk+GXNLVBoJWQwRP26h0y7Jk2mq
 ryN5IVPrI2C+IhLXeStiX0fK3v2mnz+aWynlpK6lpBZ0EFPF/ItIzq1ZmL2GyCtZUF4w
 XsFUWyNvlBDZzuzgLg37uQSuX1BbJW8Mb1gaYSDlSpoH29gVhukxCuiqGdB7sXGQ6B1S
 VdWBlISQwnklRPH/oMbbqfDXZgAddXmLIwFtk29nbySI0TsHL9nM1ciJkSksjMhlhlb/
 E1QXawTtUSDamUreoF4iGI8I5zISGGnB0FFNJFCtu3Epk4NfFnc91mGYLOjZ9wAQcBN8
 favA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771866125; x=1772470925; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uKapdWTYg4/AfpMV73PJXifaSo/eyOCqm8bePMIHZK4=;
 b=NDD2ZEOg+5E7s5QDgKgp29zncjsThfyJNpya0qVdS0Tj5pVeM3c+RUf5LzkfKxs20y
 fWnNYS8fEKJeUKCQvUy5wwnHxPJoUZUGYby1gXqfF/JR56hAc6zxRZtF+cyupBG3jm+A
 Zul26T4YQEyVDyK5JnwnRUIGcNSNrvTBvEpw2JItbw1/CRb2BJ51ZiuBlHvct2jTKj1W
 dEZMGfgJK9ZSbID9YHarUO4blOgHmeSVGqocOAg3FfpTe+iG7PlA4okSfwgLoh1J4fYk
 inrXPx4VPw0KZO/W4R+qhxzpuXtSzkJeqVGhQE39Apyyg1TincOAvs4kHkKlae5oiZxu
 klAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866125; x=1772470925;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uKapdWTYg4/AfpMV73PJXifaSo/eyOCqm8bePMIHZK4=;
 b=fcKj8W12xErUAEKasBoKSSMHB9yzZ486g7FNBgLVoFcFVhuDqf2W5IWTJSpdIvECHl
 5aXyEacWBhgc2fYw5mcbyKTAxXV12kltfUAPe46JObolhSNRI+30FXAcH7GWzAPfT5Ke
 +IPYpI5b1pixyw1037nmw268GbfHRAeTVxruXDBkii9jf7m+BhdCvRuKlIcL/Skws1YJ
 laT6oJt5E+YmND3Fl8vkiVXgDZZwSVQPFKc6a1P+qIl6IUU9cepdERA4Bx8oj4rBQYBw
 eGa9Yva3YVZAT/jIySVaH4mba2VCAVbE7hM4WR613gxKCsqy336GDsPmyN93teZlg3MV
 luDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3K6RTyAr+rqls2eWqyye3d1M5ni2JCYj86ShOyZsX1p0A/wWtLi2Jsb4GrNpB3rtye7V6ZsS2eA==@nongnu.org
X-Gm-Message-State: AOJu0Yx74QtmJqXCefiExnuNxiKBM3ALdFXZ1YlBpu5s37ikKT0SLQCk
 J/inQYwiZY/6O7E0O4WrDXBCY2qS3ETq2g2qbURkh3SomsdgYTpTV9jrzFkK1lWUmqgmrNwEUAq
 Vhd6sO9sD2bM8Qm7/YXksnqX5tHBeTKg=
X-Gm-Gg: AZuq6aL7SB75FPD0vajEUUa5Ebjm4R2NeT0lsNTOhkKWIGrnxzeQWFYIxB+CvixtJ+X
 YUJ5V1M+HxXRQomMOcVpAIEA5FgnCvIizTXTIb0BtgyPmTYQrz/btCjeJKiEPJ6Y+2hOVyciovs
 sjAnQ113OUNOrnNCvbyVmijM3U30fTXM3JNeBLb124tBDZTTD9ToV1uAj1AwRQwnQcKhi5Pq+V8
 9RpExc5RZQRK+L1ijr629uzbsyvprZY1CEy8elNA/Oz7Z44iUxCAwsvBmDbUwUoY8QiJatZx32H
 oM+XAW02
X-Received: by 2002:a05:6808:2218:b0:44f:8b8b:5dcd with SMTP id
 5614622812f47-464463b79ffmr5266747b6e.50.1771866124696; Mon, 23 Feb 2026
 09:02:04 -0800 (PST)
MIME-Version: 1.0
References: <20260219143332.3316679-1-ruslichenko.r@gmail.com>
 <20260219144901.3317747-1-ruslichenko.r@gmail.com>
 <dd8a92cc-51d6-4404-bd09-75b1798f925a@redhat.com>
 <87y0kj4mr3.fsf@draig.linaro.org>
In-Reply-To: <87y0kj4mr3.fsf@draig.linaro.org>
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
Date: Mon, 23 Feb 2026 18:01:52 +0100
X-Gm-Features: AaiRm52B4c9_RLW6h7gTHr_vn_NiPc2ZIHBr-WJECHVBFGeX6hGcRqXhp9cgXbg
Message-ID: <CAN-aV1H0_4LviryDEmDSN0TfdSit-uN31H8g87sRBkJAHYbrdQ@mail.gmail.com>
Subject: Re: [PATCH v2 19/33] hw/core/machine: add '-hw-dtb' option for machine
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, artem_mygaiev@epam.com, volodymyr_babchuk@epam.com, 
 takahiro.nakata.wr@renesas.com, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, Ruslan_Ruslichenko@epam.com,
 balaton@eik.bme.hu, 
 philmd@linaro.org, wangyanan55@huawei.com, zhao1.liu@intel.com, 
 pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-ot1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Mon, Feb 23, 2026 at 2:23=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> Thomas Huth <thuth@redhat.com> writes:
>
> >  Hi!
> >
> > On 19/02/2026 15.48, Ruslan Ruslichenko wrote:
> >> From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
> >> Add new '-hw-dtb' command-line option and corresponding
> >> MachineState property.
> >> The 'hw-dtb' option allows to specify a Device tree
> >> binary with hardware description which Qemu should
> >> emulate.
> >> Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
> >> ---
> >>   hw/core/machine.c        | 19 +++++++++++++++++++
> >>   include/hw/core/boards.h |  1 +
> >>   qemu-options.hx          |  9 +++++++++
> >>   system/vl.c              |  3 +++
> >>   4 files changed, 32 insertions(+)
> >> diff --git a/hw/core/machine.c b/hw/core/machine.c
> >> index d4ef620c17..affd24cd49 100644
> >> --- a/hw/core/machine.c
> >> +++ b/hw/core/machine.c
> >> @@ -363,6 +363,20 @@ static void machine_set_dtb(Object *obj, const ch=
ar *value, Error **errp)
> >>       ms->dtb =3D g_strdup(value);
> >>   }
> >>   +static char *machine_get_hw_dtb(Object *obj, Error **errp)
> >> +{
> >> +    MachineState *ms =3D MACHINE(obj);
> >> +
> >> +    return g_strdup(ms->hw_dtb);
> >> +}
> >> +
> >> +static void machine_set_hw_dtb(Object *obj, const char *value, Error =
**errp)
> >> +{
> >> +    MachineState *ms =3D MACHINE(obj);
> >> +
> >> +    ms->hw_dtb =3D g_strdup(value);
> >> +}
> >> +
> >>   static char *machine_get_dumpdtb(Object *obj, Error **errp)
> >>   {
> >>       MachineState *ms =3D MACHINE(obj);
> >> @@ -1145,6 +1159,11 @@ static void machine_class_init(ObjectClass *oc,=
 const void *data)
> >>       object_class_property_set_description(oc, "dtb",
> >>           "Linux kernel device tree file");
> >>   +    object_class_property_add_str(oc, "hw-dtb",
> >> +                            machine_get_hw_dtb, machine_set_hw_dtb);
> >> +    object_class_property_set_description(oc, "hw-dtb",
> >> +                "A device tree binary used to describe the hardware t=
o QEMU");
> >
> > Do the hardware dtbs differ from the ones that are passed to the Linux
> > kernel? If not, I think you likely could use the existing "dtb"
> > property for your new feature?
>
> They have to - the normal DTB cannot define the whole system because its
> only concerned with reporting what the kernel can see to the kernel and
> not defining the whole system including what the firmware sees.
>

Yes, Indeed.
Normal DTB was explored, but there is not enough information to create
QEMU models from it.
Thus we need to have a separate device tree.

> >
> > ...
> >> diff --git a/qemu-options.hx b/qemu-options.hx
> >> index 33fcfe7ce6..1568f3ce4c 100644
> >> --- a/qemu-options.hx
> >> +++ b/qemu-options.hx
> >> @@ -4518,6 +4518,15 @@ SRST(initrd)
> >>     ERST
> >>   +DEF("hw-dtb", HAS_ARG, QEMU_OPTION_hw_dtb, \
> >> +    "-hw-dtb file    use 'file' as device tree image\n", QEMU_ARCH_AL=
L)
> >> +SRST
> >> +``-hw-dtb file``
> >> +    Use <file> as a device tree binary (dtb) image used to create the
> >> +    emulated machine. This dtb will not be passed to the kernel, use =
-dtb
> >> +    for that.
> >> +ERST
> >
> > Please don't add any new top level options if it is not really
> > necessary. We already got too much duplicated logic in QEMU, so we try
> > to avoid this nowadays. In your case here, it should be fine to simply
> > configure the hw-dtb via the -machine property.

Agreed. As for now there is only one user of this hw option, we can move to=
 the
arm-generic-fdt machine option itself. I'll move this for the next version.

> >
> >  Thanks,
> >   Thomas
>
> --
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro


--
BR,
Ruslan Ruslichenko

