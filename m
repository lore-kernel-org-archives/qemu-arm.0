Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp4374088ejd;
        Mon, 22 Apr 2024 08:59:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXet3gjUMCvO/89q24dRII/7C6lFWf3O9037lHyTqo3esaxHyUCks2feyhdiLkABWROjSoPOABZ6/+x/+LrtceYf3Y9Qnm4
X-Google-Smtp-Source: AGHT+IE9ryzu/XckJMHr77ZDK5YxvFGYWSuMwxrQNilwcTRm3yFW2XthfNuNUCJCLFrURZlquIhb
X-Received: by 2002:a05:622a:1822:b0:439:577d:9a9e with SMTP id t34-20020a05622a182200b00439577d9a9emr12484578qtc.9.1713801587003;
        Mon, 22 Apr 2024 08:59:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713801586; cv=none;
        d=google.com; s=arc-20160816;
        b=hrxLk1mnt+97GZw2Kw8jsBvmjRki5gsVZTAJIAfhtP7XM9GAsjwgx8qaytsGOcK35k
         qPFr3Okg+EJFy5yQhAKHa3bWf3hxq7Wsk0Enm+Twp7ZxRg1Y+bElV4uOJ18AVczPJWPl
         2eaNh84XMqehz6K3yk5mNzbb9eis7Qb7778WUaUTgjO6OVPcrRd911luH87pYR9sLPU/
         /SeAnEzBxMsXBIrkODiI/JjHi14jbyfleSwBCmkmdfOKjYXfopaHEk+EG34vpVyXYDHz
         i5bRMskbV4GiogFAuUjb1GJHfYDIajXhAq90EKvxTOULcixVM+RHRKK1MWZaWJA7mGJs
         gIhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=zTzh/CY5pEAB9F/D4tZJ6UKsdUsJeOrDVK6PgLKaRZ0=;
        fh=OtxPdJAxXKm7vbHb6ldUE2wfoG5tYvWYBgJjhOxiO6o=;
        b=Q8sA3Ah/qsOANrgdxIV8heC+qOqMTfI/FU28kgxKaXeEMLKHd2N/b1fwyUTYLFilai
         i1hDi9A4dMY0J7Dkdg2qp47Z1eAfsZ6Avwe2eTA5PiMfsPXRof4qohu6W1PCESwKdXca
         GcOM2e/mHHvoerki0bSofOqjiEcUOwNVvMyvoomBCYtVMMHfHlGN0v6h5UQzs2bpr0qj
         rd/Aviv8N8v2pSUKwWpi2FPckMeZrrk8udYsiWZtvl4cMk8s/klG8kN9lnhb/ExagZie
         rvM8RdcL4QgEx1omCnalfsgogezc74ZtfrTEFIbUXPvA/LF/KNhEChu3PDYLuD0Y+fOl
         oUAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VBBbld38;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b15-20020ac87fcf000000b00430ef644d5csi10550888qtk.275.2024.04.22.08.59.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Apr 2024 08:59:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VBBbld38;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ryw4u-000560-CO; Mon, 22 Apr 2024 11:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ryw4p-00055W-0o
 for qemu-arm@nongnu.org; Mon, 22 Apr 2024 11:59:31 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ryw4l-0000WT-H6
 for qemu-arm@nongnu.org; Mon, 22 Apr 2024 11:59:30 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56e6a1edecfso6993027a12.1
 for <qemu-arm@nongnu.org>; Mon, 22 Apr 2024 08:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713801562; x=1714406362; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zTzh/CY5pEAB9F/D4tZJ6UKsdUsJeOrDVK6PgLKaRZ0=;
 b=VBBbld38fKhDeQ4XIuG/Nl42RhWxUTM4K3dfVtYcMbp/57Y2d8jrse4z/GVHctjbCJ
 vixfZ8WuSVPyaUKB1Y6jwx5u0f8yVQkPx/+plwexB8keJU9M8hlfoj0lTxkZo2rrgxFl
 om+pAdBwVq7ePHivdmYe5+5K2oxenOpfpiIvVZblw98WRTCSpk1ttzfNXxq1W787kT8o
 jyktZ1ZAilPAKS/hQYjVBfCisEC9Wgv1coynLiDN/+8kHGiV7pQmGsPkT2fQDoBYC4ne
 7f9q/SVHETizlN6qAioKO32i9TX9hAC04LvA5UIq18pTj1hKfNB48mzGOSLk3tr6E0Rt
 kxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713801562; x=1714406362;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zTzh/CY5pEAB9F/D4tZJ6UKsdUsJeOrDVK6PgLKaRZ0=;
 b=sMWS3RxhcLmw8pd+C8XZyc82CoD+G+wxjwfvv3Ka5BcWkJh3H+wcpE8VGdI9G6JWCF
 vVjbwmiqIfwCFMEfqo3sVBHKt+ITWN/TSrxo21kCcqztfbo+XGo8DeRjrLAh2d1bPrDZ
 ntSz3e++zvXr+LOMzkOD28EXrCcqM1WTpekjWTsi2dNPQUnu7QaUaS6+H0Pbe4GIIRh9
 9jx3Xbrje0S1YVqg1eY6uwc4kI3xx0EaW1KSOdIm2NgkZAX8z4kcT21xFiuv36HwwkEo
 Udmop2y1GJY7M21YH5sUY0auC5wwqC9P5msTkVVrnLMutZrdgheFmL9cRQXwbgi0OU5Q
 hxzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZQ91hTz5GkvWQqJD+lfN9O1pSVMVUuz6Poi7cNF72C6kvueyfD/f+Y5Y+mMKi6b/xGNKTWfhDdNXD8t1edKJDZKhF
X-Gm-Message-State: AOJu0YwQrsCbxrar4hRU6IySabDpKWnM3JqU+IUlc6R15rXHpyaL98j6
 RtHxQXEb2a1IvwsOreDVtLMlk1TseBvXymIPeDouvrELMi9OOeK4JSb2RzV/etaxXuKP9TFecHV
 yeJRe0DTQ5R4fACOWvMWuP8oPGnXdclzyL13Wbw==
X-Received: by 2002:a50:ab1a:0:b0:570:4ae1:6534 with SMTP id
 s26-20020a50ab1a000000b005704ae16534mr7614953edc.7.1713801562528; Mon, 22 Apr
 2024 08:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240301204110.656742-1-richard.henderson@linaro.org>
 <20240301204110.656742-6-richard.henderson@linaro.org>
 <CAJ307Egu6951WwbdoTERUVff9cr=2qBK70FWgk3Ck-1DCpDtHA@mail.gmail.com>
 <1e4cd671-45fe-4a97-8f76-5bbb07a84c15@linaro.org>
In-Reply-To: <1e4cd671-45fe-4a97-8f76-5bbb07a84c15@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Apr 2024 16:59:11 +0100
Message-ID: <CAFEAcA8RqJXm7aUv-odrDExYzxoWofzmZOT+A0MFtewZpTHJRg@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] target/arm: Do memory type alignment check when
 translation disabled
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Idan Horowitz <idan.horowitz@gmail.com>, 
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>, ardb@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
X-TUID: EzcICWId5kUe

On Mon, 22 Apr 2024 at 16:48, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/22/24 08:26, Cl=C3=A9ment Chigot wrote:
> > Hi Richard,
> >
> > While testing the future V9, I've some regressions on a custom board
> > using cortex-R5 CPUs.
> > Unaligned data accesses are no longer allowed because of that patch.
> >
> > I've dug into the various documentation and it seems that R-profile
> > CPUs don't have the same default memory type as A-profile. It depends
> > on a default memory map provided in the R-Profile RM in C1.3 [1], even
> > when PMU is disabled.
> >
> >> Each PMSAv8-32 MPU has an associated default memory map which is used =
when the MPU is not enabled.
> >> ...
> >> Table C1-4 and Table C1-5 describe the default memory map defined for =
the EL1 MPU.
> >
> > For our case, Table C1-5 can be simplified as:
> >   |  0x00000000 =E2=80=93 0x7FFFFFFF Normal
> >   |  0x80000000 =E2=80=93 0xBFFFFFFF Device-nGnRE
> >   |  0xC0000000 =E2=80=93 0xFFFFFFFF Device-nGnRnE
> >
> > Therefore, we can't blindly enable strict alignment checking solely on
> > SCTLR bits. We should make it depend on the address targeted. But is
> > it possible to know that address in `aprofile_require_alignment` ?
> > with `mmu_idx` ?
>
> No, this would need to be handled in get_phys_addr_disabled.
>
> > By the way, are R-Profile CPUs the same as those having the `PMSA`
> > feature ? That could mean we can use the `ARM_FEATURE_PMSA` to deal
> > with that, instead of create a new `ARM_FEATURE_R`
>
> No, some armv5 have PMSA.
>
> >
> > Note that the RM I've linked is for ARMv8. But this other link [2]
> > seems to show a similar behavior for arm-v7.
> >
> > cc Jonathan and Ard, though not sure this is the same bug you've
> > reported earlier.
> >
> > Thanks,
> > Cl=C3=A9ment
> > [1] https://developer.arm.com/documentation/ddi0568/a-c/?lang=3Den
> > [2] https://developer.arm.com/documentation/ddi0406/cb/System-Level-Arc=
hitecture/Protected-Memory-System-Architecture--PMSA-/About-the-PMSA/Enabli=
ng-and-disabling-the-MPU?lang=3Den#BEIJEFCJ
>
> Ouch, thanks for the armv7 link.  At the moment it looks like my blanket =
mmu-disabled
> change should be restricted to armv8.

Restricted to A-profile, probably. I haven't cross-checked, but IIRC
for v7A this is IMPDEF and we're OK to fault it.

thanks
-- PMM
