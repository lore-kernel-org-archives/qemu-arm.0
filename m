Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp366301lfo;
        Wed, 3 Feb 2021 08:28:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz65lSt8lEDNAT0WS4UcvTN8WvEkGkQoh8Bf5ojGJx/e2rYvCiEVq6H4kVHdTYUtcw41kdY
X-Received: by 2002:a17:906:1be9:: with SMTP id t9mr3917168ejg.527.1612369733388;
        Wed, 03 Feb 2021 08:28:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612369733; cv=none;
        d=google.com; s=arc-20160816;
        b=Dkp8GKRIUsiyv2GaUc5V8f0L1C38cjPQ7vUnp1UfO2opZWW/15kmjvQIy7vu9a47l7
         y9Si0gW837vEeptfWVXZVQrAQ9P9n36T2Ie2rxbkHk6S1o1X+oHFxFb3IkQ1n3lTFggg
         G8AHM7po9zdOiQAddBiAMK/h4S7vStaogOp34tSN5wL5Y7p7SGI4DS9S+DHHcjL3aAFk
         Z1cp56t1ZLNuEhHhGFkzuLAA3FFjq85OGdufvCuaIO5YzAfnNIcOc7pDUB5Xy4Xi9IfP
         QkNWIS6DnnwmrDZHJGtnce7z7EXx0JC47cE9ZDfpRME/+RRxt34Vjo7N3iORmyJ+58Jq
         +6Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=F4dzqpMy4aY/dm//+IODxm7tdTyHiGWfHPu341Rpufc=;
        b=lgMJ9MZX6uZ5JJX2YH55pKSnrS51lGaGFksI8wdGbGGtJRzXA+j2PDmLUNGiG15mIr
         G5hFsML4FJvCLlkoQ9+0BEiLQpfl60hdXSxGb/4uXm+TEEzniP7GnqHlnvegQ/W8JbXT
         UDd+vWJGoupc5PtSVciMqn9SH4pym6BP5amuh/2XlqAIEeYT/DDAJDDc45Tqa6s+yFXQ
         p2yDOeG8gVSFcVgHShx0CWQB4EQ87zyXpe+ys0sjWeYU4awvW9Ia4qaBW07uPvrTA0Ag
         mn79wo/Shc6Loop/f+/wQtYAFosZfBxOv3P/aVJFBSiwSyVm7ad3qCVfrTJyssGRhtGZ
         3vMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E+5890bz;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id 91si1638919edq.378.2021.02.03.08.28.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Feb 2021 08:28:53 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E+5890bz;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612369732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F4dzqpMy4aY/dm//+IODxm7tdTyHiGWfHPu341Rpufc=;
	b=E+5890bzCBca/0eYjkYaD1JkyYHJVdl2c95D3TEGf/v8jn/sZXLjHdiNhbm0wUAszkVacg
	MxjuOFUJ90CkyKliB3Tb+WVOxhsdkykofxLW2wDbOJPmBB1O8Sl/ImNXH+H7vwL+KOiWSN
	dp8VTDkTXuUnOIjPsMQdRzbMjFqEnFI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-U9Y4aZDtNuOoUYNofBsDeA-1; Wed, 03 Feb 2021 11:28:50 -0500
X-MC-Unique: U9Y4aZDtNuOoUYNofBsDeA-1
Received: by mail-ed1-f70.google.com with SMTP id i4so105543edt.11
        for <alex.bennee@linaro.org>; Wed, 03 Feb 2021 08:28:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=F4dzqpMy4aY/dm//+IODxm7tdTyHiGWfHPu341Rpufc=;
        b=dD6ZuvtmGhCEyiQFy3AdjVdyd7BJgbbXXEMFbwSOg+S1s4ZlvxK1/XCh91ZEroAiP+
         8884TNtGRbcv/u5kcGDB7wDQSLAjRKdeQc4bzrj5I3sV6rif1QgpLRCrLP/mYA5RZI2L
         u33zmXP91R4hyylwagIZz+K2mO0KG0phrbGo6AB6A4hUcbaBY8AQmmsp0Ot+hdBpcYNX
         45WRRjvJqrct2/ezlydyr0NEX4cyp/l9t4/En90UlHdyMLGvbOqoF90Vou/R/S+JMcHb
         gDcUZv9D0RgFUZ5IRvGTj7O65hvbnMLzsHUaXiWR8JRYyRgmQiuXotcmjtM7jzXjWvFJ
         o0Yg==
X-Gm-Message-State: AOAM530upRkvmE36tgvp7LSYwiXMC1dlA0MHzxRU9cN9pgokXhalinRI
	kytfvhOM8ae0Hk/mEg1P1C8UGCNlULsf/ly5T61dUjq0GzdGmqshr5aBKaJCLeNVpjm9ty4IbRN
	6oBPQNPjq1+zTAMOE
X-Received: by 2002:a05:6402:318e:: with SMTP id di14mr3795552edb.223.1612369729706;
        Wed, 03 Feb 2021 08:28:49 -0800 (PST)
X-Received: by 2002:a05:6402:318e:: with SMTP id di14mr3795535edb.223.1612369729531;
        Wed, 03 Feb 2021 08:28:49 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net. [83.59.163.107])
        by smtp.gmail.com with ESMTPSA id f22sm1211698eje.34.2021.02.03.08.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Feb 2021 08:28:48 -0800 (PST)
Subject: Re: [PATCH] docs/system: document an example vexpress-a15 invocation
To: avocado-devel <avocado-devel@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Anders Roxell <anders.roxell@linaro.org>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20210128185300.2875-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5e83921f-9287-5d93-3051-6065232bb357@redhat.com>
Date: Wed, 3 Feb 2021 17:28:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210128185300.2875-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: KalytJSEEOMn

Cc'ing avocado-devel for test idea.

On 1/28/21 7:53 PM, Alex Bennée wrote:
> The wiki and the web are curiously absent of the right runes to boot a
> vexpress model so I had to work from first principles to work it out.
> Use the more modern -drive notation so alternative backends can be
> used (unlike the hardwired -sd mode).
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> ---
>  docs/system/arm/vexpress.rst | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/docs/system/arm/vexpress.rst b/docs/system/arm/vexpress.rst
> index 7f1bcbef07..30b1823b95 100644
> --- a/docs/system/arm/vexpress.rst
> +++ b/docs/system/arm/vexpress.rst
> @@ -58,3 +58,29 @@ Other differences between the hardware and the QEMU model:
>    ``vexpress-a15``, and have IRQs from 40 upwards. If a dtb is
>    provided on the command line then QEMU will edit it to include
>    suitable entries describing these transports for the guest.
> +
> +Booting a Linux kernel
> +----------------------
> +
> +Building a current Linux kernel with ``multi_v7_defconfig`` should be
> +enough to get something running.
> +
> +.. code-block:: bash
> +
> +  $ export ARCH=arm
> +  $ export CROSS_COMPILE=arm-linux-gnueabihf-
> +  $ make multi_v7_defconfig
> +  $ make
> +
> +By default you will want to boot your rootfs of the sdcard interface.
> +Your rootfs will need to be padded to the right size. With a suitable
> +DTB you could also add devices to the virtio-mmio bus.
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-arm -cpu cortex-a15 -smp 4 -m 4096 \
> +      -machine type=vexpress-a15 -serial mon:stdio \
> +      -drive if=sd,driver=file,filename=armel-rootfs.ext4 \
> +      -kernel zImage  \
> +      -dtb vexpress-v2p-ca15-tc1.dtb \
> +      -append "console=ttyAMA0 root=/dev/mmcblk0 ro"
> 
