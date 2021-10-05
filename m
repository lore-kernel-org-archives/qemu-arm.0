Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4684032lfp;
        Tue, 5 Oct 2021 01:56:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlQndwH5hId2y2hwEqEEj3p6RqVe65huYhWjpqeFtaUQjuncWh1tMwTsBIZVxzfsTHNa8J
X-Received: by 2002:a25:2209:: with SMTP id i9mr21273395ybi.52.1633424179552;
        Tue, 05 Oct 2021 01:56:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633424179; cv=none;
        d=google.com; s=arc-20160816;
        b=YoZXVn4Q2MIqjvRkOE685PBLCTIamEJPfGi9/CMw1n60BNpQ9+aXRpSaEdMP6x1EbF
         RCcM3R8URjoVo9d0BGkrR6oE0vX3cKTEeUQ9sYAaRFsL0N+KNySPU4SFaX8GkkYnKMqr
         5cPC+Ycogj46fUOa13gfB9/TISYozcjgKyWDuUuBpnpr9oBgo3ySGIx73OiItjXh3Ckv
         JLj5uy/4ExUnPD78ZrBVa+wrmOiX3pZ4YNaQZSSWm3CjSu3qe70q9xfBcYvaVvdRWmEn
         9OAxD979fgIyBTjhQIrKeSshTItEeoHkesvSIaenC0E1th4PmvBBYuEffURh2tj/zYnZ
         Dk8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=DXt2p+DKTZd4NFoi7cijIRHkQh+jDOXKlsa+HD0cOH4=;
        b=zIn+bQdPdWi2ByitNFwy6JDjFhbrf4m7r0B3aV202Tv6nsepUg5nItozjXqSeT8uN+
         8m6KYuUq4SepaHJhzbI50uIPFEi6DQuwGlqvaX5+jffL6G9hFOVbvqc6J9HKaHmFgF1s
         ysfw5b96chnBXs1FMt7WSYaYELhpM8v4dkMgoXTvXGDrejWsoPe3LZVfrvaj+L6Zl17n
         7fETI54L36Ve8K2xA6Cmu6XBj/5rw0tFGl+MGkxW1AXX4rCXQAYvyuHsYCRPlO/BemwC
         46QgXcbUZCbEgkkteoiEAX3jhbbSRMyPAbrCCgLi2TCEr4mYKQIddYKZzgt5KWcNJOoq
         cQVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=YvBX3gL4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d207si21367244ybh.373.2021.10.05.01.56.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Oct 2021 01:56:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=YvBX3gL4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mXgFG-0002OY-Ta
	for alex.bennee@linaro.org; Tue, 05 Oct 2021 04:56:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1mXgEb-0002MC-FZ; Tue, 05 Oct 2021 04:55:37 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:42555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1mXgEX-0002Xl-Eo; Tue, 05 Oct 2021 04:55:37 -0400
Received: by mail-lf1-x131.google.com with SMTP id x27so82579335lfa.9;
 Tue, 05 Oct 2021 01:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=DXt2p+DKTZd4NFoi7cijIRHkQh+jDOXKlsa+HD0cOH4=;
 b=YvBX3gL4TPRLxDibgQfQRLDV1JD9x6DSu39nGMPFR0M58IqCa9/eEVRmTg16aeKMHL
 iqo1Ox8J8cAc0lqv/GYIe82yBtRL/AzAPCl4T8fHzbSsHXRgKGN4ROXMmdnEDW+CdMi7
 F/wuFziZdriGDhx+k88ZB89kbmHT//erH3PnHgjYNJ1dHu1wypbwptBX0D6b0Q1cLHSy
 UckXjUkdMgaD1NJHVlfKGv9OCXUBVHBjGcJ0lNSkv/gVzq0e7GJ8kv7cuvXnzNYDZfgX
 UURBKzcORhWLZ2m1bA0vExMiU1nJgXSsSfJrVmLRp2RCWT+ChoGL+Q/uySdu6ACJEIWF
 mqpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=DXt2p+DKTZd4NFoi7cijIRHkQh+jDOXKlsa+HD0cOH4=;
 b=Gnavn4JhwWrh6Bza92mo4a7aONu1d9z5dUlRpYyX3IOzGgCwJHs2b3W8SJmAvLSGWD
 V4OQf4j7kaKIKC4vunttbS9uF84zajhZXANm1YMWcOH4DEoorDZMtmMbydARlF9mmS3m
 JGHuKRdw2soMIpTOwBQVCgXjV97Cv64Vpv0bjRM3fHRMTPn8QFQG6L0FoPT+fDD/nxVI
 RYx/LtvrW+R6Msa43398nJfbUTiWHHQJYZ2xAf6mXslnvqRy5e++3p+De036s9NcQI9S
 beg15FScMfia7ZLF00gX7/Uee3np2IQgLUZiML2xtsalyEJHnbDI+FAHr05cg14IuuWG
 ak4Q==
X-Gm-Message-State: AOAM533FLQJnsTWvAeFC9cpzvnhh9iBw6VxTIMt209MMu6VeVRh9Id8z
 j/XV4PcYM/+BYc16NW7qS6s=
X-Received: by 2002:a05:651c:50f:: with SMTP id
 o15mr20063941ljp.495.1633424130560; 
 Tue, 05 Oct 2021 01:55:30 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 8sm1895741ljr.10.2021.10.05.01.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 01:55:30 -0700 (PDT)
Date: Tue, 5 Oct 2021 10:55:28 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 2/4] aspeed/smc: Dump address offset in trace events
Message-ID: <20211005085527.GA23846@fralle-msi>
References: <20211004154635.394258-1-clg@kaod.org>
 <20211004154635.394258-3-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211004154635.394258-3-clg@kaod.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6gGBgo274f42

On [2021 Oct 04] Mon 17:46:33, Cédric Le Goater wrote:
> The register index is currently printed and this is confusing.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  hw/ssi/aspeed_smc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 7129341c129e..8a988c167604 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -728,7 +728,7 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned int size)
>           addr < R_SEG_ADDR0 + asc->max_peripherals) ||
>          (addr >= s->r_ctrl0 && addr < s->r_ctrl0 + asc->max_peripherals)) {
>  
> -        trace_aspeed_smc_read(addr, size, s->regs[addr]);
> +        trace_aspeed_smc_read(addr << 2, size, s->regs[addr]);
>  
>          return s->regs[addr];
>      } else {
> @@ -1029,10 +1029,10 @@ static void aspeed_smc_write(void *opaque, hwaddr addr, uint64_t data,
>      AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
>      uint32_t value = data;
>  
> -    addr >>= 2;
> -
>      trace_aspeed_smc_write(addr, size, data);
>  
> +    addr >>= 2;
> +
>      if (addr == s->r_conf ||
>          (addr >= s->r_timings &&
>           addr < s->r_timings + asc->nregs_timings) ||
> -- 
> 2.31.1
> 
> 
