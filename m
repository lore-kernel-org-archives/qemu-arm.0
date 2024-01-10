Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1004797ejs;
        Wed, 10 Jan 2024 04:40:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHAd+ai2eb4S/uZxGBfk2CN+eeHlvfDOp338QjdzOl43iF6KBRXWB86YNynDb3IGYzTCdM
X-Received: by 2002:a05:6214:4012:b0:680:fea2:1f4a with SMTP id kd18-20020a056214401200b00680fea21f4amr1174659qvb.74.1704890440978;
        Wed, 10 Jan 2024 04:40:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704890440; cv=none;
        d=google.com; s=arc-20160816;
        b=E4v3dnHt1vbsaCn2m3uu4nIf4H2m/KkvmjLDizrZk3SsVxyRz4f+esVGkclFQhKYMx
         C7h9jSvwonoDDMfokCA4CHsWfaFLSXAXm/iOjXu0VNxX5BvJFxODt/LFyE22PFDUBdjr
         pqeB3imPj4hj53sVnR3cSYV7y5sMbiKNp8AbYIahFFLK3maClhwGkkGZXiWhyKKn4aDy
         Fs1lIUptBPKPvm76l1MN4f6+2E1660vfwi8jBEe0EWC8dLavHU99e8ntlEU1oB84W+cO
         pXZ2DyxtMiu54Rdp3qA1qUXTSmkOib8TiifD5MGQ8IajTXayuS4zQqMb7h28kEQNlQL5
         mbnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:ui-outboundreport
         :content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id;
        bh=OPhLsXNIHHUvK7qjuooc+N8MUjdD4gNV+hFhc1xNsPo=;
        fh=d/STXr2TBFjH0WGE3YIyS64pzMDCNbhlap4BAKgtdZQ=;
        b=D7bvDty8b9MCXApvI3ktJmRLmmD57QuqpCIrTgGipVLx21UfCZ78KWhPA31rC6zlV4
         7QbgKTqOesFKSuQhhOJ8AEaLKDLwfPmLBYvm9dZLSiZVtWU4UO0tskRamERChsj23I0w
         t1wNx1/cROfyE1ANkCnkp9LZJpisoVKGmxBHHoLtRlRzPTt7xnd3vABUnJb3RRCnE9mm
         fRS469H7dl9M8WABXgflEAU01F/y0kSvsAjyHa0EIdrGYRo0Sk9GaStJuDq6yC9YrKqp
         EIwPvgKJsOPFAU6Q4SvzvWZIhFUTS/0rHepnLOL8ZOoRpYBzDxBBndbhJKP+gbyeHGi7
         MYkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w21-20020a05620a149500b00781706eb8bcsi3830219qkj.155.2024.01.10.04.40.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jan 2024 04:40:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rNXsg-0002HN-OK; Wed, 10 Jan 2024 07:40:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1rNXsY-0002BY-BU; Wed, 10 Jan 2024 07:40:18 -0500
Received: from mout.kundenserver.de ([217.72.192.73])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1rNXsM-000646-NZ; Wed, 10 Jan 2024 07:40:09 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MI5cP-1rQawn19PD-00FCAq; Wed, 10 Jan 2024 13:39:54 +0100
Message-ID: <f35f3934-4205-4ae3-a9a8-1fd47326194c@vivier.eu>
Date: Wed, 10 Jan 2024 13:39:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/timer: fix systick trace message
To: Samuel Tardieu <sam@rfc1149.net>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20240109184508.3189599-1-sam@rfc1149.net>
Content-Language: fr
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; keydata=
 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
In-Reply-To: <20240109184508.3189599-1-sam@rfc1149.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NlZdfm4z3cd6Rc3SHyP2CbcARUVvOtEVqznZdskMqDD8IS4Lc4B
 7/S5TaWVEwcM0SfZcj+eBTuSp8Aijtf5maky75/c1PVrNTXtfZYvrvzXjHCKse7WureV5JE
 PFWHM80w7AWp6m4dOkWd8TYG/3pNKKpU/lv27h7nZOSWQYX50Us66laiM7OZ4XICNuUGx2b
 YsYrzFgJHsP9GxR+OQKyw==
UI-OutboundReport: notjunk:1;M01:P0:02+tBSyJMmE=;pIvVnrwMrij2mQiNkxLW1heGHfm
 +rCSaUlFzfzMVfJ2NTnEh6acgv/PIi/2MeZOKUPHmXHGcMsyCT1ngM5VWWJhXAhQAGgmQhuVG
 7pM4ybnHMvIUJD4DKuGLkjBb0bugUCdqazl3N/C5ceL3Q5fYfGMQLbc4UGxp1KUmQaedhwAUc
 cdeUZBelc4bg1Ze9dWIX6MME1/cF2IbfTi9vguhZhwU4cPYNMGboj/JYQWVVUTzJfu1lQoVum
 DluMlnmy2sMfWUU18GzsxOCiaID2OecWHh70lHEOXJuexgnlBicnHLIEDLfj1LxM9w/wkChYy
 v8dCaE3qsMnMNSJ21W4n+Msz0FMOKStX/t54iskvbm+TpBu0vOoUe+FpiigTIVAjIsM6ntVc8
 tJPbeBEpw2jMYnlPo3oK1c4WSV4/qKOhRunz6HFwnt0QMJAHmqk4JQpuX+UigZSWUxe3rKK1W
 MopnIKZJwcZ9FlexFRkjoFF2e5iWomqcwVk5kOdnLjqman9Mi/lZNPSeJGfn+unrrk3fxnX9E
 Di4sLHtO6MlrzL0z1o0ivlftyKjLLiouTutViRUsjjd+fLTvSGBQ+udE8/eOP6Cv/kxB9OVT3
 9YfyzHVlcPfwYr8PQgDIEiGBRxJun1XEkY3v5mIjd6nNz8AhwRW4ItDlt/UtGGRpzKATHbiA/
 jh3YxSaZhJoi+G4G4LDviYkGGmIdf7/fQwelrGPKVENLj/RwoOLt1pIa1H8J7Of/h01mIjZxI
 AQz+WF+XaW7UA7fkkC2yUWdqY7c6SbRMa/UgzkDu0LDTAIbvkE0dljEl9Fi/XqOKt4lHeLQQo
 RheH9WYCJNe9n3jwOMEpvaTPmAttj6lrsMdiH/bsw3QuF1JuyEJSy3lUJAutjLzRIW0B277iJ
 rDNCfPXwGdX7iaQ==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: +wnRfQk7AgY9

Le 09/01/2024 à 19:45, Samuel Tardieu a écrit :
> Signed-off-by: Samuel Tardieu <sam@rfc1149.net>
> Fixes: ff68dacbc786 ("armv7m: Split systick out from NVIC")
> ---
>   hw/timer/trace-events | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/timer/trace-events b/hw/timer/trace-events
> index 3eccef83858..8145e18e3da 100644
> --- a/hw/timer/trace-events
> +++ b/hw/timer/trace-events
> @@ -35,7 +35,7 @@ aspeed_timer_read(uint64_t offset, unsigned size, uint64_t value) "From 0x%" PRI
>   
>   # armv7m_systick.c
>   systick_reload(void) "systick reload"
> -systick_timer_tick(void) "systick reload"
> +systick_timer_tick(void) "systick tick"
>   systick_read(uint64_t addr, uint32_t value, unsigned size) "systick read addr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
>   systick_write(uint64_t addr, uint32_t value, unsigned size) "systick write addr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
>   

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
