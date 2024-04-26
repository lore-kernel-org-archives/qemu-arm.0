Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp388342ejb;
        Fri, 26 Apr 2024 06:29:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWhRQiTVYuaZVmsLxdGj2ODbS5VaVqEfC16GpxZsUi+qpauvdjsRZs86XvWkiQTcpMe5j/1r3+645x+ZtDnQzPQEG5bUSgq
X-Google-Smtp-Source: AGHT+IFoSseTEkQ/N+oF5fEy6KzCcHugOl81GqqzujopGRck1iWSY3eqnM2xbY1J76KD0CZ0vVZx
X-Received: by 2002:a05:6808:1209:b0:3c6:d31:757b with SMTP id a9-20020a056808120900b003c60d31757bmr2625084oil.49.1714138145908;
        Fri, 26 Apr 2024 06:29:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714138145; cv=none;
        d=google.com; s=arc-20160816;
        b=EteOeTBvzaH0mhtshSluR40YwzyNujsUtfxHfUVsiIFOALcnywy7Dhxy/KcKo7wLF6
         SLuB3MKnZZNzE0dnbSoKgUSfz7rnTbs4och7Z4vnPDs2NIBDwA+cqZaSd9oXA9lCGi7n
         SKYsZzSqQ+KJKB/7m3lMejq1ge5yuCDvn2xjdVUQmZp2/cBXJ9QCz/l/fFzbTzhxevpZ
         y6m4sY9MJlHdROPQSRO7GluTKVR9llVC3IcM4UTz+qo6vAfmsFnWPd+W+9iTik0enSgP
         L7GLtDNsglmYGfSa0vk3h2gefq4ld4OwGO0QbldWIdrJ/uua6nttzuh9opBuj6M0XXd7
         NYSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Jatnww9NRbQOfViMHrcl/hzzBD0uBtQqz7689R7WhE8=;
        fh=tH0d0XxQtVF6hR6iHbD8oYJDAKtyXWssL4su8AfSsY8=;
        b=CFbC3zFIKE6HFoss6ZWylEQt6CcHTQFNCUm02RUxQJIO0iT7q7YxJlm+2pHLU9szWR
         k9IAExM4nm8YjdCLIYyGNz1h9PSlLZeT/zKth71JM3PZ2WvqHY3tKT/MGz7CeqHyGIzF
         RiI2YBxpmSbYN+AoCRJRWe/jgNdy95Aa0rN3y/rKXSjQBvimVYjTF/lhZSqR6BYD4Q33
         y4XJLFmcokPky0fHD/IgL3+YNZe3DJtoV7wrAtDLuwa9DcgcoQlRwhU7sDqFJpQIOJXX
         47mQIs+ZCbAb6rqFeNiryJHN8kI/kly2japuKrraxlYCG+LBPJH3VMtZyjhc1YAqh5YD
         w7pQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dJ3poKab;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id oq6-20020a05620a610600b0078edfecda9fsi19448036qkn.681.2024.04.26.06.29.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 06:29:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dJ3poKab;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s0LdH-0003Tj-Qc; Fri, 26 Apr 2024 09:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s0LdE-0003Q0-86
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 09:28:53 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s0Ld9-00055v-Cs
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 09:28:49 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5724f26b8c9so1977908a12.1
 for <qemu-arm@nongnu.org>; Fri, 26 Apr 2024 06:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714138125; x=1714742925; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jatnww9NRbQOfViMHrcl/hzzBD0uBtQqz7689R7WhE8=;
 b=dJ3poKabWF1xB7onMxT13TDdh9buyW387laNfMi9C/DrX3+HbNFO2gWEtZdypm2t4P
 Loi4kcEogbg+KBeVUCWDcSou51+sryD1zZ85u2kMbh/ZbAj88TqOv1FoT8XaBq5ZuA/m
 zrEvzwKDxuwnbuAMnfou2py7ckJKjl+0T3seVB+sQBpbeldaUturvIOFPopDOhixPfff
 ZzygWq30xxUjNrkMQo2LfAeh0EV2qUJ6cQVo0X96x0Qwc1J55/Jt/fI2jB8VtoqerIEm
 mYrrTmp5lMRhRC1f00kIhBhIcPf7xzhN6ogQ6cbFMJU1a8yrohf7gT+cE2GkLf84KPDY
 WjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714138125; x=1714742925;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jatnww9NRbQOfViMHrcl/hzzBD0uBtQqz7689R7WhE8=;
 b=ZBORaHc8dGe5ocIXT//Pj9686VEvUcnYxWYT9gG/tOAq5XyWSGLtQb6G2WmpiMZkgj
 mYHgKj2XNKDExHpUm5ZinRvzD+lta+LEIGXuGCObFQFblzZuuzPtNo4vkVKTDzpIo+Av
 zpxRXXQ0loq7hkcdYfAx4yYuOCMDoBt0z3yjlqdZscSX4EA9dVjVehQX8cgeuPjYmdqK
 JyJiC97C303zN7QxyeqrC5ffIY4ssoITuNuyWvKGv+iSPOFwKhGWDqV0f2jwRb51Ofv8
 B9ti4LHmihoA5GlHHIumSsICSr5TK3PjHTzNo9jIMtT7gP4p5TwnihMwxrcU/Tk0JDuZ
 F8/g==
X-Gm-Message-State: AOJu0YzdhAu1DLPot+QZf3ca69KEBGo1mLINiitAQcp6OqVCFUJ4zOq1
 D5bZa1UjDWdjOAMvYy+qB3v6qnhyWMcgf+M1HlvYtfIPrlDouS2ot8hK03BAqNGkA1gceWXpXSU
 7vRlDy9U0qwPZHz4ozeaJaNqWScehfErBtuAuhswK/Z/N+3iA
X-Received: by 2002:a50:c044:0:b0:572:3f71:161f with SMTP id
 u4-20020a50c044000000b005723f71161fmr4494451edd.12.1714138125068; Fri, 26 Apr
 2024 06:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240426122913.3427983-1-peter.maydell@linaro.org>
 <20240426122913.3427983-4-peter.maydell@linaro.org>
 <36b9a714-44ff-4b60-a23d-89672a98f46e@linaro.org>
In-Reply-To: <36b9a714-44ff-4b60-a23d-89672a98f46e@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Apr 2024 14:28:33 +0100
Message-ID: <CAFEAcA-ajhEXq4wJW-qp_scL0JqfJXCzZNvtmHtQEJLcRhj7-A@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] hw/watchdog/sbsa_gwdt: Make watchdog timer
 frequency a QOM property
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
X-TUID: /mQw+q7m5l07

On Fri, 26 Apr 2024 at 13:46, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Hi Peter,
>
> On 26/4/24 14:29, Peter Maydell wrote:
> > Currently the sbsa_gdwt watchdog device hardcodes its frequency at
> > 62.5MHz. In real hardware, this watchdog is supposed to be driven
> > from the system counter, which also drives the CPU generic timers.
> > Newer CPU types (in particular from Armv8.6) should have a CPU
> > generic timer frequency of 1GHz, so we can't leave the watchdog
> > on the old QEMU default of 62.5GHz.
> >
> > Make the frequency a QOM property so it can be set by the board,
> > and have our only board that uses this device set that frequency
> > to the same value it sets the CPU frequency.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   include/hw/watchdog/sbsa_gwdt.h |  3 +--
> >   hw/arm/sbsa-ref.c               |  1 +
> >   hw/watchdog/sbsa_gwdt.c         | 15 ++++++++++++++-
> >   3 files changed, 16 insertions(+), 3 deletions(-)
>
>
> > diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> > index 36f6f717b4b..57c337fd92a 100644
> > --- a/hw/arm/sbsa-ref.c
> > +++ b/hw/arm/sbsa-ref.c
> > @@ -543,6 +543,7 @@ static void create_wdt(const SBSAMachineState *sms)
> >       SysBusDevice *s =3D SYS_BUS_DEVICE(dev);
> >       int irq =3D sbsa_ref_irqmap[SBSA_GWDT_WS0];
> >
> > +    qdev_prop_set_uint64(dev, "clock-frequency", SBSA_GTIMER_HZ);
>
> Since we have access to the CPU and its generic timer, what about
> just keep the wdg in sync, as smth like:
>
>    qdev_prop_set_uint64(dev, "clock-frequency",
>                         object_property_get_uint(OBJECT(some_cpu),
>                                                  "cntfrq", errp));

That introduces an implicit ordering requirement that
the CPU has been created before the watchdog, which I'm
not super enthusiastic about. "The platform knows the
frequency and sets it on the devices that care" seems
more straightforward to me.

(The really-follow-the-hardware approach here would be to
model the memory mapped system counter and then wire that
up to both the CPUs and the watchdog, but that's a lot
of extra work. I have some half-baked patches in that
direction but for the moment I figure doing the simple
thing is all we need.)

-- PMM
