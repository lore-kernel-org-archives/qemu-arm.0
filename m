Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2153508wrg;
        Thu, 23 May 2019 12:55:14 -0700 (PDT)
X-Received: by 2002:a67:ebc5:: with SMTP id y5mr46619794vso.34.1558641314798;
        Thu, 23 May 2019 12:55:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558641314; cv=none;
        d=google.com; s=arc-20160816;
        b=vtxi+e8bZWv6HIbXtIhTeSuwyH0PBcZmfSSpJzil0ggkDYWirRY2ox4rPcA0k5s3yP
         FDOzpJiOPX3dY46gT3LlB0uR7AsIhS36bAYhaGvw7sjPMXA+6R3vaoVDUS3K8Fjmio5Q
         6RWvXOyY1L0lmJOyz5OCwSvo2XXAnGID6EAMi5Zr/T+Ka30HgIScdpK1lyaJYWQEoqBd
         Lohg4jh4/ii6X/7WYbSM56ZE5Tn+w6SjyHenWeFFdWjJ13eLwRo3ccrMmNAlugNo1vHU
         sMhTjRICyJce9mYTj8pb62bkxMsw1A8oQp7vIGj3b+tnxRyyl8xeLNC0eqKfa2lP9O2B
         4iGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=qsIKb18q22GErxgGewiJ8YfUggOdSI4elyKnL4ns8qI=;
        b=FqwGeroa/R9a11qOx4IZHyyrBDymJ4gJa1vAdDBnqvWXJwDcXwCYTq/xZcy+AANUGL
         I9p6GUsfij7NvdZQspDLeR7TAX+fi5dVnWf4FY0UPqFYITLlwcPp5bs9zVWsF4UOWDTx
         lpZUh0xPX8vRsB7mGV6UG/QVldnrGfQONF+vB+U7C39cf2wyXiBt66STiRPuxOjHCx8l
         yvxhOfokqezKoua5cb4/TgKibzEX5av3olXBHDi+xjdL3VZvMtqODrEeezu8nMAvTeJP
         Y7nhfO7aTL+1hYa30TeJke3e2uxRiUpmN57SccxvkXqSNoC4N7VSTXX/KRHEz1Zf0rHp
         30LQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=flzOO2aE;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e3sor141408vsk.20.2019.05.23.12.55.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 May 2019 12:55:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=flzOO2aE;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qsIKb18q22GErxgGewiJ8YfUggOdSI4elyKnL4ns8qI=;
        b=flzOO2aEgW8SRa9Ioan/8OlfMTq3Kg5JehRBdW2q0AfpWDzJ+plMVoxuz3hooqArwm
         Fqlbe86fk2tdaws/OBTMacVToU2BS+v7LWkh35IIKTZyYO9yY7W+CY1HNTe8DySS/T7Z
         Cq6jvMgrHJCJnvXUiR0fG3dajZt2SuKUYuWAVWkdzM2pbsJQhDJctPSo4jEUd2DFpP4s
         zqimQYlJ7Cfv2m7d6RnaNQ7n/p5QlBdhAAbXvskmRL3Pa9VX8esnJl0OW9vm69kedlnQ
         gQTjub80ULtO0NW0J347+2E2okW1r3pNS0AXzXdgjVvFgUdazt39k7ZWXHtBnbak92Lh
         /JhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qsIKb18q22GErxgGewiJ8YfUggOdSI4elyKnL4ns8qI=;
        b=VAL/Mav8JseCr3KMG4pY2glLIAs8n4JRcRkvqBgO5+D4JlkbijtkpAoDkw4i1Tg1HJ
         DQHqF1cx72t9okKZD40r4e8vSniyO7DxoCMJhcpO+GI99nehtoPI++hp2ehU0b+J8niq
         jTtmUmwHIneSIoTXTQ3V/tDq75LhD9I+s3vg5WznplJCzKnVH6E9lllxfwXvmoKIwH+U
         51Qm83TXGb8rEDOux195zXqWeD13WS3da/hCSFAVzUg3ADGZeUmsgjLeQCLrVQzie+gv
         TeDhCTAIE2ej3A7aKs489QUwTO9/WqaCu7ioVtcTx+b/d7kZ6XAnVEBAh2HFR8A1CTiT
         h96w==
X-Gm-Message-State: APjAAAUMZmYiambBGLxDjuB6ShePuB31sbdn4gbxo46YnegUKaiqqPy/
	oLywQrGbEyjVW/6LLNqqdZ+XRAn5
X-Google-Smtp-Source: APXvYqzRVZAT0oI1HDdfa48GiPy3r65nVHpEuTRGojO1WN9JSyi3w5MJTI4njT/BcmgDZiL46SBMgw==
X-Received: by 2002:a67:f655:: with SMTP id u21mr14030773vso.192.1558641314318;
        Thu, 23 May 2019 12:55:14 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.43.94] (ip-173-130-172-85.orldfl.spcsdns.net. [173.130.172.85])
        by smtp.gmail.com with ESMTPSA id n68sm470563vkd.0.2019.05.23.12.55.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 12:55:13 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 11/28] MAINTAINERS: update for
 semihostings new home
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org
References: <20190523102532.10486-1-alex.bennee@linaro.org>
 <20190523102532.10486-12-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d603d45d-4da9-bdc1-68ab-4f87c5b19a81@linaro.org>
Date: Thu, 23 May 2019 15:55:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523102532.10486-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: +b1iMF7y0mrJ

On 5/23/19 6:25 AM, Alex Bennée wrote:
> Seeing as I touched it I should at least keep an eye on it.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
