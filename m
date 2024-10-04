Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp580637njb;
        Fri, 4 Oct 2024 10:02:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWUt3e+nxATHC9+8p1c+2R3UDbnvcjh5CfWuRyHvHio5qAaDDYpxfeqvn21v2zrNYpxVtHTw1LcYVaxCQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFfyyQVadXK1v7FnFv4XtFxcY/x8XmcvQC8wUszvObZd3d6Vhrpo8QIOUwqS83yZjUzgwSU
X-Received: by 2002:a05:6358:5e04:b0:1b8:3b4f:d8fc with SMTP id e5c5f4694b2df-1c2b83a12c3mr82567455d.21.1728061344931;
        Fri, 04 Oct 2024 10:02:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728061344; cv=none;
        d=google.com; s=arc-20240605;
        b=I29TBk1UzZ9+4JmJe2iUOHU6v+jh8PWQV3YdLjXdoKdxqvwTVYJ1qY7ntYjAweNeaW
         58Tw4JG/98WoLj39YZKrtnFu3PhXZFK4/laDGlno8UCJiAYio8DRiJK88RNjRO1Zn/Ek
         4C/bzeDlIk1hLBFNBzY2k4zm8p5HX6m332wZvWjq+d5+y3gWsoLP5ECko9h6mRj2pp4v
         VE/6DIPgST5IwBBFApUlD9YwD2S7HCOPn5PFH0Iy9Ua8ztafHB//ACD9Npxyz/yHWWsx
         Uss2JBca9fdvPAFUPaeT3vvYylSLPlECikWnKAeHD5vePdbrFb4KBRNy+E7Qay/NSvUA
         MFOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=S149EoV0HT286379WFnXfKxIHdjLesfEWLZqIFvC3Mc=;
        fh=vnn3mtgbnCOx5QQSuHQtWOZy2epGie35Ngi+y0Yzsyo=;
        b=ThnjIynq8b/obSmSNsnJGVGDgVFWHRLnfBu4MGjGHBRYPcu7AtRGPOVUFvBlEA1nKI
         zVMjvFu6nHRYm2AhtU2xVGVE2sqboqHsRPyihUhsi310HdrLxsu2r1kIJ/u2aOTqXuZ+
         P7RK9PeLZbBrApsJHDM0NCxGOZNDNCWaScKGzCq28i18gnWJDpULFFPCNDGf4Lv8HFCv
         l2HG//Vk5tGya6K7bpn0q7wnRHIqG/6xJRtlMsDRZu8A+CdSXqiiqS8jxdwZkHlWtqBZ
         XL70bQLaLdtSHtGhd/9/fxPUzjqodNWhxYcmEVaYx/RHWlJOdypV0I+p/kc7P7WoAIFI
         OACg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D9D5JyiU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cba47a3dcbsi1896396d6.557.2024.10.04.10.02.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2024 10:02:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D9D5JyiU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1swlgn-00066Y-CC; Fri, 04 Oct 2024 13:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1swlgl-00064g-Nm
 for qemu-arm@nongnu.org; Fri, 04 Oct 2024 13:01:59 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1swlgj-00010K-Jz
 for qemu-arm@nongnu.org; Fri, 04 Oct 2024 13:01:59 -0400
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5389e24a4d1so2906958e87.3
 for <qemu-arm@nongnu.org>; Fri, 04 Oct 2024 10:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728061316; x=1728666116; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S149EoV0HT286379WFnXfKxIHdjLesfEWLZqIFvC3Mc=;
 b=D9D5JyiUzqQ/0jJZsrFdyhyBTsh030mMG58Qso4RuWSA8d0CQgxLCjQdpi9GCYgo0Y
 3Dujcaqks4Hv7IRYJkP3D5fukpqHl9Mp1mwVCm4iSI0b9mBx5RtzsHBvFudLJdlSuBaD
 wgrmXFN8UuqYh6Rxf3rCScsi+pFZCWbYrvagQd+/2STTcWCFEh/DGjdnS9Kbxw+IKkkO
 W11s2RGjE96cXnUD6B78dDEbhmH4WQPtHUVhkec/I31V9QCxw0uh+UQDRr2co5eUcFLW
 8YLdiUq9DX1aWton4aU588a13dX5Eq8razmYdY4WjKW4UQVNwgn+7OLlaoEh0xBGnCH9
 ugKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728061316; x=1728666116;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S149EoV0HT286379WFnXfKxIHdjLesfEWLZqIFvC3Mc=;
 b=KQeWGlmGYG5Ph1LIrgf6bSCqfg4utaWDAGduYhKpnUIDXsTrkSwSj3rPt6u2yEvnLl
 pnJoslgAfBRvD0rwuiIg0Cg6lYvo35C6ELJ1tPFFCC0pEcKuQHD8Dsn9erDuw2gh24E3
 roIeU3c691+vMvEUYANJuNwq5Jz027ejZHh3nQ9C/fB/IIIYmhShYcnSAVO7BI5KMnij
 U35nCHU7uef+lrvsSiyK7aPi+C3RVjWBRg0hAA18MzcUqzqXsNXLb/NsqulGaYB+Ydav
 XA7jOOiI9lTJ8YCStNL/BoDiudmZ4t8AiUH9fbCJ8vcypdAR/4wv53zz7EmP4sd/5vBD
 l60A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnz0Q72j2fpKl0RFvGtk3WsFuD95mmt503AHctA8yT+edDbZo8/tt1UyK1kCu4hN8PDNzCRYbWXQ==@nongnu.org
X-Gm-Message-State: AOJu0YzpzCVA3oFMsUTtqRkZ0Wne8+VXmS2sKbjRy7tGwzwyrD8ociCA
 513lauGQE00tQrc2RiIWwnBzFC8kY4aX4iA/h1zM8Rq0Pnn1WQ97YKmiLuFoihjiNYy0l0yHFJR
 N+0sjrew1YcnIX1z5PW/8LDRVrsvLwmANVo2Nig==
X-Received: by 2002:a05:6512:104d:b0:539:95f0:a05d with SMTP id
 2adb3069b0e04-539ab9c7251mr1887804e87.58.1728061315503; Fri, 04 Oct 2024
 10:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20241004162118.84570-1-philmd@linaro.org>
 <20241004162118.84570-3-philmd@linaro.org>
 <CAFEAcA_X38bhELuwwKLPrbfC+vLnwpUHP5RNCDv1V2r69dbJ7w@mail.gmail.com>
 <bf1c2206-ef63-4dd3-8a15-0323dfa9509c@linaro.org>
In-Reply-To: <bf1c2206-ef63-4dd3-8a15-0323dfa9509c@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Oct 2024 18:01:44 +0100
Message-ID: <CAFEAcA-VjPKyn2wVSydYy=jVniX0H649yz8qu-Dr+L1jn2zd_A@mail.gmail.com>
Subject: Re: [PATCH 2/8] hw/core/cpu: Introduce CPUClass::is_big_endian()
 handler
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>, 
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org, 
 Zhao Liu <zhao1.liu@intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x130.google.com
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
X-TUID: 24CJ45p2ePq5

On Fri, 4 Oct 2024 at 17:54, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> On 4/10/24 18:41, Peter Maydell wrote:
> > On Fri, 4 Oct 2024 at 17:22, Philippe Mathieu-Daud=C3=A9 <philmd@linaro=
.org> wrote:
> >>
> >> Introduce the CPUClass::is_big_endian() handler and its
> >> common default.
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >> ---
> >>   include/hw/core/cpu.h | 3 ++-
> >>   hw/core/cpu-common.c  | 7 +++++++
> >>   2 files changed, 9 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> >> index 04e9ad49968..22ef7a44e86 100644
> >> --- a/include/hw/core/cpu.h
> >> +++ b/include/hw/core/cpu.h
> >> @@ -150,6 +150,7 @@ struct CPUClass {
> >>       ObjectClass *(*class_by_name)(const char *cpu_model);
> >>       void (*parse_features)(const char *typename, char *str, Error **=
errp);
> >>
> >> +    bool (*is_big_endian)(CPUState *cpu);
> >>       bool (*has_work)(CPUState *cpu);
> >>       int (*mmu_index)(CPUState *cpu, bool ifetch);
> >>       int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
> >
> > What does this actually mean, though? Arm for instance
> > has multiple different kinds of "big-endian" depending
> > on the CPU: both BE32 and BE8, and data-endianness not
> > necessarily being the same as instruction-endianness.
>
> This is to be used in the data bus (I was wondering whether using 'data'
> in the method name).

That sounds like what you actually want is (a non-compile-time
version of) TARGET_ENDIANNESS, which is not related to the
CPU's dynamic setting.

> > This series doesn't introduce any users of this new API.
> > It's hard to say without seeing what the intended use is,
> > but I would expect that probably they would want to be testing
> > something else, depending on what they're trying to do.
>
> I'm trying to split my branch in "~20 patches series";
> I should post example of API consumers in a few days.
>
> First conversion is the cpu_in/out() API in system/ioport.c,
> I'll try to post it ASAP so we can discuss there.

Yeah, I think we really need to look at the users, because
my current feeling is "we don't want this API at all,
the answer will always be to use something else".

I suspect for cpu_in/out the answer is "this API only
makes sense for x86, and whatever extent it's built
for anything else is accidental". We could probably
define it as always-little-endian.

-- PMM
