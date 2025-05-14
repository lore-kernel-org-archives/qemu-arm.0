Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1188566njb;
        Wed, 14 May 2025 06:29:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU3vG69MfITns8Y40vAqIB3YlxG9LBO1eL5lSnmM/2spcQXqTxl5LyhZiVKy3Rx8JAEBQpTG1OPripH5Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGpoDfKEow6nHwssZ+YHNl0j/n0bUXAwwY5ZyTNSfDSufqHtkU18Kv4iPe5IoUXEyIFx9E6
X-Received: by 2002:a05:620a:2910:b0:7cd:146:3f9c with SMTP id af79cd13be357-7cd287c999bmr412312885a.5.1747229345861;
        Wed, 14 May 2025 06:29:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747229345; cv=none;
        d=google.com; s=arc-20240605;
        b=Qm0havaKF0l1RxO1eByG19QVoVCYp8NUgmzK9uYVilGXzj6eMitlZkgHqeSNJ8dp5W
         07eXa+GPzoAbeFwDNSWO1oBOaw2FX2EwlsA6WMcSdy+8uB3XKmG1EoSRmBKs+++SB4D0
         tGs4OGhvmdN97XajscGhT1GyZRit1lHReNKS1OpvSVI+5X42OHzUb4e0R0LFh9EikCfv
         xogC2PkjN+Ohv+elihRoYN5a3c1QT92prJVYrxUat4StqIxdir/NRGCOZAszBGcZwAMo
         O7DAtEi6CJNJOeTAPfPnfaXigs9fZR1MHw1jqaN6WouDBMRv3uOboBvmPauAfYyNOMro
         tcqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=JHn8AdZYh5rmsPnGxFSZXcuFWSETN8ZSVj1hGnT9uJc=;
        fh=XL1vsVqBurpXOV0YIkxstd1w2kkcT0XNnPEnAEU8CaI=;
        b=UDhTSwwSvqNpofd3YL3xRzvotYGT79p4vqa9tUak3ZcCH9zlJXp4tMFFfod/v7Od6l
         Jig/v3L9+NX7pPk9yuN4YJ73WpT5HY/2jYJkkrHS00ax1s926xuyIfIBOFFKPImCSPgG
         kmPCVprT1L+g+zuiJjRAkyNODGEEbrOEzhNw3JnSfM44kGcJBj5ytQlHZQb2ZJcXikpV
         o2WTemm/VArgCyVZ7FFRyOLhUHLcKscW2iq16iTsfDwarxgnA+ytB/jkomV0TZLx41Bd
         WwqhdgkLBSQKxY3FyQdebipdT+MCCem0B9goHwmYnPWycfDVoGaTSkgS4NiJCGvLdoXZ
         lwPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NFyqIvO8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00fe1a10si1475309685a.377.2025.05.14.06.29.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 May 2025 06:29:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NFyqIvO8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uFC9M-0001JD-2n; Wed, 14 May 2025 09:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uFC9K-0001Hk-4M
 for qemu-arm@nongnu.org; Wed, 14 May 2025 09:27:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uFC9H-0006FA-Ak
 for qemu-arm@nongnu.org; Wed, 14 May 2025 09:27:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747229270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JHn8AdZYh5rmsPnGxFSZXcuFWSETN8ZSVj1hGnT9uJc=;
 b=NFyqIvO8P5YzBj/N3bZMg0RGalqKOlZH13wd9gcPvkgjLDcZthtOwS1hyk+Ny6yMA0C//7
 gaOm0NHKzeY+iy268MOgXhx2RV2O/9HBQv+1+TdHLe0ZwjdedDMls6uSK9L6HXuYQLyDl8
 IiTqeRmgn8VnhwKhbTuyRvBmsWpuN7o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-eHkGCCgQOiWqkp7qakB-qw-1; Wed, 14 May 2025 09:27:49 -0400
X-MC-Unique: eHkGCCgQOiWqkp7qakB-qw-1
X-Mimecast-MFC-AGG-ID: eHkGCCgQOiWqkp7qakB-qw_1747229268
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43d0a037f97so35434255e9.2
 for <qemu-arm@nongnu.org>; Wed, 14 May 2025 06:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747229267; x=1747834067;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JHn8AdZYh5rmsPnGxFSZXcuFWSETN8ZSVj1hGnT9uJc=;
 b=LkVndndIHNnaF6VOPa+wKEwW2sbYKznxJBhws1YmImXjlZ2QttTZjJGvKeIgTsvlvp
 oAo3RZcP3Z2766WNdNkL6C6pvTVLWbY4wry9kFMhEsWtad8FVMTnoNgmTBsgrkwUqZVX
 Ze6fhtRG8X5WUI8mg3Aj8p8H4A2jZM9pTnMpQDmv5C930LW7xfwxIElz2dvXhtTyF+qp
 l9mapIFE/m46q+6zQ7KfkhyWag+V20x11F2PXPpxx7FNnsq1iE8482UziEosQUftxYCQ
 dZhCRuOM1LAGqFSXU66IsGgjwAlR+6lMEMuZ7Cjlt6PUX1SXWNDJGu96UbB/4DTKYhtW
 n9zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUKaGLHpydD0dweK1FMVlOg0qZ16Uv+x17YHirqTqjzWVPqV3ZkOJbEcqiZloUVi7TIdl8id92MA==@nongnu.org
X-Gm-Message-State: AOJu0YxUy1YH1eKy5kFUYKXwYNlVW9vHzh3fF4iV2L13lFIlPU4P2JcI
 eOI6U9tpZDWkXiXrcDmRnxbc5IssGV8wgT4ZXSMlWbrP/kl/wcZDTfiH0xcNd+Z2htwhlvyKzt8
 o0xkFSIErVilQYXNmpNoWzH9mUwO2QDcnibLWolL7ZS2B7l3C3/FoIhHiRsnr
X-Gm-Gg: ASbGncv0vwtb6XtoS2OZobnGc8G+rgTFLjgUztIupTVNmbvucj0Zl2VOzsF7OmP/qin
 yo59s7iZPtFENP+07nhrqC+JpqY4rn9yMuTcm5Gdx+ww3pcgXY70WYCliJxci9E+SfobB732BR3
 UMve6/ZODgQ/K0hN7ApmMTO6l0miSaGcR9c7ionv/WxPwctTL+TyszMbds/Sr6w/MMonmqSj7eC
 v492mGH0w3CC2or7yqlyhLnxgoKZSTrcmY79vWKwUrG6ST88e4jOWQbQvdzbux5H5Y7CGJs/VOp
 tRwbNSG7PM1Y8AAaPRZ64MYWIM/vE353ojy7r3/Fdf2eDOfuZA==
X-Received: by 2002:a05:6000:2510:b0:39a:c467:a095 with SMTP id
 ffacd0b85a97d-3a3496a67camr2677114f8f.24.1747229267660; 
 Wed, 14 May 2025 06:27:47 -0700 (PDT)
X-Received: by 2002:a05:6000:2510:b0:39a:c467:a095 with SMTP id
 ffacd0b85a97d-3a3496a67camr2677089f8f.24.1747229267305; 
 Wed, 14 May 2025 06:27:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58ebe4fsm20074754f8f.39.2025.05.14.06.27.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 06:27:46 -0700 (PDT)
Message-ID: <395b5586-67f9-48db-9830-c4ace0b85e47@redhat.com>
Date: Wed, 14 May 2025 15:27:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] hw/arm/aspeed_ast27x0: Fix unimplemented region
 overlap with vbootrom
To: Steven Lee <steven_lee@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, longzl2@lenovo.com, yunlin.tang@aspeedtech.com
References: <20250514090354.1461717-1-steven_lee@aspeedtech.com>
 <20250514090354.1461717-3-steven_lee@aspeedtech.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20250514090354.1461717-3-steven_lee@aspeedtech.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UjME-gBucHNhWw-y4lrJTWFvc8jViFYJTX_kN00Yd3g_1747229268
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.686,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: xQul9Imsigit

On 5/14/25 11:03, Steven Lee wrote:
> The unimplemented memory region overlaps with the VBootROM address
> range, causing incorrect memory layout and potential behavior issues.
> 
> This patch adjusts the size and start address of the unimplemented
> region to avoid collision. The IO memory region (ASPEED_DEV_IOMEM) is
> now moved to 0x20000 to reserve space for VBootROM at 0x0.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>

You didn't reply to the question I asked on the v1 series.
How useful is this ASPEED_DEV_IOMEM region ?

Thanks,

C.



> ---
>   hw/arm/aspeed_ast27x0.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> index 1974a25766..bb61c30cf4 100644
> --- a/hw/arm/aspeed_ast27x0.c
> +++ b/hw/arm/aspeed_ast27x0.c
> @@ -23,14 +23,14 @@
>   #include "qobject/qlist.h"
>   #include "qemu/log.h"
>   
> -#define AST2700_SOC_IO_SIZE          0x01000000
> +#define AST2700_SOC_IO_SIZE          0x00FE0000
>   #define AST2700_SOC_IOMEM_SIZE       0x01000000
>   #define AST2700_SOC_DPMCU_SIZE       0x00040000
>   #define AST2700_SOC_LTPI_SIZE        0x01000000
>   
>   static const hwaddr aspeed_soc_ast2700_memmap[] = {
> -    [ASPEED_DEV_IOMEM]     =  0x00000000,
>       [ASPEED_DEV_VBOOTROM]  =  0x00000000,
> +    [ASPEED_DEV_IOMEM]     =  0x00020000,
>       [ASPEED_DEV_SRAM]      =  0x10000000,
>       [ASPEED_DEV_DPMCU]     =  0x11000000,
>       [ASPEED_DEV_IOMEM0]    =  0x12000000,

