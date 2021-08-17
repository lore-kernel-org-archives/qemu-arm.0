Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp349074lfg;
        Tue, 17 Aug 2021 02:35:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGeDa3lU6tbtvTvXBff6V+oBAVVLLWE8L+cTK/GQdrCnjeJPNzQabTLOOqqDtNnnTOfdGN
X-Received: by 2002:ab0:707:: with SMTP id h7mr1309306uah.125.1629192906012;
        Tue, 17 Aug 2021 02:35:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629192906; cv=none;
        d=google.com; s=arc-20160816;
        b=asCTZ6gCL4nVYhiVkVHTrQFu/sMXsIgOPn/agJBgPfZ8z8ZFF0o2XetbnLfWRbsuff
         Exonm3twtei0ORDPT3okbmGSC36FofNf1RIyGAisi1gWPRQWGFuF40oVlOG+ytLvVa3r
         0kPelOBAhJyQQo9yu91cd2nag4J4bthl26pE1oLN5b+vyadx4FsDK4czpX4E/ArsEI67
         /wP3sWjMvcuR3oZVg3xz2XmUdsWnbSIbU1FUBPMgLkSY/7F9omSfOPtYTS6CSAQ30z5w
         IWQNBTZ8yZ2iOWsR0CneRtWMnExtTn8lw5k8KlLNQ7FBWp3YauooIOl+sELrlGPeVwX2
         er+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=METMcd9nRfoNTaPjmMOKcSgvLFVRhZInPlLz6EF7KSU=;
        b=hko4jpENsv8xYxI43Zqskga4RUyMjzixVwm2HxEJZH0O0JF0sqbXCxP3P+Zk70XExQ
         JdoFEy9BHIozeDeLhlUPWXsG8nn8nAixiOxTyDyCi3jdzkib2jK3TXcipBK4pxon8DKg
         A2/tqPkaPKQ2ViLywhWTcFRWg87fKQm6Lm+PrLfnZVR3xvhyjhbFACvyb96rxVMO/9/p
         Tcb7RIN6HIdCdg84IEKNORdjh3cVUA5m0GMQH7Ki5CHgZXNHPKWLhzoLfW/lxUFlz95u
         RgDXiToTGKrfKTKWEdU2QnlQhh83exQSlJa62loV2qOgEV5l0p0kQ5yVpbvU/qcPVK6T
         /EQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=g09eKTDf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z14si652021uao.178.2021.08.17.02.35.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Aug 2021 02:35:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=g09eKTDf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Received: from localhost ([::1]:45784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mFvUv-000793-9U
	for alex.bennee@linaro.org; Tue, 17 Aug 2021 05:35:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1mFvTq-0005mH-KI; Tue, 17 Aug 2021 05:33:58 -0400
Received: from pharaoh.lmichel.fr ([149.202.28.74]:54238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1mFvTo-0003Na-Iz; Tue, 17 Aug 2021 05:33:58 -0400
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 54F38C6019D;
 Tue, 17 Aug 2021 11:33:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1629192834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=METMcd9nRfoNTaPjmMOKcSgvLFVRhZInPlLz6EF7KSU=;
 b=g09eKTDfMrXjAFgV4NJ7Lz9ZvLIllWr7aPD6rvNcjcvSeQaOq+l1yTWpzGrzMuSM5TQEQ7
 usjejyvcxRz5WSOTruOJlREHNADRQQV3RmoyYAK1haqRRYjZt2lnH8VXTa+NxmNLflLIMz
 Gvyj1DU2J0Gxh2fgUtkhoQ0UI+7VPgSY9zp+lfGhI3K7QJ06k9OmKkNHgPzXLy1GRLJBv/
 J82wm+2CxqrBaS+h4OLbq3MKqsHvD6NpBJtmYNVon50VCvAq9mlDV4xrS8fkGhNd5vmP0p
 YO+B067NPwwLoE6KWYlpT4uEgSLl6If3WHObht4hHEItfbafkfpTD3i3cU0cLg==
Date: Tue, 17 Aug 2021 11:36:06 +0200
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.2 07/25] armsse: Wire up systick cpuclk clock
Message-ID: <20210817093606.wrf7nlcunwuaq4q6@sekoia-pc.home.lmichel.fr>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-8-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210812093356.1946-8-peter.maydell@linaro.org>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VxJ3UUqXKlEp

On 10:33 Thu 12 Aug     , Peter Maydell wrote:
> Wire up the cpuclk for the systick devices to the SSE object's
> existing mainclk clock.
> 
> We do not wire up the refclk because the SSE subsystems do not
> provide a refclk.  (This is documented in the IoTKit and SSE-200
> TRMs; the SSE-300 TRM doesn't mention it but we assume it follows the
> same approach.) When we update the systick device later to honour "no
> refclk connected" this will fix a minor emulation inaccuracy for the
> SSE-based boards.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  hw/arm/armsse.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
> index a1456cb0f42..70b52c3d4b9 100644
> --- a/hw/arm/armsse.c
> +++ b/hw/arm/armsse.c
> @@ -995,6 +995,9 @@ static void armsse_realize(DeviceState *dev, Error **errp)
>          int j;
>          char *gpioname;
>  
> +        qdev_connect_clock_in(cpudev, "cpuclk", s->mainclk);
> +        /* The SSE subsystems do not wire up a systick refclk */
> +
>          qdev_prop_set_uint32(cpudev, "num-irq", s->exp_numirq + NUM_SSE_IRQS);
>          /*
>           * In real hardware the initial Secure VTOR is set from the INITSVTOR*
> -- 
> 2.20.1
> 

-- 
