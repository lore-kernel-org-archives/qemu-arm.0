Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1446905lfo;
        Fri, 18 Mar 2022 05:05:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBPYf2uQQlo3PWMJOmBbJCUYeXzmAMUpt5B60dsamKV9cQt2IC4O0LC8LX5/6bSjGI3ww7
X-Received: by 2002:a05:6214:20e9:b0:440:f705:549 with SMTP id 9-20020a05621420e900b00440f7050549mr3930630qvk.39.1647605104266;
        Fri, 18 Mar 2022 05:05:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647605104; cv=none;
        d=google.com; s=arc-20160816;
        b=C4YPu+I7+Z5ZHoTaG/Ogf09X79zn2OlCQ6WDg5XcgQHu5Jc8qablUZN2aljd2mi8IM
         AeowEtCG6K5816m7R/YMEX9TVaEwiEXGBzzfpO5LEK/230frPrceWey5Bw43jUcCcPhk
         H9TU+z5vQU3UjIwOKbjIBljC8w2Wsv4SrzN82ztReZNkuN4LwE6PBF4wUPciEFy9e9QX
         W4Q8kdEDM+ZhesGYeczPKNaUPHoT3GoNKN7QFt6czjsE1bAZtpnsLvQKegXvrR5sJrSU
         Fvnq8Tg+cqVk0NqJaD+g4+EPq5cRQp2erwcLQbcwcgU5YiHTVdTYU5L3OZgLNp/HjQhg
         djEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=rf3EKBtwgFtkhx1KaaP+45zQzV8ZpVFCj+1+FzUsrBo=;
        b=hrSqZ/a5Cgpd/+2PnijhF+rPP7wWQSvoLr4CViHi/WT25TOCgqyWXmUtLrQ2evQglK
         XisUcqcnrR2zBrB+V9WlOJWqNPJ+Y2IvCpwMRan8QuBFNG71mvw3qw6g26PzrN4fkEON
         UQtCO5Z95zvS6E2D1Xm5BYqBpZWC+RzmjTtGK9I3ZQzm7fbitk5R6FQMmiSNEM1PIMWG
         JByd3h7Z11pnX3qRdk7v8tlDjj9gRVFT3PU1IiJaYI8ClveEodmRpn1IzAbJIsJNsP60
         NYPBznsUCUfrZCxy3AiTNMw6JcrAyOF29UmkD5ueM8Y1HyX+R6RHCnl1xTykO/LeX1o/
         4J+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x17-20020a05620a259100b0067b31fe94d6si2332112qko.612.2022.03.18.05.05.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Mar 2022 05:05:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nVBLr-0005Lv-Nr
	for alex.bennee@linaro.org; Fri, 18 Mar 2022 08:05:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nVBLP-0005Js-QH; Fri, 18 Mar 2022 08:04:37 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:60743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nVBLM-0004US-DC; Fri, 18 Mar 2022 08:04:35 -0400
Received: from [192.168.100.1] ([82.142.28.230]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mw9Lu-1oKwZf3rvw-00s6Oq; Fri, 18 Mar 2022 13:04:00 +0100
Message-ID: <7ef3f3c4-6a2f-e63a-cbcc-aa80bd3bb17f@vivier.eu>
Date: Fri, 18 Mar 2022 13:03:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH for-7.1] hw: Add compat machines for 7.1
Content-Language: fr
To: Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
References: <20220316145521.1224083-1-cohuck@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220316145521.1224083-1-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lkg9z/G84KoiIgbVDME3FzpZtY5hGAiXhrk6hWFUr8ZmivvNA6z
 q/JN3MSpliTusF+6kpTofnBsoqU0YuotpzPSYc9uC0zGvg9luh/PX/7e7Mi8XPR4cU8RaY5
 5ZLHGaMUug6AAuEaXH44JMgWBWkR6dfBpBMecTqOxoNoecHfiw9GzjU+kOiUsSfZzHVsGId
 833VxLYMEp/FTapwJP0Jg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VaB0c6a8VJY=:njhsnUlDgV/cXAyw+7BoQy
 VAtCi/1CukBK93162dM8pKUiv88szUriVH9uDEZvE8IZrTBadprW/4Kiio6kJtsyGRDg2vfQn
 OOmINVP8dtFQAZA+Q6YtutKuJ0yACiotLaYCcoCxf1EpBRzMlZCm5c/FZnBIUT9kwfzciQVv9
 XA8z4rP7rinLNMdTNpJezT9RioxR6JLdDCnhTz2JjqcvG2MzwcSbWc2YoVWQXr7+C8YekeTph
 vcbreA47z080mHeutN4FelopJV1BSNCChHFY19Rhcj3/9exSmWEBMqM81LifNNuR4uUvHfEJZ
 yiDL0HzIBDWDrlF1SxxgPeRPMHRQcepNizA+x0NPCjaWw6hDPg0AnJhJDWlQmu8hltfOBDqjW
 hvaoxGQMbQshHW+7ZjjQ/u/dYEMrwZib3I9PO/NEUlY/TvOrVOyP/Dyu6QPMgOiSPobhIEkam
 dsJ5zqolgWcNizy04ILntxsrlkBOGSwpbP3bRTEvISrv9Y2ziXWDevF5K1oHFVPXVx5bOTZuH
 8GKdRSveUp34B9hB5wcYb8dPWv2F0b/jhnVmrDG9yEqeMcky4RoOfHLbA5ux9MbTVxPV/X2OW
 4kRKvKyPOzpGNHVVZss0aV+Q0VHFCuagagSALNQp81fGeGR7n/0caSNBkVNWaApITrXL98URw
 6sBps0JfigUrIpnGRbdolWOfhwphDRIR4JW73LVPKsvdD1lF+ynepBpNfxFjiMPgK3yE=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Eric Farman <farman@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i5fuwz/DYTda

Le 16/03/2022 à 15:55, Cornelia Huck a écrit :
> Add 7.1 machine types for arm/i440fx/m68k/q35/s390x/spapr.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   hw/arm/virt.c              |  9 ++++++++-
>   hw/core/machine.c          |  3 +++
>   hw/i386/pc.c               |  3 +++
>   hw/i386/pc_piix.c          | 14 +++++++++++++-
>   hw/i386/pc_q35.c           | 13 ++++++++++++-
>   hw/m68k/virt.c             |  9 ++++++++-
>   hw/ppc/spapr.c             | 15 +++++++++++++--
>   hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>   include/hw/boards.h        |  3 +++
>   include/hw/i386/pc.h       |  3 +++
>   10 files changed, 79 insertions(+), 7 deletions(-)
> 
...
> diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
> index bbaf630bbf20..afa52d7e491e 100644
> --- a/hw/m68k/virt.c
> +++ b/hw/m68k/virt.c
> @@ -316,10 +316,17 @@ type_init(virt_machine_register_types)
>       } \
>       type_init(machvirt_machine_##major##_##minor##_init);
>   
> +static void virt_machine_7_1_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE(7, 1, true)
> +
>   static void virt_machine_7_0_options(MachineClass *mc)
>   {
> +    virt_machine_7_1_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_7_0, hw_compat_7_0_len);
>   }
> -DEFINE_VIRT_MACHINE(7, 0, true)
> +DEFINE_VIRT_MACHINE(7, 0, false)
>   
>   static void virt_machine_6_2_options(MachineClass *mc)
>   {

For the m68k part:

Acked-by: Laurent Vivier <laurent@vivier.eu>
