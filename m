Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp273634lfg;
        Fri, 30 Apr 2021 09:26:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSPBi+0FxUlIektQohFUvnNvtYc3hIYu+f2eQBDLyz7Mh9R9T17jjZJMb1uV7Hk2BKHTGU
X-Received: by 2002:a5d:948e:: with SMTP id v14mr4484449ioj.92.1619800004256;
        Fri, 30 Apr 2021 09:26:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619800004; cv=none;
        d=google.com; s=arc-20160816;
        b=tGVFIR+nLGeraIF6/EXIJZL4VmHBSBQ2MTSagDF1gLigBO/WmuAlMHtBhrnszVRBoq
         NMTt72kZLzqY0Lach2gVZDocT8BFn5at1OedpTGW9/z70+t8y45iFkc/BAF6YKp5PyGl
         Wso6q7DIeivgK1r3Pk00RsGu1zx39pavg/GpouCgT8WUdkAUSl/1oM0lVVJtKosFeED7
         qzPLoUD9kB+TEiLTTZNxBjeK0xDyhQ5t5hVEPpI93sIIR1RE1hyu490u+trP2hFurHkv
         WqqXR8ueHLCbzzvArGJdJPrzO0fjzvEJdbhW3cGbjrSxcOkLAG/PFJeIn6EOYKlB43OE
         CPdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=KLsNV1G8thDifENiKcl8N/q8wQXGH02a5Iw6xNKGg1s=;
        b=rW8i3Z+7y6osKcq8tc/Jfa/zKaYVj+ekKIQ6MPwZPQTfw5nLPdMwU8eHaTEpBu75Js
         abMwRgpG7vqWHRIfGC56xCGPWJtGj7iZz7R5bkkYncqYirYXLYM0dZS5LC4P+hI3k4rM
         Im20Fml/l0hcW8jDOfypzgdfJK8fPkaI4972htYAGG6/kRbf1uHy7ZaNEKCFPT92IRes
         ZHJIMgE7011+jswa86selEd+slCMPRLe6OGBw+UKD1LDPvZZOTHVovKvUkjCi03d57Ct
         fh+j8IKlv9UvM8OQSpiI+ijkDI+xSk/lrVcuF3+5bMLHV8mG8Z89CoLaZ5fyykuFMlYX
         /QaA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r5si2916056ill.85.2021.04.30.09.26.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 09:26:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcVyV-0001TP-E7
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 12:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcVpo-00029q-7N; Fri, 30 Apr 2021 12:17:44 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:56657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcVpi-0001ZF-Uw; Fri, 30 Apr 2021 12:17:43 -0400
Received: from [192.168.100.1] ([82.142.15.170]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N3bjH-1lUi7s0SUl-010c2p; Fri, 30 Apr 2021 18:17:31 +0200
Subject: Re: [PATCH 2/3] hw/display/qxl: Constify VMStateDescription
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210313171150.2122409-1-f4bug@amsat.org>
 <20210313171150.2122409-3-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <e471a4d7-74f4-06c2-d78e-cecb6a57c187@vivier.eu>
Date: Fri, 30 Apr 2021 18:17:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210313171150.2122409-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:IYZ2dSXZU6LfYdJNwOpvlbdpqchnMVgo5PigRB3w7DG9vNNCHIS
 LeHS0kMT6gwsWHJcBwmuztlgPdx39HXnm2WaL8Q6iQvtqd1DUZSGLF1btUM2vuKwQpJv8ap
 U6A55rULRpyHyNa4Wy1KgaPauOmkQbGEVffgJH0Sza9fb3xFvua9oAjfw5NIuAr5W3YtScc
 ebrWNiJb3xxxCnwPPnZcA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YGLuCuqWLP0=:cwoYvDqpsOpBXH05Oa2GUy
 4HEGNwuSs6PubHINE6Aaxd1WeUnQAqaWZIW9s5zL7WyiFhDzojz1eX7rODVe3eduDY0LeIfS3
 I/YDP8ZXCccTZGR+yZoefGkvwJl0GfKGQBjqYTL3qjDn+hIKffGrzzkMlQ9i6NwEWulD6gngx
 BqnnRFnNHe5P3YFeIDAUG7yuVHfMIJnvnyDuZG/2aZEVacVY344zCYYJCefJspAPCHUtKsH5m
 ij3MkzwVA7/VPpRosSEZYLiSxeOGaeF+eEJ2eBZSEUXsxfycNY8G5/EQu/gEL37ImKtMTEoZ7
 IbfSZYBbu3to4ulYV+JSO+Dtjq4WQklXKGNBYJrd7V2RjOd9Fdd2XaKfZC0uB5wvBhQwAUDP1
 hMqgNZAbS6qadmWaHt8sp5sfxxIfobbDedmj8T0ucniMTWRvGF9Ikg7lPV5T7gdoI5YvLNJDs
 RddQC5QvkYT+8Rj74nWxG2N48ePSDI3pk7ijUjcBqXEmusIckI9TwQ67A71EbRINhFbEcc1vw
 f/m+igSM+gvNkWUKncorcI=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Rob Herring <robh@kernel.org>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: quMpmXpZCEHH

Le 13/03/2021 à 18:11, Philippe Mathieu-Daudé a écrit :
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/display/qxl.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/display/qxl.c b/hw/display/qxl.c
> index 93907e82a33..2ba75637ec3 100644
> --- a/hw/display/qxl.c
> +++ b/hw/display/qxl.c
> @@ -2384,7 +2384,7 @@ static bool qxl_monitors_config_needed(void *opaque)
>  }
>  
>  
> -static VMStateDescription qxl_memslot = {
> +static const VMStateDescription qxl_memslot = {
>      .name               = "qxl-memslot",
>      .version_id         = QXL_SAVE_VERSION,
>      .minimum_version_id = QXL_SAVE_VERSION,
> @@ -2396,7 +2396,7 @@ static VMStateDescription qxl_memslot = {
>      }
>  };
>  
> -static VMStateDescription qxl_surface = {
> +static const VMStateDescription qxl_surface = {
>      .name               = "qxl-surface",
>      .version_id         = QXL_SAVE_VERSION,
>      .minimum_version_id = QXL_SAVE_VERSION,
> @@ -2414,7 +2414,7 @@ static VMStateDescription qxl_surface = {
>      }
>  };
>  
> -static VMStateDescription qxl_vmstate_monitors_config = {
> +static const VMStateDescription qxl_vmstate_monitors_config = {
>      .name               = "qxl/monitors-config",
>      .version_id         = 1,
>      .minimum_version_id = 1,
> @@ -2425,7 +2425,7 @@ static VMStateDescription qxl_vmstate_monitors_config = {
>      },
>  };
>  
> -static VMStateDescription qxl_vmstate = {
> +static const VMStateDescription qxl_vmstate = {
>      .name               = "qxl",
>      .version_id         = QXL_SAVE_VERSION,
>      .minimum_version_id = QXL_SAVE_VERSION,
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

