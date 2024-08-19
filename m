Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1947160njf;
        Sun, 18 Aug 2024 21:21:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWvLDong3fOOA9UnWKpc7HQIy01xtbbCe2tSNlQpPCmml5lgqnYKM86INtGV3MUqZLqdUicA6Y+tGxakUPWi7WIhnHDEEDx
X-Received: by 2002:a05:6830:2816:b0:709:450b:a3aa with SMTP id 46e09a7af769-70cac8a3db7mr12763293a34.21.1724041284578;
        Sun, 18 Aug 2024 21:21:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724041284; cv=none;
        d=google.com; s=arc-20160816;
        b=ZX9LbmFiemhYuietCG+ZNo+lfXFSz9Fgy9ZbrKTplfLi1PnH36YJAW9Fb0b8bnfvwt
         n9/LDOFGBx0U5sK2ky2rsmO+d12SQs0Yg+0hrMhYM+qY1tPs0n9EBw83ke79058qJ20v
         dLR01dX2DvswlUST/GHXoeJ5/QH7T+PV3P7tGFeg+PP9mT28/nXvnlI61m34/nwk4B6S
         W8nTDBFpAvVqfwQMIn/mqPp9hHhNYKcu0GMwfMJbAJt/gVeu/mLX6YR8KBu4hkNRhXJJ
         TZP6R9u9/8fmPU5Mshzill5mqY0qtKSFt3WLC52CawQRVq78i/F4a83z70NciuYOhe91
         Hp+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=9zMBFLaUmtC+DIxiu4oheIM8uCLkqi+EyyEj4w3QR8w=;
        fh=K8WUj7vrj9pJzXOP3262ErYVON3I8cKz7goWU/glkuk=;
        b=0jqWFp+iIcXhP4kvVweQ2NyQkntT5eFrY6/S6pFsI+zQ36riIAo/HR/nqQsgQQ1UGc
         /keolMJru8dJZyis2gUAszLduLd3eD2k+PY2C/PljecRO6lOp8naLRCqvxhPksF4fHqf
         xjo/t3eDJN6dXt2keA0tird1kW41qk0t+NAm7HfPBpw8VKfxyloM7mZ86vfy4ce52nlH
         hPB/FL5eKBnTuh0PlFpC395XG7H/YbBCeyKA+dSuhWCNQVDR4dEmB2CWg1hiXTh51ZVO
         ob7pwXV7H/UaD4gX2vpCw3IzcDbYoIWYbQNGt6OYYv6+qvcDyLnaeZ2BPEtoGFvnmG3N
         yBLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nemmgu5Q;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 46e09a7af769-70ca64b4016sor5201289a34.9.2024.08.18.21.21.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 18 Aug 2024 21:21:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nemmgu5Q;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724041284; x=1724646084; darn=linaro.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9zMBFLaUmtC+DIxiu4oheIM8uCLkqi+EyyEj4w3QR8w=;
        b=nemmgu5QNUYIBXQ14HDnYfShY4dVimm+WDIA5FxlZ1N6Sdb/pzu+3qUhJq3ZtFzxP2
         9oIIYPaQPQxSZ95BwVZV631a0ghK554tVKvAWQhNNbYyVp4yjBUWEWnJLI5zDkQMrJf0
         d81W5V92pnYDb1eNYSLunAH92fxh9vkEcJ13B14hyMdIXCcAurQWNmATsz88i4MDOF7E
         1cGwAfhJdrXk6AGwrfe/GzcqoeHO1lxVmWNW07J6vFxaqozuR2R8nrITdeYS/QSnRGWP
         mh4hG87IKfduZKaAzBrNe90SWymNkEdXFsV1uDapLgStMEk22B4x7gK2UC+SRg4wsggh
         w2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724041284; x=1724646084;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9zMBFLaUmtC+DIxiu4oheIM8uCLkqi+EyyEj4w3QR8w=;
        b=hWzLZidSlP4DmkXVZhNS8qorLZl5MUvyCOo0LHRgkJGeXjS34ZIX/f8z8ZmOkvJUZP
         GFIvjjPs1YTy3FvESUORt+4iP3A2sHZuQA4boJNElbUThglWi6Ehq/WoiZTXVFvYUhLC
         XLzqvhpFARezOEwrnyIQN/hu/7rsSp1fQrlQyxJfmhJ5oOjXZeCpMuAeWC/rdDRMbfiP
         sKHGdC7hsgufmEywpf58h9Ianf9IC9OQ+lC6OzAMhm8788ojcNFqZWJsdZyEIG6VPrgF
         8wjNZ9DxWwK8babYDhI8zR4sYfUMDK3cSQEEAdEiuN4qFmgXBuLuvwx7oj6TdKBMrnHy
         080w==
X-Forwarded-Encrypted: i=1; AJvYcCVdsSK5GGO6TLfw1T8Ri3V358P443PM/FXB3LblTzhZYGffXx8ZlnKgK+d8kIIu4eJG8rR35l01zTGdjfePS9/fTVoyrTCw
X-Gm-Message-State: AOJu0YyO9kN1Ct3yE5KtkjEaYaw18HouusRiB4+tcWQmFkHl7gLqptBx
	gLMOJMV9bF36x0qaYIbOukn6vg9YxEumRFx3ljLEycpqeEA20uJMcha4EkaLWPkCSzx2Br5PJLn
	q590=
X-Google-Smtp-Source: AGHT+IEf8Q7/4W0fWIddamgDNe4FKal2aZCyI1xTaFnY6BC1hm07senB8BqZybM4OGwy4Hi05KU6Ag==
X-Received: by 2002:a05:6358:478e:b0:19f:5a42:d2bd with SMTP id e5c5f4694b2df-1b393282954mr1606058055d.22.1724041283597;
        Sun, 18 Aug 2024 21:21:23 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.103] ([191.205.40.123])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127ae669b7sm5891811b3a.88.2024.08.18.21.21.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2024 21:21:23 -0700 (PDT)
Subject: Re: [PATCH 1/8] hw/pci-host/designware: Declare CPU QOM types using
 DEFINE_TYPES() macro
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20231012121857.31873-1-philmd@linaro.org>
 <20231012121857.31873-2-philmd@linaro.org>
From: Gustavo Romero <gustavo.romero@linaro.org>
Message-ID: <2f3df725-0d99-97d0-af7b-7054036e4228@linaro.org>
Date: Mon, 19 Aug 2024 01:21:19 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20231012121857.31873-2-philmd@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: v6OEuKn+7xYs

Hi Phil,

On 10/12/23 9:18 AM, Philippe Mathieu-Daudé wrote:
> When multiple QOM types are registered in the same file,
> it is simpler to use the the DEFINE_TYPES() macro. In
> particular because type array declared with such macro
> are easier to review.
> 
> Remove a pointless structure declaration in "designware.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/pci-host/designware.h |  2 --
>   hw/pci-host/designware.c         | 39 ++++++++++++++------------------
>   2 files changed, 17 insertions(+), 24 deletions(-)
> 
> diff --git a/include/hw/pci-host/designware.h b/include/hw/pci-host/designware.h
> index 908f3d946b..c484e377a8 100644
> --- a/include/hw/pci-host/designware.h
> +++ b/include/hw/pci-host/designware.h
> @@ -31,8 +31,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(DesignwarePCIEHost, DESIGNWARE_PCIE_HOST)
>   #define TYPE_DESIGNWARE_PCIE_ROOT "designware-pcie-root"
>   OBJECT_DECLARE_SIMPLE_TYPE(DesignwarePCIERoot, DESIGNWARE_PCIE_ROOT)
>   
> -struct DesignwarePCIERoot;
> -
>   typedef struct DesignwarePCIEViewport {
>       DesignwarePCIERoot *root;
>   
> diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
> index 6f5442f108..304eca1b5c 100644
> --- a/hw/pci-host/designware.c
> +++ b/hw/pci-host/designware.c
> @@ -746,28 +746,23 @@ static void designware_pcie_host_init(Object *obj)
>       qdev_prop_set_bit(DEVICE(root), "multifunction", false);
>   }
>   
> -static const TypeInfo designware_pcie_root_info = {
> -    .name = TYPE_DESIGNWARE_PCIE_ROOT,
> -    .parent = TYPE_PCI_BRIDGE,
> -    .instance_size = sizeof(DesignwarePCIERoot),
> -    .class_init = designware_pcie_root_class_init,
> -    .interfaces = (InterfaceInfo[]) {
> -        { INTERFACE_PCIE_DEVICE },
> -        { }
> +static const TypeInfo designware_pcie_types[] = {
> +    {
> +        .name           = TYPE_DESIGNWARE_PCIE_HOST,
> +        .parent         = TYPE_PCI_HOST_BRIDGE,
> +        .instance_size  = sizeof(DesignwarePCIEHost),
> +        .instance_init  = designware_pcie_host_init,
> +        .class_init     = designware_pcie_host_class_init,
> +    }, {
> +        .name           = TYPE_DESIGNWARE_PCIE_ROOT,
> +        .parent         = TYPE_PCI_BRIDGE,
> +        .instance_size  = sizeof(DesignwarePCIERoot),
> +        .class_init     = designware_pcie_root_class_init,
> +        .interfaces     = (InterfaceInfo[]) {
> +            { INTERFACE_PCIE_DEVICE },
> +            { }
> +        },
>       },
>   };
>   
> -static const TypeInfo designware_pcie_host_info = {
> -    .name       = TYPE_DESIGNWARE_PCIE_HOST,
> -    .parent     = TYPE_PCI_HOST_BRIDGE,
> -    .instance_size = sizeof(DesignwarePCIEHost),
> -    .instance_init = designware_pcie_host_init,
> -    .class_init = designware_pcie_host_class_init,
> -};
> -
> -static void designware_pcie_register(void)
> -{
> -    type_register_static(&designware_pcie_root_info);
> -    type_register_static(&designware_pcie_host_info);
> -}
> -type_init(designware_pcie_register)
> +DEFINE_TYPES(designware_pcie_types)
> 

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>

This patch can get merged independently of this series.


Cheers,
Gustavo
