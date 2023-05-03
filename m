Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2985636ejm;
        Wed, 3 May 2023 10:20:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4t4W5NEHPFx4V28rK1uqZqSX6lTInbjBTrzS0pPI6lh06wBCvMsjkROTUm+s90p90N8VA7
X-Received: by 2002:ad4:5dc9:0:b0:619:3665:7ef8 with SMTP id m9-20020ad45dc9000000b0061936657ef8mr9956757qvh.26.1683134438970;
        Wed, 03 May 2023 10:20:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683134438; cv=none;
        d=google.com; s=arc-20160816;
        b=anjWJoWMWu1izmfcuy+aR7wD+fgTj0khOJ+kQiPvmM3QUTG2XTSZ+yKvHMgKBxowJL
         NZC7uC0mDcIfK+WjCSjJ1eJVE4or/Dp9nZcO+ENa21y64b/kyGpYzu/JcOHgZR/YLK1G
         q1f0OOuT+Boj2Nke1Plgju0SgOIWndbySSIRmZV7gIg2xTDGsi7U5uMIEiPtjsBl0pMs
         xmEGzGHWTBGS/ydsw/rV6wKJ3Dh3Tiu1NPwbh+2tc8kJmpnRNRQCQtzjCGyVBjhD1Nw1
         wGpXLrwwbc29ed9+1Ge6qj93dNK3btZEjvqzFfSyG8E/li5LRyheEy+BzeAjk3s0M4Aq
         Laqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=DhLIT1hQ9NQ6tiRlnPdNFDA5BItQ+3X/+2t9eJvI9TU=;
        b=ca2TKH+LnP4PKcdpXeR3c7lNSZKIFKIDBVI022mIAwQzsDOXtWM+yyHhtKmA/jfs6r
         WJymyeHDrt9gD3UqfEXb26ZBLyJK/veO/beSgi+Nf4xbX0+ZIqqjcFzV35i/uOWS/bxV
         LeePnOOuRHnbBfJtypeuy1WAlN13pkPf/AxubBqwrV4TInNht26JrSVaUCqF+V8svylp
         LS7JI8q65jGdXQ6olUyZhFspQhWNmf/wVVrT8d4JsX4sgseZadJ/jcKGQ+b7BxKSOSEC
         DLMKOPE1bBTpnBym18g85rrevFwNWMmc+4PTAipyJy+iHSgap1En7gDsej0C3Rh5UYkg
         heqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OxyKB5Yz;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id bl12-20020a05620a1a8c00b0074abf21095asi18763880qkb.726.2023.05.03.10.20.38
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 10:20:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OxyKB5Yz;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683134438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DhLIT1hQ9NQ6tiRlnPdNFDA5BItQ+3X/+2t9eJvI9TU=;
	b=OxyKB5YzbuOEt1zAeNg8fqt9caXRagdL1FmGxAFf2FzrCwwj/QQXqsHYSY4gLo7W2UcPLj
	No/sQ/1lAJbGOPIYBXa9d2Ktst35GGBgdTgfiM8cXO0xfUdSW+anQjUud3YkPIhGf5MIpc
	ywDxZcqVcgXPJVzexhu0bArZdUJJpfM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-TvyF3tOnN1WMEvgxo0mrIA-1; Wed, 03 May 2023 13:20:37 -0400
X-MC-Unique: TvyF3tOnN1WMEvgxo0mrIA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94a348facbbso660205266b.1
        for <alex.bennee@linaro.org>; Wed, 03 May 2023 10:20:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683134436; x=1685726436;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DhLIT1hQ9NQ6tiRlnPdNFDA5BItQ+3X/+2t9eJvI9TU=;
        b=NO7CDXC51vl/ow46YYzQ+joh/XCLJ5JlFOCkT3YJfQ9aypXp/POCIp1jn0n8iQWpwz
         BVjkUAlkNST05pFJ5Dhl+LUPn0GPnEoEWBqM3mJIzX+BdU8BCYwDEwi5lHndLn9siTey
         JOQFuQ5jgKGx4juQBq5VUoNBKih/STjQh38+HN8cq8z7ypIwIqC63pGJ1OvKDL3ojmqF
         25KnJzUITrMiRSlHy+7fdmpT75xg/S9r78uiL16i+f7RYbR+BfPG988bwr8y2p4BnaWe
         tbh35YQU15/tekNtgMtKI5rUPqBoA9L6XuzTQuMEKozZok8IVurImURJ9aF43wW1T5Dc
         Qy8Q==
X-Gm-Message-State: AC+VfDxY7Ntl/Mn88lSjL53AGAM+sM2UPqTFG3gs4J6UTbgV+i0YRFDQ
	4v9R5I8WsqQoeQryEGw6URs+G3GuAqIfDMFMCGkU7YwmN18/c3f/8cdsO9qeC46UFUh/iyvzsSP
	gbEU/sJ31vY8GsSgOeW8BN3JWRNn/oBvE1hZht4GxEslAUzXHEQqGBTSu8KeldtRiiK0jgko1TR
	y8
X-Received: by 2002:a17:907:1b08:b0:959:bbda:fa51 with SMTP id mp8-20020a1709071b0800b00959bbdafa51mr3881820ejc.41.1683134435875;
        Wed, 03 May 2023 10:20:35 -0700 (PDT)
X-Received: by 2002:a17:907:1b08:b0:959:bbda:fa51 with SMTP id mp8-20020a1709071b0800b00959bbdafa51mr3881749ejc.41.1683134435409;
        Wed, 03 May 2023 10:20:35 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id s17-20020a170906285100b0094e597f0e4dsm17389590ejc.121.2023.05.03.10.20.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 10:20:34 -0700 (PDT)
Message-ID: <56e55af9-2c84-2975-d564-c79c7197b03e@redhat.com>
Date: Wed, 3 May 2023 19:20:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 16/22] hw/mips: add VIRTIO and USB dependencies for
 LOONGSON3V
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-17-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230503091244.1450613-17-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 8Ms5Amu2j8xP

On 5/3/23 11:12, Alex Bennée wrote:
> These are hardwired into the board so must be selected. This shows up
> as a "make check" failure with a --without-default-devices build.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   hw/mips/Kconfig | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
> index da3a37e215..0fcc3da41c 100644
> --- a/hw/mips/Kconfig
> +++ b/hw/mips/Kconfig
> @@ -45,6 +45,9 @@ config LOONGSON3V
>       select PCI_EXPRESS_GENERIC_BRIDGE
>       select MSI_NONBROKEN
>       select FW_CFG_MIPS
> +    select VIRTIO_PCI
> +    select VIRTIO_NET
> +    select USB_OHCI_PCI

Neither is needed by -nodefaults.

Paolo
