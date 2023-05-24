Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2487257ejb;
        Wed, 24 May 2023 04:48:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5A83gGdVZ15h94j8/mrH9+wlGZRUqlYWI4Xy60ju0S/EJoLOYS8y8Aw6nBjXVnMNL3hsXd
X-Received: by 2002:a05:622a:552:b0:3f5:4c06:f4a5 with SMTP id m18-20020a05622a055200b003f54c06f4a5mr23543221qtx.62.1684928908815;
        Wed, 24 May 2023 04:48:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684928908; cv=none;
        d=google.com; s=arc-20160816;
        b=jxre+vog6RW0lqWLoNWdwEP34vxyhsYH97EIFE5DycHRt1x3gXSH0/fFpWltWYXAh8
         BPviuun8J9w9dbDWansiK1B0vHDGwgaQ/ZKQHqFjRAO/yinjFgkGQfFEmj885KM7zCNY
         +gpAjkPv22TCcbyJ6wYYYSLWaQzX9KCmJ8qHRuwAX6IloVKMNyXtuBn800U83iBfjW2i
         1QAZrR/t9xoGgUjvlcxyOioOdv8Hh0xBqG6/Km49PRh+us/MxQ3a/mUMdWpLMDPCMY04
         uibivFt3z+kA2W9iQ6ygbh9+sXPTTEnF8aF9nIgtP6vB3CEgK/Fk/Pzftd2xfiiw84kh
         3z+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=l4+8V8PVu+1cKG5cgq671ZthtkYbHOo22tgl8qIpW5Y=;
        b=NnwMxS9miRpa7MKeYbvW4jayQdI42l20wbaJ93PfDQTF4v6bsoBUmc5WLYcUmBtcJX
         WD1ZGP5cwo/qkntqQNLw2JXjZfH6HigI9ParPcWcBH1WIvJKDjEVZ00F4Ht4BkPpkXib
         VdL3CL/Hzgtc1Jjas4qSwKNBOvU9ILekGLALSJXTqMF9WS6wYIIm9hp9ymtvkfXHDEqq
         3w/5n1tbHWPSFEX0sKr7oni6wYbSykdj194i6ZHtAFQPRdcrGyZN2Jz1lTBZvCNi0gWw
         aST8/x8uvSEk870UksvlnkKGjJ5rBRYkfo4X4x1PuWoAak08LsokLqSrmBfv9jbWivNy
         MwNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K+mnpXQy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j15-20020ac85c4f000000b003f525da7fe3si6539137qtj.710.2023.05.24.04.48.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 04:48:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K+mnpXQy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1mye-0007g6-HL; Wed, 24 May 2023 07:48:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q1myY-0007fT-PU
 for qemu-arm@nongnu.org; Wed, 24 May 2023 07:48:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q1myX-0007lQ-Bo
 for qemu-arm@nongnu.org; Wed, 24 May 2023 07:48:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684928896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l4+8V8PVu+1cKG5cgq671ZthtkYbHOo22tgl8qIpW5Y=;
 b=K+mnpXQy4R97twnb9JTvGH0rdz2n1aulFqlKSiOX/5CAJ6nuhlUDyBvhnTsxyLgTWhmkU1
 EuSe9SMM/EGOq8vJLcmvFPBAhRzOzQZcq0mfa4aJpCym2VTwmv+JZ4J1bFZCL+KQ6RSfwd
 UIMU3ELuuoHJxabuEzaxlHob9J3SFuw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-XoXSqMz3O12GZyzN6iIRYA-1; Wed, 24 May 2023 07:48:09 -0400
X-MC-Unique: XoXSqMz3O12GZyzN6iIRYA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f50aa22cd2so5471825e9.1
 for <qemu-arm@nongnu.org>; Wed, 24 May 2023 04:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684928888; x=1687520888;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l4+8V8PVu+1cKG5cgq671ZthtkYbHOo22tgl8qIpW5Y=;
 b=XdqC1hGAfD7VFNu8zmMDHFORpLSD0A9mSV6yYPihIKYahNytt9YD8rsv9uDRbjLR1F
 DUpdNIHn164v72qQaW3zuha+LcDX7jkQiIukONYbG3zsVc43Y5CgnENWmi/6R3Wqh25U
 EYoIfHEmY0d7nESlI9WA5O5PIIcIQe1J5Z13+c1Q9HKU8Jl20hdbwsRXMr/NLnRMm8+E
 lfkOG1TBpD1eH/0UlhPUodzABItFviQva7hUQVOVyNSpszC4S7+gsl4xCDpFk1HuLztB
 CUtOI12/stPBGoywTyaepiHLssjkCqr7YdvnljqsBmlBtNp0C9yPWiFYs+jp6wCk0edP
 H97g==
X-Gm-Message-State: AC+VfDwTLF+xlHHVV4nq9jE/jxLZci1CkGP4PQb98cLoXUkPC0o67gI5
 z7qLf/OVBve80jNM1Z2pE+xBVItsFwPQevyk7A7cZBmMK7yo/yjoxIz3OMdsolLCs/sU8GPWVaf
 VmRbCJ8kUZBkG
X-Received: by 2002:a05:600c:b44:b0:3f6:3465:78e0 with SMTP id
 k4-20020a05600c0b4400b003f6346578e0mr886225wmr.40.1684928888701; 
 Wed, 24 May 2023 04:48:08 -0700 (PDT)
X-Received: by 2002:a05:600c:b44:b0:3f6:3465:78e0 with SMTP id
 k4-20020a05600c0b4400b003f6346578e0mr886207wmr.40.1684928888428; 
 Wed, 24 May 2023 04:48:08 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-64.web.vodafone.de.
 [109.43.176.64]) by smtp.gmail.com with ESMTPSA id
 p20-20020a1c7414000000b003f60eb72cf5sm2174260wmc.2.2023.05.24.04.48.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 04:48:07 -0700 (PDT)
Message-ID: <7cf5bc4f-844d-9dc4-9f85-f136853401e4@redhat.com>
Date: Wed, 24 May 2023 13:48:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 3/3] hw/arm/sbsa-ref: set default display to Bochs
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230524111413.833912-1-marcin.juszkiewicz@linaro.org>
 <20230524111413.833912-4-marcin.juszkiewicz@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230524111413.833912-4-marcin.juszkiewicz@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.107, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: IqDxffOSSMeE

On 24/05/2023 13.14, Marcin Juszkiewicz wrote:
> This way we can use pci_vga_init() and have Bochs by default while still
> have an option to run with other VGA cards.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   hw/arm/sbsa-ref.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 9c3e670ec6..ed7ed00b3d 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -647,9 +647,9 @@ static void create_pcie(SBSAMachineState *sms)
>   
>               pci_nic_init_nofail(nd, pci->bus, nd->model, NULL);
>           }
> -    }
>   
> -    pci_create_simple(pci->bus, -1, "bochs-display");
> +        pci_vga_init(pci->bus);
> +    }
>   
>       create_smmu(sms, pci->bus);
>   }
> @@ -863,6 +863,7 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
>       mc->default_ram_size = 1 * GiB;
>       mc->default_ram_id = "sbsa-ref.ram";
>       mc->default_cpus = 4;
> +    mc->default_display = "bochs-display";
>       mc->possible_cpu_arch_ids = sbsa_ref_possible_cpu_arch_ids;
>       mc->cpu_index_to_instance_props = sbsa_ref_cpu_index_to_props;
>       mc->get_default_cpu_node_id = sbsa_ref_get_default_cpu_node_id;

Reviewed-by: Thomas Huth <thuth@redhat.com>

