Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FA6CC6B19
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 20:19:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGiy0-00054k-Hd; Tue, 13 Oct 2026 16:19:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGixz-00054T-4r
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 16:19:19 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGixx-0004gA-K2
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 16:19:18 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6b1aa4d71e7so251802a12.0
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 13:19:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791922756; cv=none;
 d=google.com; s=arc-20260327;
 b=CG1U97BQ3nEVYZn/+tGEtIMouSyE1jH0lB3zpmY88TAJInj+LY93JkluvrXg4XgxA7
 cgDgK7XeW8DzzUvydiigm0z4gZh7lYky2c70nRqoCispjFz71D7bM5d9ZkoPxuvIsaqW
 92zxxpvJ/EoY1cfWLK79/rDg5UG2+S0Tj3MlnGCt1ZfwIZOF0g5xO0m16CiVG6W3weF8
 p57QWfXVhV7rZqop7W8EVgpfdZT51dl/IBhjcNXlgthB010GIisXEQ139KwlgQkJWj7N
 qz9/oBZZBUSeulqB04geiCV2t1Q1RCPQdJV3D50s1LCzTLnA7OaS35dQPXkMq8H12hza
 2F8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=UP4lpP0kar3gNdYX8OFAipp90Yk+JYoBHM/fAy1NcWU=;
 fh=xq2H4EafFvYQyiJP1ssuplW+PXjVX/aw00GFad9VyB0=;
 b=lDLbySXC/l3ebOMiqk8kfb74L8sqf9wUc29ulaVj5WZ7KPY/1BpRWSbimxh1ez5VBD
 tx3FqjaCOUMMS6rur8nAavJkWc+MSu2pFTxZjx3twlRUXJDXpVVgnWb9evfBgn27UeHr
 gA8Cajs9y0jxgXP7kMTyUW5PwgBqP5YphP9FQqqckIeigpLERDB94M0xOKs4Eqa0Zd3U
 T18vSdfIsmv5ETCRpR/yzvMF63V77Kvm0FH7yoc6gkf2tkzdTnQp1uf8WCWinUgS/vYd
 rrTjTub6K8eaePhz9t13nVXADZv2Y2W7N/N0/AYRlZWtEB+em/CH+/quXakzXiw4qSrK
 kA6g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791922756; x=1792527556; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=UP4lpP0kar3gNdYX8OFAipp90Yk+JYoBHM/fAy1NcWU=;
 b=Wi8Kz/alJ/yjoNAlUIQFHodrlFwldjqCvRZgxoYGla3lUsi1bVwoLErbZPinBG7fxN
 x5xkQyGebkNEhT3JLuFJ2eTuH3k8yp6Wj5dN+IpaKJdMDP+hDFpmU33zseTZLAw1g3Ut
 7JXlN7WMt7tPG8NG06UQjOxlM2HcF+Ww7JXIkU1KxJe+R6IBoJ8x/9XWZuO0KlGsRNUB
 GsggFF2ZbeJD5oVxc6gXUP35bkhq17RkGLo90rXtD9GUSulV3HAiqUBS/k1OH03mNvvX
 pPw3leqD5NC/8pC9pSy3PzzDDvj/YIBuZDhDHIne08Kte4pasJAdLkAhXyxS+hgCpKm/
 nfQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791922756; x=1792527556;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=UP4lpP0kar3gNdYX8OFAipp90Yk+JYoBHM/fAy1NcWU=;
 b=zwriIIf945XGYpNffBGr+WnHu7Wq0ax2gowrQ5tzA27LeOAtALhK1a0JI1dutNSsIQ
 uh6HAcCW1ZzOYSsmdkkXOEUOyAkXzeUyX/eyqYnIWPDiPjcuF/FXdFzvw7FStOn2cID+
 Rf03lKmFiM1awPor8gWV2GFBakOY5Ol/Mm+39zGPPTSqdJjp8m1ynjF4OB7qAI6mkrIT
 uxy+GvOxNnY/wFDlaHuyxbA7jJ8AtXdg6dtrNvLFfTqKm6MkxCFYjS0YuRhXIAfrP947
 XDRDx1f3MC1ycBRjYkR5G6mzWZpr87V8fAXsLigGmb7Vdw0DLeveTueoBBqyGJ/eA7Mf
 apZA==
X-Forwarded-Encrypted: i=1;
 AKwUvBw9bXdkHO8DV+Nn7rCO5YlkuwV379HysG+wk1/HjC49I2alezdn4HkpwRf9is52rdcqfEiUW+es2Q==@nongnu.org
X-Gm-Message-State: AFq9FYLw9zNz4mUcOgeAB4JVdHbkUPNhymR+G+OoJDq//GVlQJm49vOw
 udXnJ8lITGCg2f4p6zzdkpkSEPNDsJUJMv3eIl59AxSrZrj+c+KQi0p89lXTtj6NZnTF1QKvXZi
 gfJDfxLW3zJiwBAh6l+Tun6IVKxnneBE=
X-Gm-Gg: AYBFou1vGlw/Roe5/yNhMqa6vkrkBB1NbDV7GVtUxDdTbHAt1vRaByYYNuSAO0Dp8i+
 6vMivId3DMz7+wtHZVyiU2IzrwecyLvEsYrzYkk0IGFUKI5ogaivE6f4gCe7UWdoTYWpDe6vV9W
 N6rOxeYN43nFgLyK6lIdvbbkPFvwRqEF1rCAR35ozFjl11cdbr4GJ6vsRItsoWvrwT+fcjRmOj+
 w3XvmQlhrzFlLeNNhhU6iI29wSWHx+DvfEUhQ7K2DWn6ksyws1/8/oB1TnOcNu/fWPmRb3bwMq3
 SqFK65KcgXgfl2jXTHywClEf5+vtdR3N9ks9qpdFo5/QDCdLWHRwUrU=
X-Received: by 2002:a05:6402:1cc2:b0:6ae:fc0f:e19 with SMTP id
 4fb4d7f45d1cf-6b17c4ee3e2mr10891431a12.42.1791922755767; Tue, 13 Oct 2026
 13:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <20261013195606.152-1-luoyonggang@gmail.com>
 <f3649d73-1edf-440a-9534-7b00da4d075d@oss.qualcomm.com>
In-Reply-To: <f3649d73-1edf-440a-9534-7b00da4d075d@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Wed, 14 Oct 2026 04:19:02 +0800
X-Gm-Features: AclHuK-qiDOyENcAxtS5FxBQhp230EV57isL1AmEc2Jx2vN8tsNe7QFYIjLw1-o
Message-ID: <CAE2XoE828e76zdCEkYVcbjRwhcsaSYZF1_UE4akeaoCTqCK3zg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: defer max-v8 initializer selection until CPU
 creation
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x52e.google.com
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, Oct 14, 2026 at 4:08=E2=80=AFAM Pierrick Bouvier
<pierrick.bouvier@oss.qualcomm.com> wrote:
>
> On 10/13/2026 12:56 PM, Yonggang Luo wrote:
> > This is for avoid "max-v8" qom name conflict in multi-target qemu
> >
> > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> > ---
> >  target/arm/tcg/cpu-max-v8.c | 17 +++++++++++++----
> >  1 file changed, 13 insertions(+), 4 deletions(-)
> >
> > diff --git a/target/arm/tcg/cpu-max-v8.c b/target/arm/tcg/cpu-max-v8.c
> > index 65f851f2006..d7323ab431c 100644
> > --- a/target/arm/tcg/cpu-max-v8.c
> > +++ b/target/arm/tcg/cpu-max-v8.c
> > @@ -119,12 +119,21 @@ void aarch32_max_v8_tcg_initfn(Object *obj)
> >  #endif
> >  }
> >
> > +static void max_v8_tcg_initfn(Object *obj)
> > +{
> > +    if (target_aarch64()) {
> > +        aarch64_max_v8_tcg_initfn(obj);
> > +    } else {
> > +        aarch32_max_v8_tcg_initfn(obj);
> > +    }
> > +}
> > +
> >  static void cpu_max_v8_register_type(void)
> >  {
> > -    static const ARMCPUInfo max_v8[2] =3D {
> > -        { .name =3D "max-v8", .initfn =3D aarch32_max_v8_tcg_initfn },
> > -        { .name =3D "max-v8", .initfn =3D aarch64_max_v8_tcg_initfn },
> > +    static const ARMCPUInfo max_v8 =3D {
> > +        .name =3D "max-v8",
> > +        .initfn =3D max_v8_tcg_initfn,
> >      };
> > -    arm_cpu_register(&max_v8[target_aarch64()]);
> > +    arm_cpu_register(&max_v8);
> >  }
> >  type_init(cpu_max_v8_register_type)
>
> It works for the current need, but will require further changes for
> heterogeneous emulation. A more versatile solution could be:
>
> arm_cpu_register(&aarch32_max_v8, target_arm);
> arm_cpu_register(&aarch64_max_v8, target_aarch64);

And another way to handle it is like x86. it's comes with two variant for

#ifdef TARGET_X86_64
#define TYPE_X86_CPU "x86_64-cpu"
#else
#define TYPE_X86_CPU "i386-cpu"
#endif

This also solves this issue, which looks more straightforward. no need
.targets magic for CPU.
Anyway, maybe the best way is to merge "x86_64-cpu" and "i386-cpu"
into a single cpu type and
add .targets magic? When I am trying to get x86 works, faced this issue


> /* and fix other call sites */
> And arm_cpu_register could take a new parameter, to set
> TypeInfo.is_available with the callback passed in.
>
> @Peter: do you have a preference on this? I'm fine with having current
> patch and delay further changes to arm_cpu_register until we have proper
> heterogeneous support if you prefer.
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

