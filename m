Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp269423ejy;
        Thu, 29 Jun 2023 03:56:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6uApTcMvBt9d9Ied5txoXQLpuqHOs8YEkSEDdX/3A6MACHiKChEU+/pIgXLgFDxZ3lEEIH
X-Received: by 2002:ac8:7f50:0:b0:401:e0b4:a93f with SMTP id g16-20020ac87f50000000b00401e0b4a93fmr12787320qtk.41.1688036192228;
        Thu, 29 Jun 2023 03:56:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688036192; cv=none;
        d=google.com; s=arc-20160816;
        b=breHr68+tNhi5sqV3+g7kWlBU4A6jNp0yvM6InJ5SVlWtWalRwKjGaLX+dXQywbEI1
         00lfKOzS9waQ7Q2c0TPKYmswX+V3dzF8A54mnUa6ZWKQvCQsFGRakc2nQZnw3tqT+/pd
         JWZ7EkESGdkeSVK9RgdRiTeZeaZYVAuICrhEgSM8tHftT55OP4D766qfOcjxfkC9W1a1
         S6uBt6a5R/DAoCTbr7CJW2ZayXVpZfGfnPMTGF98wKp0/yZZvTYPZM5mnqiJZbfZb5kn
         V8fTxA2EjD7afMGlF9ZNl38tB8fdQk/vC8Nn5XOFRGH7WU3Sk16skl2q8YdfQtonXyYl
         Ha4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=QT2BFc8i927d1TsYWok/iWivYKndiSBD9tPu5+cIlcc=;
        fh=cnIP+q7TosNTKO2jivzKHWZGa1q/6tOadfuIcB6j5ug=;
        b=wEexPJuH/ZVFGW+sra8GDnuwAXuuCX710MSf9faAZjMOtXJzKS3ZCDK3yNxky0tkGj
         5ceOS6WXC1JSqAaBBKcuxZl0KRB4zhrVBbvxOCIfG1KHyh6L0FGzBRpdaRjGahbpTiDY
         ewoQwKXfpMRYI8cp+/kec/zYe/r8aMIjWQiU6qZXtqLm5TKs5QkR2P6bCZGj+r7J0ATv
         JipXaaJRE4O47w60S6L6Bdv9EeKDJbhNjpYVFXPZZBiikM+SzCieS99PLlRwKKXhicfN
         RSoPh/Kdys21H4QRjSLBqOqQsTJxZNMrzc3GRJtpqwNCjAXZzNX273ijdlcjazGL8H7p
         H8Ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L7o7SeyY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d19-20020ac85d93000000b003f6ecf7d37dsi5926817qtx.427.2023.06.29.03.56.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jun 2023 03:56:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L7o7SeyY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qEpJv-0000PI-7N; Thu, 29 Jun 2023 06:56:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEpJt-0000Oq-UC
 for qemu-arm@nongnu.org; Thu, 29 Jun 2023 06:56:14 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEpJs-0007wM-Ct
 for qemu-arm@nongnu.org; Thu, 29 Jun 2023 06:56:13 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3141316b253so541352f8f.3
 for <qemu-arm@nongnu.org>; Thu, 29 Jun 2023 03:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688036171; x=1690628171;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QT2BFc8i927d1TsYWok/iWivYKndiSBD9tPu5+cIlcc=;
 b=L7o7SeyYGyj366o8ocS1ihk5d3PlfOkAGTvK8vTnVt9zfJ1q0jCozJjBqRVg6pd+Zk
 eGVjQWO+onqnzZ+QpD5iFTqyWvBEUUi3+U330w+VPrYChiKeqSwvDO7KmIx8ux9giYzb
 loaeKmfMgh6HQuojk+gevyFOt2HX6hExMl0w2JWAFDL0LBWAgbpCGga319mrc2lZGORC
 vUqXJR/ZuxZGR/zk0SgevfOJjUbfbwXL1jJFnuwx2dj2bV/Z2ryeJtl4lDu1GfM+vDij
 mbrXi/ShjA7t7bZnTRJ2PEzblFlKLBUQEzL869nvDiJ4L6rJdGKkDbeDcfuNKwrRs8k1
 Vr7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688036171; x=1690628171;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QT2BFc8i927d1TsYWok/iWivYKndiSBD9tPu5+cIlcc=;
 b=SVp5XKvvuNGGk4j/+raffzUEzc/BS/1eXdqqgwev3fLNJSO2uTsGL436sl9zGKh/VP
 cBOXh2Ds/7yFd1Vk4hhrOevqMo9hDvy4WjZC6iOBxZd5z/uc5puaAnsRSCd10Y6IUpoG
 Lo8qdj29E4Tj+qEQImymAnZmljAlBxiDP4qI636lo9CTfkZqSn1N4C1XB1cBL9tYRcCq
 p3YIGdyJ5HlshgJsPRbZYNP3cSKfJWsK2GsNg3JI1to55WzqWZQYpfamvHqrNeza6w3U
 qiCP6K2qxwfZZFBn2/85zO8Sy2OfIom+iZWE4IgE4Re18RQZAe+PtFtIb2HCQMdqftlo
 NtRw==
X-Gm-Message-State: AC+VfDw9lrp5Pbaln3Iy0xEAg1vUcBRvUuJJ0tNb/YImioJuT7q30D1H
 O3A6MgQK9d8sqngat/ZGjjN1kg==
X-Received: by 2002:adf:ef02:0:b0:314:77a:c2b2 with SMTP id
 e2-20020adfef02000000b00314077ac2b2mr5019865wro.32.1688036170643; 
 Thu, 29 Jun 2023 03:56:10 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.166.242])
 by smtp.gmail.com with ESMTPSA id
 r15-20020adfe68f000000b003111025ec67sm15549405wrm.25.2023.06.29.03.56.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 03:56:10 -0700 (PDT)
Message-ID: <744350d6-f9f3-e8a3-51cd-5f998ee1b366@linaro.org>
Date: Thu, 29 Jun 2023 12:56:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 04/12] hw/ssi: Add an "addr" property to SSIPeripheral
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>
References: <20230607043943.1837186-1-clg@kaod.org>
 <20230607043943.1837186-5-clg@kaod.org>
 <CACPK8XencE5MMgYdQ5H6iV_rTHaynv-UJYHZy=y-DaCXYBWWXg@mail.gmail.com>
 <62e69c35-4869-8cc3-5983-9f83ff649da9@linaro.org>
 <7f37de5f-d31d-b51c-340d-a04ae99230f0@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <7f37de5f-d31d-b51c-340d-a04ae99230f0@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 2VZUtYxVgf9M

On 7/6/23 16:15, Cédric Le Goater wrote:
> On 6/7/23 10:28, Philippe Mathieu-Daudé wrote:
>> On 7/6/23 10:06, Joel Stanley wrote:
>>> On Wed, 7 Jun 2023 at 04:40, Cédric Le Goater <clg@kaod.org> wrote:
>>>>
>>>> Boards will use this new property to identify the device CS line and
>>>> wire the SPI controllers accordingly.
>>>
>>> "addr" and not "cs" or even "chip-select"?
>>
>> "chip-select" is a good suggestion!
> 
> I thought of using "cs" initially as it makes more sense for SPI
> controllers, I do agree. But then, I tried to be consistent with
> what QEMU is proposing today : "bus" and "addr".

We should use a description that stays close with the terms used
by the hardware we model. In that case "cs" seems more appropriate.
