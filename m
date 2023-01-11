Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4158827ejc;
        Wed, 11 Jan 2023 09:11:04 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvUMQeCG28PlkexAzVWi/4vPJyS3//KDDMm+pacNn49HvZEhkdXm5K2yKVPM/DkKDXacv3V
X-Received: by 2002:a05:622a:4289:b0:3a8:1299:6d3c with SMTP id cr9-20020a05622a428900b003a812996d3cmr105280104qtb.51.1673457064620;
        Wed, 11 Jan 2023 09:11:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673457064; cv=none;
        d=google.com; s=arc-20160816;
        b=CVf+t0VUPtU4EE1FFphKoeaPjyV9zgy0yNwhYa8xKxvVTgXgDqnlqK285sedW0PdaK
         4V0mpmEE4d4dkS0skmvVi4t1k62GOxS/oQl7PyKbOZxSKuG5r8hMuXWgQLAG8kzVy4HE
         pwHzTra5eBoCeV4FyOUkWoB9jRdiU4Q49gR2HcinG53P6oLZtq4C5R+eOE0K2ZciypeI
         OubZv3pr4Ax1LiGhY5+r4ZxGMrIUkcz/1GgOHv9IX5L/as5DaFiOdmsWVfXzCtXduMUW
         oUDBh7DYXKCm96fOEBWI5tlZvq9ZZqF2DAWbHsQ4YmCCUt0CjMRPNBQmmuVaTLqwHWWX
         vA0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=amorKEvFOfebuftjwAEf9dE7eAQj/vV/BDBmuJEWrUI=;
        b=HHz13L9btClZnPxungZZ8CGqVw/RYMtySJLAN84ottAHSzLIk//+c57hlPmSRhuxCk
         bCdzJPrvzUBlXwKwmvTbDPM38Q+DHjg2RY3TfTOVMxuqBRCgqhPcTAx9ECg2jNiTr9n/
         POrePQnPztAXXXZIuPS5Ljd6rnVI33nHKTnw6AQG8eBwPK0WMvB+VIyDCyxE8RGa5fCm
         Vz6UMn2o8oon6dm7y64mc1TMUUaNR1BgaD3obpgKapQA+Vnjuwynm3HhpG4bABoCVLDl
         YKE+ar6Ew/H4gZc4nrZJwB9j+d+ef5JY/HFWw5h9Gv4rfdDp69HasWJVyP26Hubp63vL
         IIpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A+IHlLf2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTP id w26-20020a05620a0e9a00b00705c0face62si4466350qkm.151.2023.01.11.09.11.04
        for <alex.bennee@linaro.org>;
        Wed, 11 Jan 2023 09:11:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A+IHlLf2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFeaa-0001bF-Bj; Wed, 11 Jan 2023 12:08:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFeaY-0001TR-3S
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 12:08:34 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFeaW-0005jb-Ag
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 12:08:33 -0500
Received: by mail-wr1-x42d.google.com with SMTP id z5so14685159wrt.6
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 09:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=amorKEvFOfebuftjwAEf9dE7eAQj/vV/BDBmuJEWrUI=;
 b=A+IHlLf2DVyFIWImIJV0oBRKDmpdznQFTxBuNi23OTq6vIJOngr5SAoTbyGBfMVIbD
 WGL/Lzvz3wmAuBECx7cQB+usLVkX8gXO67wsn6HMwMoF43sWhnemQhUGPrN9mEHnUpoE
 W73DJLV4jQnwd6vKNIy+N69V++7Jb9jCB4YcAFAeaGuVJwsLeLGTAgXKvSZOXf3jrUs+
 r4PtNXxfMFZz8mDrjDCAf/1nwEifDkbbPbo9fFwGWXd9tQQ7p9+GL2/FSeHmJfFus000
 0RPFR6mtiZql4utbJT26dg3LDCkP3N7WovJQyWeFoVayS+CF9oWGMKCm+rvNruymSoFp
 FzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=amorKEvFOfebuftjwAEf9dE7eAQj/vV/BDBmuJEWrUI=;
 b=oM7/oviC0RXdDeUG728V+qApE3263RTVcPbOgeRcX2EUniJDnDIH5woWzYjj9fkrXz
 mc9sqFnSZTlnGkslu2W/aiG0eh7GiexBGSUKcngxVnVGldyg6yXwXGqiNsIez6dH9WMX
 xXp3KFm+MEAqNxQMv/c5OT5oBANnZFRHKS1F6rwM2uqfTtCNkkWmMRoyRK2R1hGzxDmw
 jrmwlfEDxNaBu8x9AvxCojiXLbM88p+lcAbg07sYMZZk7jsEi5+cKUzi9jhKzuWO1UBH
 icsRVIrGa+L/FxriDKghyphlZquf68wiAUBOXAJb6mB8RBIBxP35DPz+KOY15RjzUH9S
 VZww==
X-Gm-Message-State: AFqh2kpxdVzpzsb10K0dt9jQwgBtOwEKYeLXtB4H+uJ68JMoWCAxQSUr
 8v8ifHDnGXbofMw++V73ufD54A==
X-Received: by 2002:a05:6000:1707:b0:2ae:d9e2:7c80 with SMTP id
 n7-20020a056000170700b002aed9e27c80mr21482262wrc.8.1673456910683; 
 Wed, 11 Jan 2023 09:08:30 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l1-20020adfe9c1000000b00289bdda07b7sm13886302wrn.92.2023.01.11.09.08.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 09:08:30 -0800 (PST)
Message-ID: <803306e6-685f-2187-4a35-416e6f5a5134@linaro.org>
Date: Wed, 11 Jan 2023 18:08:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v6 25/33] hw/isa/piix4: Use TYPE_ISA_PIC device
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20230109172347.1830-1-shentey@gmail.com>
 <20230109172347.1830-26-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109172347.1830-26-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: fY0cRmsvfiM+

On 9/1/23 18:23, Bernhard Beschow wrote:
> Aligns the code with PIIX3 such that PIIXState can be used in PIIX4,
> too.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Message-Id: <20221022150508.26830-33-shentey@gmail.com>
> ---
>   hw/isa/piix4.c  | 28 ++++++++++------------------
>   hw/mips/malta.c | 11 +++++++++--
>   hw/mips/Kconfig |  1 +
>   3 files changed, 20 insertions(+), 20 deletions(-)

> @@ -1459,7 +1461,12 @@ void mips_malta_init(MachineState *machine)
>       pci_ide_create_devs(PCI_DEVICE(dev));
>   
>       /* Interrupt controller */
> -    qdev_connect_gpio_out_named(DEVICE(piix4), "intr", 0, i8259_irq);
> +    dev = DEVICE(object_resolve_path_component(OBJECT(piix4), "pic"));
> +    i8259 = i8259_init(isa_bus, i8259_irq);
> +    for (i = 0; i < ISA_NUM_IRQS; i++) {
> +        qdev_connect_gpio_out(dev, i, i8259[i]);
> +    }
> +    g_free(i8259);
>   
>       /* generate SPD EEPROM data */
>       dev = DEVICE(object_resolve_path_component(OBJECT(piix4), "pm"));
> diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
> index 4e7042f03d..d156de812c 100644
> --- a/hw/mips/Kconfig
> +++ b/hw/mips/Kconfig
> @@ -1,5 +1,6 @@
>   config MALTA
>       bool
> +    select I8259
>       select ISA_SUPERIO
>       select PIIX4

The PIIX4 owns / exposes the I8259, so we don't need to select it here.
The Malta board only initializes it. Why did you have to add this?
