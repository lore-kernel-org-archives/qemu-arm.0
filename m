Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3023098lfm;
        Mon, 13 Jul 2020 00:10:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxr27PWDsQWykHgXlijFactAhhxbGeM/oR6XmQr+aMu4DgVvE4khqrxWlNMF3M1eT+g9TUB
X-Received: by 2002:a25:cdc2:: with SMTP id d185mr122651829ybf.87.1594624237299;
        Mon, 13 Jul 2020 00:10:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594624237; cv=none;
        d=google.com; s=arc-20160816;
        b=BuseR6I2yyWLTFoZaM03kI2iyw16ifTMusbX+kpffvLQKKp9bpWYBzLcUsknPI6EYO
         4sqxBBOJt0Ei9Ly73l22BofRKlD8yyrticqlXblyIL9YvvCg5iJ6GuwoKQTES7frv/RK
         gD3mV4ybZ9nAMw1HvLlF+qPYQ0O2Ey/unjuXKDgHXVA8nKC4I8wD7y5nPX6AkD3Q/I/0
         lbP/bfeH5jcibFeSNfRTa12eCg/VJ/G4UZ+9P1Hfn8VIoZfw1X8jP1l294xxu10bzcl1
         LfReaJrx1/bv9FYmOPoSha+ReLwkWyZdhYlLruZA6/iaOH2G09GqCDiN4VQYoD0ElTib
         PyKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=2kVPyehwXiqzXAvzJ1YSUYRhK6jAQhbVtDkgv9Y7DOM=;
        b=Q0mT8B9BDMD4D52ypTv6peSfSxX/4+HhLYrV2Z/MPllKpAuSz3MZQs8XEV6LkodYXe
         XxR7uXUMBALHDbEGRWbjpcprKPIGV2Qpudwt6RoIcBgPZwIKSJVJBuLFuaylfySUTk6j
         lwPHZ1sLjjZAGGVVuVgQpd00dKK1iCpSHKLKGcP6XGiWIVBULVUMNd+A3qykhHbEXMc+
         lL9xLaQGN5qz46PeUFAzmA29FLgSOTimsLqO6qLB4W4xvvoj6qQWoPZtJsdwJXv3rHQv
         FsVV02UPCAbIIg2ZzLhX4lhIKESTBslSg49WATXx2f+aaZC+P5bFTfK1BD1yLlnrV2vO
         kkMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=E5vu+Dxo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a11si14854296ybp.411.2020.07.13.00.10.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jul 2020 00:10:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=E5vu+Dxo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:60340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jusbk-0000Tu-OE
	for alex.bennee@linaro.org; Mon, 13 Jul 2020 03:10:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jusbd-0000Tj-Vf; Mon, 13 Jul 2020 03:10:30 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:46815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jusbc-0005NZ-6m; Mon, 13 Jul 2020 03:10:29 -0400
Received: by mail-wr1-x444.google.com with SMTP id r12so14407504wrj.13;
 Mon, 13 Jul 2020 00:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2kVPyehwXiqzXAvzJ1YSUYRhK6jAQhbVtDkgv9Y7DOM=;
 b=E5vu+Dxo4zduD8FYA5n+cGC/abJvHgZSJvC8pWAesozRqvGKxVM04Y0WDscboxYrWp
 nTC/mpSehxc0AYSA8ZTjcmrJh3UcPogrIQdnIt2vfAnNGpCWBvw7brP3ysK50quANThM
 wBLDQyGtJZjVkMoCUaE3VWwM5W7eZQDGuSSNE0xOGphdC/NICrxC6xjnpzxV9qRC3K/L
 rNtnjjl73uXoKObPHcVieSvJKSSKOieLx+SQQeIRa/olPM+echoW8mMod96/LexLwEel
 O46hX7xQkCn1CtpGXB4kRvr9mzGJsVMrKvp18xbFeRfapdAUIXbZRuTpjcYifXyqePak
 jhcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2kVPyehwXiqzXAvzJ1YSUYRhK6jAQhbVtDkgv9Y7DOM=;
 b=FxSM/lHnaFCjs7F/3n+BQZiKcqa9aLN5K26H5yfAfdzw1c/qTS880QdUwd+sfLxCY5
 knPTX7bd6zpt2jM50/Kfvcqlbqqbv3QQvWJNnS1GOXdejSU5Kz1DBU9vhVOVbY864viM
 z/mLaUwaBubS4FkMew69ngPadmBiZhzjkRuMKbXRwliOloMgVcTkJt/tWK8RAiYDTh+K
 6LBpB4MqXSHuEPUnCZG+6ctfRhWbfU99FrtG6nM9HhHzUsu4NKkQXam6p4AOpQEyQal8
 +OzzB8lqCPYV7mNAphtxdU6/QUvumf3vCqejXZMs+vUvMsupox+BdvxQaT93I1TECx/z
 K0+w==
X-Gm-Message-State: AOAM5319uIz/yOAsw+tSCBhoS321xM77YJHit53KTJPyw3pK/moV/DXC
 OcRKDRVzO7PqqSNwPnp8w50=
X-Received: by 2002:adf:ef46:: with SMTP id c6mr78403709wrp.34.1594624226063; 
 Mon, 13 Jul 2020 00:10:26 -0700 (PDT)
Received: from [192.168.1.37] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id w128sm21932387wmb.19.2020.07.13.00.10.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2020 00:10:25 -0700 (PDT)
Subject: Re: [PATCH] docs/system/arm/orangepi: add instructions for resizing
 SD image to power of two
To: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-devel@nongnu.org,
 f4bug@amsat.org
References: <20200712183708.15450-1-nieklinnenbank@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6f9d58ba-70bd-0ee9-2fd3-4a804f4d405b@amsat.org>
Date: Mon, 13 Jul 2020 09:10:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200712183708.15450-1-nieklinnenbank@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cewCV3fkWsRJ

On 7/12/20 8:37 PM, Niek Linnenbank wrote:
> SD cards need to have a size of a power of two. This commit updates
> the Orange Pi machine documentation to include instructions for
> resizing downloaded images using the qemu-img command.
> 
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---
>  docs/system/arm/orangepi.rst | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/system/arm/orangepi.rst b/docs/system/arm/orangepi.rst
> index c41adad488..6f23907fb6 100644
> --- a/docs/system/arm/orangepi.rst
> +++ b/docs/system/arm/orangepi.rst
> @@ -127,6 +127,16 @@ can be downloaded from:
>  Alternatively, you can also choose to build you own image with buildroot
>  using the orangepi_pc_defconfig. Also see https://buildroot.org for more information.
>  
> +When using an image as an SD card, it must be resized to a power of two. This can be
> +done with the qemu-img command. It is recommended to only increase the image size
> +instead of shrinking it to a power of two, to avoid loss of data. For example,
> +to prepare a downloaded Armbian image, first extract it and then increase
> +its size to one gigabyte as follows:
> +
> +.. code-block:: bash
> +
> +  $ qemu-img resize Armbian_19.11.3_Orangepipc_bionic_current_5.3.9.img 1G
> +
>  You can choose to attach the selected image either as an SD card or as USB mass storage.
>  For example, to boot using the Orange Pi PC Debian image on SD card, simply add the -sd
>  argument and provide the proper root= kernel parameter:
> @@ -213,12 +223,12 @@ Next, unzip the NetBSD image and write the U-Boot binary including SPL using:
>    $ dd if=/path/to/u-boot-sunxi-with-spl.bin of=armv7.img bs=1024 seek=8 conv=notrunc
>  
>  Finally, before starting the machine the SD image must be extended such
> -that the NetBSD kernel will not conclude the NetBSD partition is larger than
> -the emulated SD card:
> +that the size of the SD image is a power of two and that the NetBSD kernel
> +will not conclude the NetBSD partition is larger than the emulated SD card:
>  
>  .. code-block:: bash
>  
> -  $ dd if=/dev/zero bs=1M count=64 >> armv7.img
> +  $ qemu-img resize armv7.img 2G
>  
>  Start the machine using the following command:
>  
> 

Thanks!

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

