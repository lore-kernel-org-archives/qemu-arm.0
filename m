Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1682772njc;
        Tue, 11 Mar 2025 01:00:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVJTAqYpXyabT1fF+s9mO9HRIPYEr4iLgQcYzV6pFUlYUq3It2HBCqKtmQcPHcmtIoHqn3yT68BjFU+wA==@linaro.org
X-Google-Smtp-Source: AGHT+IEVHDF0MWHPqSKWELS/Fn/wneNxS5H/w8lDFBbD5SOALPRGcotQJtStmXSUzWWawSSxBHiM
X-Received: by 2002:a05:6214:194b:b0:6d8:9be9:7d57 with SMTP id 6a1803df08f44-6e9006cb12emr257010126d6.37.1741680010326;
        Tue, 11 Mar 2025 01:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741680010; cv=none;
        d=google.com; s=arc-20240605;
        b=IcIPdsUL+4H2V9YsgMuMRYfHylJ6Tyoicp0nL7NjoTK/20svURHwpPHdr/pb7VRa//
         MALL8IrcqyMOM+WtdXre5Bwq1OcmepSLF3Zsv7QSZjUwkbZV21WvSvvBNcr204bUD9kv
         z3ue1GqXtlJnkpM5WhUr7v2eWLdPAI9TcUlWLOcAED/PBwExUT7iksniGTlclIk9Q22C
         rmmej4SEOxAFMcfcbB5PpYI/xW+v2opzLniSpH1YtOzKad6cDY1mN5ZY5TEAvIB13slO
         /rTfwOY3J8Br5eHn4e5QAo7DU/IIw1HkiYy8T0VgKkJDnq5qZ66sYVIBb8UR/d/KqQTi
         4Kbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=lsAXkVU4PqTyZV4VExPcU6clrv2gU9fj+UlA7H1nc24=;
        fh=hkllP/zt9NZ7KUYE9oAhYp+rNaT4FRPLYVM3DdYnrl0=;
        b=ArJ7zNMM6SRTeaQJtCgksTYzhTyC8VP7BRoq1u772aQVRBiBse8gSx5hWRMn03C/kQ
         dLnBP4tQtORBl/8hI8kYotcK0wrfZTg1hOCpkXUrteEJ5uUF59Mp26xt6Ne65sxjKssD
         FAyiIuLVYROZAoprk/W3lOq8kgtVZA0PY5sMRsHKTq1N9EbhlAY/6mA8WSgRWuwsXSIu
         kZiBdo5KFBTbsCnBh3S2owj0eIzp/3QoLQ9wDYCA+9PdloDPbE1hyHlMc4Qm3Quq8GsE
         BUqadfdv+7SBGsUBNJvovVli3skMo6ZDzu1vPYRJWnI04OkX8lHaOztTC6CKICJ9w9ub
         9cag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mACvpSkV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f7175738si105489196d6.356.2025.03.11.01.00.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 01:00:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mACvpSkV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1truWo-0001yb-Qc; Tue, 11 Mar 2025 03:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1truWk-0001vZ-6w
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 03:59:52 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1truWe-0004xK-Oo
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 03:59:49 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso23883345e9.2
 for <qemu-arm@nongnu.org>; Tue, 11 Mar 2025 00:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741679982; x=1742284782; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lsAXkVU4PqTyZV4VExPcU6clrv2gU9fj+UlA7H1nc24=;
 b=mACvpSkVPcFzTRlOx0QcphTXziIAL5VIwwx/yAbYdMN3LgoGSZDn/iOCegEjfsXGpS
 AL1mQJ97sVUsq8NnwnQMeasJ1QGeqXdnBOr7l6h8HHH6yVXl2/Fbvebuolq2xpXCTswG
 tnQPx5Rtm3EwTaN+hy1nit/ZlSYL79VtZvdx0KS5zf/Uay8SVy9RBL72waX/VdW6np1v
 8yUZDPf4BFTsQsbn63tKJBu+QcX6Y9PRDhZp6lCjwHovUcPyBwsGFhoZimgYb84umZLk
 NSG2AoYsUcQEsBUwifj1+/8VhpZKSyNOrLwoshFJcXVRXbWnKdcbJQ2Wjk9C+tonauo6
 xKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741679982; x=1742284782;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lsAXkVU4PqTyZV4VExPcU6clrv2gU9fj+UlA7H1nc24=;
 b=q9ESlNvgy6gtIGeOIUdIXzoendpYidh9m59dr+a9T/TBmbYN5LgUq/LMP65V8vImdK
 o9ux5Y8ki+CV2STIdFiwecXVRzmVk6zFhILTJHeayT+TlwtE0KfapvDWLqgkJfje4UMh
 IxpP1II1W6aLTd+2WtVUJTNoOxDzfDxEFXu7wzqETV+m2tkulT0T3aWzxkoJo0u7tu1g
 x0RarfcrzFz66TvqipZeMCmIS/JmbkoOLC92LJWhAeFReN5gQpXZu6pQtgA9PgRNYKf1
 PNxoktmGZSDJtIXqmXSJq7+25zaMS2QyU5XVkAzqI9McH5pbMFD3RyjSed7ZwW/62vYh
 kXqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8eZO7Sd+2BtvCC9FeCv8qlL5rLiiR9brffn95ny0wE8AzpY/xSiHijCijG2+j6gz2GqSWOGpahw==@nongnu.org
X-Gm-Message-State: AOJu0YzJYrc3unuIyO1McdTcNpH8g2FQ3h1hszliAzwzKp7NqPu+KJqa
 DsZqJP8UDiMlWkaypEXU5qjLD9srhzXDztFkVeAX5QoojLUsIu/g2hToKrGlllc=
X-Gm-Gg: ASbGncsZ9yyyLRwXQ8fPNl8FqgpdvjKgkeqcyICyBMPLiMd1gIZD9a2xziv57HSwvjG
 O2/nzuJSVTVxI4sA9K+0efOcMcnpiy22OINxDzsqA3VStbz5ivu136QBjAcY6Mr2GAB2iZxKG47
 3CGeEEAid9G/mCumrZI9+1ScghopcPOEJhfjF7hw4dDkR9SmstE+Mbf0Qpx4Y1mChcLuMVTMKnn
 Q3647tKdzuP8m9Itot96NSYsAiPZWRcUklDhBazOG9ZztKScyKSZHoRAy+jmzvYlhMgMfYg5lXN
 vBQ+bJAbdE7N1DMJHbTVbtoWZrm8bDDdFe9KSLIfUWTA+HsPkpms2xZvNxY9A44eVMgwEOzEHct
 oTADS9snb810Wp5fQmNy0qu8=
X-Received: by 2002:a05:600c:45c4:b0:43d:1f1:8cd with SMTP id
 5b1f17b1804b1-43d01f10c46mr25744805e9.24.1741679982087; 
 Tue, 11 Mar 2025 00:59:42 -0700 (PDT)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c015d2bsm16877067f8f.43.2025.03.11.00.59.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 00:59:41 -0700 (PDT)
Message-ID: <8a6e833b-a5a3-4c87-942d-488d1a5d9fe1@linaro.org>
Date: Tue, 11 Mar 2025 08:59:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/14] hw/sd/sdhci: Remove unnecessary 'endianness'
 property
To: Bernhard Beschow <shentey@gmail.com>, BALATON Zoltan
 <balaton@eik.bme.hu>, qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Troy Lee <leetroy@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-block@nongnu.org,
 Jamin Lin <jamin_lin@aspeedtech.com>
References: <20250310000620.70120-1-philmd@linaro.org>
 <20250310000620.70120-15-philmd@linaro.org>
 <D6E3A7E5-7FF3-49AC-910F-02214E8E15AF@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <D6E3A7E5-7FF3-49AC-910F-02214E8E15AF@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: BoK6gN7HRESI

On 11/3/25 08:31, Bernhard Beschow wrote:
> 
> 
> Am 10. März 2025 00:06:20 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>> The previous commit removed the single use of instance
>> setting the "endianness" property.
>>
>> Since classes can register their io_ops with correct
>> endianness, no need to support different ones.
>>
>> Remove the code related to SDHCIState::endianess field.
>>
>> Remove the now unused SDHCIState::io_ops field, since we
>> directly use the class one.
>>
>> Suggested-by: Bernhard Beschow <shentey@gmail.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> hw/sd/sdhci-internal.h |  1 -
>> include/hw/sd/sdhci.h  |  2 --
>> hw/sd/sdhci.c          | 33 +++------------------------------
>> 3 files changed, 3 insertions(+), 33 deletions(-)
> 
> I don't have the code in front of me right now. IIRC, the PCI subclass sets the "endianness" property as well, but doesn't need to. This has to be removed, otherwise creation of the PCI device will fail.

There was a patch in v4 doing that, but I dropped it in v5 :)

