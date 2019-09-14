Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2213519wrp;
        Sat, 14 Sep 2019 11:19:29 -0700 (PDT)
X-Received: by 2002:a17:906:318d:: with SMTP id 13mr43327326ejy.281.1568485169707;
        Sat, 14 Sep 2019 11:19:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568485169; cv=none;
        d=google.com; s=arc-20160816;
        b=VDMwvauB8yQ+aL5M7FMADilMfq10S1fuABPyHOOz+wEdnxBsdbKuGlvkOdoNJFNjSV
         X5FiU6JSbjLn/jFS5dQSU0y009UOn8dyKu4FxUK2cR6gh/ngD6LRjXmEveIqa7rCQbyP
         rtjtaBDP1VNFnemw/s80eZwPA2XJnpfyYzvutPEoz6T8WX++jbIwbAG5QAdo7p3eJT0x
         wUxqTlx14buIZuX7i5G5PCY6OVL64B31ZuJDM2MgiYvkauLQ0awFIbtNQvofP5i0mlOR
         vpuINNODXc1jbjTZNzYg19O1K7F4lINDGasx/cPnxnZJGxY6ELxNub5TXP8SrlfUGpeP
         E/iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=4B41yq9zdNdnJksgpIQB+qz5dKo7g8LzE3zX2pNz53Q=;
        b=nPKSw8mVGo146v5lC7DbXM6nv6omi2NiEiho8LkY1/NcTAQKimYjdcUm1Cd2lQtLKS
         KDw5xqNlE6sENguRSbWgpXc3lMK+wkIs/BrfIZ35ByyIER1mB17S6512OEcY6K+chHNs
         YAqc6EYybcasl3RsWsQqiQJ0OLwFWSb/SgV2hFNWkrx5kjdSMtAZaLTi4YM0yHs9pR9k
         gHTMjVXpkRwwGk0g70dGDurShmcMsaUlOYWzzWZAI2ohChnc6pknpPnp66S00Us8XhBd
         edZLxOMPiky2+joChT3LlnhXLqQxIDJacuRy8p1eKHzSwySi1uBoDNRFBaWNPshMbSSM
         y9aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JrVHdwBm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g7sor25937659edp.24.2019.09.14.11.19.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 14 Sep 2019 11:19:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JrVHdwBm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4B41yq9zdNdnJksgpIQB+qz5dKo7g8LzE3zX2pNz53Q=;
        b=JrVHdwBmRRSZvZEkASmqqTjCTnO2OYmvqk/FM6JO8bUH56R/5bPHFb+sBMBVfcdNKe
         e5G64RA6Qn2H45CpKsVkPSIqVozQN1sXLhcqKnA62EE4UBXYsT+JchBoOizxGRzM108R
         odFglAYdft5Kl+vHt55P+A0e83foE7QQW+SkaE0At+R8leQXe4S7wPp7N0dHVeCLo4FQ
         enpY++M7U/Lnkr2/FCkBdoMdeOWRF7yITFY1trBCRqwMiZKvX4HOUeeT8GHPz3uMLk8W
         PXwwrf4AWPSorXp/AAa3ay1OVGiSwgkhzgBUpJDtCGZOzZJjkUn4RnOFnZNS/5xzkt5v
         K6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4B41yq9zdNdnJksgpIQB+qz5dKo7g8LzE3zX2pNz53Q=;
        b=WPokNJWPyqB1MwyHsVHfNFRYMjnLM2th14aX/6dcB5UXymwOV/7WtzaYhjVTb48ZrY
         OqgYYa+8Fyc04CqUbCugEOAo1WQYimPjUd99sfp9spvlR0oS/ipFoc7fzIMSzGvjvT62
         qTbLapUIg0kmrV8glT4vXRkYHJm7CHWuxjfD30R0W8JLWj1pmbBMTHPUVToFhpTOaCVf
         oQq19KXDdiqqdamEd3VwnHG8ra74eUE8jRfCnSde2/TICHi30U8IHIYJjgAObwEbwlV1
         /d46kzZybL17es0f5aT97w3/ZgsWjI7u7OLOVd/I7rYjDvSBTXYUVlzV4OumKE8dN3eE
         mYsQ==
X-Gm-Message-State: APjAAAVRe1OvTfTqPCpJ67o1lvRhRsSY6vwwmMPQvPIFOZ8dRXDN6+jF
	FMxd7pdK6oF1TtfoF+wxoKu+ySDu
X-Google-Smtp-Source: APXvYqxeEFi5rmHJrJm/1pMQ3VwLVr7ljjOQDjmrK7U1zimD6tUp8Oc7A+BLuC9s2CodyCEUz+/ziQ==
X-Received: by 2002:a50:8f81:: with SMTP id y1mr53635205edy.181.1568485169421;
        Sat, 14 Sep 2019 11:19:29 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.44.107] ([185.81.138.21])
        by smtp.gmail.com with ESMTPSA id y22sm630728eje.42.2019.09.14.11.19.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 14 Sep 2019 11:19:28 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v1 4/4] elf: move ELF_ARCH definition to
 elf-arch.h
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Aleksandar Markovic <aleksandar.m.mail@gmail.com>,
 peter.maydell@linaro.org, Riku Voipio <riku.voipio@iki.fi>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
References: <20190910193408.28917-1-alex.bennee@linaro.org>
 <20190910193408.28917-5-alex.bennee@linaro.org>
 <CAL1e-=giNc1e+kN04KqHFQGkJbP4BKziQyxVd3-RTtL+UOfSoQ@mail.gmail.com>
 <874l1j18vm.fsf@linaro.org> <5880b9c9-969f-fa79-f7f4-a45a6568635e@linaro.org>
 <87woeaahrm.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <edb400dc-9542-14b0-6eb2-0192c29cc808@linaro.org>
Date: Sat, 14 Sep 2019 14:19:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87woeaahrm.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: UWuQvoe0xiZ7

On 9/14/19 1:51 PM, Alex Bennée wrote:
> I think I'm going to stick with the gross TARGET for now. It mostly
> seems a way of avoiding building per-arch plugins. I assume most out of
> tree plugins will be targeted at a specific machine anyway.

Ok.

> Anyway I think that means I'll drop this series unless 1-3 are worth
> keeping as simple clean-ups leaving out 4?

Patch 1 was supposed to be in another patch set, right?
Patch 2, split, is still a good cleanup, I think.


r~
