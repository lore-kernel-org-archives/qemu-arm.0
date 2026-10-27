Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172EF606A31E
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Oct 2026 14:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dCBQEPiY
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLhww-0002kL-Uf; Tue, 27 Oct 2026 10:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLhws-0002ji-Dn
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 10:14:47 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLhwq-0003Lc-Dv
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 10:14:46 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-c4203bbb1e9so589705366b.3
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 07:14:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793110482; cv=none;
 d=google.com; s=arc-20260327;
 b=s7SixONidP5GBsPJZmITQkF7Was7C8Cz3FpkuU1H6XINWfVZUnzq7EyEImLyxxGISL
 ejzsUgM27GdO14BeYgRpPhTOOStrQ01G9oge4CbI1I3KMOThljgAqBVloxmiN1HOeHSj
 OkFd4rvyu6iJ+v+1nyT8P4c94CPm2zv0GmDbr9mV1+oJLpdgXNk8Rjv52/3eU3UoVEbi
 UO4/AM/1IHVN08i2/rMvUdTXGWj1d7eGQ3wd1A4qhuRdCeMM7BAf16dd/Zx2OGtbJ1o5
 0bP6re3GL9k7loPazsdgth2eNB5Fi0e73AMyVQAfDDWcbmtzoFUCLMlxUGVoMiQXEtsX
 NWOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=z1YmAaYHSXtmRVmaoOqjqNzyAy9sDqrNlAqh4Iye/6Y=;
 fh=M48ohH1y+DZ+ppIpL8IcRvtMnIZmHjjQWyHMC1Nu5CU=;
 b=hgT+dnInNl5s282bo/Gos60pSQ6xbO7ZhOOGjCadiWjpJbEi9cC/fwBHlph1zlm9+4
 //m8KKeo82H08pR26Jg6x8/7AnXCZjhpbX0D7lraDh15oT1Ljh6VZnKboLrCBIYEgs20
 oZa2wlAXKMYJTt348IASkMbYMEj27eHIr5Fv0p/f8bmZXxU6t5DG9YkdFr8JoVu60oIb
 3Pd6UNXQ40Y+2lyfQw/1M1D+ecn/v9BauxpNMwxVZJMt593e8Ffh1O1ryKmC7Alf2TIU
 66r1jzOL9I9t1hG3zT9VEpXcqucIQS8pOAYwiQiqmM2ygrpuiCUvZAvp5Z4UWxhxzISe
 8R6A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793110482; x=1793715282; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=z1YmAaYHSXtmRVmaoOqjqNzyAy9sDqrNlAqh4Iye/6Y=;
 b=dCBQEPiYI1HF+Mzh3RFCTuXB+QlR3ru3tPhHMt2KU9jfBMyT5P+dNgRptnkhwol00f
 vK0W2DuCTCaOwdF6i9fRXlu6T6AtiYsBPn/E9bilzCmqdiPCTI70Rhg87Qw0eQkMEI6n
 yaKg8ydvPOxjJ34ORsjW63QlW29jThdl2J2Z3q57b/yaimJ1qp8pAWiWrT/7VEvdQEY7
 GmON4ZqY0YVj8J+kqk35U65gfsIiO2ks/V8ZspxVpvB8idHG4TT6HuVOrMnKl0iH7osu
 iXtMVIuOCYQcASEPi/MQrOM+gW0ivjEMDJIozVykwhDSQyp9XOGRaCBCWYM4X4ISZTp/
 OluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793110482; x=1793715282;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=z1YmAaYHSXtmRVmaoOqjqNzyAy9sDqrNlAqh4Iye/6Y=;
 b=Xxc6D2dCxGwFAxILSwpZjet1kz9yVFAuWhkQSYFuhloA/QropIgAz1wSFZ7Ytr6oks
 K9NRig7AFdP2IoklP5y95MNDKYU+g2UwqN8/im84xMpfXjNnrWKaWh/5LGTYWli1PVpe
 fGPzMc1gB1IVrECuBE0si+OArRy6DmqRchevWkJu4CaiAQxOj7geQO8Kt0X8hBdGdGwu
 IRaYiOYCREHo17BKkMkrAppbAViLKnP1EhtLKzn0dUP7bVr7eUaXSvDzUelI7NYDoxrk
 s+8vISz+0sjriLWA4u9OlT2jZcQK86b6wL/gtFlw71TOq+F59Ijk83TnVxu1LoBXSgMg
 q7yw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwAJ0k7KGJZ+yvITjFgqOJgrnmuTbA6PuNdZaBC4GyXP8XRsz2QKGGeuvVOkRxm1S5d9qDYcjkJAw==@nongnu.org
X-Gm-Message-State: AFq9FYJkUDO80EFRiC4rfM5KVa3z4oKlqqtauHlQuH9ogq9RAs2yk2so
 /gUP8lUhkgjeyONL/RV8GWsV41aJzF7Pn5lQxqS/M5FNkE4sDzy148fhrxv2FSF7UHJ10J1EWph
 u5NJi+CEhOtCl/U0GfuLh+1GylHiIsUA=
X-Gm-Gg: AYBFou0hsW3iNhYg0+UjTrDC8B94NwMlU/uKWKf/Y3ldKGDhtvvuRLSPfFiTVFGVwTR
 JaAUj0t/QiPei7+t6Hm5CoZza/1r1xN+eMvvOEK50dlpAHNP2ZbvO+y8F6zs0r97GYS4R/dusm/
 Up1WYsuOt6zKmgBYfKvIa8CARdRguuBSXoWgtJdRe0vdJjQwS2n3LJz6QZF73M0WUE9jZiBP080
 GcW6wkNXbTgc8cFqXI+6Yb2+9F7MmG9NiUZKFlOejyO7/zsRAXlJhvhKiTcCnlZXHFQDgDTFwAr
 XCw9lloOhklVm+HLIqjFQtQWwW1Y87VFpqy5njv/fpDBvpoVRWkqTDe4N6JzQAh1u6QwN7wbpxz
 3nqNyIvUGMbHOpBAsSJgpo0GfHQXz8e/jGDlM
X-Received: by 2002:a17:907:9307:b0:c29:4915:83cb with SMTP id
 a640c23a62f3a-c46bde93525mr1160549866b.39.1793110481955; Tue, 27 Oct 2026
 07:14:41 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261013195606.152-1-luoyonggang@gmail.com>
 <f3649d73-1edf-440a-9534-7b00da4d075d@oss.qualcomm.com>
 <CAE2XoE828e76zdCEkYVcbjRwhcsaSYZF1_UE4akeaoCTqCK3zg@mail.gmail.com>
 <baf81ba3-f29f-48f0-a9a2-6dc4f005d433@oss.qualcomm.com>
 <CAE2XoE9L8tuhU2nieJ8D=Cz9svS=W3oqAH+j30RGtZibjp1G=Q@mail.gmail.com>
 <bb979f8e-1372-4be4-814e-aa5dcb09942a@oss.qualcomm.com>
In-Reply-To: <bb979f8e-1372-4be4-814e-aa5dcb09942a@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Tue, 27 Oct 2026 22:14:28 +0800
X-Gm-Features: AclHuK_cSUetcQ-qBiw2E_eFsVkYy0D5Ga_2kCaWmvgxAyvrHPgGVmXSXGdHCuQ
Message-ID: <CAE2XoE-rJ67RbTem3fSirtNUR0bzEXEBsqt90fRqV1BFmKi2TQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: defer max-v8 initializer selection until CPU
 creation
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=luoyonggang@gmail.com; helo=mail-ej1-x630.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: luoyonggang@gmail.com
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 14, 2026 at 5:37=E2=80=AFAM Pierrick Bouvier
<pierrick.bouvier@oss.qualcomm.com> wrote:
>
> On 10/13/2026 2:30 PM, Yonggang Luo wrote:
> > On Wed, Oct 14, 2026 at 5:07=E2=80=AFAM Pierrick Bouvier
> > <pierrick.bouvier@oss.qualcomm.com> wrote:
> >>
> >> On 10/13/26 1:19 PM, Yonggang Luo wrote:
> >>> On Wed, Oct 14, 2026 at 4:08=E2=80=AFAM Pierrick Bouvier
> >>> <pierrick.bouvier@oss.qualcomm.com> wrote:
> >>>>
> >>>> On 10/13/2026 12:56 PM, Yonggang Luo wrote:
> >>>>> This is for avoid "max-v8" qom name conflict in multi-target qemu
> >>>>>
> >>>>> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> >>>>> ---
> >>>>>   target/arm/tcg/cpu-max-v8.c | 17 +++++++++++++----
> >>>>>   1 file changed, 13 insertions(+), 4 deletions(-)
> >>>>>
> >>>>> diff --git a/target/arm/tcg/cpu-max-v8.c b/target/arm/tcg/cpu-max-v=
8.c
> >>>>> index 65f851f2006..d7323ab431c 100644
> >>>>> --- a/target/arm/tcg/cpu-max-v8.c
> >>>>> +++ b/target/arm/tcg/cpu-max-v8.c
> >>>>> @@ -119,12 +119,21 @@ void aarch32_max_v8_tcg_initfn(Object *obj)
> >>>>>   #endif
> >>>>>   }
> >>>>>
> >>>>> +static void max_v8_tcg_initfn(Object *obj)
> >>>>> +{
> >>>>> +    if (target_aarch64()) {
> >>>>> +        aarch64_max_v8_tcg_initfn(obj);
> >>>>> +    } else {
> >>>>> +        aarch32_max_v8_tcg_initfn(obj);
> >>>>> +    }
> >>>>> +}
> >>>>> +
> >>>>>   static void cpu_max_v8_register_type(void)
> >>>>>   {
> >>>>> -    static const ARMCPUInfo max_v8[2] =3D {
> >>>>> -        { .name =3D "max-v8", .initfn =3D aarch32_max_v8_tcg_initf=
n },
> >>>>> -        { .name =3D "max-v8", .initfn =3D aarch64_max_v8_tcg_initf=
n },
> >>>>> +    static const ARMCPUInfo max_v8 =3D {
> >>>>> +        .name =3D "max-v8",
> >>>>> +        .initfn =3D max_v8_tcg_initfn,
> >>>>>       };
> >>>>> -    arm_cpu_register(&max_v8[target_aarch64()]);
> >>>>> +    arm_cpu_register(&max_v8);
> >>>>>   }
> >>>>>   type_init(cpu_max_v8_register_type)
> >>>>
> >>>> It works for the current need, but will require further changes for
> >>>> heterogeneous emulation. A more versatile solution could be:
> >>>>
> >>>> arm_cpu_register(&aarch32_max_v8, target_arm);
> >>>> arm_cpu_register(&aarch64_max_v8, target_aarch64);
> >>>
> >>> And another way to handle it is like x86. it's comes with two variant=
 for
> >>>
> >>> #ifdef TARGET_X86_64
> >>> #define TYPE_X86_CPU "x86_64-cpu"
> >>> #else
> >>> #define TYPE_X86_CPU "i386-cpu"
> >>> #endif
> >>>
> >>> This also solves this issue, which looks more straightforward. no nee=
d
> >>> .targets magic for CPU.
> >>> Anyway, maybe the best way is to merge "x86_64-cpu" and "i386-cpu"
> >>> into a single cpu type and
> >>> add .targets magic? When I am trying to get x86 works, faced this iss=
ue
> >>>
> >>
> >> This solves including i386 or x86_64, but not including both at the sa=
me
> >> time. Same goes for arm vs aarch64.
> >>
> >> You can take a look at git history in target/arm, to see which kind of
> >> changes we did to make arm and aarch64 targets linkable. You'll notice
> >> most of the work was to remove (a lot of) #ifdef TARGET_X.
> >
> > See it
> > SHA-1: ec7e5a90fea996f04ea24e81b680a87bc975354a
> > * target/arm: Remove TYPE_AARCH64_CPU
> >
> > So I am just doing just the reverse direction, I am fixes x86_64 in a w=
ay that
> > register both "x86_64-cpu" "i386-cpu" variants, though this way seems
> > more suitable
> > for your heterogeneous emulation, but we need to register
> > everything(CPUs) twice.
>
> We'll have to register this twice anyway for heterogeneous, I don't see
> any other solution to have both accessible at the same time. That said,

I am not sure what heterogeneous would be, currently max_v8_tcg_initfn
is called for
both target_aarch64/target_arm, and call
aarch64_max_v8_tcg_initfn/aarch32_max_v8_tcg_initfn
depends on   if (target_aarch64()); so basically, when call to
max_v8_tcg_initfn, the target
is selected even under heterogeneous mode. would under heterogeneous
mode, target_info() is a
thread local data, if that's true, I think the current PATCH is
enough, we do not need two different
QOM-type-name for CPU .name =3D "max-v8",

> we are not yet there, and current patch solves the actual problem of
> having QOM types registered twice.
>
> I'll let Peter say what he thinks about this.
>
> Regards,
> Pierrick



--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

