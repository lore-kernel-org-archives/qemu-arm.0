Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp937068lfb;
        Wed, 21 Apr 2021 18:34:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTZSUTktLgm+1W9Bms+Tlqi/viKDLH0fJGe42i9UC+3JC/Texv7uksVfHH6WEtqDL11GUV
X-Received: by 2002:a02:a499:: with SMTP id d25mr984406jam.13.1619055265960;
        Wed, 21 Apr 2021 18:34:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619055265; cv=none;
        d=google.com; s=arc-20160816;
        b=ZKc7NQ5uq8K3cONAZIz7fIIyZO1Wnv4xDycLoZH9UsuycNQCZRG5rSbWRXVihanHC+
         qPv4mX7FpU/SObSKkLKATSd+73YHMrjdGxeoOP6xSDykvwdr3LWe2flmHCCF0tpqsCUk
         TyC2v0/HaF7v0G6d/3e/PHOWMq+MS6ZYbwlRvydY7Ejt8G6yE8PSClxc7VeIup9KZ0kN
         nW0YUPfaIIRxNkxxDg/JpOsBo9zcETopxgV5CZKrjxxVz8469OD5Jfrh7KihOpSqbjCC
         q7ehwhAT4R/SzLhoIKAWvV1SncS5OXMK6DjOTqoKcP3kxYQs0jWD0YsWqEXIn+gs3rQL
         zHHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=mj/x+BsLcUMfijj10XaQ7IQW67uLpOTti6YMCpBR7CI=;
        b=CYMx5S6BIoodC9D2mSOg2glw5zx73Pl262fEbANOx5NOPkKnvjJ5SxKUPHrssNtiD6
         VWnwJ9I39JpzqQ5b0tDMM2HA2KeOlLrOMSN/zJ2ltuXYTdTiwx7ykSiadRVo9J2QEvFw
         4S5lg8AMgMawIcegzjZ38XQvZS+6f/peugRgx8SO0tVwEpGykXO8iHCYP9WEI9lCKs6u
         fl9beOOmB8qxoa/ktaWDIaZ/V7/mWYAo1Y53/+eKjDyZ1DV+9rjAW3cstMgoMPMM/nly
         dLN69F2dv1j6BrpF9EcigtHb8AhneVBdmf9t3vx610TPlCjxUraWK5Yiar7ZJirMP31R
         jMdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fNk9U4F9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f9si1243937ils.69.2021.04.21.18.34.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Apr 2021 18:34:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fNk9U4F9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lZOEb-0004Xu-BF
	for alex.bennee@linaro.org; Wed, 21 Apr 2021 21:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZOEI-0004X5-KX
 for qemu-arm@nongnu.org; Wed, 21 Apr 2021 21:34:07 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:35622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZOED-000190-58
 for qemu-arm@nongnu.org; Wed, 21 Apr 2021 21:34:06 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 j14-20020a17090a694eb0290152d92c205dso78611pjm.0
 for <qemu-arm@nongnu.org>; Wed, 21 Apr 2021 18:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mj/x+BsLcUMfijj10XaQ7IQW67uLpOTti6YMCpBR7CI=;
 b=fNk9U4F9fEXXfgieM/GzdY4H7Ii/RZi+/XIL5jK82v7NbBdNG2OU97Bf+/1kU0kmio
 tjxrg7pP9n6IFqkaN5M60dIvKoFjQPOJhDW9fqOm2bNxROmQEeKjBBbHrJIw/lFtoNyt
 Ld8bpBKe/1NIv3PDtEyngIVkfUkxurURSqooUUqHt91qjH6m7fv/WNyVC/fU8cAZsLLI
 LGiUwibu+mQmVVjSX413P3W63OCeyxLV6mUpKJBf4uEznXXZxZFMkEDrqAWptvn/uU+P
 5DvfFTn8UoPlwSWEtCaqta3R7z8wksv6iS7NgJrfxmE2clj9dZYcmmypnlC6cAbWsAM8
 OE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mj/x+BsLcUMfijj10XaQ7IQW67uLpOTti6YMCpBR7CI=;
 b=qZ6FMiZ64D1sycc5z9dcCZKncTRWw9s1m2xgHzpc50jRGGtgAyyOx3fqMlG0WfGZvr
 O3KwbH0t2hrsthVzDchrdAdT5TnMqU6JGrSzDHqYkYyL3JmYAbkiXj4hWiszIUY92W6I
 uXqOW5xOGjVpUvGizSAeOGUHa6cd2vK0g5koaE/cYgTMNUDI3DuZ5caj/Oz6KeP86WhY
 xPjOxLx0DSrlS8tGuCRordVJOFRapK22vdwtc71Lo0YkKR2Xz5KBx3A60bs0Yj8I7ndO
 v/26lmGEzFaxVfzvfV/ksEfUsuhG8iVMamkHB/qAowIJ9Ly+BRSY200l0sqGdHZbeBhk
 6vDA==
X-Gm-Message-State: AOAM5313sVAwGde5QbwdMkPCcKRvYPVhVDqismQHy4zJFIFY7d7vLhRx
 hw++tTq5HdbWV0tuRCuHgfTJ9w==
X-Received: by 2002:a17:90a:d983:: with SMTP id
 d3mr1126964pjv.99.1619055238147; 
 Wed, 21 Apr 2021 18:33:58 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id e190sm411134pfe.3.2021.04.21.18.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 18:33:57 -0700 (PDT)
Subject: Re: [RFC PATCH v2 1/7] hw/misc: Add device to help managing aliased
 memory regions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210419094329.1402767-1-f4bug@amsat.org>
 <20210419094329.1402767-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2b3a6aec-aef9-6f31-1537-310757d6aa83@linaro.org>
Date: Wed, 21 Apr 2021 18:33:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210419094329.1402767-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Peter Xu <peterx@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Lv/538AORPb/

On 4/19/21 2:43 AM, Philippe Mathieu-Daudé wrote:
> Not really RFC, simply that I'v to add the technical description,
> but I'd like to know if there could be a possibility to not accept
> this device (because I missed something) before keeping working on
> it. So far it is only used in hobbyist boards.
> 
> Cc: Peter Xu<peterx@redhat.com>
> Cc: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   include/hw/misc/aliased_region.h |  87 ++++++++++++++++++++
>   hw/misc/aliased_region.c         | 132 +++++++++++++++++++++++++++++++
>   MAINTAINERS                      |   6 ++
>   hw/misc/Kconfig                  |   3 +
>   hw/misc/meson.build              |   1 +
>   5 files changed, 229 insertions(+)
>   create mode 100644 include/hw/misc/aliased_region.h
>   create mode 100644 hw/misc/aliased_region.c

Looks reasonable to me.


> +    subregion_bits = 64 - clz64(s->span_size - 1);
> +    s->mem.count = s->region_size >> subregion_bits;
> +    assert(s->mem.count > 1);
> +    subregion_size = 1ULL << subregion_bits;

So... subregion_size = pow2floor(s->span_size)?

Why use a floor-ish computation here and pow2ceil later in aliased_mr_realize? 
  Why use either floor or ceil as opposed to asserting that the size is in fact 
a power of 2?  Why must the region be a power of 2, as opposed to e.g. a 
multiple of page_size?  Or just the most basic requirement that region_size be 
a multiple of span_size?


r~
