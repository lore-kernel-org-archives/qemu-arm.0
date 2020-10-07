Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp305452lfq;
        Wed, 7 Oct 2020 04:09:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpT9OlTannKXb4hZJmHRiS9CjdyCwGhNvWvZ4ttE/sulLsWeyKAZvuUeHJ7FjoBe4DBCAc
X-Received: by 2002:a25:3a45:: with SMTP id h66mr3113196yba.509.1602068970481;
        Wed, 07 Oct 2020 04:09:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602068970; cv=none;
        d=google.com; s=arc-20160816;
        b=INzHOcNxMWsT1DXOhZs6EQoWMYMAWbAaxqe4oRETAZ4X69JD/segq9Dsrc5y8uSS4e
         stzR6lrchQTd7IBRayViuKUGtZQCGDGa1Jg3zKv8GfWH1JeFV1ZHFC3X7DSG7dTNdls3
         EPuao72Z3uFp5bsc8qN9brCq5Hc+MPB3GrXHWbn7yjAVcJiDezMTDcBQ2n4mES0YUnD7
         KRGEq/hZpgC83dYBpb13/aqmiSrwV7nfe4lAGu2FwJzQ7NwsfEsy8R6ifz1z+NNf7WSX
         lwdC4iauq5+MtzRax0KXciwCHaSzivkaZW227G1wvpr1KpVwGYyPepr6gd4Kj0/k5C34
         DTPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=uiv3OaFqYCcpvMry9h+3mT4rKuYQPnJ3d9uSYnMJJUk=;
        b=ZEh8uy5IpFQp2JDbADNZD67apjDmCxSel74UbE0m0bIHtT5+l3qeTvi/qPCyfyl37L
         VW4DGQ2t4iCaXW8lWtM36KeZ7DcwDYfIh6n9YLEBmL9Bpb02HpYpTKn1QqieTLRab8z/
         1gWqrtHWkabN/iUmeslWEe5OKkqvle/eJOEYzXRl0dUvKHxWVEOxobQCiDIupR0D/OaS
         Bmv+QwAYhKEu6uu8cE+YsqQFQgWzDLC6ewRCB6Xhj0GcOGxRP3tDR8HLhLtYgSRj894i
         G+I6ymMVEO9582y+26hkEeQVA7V4vwthjEDUV3idGjExXnb7SSuk1T+nEMTOdaDqalGg
         pYyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=suo9jj9f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j145si1470936ybj.324.2020.10.07.04.09.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Oct 2020 04:09:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=suo9jj9f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQ7K5-0008Vo-Sg
	for alex.bennee@linaro.org; Wed, 07 Oct 2020 07:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kQ7Ju-0008V9-0j
 for qemu-arm@nongnu.org; Wed, 07 Oct 2020 07:09:18 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:33148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kQ7Jq-0003ri-QK
 for qemu-arm@nongnu.org; Wed, 07 Oct 2020 07:09:17 -0400
Received: by mail-wr1-x442.google.com with SMTP id m6so1688691wrn.0
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2020 04:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=uiv3OaFqYCcpvMry9h+3mT4rKuYQPnJ3d9uSYnMJJUk=;
 b=suo9jj9frBwbfUlXBrIEuXw310zzYfxAFOcvRPlR6tME+6ZqwgzczWUpoLkrJ7sAg9
 UdeqCLr2F4/Ci+nEHFoS/f01NzkNl17vOEZnEaccATqxsj06LLigeLziWkXClaHJrYDp
 ANySYNCag6CZz69z2tzMTwN6flwEkNPshZBufwqKl1Xy8c8oLK3Z6lVuKD7osiDuGVoG
 klPrJZZYgkt2Tt3ZAvLDq4AS3SxAB2Zu89X/PO2pUtm9j630yNbrd4YHJ2FMWTnuBvKJ
 XoGOb5tEcx1k4VyhRgTIXofGKzwKlqq7O1bDGwlpYDs5KNhL3Wlwbu1Ftu0IS9vsIuOZ
 qIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=uiv3OaFqYCcpvMry9h+3mT4rKuYQPnJ3d9uSYnMJJUk=;
 b=McTX/uB6MKgSNXymnkNH/UctsNytkl8RHlzOJbxBBNtP7qxYqA35JU01fa064Dd2HM
 tPfLh74pBLJKjAoO4LzcIMflgBoSKSG2diNukZs04s/TwCOvZ2tJ/KpcMufgQwNYU6TK
 rnkCY1O0C/c5dEgcTPAJbp7S1YEDU0XzcSodS+KM8PxFP62tnf7qzkfp3ZCi1ABOD2fC
 G7L0815JVDOHo6OLFL4sJQ6tXGe2V5URMFdwBn/yks4ioqTVMPJWG5XLpJKaB56Xix38
 3dyvRCpKt7LGM70MbwT6W+ceHrWxrhD0a6yNBt6IH2N+iHrdxcGf8j3yPeOj4HMnXzeT
 sCiA==
X-Gm-Message-State: AOAM531pIlDmm3KgS5UT7ujGvY4bR4RumOBKnonOJV5T05IKEP22PZBw
 i5hHxVTH6oh1FobaLD4rnzOefA==
X-Received: by 2002:adf:a29a:: with SMTP id s26mr2916710wra.197.1602068953194; 
 Wed, 07 Oct 2020 04:09:13 -0700 (PDT)
Received: from xora-monster ([2a02:8010:64d6::1d89])
 by smtp.gmail.com with ESMTPSA id k8sm2278476wrl.42.2020.10.07.04.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 04:09:12 -0700 (PDT)
Date: Wed, 7 Oct 2020 12:09:10 +0100
From: Graeme Gregory <graeme@nuviainc.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 1/2] hw/arm/sbsa-ref : Fix SMMUv3 Initialisation
Message-ID: <20201007110910.6tp6uwqj7qbeyi2j@xora-monster>
References: <20201007100732.4103790-1-graeme@nuviainc.com>
 <20201007100732.4103790-2-graeme@nuviainc.com>
 <c518a446-94ca-f21a-2e49-e2cd8171e581@amsat.org>
 <20201007103220.z5pc5qjoyxbowyrb@xora-monster>
 <aafcbb37-dc5a-e608-21fe-6e65e36df5e4@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aafcbb37-dc5a-e608-21fe-6e65e36df5e4@amsat.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=graeme@nuviainc.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, leif@nuviainc.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, rad@semihalf.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JzsWlszB0BED

On Wed, Oct 07, 2020 at 12:44:43PM +0200, Philippe Mathieu-Daudé wrote:
> On 10/7/20 12:32 PM, Graeme Gregory wrote:
> > On Wed, Oct 07, 2020 at 12:24:32PM +0200, Philippe Mathieu-DaudÃƒÂ© wrote:
> >> On 10/7/20 12:07 PM, Graeme Gregory wrote:
> >>> SMMUv3 has an error in a previous patch where an i was transposed to a 1
> >>> meaning interrupts would not have been correctly assigned to the SMMUv3
> >>> instance.
> >>>
> >>> Fixes: 48ba18e6d3f3 ("hw/arm/sbsa-ref: Simplify by moving the gic in the machine state")
> >>> Signed-off-by: Graeme Gregory <graeme@nuviainc.com>
> >>
> >> Again, this fix is already in Peter's queue:
> >> https://www.mail-archive.com/qemu-devel@nongnu.org/msg732819.html
> >>
> >> But if you repost, please collect the reviewer tags,
> >> so we don't have to review it again. This one has:
> >> Reviewed-by: Philippe Mathieu-DaudÃƒÂ© <f4bug@amsat.org>
> >> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> >>
> > 
> > Ah I thought splitting the patch invalidated Eric's reviewed by?
> > 
> > This is a different fix to the one you are referring to, previous one
> > was in PCIe.
> > 
> > Apologies if I have missed an email from you but I have not received a
> > Reviewed by from you for the SMMUv3 IRQ fix.
> 
> Oops sorry my bad, I thought this was a repost of the PCIe fix.
> 
> So:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Looking at 48ba18e6d3f3 I messed create_smmu() and
> create_pcie() but you now fixed both cases.
> 
> And you are right, this patch isn't reviewed by Eric.
> 

Thanks, they are confusingly similar patches.

Graeme

> > 
> > Thanks
> > 
> > Graeme
> > 
> >> Thanks,
> >>
> >> Phil.
> >>
> >>> ---
> >>>  hw/arm/sbsa-ref.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> >>> index 9c3a893bed..65e64883b5 100644
> >>> --- a/hw/arm/sbsa-ref.c
> >>> +++ b/hw/arm/sbsa-ref.c
> >>> @@ -525,7 +525,7 @@ static void create_smmu(const SBSAMachineState *sms, PCIBus *bus)
> >>>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
> >>>      for (i = 0; i < NUM_SMMU_IRQS; i++) {
> >>>          sysbus_connect_irq(SYS_BUS_DEVICE(dev), i,
> >>> -                           qdev_get_gpio_in(sms->gic, irq + 1));
> >>> +                           qdev_get_gpio_in(sms->gic, irq + i));
> >>>      }
> >>>  }
> >>>  
> >>>
> > 
