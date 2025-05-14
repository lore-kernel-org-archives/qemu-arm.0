Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1157324njb;
        Wed, 14 May 2025 05:42:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXGWAqLJPwZL+6iVvFL/43LAodA9nFMOUSokKmBytG4H2HQkYW1eY17ySjT6EwleOzb+eijCQ3E+QdDGw==@linaro.org
X-Google-Smtp-Source: AGHT+IGbp9zq9lMl/89P82funRN0DhCrJn2L5gFONmgABClCxdrmarJXgCVp+uZ8Ni8alIu+elbt
X-Received: by 2002:a05:620a:2488:b0:7c9:5501:80d2 with SMTP id af79cd13be357-7cd28815d60mr427651785a.15.1747226569134;
        Wed, 14 May 2025 05:42:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747226569; cv=none;
        d=google.com; s=arc-20240605;
        b=L6yTciV0/dRvV+8AIbgP97F5Rh55KRzW+Iirt+hhWVD0laRRxyqd1FA+Cr8oX4xJbl
         6j3JkZCqzpJmtpvMDV7eefOnib6RvaDGvlHs/8Inwn0/n2WwCZoK8am3vqk9ojuMKYUi
         +eeSqgCHlbQnyQAzJNrMj9BkEgx6d4I4AkPjPZ9YJ7J5yYhL8Ns/4akCIbb8QPo9ugLc
         ydPn152FvB5ipxkDeHtu+30CjeG9Bi2i+m0jfpyjYvg0Ww/l8vTFt6pZ7PVikDcV47to
         ErjiebOpcDo279VozeIm5NjaxXGFCTfQHHcT9bWwWH3RqvGoTvsfFXmk0U3sMijWiyZL
         SmjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=6eX7PdtbY7MsbAYfz5XbSkZ+MJFpe8kpenUP/WPVwho=;
        fh=mdf4lbyFMwF4+7qEOFEQqvy9ztQ4KSatLYzpE5cd/jY=;
        b=Ck+rtjeUFmQoLnVoy0nwv5OvMk80pvYm5plSirYsplByaOvsu0beOaJThbnEVzX3+5
         l1l5Pc9HANM7PKgWcWpKwMGAaVCce5BF3FuI//Mni/0qKK30uKH4UsLQ4h5AEyRVReRJ
         aSNjsy76XiEdBnXa0udWuj7BcAMvk+WjFWiuWsgTFfeVC8ASWPG5EERNzAs0L6qbxyRn
         sJiozlsFMK+xPDBxd+7iXm8krnncNmBFdWhrnsxyIDBI6FbHuPEcZx3vixqkueaKfTOF
         yzbc3n9faP+n1F9WxxkTmqbp67LY9DDtVGULhzLH+9Wty+MDYR8ZQBe2rG0zpPxmzU88
         Isug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b=BVKDnztv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=adacore.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00f6986asi1315068685a.165.2025.05.14.05.42.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 May 2025 05:42:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b=BVKDnztv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=adacore.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uFBRB-0005nV-N2; Wed, 14 May 2025 08:42:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1uFBR7-0005mz-Bn
 for qemu-arm@nongnu.org; Wed, 14 May 2025 08:42:14 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1uFBR2-000671-T4
 for qemu-arm@nongnu.org; Wed, 14 May 2025 08:42:12 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5fcc96b6a64so8757807a12.0
 for <qemu-arm@nongnu.org>; Wed, 14 May 2025 05:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1747226524; x=1747831324; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6eX7PdtbY7MsbAYfz5XbSkZ+MJFpe8kpenUP/WPVwho=;
 b=BVKDnztvzgv1ZKKzxFeB0fgxZ59OVGkgk3U9YBQpyLJv6gvUWXJCMBcKigHbjTYhNF
 a6CwiWdVOhaWfvopsujC4HIzKeh0lS36IPXtmx6TtfykHY1+kwP97Uh+AzdDA1f21DiQ
 8EJSCaItsPpOP2z9UJtXZ7Vu0EzmWDIhWqDSZYfr5qUpn/KH4uY/dIgAqeYtev931bO2
 p6g8krSLWiDhJ1//yqpBYnHH1gPNaouZDTTAS2D+vfNrvrnc3cZi0g0wlMQoMEg+COtM
 ylDNb5W56chsFthBohN9IAHjVCvMciFZUc0Q9EYLtre2qGNxCfWR34LOmiqo/kOLnObh
 jhng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747226524; x=1747831324;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6eX7PdtbY7MsbAYfz5XbSkZ+MJFpe8kpenUP/WPVwho=;
 b=fMe+iqlP4qlXTCUVfLsBHGybyeiWx+aUQiyyyxx/f7B6AByZfs243vcBRD3uiJE4GU
 bRtw+TaSIWyUcNjs26692OWmy0j+Us3G3RIOE6//DS8nKyXIoBs10CXBpiFE8hUkjFow
 s4gTGhajNu8vqQNuVL98l5eah8QorXqE7mAkzMfR4pjBwjvuzPsmygLVB8dJ8EDbDR66
 4Vlu1vJlKXUcq9CfmuQqdYQ3X8BnwIoqu/bp3QjSpIdws52Ro2+LBiS4eomm3PDJ+VNc
 wPI49UjanbqB0MVVo2pkQBdNX9A7tVp2yjxWh+zFneXpR2HeC0iG7EB5SnP9OcLoyLT/
 2+kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcIcKoi8Jzvgj03eoqyZ5+ynVLyV7cav2xw1stWmsT4EcVdRlYDmr0TLtqJMWH4CoGDZhspk7grQ==@nongnu.org
X-Gm-Message-State: AOJu0YyPAnpsb+eQxYR5bFOuLLfNwFqEISm/ACkKczDbrY07TZCQaSRv
 s/AwVQvNLiDh4SwPM9AXWl8gRWX/QPzPYGQlyh+bW9cbz/nbq0CN38nkovyM2MKDAF/qZjNADzV
 RkMBKGbBDCre1sgxGF8Tndfprwnpw6xeWSCUF
X-Gm-Gg: ASbGncs1OIxlkISW2kqtREQIFeqac6tweajp+JDzdwHnzU9W10oC+EzcYcZ5iITAbfU
 eVSfCjpbi+IOF+50fPCYRlzHraaOYUWPcRl53ZzC2oS4hCVSUxzB6s58KraJ3sZHHxS+r24558u
 9gHOtPWly57glia4WTj+1QJ3VBtIQ6v2OP9DOE4yasCaM=
X-Received: by 2002:a05:6402:5206:b0:5fe:a303:a6a3 with SMTP id
 4fb4d7f45d1cf-5ff988d4395mr2521901a12.23.1747226524236; Wed, 14 May 2025
 05:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250513141448.297946-1-chigot@adacore.com>
 <20250513141448.297946-3-chigot@adacore.com>
 <3314f721-9c5e-479b-9fcc-3b8a021efde9@linaro.org>
In-Reply-To: <3314f721-9c5e-479b-9fcc-3b8a021efde9@linaro.org>
From: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Date: Wed, 14 May 2025 14:41:53 +0200
X-Gm-Features: AX0GCFs9sB9dU3DXj9r2AtuDGU5ek73ux-p6vpxb-9vRFUwtSKqMzOURCT28ijU
Message-ID: <CAJ307EjyFBDLMe6EaeNUTWSwNTkSxSYJq5VxAD5u0BwZVu4Fqw@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/intc/arm_gic: introduce a first-cpu-index property
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 qemu-arm@nongnu.org, 
 peter.maydell@linaro.org, edgar.iglesias@gmail.com, alistair@alistair23.me, 
 Frederic Konrad <konrad.frederic@yahoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=chigot@adacore.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qas+N8/A7dJI

On Tue, May 13, 2025 at 5:39=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 13/5/25 16:14, Cl=C3=A9ment Chigot wrote:
> > From: Frederic Konrad <konrad.frederic@yahoo.fr>
> >
> > This introduces a first-cpu-index property to the arm-gic, as some SOCs
> > could have two separate GIC (ie: the zynqmp).
> >
> > Signed-off-by: Cl=C3=A9ment Chigot <chigot@adacore.com>
> > ---
> >   hw/intc/arm_gic.c                | 2 +-
> >   hw/intc/arm_gic_common.c         | 1 +
> >   include/hw/intc/arm_gic_common.h | 2 ++
> >   3 files changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> > index d18bef40fc..899f133363 100644
> > --- a/hw/intc/arm_gic.c
> > +++ b/hw/intc/arm_gic.c
> > @@ -59,7 +59,7 @@ static const uint8_t gic_id_gicv2[] =3D {
> >   static inline int gic_get_current_cpu(GICState *s)
> >   {
> >       if (!qtest_enabled() && s->num_cpu > 1) {
> > -        return current_cpu->cpu_index;
> > +        return current_cpu->cpu_index - s->first_cpu_index;
>
> Note, CPUState::cpu_index is meant for accelerators code and shouldn't
> be used in hw/ (in particular because it vary when using hotplug).

Is there another way to perform that then ? As you can see `cpu_index`
is already present prior to my patch. I don't mind improving it as a
prerequisite for that series though.

> >       }
> >       return 0;
> >   }
> > diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
> > index 0f0c48d89a..ed5be05645 100644
> > --- a/hw/intc/arm_gic_common.c
> > +++ b/hw/intc/arm_gic_common.c
> > @@ -350,6 +350,7 @@ static void arm_gic_common_linux_init(ARMLinuxBootI=
f *obj,
> >
> >   static const Property arm_gic_common_properties[] =3D {
> >       DEFINE_PROP_UINT32("num-cpu", GICState, num_cpu, 1),
> > +    DEFINE_PROP_UINT32("first-cpu-index", GICState, first_cpu_index, 0=
),
> >       DEFINE_PROP_UINT32("num-irq", GICState, num_irq, 32),
> >       /* Revision can be 1 or 2 for GIC architecture specification
> >        * versions 1 or 2, or 0 to indicate the legacy 11MPCore GIC.
> > diff --git a/include/hw/intc/arm_gic_common.h b/include/hw/intc/arm_gic=
_common.h
> > index 97fea4102d..93a3cc2bf8 100644
> > --- a/include/hw/intc/arm_gic_common.h
> > +++ b/include/hw/intc/arm_gic_common.h
> > @@ -129,6 +129,8 @@ struct GICState {
> >       uint32_t num_lrs;
> >
> >       uint32_t num_cpu;
> > +    /* cpu_index of the first CPU, attached to this GIC.  */
> > +    uint32_t first_cpu_index;
> >
> >       MemoryRegion iomem; /* Distributor */
> >       /* This is just so we can have an opaque pointer which identifies
>
> Alternative series motivated to remove &first_cpu / qemu_get_cpu():
> https://lore.kernel.org/qemu-devel/20231212162935.42910-1-philmd@linaro.o=
rg/
