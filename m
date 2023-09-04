Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1181015ejb;
        Mon, 4 Sep 2023 01:19:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWhEMNh5/FcAPheI9krYIaKIZNtq7cbeo0afwq+jMRv9SBArSSFdjC3+mxB5wMk0mNUqf/
X-Received: by 2002:a05:622a:202:b0:412:2ff3:50b2 with SMTP id b2-20020a05622a020200b004122ff350b2mr8569282qtx.35.1693815565614;
        Mon, 04 Sep 2023 01:19:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693815565; cv=none;
        d=google.com; s=arc-20160816;
        b=ErH2nLZlkujuMyAi3FicG9ETDQtHDtB1lOe0LT6MPntKWCtFlhuNfxicmxPiSilTja
         Q+BJvXHmznR8mEgeqhNWYtLg3ocoTP0jT2l4LdsMUTMZBCRSJp0a0XBI4vTiFsJOyIaw
         QiuYrLEfa1d0AMGP/fvp0rigx8FTUQRm31Z3eIMu9Wh2NFKzLTSWcbPYxcNqM649eNwA
         F81QYyjXzmVh/CU5yOczSEOGNKpQdhitohRL7/FmphzIieVtgkJ4odXExogdcZFZyj5T
         rt1U33jzXXUQpj5guDx64lhKLdUwf44OvzyG+KOL05n1kQrNn5zOP+y9LEQZqeOOoaT2
         Qm3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=D0UexumYOWShk0V2gIT0GLNPhlxt4L6EPj0IqfdS0vk=;
        fh=dn2NIlLylLoTjQ3W1s82qzHwXtu1FS367+U78jjAWHs=;
        b=qzZNWpLYKTNPWYNm22mkME/1ApYZWKPl5Bmab6NFP4uEaxlECzHEBulZaNFtPLggrB
         JW7hvItkbSl/TEmWWY1AguWH1xlygGoKJHAwKBdAfhgKJqal2Kl3+oUL9fWphkbvAU0x
         i8BE/vTKV6ZZANS8g7Vn29WdOKZMKxRn+M9I8AiAPSvGs3fJUIoW+U9WR8pBMdWWSwfS
         66k5Ux8Gz2EriDUaE6HskQBBCa6zqZyGkkCIyQkVQE0aux8D+Rz+m9EpCAgQUvZe4whK
         bJon60coMBdrmHRSh1oy1E7qDFjdC0yLHT/GZB6HDR9b61JFV4SpOKDsWazVQHxiMh5q
         fQTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uH91MWQj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hf22-20020a05622a609600b00410a92f1dcfsi5478946qtb.78.2023.09.04.01.19.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 01:19:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uH91MWQj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qd4nq-0007xG-En; Mon, 04 Sep 2023 04:19:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qd4nn-0007wm-8W
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 04:19:20 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qd4nk-0000Wa-UY
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 04:19:18 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-98377c5d53eso169753966b.0
 for <qemu-arm@nongnu.org>; Mon, 04 Sep 2023 01:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693815555; x=1694420355; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D0UexumYOWShk0V2gIT0GLNPhlxt4L6EPj0IqfdS0vk=;
 b=uH91MWQj1bK4jkFfjAylVLJU88ZL7skQAT2lMo6Vnlnu80Sgn4AWJYh3FyYQwqCCoU
 hyw8QWY3bRczrCj1uDLix03K3BAdBgpu5kHu3Ye2QJRgbtGykITOyY+SWPbVzlwSqXrB
 6dmZfZuaYv9rO1y2QxEN7yylmSaFEoPaY/bvh83RaCv1UAkCS5MyjK3CFUDouBFMfE8b
 zB1KpQp/RgcrOYXwjkCcFTq0uFR8QR1aOk0MLSZkPmaZL3cedBuAFRSteyd28GLpzx6y
 IvpJxtjgIZEVYkMqbuJ8CRCu62WQbavAGDQj+HfosoPviyQNahC4ZwnPLLy7pIN5Kxbr
 1GAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693815555; x=1694420355;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D0UexumYOWShk0V2gIT0GLNPhlxt4L6EPj0IqfdS0vk=;
 b=NYvZ8E2O0K8qgEn/HNTcPoKv9a6ASGioUG5Uj8U/jRdboxQxREi34Lmveb/uGQnES9
 qBYEDvxexlYZSZNvufQ2zcsooV7THZ2LgohjWXbVYtCkqwv3ul6Mcsx1MK7SWkAYI/BB
 PUU9OZgrTa8QGW7ya3NjNSW/2kN4isPuXLxZLKS6kI9uEiL8rXNF5Y1Obi9rW1JNicVc
 MQr3NbBgI4cgqSTBOlwJePQoO8S2aIhftLHn3kzK6MO+2NhR6HwA3xBinTC+3DNGsZ+i
 BNao2xZbMIluEzSbFhKJe0fjB/SLCY6Bu6Mu2gpvZH+1n30TkBvDSweaV9uDzswi8EL1
 17Gg==
X-Gm-Message-State: AOJu0YwanlAIAfrYaYh0ts9Dta8MKUwz+EYblJkElqZJ/KJ4sTcF4XJi
 LSd7rpxLCcH8JEG4sH2XZk8/IcnrOzeMeY7lKMA=
X-Received: by 2002:a17:906:209c:b0:9a6:1811:e4eb with SMTP id
 28-20020a170906209c00b009a61811e4ebmr6421940ejq.38.1693815554771; 
 Mon, 04 Sep 2023 01:19:14 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.209.227])
 by smtp.gmail.com with ESMTPSA id
 rp24-20020a170906d97800b009a5c98fd82asm5734092ejb.81.2023.09.04.01.19.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Sep 2023 01:19:14 -0700 (PDT)
Message-ID: <dd39c9d7-f829-196b-1185-e6af96600fa3@linaro.org>
Date: Mon, 4 Sep 2023 10:19:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH 08/13] range: Make range_compare() public
Content-Language: en-US
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.williamson@redhat.com,
 clg@redhat.com, jean-philippe@linaro.org, mst@redhat.com, pbonzini@redhat.com
Cc: peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com
References: <20230904080451.424731-1-eric.auger@redhat.com>
 <20230904080451.424731-9-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230904080451.424731-9-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
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
X-TUID: LRXCusUGgak7

On 4/9/23 10:03, Eric Auger wrote:
> Let's expose range_compare() in the header so that it can be
> reused outside of util/range.c
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   include/qemu/range.h | 6 ++++++
>   util/range.c         | 6 +-----
>   2 files changed, 7 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

