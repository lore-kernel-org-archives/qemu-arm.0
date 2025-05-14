Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1283526njb;
        Wed, 14 May 2025 08:45:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV4+YnS3kx42uccoMAIARttQvGg1nk+oueMCqa2pSUmvF2PwyilWcQq42ebRfJBfBLHCklm/juEKYKKww==@linaro.org
X-Google-Smtp-Source: AGHT+IFTBHrSYvPhGwvK4JDu+/4JMu8vVMSsEbTNs4ric9+UsbS8YzTFdL9iQ3fbuIMx/3Uqx2V9
X-Received: by 2002:a05:6214:27cb:b0:6f5:11a9:51fe with SMTP id 6a1803df08f44-6f896ea686bmr73345386d6.36.1747237500885;
        Wed, 14 May 2025 08:45:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747237500; cv=none;
        d=google.com; s=arc-20240605;
        b=FTBBAU6cvljYY6PR+sP7zXH6YS17IDU+dTYFGMKakwziviD5d9kX1FenYP3SantB/R
         rdYidtrD8Z05KaPER0UcY2Uy3k3xck8kwC2n9CbQ728jH4G4pf6An/XqUzFqe39ch/hC
         LCAw8iBDkYMoprYzTL5s2zgrQrfOYeoZLidmPeLeEGAl5xvH/2RV9/DpR94Xeb6//dF6
         ikQby6SywTnk6ZtgKZNerWejPYSjrsQxcr7q4BaC6/qq64A6PO4yDbFzkBNcJm47nlPv
         O/bcNoPSVKngmgpsZTGZDsJFmHedLAY0zyZ26W9NHeezcltTqwKsV2Z6Mm4humXBaU4x
         tCkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=TmdMe2lbnU6i1EE6DgHrHUWFPxIJNIaFivomhQpt0IM=;
        fh=p/hgTVqszmgltOjA9ca8Hp1hJg7lSRyE6dH0sbV44io=;
        b=dDp8t2uxGeForxqkENBMQ/Ey4pRavkV5uz99c6tj7lp81BU8wbV1FplAmlJcZonia5
         UiRRJ4c/fYXxKJ0ddD2aC04aq4qlbzybEoZE/sbhV/2sd+9386Nsf7dCmLIAhA37MaLe
         Ps8kXdasHO0If72ZzlqHLlC4MeZr4bEM6M/Pw2ps+KZ+aPOyDIf8lFzh516aaTUfdeBT
         JXF2SaNs4nejQlrqlLq1RLA1YXUz7jlj09SEQ7QCRGPer1GC1XZF/p5BazaM7KqJf1OB
         cHA/rJTQ/XY6Ik8RiOhi3+dug1cYUCBulMmCmhvyeWldA5MwJPdRjQQ8Tv/RrQ7daow0
         kSLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DvXMWNXB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6f27fc200si90597856d6.165.2025.05.14.08.45.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 May 2025 08:45:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DvXMWNXB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uFEHZ-0001WD-S9; Wed, 14 May 2025 11:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uFE6S-0005b8-Jq
 for qemu-arm@nongnu.org; Wed, 14 May 2025 11:33:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uFE6R-0001DB-39
 for qemu-arm@nongnu.org; Wed, 14 May 2025 11:33:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747236781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TmdMe2lbnU6i1EE6DgHrHUWFPxIJNIaFivomhQpt0IM=;
 b=DvXMWNXBetdhJL69lAPmsQEArV0u7LI8N94Rb6CM9YL5CiJ7tNExyKYM3+rWQcAsYAH+kU
 goyRgp5u+749vw1G8KOCdNohCQ9bZ/YMPVBcHNXxa206J0Ikcntw8rIjn9Mp5XaqWbE7gT
 aj1/Y5gnjqx91fsxA8D5Fe/R/KHKaXw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-9W_wO5nQNRa3hCgNYvqN6w-1; Wed, 14 May 2025 11:32:57 -0400
X-MC-Unique: 9W_wO5nQNRa3hCgNYvqN6w-1
X-Mimecast-MFC-AGG-ID: 9W_wO5nQNRa3hCgNYvqN6w_1747236775
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a0b6cb5606so3261413f8f.0
 for <qemu-arm@nongnu.org>; Wed, 14 May 2025 08:32:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747236775; x=1747841575;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TmdMe2lbnU6i1EE6DgHrHUWFPxIJNIaFivomhQpt0IM=;
 b=n6jiUoq2yRNzDfc1k50IKyDn3l5iLyrcW+R87Sw6GPkMx/z4mQYJyzGI9FGO+SnKym
 ptR6RoEIR0TcqHi4z4yCZw8XzbnIXK/OkPsqLddKhXW7PUE2I6WQ2YR20Tlap7h4/dLe
 mI9iJ68FqdlJFFpqua7Kgz/8/tW/y1riJY84HjT3B/+ia5qC99gB2n09RFUQePlkVbKh
 6D5DNypPKRIo+9xJEH3u5yulLtV2ESW6Gzh+p4RHGop5REhOzrsRT74FQpPACpi/2UiW
 berTYtgSC6Q/TGpj06zHQ24Z5AAy0pTapm6Lk+c/BaDLC5MjBUVXaGmXhQHunoA79qxm
 TC2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoJ2CkbnCaevKAtVAd5ccmLmdE5qD3w5JXZ+XrdC/kmjlRQf0WvRthxdrKv+vQK7Wrzd860R9Nsw==@nongnu.org
X-Gm-Message-State: AOJu0Yx7fDzuIrI40kWW+UQG6nydZ72F+RNqVEiDUmMAkQwAZAGBIBoL
 65G3MOFkhF2WRwT3ek1cdoy2dMXoCX2+F47U7OL9Q/2+DBzZCjycdNYMp2I0f+HTLMwvIVg+Bea
 MyrveaQYBVeZNgCiYG5kgpwzqMvwmH5tU4J4QGqu6N1E5HsuTrA==
X-Gm-Gg: ASbGnctM8Z+jqI68ce2kA5Amu1EV4cAGUf1druwsQ5MuezT548DZGrgRO3U0BESaYOG
 J1uV2QHXHq0IDJXTTo5HQ0L9cPxc6pydsUvsvJG0wM69nrrE3iEss7F0gBSeDngGQa8B3NSdtIK
 I54VzAcC9J/Vspg9d+E5ljv5mGlRw6SGhi35f40TkevHZ8z+Ux9E80xEytIAMeXDlz/gx/u/Bhv
 e+8hPDfH+7PJVAO9+u9jm0VRTMPzbiWR3A2cGSaYz/Oz8yX6zFVK9EoY+X9NX9jcC59CVqGUmQh
 czlDfTlAhpgvhOcmBlIC2sPZg2bZ0Qosb+267lTWiGtUFRKeWQ==
X-Received: by 2002:a5d:5f8e:0:b0:3a1:f535:e9be with SMTP id
 ffacd0b85a97d-3a349694ac7mr3138875f8f.7.1747236775385; 
 Wed, 14 May 2025 08:32:55 -0700 (PDT)
X-Received: by 2002:a5d:5f8e:0:b0:3a1:f535:e9be with SMTP id
 ffacd0b85a97d-3a349694ac7mr3138838f8f.7.1747236774942; 
 Wed, 14 May 2025 08:32:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f3368f2bsm37110115e9.4.2025.05.14.08.32.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 08:32:54 -0700 (PDT)
Message-ID: <fc2da193-dc90-4824-b7de-fc426c38029a@redhat.com>
Date: Wed, 14 May 2025 17:32:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] hw/arm/fby35: Map BMC memory into system memory
To: Steven Lee <steven_lee@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, longzl2@lenovo.com, yunlin.tang@aspeedtech.com
References: <20250514090354.1461717-1-steven_lee@aspeedtech.com>
 <20250514090354.1461717-5-steven_lee@aspeedtech.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20250514090354.1461717-5-steven_lee@aspeedtech.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VCYSLXFoQqu28eJF_KA_7Iq_h0QMyUFVqvK9GfAYFLs_1747236775
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.686,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: IzU6jHBHVv/i

On 5/14/25 11:03, Steven Lee wrote:
> Add the BMC memory region as a subregion of system_memory so that
> modules relying on system memory can operate correctly.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/arm/fby35.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
> index e123fa69e1..c14fc2efe9 100644
> --- a/hw/arm/fby35.c
> +++ b/hw/arm/fby35.c
> @@ -77,6 +77,7 @@ static void fby35_bmc_init(Fby35State *s)
>   
>       memory_region_init(&s->bmc_memory, OBJECT(&s->bmc), "bmc-memory",
>                          UINT64_MAX);
> +    memory_region_add_subregion(get_system_memory(), 0, &s->bmc_memory);
>       memory_region_init_ram(&s->bmc_dram, OBJECT(&s->bmc), "bmc-dram",
>                              FBY35_BMC_RAM_SIZE, &error_abort);
>   

