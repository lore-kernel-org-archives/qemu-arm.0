Received: by 2002:a05:7022:43a6:b0:92:a90b:6588 with SMTP id bo38csp1369901dlb;
        Thu, 9 Jan 2025 04:38:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVQxUA+XIwE4JkWXYnvTBipc7MxA3sXQwaZ5nCmiAMis7jbc5Njj0UQJfnb9ayYmL7AC1WfgKmLA9d9Yg==@linaro.org
X-Google-Smtp-Source: AGHT+IGaQP+ekdfvXPssRBywFL87OPxbbL4IXgCNQNKg7i9p3U+Xl5xvYRnpEP4S77+0EDac98Cr
X-Received: by 2002:a05:622a:1482:b0:467:6c95:19e5 with SMTP id d75a77b69052e-46c70fc79a2mr87674451cf.8.1736426339545;
        Thu, 09 Jan 2025 04:38:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736426339; cv=none;
        d=google.com; s=arc-20240605;
        b=FJnt5L0cdUmBhnH3ZTru1udqxBMxUmfjpRy19rcTaN5QSQLfGedQsQtey62QK/WzwK
         On/sDiAPNLd3JUsqWrF/g2sJg79RldX5LGl0d0iouM3uwCv+iHa+GYDo/EHjt0Rf9fL6
         9aj1cMZmL4H9uJsq3I2EdnCYENw1zK+j8QamSMJk7zJudxNkWqhjMEok/izDSVVU4LaM
         n4Zt3IRuWXZjexvZA2QBnTmC4nN8q2yI/IMGZuqEvD5+bKUMwef60tzTOQHj9yfAauRW
         Bw+DgH16rnaTJkV3KnMfSfq5/1O5PSpzkLjxWAT7iOf790yUYQs86b6SB6nYWCS4b+j/
         ct8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=sCtZHRaXQh/eN53aoCTddO6TXo2ZxSf1Akwc07lgQG8=;
        fh=CX+0e7ybFh2aBY3yIak0REEpUfWA/px+fY2KZmGYPAM=;
        b=i8APfXiKPbmMRHrcVDp8UnbNOZpt1osw573Q1WEkQw19cfzGigV+cFYYFuoZLhf+tj
         XJ7sBXkEQ7AIj/VO9AY5hF1pKv3TOfII2hGE1SfsvcDK8cR3YfNeTTl86FaUlgqde6aV
         WL3Dg49eQI3Nxt40uPciFs7gD7aJ4NwDpYhw1zHGTM/lMMX+PKnFa5N+UFkH/2VdwAQh
         ktr8XsJuhMZf9IuauebzrG4oolIza++KUlaSxwZLT88y/6sUpZN0aSy2dO8sg++LsdQK
         +aMw1hOTbi0wiBTA73r8WxU9h9mZq+VZGXRpML0y10r9RuKkGnsku+B0eI9C7cH4aP4I
         d1nw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PfPCkslD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3ebbee62si483564281cf.410.2025.01.09.04.38.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jan 2025 04:38:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PfPCkslD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tVrns-0000AT-RB; Thu, 09 Jan 2025 07:38:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tVrnn-00008n-0Q
 for qemu-arm@nongnu.org; Thu, 09 Jan 2025 07:38:20 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tVrnj-0004wL-Lr
 for qemu-arm@nongnu.org; Thu, 09 Jan 2025 07:38:18 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3863c36a731so640818f8f.1
 for <qemu-arm@nongnu.org>; Thu, 09 Jan 2025 04:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736426293; x=1737031093; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sCtZHRaXQh/eN53aoCTddO6TXo2ZxSf1Akwc07lgQG8=;
 b=PfPCkslDNPhuogHkvyL59wn+kSDz8kxSTGUxpQNXadCRtgcJvadcgL8N5/anN66KAw
 wHt/4sYWN6tSdrKyzJ7rdFKQYmIzXj4bv26OPQFRXUXjZP2p5TceII/kgLW3aRwfjsnC
 wnZopIEiohodEq4RKqETsYlEzPoHpXEvPwrVoq6kciUUnYQUNN8povhgDCqVH35kRWFz
 qrvryWLODC50gWSa+t/i4hYxebuE2QgaUw92ADy+nZ1v+bFj/GhkdavysTQjeOXMx8B5
 R3vvLn6ZtF/hP3YNLsdHhmopD3llEO8jFqdgycXJwX/JNHAaB8ZmJc9/6BqxPL4oL8ml
 KPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736426293; x=1737031093;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sCtZHRaXQh/eN53aoCTddO6TXo2ZxSf1Akwc07lgQG8=;
 b=WxCelgw92n5FOvJ2CCfWJiPA5UULOsGUyzResDZU+iRk+DmPYbkNGn/u5Ls4/4kZwB
 CKVxxOJtdr0um8sy7Zv4zEspGivdBjzThz/nCbgW/I6nmDSCf6tUBG/XFptYyWJf6Fhj
 Zcdx4ZvocNzSxt0C6yZGj94bdW3T5BvPD5mfnnb6vgBevIRjrSOxpe2UmyHKz4pPYsFW
 FzGSdvjI7C7cVV9GJXYgrQbicO1v9Cb43D74HWSskYDpCsSY3RyCgz6lj3LRpj1XIj0M
 Rqi5+/HMkEpEsEMELpwnzweJ1u8LFxjVTzuwbubWm1DrSzUpMOmYwV9ICz2dGBlChpvG
 U1qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNVJwpe+EH/l2imMejM6BbKt+rZWRqvfBPRhJTs2RPdbypzuJBIexLpc9EFB+r8w4JD3c1SdImNg==@nongnu.org
X-Gm-Message-State: AOJu0Yz8qt+s4M5Y/GqCQc1evVgeVzxkGM/32hlQhpBgd6moE54FrkyO
 qCUWKrYB8n6lN7yhpMCKfiGDYWDtdW0gMBxtIKT3WJakxSQumYYGp3uwRbPaNbs=
X-Gm-Gg: ASbGncsZ3aXqBikW7u7Ksz9IWrXzq7LkuuF8T/gwDwYG9phoHYGzzb7X3o/XkGgMW0d
 PP7KjIdu6Vtk4KNDQ+ogXQDo67IMOt559CCoiSgvq2ii4EUwfVm5KmbpY1dStnN4aQ9mwvd6HlO
 KS5QdGs21FkekhF04qRNoq/5wXkiYvrl4mIeCeE2h3XPh98k3YEzZWqhq4LyGjy6VkKovx6/91a
 q/oUJKz9z7+tfPj/IanXwVTetJQoXR9+6Q8w8yClnMj4aadbhsRQLS1XRf9IQW+lIO24fFvc0Uh
 g4SEwrplBHk8vXC+SkPAFXFZ
X-Received: by 2002:a05:6000:1445:b0:385:df6d:6fc7 with SMTP id
 ffacd0b85a97d-38a8730ce5amr6011841f8f.25.1736426293352; 
 Thu, 09 Jan 2025 04:38:13 -0800 (PST)
Received: from [192.168.69.102] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e37d447sm1717278f8f.4.2025.01.09.04.38.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 04:38:12 -0800 (PST)
Message-ID: <d1ee0d2b-0266-4d26-9832-0f9fc05fb3b9@linaro.org>
Date: Thu, 9 Jan 2025 13:38:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/14] hw/i2c/imx_i2c: Convert DPRINTF() to trace events
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, Fabiano Rosas <farosas@suse.de>,
 Guenter Roeck <linux@roeck-us.net>, Andrey Smirnov
 <andrew.smirnov@gmail.com>, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20250108092538.11474-1-shentey@gmail.com>
 <20250108092538.11474-13-shentey@gmail.com>
 <696c9a80-7311-4a95-ab3c-f85bc0b38e6e@linaro.org>
 <258e62c4-9e7f-432c-ace2-a5c459d8e016@linaro.org>
Content-Language: en-US
In-Reply-To: <258e62c4-9e7f-432c-ace2-a5c459d8e016@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: eOyNpB/Tn5Gm

On 9/1/25 12:56, Philippe Mathieu-Daudé wrote:
> On 9/1/25 12:43, Philippe Mathieu-Daudé wrote:
>> On 8/1/25 10:25, Bernhard Beschow wrote:
>>> Also print the MMIO address when tracing. This allows to 
>>> distinguishing the
>>> many instances a typical i.MX SoC has.
> 
> I'm not a fan of using peripheral address access, because it
> can change i.e. when a vCPU is accessing it from secure or
> non-secure mode.
> 
> I'd rather use an 'id', a 'name' or even the QOM (canonical?)
> path.
> 
> Maybe we should directly cache that as Device::qom_path, so
> all devices can use it for tracing, and we don't need to set
> an id/name property when creating the device...

We already have that, it is Device::canonical_path :)

> 
>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>> ---
>>>   hw/i2c/imx_i2c.c    | 21 +++++----------------
>>>   hw/i2c/trace-events |  5 +++++
>>>   2 files changed, 10 insertions(+), 16 deletions(-)
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 

