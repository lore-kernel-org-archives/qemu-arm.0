Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp362458lfa;
        Wed, 2 Jun 2021 07:41:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkkkFLDnhwkEYx/XuqPOEU0obdRuOJ+dKmc4psNsI1qbqrxEJL5SEv1vg5WMaAgdREepER
X-Received: by 2002:aa7:c349:: with SMTP id j9mr30995558edr.48.1622644892360;
        Wed, 02 Jun 2021 07:41:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622644892; cv=none;
        d=google.com; s=arc-20160816;
        b=S2yJfIHpLAK8ywTKhzf5Wx9q5rZpTvcCjyfeWjKiczj4Lxd1T4PTlydFDSfkt/yDTo
         1NP4LPDuczEW2KMgIfcsmUUGfzkxzFzrpiE64aAM49i9Dmq1H+oUyQu4CGG+h7OClI9o
         o8RGN2QlzUQACdkbcqr0xDPbzL3WvNm3OPLWdt0OrsiR3hYNcsttj6lTb7oRyoEnwgZU
         A6cGWAw/aRfk8JSfxtOvHZ0UuU+UPd7zSqMsBQn3KtA7tIR3HzAnBjOuQgWteJcWuxB2
         jwLK8E5YurhVKLlfT2RekJBw0xZgqitK5NOm6tHLZEGimnwl57QGYn80K8nD3OGTVL1c
         kWDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=YqH2KdoaeBJWCwspa8DoCuVgJCk1weHvaCiiDNrJKEI=;
        b=uN5TSYuo+XCIMwAZePk3SVnlqd3XtVuT7vFJJaJxsKLnGfAaENf1Qm34vEUCbxxQZy
         hiyTsHYGt27cnbq90yjr1iwCt0Fm8sESA2J3vpkzbL2aLaHR+fN15ZjC4v6Ut4ESdQh7
         jr9wN4hLADAUAWb7iQSqd+iw5wlpxc7hLIv5CtENdjmUwa1lE2J2nUrRBNOyz7y5Dpq4
         HVe481AKsa2ExyC1uEgXRjEcAVPDZYTHaI8iQwH1HoKa0aYbbCNlRa7pStBGbh7Jf8Ro
         nsqSfvjiYraSa7xtaAOqZ5/+7ytJZRe7YmuhyU+onbG1DyQL1/9Ro5vOmK+WA79/3TJX
         lrsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b="bf/qyPnd";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1si98528edy.301.2021.06.02.07.41.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jun 2021 07:41:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b="bf/qyPnd";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:33394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1loS3n-00055P-HF
	for alex.bennee@linaro.org; Wed, 02 Jun 2021 10:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1loS3e-00051z-H9
 for qemu-arm@nongnu.org; Wed, 02 Jun 2021 10:41:22 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:35728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1loS3c-00013A-FQ
 for qemu-arm@nongnu.org; Wed, 02 Jun 2021 10:41:22 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id q6so1416207qvb.2
 for <qemu-arm@nongnu.org>; Wed, 02 Jun 2021 07:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YqH2KdoaeBJWCwspa8DoCuVgJCk1weHvaCiiDNrJKEI=;
 b=bf/qyPndWAUfEZag0DjnZ2yE1EfGlaFMXN3OFMWDcp7oorkpirdPQovnbjJAFKVtV3
 FhG3ev9fSUV9zvAPOeIuaY0rkN5xg9zMl9MA9Nu6zRP6KJXCc+cpNKNkraL4uhUYUn5X
 vC1qtKd8mIRjM8oPhmoyp3hVT5FWU2rKtNxEawmYtFj4eFt49lIneoBeZ8MSQCxrbS0F
 jF9qhshs7DJhUw5FQLiv2RsKxUmc8evKxO7zRqJivwbJNL/pRobXsCBU0wyK63yw2MRb
 XAdX8O+s7oCpKzWaPvwPJH+gAnFKoks6GHgn3WLpE3qhtS2ro516UECXcTKEk9Olgce7
 U7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YqH2KdoaeBJWCwspa8DoCuVgJCk1weHvaCiiDNrJKEI=;
 b=boLdDsMiLQnfohZnjEtu4KN5ZedMToiiCMbCfkgU4i50QoSq9rRI1fDUsPg8uKqyxg
 VfvFr+WzBw+L64f+NeqlFCR8fkDyOgsN99eGZlpaOTBUaLoieQnb+cqCX3UQ4AQ9yw68
 8oZjiFfPhQNK9dpJtPYrNXLtk+WIap28Fu1167Z2TcJ3PHPd2E+H7ht4kKrEnBOQ3eLm
 d88KRcRTO0YtbjWFX3X3tt7JjH/ijP5O0te2UaeMO4iXUU0wT7pAdv1iCa+shoPLnQr5
 cl8NKch/KUojM+FBmJlNyPl1efW0q68etKR0Jd13SYqWCRsK6Hz9XeY4bPTsQ4ud8NDA
 IFwg==
X-Gm-Message-State: AOAM531jE7/T0RiX9aluclmuvXpOdsymsnTzVYW7dAQmuqrJETsxWTyo
 Fb8X5tiUmjusqxabri6lrKWpDp8HeMOU/TjEzrt1bw==
X-Received: by 2002:ad4:4c0c:: with SMTP id bz12mr17601216qvb.21.1622644878229; 
 Wed, 02 Jun 2021 07:41:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210518194704.764241-1-venture@google.com>
 <20210518194704.764241-2-venture@google.com>
 <CAFEAcA-WMC4OkzkyvH-wabcLsjThjZikLMxO5O9ALGknoY3=jg@mail.gmail.com>
In-Reply-To: <CAFEAcA-WMC4OkzkyvH-wabcLsjThjZikLMxO5O9ALGknoY3=jg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 2 Jun 2021 07:41:06 -0700
Message-ID: <CAO=notx0WjBda6WeZmzqQG24yHuu8kQq4EZZQn=9mg67OOdW6w@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/arm: add quanta-gbs-bmc machine
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Havard Skinnemoen <hskinnemoen@google.com>,
 CS20 KFTing <kfting@nuvoton.com>, 
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 Brandon Kim <brandonkim@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=venture@google.com; helo=mail-qv1-xf2a.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G6w7FoTlR2da

On Thu, May 27, 2021 at 2:34 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 18 May 2021 at 20:54, Patrick Venture <venture@google.com> wrote:
> >
> > Adds initial quanta-gbs-bmc machine support.
> >
> > Tested: Boots to userspace.
> > Signed-off-by: Patrick Venture <venture@google.com>
> > Reviewed-by: Brandon Kim <brandonkim@google.com>
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> > ---
> >  hw/arm/npcm7xx_boards.c | 33 +++++++++++++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >
> > diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
> > index d4553e3786..34a214fe79 100644
> > --- a/hw/arm/npcm7xx_boards.c
> > +++ b/hw/arm/npcm7xx_boards.c
> > @@ -29,6 +29,7 @@
> >
> >  #define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
> >  #define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
> > +#define QUANTA_GBS_POWER_ON_STRAPS 0x000017ff /* TODO: Get real values. */
>
> Any chance you could fix this TODO ? If it's not fixed now before
> the code goes in it seems unlikely that it'll ever be fixed -- you're
> probably in the best position to know the right value...

I have an internal bug to find the "right" value and populate it,
although it probably actually is that value.  Generally I agree with
your point, that it won't ever be fixed, just like most TODOs in open
source projects, however, my team is building a ton of systems with
Qemu presently and ramping up a significant time and resource
investment in this; so I happen to feel confident this will be
addressed in the future.  I actually already have several additional
patches for this and other systems that are waiting on various other
patches landing.

>
> >  static const char npcm7xx_default_bootrom[] = "npcm7xx_bootrom.bin";
> >
> > @@ -268,6 +269,22 @@ static void quanta_gsj_init(MachineState *machine)
> >      npcm7xx_load_kernel(machine, soc);
> >  }
> >
> > +static void quanta_gbs_init(MachineState *machine)
> > +{
> > +    NPCM7xxState *soc;
> > +
> > +    soc = npcm7xx_create_soc(machine, QUANTA_GBS_POWER_ON_STRAPS);
> > +    npcm7xx_connect_dram(soc, machine->ram);
> > +    qdev_realize(DEVICE(soc), NULL, &error_fatal);
> > +
> > +    npcm7xx_load_bootrom(machine, soc);
> > +
> > +    npcm7xx_connect_flash(&soc->fiu[0], 0, "mx66u51235f",
> > +                          drive_get(IF_MTD, 0, 0));
> > +
> > +    npcm7xx_load_kernel(machine, soc);
> > +}
> > +
> >  static void npcm7xx_set_soc_type(NPCM7xxMachineClass *nmc, const char *type)
> >  {
> >      NPCM7xxClass *sc = NPCM7XX_CLASS(object_class_by_name(type));
> > @@ -316,6 +333,18 @@ static void gsj_machine_class_init(ObjectClass *oc, void *data)
> >      mc->default_ram_size = 512 * MiB;
> >  };
> >
> > +static void gbs_bmc_machine_class_init(ObjectClass *oc, void *data)
> > +{
> > +    NPCM7xxMachineClass *nmc = NPCM7XX_MACHINE_CLASS(oc);
> > +    MachineClass *mc = MACHINE_CLASS(oc);
> > +
> > +    npcm7xx_set_soc_type(nmc, TYPE_NPCM730);
> > +
> > +    mc->desc = "Quanta GBS (Cortex A9)";
>
> "Cortex-A9", with a hyphen.

Ack, will send out this fix in the next patch series.

>
>
> thanks
> -- PMM
