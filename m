Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp764954njc;
        Fri, 20 Jun 2025 02:39:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXORWiaDuWsHFgmEXuBam9XeCn1FB+xk69BcxSi1V1YUuC7M2GTF7LAWwPIdl591tg/nT/hBbYKG40MeA==@linaro.org
X-Google-Smtp-Source: AGHT+IGVUXdlq6sEIFH4rT7Z+Ssg6bMd2Gj/pqH7EQj1iiXaYkAqK39pYZms8FnCCWWQ9zm/tYP2
X-Received: by 2002:ac8:5987:0:b0:4a7:1417:5127 with SMTP id d75a77b69052e-4a77a2464f6mr30205931cf.36.1750412340375;
        Fri, 20 Jun 2025 02:39:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750412340; cv=none;
        d=google.com; s=arc-20240605;
        b=C4aa5Ou8U7LhFCgJAfFCZ5hbnEGSRm8IqbwFDaZwdQjOFNzG71jSCq76N+UGsfs9ZB
         Ti3Lb8y3+ZXZxHCMsRGasNvwjzHRgJT9PXDPTh1RFWkG/ujfWKEOxFwnlakAMFqCFsmP
         /oBZqMmGlvOKtm6qc5nvORLCHLSNYh/jORCEtvoB6NblH2/JuJeq/3PQyonU9EeNyp+P
         HTM8OSO5ZdjPneFzGBi6YUdZK6ySEeWQ2cxI2lm8IZNAfE/JmdnWJpaJVRHxFCw0E/4M
         XCy5C9F/0MGdp7UPisQ2C2dJMQf7xkFzSc0Mrb4cgz4ZB73TdwFvxbxn/ISH4tiYe6Nm
         62KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=CMzMdnm/ngIw4BZcumBHo+D7YTHZ/ueJnlM/x9NGEqs=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=hPHYdFipQX5hKAztfXmeukEvY6LsKs8ckLtkjI6Qes/gjk8enr4Dim1xK7BNo4hd1z
         cbknJ3n2lYauY6qMA+z3kZ4rB9BbposGn8Evy+kBGTqQMuq3BlXQD85U7Tzbvf/C3QNi
         dPjDwZUlFj4KyaK0imUXVmq+kuN9KXkFiKoAjCvZqriyKb5PDer6HA0Fa23bF4Tp+vrv
         meEw2ITHjbCia8iGuyKML6u+wI7GV6NePp00GJNm7u+D6VneUXhrxmgs/NJE4VB8j2u+
         pG0d01wuiOSTITA5YSu2tGogfRMh3c6lRxP/+RRR8OceldSWJhgOqAeI99DtAkDdrH6e
         oFtA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d75a77b69052e-4a77a0d4d22si14595591cf.485.2025.06.20.02.39.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Jun 2025 02:39:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bNsn44M84z6L5F2;
	Fri, 20 Jun 2025 17:36:40 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id D0FF2140446;
	Fri, 20 Jun 2025 17:38:58 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 20 Jun
 2025 11:38:58 +0200
Date: Fri, 20 Jun 2025 10:38:56 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v3 19/29] hw/arm/virt: Pass the bus on the ged creation
Message-ID: <20250620103856.00006903@huawei.com>
In-Reply-To: <20250616094903.885753-20-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-20-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: dRrfThVOpBH+

On Mon, 16 Jun 2025 11:46:48 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> The bus will be needed on ged realize for acpi pci hp setup.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
I guess doing this in separate patches for previous and this one
maybe makes it easier to backport the previous if someone just wants
to enable this on a different arch.  Otherwise I'd have smashed them
together.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> ---
>  hw/arm/virt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 08bd808499..2f34877716 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -696,6 +696,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
>  
>      dev = qdev_new(TYPE_ACPI_GED);
>      qdev_prop_set_uint32(dev, "ged-event", event);
> +    object_property_set_link(OBJECT(dev), "bus", OBJECT(vms->bus), &error_abort);
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>  
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, vms->memmap[VIRT_ACPI_GED].base);
