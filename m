Received: by 2002:a05:7022:f201:b0:7e:eb73:5b3b with SMTP id rf1csp1828264dlb;
        Thu, 20 Jun 2024 11:58:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXFVPlFC+y09p34frppfWWjV9X2fj0qn690TXSw/ZuGKVGC8eUuDBWaDiCQ0y9ZQ7Y04bi6vOQsD2qodQ8kRQ+KWYs5gG3w
X-Google-Smtp-Source: AGHT+IFYHynMiGRebhybf+VXflWjQ/7YLHGgD7xvXYl2h4rF8mrUV3IUCI3/qwme03ML5Ry7BHNP
X-Received: by 2002:a05:622a:110e:b0:444:a0df:3115 with SMTP id d75a77b69052e-444a79dacc6mr64097431cf.31.1718909926674;
        Thu, 20 Jun 2024 11:58:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718909926; cv=none;
        d=google.com; s=arc-20160816;
        b=Nt7FtgoXDFAaEfKULkDMasTsHHtPJUs5566d4iBlLcWs7GcepHvQKD3mkGEx1OCodw
         vpn6VQAj/JlylXOev86m7IFb9Y/vcX94K17zXyCLexBRbzZnph6v9yrORKbcQx7K+QPi
         JvMG5INXUlJcgA0KW5G/MBCKR9Y0rxmGqhBsW5WjRY9XYxnictpoaQuOoKVGDm1G6iX4
         Qy8FJCLMZ1nr2Ka2wfed2UlJUpLUurRq1j2oSFxIfQVh7YwKP1QoRh2/V3cDrpIAXWWa
         fIFlUmcCteOgfQs5iEmFOdtl7/cOhpKqpmKoOqb1gPN4RCrOkBkgflnSfflI6IP9W/pj
         VWxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=V1liMJUZn1L5IgyAaz4tLbwmffK1RBrw2W/ddp8QCTw=;
        fh=k4KcRcVvacaJIAI1zqp5UuocM2z2TdVyT2SkujJRpDo=;
        b=pU9p+CW/1uB2HYhFvJvSDOx34bIvonmck4e5DeNiwYrvaARobGFvhUzgJwMiCbtHlF
         5vsTWN5RlnuQN4yBkN4VB8tolcFhqvcF1XnRCdNe9eMip42/ERRLn0VtNO462/G0nQ5L
         QMnARQ168oQoFP0PLBI+bNxSpY5ODS5hr4bNh7LpPZab4D05YoyowLjZoKr5Uf9yaYRr
         MdK9+rg4LaFQjauvh26EPyGXkmR6f6pNGK5pXQZ0HZJXCFEY20jkzb3TU8N2ACqIORaM
         r5g/ozCvxQfXFEpM2ILnmv6U6MnTBEM5G8aGbN6M1rB0aqQbwksHLqtRjQMpq61vdVEh
         GtNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hi03ym5M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44350a5f831si126084531cf.221.2024.06.20.11.58.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2024 11:58:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hi03ym5M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKMz7-0001jd-Eu; Thu, 20 Jun 2024 14:58:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sKMz5-0001il-N8
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 14:58:11 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sKMz3-0007lU-UD
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 14:58:11 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-57a30dbdb7fso1296116a12.3
 for <qemu-arm@nongnu.org>; Thu, 20 Jun 2024 11:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718909887; x=1719514687; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V1liMJUZn1L5IgyAaz4tLbwmffK1RBrw2W/ddp8QCTw=;
 b=Hi03ym5M/cEIf2sJQHGY/EdC+tI8x2Mar3eSAN7S4wHGYtG60xYllVgoz9GzU72DVO
 PX7/ehaIgJ4imrIrBmXBQzqmTCibuHsUQqW5BjPlLvtaiEtKupb3WN0qnvQWWRbslC0t
 sDizZ2wqVRXsyDfdv2A2I12MlioUro17q8KyWWqio6FmtWyFMYRm7u8X7acUOMx7ztx4
 t4KHOQSdEnBmuPUeCV1OvI0Lzrnu/XJC1JAZS/pdZH6zVpqJfjITi9k4RJtFTVop2EsI
 P6pehsn7skWMCAkYwz5mNZd9MYm3ikGFFwTd3ARKscfBQ9k3mxeERPT7gZceZrjwcfA4
 5++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718909887; x=1719514687;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V1liMJUZn1L5IgyAaz4tLbwmffK1RBrw2W/ddp8QCTw=;
 b=Y7QPEnZArZPyZrTRBemw4j7Rz9/3c6wzHuEm1T3JQAjOl4zVygNz1O6hMtaaTT1jN6
 8ulb/Vay5Q5q8jGF1tzreYpDIknjedcwA41lJ6vFjNsrJehMT8jkbdUTn90WnSZUN5rz
 2lcjtx3YBP3HVmulvN4DPAMgjIYmK0ilpOvUCWSDpAU0ZH5T/cZRxY2CuACXXpYO3VDT
 wKQellLLDugPiV654KUvj3HqkAkpZiFfJCnrOnYfoenhskHMAXEOFqcU5GQh7stP5G/R
 TqQr9vMkRwvqa4NTuYbnBZB4wKPZWiEriZhLzrOFJ6aL9fKCPXpvHUD2jtXTH8kMKdDP
 +VDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0iZRqFkuFcQrPNhbHPZ5YfTt9Gb4xjc3QCDIwLt+VQFgSXvlRjZdJlL1nNUhuK/N7CdB2ZtVyQgl/Uf4Sc2de4aEK
X-Gm-Message-State: AOJu0Yy2kII6/0K4m7uLwETA3HPOYrrn0s4CScML/weMoY9cWj1rqlVD
 HGmbML+o/zcxNq14rlMKVDM+FG2nyXcyABs3y0LiL15agN8kypjSlVd8SbInfgTAkXrOqP5+U1v
 4IqCsiCvrdumcsraQubI9lZwgSrFrNinNkMMsGA==
X-Received: by 2002:a50:ab5b:0:b0:57a:33a5:9b78 with SMTP id
 4fb4d7f45d1cf-57d07eabeb8mr3950396a12.34.1718909887441; Thu, 20 Jun 2024
 11:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240618144009.3137806-1-zheyuma97@gmail.com>
 <47a6e9d2-27f6-4e45-9de3-c4766bdf2566@linaro.org>
 <CAFEAcA82T-hS0Armp6PVBkrywfqv+-u+L4z8rtrjBpnwvE8Hxg@mail.gmail.com>
 <12471213-83da-4226-ba2a-2b8b6452d46b@linaro.org> <ZnQPjL4HjevwHh8R@toto>
In-Reply-To: <ZnQPjL4HjevwHh8R@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Jun 2024 19:57:56 +0100
Message-ID: <CAFEAcA9x0bfC=xtZdF-xEr94TT5gKx6ycY7_n3Q0LnXPaBidJw@mail.gmail.com>
Subject: Re: [PATCH] hw/timer/a9gtimer: Handle QTest mode in
 a9_gtimer_get_current_cpu
To: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Zheyu Ma <zheyuma97@gmail.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Xu <peterx@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: ASgG31pSTOta

On Thu, 20 Jun 2024 at 12:16, Edgar E. Iglesias <edgar.iglesias@amd.com> wr=
ote:
>
> On Thu, Jun 20, 2024 at 12:25:51PM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > On 20/6/24 12:10, Peter Maydell wrote:
> > > On Tue, 18 Jun 2024 at 15:51, Philippe Mathieu-Daud=C3=A9 <philmd@lin=
aro.org> wrote:
> > > >
> > > > On 18/6/24 16:40, Zheyu Ma wrote:
> > > > > This commit updates the a9_gtimer_get_current_cpu() function to h=
andle
> > > > > cases where QTest is enabled. When QTest is used, it returns 0 in=
stead
> > > > > of dereferencing the current_cpu, which can be NULL. This prevent=
s the
> > > > > program from crashing during QTest runs.
> > > > >
> > > > > Reproducer:
> > > > > cat << EOF | qemu-system-aarch64 -display \
> > > > > none -machine accel=3Dqtest, -m 512M -machine npcm750-evb -qtest =
stdio
> > > > > writel 0xf03fe20c 0x26d7468c
> > > > > EOF
> > > > >
> > > > > Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
> > > > > ---
> > > > >    hw/timer/a9gtimer.c | 5 +++++
> > > > >    1 file changed, 5 insertions(+)
> >
> >
> > > > >        if (current_cpu->cpu_index >=3D s->num_cpu) {
> > > >
> > > > That said, such accesses of @current_cpu from hw/ are dubious.
> > >
> > > True, but I'm not sure we ever settled on the right way to avoid
> > > them, did we?
> >
> > No we didn't, it is still in my TODO list; we might discuss it
> > when I post my RFC.
> >
>
> Yeah, this way of getting the core id is a problem when having multiple
> ARM CPU subsystems (and for heterogenous cores).
>
> IIRC, when I looked at what the GIC v2 HW does, the GIC exposes an AMBA
> port for each CPU. In my mental model that would translate to exposing
> multiple Memory Reginos (sysbus_init_mmio) and mapping the appropriate
> device MR to each CPU AddressSpace.

Yeah. The trouble is that doing this requires massively rearranging
how all the GICv2 board models connect up address spaces...

> We could also do it with memory attributes but I don't think the
> master Ids are standardised enough to extract a core-index from
> with out having SoC specific code,, at least not accross Xilinx devices.

...and yes, using the requester ID to specify the CPU in the
MemTxAttrs is the other proposal.

thanks
-- PMM
