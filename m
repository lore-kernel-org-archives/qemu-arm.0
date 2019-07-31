Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5821926wrv;
        Wed, 31 Jul 2019 08:56:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyUJho/j/RToqL2LHzcYv+Ef8UgIaI9OEIjs6sRFzXeYUHNf4k856UPCtu9z9eeSrWnYyEN
X-Received: by 2002:aa7:c999:: with SMTP id c25mr107100001edt.134.1564588616772;
        Wed, 31 Jul 2019 08:56:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564588616; cv=none;
        d=google.com; s=arc-20160816;
        b=GSlcS1BQFnHAHkfa5BQcWuc21I3Ry05XISqA3t+oIT27PQ1lkdbSP6iOojjBqN7YeE
         ZrnZYFdysRnRnLgZzN6VtG/Dsm+5iFh5D+oXBI2ek3BDh7ds3bF2Hp0/9Ezeh95Jmq9M
         k8VbuIywvxX3rw/GcRr/PiDCKOu6o6N4gm2ayMKB+ZpKKt7CHXw+G9Xu3xm0PcW4Bif6
         LuPfzgi0/FFZmoX6xpl5hTGqu1e37WSOiVMPcUDL752itvQmZGc1/673v/Aoj5D7JjGh
         sd3FujqGHR8+YRN+m56tpxFIov87sXRFlQZNVFRprdIJAMh3OE5Aer6RXkHvQsq4jBtS
         +zHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=dqTQPKdQpkPSJiu+poW2tkVf2734swbxwoe9aDlozWw=;
        b=Yx5+K1UHhVOkOK5bcoUTY8Rm1DZttCeGZOjJJZm9E1DZeMFHto+cAaXy8qf/JXX+rE
         z9MKO9ysmvPF9zkregFa0tKbIUqKginiYhsiUly8IJ4XIzQrTBjkl3wAhuxhfjQYKUHf
         MzA5OMsTsZDOuo1MmeEGIENQhiWWF4i9eI7yHr8kqgR9jhX39HYA05NmIFSUKreFNY/a
         4pGvsPl8234Q4vKOb1XqY1OwjdAbiFjdQLZUt/zQ2U4LBIv1ENooJqdKHuxxa8Th6SxH
         ta2oC2LjX90Mmf298FF6i5KdNPDA5OdTyA90XTBt7GYPulGro81ZlxbRt4ZvsoJhgR/s
         EfEg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q18si18869344ejz.39.2019.07.31.08.56.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jul 2019 08:56:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsqyF-0000Fz-SJ
	for alex.bennee@linaro.org; Wed, 31 Jul 2019 11:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36906)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hsqvq-0006yV-4i
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 11:54:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hsqvo-0002mS-6x
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 11:54:25 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54182)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hsqvm-0002kS-C4
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 11:54:22 -0400
Received: by mail-wm1-f67.google.com with SMTP id x15so61397525wmj.3
 for <qemu-arm@nongnu.org>; Wed, 31 Jul 2019 08:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dqTQPKdQpkPSJiu+poW2tkVf2734swbxwoe9aDlozWw=;
 b=CL/wxV0qTqTZGxrIcyTNVISJa/+BfrKoIW7sflSRXf0RsZGbBheh8pIybwH+wEezTz
 FO88FBrJIad2g9FLBHLDQR8iYt3yjIFL577SDMiU5xn17Ns9byUP+x8x0bhHS9RW6Gnv
 djRiTDyY19rMe+BpwFvbYm0tfD8w1tGBZ2WO5n340m9P1uxI6TzkOdwHamcCxgKxt82n
 734GDyiNxP1U5vtVkPrpg1XhxOtxaGy5VfCnHDvjTMvL7KaILFSILQbgIA+VMARMwobK
 uWK5lkKIf4IVHdA3IZPP9mJrDinBYBzbj4zv0mc7vpLQRGGT/F7X46FiHdB+/RRia7ZT
 WEDg==
X-Gm-Message-State: APjAAAXHXZUw7uqTWpsBfwACfbaGxX+oHk5wEPJD7YZ/BTIawXhETKji
 RS/yCV/7vyVSp+eOWYuxXkDKNA==
X-Received: by 2002:a05:600c:254b:: with SMTP id
 e11mr103976662wma.171.1564588459754; 
 Wed, 31 Jul 2019 08:54:19 -0700 (PDT)
Received: from [10.201.33.84] ([195.166.127.210])
 by smtp.gmail.com with ESMTPSA id k17sm90598087wrq.83.2019.07.31.08.54.18
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jul 2019 08:54:19 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20190731075652.17053-1-thuth@redhat.com>
 <20190731075652.17053-9-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <3a635a29-1bcb-04ac-14b1-b0c9981850d4@redhat.com>
Date: Wed, 31 Jul 2019 17:54:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190731075652.17053-9-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [PATCH v2 8/8] hw/core: Add a config switch for the
 generic loader device
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
Cc: qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vX1GTEFy7fJM

On 7/31/19 9:56 AM, Thomas Huth wrote:
> The generic loader device is completely optional. Let's add a proper
> config switch for it so that people can disable it if they don't need
> it and want to create a minimalistic QEMU binary.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/core/Kconfig       | 4 ++++
>  hw/core/Makefile.objs | 2 +-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/core/Kconfig b/hw/core/Kconfig
> index fffb3d62b2..fdf03514d7 100644
> --- a/hw/core/Kconfig
> +++ b/hw/core/Kconfig
> @@ -7,6 +7,10 @@ config PTIMER
>  config FITLOADER
>      bool
>  
> +config GENERIC_LOADER
> +    bool
> +    default y
> +
>  config OR_IRQ
>      bool
>  
> diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
> index bb1afe422a..b49f880a0c 100644
> --- a/hw/core/Makefile.objs
> +++ b/hw/core/Makefile.objs
> @@ -21,7 +21,7 @@ common-obj-$(CONFIG_REGISTER) += register.o
>  common-obj-$(CONFIG_OR_IRQ) += or-irq.o
>  common-obj-$(CONFIG_SPLIT_IRQ) += split-irq.o
>  common-obj-$(CONFIG_PLATFORM_BUS) += platform-bus.o
> -common-obj-$(CONFIG_SOFTMMU) += generic-loader.o
> +common-obj-$(CONFIG_GENERIC_LOADER) += generic-loader.o
>  common-obj-$(CONFIG_SOFTMMU) += null-machine.o
>  
>  obj-$(CONFIG_SOFTMMU) += machine-qmp-cmds.o
> 
