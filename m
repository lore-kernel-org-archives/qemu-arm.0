Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp207895njb;
        Tue, 11 Feb 2025 02:07:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWfQRWL8L9KB06Wkt1IqKHYt2yTlA2l6e9/5aPZUUuj6LaOOOPl6SGcDSsBcbBlsZQBk5PhxNd27bAbaw==@linaro.org
X-Google-Smtp-Source: AGHT+IFGZWIa245zqV8ROAERqxZcvxHOR+d5QwI4mEOuYAGib86r1hw5702l25pBSb0AiwaEGAKe
X-Received: by 2002:ac8:5dc7:0:b0:471:963b:5857 with SMTP id d75a77b69052e-471a0648e8bmr49103371cf.11.1739268435922;
        Tue, 11 Feb 2025 02:07:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739268435; cv=none;
        d=google.com; s=arc-20240605;
        b=UMBNGdjGzTkdTlPlBs0gbRMpr1cSq5z2TPLh99Y7DIz0vwTcPyAg6+QGZ1szuE/Eb+
         viMUbDi5fMDtMSaNZm2ttBdfCrdEh3PiRvzdo+uEX73EonHIdLhoKGDYTX9p1Cl/GnKa
         xCEFwUqbtpM4znu/HwJWaqXB1S8Ro99FPfHm4EVVWRPknA9sG/PUUwHsy60MUy4HrgnB
         2llAa6JpHyBp/vdPOc9gB7jlU8Jucr+cjHiczHfpjlRLTLpeREaMwWa4LogTr+En4OLW
         4lckdtHBb65qPLh07dAH0k+d0c00OU77RiXJLGB94Zaj+hRVdVkRIJfPDOU4cNh4+f2q
         xXLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=hq8v5ZGXlavP47quo7Tm3BAJFUUhNjayCGTcbMqfmIU=;
        fh=x9w5/wVg2uCGqZYeLmIPRLKNmS5JpCf4EMtZM7LXQ18=;
        b=kPxHZF43SjEQcU1wTyoyiXVW+DagKkc/FFiIUmek8MhRO2D4DCSD2+Yzg+CMgTe7EJ
         JnN21UBln2NHwY7LhoLWRuGyE9GEOOOCZ88ItZOovr2MAof8SMMcN5DIRN6hFGFTfA+f
         Cx9+RpQPAuIX7wqvblrE5Nji2ZtlQaychYS0M5aWP0hxuJXbOpwTkIcovLvsk+cSIOID
         QC5kcoLpztZW/Rki+CWNxKkpzyO7n3WoAx0a0I4jWKgeuNXNfb0Unb87fKtYds8rZDDr
         AQV4NHXCox0S6JljIzWA+YyDXYZfo9CZzwsOTgWQBT8vTJmRR6aeDoLT/1SwdRFXX92s
         KQig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HZO73hEJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4717feb7a38si62884461cf.272.2025.02.11.02.07.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2025 02:07:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HZO73hEJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thnA5-00087X-Cv; Tue, 11 Feb 2025 05:06:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1thnA3-00086t-KF
 for qemu-arm@nongnu.org; Tue, 11 Feb 2025 05:06:35 -0500
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1thnA0-00015Y-DN
 for qemu-arm@nongnu.org; Tue, 11 Feb 2025 05:06:34 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-e53a91756e5so4531497276.1
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2025 02:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739268391; x=1739873191; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hq8v5ZGXlavP47quo7Tm3BAJFUUhNjayCGTcbMqfmIU=;
 b=HZO73hEJLvLgXrIOpsiX2jhL75TaApmF3S0i6xX9YTozgRVFijFSnUcFwXIrf8sDoC
 WoyOqWe3GUkPcyxpZZulRCfc9iTSulbxifj4CwWMDMqB8+hvatirdZdO/AvElL8h6zBB
 LixNit38kiwVShm59fxabAjJ8hizigV09j5qR/fFBiBaA4DhczgbjffXdjEW9tJJe3oH
 zK3/W4aFp4GPZ4eLseUAUhPPJ4eygvBQyXe06LrmYx7XlleAC06/2pQXqPOs+HKhqavJ
 syZ9bT5X8zq5xjAz+4+YUnP4c5Meq0TD6hWVcMPbZDM4EBaGJdmtQiZ+r/jiYjNBnD36
 9AqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739268391; x=1739873191;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hq8v5ZGXlavP47quo7Tm3BAJFUUhNjayCGTcbMqfmIU=;
 b=bDGThJgD1feLd6YF4NrMh4e3UNvCC/0aknMbK5GbTSZ2X/Hz9eIcGgILsBqK7AdPfn
 7C98G/x2h/1q3jFMRLrAiQM8FmGJcPpReBwcDSMphODorgikgmazJ41ZqK749FUnSOFB
 76U/F8Qc4OPZYQR6KXEh82JB9edOUaPozVoFQiY4bzb83uxyPjH7KndqCbjISs3tc7LB
 H9tvd80fLQ7cTv799uu5mSuezXYb3ev2gQdWHdImijZYE4hetUTRqOKHbxVgZq2hl5qs
 pcv8KBri8np5sTQp6l5ul+izETOeY/Yx02IISi3jm00kO+cLLmGnf9PHtw9Sn75Bm5S1
 mRSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpch0gWmWR0Hy8kDYM1lZIhSyOMlUUEBk4c0XXern3IuerctOmZBRwY5ioQ8ya3L7u5lm35LT45Q==@nongnu.org
X-Gm-Message-State: AOJu0Ywsk06HEAWst5+TiaGJZ+fo/Dc+mlBSgEZYB5aF/2RbQjfyRa0C
 YwdNdV0AsPbefGsDLuy8jlSKRmFV/ZPwpcRGBTFlH5VV5GTfxunzSqBqvqS09X9BooIj1kaZBWT
 pdpe0pZ6/Y+0Z7BUNSSJ2wypICTNMEOV7h2vmfw==
X-Gm-Gg: ASbGncsaboHd6iiVAVHsSLItWUFXdB4XZ45hPa0Z4iTEBL1FDiI/+i9xNLTdsBW/prs
 UoSbRrVECCs3P8hF6x6BOGtAt/SC89jMrpzcofJqDNehrNQaQ1Pt99oBfyjpWOeK2sfYCYyXNwQ
 ==
X-Received: by 2002:a05:6902:1707:b0:e48:7efe:57b0 with SMTP id
 3f1490d57ef6-e5d93d30f5amr3442059276.47.1739268390991; Tue, 11 Feb 2025
 02:06:30 -0800 (PST)
MIME-Version: 1.0
References: <20250204092112.26957-1-shentey@gmail.com>
 <20250204092112.26957-5-shentey@gmail.com>
 <CAFEAcA8qgEDAnfaQDmpUjy77KZBiqwdKSmyLE-ZwEAhMNLWn4Q@mail.gmail.com>
 <831901E4-69B2-4637-8507-77C7BF4DA65D@gmail.com>
In-Reply-To: <831901E4-69B2-4637-8507-77C7BF4DA65D@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Feb 2025 10:06:19 +0000
X-Gm-Features: AWEUYZmp2ji1x3nx79awKG0q_5GASRsKO17xpfZ_ECorEOO3NwWNaQXHNkmRl3w
Message-ID: <CAFEAcA-7REe0uQsuptAxxSsd36c5MgPVzufqVcstJVqZmfAKDw@mail.gmail.com>
Subject: Re: [PATCH v2 04/18] hw/arm: Add i.MX 8M Plus EVK board
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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
X-TUID: K7Chqzv1v4XS

On Mon, 10 Feb 2025 at 22:44, Bernhard Beschow <shentey@gmail.com> wrote:
>
>
>
> Am 10. Februar 2025 17:30:01 UTC schrieb Peter Maydell <peter.maydell@lin=
aro.org>:
> >On Tue, 4 Feb 2025 at 09:21, Bernhard Beschow <shentey@gmail.com> wrote:
> >>
> >> As a first step, implement the bare minimum: CPUs, RAM, interrupt cont=
roller,
> >> serial. All other devices of the A53 memory map are represented as
> >> TYPE_UNIMPLEMENTED_DEVICE, i.e. the whole memory map is provided. This=
 allows
> >> for running Linux without it crashing due to invalid memory accesses.
> >>
> >> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> >> ---
> >
> >
> >
> >> --- /dev/null
> >> +++ b/docs/system/arm/imx8mp-evk.rst
> >> @@ -0,0 +1,56 @@
> >> +NXP i.MX 8M Plus Evaluation Kit (``imx8mp-evk``)
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +The QEMU i.MX 8M Plus EVK board emulation is intended to emulate a pl=
ain i.MX 8M
> >> +Plus system on chip (SoC). All peripherals the real board has such as=
 flash and
> >> +I2C devices are intended to be added via configuration, e.g. command =
line.
> >
> >Why do this? If they're on the real hardware board, we should
> >be creating them by default in the machine model in QEMU.
> >Command line options are for devices that are optional and
> >pluggable by the user on the hardware.
>
> My goal is to be able to model a custom, proprietary machine which runs i=
n a CI. In order to avoid peripherals getting in the way, the idea is to ha=
ve a machine which essentially exposes the plain SoC, and allow users to "d=
ecorate" it themselves. Is an EVK machine the wrong approach for this? Are =
there any other ways to achieve this, e.g. with -nodefaults?

That's not really a usage model QEMU currently supports. We generally
speaking model what the actual hardware does. In the same way,
if you were running CI on the real EVK board your CI would have
to deal with those devices being present.

> >> +        /*
> >> +         * Magic value from Linux output: "arch_timer: cp15 timer(s) =
running at
> >> +         * 8.00MHz (phys)".
> >> +         */
> >> +        object_property_set_int(OBJECT(&s->cpu[i]), "cntfrq", 8000000=
,
> >> +                                &error_abort);
> >
> >This is the CNTFRQ value in Hz. The datasheet actually tells you
> >this, so we don't need to call it a magic number (section 4.11.4.1.6.4
> >of the i.MX 8M Plus Applications Processor Reference Manual says the
> >base frequency of the system counter is 8MHz).
>
> Ah, so then it's the "nxp,sysctr-timer"-compatible counter in
> the device tree? I've stared my own implementation but didn't
> see the relation to the cp15 timer. Thanks for clarifying this.

Yeah; I haven't actually checked carefully whether there
are NXP specifics here, as that device-tree compat string
suggests. But it's almost certainly the same general principle:
there's a memory-mapped system counter which is the global
source of the system count, and each CPU consumes that count
and uses it to feed its generic timers and counters. So if
you mess with the enable on the memory mapped system counter
then this causes the CPU's timers/counters to stop ticking.

I modelled this similarly to the in-tree M-profile
sse-counter and sse-timer, where you link the timer to
the counter and there's an API that lets the timer know
when the counter is enabled/disabled, changes frequency, etc.
This needs changes to the timer and counter code in the CPU
itself. (You can get away without doing this if you assume
that the guest code never tries to actually disable the system
counter or pick a non-default frequency, which is typically true:
it will just want to set it up to a single standard config and
then leave it alone.)

> >(Incidentally the memory mapped system counter is a stock Arm
> >IP block and I have about 60% of a model of it, I just haven't
> >needed to upstream it yet because in practice no guest software
> >really tries to mess with it. If we turn out to need it for
> >this SoC that would be a reason for me to clean it up and
> >send it out. But I suspect we don't need it in practice.)
>
> The ugly workaround for the cpu-idle-states above is actually related to =
this counter, IIUC. I suppose that QEMU doesn't support these idle states, =
it only seems to support WFI. But if it did, then this counter would wake u=
p the CPUs (if I'm not mistaken, I'm no expert here). It would be nice to b=
e able to boot the machine via U-Boot, and I wonder if that could fix the i=
dle states when there are PSCI handlers in the secure world. Again, this pr=
obably also requires the counter implementation. Looking into U-Boot, TF-A,=
 and OP-TEE is on my plan, but right now I'm focusing on direct kernel boot=
.

Hmm, if the system counter can generate interrupts then
it might be different from the Arm IP block in that
respect. I'd have to check the datasheet. Anyway, as
you suggest this is all something we can postpone until
we need to care about running EL3 firmware in the guest.

thanks
-- PMM
