Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1947204njf;
        Sun, 18 Aug 2024 21:21:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUDpLFUhuaVoZ7vwsd+8Z10rP5rjlsViRBM+rpbSJb+obRquaqwjrszGxkN+0yaG9ukp7AbKgObXSVa1F6kPAbc2lGCHItt
X-Received: by 2002:a05:6a20:9f05:b0:1c6:fca9:85b with SMTP id adf61e73a8af0-1c9050281a1mr8994446637.43.1724041298859;
        Sun, 18 Aug 2024 21:21:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724041298; cv=none;
        d=google.com; s=arc-20160816;
        b=daHaIwIIfT+rhOn9e0diz++ifz3b+aV6MAIVylBZVZ8yOxAQudk8+Tab5tFlR9uDwA
         9L4Ijw59wLy5ttzsoB88i58xeMxTWidTtxd5wDCp9++xbzwZLVjBWG3v/p6oGZ+PD2+j
         wFlVos8hHzozLHXMgd9Vfq/B9xmxUdAO/ab9bzGCznCGZCJdZAKSnrC44yJDXcgxH8ik
         ygsJ7ra42QNXskzkpo1/kJ87pbsoMFF2bGwDOA81L/vULoGjP0XNALIoeWIcgmd37Yy6
         W5KGMlZUilbAUTw/+Wkb+BqdFIDVOOFlW9v654iNP8sRHkFpfaZHmkKSHkiSwlodo/8P
         4L0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Ey2/XL3x4dsLSO0Rau9u/e+UZKi3H/ZDUx6iNciV5G8=;
        fh=BqV7Qj9dUoJPGff604rLDU/iZMkp0KYcfVXB9aetytw=;
        b=h5oxAYt3doQUNQmbQkTp2NX56+SxrR/7EVERLlwvOvTkpCaZpkePmwZ6LSoRXzMxv1
         1xkpFmtA7hxGsyFrrrOm76rpvTwl+ERriUSIHeZsb6lx65AAKtqa4CoJ3gyQ758C+QnP
         6/r9QguOV4E9fpY24AtSrqD5JzCXWW5nY8jBprgxxYhB6o10mNCWvqH9OwBIcoIcvmWR
         5vW/u9DaRxr3UhALZtaXKHWtPnwhn8SQI11i/sZBZwajyd9CbCSKXIVo2CI5P191SRSh
         e7afAPiMqlTWU0NzPMc4BeKxDULUHzUIOIiC1Jh1KVP/ZFEUka5dzdLmtA5Yb9j4YNGG
         xptg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o0anYDu0;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-201f039ec99sor60797275ad.13.2024.08.18.21.21.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 18 Aug 2024 21:21:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o0anYDu0;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724041298; x=1724646098; darn=linaro.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ey2/XL3x4dsLSO0Rau9u/e+UZKi3H/ZDUx6iNciV5G8=;
        b=o0anYDu0JUjx7gqddG2Wv0e1VnArobQPm2fy/nnBZ1K5fP7F8N9pV1KMGWgt5Zf0/1
         cIe3zkhmUEvQtzAcdRvWgvZcBTEE/3BY6V+ZHFejLkb27q7DZ7c5jnovOmZQSmQgDaph
         PZ1CtnQ/ytqiIc4QyEfpeku5ww3cls5bCjYMoRVqvBFljo8jNXaL6ragzgt0hYR3KAH3
         +mkdOAcSPjz/jFEQnxpY9aquPSgCq3RRlH8VRD719oxnT9EpYgX9fq+AMGFn7TD3SH2n
         cNOyv+8ERbVRtEA2N/+dAyL3d78AD8eC6H8P16wN19jrWtjndWYrPCMLJJu+fS7cEpFt
         oIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724041298; x=1724646098;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ey2/XL3x4dsLSO0Rau9u/e+UZKi3H/ZDUx6iNciV5G8=;
        b=vmBD/zfFn7+2KqRJbgVcgvKIEkLpPk8ViNH1os27+P8wqvTrIClcWvf0j3jUfPCk+8
         7iBe8ekfeLK247vIblR1RX14srWubLNb8wx5GI+oHqg/rjfJbCumu5CiHt2pr8vsCMb4
         JQz0kbRSahThX0AsKXmMXl/DEFwK2+E9eaFE5xP3G+6njH6DpP5C+KSIy6xjKwFDb936
         pyK/3bWSFZ+eyoT/rOnifqkFemzCoRR0Xy3cFy6pHrHiI4m3WeOa+o+OPZv1m3imcMYh
         9YETmu1FfyZ07dRUlBXpucwl7eo865DcxazE5n+Bk9OyyPLDLgBt55Q7zd7BZRfICtjp
         9nGg==
X-Forwarded-Encrypted: i=1; AJvYcCW2RaeUg3Q/1o0fI02Pr/zLmfbumoNxaiJVJe34VRnzsGgqyHRV5KcnVXOZINyS6piqA376qL8d9ICfM98UrPI4QnbahtQ+
X-Gm-Message-State: AOJu0YyY07t7hCVgExZnsEjX0fzMe15v404dmrYP6eNq2gKmaDoqrU39
	GnGs/ehUCCdyjm3YLBlq5IjL7a3rjlgStJwXzC+X8BH/KQXikv1X51FN2du+Od/3+xEng7HJus5
	6Vwc=
X-Google-Smtp-Source: AGHT+IHwa6X2nceJCtPoVJnBuO4GBi+E1eKkqPaAi+Og+jHn2va1DEatQSTNbVhbUPQlkkec2GjeUQ==
X-Received: by 2002:a17:902:ccca:b0:1fb:1afb:b864 with SMTP id d9443c01a7336-20203e4a727mr104783795ad.5.1724041298061;
        Sun, 18 Aug 2024 21:21:38 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.103] ([191.205.40.123])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f03a1974sm55998565ad.276.2024.08.18.21.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2024 21:21:37 -0700 (PDT)
Subject: Re: [PATCH 2/8] hw/pci-host/designware: Initialize root function in
 host bridge realize
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20231012121857.31873-1-philmd@linaro.org>
 <20231012121857.31873-3-philmd@linaro.org>
From: Gustavo Romero <gustavo.romero@linaro.org>
Message-ID: <16a3fd1e-09a9-87d8-5e63-d7c3ab5a48b7@linaro.org>
Date: Mon, 19 Aug 2024 01:21:34 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20231012121857.31873-3-philmd@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: zmH9AkDKN/Mt

Hi Phil,

On 10/12/23 9:18 AM, Philippe Mathieu-Daudé wrote:
> There are no root function properties exposed by the host
> bridge, so using a 2-step QOM creation isn't really useful.
> 
> Simplify by creating the root function when the host bridge
> is realized.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/pci-host/designware.c | 15 ++++-----------
>   1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
> index 304eca1b5c..692e0731cd 100644
> --- a/hw/pci-host/designware.c
> +++ b/hw/pci-host/designware.c
> @@ -707,6 +707,10 @@ static void designware_pcie_host_realize(DeviceState *dev, Error **errp)
>                          "pcie-bus-address-space");
>       pci_setup_iommu(pci->bus, designware_pcie_host_set_iommu, s);
>   
> +    object_initialize_child(OBJECT(dev), "root", &s->root,
> +                            TYPE_DESIGNWARE_PCIE_ROOT);
> +    qdev_prop_set_int32(DEVICE(&s->root), "addr", PCI_DEVFN(0, 0));
> +    qdev_prop_set_bit(DEVICE(&s->root), "multifunction", false);
>       qdev_realize(DEVICE(&s->root), BUS(pci->bus), &error_fatal);
>   }
>   
> @@ -736,22 +740,11 @@ static void designware_pcie_host_class_init(ObjectClass *klass, void *data)
>       dc->vmsd = &vmstate_designware_pcie_host;
>   }
>   
> -static void designware_pcie_host_init(Object *obj)
> -{
> -    DesignwarePCIEHost *s = DESIGNWARE_PCIE_HOST(obj);
> -    DesignwarePCIERoot *root = &s->root;
> -
> -    object_initialize_child(obj, "root", root, TYPE_DESIGNWARE_PCIE_ROOT);
> -    qdev_prop_set_int32(DEVICE(root), "addr", PCI_DEVFN(0, 0));
> -    qdev_prop_set_bit(DEVICE(root), "multifunction", false);
> -}
> -
>   static const TypeInfo designware_pcie_types[] = {
>       {
>           .name           = TYPE_DESIGNWARE_PCIE_HOST,
>           .parent         = TYPE_PCI_HOST_BRIDGE,
>           .instance_size  = sizeof(DesignwarePCIEHost),
> -        .instance_init  = designware_pcie_host_init,
>           .class_init     = designware_pcie_host_class_init,
>       }, {
>           .name           = TYPE_DESIGNWARE_PCIE_ROOT,
> 

I could not find any mention in the docs recommending the use of
init/realize pair only when properties could be consumed. Anyways,
you agreed with Peter's comment (I agree too), so I understand this
patch will be drop since it doesn't affect the other patches in the
series.


Cheers,
Gustavo
