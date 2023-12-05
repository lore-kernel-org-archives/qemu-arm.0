Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp418186ejb;
        Tue, 5 Dec 2023 11:59:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+kuOuY9Rg1USio6iYdxcspBSzdmNLa9s9O9LfnX31HIit7ytcAZMqwJX7Jx1KZQ/cQVZN
X-Received: by 2002:ad4:4d4e:0:b0:67a:a721:b1af with SMTP id m14-20020ad44d4e000000b0067aa721b1afmr1700323qvm.106.1701806372215;
        Tue, 05 Dec 2023 11:59:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701806372; cv=none;
        d=google.com; s=arc-20160816;
        b=y+K4rsHHXDK4oJg1liMxFf9sE5750iK5PZMpHvOyQ+CKerMHlztUg/n94YZ/uy95F2
         XvAUo2OTRXGLMIsCEt4WVMtO+hNAEQ42CY8EjbcmtyWZdsFcmOq7zdInrvB8CqxDAACD
         d01gH6keSXhggXRH4srdyxMap9uhwuLXipd/zyOHiLm/r7RyIyAGRvWK0RUywQIRWiK0
         I4bS1qZs1xMmC7VQM6x7e2EbY/EW219Lm/yQHbjz++e+IcsgPaVZQbaR3q/5lndBgLw1
         dFouIkPKZ7RwqbyYGT4QhKCsdRsntuRTdJYETlF+pjrJddYmTDG83UcFAc6NDuguqmya
         QXqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=DONy33HVQoYe8nBI7bz9dVQwsdTfkcWQcQcHaJxluDk=;
        fh=RUvd7+rNuK560dO7rvuzvV5zrBUHecFwvDuWjdbhUXQ=;
        b=hGdBQgobzcUXImBbhaUJPmIBbQqoqMiuNB5FMV2cOlB6pxnfC5xYDSeoEOF+fVOYnv
         UcbEfWprx1+iELQPAb9crQLNyAuMi8fqAC06ONIqd5CUr1PvDZsiTiSHfDu6qSp44gfF
         Apqow9JJxESkat7vA01gZZdfxqcs7jzSsrfV8LbfxKBerHzR1b5bPGzN4M/R6o4dGvRJ
         lg3kZIU0KkIWxsq2qpy/teW+lZc7cyemZoH7BhequsUDOELioEcH0VJ2Cwvt4ke1nkma
         w0ZQMWAu2Kwdev8Z4hLRjyobcZrDZzSQ8aonTNw4Mc2MQ61JoiIsHEpQSalYZD3pgE8o
         Vt5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=WJKYJzJK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id di8-20020ad458e8000000b0067aa6d85941si8495787qvb.61.2023.12.05.11.59.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Dec 2023 11:59:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=WJKYJzJK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rAbZL-00073P-0O; Tue, 05 Dec 2023 14:58:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1rAbZJ-00072r-W2; Tue, 05 Dec 2023 14:58:58 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1rAbZI-00069C-Gg; Tue, 05 Dec 2023 14:58:57 -0500
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50bf69afa99so3481306e87.3; 
 Tue, 05 Dec 2023 11:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701806333; x=1702411133; darn=nongnu.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DONy33HVQoYe8nBI7bz9dVQwsdTfkcWQcQcHaJxluDk=;
 b=WJKYJzJKitWUV2yIs/AhayQaVXHm3nvXG0Trvhsj9g8TCbf8ZXLdcAC+DPwoQLz1PP
 nKBYM2BoPCa7neFdzzOFWJ9LhJGvdfpz4MQNiLDeHYEH5Gdg6JjhqEEE+vloT0rCeLDx
 zSMLde34MYP2i91l1B2aPU1blODWs3k11sdf8Klhs1/f42gDMuDJ884saL4YhhzoyBtj
 iha6bLRxBk2R2Qtej7pIJsomO2cRcyAMfWqE3/2Jid+iWyUwZnsiDXOM+c9UsojK2lLQ
 vfEY/N7hMQ5mmLNY8W8u2PSleb+U5oZbnS3mVrUDoHfXv9lJlGXHC5ZOTK+XfjvjzOaA
 dEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701806333; x=1702411133;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DONy33HVQoYe8nBI7bz9dVQwsdTfkcWQcQcHaJxluDk=;
 b=b6+CHIfCuKfjsWyK3Qpau7MAX5oZGtY7CpSXVBeYdY4m/Modo1rNjtA8jtz+h+eO4H
 ucnntCktMeKXv4PF+8uJInXGC7Ho4VPSbC3Sd0IQ1YnFLRBsH125Pmo24DgV0Sw3o6SV
 h1QT5LB9Hf4oM0zeI6OkJ8WCPg9T8T3TK1yVVx87BKcrRlHszW3SOLD2HXSfgYIWfO7E
 Wntl6OjAloDMNxyS2iPLNS+a/YyxbF8A+yC6zshX8EbBB0i2aONiJO7Ihs3TiKxnVVh6
 HApmO69Mo0vXgr6v9SnHok9yQ3iTD5TIRmKC7nrojUgDDzEqB4Yw3+f78Jv+Xy2KMR4y
 fg9Q==
X-Gm-Message-State: AOJu0YwKHD7Mh2o/sVIB+4wDctzX0xWZreZ1KkMv+Fmo4/DABFsLYnnR
 EQwJ+88NriD7KHdoh3YAqTE=
X-Received: by 2002:ac2:548f:0:b0:50b:f486:88b3 with SMTP id
 t15-20020ac2548f000000b0050bf48688b3mr2338892lfk.106.1701806333382; 
 Tue, 05 Dec 2023 11:58:53 -0800 (PST)
Received: from fralle-msi (217-76-87-105.cust.bredband2.com. [217.76.87.105])
 by smtp.gmail.com with ESMTPSA id
 y22-20020a197516000000b0050bfbde3901sm570049lfe.297.2023.12.05.11.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 11:58:52 -0800 (PST)
Date: Tue, 5 Dec 2023 20:58:51 +0100
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, saipavanboddu@gmail.com
Subject: Re: [PATCH 1/1] xlnx-versal-ospi: disable reentrancy detection for
 iomem_dac
Message-ID: <20231205195850.GA9927@fralle-msi>
References: <20231205094802.2683581-1-sai.pavan.boddu@amd.com>
 <20231205094802.2683581-2-sai.pavan.boddu@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205094802.2683581-2-sai.pavan.boddu@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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
X-TUID: PCAgtamdL/DL

On [2023 Dec 05] Tue 15:18:02, Sai Pavan Boddu wrote:
> The OSPI DMA reads flash data through the OSPI linear address space (the
> iomem_dac region), because of this the reentrancy guard introduced in
> commit a2e1753b ("memory: prevent dma-reentracy issues") is disabled for
> the memory region.
> 
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@amd.com>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Tested-by: Francisco Iglesias <frasse.iglesias@gmail.com>


> ---
>  hw/ssi/xlnx-versal-ospi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/ssi/xlnx-versal-ospi.c b/hw/ssi/xlnx-versal-ospi.c
> index 1a61679c2f..5123e7dde7 100644
> --- a/hw/ssi/xlnx-versal-ospi.c
> +++ b/hw/ssi/xlnx-versal-ospi.c
> @@ -1772,6 +1772,7 @@ static void xlnx_versal_ospi_init(Object *obj)
>      memory_region_init_io(&s->iomem_dac, obj, &ospi_dac_ops, s,
>                            TYPE_XILINX_VERSAL_OSPI "-dac", 0x20000000);
>      sysbus_init_mmio(sbd, &s->iomem_dac);
> +    s->iomem_dac.disable_reentrancy_guard = true;
>  
>      sysbus_init_irq(sbd, &s->irq);
>  
> -- 
> 2.25.1
> 
> 
