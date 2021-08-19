Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp741912lfg;
        Thu, 19 Aug 2021 15:53:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRbnzXW3P4s6KPuwPpr3k1fhAf9ncM54AOPIepyR2bcnsgapPuba40sE9vRPurhr+lApIP
X-Received: by 2002:a05:6638:3805:: with SMTP id i5mr12529987jav.72.1629413631745;
        Thu, 19 Aug 2021 15:53:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629413631; cv=none;
        d=google.com; s=arc-20160816;
        b=JbjgIeyk+YYNxr5nv7pXbhCxBOzXhdm30S5K9MoDzE27KW4qhEJVHhm7bq8Fe/inUT
         r5cXz1BFfBj+UxfB3f0+WVmPHaZbvwPBpHABW23pfA02qZbPrKRr7EKxVORN9SGjyv63
         KrktzSmtG1q6l5w7JAB2w3XuxiQORk7/de5im918cgYCVgzfYR4+q7IUIwEsGnzTngy/
         K2SLlG43CD3StHTdZfR2E76H2Qh7Ht+39CzhJsxA0XRhEQC0w9a9ia86EO4noWTGKYoX
         igW3Hxpkm2zbLe5A45RyUYZdEtXczcU821sGLJ8hT5AYwsy4uG987MIvHYOXMrylIdtL
         n4bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=PTrO1Od3fdTfn0dsb8godx4zsH/11REcDlmLtDNCZZw=;
        b=Z5prTvy5t2EMVSDGKgM5VCgB5Uk7U+MPj83YU6pUlxnH1UuRFnJztpfEi4bFEBO9ok
         UVYwfsisedytFlW4+8ht/8j8TlS74mwkCIR0+HlRumYV9gyUBjWBKQgZ0t+yfDdcbDKl
         GFyrhYJMI279o0oHpm0cY50ckUNf8ZBTzvZQNmFA0ILNwQFoL73yjzxm45KCMKnQdvNO
         bdLKRW6R+EH+x0uslpS/RIc1oiAmVuCPtLaYF4zvQ2ZIWlcenc/e4EuwCG7H3LtUlEkh
         LaBWHvOpIOMs/KELP1k6GJRhrrvgLWFeokhm9DEhmk+6QoPFIdwOmseIueQtkCZzSFJN
         zitA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XRsABalU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n22si4209351jaj.53.2021.08.19.15.53.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 15:53:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XRsABalU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGqv1-0007AH-4D
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 18:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGqur-00077m-1j
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 18:53:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGqup-0000oG-Nv
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 18:53:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629413618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PTrO1Od3fdTfn0dsb8godx4zsH/11REcDlmLtDNCZZw=;
 b=XRsABalU8C61BL8w2IhY5C5tLu7Y+vNg7NO1WmnfQSj2D5Gy1sBT58Xinrpev9M4DmjBMw
 d8UiJGLRhrD+MuKG3//sHNCjhEDb4UUqKXQb/JV26CRXetConqjeZh3cdUKgHQu/Dp5aNf
 0s2H4fcpIWTZK5w5j1zc9zJfrPJ4VEg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-vefalTTDPGaG6CgR5uSRBA-1; Thu, 19 Aug 2021 18:53:37 -0400
X-MC-Unique: vefalTTDPGaG6CgR5uSRBA-1
Received: by mail-wm1-f71.google.com with SMTP id
 g70-20020a1c20490000b02902e6753bf473so4073954wmg.0
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 15:53:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PTrO1Od3fdTfn0dsb8godx4zsH/11REcDlmLtDNCZZw=;
 b=L12I+ZkAsvCc2tfGI2OEeT7XP4+CPH0yTdHIb0X4TwvlQrQfkQ3dMnswYLpgauKpzs
 w2V61TEjRzgW9thdgjUdI88K6sEnEZbTIKyh9xCcCDYqL26WcSBbefrfQWBGltv0sVG1
 C4Hu13ykRkFTBh5s4wyHStYfRj8ibuwTKvSHOE3TH2wX4Sma9ShckyykJAmuVNMGqxUH
 xzLCj1XDOrj4DZ7CcIkrMDuVqELXiwChqWNq/2htSGElrSYungZqm59rMaXLUFo2zwPt
 9hoGFiuoqhNxrHHm+Xuui28ncEEPWdEPa4Efw+Y1qNQSoeCBmHNZFIMmcccQcGqdw93D
 fuOw==
X-Gm-Message-State: AOAM532fCoT+AiGtLQqWTA0Dvb2GNz+EOu99iW2opmAi0xZzXwIGMDyM
 UCexA/clJ+mmhuG1kTvbCXfSnlo1M7coMCefyUX6rhAOADM/xADzWl0Rd0GwiIuEuUNjRAGk0d+
 4w8IhjteBdSDV
X-Received: by 2002:a1c:1b4b:: with SMTP id b72mr833024wmb.168.1629413616348; 
 Thu, 19 Aug 2021 15:53:36 -0700 (PDT)
X-Received: by 2002:a1c:1b4b:: with SMTP id b72mr833012wmb.168.1629413616228; 
 Thu, 19 Aug 2021 15:53:36 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id c7sm3429159wmq.13.2021.08.19.15.53.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 15:53:35 -0700 (PDT)
Subject: Re: [PATCH 1/4] target/arm/cpu: Introduce sve_vq_supported bitmap
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20210819193758.149660-1-drjones@redhat.com>
 <20210819193758.149660-2-drjones@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0a13b4ce-d869-d3cc-820f-eeb36171cf25@redhat.com>
Date: Fri, 20 Aug 2021 00:53:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210819193758.149660-2-drjones@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 ishii.shuuichir@fujitsu.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4SsbIx2KPWjG

On 8/19/21 9:37 PM, Andrew Jones wrote:
> Allow CPUs that support SVE to specify which SVE vector lengths they
> support by setting them in this bitmap. Currently only the 'max' and
> 'host' CPU types supports SVE and 'host' requires KVM which obtains
> its supported bitmap from the host. So, we only need to initialize the
> bitmap for 'max' with TCG. And, since 'max' should support all SVE
> vector lengths we simply fill the bitmap. Future CPU types may have
> less trivial maps though.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/cpu.h   | 4 ++++
>  target/arm/cpu64.c | 2 ++
>  2 files changed, 6 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

