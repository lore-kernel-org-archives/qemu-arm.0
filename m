Received: by 2002:a0c:fe87:0:0:0:0:0 with SMTP id d7csp2152671qvs;
        Mon, 8 Jun 2020 07:06:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrqc7ts2BzHgXJycjdSVTPMxW7G9gQP4q9wQL1TiefCa7L5qeVxCvo8jMrhkMIzZKxueMr
X-Received: by 2002:a25:ec0d:: with SMTP id j13mr34991961ybh.364.1591625177868;
        Mon, 08 Jun 2020 07:06:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591625177; cv=none;
        d=google.com; s=arc-20160816;
        b=o3ssiIt4G1OycYuXTS1c/cCCW4dlX6T8DHqjsKiYNK9sebfh35kEjDjtMqCDTLU7SS
         tdJVeE7z0jzNw43B7gS/RggQHjCaqJ1UYeC2GSD+l3uC73GLw0quKW7FBFT66gYARzGr
         AaiW91FJKYZj2Ub0W0hT2GaXg3XqE6tg/ci5FXg/BQ7tgovrb9NUNIW5IYPurKyDUFJy
         jhLTtJ1B0HQJGGLu3EoHoBlHuw+c+VRbkkf8N/dLPC/m3F3r7ZFbJExkHrEKZxcS7FL1
         SWY0S+1MrS6x5WlyayMxnbixREnJHxrdf6KxUMWvge//gVhC9KryHavv1MWMY5trycTr
         lqag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=pQXebOZl5eMXuJEtLibhdw+QIG8dtWyLzDYxG3R4z04=;
        b=cFdRQ0jZ8ZejSvNUxJXs7ZWHRf7ULwHGptCJIqFqqY3ELbL3bZkPSssIl7vWO8TKuE
         8a6zoNU+pPY79HE4F2E3jy7cyn4ecRtCSacs+EqqSL5gVC7hTNZKg9L8kVNRdNFtk00N
         qcrX/08HdMEoqfrnVr2lJcA2W5KAb2TMUF68D8y9Pmsp2+4xmec81csSx9qWA0Ey2gkG
         LbjMR7DwvC5fNcFLtc+bCDZCo+vMIdHIQVS6+MVUvEjH4xGEnug/CVGfZaStGrJWeqqC
         +1C3Je+lG1AfsYPcie5Ta9esAOvm8QPlOrUZhJXtWovU47WkiGM/3cjmfLyZ9pMla0HW
         QIxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VY0D4PYi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 184si3357877ybg.374.2020.06.08.07.06.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 07:06:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VY0D4PYi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:35316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiIPp-0002E4-C0
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 10:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jiIOT-0001BY-Sf; Mon, 08 Jun 2020 10:04:53 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:50873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jiIOS-0002Cz-FO; Mon, 08 Jun 2020 10:04:53 -0400
Received: by mail-wm1-x342.google.com with SMTP id l17so4273344wmj.0;
 Mon, 08 Jun 2020 07:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pQXebOZl5eMXuJEtLibhdw+QIG8dtWyLzDYxG3R4z04=;
 b=VY0D4PYi/pe7Bznsj4mZN7vbMThsvg3A8q7PQSli0nYUsADTwIf1MG5uiclVfatGAz
 xmANY0JBPEMzntr98f1BzzneYuZp2l5QHOMgtynLdcEPY/FBKJUEpDCTYiWkBiXZ0SKw
 B+eQQKNIFY06MhBSQpTqdBPt/EiJNWr1g7YPHOTQ+QU0yXLmMr0BP5HB8V/UYWbGe+Cy
 0nWo45+Mdu3TYsE4d6eQOaHVAM+9VD3TF605beu+afbeKjtzflLuakOFtD2DI0uZaJxZ
 SvNr2YNVsUCgmN/B2CnjiNzgYSaEbOOS1B/AN2ug/ICf+U4Gi+Jce4zeD+pnev0o42eU
 Gqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pQXebOZl5eMXuJEtLibhdw+QIG8dtWyLzDYxG3R4z04=;
 b=UhqxMfdvXIQLGVatCIISogi6UhZA4pGgjiRFNNs8iNauvLfza8uKHCm0L8Fo5Kmzcq
 vGHHcHftB99akfjUGWjD8m49sp77SVzERnBJbGzz8gBix7ZfU7vENZJOmZGXWIvss/XQ
 BKco3dOMlbjDT/SU9wAUH+Ym4uYTeaXol8cJ/jmxZ0686KvDPiRnd4tDmMDh8x2NUxNv
 ekeQk0XnFkNI+aA2BUr8TjXm7bpr0eQdBpNWorVUete4uTfg6CcFkuo0bVXW0TQRHozg
 7wykPbwPO+UF5lilhJpVWKYkON8RyVNnsiz98AMVxb/s7cwsUlVYhitQP95T2RrViC1E
 MohQ==
X-Gm-Message-State: AOAM530OPIkkQu5AP8bSOoOqk7MReyrFnVguwhKwvxvU1+/aIZL4MzcN
 WtaAeic5mcu2QIp7rCz9sXUxl2Z1
X-Received: by 2002:a7b:c40e:: with SMTP id k14mr17629476wmi.59.1591625090328; 
 Mon, 08 Jun 2020 07:04:50 -0700 (PDT)
Received: from [192.168.1.38] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id n23sm22276042wmc.0.2020.06.08.07.04.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2020 07:04:49 -0700 (PDT)
Subject: Re: [PATCH v2 03/24] sd/pxa2xx_mmci: Fix to realize "pxa2xx-mmci"
 device
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200528110444.20456-1-armbru@redhat.com>
 <20200528110444.20456-4-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8cff82e9-b5ad-ab4d-d164-5ffe91337b1b@amsat.org>
Date: Mon, 8 Jun 2020 16:04:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200528110444.20456-4-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, berrange@redhat.com,
 ehabkost@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xLiRwyiosPaD

On 5/28/20 1:04 PM, Markus Armbruster wrote:
> pxa2xx_mmci_init() creates a "pxa2xx-mmci" device, but neglects to
> realize it.  Affects machines akita, borzoi, connex, mainstone, spitz,
> terrier, tosa, verdex, and z2.
> 
> In theory, a device becomes real only on realize.  In practice, the
> transition from unreal to real is a fuzzy one.  The work to make a
> device real can be spread between realize methods (fine),
> instance_init methods (wrong), and board code wiring up the device
> (fine as long as it effectively happens on realize).  Depending on
> what exactly is done where, a device can work even when we neglect
> to realize it.
> 
> This one appears to work.  Nevertheless, it's a clear misuse of the
> interface.  Even when it works today (more or less by chance), it can
> break tomorrow.
> 
> Fix by realizing it right away.  Visible in "info qom-tree"; here's
> the change for akita:
> 
>      /machine (akita-machine)
>        [...]
>        /unattached (container)
>          [...]
>     +    /device[5] (pxa2xx-mmci)
>     +      /pxa2xx-mmci[0] (qemu:memory-region)
>     +      /sd-bus (pxa2xx-mmci-bus)
>          [rest of device[*] renumbered...]
> 
> Fixes: 7a9468c92517e19037bfe2272f64f5dadaf9db15
> Cc: Andrzej Zaborowski <balrogg@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/sd/pxa2xx_mmci.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
> index f9c50ddda5..c32df1b8f9 100644
> --- a/hw/sd/pxa2xx_mmci.c
> +++ b/hw/sd/pxa2xx_mmci.c
> @@ -492,6 +492,7 @@ PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
>      sysbus_connect_irq(sbd, 0, irq);
>      qdev_connect_gpio_out_named(dev, "rx-dma", 0, rx_dma);
>      qdev_connect_gpio_out_named(dev, "tx-dma", 0, tx_dma);
> +    qdev_init_nofail(dev);
>  
>      /* Create and plug in the sd card */
>      carddev = qdev_create(qdev_get_child_bus(dev, "sd-bus"), TYPE_SD_CARD);
> 

