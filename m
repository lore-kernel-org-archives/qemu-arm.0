Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1947255njf;
        Sun, 18 Aug 2024 21:22:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWCv6HXy1HsjbQwzmvwykLkAR+uKhcmDURj2jxeNLQNJGTgu31GgGmMqYGas26gybMg8Aw46/IH+CAk2GnelSj5kLYx7Hio
X-Received: by 2002:a05:6358:189:b0:1ac:f4a9:45 with SMTP id e5c5f4694b2df-1b393126159mr1423404955d.3.1724041321783;
        Sun, 18 Aug 2024 21:22:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724041321; cv=none;
        d=google.com; s=arc-20160816;
        b=Wvo1EyPIj37JiRPuRcRWIV66bi2j1CPm/Gy3zG9fidnK/uUOV7PFyIbpFhOUbc2kPO
         Enw0rDwT2ZDeCUKbAOy1qm7w1ibpcRPVPQ4HlF0SsHGDt7sv+WQwaUitqYi42oFjoa9F
         s2ZlO6JiWTUfxOMvItd/Og01fSu3vu4n3wZLgSqltdEf3Kj10CPR8i1ahPP1FO15xgsa
         Tkt6Ucv3BTZ0wa5Y9Jb3j2L0u6hBw75Yy7FS1EkITEeYM7+7rlxl+yPHtARl4urcLa+Y
         n7Ka9dv4/0AKVX0ZvkCBV3PXYApaVy6oJVUAlHQWfK4mdRB9lhGOo8sEtvoKyqSS5jWJ
         R5DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=N2LjqyCT6rO7vXKqOxfsdOjN6oNqGyfd9gAZ6OyDIX4=;
        fh=5UwGUpN155kjW4M8Dc4+O5GajS5THBs541b8PcDbr8s=;
        b=Llr704zGnsIa3BR/uABtf72eNlXyYoirwQ+nQk4HJRX6VUpTImiHXHG3xAlcSwb7CY
         tb+YCOCelSB1gH8WwHgwJ+jlHW19dSE/2jmv22g7Le+1wqWLqX7tgmRPTHJRx3iWtKsR
         7qn7oEWKgPcgfwLJjQhpyjn0FDdJ2/Orbu3od6FIi69IB9K0+tF+kAeVCd/pxXXtrMFn
         BwHJQZtaH1PCNQPovunFrbUTfYhfOHJwXVlXBIccZm3pfPfoHNML6V/Qr6ke8T2+SUim
         +8au/apmYdiKMaHfZNQ/6p3EK6I7S0HKXqYYy+6wmrnSKf0Ya9fncU9etR5efpf72UAT
         0QXQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T9OJ9RDP;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7127af48d2bsor6245031b3a.10.2024.08.18.21.22.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 18 Aug 2024 21:22:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T9OJ9RDP;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724041321; x=1724646121; darn=linaro.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N2LjqyCT6rO7vXKqOxfsdOjN6oNqGyfd9gAZ6OyDIX4=;
        b=T9OJ9RDP/H0CdtLHNZuNVJSb5YftQtNH0xmln6ZdW4RC0v2HXun01Txlv0BUQ5HHqu
         gzI7rKToEma0y4+JN6KzmKxWYOAdUZ97hgFFxMk/TIa4nfSD9nHCzMLydYSm5Y8SZges
         WH/W4ntr8j2nRMUrB6C0xaoYXKmF3puOA4CV1+lsvGOgIZ+rQupnlgPdAS0FucObJGLP
         +pus09IEZ8o/juxKuXVr8KdIKGr88E/zjNKAAja+EpTwNcYuh21ERZ59lD0FXXeQIGlH
         SPVV+VySOjKEQEVXH4ZHJ3V0bid/2qOCnTehlxaT64teOjlxGd7IPTyGQ2waFzSDWH8a
         AU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724041321; x=1724646121;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N2LjqyCT6rO7vXKqOxfsdOjN6oNqGyfd9gAZ6OyDIX4=;
        b=jqJHYUESKTb13VIIx/Sw78HL30FlJ0cXzRnDAYbR8+t8l8Euev7g5Wsuer5IlvwSxT
         6MN99yls7Th9wTvS3ONSlNrGTG1IpOXs+Y0Y3Kq7Y37eTLbKeLzqC+a68qZH0RV9t1LA
         jBXKJQ06Gu8JetPbyjgWd54VRVvFkNwHL4H9+TsWvEb4V06ThGFGXmyOmq8lmkjHzVTJ
         DbD859sF1qIC+oi3tUUmb8KPQ9QwwJJZx4prhj3svVOVv+Jrl0fLeh0OuWbnjPpgh9Dc
         W1oo5uI2tFbSwSj0ZlVQEP8DHpq3dYuTyHjEFkeiDYDKRJwgaffEk+7SUcSBk1S1d5FM
         lovw==
X-Forwarded-Encrypted: i=1; AJvYcCVqMbEgYCG78hSuLRjWeEjQNYeop6Uo6M3mfI1h2TG2zW/Q1/mmnzYufA+FRktMWiClssPSaIZbFl5aleQOTOst62Vqv90p
X-Gm-Message-State: AOJu0YzVJyqse7/uB4ZSuC+s3w6kmptH40e4xpgDS3Y5Wd7MLjrOmMl7
	tzfyB4vOKF+azJ0Z80iE8fObfiD/8IcYPYPr+PwVR7F7d/wNnQ2YWv81XIhVporfrY0aGCZ0Kw9
	3Z8Y=
X-Google-Smtp-Source: AGHT+IHSX27sB8DHDWkIkw2eQlMfE3gQff9rMsJZ84bYGwem25J29O3Cq8ub6RLjX41byKESgFazOQ==
X-Received: by 2002:a05:6a20:d706:b0:1c4:d540:46c with SMTP id adf61e73a8af0-1c905052b1bmr9489800637.47.1724041320746;
        Sun, 18 Aug 2024 21:22:00 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.103] ([191.205.40.123])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f03a4c33sm55920265ad.284.2024.08.18.21.21.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2024 21:22:00 -0700 (PDT)
Subject: Re: [PATCH 3/8] hw/pci-host/designware: Add 'host_mem' variable for
 clarity
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20231012121857.31873-1-philmd@linaro.org>
 <20231012121857.31873-4-philmd@linaro.org>
From: Gustavo Romero <gustavo.romero@linaro.org>
Message-ID: <97ea999c-38a6-36d4-ce78-e3b0793b8572@linaro.org>
Date: Mon, 19 Aug 2024 01:21:55 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20231012121857.31873-4-philmd@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: JhRL8OHSvAEp

Hi Phil,

On 10/12/23 9:18 AM, Philippe Mathieu-Daudé wrote:
> designware_pcie_root_realize() uses get_system_memory()
> as the "host side memory region", as opposed to the "PCI
> side" one. Introduce the 'host_mem' variable for clarity.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/pci-host/designware.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
> index 692e0731cd..bacb2bdb2d 100644
> --- a/hw/pci-host/designware.c
> +++ b/hw/pci-host/designware.c
> @@ -393,6 +393,7 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
>   {
>       DesignwarePCIERoot *root = DESIGNWARE_PCIE_ROOT(dev);
>       DesignwarePCIEHost *host = designware_pcie_root_to_host(root);
> +    MemoryRegion *host_mem = get_system_memory();
>       MemoryRegion *address_space = &host->pci.memory;
>       PCIBridge *br = PCI_BRIDGE(dev);
>       DesignwarePCIEViewport *viewport;
> @@ -433,7 +434,7 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
>           viewport->cr[0]   = DESIGNWARE_PCIE_ATU_TYPE_MEM;
>   
>           source      = &host->pci.address_space_root;
> -        destination = get_system_memory();
> +        destination = host_mem;
>           direction   = "Inbound";
>   
>           /*
> @@ -458,7 +459,7 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
>   
>           destination = &host->pci.memory;
>           direction   = "Outbound";
> -        source      = get_system_memory();
> +        source      = host_mem;
>   
>           /*
>            * Configure MemoryRegion implementing CPU -> PCI memory
> 

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>

This patch can get merged independently of this series.


Cheers,
Gustavo
