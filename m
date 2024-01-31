Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp1281102ejk;
        Tue, 30 Jan 2024 22:05:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGD3BVaiOt93ZlrkGOK6faFVmhpQ+3ov4kc4fKC2D7dfcfZ+cXJnDIWL8Rx5sNQRdChP7Ng
X-Received: by 2002:a05:620a:3728:b0:784:222c:e155 with SMTP id de40-20020a05620a372800b00784222ce155mr750492qkb.69.1706681121358;
        Tue, 30 Jan 2024 22:05:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706681121; cv=none;
        d=google.com; s=arc-20160816;
        b=FQOUax57LAquyAKiE5vMZz8UHnzu5wMqK0vSspFrqswmiiM9lQCxEpAOIqwxJ50xMm
         29gOtgwtXfUJRezkdlPvk92dAk3biq0sJxk4yVYAz7/ss4D/M/hufDGSBfscR5yeGuGB
         2v7snQ+X4R0B4tDK6nTaHkAKG/n70PrUvP1g4cistQQfAGT3stPu75M+yfSVKwFmhApB
         kfll1xw32oogYcOiusDXchx9zk/GXNFducD1PcJTp8e7Q00QqKabjJ8jW7lNGMQAFTEO
         YbBjYUYD3UO6XKIZksfs4jkcCDi1va1nM4IDnoU1U/01Vj3PZudUTAXZJTnUAsodfZ2m
         KNlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=rFM60Mt5N9nRUevYumtZflSE3V3qEQARu0pRchpCkrA=;
        fh=zDtG5F514A6EWrsTv1E33irBQCazMKAL8K8ESgkuw1o=;
        b=FPm8Nbcj8GCgdpFlLncgqLHb9YeFWVuvOkwrEF3bLiozxKYSLykCmCAFwp05zlx9NK
         ncBeg4MEMwCj7aqQYA3EfXUb75u11ozuKkPeSwtVbnt39ifqvKRpWVxGj1QrjdfXtXQI
         qJYHH3ajvxiam4uYIXwy8uiUMIvN5W94rTV19iYFwG05oYTDMHdNgnoGUqZ5nBCeMnpf
         eyTKcw1hDGulQdVpqLtvgpb/Zu4kHPmFGLkTWiOjaQFJbLH2xHSlA3KRs03Dwb4a9KrY
         pEzWz8RVzP1TRTuQqvWX963pcu9VC0JGxSa8AZAWG6FQw6NChu7UXKXZUmXQRpgxHMfs
         6sNg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id vw20-20020a05620a565400b00783ebf59814si8327449qkn.360.2024.01.30.22.05.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jan 2024 22:05:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rV3iJ-0002lx-F3; Wed, 31 Jan 2024 01:04:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rV3iH-0002lN-Qu
 for qemu-arm@nongnu.org; Wed, 31 Jan 2024 01:04:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rV3iF-0000cG-R6
 for qemu-arm@nongnu.org; Wed, 31 Jan 2024 01:04:45 -0500
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-y1i_2l01M8ensHf97gf1Lg-1; Wed, 31 Jan 2024 01:04:40 -0500
X-MC-Unique: y1i_2l01M8ensHf97gf1Lg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-40ef75adf5fso15591645e9.0
 for <qemu-arm@nongnu.org>; Tue, 30 Jan 2024 22:04:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706681079; x=1707285879;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rFM60Mt5N9nRUevYumtZflSE3V3qEQARu0pRchpCkrA=;
 b=s7+T7fC2OBhuDYtEnPvbzCyzIAY/A8zYqtryO4K1cZwUyNyjulqX7glcku/AWcOn1W
 3A9Y+eVHQL1B6hWxZzknvVrxf4iWen/3u9hVA8i2MdfO2pj4ZWhzguli1sDnks3/4LMX
 axBeGXdtBsgVM8A5enrQTgF+sRf0x1cQYhjuaon/BfGfED29Aw2URC5G1KSeCsSuBJvh
 wlqif0i5MYMi7B/quPa8GhNRaZs9MAyA2szPrGZr8pEbJcObA+RjMoUto6PFX/OINwf3
 yRZkjOUgtDylvPpwnFOuYtXk8lWJyjR3roLdPxhpp9V4Oh5LqmQRWcdYAV0JOoQ/0w6j
 SBPw==
X-Gm-Message-State: AOJu0YxRW62crXINPu0bCOe3JgmjVtseHxgWK3dYVPI3FhonoZMtAQpw
 341lOvWc/n4aAgwtfO7uVkpfgcRaUOMmru2W3AKlSJkYu8t5qHuWc2i67O8n9SIZyb3TxCHEpkO
 1vDgg7G3meG/af0p4ALiYLNV65s/7rtSxIHhJEu/Ivy3lJN93wA==
X-Received: by 2002:a05:600c:310d:b0:40e:e8e1:cbc3 with SMTP id
 g13-20020a05600c310d00b0040ee8e1cbc3mr493531wmo.0.1706681079515; 
 Tue, 30 Jan 2024 22:04:39 -0800 (PST)
X-Received: by 2002:a05:600c:310d:b0:40e:e8e1:cbc3 with SMTP id
 g13-20020a05600c310d00b0040ee8e1cbc3mr493516wmo.0.1706681079200; 
 Tue, 30 Jan 2024 22:04:39 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-177-196.web.vodafone.de.
 [109.43.177.196]) by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c290700b0040ecdd672fasm493417wmd.13.2024.01.30.22.04.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 22:04:38 -0800 (PST)
Message-ID: <5a143d3e-7fcb-45d3-ae40-744da897df83@redhat.com>
Date: Wed, 31 Jan 2024 07:04:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] Add tests for the STM32L4x5_RCC
To: Arnaud Minier <arnaud.minier@telecom-paris.fr>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Laurent Vivier <lvivier@redhat.com>
References: <20240130160656.113112-1-arnaud.minier@telecom-paris.fr>
 <20240130161316.114675-1-arnaud.minier@telecom-paris.fr>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240130161316.114675-1-arnaud.minier@telecom-paris.fr>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: u6acrWM6adI7

On 30/01/2024 17.13, Arnaud Minier wrote:
> Tests:
> - the ability to change the sysclk of the device
> - the ability to enable/disable/configure the PLLs
> - if the clock multiplexers work
> - the register flags and the generation of irqs
> 
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
> ---
>   tests/qtest/meson.build          |   3 +-
>   tests/qtest/stm32l4x5_rcc-test.c | 207 +++++++++++++++++++++++++++++++
>   2 files changed, 209 insertions(+), 1 deletion(-)
>   create mode 100644 tests/qtest/stm32l4x5_rcc-test.c

Acked-by: Thomas Huth <thuth@redhat.com>

