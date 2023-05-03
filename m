Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2977906ejm;
        Wed, 3 May 2023 10:07:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4TvAWl3bSSCd/F7BXQRvOdR7PMU+oFRoIeB4raGQVGJwy1KVfoauS1Y4jSU8MqIFlnuc3H
X-Received: by 2002:a17:907:d09:b0:94e:c43f:316b with SMTP id gn9-20020a1709070d0900b0094ec43f316bmr4242979ejc.19.1683133679756;
        Wed, 03 May 2023 10:07:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683133679; cv=none;
        d=google.com; s=arc-20160816;
        b=DkkqzuuyXjw/VJubaHUsGWbv5brE6Dweo2BuDG69lL/jruzvJ3F4uf3RB47CPLd1wA
         9nk18gvZMCyuOrSRmFKiTq1Nfi2fH8Luu0iLrDmmYJS8cLexp///woQ8+c37rF32W0Bg
         xNLc02f4soW5jc29f7KDDh9vWDDqUn7vECpGQ3k9HN11w4MAbPrkcV3w4MCcN5TszSx3
         L6oCO+gbjPL18TDsLq2i0XyrU5tPf9BN/21BF58uKxC9ppwynBzcMKHcIrmUz6JUALks
         NpX+5F6gwC/nPULg9lt9wbQwaPwW96WDRwtGoN5l7WVkTfczMqVKJTkNNfxXltWegzNF
         ySnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=GeVRbKnFuCP+4OhTYPMW6U5K3oMVVY5MPo/dWXJMRdw=;
        b=E52pbqo9N7G++LxSfp6rizfSAJlce/MNqJ8VU9NGmXitalcIp4lvd2E/7hcnFqnb0J
         yfX+iXtZqsxGxDNp8z7YisPpzOu750gpuAg+J3M0SZs/CHFsw6jtX6d0EueCRac3kuXx
         X0Tec9GuzJRy6SKGmdnX0DdZsbm8ufb9ZVr0XOAzvpwNU+aXEHvdxVW8xtYwqnUzUhnl
         JGEEbmkF/QuT1T+6+Y6J5AJD0dhA2NRYzaqnlH56YzeBsbVf86Ko8MHDtg0ZhP4lRrnz
         rWc2UaW/rIv4+GADXcsW1nOKtakc9uDNttmk1nyF301wdscx99ksi3YZALMiDxV8QdDc
         YDAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X97VaBf1;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id k24-20020a05640212d800b00506a8071d27si1402605edx.554.2023.05.03.10.07.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 10:07:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X97VaBf1;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683133678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GeVRbKnFuCP+4OhTYPMW6U5K3oMVVY5MPo/dWXJMRdw=;
	b=X97VaBf1O2nFSIAh2ki+TeHu5OwMjAiftnuHbwFv6V/cf3SOZS6VKGMmg95W79Rimxitp8
	1wgWjIt4gbn4aw74syZo3q1W6TCCG9TN4ny2n/7pzFnNgL4LYq8vk7hjbiKu8abF3ilGfh
	K7Xrwk62YyPIX1twEJ1lYffrOXLYdqE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-nTen8PLBMuO_uNgdizLP5g-1; Wed, 03 May 2023 13:07:50 -0400
X-MC-Unique: nTen8PLBMuO_uNgdizLP5g-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-94a341efd9aso659319766b.0
        for <alex.bennee@linaro.org>; Wed, 03 May 2023 10:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683133668; x=1685725668;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GeVRbKnFuCP+4OhTYPMW6U5K3oMVVY5MPo/dWXJMRdw=;
        b=eNPXoAKTPCSbqMgBlwBrgAUXzrqKqnuUmbNgBRC8yo3kxLe5Rp3garGid5DH6gJ8UM
         yGQPDt4HGQvvX0AsMz0RPqkivM58su79tM7ho9uvW2k6AuA8Ksj7Thn/SLBDVXBn3H7H
         T3/LEjmjBU+YDl92+OHZzyI8Vx1f9Y2kmgp6PQYR5oZxaDavak4fw0I7B690BVaFihbu
         u+0w4XoG1+g29DAl79r0OY25jp36deGrqbUTzUmwjzeuZEQdhZwiYg+21f6fAHKdOjR4
         5KfPArwhRphUiBUpUgyJlkI5I8J8Lhl3BsTo/BOGeDzyzY5BwByokYNrosUZQ6PGrmvY
         Vayw==
X-Gm-Message-State: AC+VfDw46DvgGYNmmHjYWGNsOydnWrUkxOtHeEdRTGUskYmBuJjmdFxO
	qzJ2jDm2xL10pRInKDj5Yf5u1JvEjYCQgw+tGIyzmyKrGbobKXrJIIX1rsIf7SqvfJ9dMg93htW
	GVr2YdHgnIdtTY91Hoao41q7jaE94udGUIP4WF/15grz8qmsSTNjAB8YM7UKMlUtXjT6UYPJUAR
	2r
X-Received: by 2002:a17:907:789:b0:958:4c5d:7dd2 with SMTP id xd9-20020a170907078900b009584c5d7dd2mr3532368ejb.72.1683133668385;
        Wed, 03 May 2023 10:07:48 -0700 (PDT)
X-Received: by 2002:a17:907:789:b0:958:4c5d:7dd2 with SMTP id xd9-20020a170907078900b009584c5d7dd2mr3532308ejb.72.1683133667923;
        Wed, 03 May 2023 10:07:47 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id q15-20020a056402032f00b0050bfa1905f6sm553649edw.30.2023.05.03.10.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 10:07:47 -0700 (PDT)
Message-ID: <5c480805-ffe9-22e7-b543-85d7e2cb5799@redhat.com>
Date: Wed, 3 May 2023 19:07:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 07/22] hw/arm: Select XLNX_USB_SUBSYS for xlnx-zcu102
 machine
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Helge Deller <deller@gmx.de>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Andrew Jeffery
 <andrew@aj.id.au>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Radoslaw Biernacki
 <rad@semihalf.com>, Aurelien Jarno <aurelien@aurel32.net>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Song Gao <gaosong@loongson.cn>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-8-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230503091244.1450613-8-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: AUfbznNLJLcU

On 5/3/23 11:12, Alex Bennée wrote:
> From: Fabiano Rosas <farosas@suse.de>
> 
> This machine hardcodes initialization of the USB device, so select the
> corresponding Kconfig. It is not enough to have it as "default y if
> XLNX_VERSAL" at usb/Kconfig because building --without-default-devices
> disables the default selection resulting in:
> 
> $ ./qemu-system-aarch64 -M xlnx-zcu102
> qemu-system-aarch64: missing object type 'usb_dwc3'
> Aborted (core dumped)
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20230208192654.8854-8-farosas@suse.de>
> ---
>   hw/arm/Kconfig | 1 +
>   hw/usb/Kconfig | 1 -
>   2 files changed, 1 insertion(+), 1 deletion(-)

This one is correct: "-M xlnx-zcu102 -nodefaults" has a usb_dwc3 device.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 168c1e8089..cec7898bb7 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -439,6 +439,7 @@ config XLNX_VERSAL
>       select OR_IRQ
>       select XLNX_BBRAM
>       select XLNX_EFUSE_VERSAL
> +    select XLNX_USB_SUBSYS
>   
>   config NPCM7XX
>       bool
> diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
> index ce4f433976..0ec6def4b8 100644
> --- a/hw/usb/Kconfig
> +++ b/hw/usb/Kconfig
> @@ -136,5 +136,4 @@ config USB_DWC3
>   
>   config XLNX_USB_SUBSYS
>       bool
> -    default y if XLNX_VERSAL
>       select USB_DWC3
