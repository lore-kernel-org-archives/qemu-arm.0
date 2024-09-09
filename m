Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1080834njb;
        Mon, 9 Sep 2024 15:23:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXNfcevhg8LvgU+8GIcs8Uqc8k4XWVId7YhxGw907zYFYrExbq7mq9o448P0KvSeer6GHaqZ+K0yBNHCA==@linaro.org
X-Google-Smtp-Source: AGHT+IFNlUcp70KJwTeDj8FkUIDea7fU5/wVt6+sguRERE0h+CBPs1Ul4GsBNxQk6EM/eStErj/y
X-Received: by 2002:a05:620a:3906:b0:7a9:af76:dae0 with SMTP id af79cd13be357-7a9af76db5bmr1511378985a.60.1725920587940;
        Mon, 09 Sep 2024 15:23:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725920587; cv=none;
        d=google.com; s=arc-20240605;
        b=I5H3UfbOgfXEVmE3mmVZW8P3C36Cu5zLUY8Sx0OHmhbVULqmYfdRG5ncJvWYaD7pvB
         lw+yEhn4j7oqHahA1mIoqgnt47VN+yasbGvmtNwDhjPwJIfzM46aLTCRRhRJ5FJDoFPG
         tLR/RhvriND2g3iG80O3TaIHB0dsuUVvE062fsSP1JlY89oEaWWl05HwpcYV2QEoOdnQ
         8j2bgWugop3+Vd4pHZQf0S/9BCYkkmhJH3bA+9WSRrPi7xOWyY7X1vsBpd0U43Q6VgaQ
         BIoM7VpoKq7thfsAj06xBql0LIKHLsxhOPoAT+2KwgxvON0+EZ6Lidnmy7OvOdXW3MXA
         qunQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=kXhmf0sJOO+szpAUdv4/KyunbfGxi+YgK3pdDbxI5AU=;
        fh=6kRp3K1jVRJe/0go9qIIcZsa+Wj5WXzmWLQ1QEnOntI=;
        b=CZUl5vdQUc54b9aQdlPdRXdqlep4SmN1bsG0b1VK4ETmuSfaOAOkWUnNh1fR45hthU
         MrHfvLhWnE7C2nvkMFUcSvMwGlyU0/u9YJkr5oRdOk3lCib+TCm3FelpfaT9ShHQXpx0
         vW4hA2GG3D9ywoeE8yF2E8nYH5/UV++9JO3n9t5Bx1zqeZASYPGiPD8BMSXYdVaezS/l
         Q/TfTr3wdBrbRs6a1bEE1NHhb7/VAjQExMJU3Zij4DApPPSt3RWMiUj/fW0JswXdDhDo
         JvsEhaUlXF1GQWldnuKW2rOxS7E5Ap4ER+LUWVr7gElT1XUYpjp6a8E9v89AJkGegoKV
         hf5g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sip1UWLc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a9a7a53a17si639753885a.573.2024.09.09.15.23.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 15:23:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sip1UWLc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1snmmi-00078B-Ld; Mon, 09 Sep 2024 18:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snmmg-00070f-S4
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 18:22:58 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snmmc-0000Yr-T0
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 18:22:58 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c3d8d3ebbdso486226a12.0
 for <qemu-arm@nongnu.org>; Mon, 09 Sep 2024 15:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725920572; x=1726525372; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kXhmf0sJOO+szpAUdv4/KyunbfGxi+YgK3pdDbxI5AU=;
 b=Sip1UWLcy+mgU9YE3qSdaqIQvSXFeoHNQU9vmBlvTdVfPrA1ZJiNm1JXSgtZD9ZKWF
 MXXxnzP4hE62EETU96KZS4jNjHc0a85QizPbpT6hwKH9tZexrywhEILM591/Zu2GnR8q
 XJGQbRyY9GH2JTy77Ps/6OKNo+UHpgUsUsRuQq0kFpN1kHG2sRIAPQUUWjYnxlPM7N8T
 BDnfh84HjwwO2NW6Kc6i6k4y15iIfOatDja9qNkXFqEUEzABMGzZZacIA6q7NhOWhBSq
 QXHVe/pIyZbuyuV3pKYmVeCXS4FhJ8rmvYvOelifgFQZL6VeZqiNcly+IiTaKZUJOBI7
 8x1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725920572; x=1726525372;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kXhmf0sJOO+szpAUdv4/KyunbfGxi+YgK3pdDbxI5AU=;
 b=EQZg5gwZOrwPhKO4xXQNYK8v0h+C8ie1u9aBPoSgvxa+wWDLlonuTuL+OXGt1uSOtZ
 E9UZQwU6W4//A8JalrvD0HI8QjwOHNKzIWB2qhLWh8LBS5Ec1WpfSqEiuWhoMK3HkSf4
 Fpy88klPzwoFoIOsG9zFO9KLq3+yPatENLoHoirr5noNGsBwnIEGjnUe9yas/07HEBD1
 1LQOPFCTR9Ne4ao7ar4G9iO1wFM+McjcOcEkT1VKxhr9nv2kVvSEezraZQznLWZpkKXV
 oNfAQx8/b+0tnbj/CUIEvAufNvEZ8E8R7S5n5zrrm9SwGY6Fwd+oEqEiX9x2seiD9q4j
 5luQ==
X-Gm-Message-State: AOJu0Yx5zy61zNWcX65BzLuQJckRhbyQYH6a11KkuDnJNrw8uW+/aiGr
 sDcSBJxxtk2GV67KO2FrGO85clfMZOTtYaysktYDYy/p6F2B8azh8DUINKtg+ls=
X-Received: by 2002:a05:6402:5106:b0:5c2:6c75:4359 with SMTP id
 4fb4d7f45d1cf-5c4015e70b2mr1334477a12.9.1725920571782; 
 Mon, 09 Sep 2024 15:22:51 -0700 (PDT)
Received: from [192.168.69.100] (nsg93-h02-176-184-54-166.dsl.sta.abo.bbox.fr.
 [176.184.54.166]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd41d46sm3481348a12.12.2024.09.09.15.22.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 15:22:51 -0700 (PDT)
Message-ID: <3b62b084-9783-4c08-b7a2-6b7d91c5b5b8@linaro.org>
Date: Tue, 10 Sep 2024 00:22:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/29] target/arm: Convert EXT to decodetree
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20240909162240.647173-1-richard.henderson@linaro.org>
 <20240909162240.647173-7-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240909162240.647173-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x536.google.com
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
X-TUID: m1sQw1miWD8Y

On 9/9/24 18:22, Richard Henderson wrote:

Pre-reviewed:
https://lore.kernel.org/qemu-devel/10eb7805-6de3-45ec-8d2a-f5af5f63545b@linaro.org/

> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 121 +++++++++++++--------------------
>   target/arm/tcg/a64.decode      |   5 ++
>   2 files changed, 53 insertions(+), 73 deletions(-)

