Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp387824ejh;
        Thu, 1 Sep 2022 07:59:56 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6HZWDPiFJMpBh2eufRGAfIzBe66611jd+ChcxmAcHtXdmKCg/63N3PcwqpIeKqQDJ2+RYr
X-Received: by 2002:a05:6214:2387:b0:497:15b3:f792 with SMTP id fw7-20020a056214238700b0049715b3f792mr24742596qvb.118.1662044396250;
        Thu, 01 Sep 2022 07:59:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662044396; cv=none;
        d=google.com; s=arc-20160816;
        b=C9aT2TfgYt5Z6WplmB+BX8cnCmI823osZueJoBipJwP9tUHQk1MmNNIGLO9gMvNZqd
         jh6IU56H+QrRNJMla8igk9vsxgKBT0JjKe7c282IN2u7phnq8fDyNjUw1kw0DNDR3dx1
         +1JksLjG3Vyp307Si7HO2GQpa8j9SlF/IESju6AtnAQrSnpm0/0mdxXaF0ziSxlCjGfN
         o/XHaQYHCJJ/Sw/FLjvHIAYJu9b9oJ58jd+qVKFMK0rgA5zd0hwIPH4PeT/ORxJoA1Y9
         wf4AT5VGpNzYOxHl8AAeuUEbz2ePCpeVNpPu6updninM8PLcoQ/9e8FYqDL7KqFJqAlD
         LhHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=WcTfIetTWIH8/Xw6ht70upU4HiRwSx2okBH+dVxF4LM=;
        b=ZnOuPL9+d7FYdmTdXkogesHTMLfHGlr/hPU1bAwNYOh2JnHCAbwgR1AbaE3ace+SXK
         ERqw3c+TB7VeepaY9uAmmS/pSKhmncxdtxUGkWtOa9BGFXCgXcdHEcC9qvOZlordJhA1
         +cUVaQUAM7iMMDvobbebLTt6bvqOtBmXknJYecNB/2NciWY0u02BCaWy9ReS1YN4FKEm
         0qeadDXai/zWQ23rhvPRy52rwFjVgISwibBrPohyj4Jygd10v5HeZWcIXz8G5oLg9Ok4
         F25vDKEcL+n9xCpr6YdyqHgHeEM1HJi6znefqFXDO4OaNw5U0rWjfahnG9IFibhCf/ur
         eHyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ct/NMhZd";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gm10-20020a056214268a00b0049924b8cf9bsi2278641qvb.472.2022.09.01.07.59.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Sep 2022 07:59:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ct/NMhZd";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oTlff-00031I-R1
	for alex.bennee@linaro.org; Thu, 01 Sep 2022 10:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oTleB-0001Og-Px
 for qemu-arm@nongnu.org; Thu, 01 Sep 2022 10:58:24 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oTle8-0002xV-H6
 for qemu-arm@nongnu.org; Thu, 01 Sep 2022 10:58:22 -0400
Received: by mail-wr1-x432.google.com with SMTP id b16so15105017wru.7
 for <qemu-arm@nongnu.org>; Thu, 01 Sep 2022 07:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=WcTfIetTWIH8/Xw6ht70upU4HiRwSx2okBH+dVxF4LM=;
 b=Ct/NMhZd3xbQiEr9wLfQpsDU++UlY8kZMvDY4g4uaI58rkhn0Ykvm9JSqmTM0BEryX
 RI7ghe6V8aAteoyXBUNsl5o+7+/IZx2UX+ED4Jr8MxQ909BQnk+imEVAtR8nO0VKMYFp
 6vSDSh7hnCJYyNZbJP1CSH265d4WfOpFlaG6EYV4w1LiRbAEvRRZIal+GZrw8AgEI9ny
 o1VsqikNKbWkQI/2uL5Xb+5JhMakExzBX6wVDtzcyvziOYZthaU5COAgWubMoDPfeXes
 gK5pPQA28EUNYo+rANjqYNMT3s+aGUgnKTGxeZoFU93t0DJJ/2gq1rRRVWePc6iuhY6G
 /n0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=WcTfIetTWIH8/Xw6ht70upU4HiRwSx2okBH+dVxF4LM=;
 b=d/M4sjuvUngCYiLUbAlrCRALFx5WDBsS4Z0x85tM0TTtqjvBszadulOW75MGQIVTJK
 FisSIqKYzIVygYx04reF79vS6dS2JFmB91Nifps2pJ2SJfx73/6iK6XXyb3ePOOTDsV7
 2vrrq35REnFbXW1+fpeSxPw6kjg3DPNb5WvqmIn9x3qUpCpD8PA/Inl4fKxE/3n9dyqD
 Ezph/5BnXtajjzTI3Xbd+us4wotykfjDMv7Hox28hhcVXoznb9wEGZ42bjbypTjx0vOb
 jDhsMWPhMQwRZiFIzSLrsSUiGt4EdiSCdZ1fKmI4Eem5Iu/PHWRDHQBhnpHiNHuFHNdB
 eo3A==
X-Gm-Message-State: ACgBeo3rz8X8Ehs2D6zOhxtePUDkqqxj1tvkZ9FKOh3fbWzaCdwIBpJR
 epsa0IpEPqF/T6tOU1MNgAOO+A==
X-Received: by 2002:adf:eb52:0:b0:223:9164:b5b4 with SMTP id
 u18-20020adfeb52000000b002239164b5b4mr15024490wrn.518.1662044299089; 
 Thu, 01 Sep 2022 07:58:19 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168]) by smtp.gmail.com with ESMTPSA id
 i7-20020a5d4387000000b002258619d342sm15330711wrq.2.2022.09.01.07.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 07:58:18 -0700 (PDT)
Date: Thu, 1 Sep 2022 15:58:16 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 eauger@redhat.com
Subject: Re: [PATCH 05/10] hw/arm/virt: Fix devicetree warning about the
 timer node
Message-ID: <YxDIiA2UD3aP33M5@myrica>
References: <20220824155113.286730-1-jean-philippe@linaro.org>
 <20220824155113.286730-6-jean-philippe@linaro.org>
 <CAFEAcA8jCLX8kyZHV4JW+QmKUeH2hL3Rq+q4gsvM1LXioBozYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8jCLX8kyZHV4JW+QmKUeH2hL3Rq+q4gsvM1LXioBozYw@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rHFA3RknwLSS

On Wed, Aug 24, 2022 at 08:40:21PM +0100, Peter Maydell wrote:
> On Wed, 24 Aug 2022 at 16:51, Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
> >
> > The compatible property of the Arm timer should contain either
> > "arm,armv7-timer" or "arm,armv8-timer", not both.
> >
> >   timer: compatible: 'oneOf' conditional failed, one must be fixed:
> >         ['arm,armv8-timer', 'arm,armv7-timer'] is too long
> >   From schema: linux/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml
> >
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> >  hw/arm/virt.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index ca5d213895..5935f32a44 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -344,7 +344,7 @@ static void fdt_add_timer_nodes(const VirtMachineState *vms)
> >
> >      armcpu = ARM_CPU(qemu_get_cpu(0));
> >      if (arm_feature(&armcpu->env, ARM_FEATURE_V8)) {
> > -        const char compat[] = "arm,armv8-timer\0arm,armv7-timer";
> > +        const char compat[] = "arm,armv8-timer";
> >          qemu_fdt_setprop(ms->fdt, "/timer", "compatible",
> >                           compat, sizeof(compat));
> >      } else {
> 
> Are we really sure there are no existing guests out there that are
> looking for this device under "armv7-timer" ?

It's highly unlikely. It would take for example a 32-bit Linux from before
2013 or a 32-bit FreeBSD from before 2015, running on a machine with
ARM_FEATURE_V8. But I can't say for sure that no one is running such a
config, so I'll ask about relaxing the binding.

> 
> This used to be valid DT before Linux kernel commit 4d2bb3e65035954,
> which changed from "should at least contain one of" to requiring
> exactly one-of, and that was only in 2018.

Yes the text bindings weren't always exact.

Thanks,
Jean
