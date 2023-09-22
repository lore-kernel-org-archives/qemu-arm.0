Received: by 2002:a17:906:5293:b0:9ae:5796:d6c1 with SMTP id c19csp1404102ejm;
        Fri, 22 Sep 2023 08:38:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHj4QlNs/vQrqMsXvbN8Imj3OFIh7hCqfdL3qUr4FQRWJ9wBVrq5ghw1Vx6VHt4yd0fQqSI
X-Received: by 2002:a05:620a:4708:b0:76e:f3a3:4ae1 with SMTP id bs8-20020a05620a470800b0076ef3a34ae1mr9602992qkb.52.1695397106633;
        Fri, 22 Sep 2023 08:38:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695397106; cv=none;
        d=google.com; s=arc-20160816;
        b=Y0aCdz9EQvS0K5xX2bQZVxei+56IQkEJ8ef8WSD/3x3woLzmdb34i6seF/E8FjGPqV
         YaYr2lKg3EiVewpwXPet0BkNhX49/Q636mV17u1P4wgAwlwo6yHADSMqxZfDH3/AXOSf
         X3XGBbH1O9mMEu1CWSbwSJQ31zbMBMYGMjteEg7vwdxJmp1lQpHf79SfSvwWrWW6K0IA
         L50M772XDfv4KHNup7GwOg81XyKj31LnouYIa6BoBs53Xmeekza/QVJ86UePctjmOzM/
         FEVMgVBUipj8FDrCPfnjdG8GXiQRqhu5Iy07aOWkJ4WakPcA/AqKnQlEeuUwsqudL8Im
         t9Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=AFCaAzdNrvDh4+Q2kMe8z1q4ZlGOkyzo+a3Q+1yHIcc=;
        fh=vSFYUDMPKebNxmLyxRDie694dMHU8rn9DIgzC+PKU5o=;
        b=bvuOYC2k5IUvxCyUf98PZT5KM4ObEVA3MTDW304tsv7bCe4f2GMgMxCNfgLvyjxl28
         cESTBh/fkR+WxvMo0aeIdjUdsVbSuHBxE6mUYa/9j65KMgPdUwZfNzDqyEeN22+jKKki
         /zm3oVKubdRWQWwLSNuN3JFx6FqAFAbbvbAsL0eKEYiW/EPz/8+hUrbsoLyQdsLjxMPb
         jARv8tEc2JmKuDFxP86Q0arvPgfNC3d6h6OufK6VNVzloLH6jf4/LQlXUsolrp7nTCRf
         CONtl1bejg5UDeU+7Ox5qKebizPIeWcfX2unMO1simYGPZ2FYWJbeFqMfH5IVyAY7ha7
         oFLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="YWqn/g9u";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h1-20020a05620a400100b0076d9ea6edb1si2435897qko.746.2023.09.22.08.38.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Sep 2023 08:38:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="YWqn/g9u";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qjiEX-0005Gj-2T; Fri, 22 Sep 2023 11:38:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qjiEV-0005GT-Jf
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 11:38:19 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qjiET-0001l8-W8
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 11:38:19 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-32172a50356so2222263f8f.0
 for <qemu-arm@nongnu.org>; Fri, 22 Sep 2023 08:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695397096; x=1696001896; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AFCaAzdNrvDh4+Q2kMe8z1q4ZlGOkyzo+a3Q+1yHIcc=;
 b=YWqn/g9ux6UaKnSZmblG1nysMXRiqX3EG1qgiMmJCGWemukUWOGGJehpHvpiUWNMN6
 uhymYaVvcYeFZMgTLjuk6N8l+P8mqcCN8IGM0SheNhEMJA6iCJ1Te1bSzNQYGRK/jzjQ
 Dfp0GYwPcKWqa9S/iWQ22hWVhnq6OdDN+HrtQ+SwV0xNOWMofYTZV2fqCwMk03jWiGga
 Fx/Dm7msFZS/XvpxmAGX8hjlJoa6UD0oGgMdRpC/vnTdbwpPyaLSy8soWvgKuA5+OU00
 4Q4aBP4Xbj3EAv6iejSZ1YTh49sfNtLmvLmmVsnVBOyEqpLChqNBtcRAE081nFqq3GL2
 NG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695397096; x=1696001896;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AFCaAzdNrvDh4+Q2kMe8z1q4ZlGOkyzo+a3Q+1yHIcc=;
 b=usPK5uDYsKn+E2XjIBWG0asZFN5upfWiQCj9g2yccrJsnF6amvcN/n+aO9voxPuyuc
 dcSXd0Mxma+E3xsTMBQW7C4bFXzCpc5rbMvXL/Z13OOCshS2A2OKm5Ozul+WXt4YkSZq
 EQNllCiOhiUsEYcZ+8qUaLGJyEPrAyaTUWzGC3KFt+8FGgYcw3pv66vTUvLbhHeJ9K6J
 nt1N/V1JDYLAze2qP5CRn4uJ0+LNzeM04GURl/Z23/Kk4nDjRCfeBa4SFGKXrJDzH71j
 j0ahkFZik8QHB5I3yRRyT7BWBPSuHxfN6MH/BdFDKA+YomkL7mZi2fxXZc3pB3f65J2f
 lVPQ==
X-Gm-Message-State: AOJu0YyqDC3jhDhi9oWyCNVUrwq/5uUVVj0y5PXGy1APA3hpctOqOYpw
 yd9dqLuC619m0rwMMDYqq2HNNe6fI7MqmWLQlW25doz8
X-Received: by 2002:a5d:6a0f:0:b0:321:71ae:736c with SMTP id
 m15-20020a5d6a0f000000b0032171ae736cmr49562wru.7.1695397096554; 
 Fri, 22 Sep 2023 08:38:16 -0700 (PDT)
Received: from [192.168.250.175] (234.red-88-28-23.dynamicip.rima-tde.net.
 [88.28.23.234]) by smtp.gmail.com with ESMTPSA id
 a2-20020a5d5082000000b003143cb109d5sm4715197wrt.14.2023.09.22.08.38.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Sep 2023 08:38:16 -0700 (PDT)
Message-ID: <6a79b3ab-e726-2f29-2ded-20c6dc32c170@linaro.org>
Date: Fri, 22 Sep 2023 17:38:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 2/4] hw/misc/arm_sysctl.c: Avoid shadowing local variable
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20230922152944.3583438-1-peter.maydell@linaro.org>
 <20230922152944.3583438-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230922152944.3583438-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: e6IlvALUyQne

On 22/9/23 17:29, Peter Maydell wrote:
> Avoid shadowing a local variable in arm_sysctl_write():
> 
> ../../hw/misc/arm_sysctl.c: In function ‘arm_sysctl_write’:
> ../../hw/misc/arm_sysctl.c:537:26: warning: declaration of ‘val’ shadows a parameter [-Wshadow=local]
>    537 |                 uint32_t val;
>        |                          ^~~
> ../../hw/misc/arm_sysctl.c:388:39: note: shadowed declaration is here
>    388 |                              uint64_t val, unsigned size)
>        |                              ~~~~~~~~~^~~
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/misc/arm_sysctl.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

