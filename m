Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA6BC624D6
	for <qemu-arm@archiver.kernel.org>; Sat,  5 Sep 2026 03:40:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x2hG1-0005Ly-6t; Fri, 04 Sep 2026 23:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1x2hFy-0005LA-Vy
 for qemu-arm@nongnu.org; Fri, 04 Sep 2026 23:39:55 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1x2hFx-0002iW-D9
 for qemu-arm@nongnu.org; Fri, 04 Sep 2026 23:39:54 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-66825847b2cso2487806d50.3
 for <qemu-arm@nongnu.org>; Fri, 04 Sep 2026 20:39:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788579592; cv=none;
 d=google.com; s=arc-20260327;
 b=ZNI8jK/MW50/NpkIC4f5LGgrxRoaaOzqXC9/wTYI8oe/JIl2f1hurHmg9YRMQFjEah
 G3Ia5NFTtnSuGJqUyJICnrJjq9qDJPi6i6SCNf39KrkRSE1bOTQyJopTQa185OIZh7lh
 sGFh9yCEFE1a6V5o7vIc58UK2kvttEO+aMtdsBPZxmKdsa42dbS7pcFMTRSr8aN9W2EO
 kkYxiIv4fchWUBl+iq+TXi8pxMt3uclDoAcrFYYSdlYgn19HS5SKGrPPClafBIWrYAmc
 p5k9ov7FUCJHbv0r3pX1MLKRTNpQ2lkOGN+Ml99fL4uDjkot2QJBQwahMbfrNu5jxfH9
 CICQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=rzbwC/ilmvK8jnnL7I9sI0lsBoFFsh2E9mngGh+h4bw=;
 fh=QcQJPsE3WoQFzXKxw0jJgRAOO4Hsl3O2BH0PowFaxaI=;
 b=o210PJEAegaUi+T1+KR/GNWb96L794kAVlzUyvHJ1wjpCcT1WX+EH32fEeDcxAnTeo
 2uIGT9h7mWEHysSS6Bhu0IEmTWlJ/kvAGxuprX0KiVUWcOQS9z7nX5oL/nJVTizTM8qy
 8x88BMI+OkqE548Sqf51E3xWhEa0Ijz+04p0MVPg40F2/v5zxOZgyB9y2Hc7bg2a3WZ5
 FvqzYMFSz3c2HszAjj47AcslNhZGmDWM0sJWDqwQ7bxiiTDe2LD8xYhaBxyz/Jms4v+B
 hnNm5BhQ/Me8SNOaLWOvYYzJSEFTMfeJrfW5VuVSOHX+B2rWFnjdPKiqKa+evb8XBaWK
 lEsA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788579592; x=1789184392; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=rzbwC/ilmvK8jnnL7I9sI0lsBoFFsh2E9mngGh+h4bw=;
 b=oxx8dGPQC0dw7MuMU/DFbNDG1ResInLp/EVISYxNowoPcfX2p1eF/BCVLtN4mldxFc
 YDQmOrL2WDgW4w3qC4r++D/BoG5gyV9z5bYI1B9CM64ogm9Tfb3UWRDxFN2OU6ojV+6P
 3hDwjWkTH73XG17GKRDFaXovMy88JwBtGNnfOxXrIYIk484HCvg8oZs4iEkc5mLv+EgR
 2gDDRyh+5Mlj4UREcpOuksC4BpnWyO6l2ZUUT8RFyXXdtDeZjxPT/TLTctaVReY9Z6W+
 KCWT8SebdxICuK8tVjfABfgd2lexCGKz01zQw2GSVT8uewmOhLWesxqSkqh2OvQqCjvq
 AQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788579592; x=1789184392;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=rzbwC/ilmvK8jnnL7I9sI0lsBoFFsh2E9mngGh+h4bw=;
 b=RfbSRnbGyd4535qOh99KheNku/HFZvYSPXq2e86QTVM5sDibTTkdhDmfk9CLSLxblQ
 AgprUr8eXzk0D6ADFUfUZsuZG0O1qc9IAdpX5xx5NtxgsaT7+l30zIEsOH1T/fX8L6aR
 CkJBtVCx7qWkhYKSABtevezjmy2qxIejDML0+favoJSe1WZfKLO1KXphf/CsnCu/k4QZ
 J5Mx6MpQ+F4plnorxpFCvgdaClD0GBMV3tJDALCfBRS9CW4dsh8mKanL0eQzYpKjeR7J
 IvNkXIrCVksY3AjNAATNGj01sOdBWBj4bY5FeIWz+O2hXoWkngY0mJ6uFbyAiWefZjdE
 ZCZA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwzFZ1vQUU38w3avy1DVTk7l2XlKaXbrLPQuB7m7c1fqDil4gJNnR0UDTTzaGLwwACEVe/mUXsPyw==@nongnu.org
X-Gm-Message-State: AFuF++lh+lZp6GO3FqmxKO4Ub2dWP0v9JAARReK1P8M0LvNJh/TDurt0
 U6rbJO4R1XjYr6QmOb4wVjxeAOXlZ9SvhMSBbMEfrCB8Xm1h/sE7SkLN0kbfPxIt+vvfVlVwDo9
 03mLXoF/NTlqJNlT15LSw8akDbAYbjbo=
X-Gm-Gg: AYBFou1wgnFKo4bwqZkTKnEzNUr3UBsnapHd+vBGHfpjd06jlcLHVjlEwE/wJXsxMFB
 F72mkRTMu7rtKyzInLon7R0j6ZWI04EEHpVQiMpA4G5orER0l4Tk+tCP8Ln66XHbElqLrJwE3+Z
 G/0+rvlc0kb2fmUe8NK8nOEXRb/r1x8TnACeUbVcwMeXx7dK6FpUtlCdTQXd3wbB0TKMiQAtsg8
 fpeR9ndofYEXbBZaDnftE4fI6Pegv01gexTBvmP9d4H6CC6Y4Ydn5yKWrCOxbpHP1ScJFoVoxIN
 9f9cfxZYjtlIoI7+0cbwG4fvzZkLlQ6l+WBp16LmmRSZ
X-Received: by 2002:a05:690c:a785:b0:855:f387:98c0 with SMTP id
 00721157ae682-87127d27776mr43840637b3.29.1788579591883; Fri, 04 Sep 2026
 20:39:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260903112532.3276678-1-bin.meng@processmission.com>
 <20260903112532.3276678-2-bin.meng@processmission.com>
 <87se3qpf4x.fsf@draig.linaro.org>
In-Reply-To: <87se3qpf4x.fsf@draig.linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 5 Sep 2026 11:39:40 +0800
X-Gm-Features: AcwNN1WTEVDvs7JUX3hpWoNfiCqb5XmV5RroKj4RSGCZC9Le6xo1Dixu7v5-QZo
Message-ID: <CAEUhbmVU6Ccwaqr8xW78+VCc1BHWcjMvpejgbNe8GxWg1fKQnQ@mail.gmail.com>
Subject: Re: [PATCH 01/33] target/arm: Add Phytium FTC310 and FTC664 CPU models
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx1-xb12b.google.com
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

Hi Alex,

On Thu, Sep 3, 2026 at 10:48=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> Bin Meng <bin.meng@processmission.com> writes:
>
> > The Phytium E2000Q combines two FTC310 cores and two FTC664 cores.
> > Its EL3 firmware accesses implementation-defined system registers
> > while setting up the cores. Using generic Cortex-A72 CPUs leaves
> > these registers undefined and traps firmware before it can reach
> > U-Boot.
> >
> > Add FTC310 and FTC664 CPU types using Cortex-A72 as their common
> > execution base. Provide conservative RAZ/WI and NOP stubs for the
> > firmware-visible E2000 controls that have no modeled behavior.
> >
> > Set each CPU DT compatible string, MIDR, instruction feature fields,
> > AArch32 floating-point feature fields, and CTR_EL0.L1Ip field to
> > values observed on an E2000Q board. The FTC310 reports a VIPT
> > instruction cache, while the FTC664 reports a PIPT instruction cache.
> >
> > Signed-off-by: Bin Meng <bin.meng@processmission.com>
> > ---
> >
> >  target/arm/tcg/cpu64.c | 81
> >  ++++++++++++++++++++++++++++++++++++++++++
>
> I wonder if cpu64 is the best place to model this? The alternative is to
> treat it like other SoCs (e.g. the Pi's BCM SoCs). Was the reason it
> ended up here because you needed access to aarch64_a72_initfn? Could you
> not instantiate:
>
>     soc_base->cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a72");
>
> and then at realize:
>
>     object_initialize_child(OBJECT(dev), "cpu[*]", &s->cpu[n].core,
>                                 soc_base->cpu_type);
>
> or does that not allow for tweaking the CP regs?
>

I followed your advice and that worked like a charm. Will move the
Phytium-specific CPU type in the SoC/machine codes in v2.

>
> >  1 file changed, 81 insertions(+)
> >
> > diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
> > index affd87a3ae..0fd2f79bbc 100644
> > --- a/target/arm/tcg/cpu64.c
> > +++ b/target/arm/tcg/cpu64.c
> > @@ -336,6 +336,85 @@ static void aarch64_a72_initfn(Object *obj)
> >      define_cortex_a72_a57_a53_cp_reginfo(cpu);
> >  }
> >

Regards,
Bin

