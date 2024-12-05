Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp194531njb;
        Thu, 5 Dec 2024 07:11:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXekSymj2QRoZuDP+HSi1/8TBT6xMzDA//hKMbB5gmkA5FWq+jk2/NVDwnHQ7JyqFHdQ1UQyVqD2Ce9BQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFsRXFyupcCAnfouQ64PdGZ1TMqxXsknX+nMe9Mh/Pq8c5KXFs1DLFQGuEV2H0iz0LrZT9M
X-Received: by 2002:a05:622a:11cb:b0:466:8a95:d1c9 with SMTP id d75a77b69052e-4670c3dbdfcmr162849611cf.47.1733411477558;
        Thu, 05 Dec 2024 07:11:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733411477; cv=none;
        d=google.com; s=arc-20240605;
        b=RHf4PkwnWxa3kz/PmbTTNEpSmczb3b4GK70n/DEjoGFuQdIy8uhEimoe0nHCSOR4JR
         CK75YmTqAU42GbSbIGBPGtsfNIDMIGXTZql2B+D/a0rjpzMjJvkCeq8YJBKQxUtYNkN+
         cwr7c1quy3qMapYtJq7gusH9cC+ZJy0c1U01eycrJIWj1f+RjI+ihcsDSiLZ51i6dVoK
         53hO2NeLd5UN/barS0goiRWWyQ4M9lQOrktuaJ5xt8FCT36qoX0Gw+71vd9WB6RPj8rX
         zVTby3AVjRxCCz6OG4FQ+7TYcQUVf50BW7QAp+EZ/HbuYmaXuhsQSeO80Oge656Fag3D
         j5oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:content-language:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=tZN/imqR9tvxlIknkTQXLTdt5ltqSOgCSVPhrXj949A=;
        fh=4JxHWc36KgDAv6c863mMVfbykNqaAkEy4Ng2sBK57No=;
        b=BVMztmLXWpEA+3oI9IjW2AVZ6tmWP+RxSwZfQCqRNNDbht1m1E5PoprH4A5aitcKyE
         s/k5CBFd9YE4PVFGzSiM2LC80QVOn4tPWIgT2QZM/bHfEePvuc/3zmnD+Qf/xhNBeppF
         wbp1pZAXUOSNDNNMeQB0FAi/dGUy6EOJ2yaCUtsobs8rEKjdn1r0YtvpZXOKPPTiBc98
         ipJNJ5aLdkKAsfXJYNXGOLaXCb/ag9xE/YnDfqKqZ00IHvmLKbbcQqwgvcOzGUsJQhea
         2NpJtJwZNJiphNc313p3f4NKYPTVHn3ihRUrtvAqmcQTzwPCxRQ19U+ZzesaAi1TgyUB
         FYEQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q51kpMcg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467296bee5dsi18997181cf.123.2024.12.05.07.11.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 07:11:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q51kpMcg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJDV5-0005bO-Q7; Thu, 05 Dec 2024 10:10:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1tJDV3-0005ah-JS
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 10:10:41 -0500
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1tJDV2-0005KP-4O
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 10:10:41 -0500
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-53df119675dso1397268e87.0
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2024 07:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733411438; x=1734016238; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=tZN/imqR9tvxlIknkTQXLTdt5ltqSOgCSVPhrXj949A=;
 b=q51kpMcge0fWUOB1blJhO8ptLgze1u8kIP1EpmDOYX0WHyzEPOO99csA3NEgqW5ZmK
 PndkGq8qFC0qjEMhxDC7aAf/6LzU2NzpBfs+YOlVeKynEoS4Xmwxd8F0BryII9U4Wh3K
 nJtb9riY+jiiHEoeVYsl9MFtZDFRAcFHih6HOXFyI/moZlNFlp5seqto7y9BR4q2IkvS
 7EVSW67/9yF1QbVqvv898ez2koqcIkjCBEkrmkRbVJyupzGL4CMLm+ZzYVgcqPpROLwB
 PyL0hsYAgRjfr9tYCXO7aaIXEodhR/RnI1CnKoP7Erw8q0gNAN18ANqTwJlAcb0aO2xq
 8QUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733411438; x=1734016238;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tZN/imqR9tvxlIknkTQXLTdt5ltqSOgCSVPhrXj949A=;
 b=lj1zU2r1Ez9CiJOd2pRbqKJ5vV6Ku/8AaNDkwqgv/fvSmZYlOlcESCEmnsc1EYchRB
 O0xWy+lAhFWYi+BhcUMl+Ib8u7+ypmHD6jwP07MrARLCSXd/4jpX9gZwrWAqLIhDEy/X
 3S6WEjy2PrWB1BTRbPz4r3X8zNbb/BAxMBECPK6ScTBTkD2hhLwTC9EZbKdtoecCjs4U
 QejXJboA3ovCeWt/LpuQ81orTEc+MbqorGnsjnTYlH8Z/TvQNebhsKudfIPQ0nb1k0yT
 YnceBdJdQnnII6oaz5aUrt+mh0nn9IBLOQigCXBMrHIfZDiAQZV23A4EfR5tiBU7UtF4
 lsCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhulPcroc9qSsSkQLSGwqNhh6soQ82ZmbM44v56l3fqiAStDeJhWUKQ9W9JnoziFFiDSXJW3DJAg==@nongnu.org
X-Gm-Message-State: AOJu0YyOkqcW9Mdkt1NNUkwYVrqHwqqUWJxecM09JTx4qDUwGG1WFa4w
 Ol48sllHwDAkvWSY9zB8nSEQ0Mdbp+9vgKGQPB8JdT3ufv67TXgCJrgRfzNw+JE=
X-Gm-Gg: ASbGnctf3d1s3VQxhCgY0NgPkzy45MwpZCABjo6IxskPM4jRKfBM2YEk9UbEe46+QUD
 Yekd3q8bqEWZ2ckh/ZASbjp1L8NgLC1CLfs98XPg3y1ERwQQAcsl7SV2a4EVE9ViKclipngoLqZ
 bxStuCNDzC0bV3YlMOBiOW5U01Dwqj07Nfde4Fmf6O4r41ClJ6SvrgSHAsea999v/i3eoN+4JAT
 7RMcA9CKobiUpRNpgNSP9bved0mxjgQyc220SjpcMbhwwZ0ENyvBvg/1gXdDLjf3gORWxNcRoHk
 qWGDBT+A6jjF2Umdo/kkBuTCUg0C7WE=
X-Received: by 2002:a05:6512:1249:b0:53d:df99:c5ac with SMTP id
 2adb3069b0e04-53e12a3197cmr6841131e87.36.1733411438186; 
 Thu, 05 Dec 2024 07:10:38 -0800 (PST)
Received: from [192.168.210.26] (83.11.36.235.ipv4.supernova.orange.pl.
 [83.11.36.235]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e22947958sm268242e87.54.2024.12.05.07.10.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2024 07:10:37 -0800 (PST)
Message-ID: <641a4d44-1406-4d3f-a87a-a12fe156b2fd@linaro.org>
Date: Thu, 5 Dec 2024 16:10:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] hw/arm/sbsa-ref: bump default memory size to 2GB
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, leif.lindholm@oss.qualcomm.com
References: <20241126084928.252067-1-marcin.juszkiewicz@linaro.org>
 <CAFEAcA_SkZ+ew8AAVpBHuw-9YW4S5wFbB0Vqx+dBzXf97JGDGw@mail.gmail.com>
 <cd635753-4e2c-42d6-bb7b-d558d90f59d7@linaro.org>
 <2106db77-88fb-4113-ae09-9bf77bce6ad7@quicinc.com>
 <c4245af0-3dd4-4cf6-a786-c15fa079ad05@linaro.org>
 <18ba737f-d669-4e6a-8319-fb5052223b26@linaro.org>
 <CAFEAcA-P5P4AJidWcGgUScBTe9-K_C4Qm9N2o2XWnfiT81LU=A@mail.gmail.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Language: pl-PL, en-GB
Organization: Linaro
In-Reply-To: <CAFEAcA-P5P4AJidWcGgUScBTe9-K_C4Qm9N2o2XWnfiT81LU=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: +osjdBgSKN4e

W dniu 5.12.2024 o 15:53, Peter Maydell pisze:
>> This is sbsa-ref not sbc-ref. Let it just have that 2GB of ram.
>> None of existing SBSA systems comes with such low amount.

> Yes, I think I agree here. Changing the default RAM size based on
> whether the CPU does or does not have a particular feature is
> unusual and not something we do on other board types, and it
> definitely doesn't match the general intention that sbsa-ref is a
> "looks like real hardware" machine.
> 
> The problem with using 2GB, though, is that it doesn't work on 32-
> bit hosts, which have a max of 2047MB (and

Do we do CI on 32-bit hosts?

RME tests (queued to testing/next by Alex) already use 2GB so in such 
environment we would have failure anyway.
