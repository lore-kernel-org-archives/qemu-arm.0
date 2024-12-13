Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp490074njb;
        Fri, 13 Dec 2024 06:42:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVjeDKFrOUD9DooLZyJSob+e89h55IDE+Ocol8VayInQcmcsy30MuILUk8783zkZsa2pHtEhf+vvimo8w==@linaro.org
X-Google-Smtp-Source: AGHT+IHaiurarmfoCojFKYUDmgTImdRWqt0++zGXaXj2Xx1MS1GzyGykCxMGPo8sEZgPBzRUYEVL
X-Received: by 2002:a05:6102:3354:b0:4af:f541:912f with SMTP id ada2fe7eead31-4b25dca3a2emr3177247137.10.1734100956889;
        Fri, 13 Dec 2024 06:42:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734100956; cv=none;
        d=google.com; s=arc-20240605;
        b=EE3rt12oPq5Gnt/lWnimitTTdEfJsqw5scYHCZsCOlrTNuHINPDQpEUhhU4SDj79w5
         D/a90Rvz6awHAd3FTtWXsYmHPF2tk0Uy8mpXd/M2oT4xi9hGDUnO+hw06aZ1Nxf8C5yv
         3GUlhVWUyvwpSFgzRCXG9lcKaGphu+hdi7gBAAGr7hAPpOQ8JL9mLjN1p0PaQlvoRKXH
         YL0+xtYWSaEjTeNIXpqn3QIEyi8jCKai7nwr39OxalZUd2b9iRR00ZjyeJNh5XBh2Ueb
         GpaqxHWiIStV5gy4GjSOKVcpILJQZhFxU9q9TdHWNKykjlKgmJCm3SqtkcqeGt5wtRYF
         n47Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=RDeHIIEreHXKHCcb1drZ8YwIdhzp72M3517m8MIhFwI=;
        fh=h8tzzQM5R/QhB5EucukhVdzS35sodFPb8CnxPMnUSTg=;
        b=UuZMJT+f90cPryOMEwvIMlQsVuZTsCwJShlj9YucgEgaA6DAwDAglixyCRGMLIQQ/o
         FFAeoXer4OMRXtCG/fvtLjZ4shNsRtmRwGFDAeN7+9oudUfR+zZ1moQonOHB1+0Yvm7w
         MTijpBMs8CQIo/MjrRlHA4qhwkE842hwD6UfW5uAgQ4h073xg7UusQnGTIpt4ApY3TFP
         6Hihir49ezk8+9m+YL8F3IPgUvziF/ez190S3oounCzo4OPMnPz0qP6yyaxmCTjJg0Yc
         GQuIb2MLu3Er7kYMCswJlm3KyMmzUj+yvyD8pFW7k40WBYxyNfuhKLmmg2pRZUNXvxQL
         4VOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CfABoBSy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4afe39b6d3bsi3365271137.21.2024.12.13.06.42.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 06:42:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CfABoBSy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tM6rZ-0004bX-2G; Fri, 13 Dec 2024 09:41:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tM6rX-0004bB-Jo
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 09:41:51 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tM6rV-0006c1-SA
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 09:41:51 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-38634c35129so1370737f8f.3
 for <qemu-arm@nongnu.org>; Fri, 13 Dec 2024 06:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734100908; x=1734705708; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RDeHIIEreHXKHCcb1drZ8YwIdhzp72M3517m8MIhFwI=;
 b=CfABoBSy1+ommGg3N7HQjKKAUzs4YYmNt3dZM3BpqWgIUjhshf3dh6uwUbt3cMt8wB
 78Qufk9taVp1x7LHswn9s+eX2tqkLPkFnmXQ2Bbmu5DIuisxjZxTWsulSJISxmvVS+vl
 1nnGO8ceIsyTFeRy5XttyG2rMRXO4viHVa340l4JWPtHUY3+fPoRT0sLy3CDS7cTMDFf
 dnGAMIEB/O7z1coMbs5CnJR02kaxHZeXUrnZduKPGuuKAL7RPF7l2XD9GJv3JsBuZA0e
 1/2GAuHNS7VCLKtLGEo62jc6NyE7Af1lKru0+NTc52JEVhnTvGNM7xKtC/11Do0Jp4Ek
 JdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734100908; x=1734705708;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RDeHIIEreHXKHCcb1drZ8YwIdhzp72M3517m8MIhFwI=;
 b=W/ZAQFkBx1bvHpbnZoUJen/NYSFe5B8ez0bipDESgi6mt237efjWBc+KK6QU3OSRFL
 KgoFePdXpXifaX10visyAPe22WMt2tK7Ukzvu287f/JwPhSzmA9Cl7Ce0I7K2sAdY0wf
 /TU+4VcOmmd77MJ9YKiqslP0M/pD/xBIfjynezowvRkPF38nbvQKQ4vA3KO367m/dlkh
 JP4ku4eC7G6z7aMlpvidx9lqjP1Xwzof9zgtVx/4c5TVBCL92ZQcAVCsmHRIe4KlnJXa
 zXFarL4rFms368bBjIKlheLkiEZNRZKaP5c1tsxp1WN6jWU5SxAHfjyGHzTW3eh5sqgf
 +adg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5H+xgv1AUTklSv2B8QtKxxA0OtOZYnmmz4+uxuKsPdwNkVdAVJ44ar7kuawCUiZoJin4IMCB62w==@nongnu.org
X-Gm-Message-State: AOJu0YwoZX/y1zXDJ/n52tSpyOLR5EqcsQR0qN9YNgSv5LZhndpoL+jM
 /3W9EoqeISKdprsEb4YsF2N4LMzSkOdm2H4VIMToWxzvg7IGUe5ZzF21S1govLEZZRCmmjvmQpU
 k
X-Gm-Gg: ASbGnctgUy82pd4/8NQ3DZpiBdk054DLCobD2cW0kImG0jOQU4nqnzpeffOLqegxo7S
 CaxPWmM/+9NVglcBsH47Z77c/phSb+3tz5M6CLITlM88eFah++j7BQc6gtPMl6Q73Gzd/qk5YEs
 rfNwCk+nViT1YL/qnEvTev88oKmxgkF0dmkyxlgoMuOos+dwxG7pxxYi7j/G5kzkPM/XGT6htKE
 mv4jp1XIcmmjNrhujg1BY+B+2WiZTOV9YOL9AYvYn+3WrBAR0isMs/t535zEt4Uc4MwrxY8AOl6
 wrnTwtGSElE+sPtJPCJc2/8oaCfO/w==
X-Received: by 2002:a05:6000:2a5:b0:385:f840:e630 with SMTP id
 ffacd0b85a97d-3888e0b9bc0mr1604943f8f.37.1734100908066; 
 Fri, 13 Dec 2024 06:41:48 -0800 (PST)
Received: from [192.168.69.223] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-387824c5c98sm7221193f8f.58.2024.12.13.06.41.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2024 06:41:47 -0800 (PST)
Message-ID: <b87473d2-d132-42a4-8ca3-aaace8da7bf9@linaro.org>
Date: Fri, 13 Dec 2024 15:41:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] hw/ide/ahci: Decouple from PCI
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20241212110926.23548-1-shentey@gmail.com>
 <20241212110926.23548-2-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241212110926.23548-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: +vgcIznBSceg

On 12/12/24 12:09, Bernhard Beschow wrote:
> In some adhoc profiling booting Linux VMs, it's observed that ahci_irq_lower()
> can be a hot path (10000+ triggers until login prompt appears). Even though the
> parent device never changes, this method re-determines whether the parent device
> is a PCI device or not using the rather expensive object_dynamic_cast()
> function. Avoid this overhead by pushing the interrupt handling to the parent
> device, essentially turning AHCIState into an "IP block".
> 
> Note that this change also frees AHCIState from the PCI dependency which wasn't
> reflected in Kconfig.
> 
> Reported-by: Peter Xu <peterx@redhat.com>
> Inspired-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/ide/ahci-internal.h    |  1 -
>   include/hw/ide/ahci-pci.h |  2 ++
>   include/hw/ide/ahci.h     |  2 --
>   hw/ide/ahci.c             | 39 ++++-----------------------------------
>   hw/ide/ich.c              | 19 +++++++++++++++----
>   5 files changed, 21 insertions(+), 42 deletions(-)


>   static void pci_ich9_reset(DeviceState *dev)
>   {
>       AHCIPCIState *d = ICH9_AHCI(dev);
> @@ -102,7 +114,9 @@ static void pci_ich9_ahci_init(Object *obj)
>   {
>       AHCIPCIState *d = ICH9_AHCI(obj);
>   
> +    qemu_init_irq(&d->irq, pci_ich9_ahci_update_irq, d, 0);
>       ahci_init(&d->ahci, DEVICE(obj));
> +    d->ahci.irq = &d->irq;

Pre-existing, but we shouldn't set this directly.
Does the IRQState belong to AHCIState?

>   }
>   
>   static void pci_ich9_ahci_realize(PCIDevice *dev, Error **errp)
> @@ -125,8 +139,6 @@ static void pci_ich9_ahci_realize(PCIDevice *dev, Error **errp)
>       /* XXX Software should program this register */
>       dev->config[0x90]   = 1 << 6; /* Address Map Register - AHCI mode */
>   
> -    d->ahci.irq = pci_allocate_irq(dev);
> -
>       pci_register_bar(dev, ICH9_IDP_BAR, PCI_BASE_ADDRESS_SPACE_IO,
>                        &d->ahci.idp);
>       pci_register_bar(dev, ICH9_MEM_BAR, PCI_BASE_ADDRESS_SPACE_MEMORY,
> @@ -161,7 +173,6 @@ static void pci_ich9_uninit(PCIDevice *dev)
>   
>       msi_uninit(dev);
>       ahci_uninit(&d->ahci);
> -    qemu_free_irq(d->ahci.irq);
>   }
>   
>   static void ich_ahci_class_init(ObjectClass *klass, void *data)

