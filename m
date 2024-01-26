Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp810217ejc;
        Fri, 26 Jan 2024 03:25:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdR2Huula0YkYDZpTmYdfUivNMEnS25Xk4s9wsi1bwH6tC/239/KhMN+FKRZwueExLD8sg
X-Received: by 2002:a05:6214:242d:b0:685:c42e:8773 with SMTP id gy13-20020a056214242d00b00685c42e8773mr1330531qvb.8.1706268322936;
        Fri, 26 Jan 2024 03:25:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706268322; cv=none;
        d=google.com; s=arc-20160816;
        b=dB3G2YD6w8TwJDNFbIUpiWdyxE0vm0KITm8LtfxkauYuWTgN0smsbyYZhGZq586RFK
         uJMQVHFJVahFBvnce+0L/VtOWZGdyi/ZNYjtRuhuGvjNPZOuxwY+OVfevjwD8kBjdSA9
         4fDFQ0zxtDCBEDzJ5mfeJhhVZcUXVG//re5SS9tyUW+uslfru4AUn+n1TYA6SXmxQPLA
         KZcKq6ufD81HOncbYk4iUbOBLGgZavbbnjPKvTlbV1zyta9nopLpJ29FjEWm47iO2TqA
         QqeFnFZZimgd0EMgtc9ejsfhcOpuM/ZTvTGTXJX7WxIy6kIV5Qu9a7UkCENbwdgWV+gA
         gIYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=aF27/ZePh3ddk3rGqciVQDVinq36RJdej/bR+Eib+3Q=;
        fh=AR1dRF+1A7x+9vSZVUGjn6uNl1IWaJR3KLhgzw7qzWc=;
        b=LNzKcVq7omwQq7l6EGeNcNZY9jWhO6ADqGy3a6x4t2+mNMZAZUqSZMUhcmHf9wmSHo
         y6/X3YNb86F1+thdXcLWAc+J/6zzorv4QYiL0WRlGejgb/xqAHC1Ee6uXOrIrVWpQI5u
         sn7nENtDsUwm/wylgsSeObNSGzu5kxpuipVPViZoYsGF18/XNeUCGlNW/km/CIoVrATu
         XrQXTHLO21V485sGEZZ4BzrgUvV91if/Dx2qf+f/AHEwKNH2U+UFCR0zI0ysTAs1Q2nF
         V1v8wnK4raCtjbIKDfkN96aTr7/bGFHkF29ZrN24mb+uzHfrPUhcEOVIIg1sTQcx0PO9
         682g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EY6CFXTe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 12-20020a0562140ccc00b0068194ca223bsi1094245qvx.548.2024.01.26.03.25.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 03:25:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EY6CFXTe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTKKd-0001R4-3w; Fri, 26 Jan 2024 06:25:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1rTKKZ-0001PJ-LQ
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 06:25:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1rTKKX-0006LH-ES
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 06:25:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706268304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aF27/ZePh3ddk3rGqciVQDVinq36RJdej/bR+Eib+3Q=;
 b=EY6CFXTeYQLRqy7In19xP9ZltFfIR4nAwYLp8nGzYd0Gu7xJhrzE2P/EWGiJo8QPxu1CkN
 6J1rx1uixWngTBjLpoCBKcFZ2WgH97FTHA0xBFyGm7wZW/T1982MM+x7TaHQKpJfRtyTIE
 uleJpeKUdBfy9s0qzbyQJl+JKNp0myM=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-dQJlqUH_NKWSOC81sa_HCg-1; Fri, 26 Jan 2024 06:25:02 -0500
X-MC-Unique: dQJlqUH_NKWSOC81sa_HCg-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-5ffc7ce3343so3598567b3.1
 for <qemu-arm@nongnu.org>; Fri, 26 Jan 2024 03:25:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706268302; x=1706873102;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aF27/ZePh3ddk3rGqciVQDVinq36RJdej/bR+Eib+3Q=;
 b=w5GVfQeme7J8C8X+btnAtWnamHIV5ENwCruts4u7RgDr0It1l/dOssRyg8PYyIbFtM
 EacMpOnJerth4jqXlmoA1L/i2CH9TwO6xSq4hheRjkweCJj1wm1CbVKnEclbGmjNajts
 RUOMf3sMhBfXyXukHhStxvcLCSDglMr6NE/iNpgiYKOby4SEhZSJvkQy1+uljM0aW+It
 veRKZKZfS9zlVGxGgiYyUEuxpCiKTJ+rQWhW0DcIdz5UpDIyWpxbfmN3A/RA5Nj1qgs5
 eWzg5Zjhml4mC3USKiBIr6f7yB+/M19qHMQQsgje46DcDm0NweYM6XA3bLiR/UnrTyxG
 fnwg==
X-Gm-Message-State: AOJu0YzwoOBiZUDaMUts5UZcgVcG9eOrEK/ZCG8BmegJr/huaMhUfme0
 iyPwkPwgDM2HUj5ocphf1JPcjwW05yXcw6J4KpmV68JE0LTDxPO9HnDhXEFMKPe0mqXdvu+1OG9
 IikgDodYNQq9G/ElPuBXuWWgnKcRiEngFJEQyG6GePzoASCPHwO14ppqK70AaNAi5c6M+B5F4MB
 OTxXNzHVl+K5GKb5S6DsBG+VM8
X-Received: by 2002:a0d:d4cb:0:b0:5ff:9c13:73e5 with SMTP id
 w194-20020a0dd4cb000000b005ff9c1373e5mr1198358ywd.58.1706268302016; 
 Fri, 26 Jan 2024 03:25:02 -0800 (PST)
X-Received: by 2002:a0d:d4cb:0:b0:5ff:9c13:73e5 with SMTP id
 w194-20020a0dd4cb000000b005ff9c1373e5mr1198335ywd.58.1706268300264; Fri, 26
 Jan 2024 03:25:00 -0800 (PST)
MIME-Version: 1.0
References: <20240125165648.49898-1-philmd@linaro.org>
 <20240125165648.49898-2-philmd@linaro.org>
 <1128019c-adca-4cd4-aa73-937001ad990a@linaro.org>
In-Reply-To: <1128019c-adca-4cd4-aa73-937001ad990a@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 26 Jan 2024 12:24:48 +0100
Message-ID: <CABgObfZuPwzVdPjgeLOOtjmNqUMGcK=ExsvVQOzLqnUABmmX-A@mail.gmail.com>
Subject: Re: [PATCH 1/2] scripts/coccinelle: Add cpu_env.cocci_template script
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-arm@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.5,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: BxFOzIpdzHos

On Fri, Jan 26, 2024 at 11:38=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 25/1/24 17:56, Philippe Mathieu-Daud=C3=A9 wrote:
> > Add a Coccinelle script to convert the following slow path
> > (due to the QOM cast macro):
> >
> >    &ARCH_CPU(..)->env
> >
> > to the following fast path:
> >
> >    cpu_env(..)
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > ---
> >   MAINTAINERS                               |  1 +
> >   scripts/coccinelle/cpu_env.cocci_template | 60 ++++++++++++++++++++++=
+
> >   2 files changed, 61 insertions(+)
> >   create mode 100644 scripts/coccinelle/cpu_env.cocci_template
>
>
> > diff --git a/scripts/coccinelle/cpu_env.cocci_template b/scripts/coccin=
elle/cpu_env.cocci_template
> > new file mode 100644
> > index 0000000000..53aa3a1fea
> > --- /dev/null
> > +++ b/scripts/coccinelle/cpu_env.cocci_template
> > @@ -0,0 +1,60 @@
> > +/*
> > +
> > + Convert &ARCH_CPU(..)->env to use cpu_env(..).
> > +
> > + Rationale: ARCH_CPU() might be slow, being a QOM cast macro.
> > +            cpu_env() is its fast equivalent.
> > +
> > + SPDX-License-Identifier: GPL-2.0-or-later
> > + SPDX-FileCopyrightText: Linaro Ltd 2024
> > + SPDX-FileContributor: Philippe Mathieu-Daud=C3=A9
> > +
> > + Usage as of v8.2.0:
> > +
> > + $ for targetdir in target/*; do test -d $targetdir || continue; \
> > +       export target=3D${targetdir:7}; \
> > +       sed \
> > +           -e "s/__CPUArchState__/$( \
> > +               git grep -h --no-line-number '@env: #CPU.*State' \
> > +                   target/$target/cpu.h \
> > +               | sed -n -e 's/.*\(CPU.*State\).\?/\1/p')/g" \
> > +           -e "s/__ARCHCPU__/$( \
> > +               git grep -h --no-line-number OBJECT_DECLARE_CPU_TYPE.*C=
PU \
> > +                   target/$target/cpu-qom.h \
> > +               | sed -n -e 's/.*(\(.*\), .*, .*)/\1/p')/g" \
> > +           -e "s/__ARCH_CPU__/$( \
> > +               git grep -h --no-line-number OBJECT_DECLARE_CPU_TYPE.*C=
PU \
> > +                   target/$target/cpu-qom.h \
> > +               | sed -n -e 's/.*(.*, .*, \(.*\))/\1/p')/g" \
> > +       < scripts/coccinelle/cpu_env.cocci_template \
> > +       > $TMPDIR/cpu_env_$target.cocci; \
> > +       for dir in hw target/$target; do \
> > +           spatch --macro-file scripts/cocci-macro-file.h \
> > +                  --sp-file $TMPDIR/cpu_env_$target.cocci \
> > +                  --keep-comments \
> > +                  --dir $dir \
> > +                  --in-place; \
> > +       done; \
> > +   done
> > +
> > +*/
> > +
> > +@ CPUState_arg_used @
> > +CPUState *cs;
> > +identifier cpu;
> > +identifier env;
> > +@@
> > +-   __ARCHCPU__ *cpu =3D __ARCH_CPU__(cs);
>
> Here we remove ARCH_CPU(), ...
>
> > +-   __CPUArchState__ *env =3D &cpu->env;
> > ++   __CPUArchState__ *env =3D cpu_env(cs);
> > +    ... when !=3D cpu
> > +
> > +@ depends on never CPUState_arg_used @
> > +identifier obj;
> > +identifier cpu;
> > +identifier env;
> > +@@
> > +-   __ARCHCPU__ *cpu =3D __ARCH_CPU__(obj);
> > +-   __CPUArchState__ *env =3D &cpu->env;
> > ++   __CPUArchState__ *env =3D cpu_env(CPU(obj));
>
> ... but here we just change it by a CPU() QOM call.
> So this 2nd change is just style cleanup.

Can you also add a hunk that is

CPUState *cs;
@@
-  CPU(cs)
+ cs

to clean up on the second?  cpu_env(CPU(current_cpu)) is suboptimal
and also a bit ugly.

paolo

