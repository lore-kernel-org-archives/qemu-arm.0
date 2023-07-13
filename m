Received: by 2002:a05:7022:629e:b0:68:46be:293d with SMTP id e30csp2798055dle;
        Thu, 13 Jul 2023 08:32:40 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE/fLuBJ7ZC+N+3xsYRX6aMaWDEATvY86oqW7keTyW2G8XQkTVcV8OSz7Qrr/gohJqhVrr7
X-Received: by 2002:a05:622a:1c5:b0:403:a923:bf5c with SMTP id t5-20020a05622a01c500b00403a923bf5cmr2523393qtw.33.1689262360199;
        Thu, 13 Jul 2023 08:32:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689262360; cv=none;
        d=google.com; s=arc-20160816;
        b=CsllFRrYtKCtQVhj/sJuMZiARhJB67xitOwonWle3rKDsEyhYseiRVHBy5pnUWnE5b
         wMjOezUhLv253Ude53Rc8YFbvy3MBkCnTqsKnWOmBwgbtxOmuCh0pf+tykqdtqqtcni0
         gtmLR8fYnf1Tx9cEYOPSKnR6ixGMoxVDdnQcZsZIjVxQem+j4riP9KXbfCWNOJh9M0Ga
         qd9oZbKShwirZ8YYPSt2RCW4PXSQmSwMXSTSnbfsJkR6QeZi47SgJ+HDMPUiUTfTu57I
         rLIqRYpsXebpbJDqyLLJO6tIOZUMBEMmOiZHv9d1mmHnvhOGHVQrSj0id+H/29sTCWwC
         Yzhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=XmtRfAaCOEvHnZJlQJO9UyKPNDs6p09uMlOOyI7uQBk=;
        fh=LUYnbnkgYtpPzNQZTmn8BxyF0ZxlmpBDbfYNVO8YMLQ=;
        b=Sgw4+sGBYtcw1nBAGN7xY2m7WwBp0Cdm0om2LNwzsugcngCvykOLGExHPDmF/1nh+u
         5C/3Wq1xRsXjAsLYVOeb1cXs31ikl0JBCPLEzFcHryJwR1CGx0x9woRmpiiwcoi4XzXe
         9hrkPjEvY0EPerCSPFQbj2CCmv3rGKVDdSDMgK2d49cOeYgzJF4gBIjtgssWkPtHKoac
         CO+X5CdOZf0UURQDKP6EN6pVm1niCkiigh5wtYNa+o4lWM0NfGiJqx0sdEsU2eXGf1n1
         yv2355jDemcU44gnwF6f4ewpMraPwNnvEEVC1ndWVx82ZsU54xaz2J2XkcPPJL2H/3z3
         KuKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c3L2j7z9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18-20020ac85b92000000b00403c2e9e72bsi2323783qta.106.2023.07.13.08.32.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jul 2023 08:32:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c3L2j7z9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qJyIZ-0005hD-K3; Thu, 13 Jul 2023 11:32:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qJyIU-0005ft-H8
 for qemu-devel@nongnu.org; Thu, 13 Jul 2023 11:32:02 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qJyIS-0002dP-Sb
 for qemu-devel@nongnu.org; Thu, 13 Jul 2023 11:32:02 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f96d680399so1462756e87.0
 for <qemu-devel@nongnu.org>; Thu, 13 Jul 2023 08:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689262318; x=1691854318;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XmtRfAaCOEvHnZJlQJO9UyKPNDs6p09uMlOOyI7uQBk=;
 b=c3L2j7z9Nk8a+4RupE7dqWGo3JoNChMcfhVHvmSkk6PNIuSPDgKQrRQEwV/AwgJEbC
 /uxUf/LZ0j/H0yiPcplLaNcGioSZYH01ZEqxHj590HZTPfJztKZ4ieN219tIz8Lcc8YM
 YVtmGnU3F3QT4/4fttbdzew2nQprjBmOVeuV0L8CgSzV6KbZAjeW8drXL4ZGtt/tJNZC
 NlhWXGubgE6hHvcb23ILbn39ZSh2SC8NB3Oeywh1JTPq0VeGECl0y1Aja4Udp7bgTWer
 LJoEBXtrFlVEJ0px0r/EJ7LUKRl9vmdj4YgoDDtVf0EmhwLQsJITbyzMpKPlDTBtjcc8
 mkcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689262318; x=1691854318;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XmtRfAaCOEvHnZJlQJO9UyKPNDs6p09uMlOOyI7uQBk=;
 b=Y3dUetYbt1nP23qhl2rRcKVEYt5FFkPhRmZNK4bMTACRMNMRPtwFqCGddoKbkr+cQc
 EyY5qcSjtPgiUw1VJJI64jPzu2Guh2ITC0kFhyMwK9UC+s3Hftt8z9uB2GYo3vEV9JXG
 oAL6Tnzky3ldz7H+lddYHBbF3k/sYULrY2WEThKQV4RHc61gT3+8RboarRNUhrs3wRxZ
 1IsgjeUZlnyb5Juo910164TIdKRXF6C+UfuPnApXqUyyRmJnnoQAHM7EiF4JdFOybalu
 SJasffSYxadNthr7t9ywjMJ6fGTCauH3nmXayfqFjxlr9b9RTRFuvHJtNXTb5C9fNc4v
 iimQ==
X-Gm-Message-State: ABy/qLYOYIFZAJ8Vm/ta3UmFDAPnHwEuIiM0pRcek5YWrZdAPnum86gr
 DkWvWSesrHlUIEf0wrxiCCLeQ19qhuvYRNWKStMu0g==
X-Received: by 2002:a05:6512:53b:b0:4fb:89bb:bcc5 with SMTP id
 o27-20020a056512053b00b004fb89bbbcc5mr1659168lfc.50.1689262318116; Thu, 13
 Jul 2023 08:31:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230713035232.48406-1-j@getutm.app>
 <20230713035232.48406-8-j@getutm.app>
In-Reply-To: <20230713035232.48406-8-j@getutm.app>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jul 2023 16:31:47 +0100
Message-ID: <CAFEAcA_hKao=-kadeKjZMGOugtSGLHzhzTLiva5aZP7PHQN3xQ@mail.gmail.com>
Subject: Re: [PATCH 07/11] hw/arm/virt: add plug handler for TPM on SysBus
To: Joelle van Dyne <j@getutm.app>
Cc: qemu-devel@nongnu.org, "open list:Virt" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FFIondVg17zE

On Thu, 13 Jul 2023 at 04:52, Joelle van Dyne <j@getutm.app> wrote:
>
> TPM needs to know its own base address in order to generate its DSDT
> device entry.
>
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---
>  hw/arm/virt.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 7d9dbc2663..432148ef47 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2732,6 +2732,37 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
>                           dev, &error_abort);
>  }
>
> +#ifdef CONFIG_TPM
> +static void virt_tpm_plug(VirtMachineState *vms, TPMIf *tpmif)
> +{
> +    PlatformBusDevice *pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
> +    hwaddr pbus_base = vms->memmap[VIRT_PLATFORM_BUS].base;
> +    SysBusDevice *sbdev = SYS_BUS_DEVICE(tpmif);
> +    MemoryRegion *sbdev_mr;
> +    hwaddr tpm_base;
> +    uint64_t tpm_size;
> +
> +    if (!sbdev || !object_dynamic_cast(OBJECT(sbdev), TYPE_SYS_BUS_DEVICE)) {
> +        return;
> +    }
> +
> +    tpm_base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
> +    assert(tpm_base != -1);
> +
> +    tpm_base += pbus_base;
> +
> +    sbdev_mr = sysbus_mmio_get_region(sbdev, 0);
> +    tpm_size = memory_region_size(sbdev_mr);
> +
> +    if (object_property_find(OBJECT(sbdev), "baseaddr")) {
> +        object_property_set_uint(OBJECT(sbdev), "baseaddr", tpm_base, NULL);
> +    }
> +    if (object_property_find(OBJECT(sbdev), "size")) {
> +        object_property_set_uint(OBJECT(sbdev), "size", tpm_size, NULL);
> +    }
> +}
> +#endif

I do not like the "platform bus" at all -- it is a nasty hack.
If the virt board needs a memory mapped TPM device it should probably
just create one, the same way we create our other memory mapped
devices. But...

How are TPM devices typically set up/visible to the guest on
real Arm server hardware ? Should this be a sysbus device at all?

thanks
-- PMM
