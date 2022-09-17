Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp99318ejy;
        Sat, 17 Sep 2022 01:33:24 -0700 (PDT)
X-Received: by 2002:a05:6402:27d1:b0:44f:2c17:1a44 with SMTP id c17-20020a05640227d100b0044f2c171a44mr7233261ede.18.1663403604725;
        Sat, 17 Sep 2022 01:33:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663403604; cv=none;
        d=google.com; s=arc-20160816;
        b=qtBslQX5E6kaImKwZjnjmozw2a2r2qcEGAgV/8nXtiMve/KKvN/uONm83gPQ8CYozN
         X7ne9HOF2M7SZsHinbaBcc6U5uMMqpHZj8Iee6HXuE+d0h6Vlog7Ef5boxzffrcgXzDm
         SiSyK0Nk87IVdR9ELOIcmY/Vumsdkt5fkg+HcD3MM7Pg7PoDDWObfK54Ofc+0V96Ik1R
         vZRr3Oc8HWuERHobj9wE3I51Vw2Q9dCLzNawuo6s86YaB0OQXeSm7f6tb1t+s+MrAnOa
         JHF4veL/bvwoqYrRbidgzfyzwzhIQ5KU9zQBN2In+hql+fRZ3s/qRLMOAYegniwTTveF
         CglA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=q4SRzcwcSalxtTyVkwVel6byYhpjWbRsmzP5G8GpKHU=;
        b=lnsxJLkKZ0pFxMhDyfXpZ9E5wurMaRdxIrUlOx/PgnuD+4dZDxu9Y2FE8dH8h+cjOv
         NPwc4dk8ns834ueX9+2hHZ3wdS5t2sD1+QPcCjWFUQlSldAT0c5XpedlWNtUoeRXareL
         ndC8F9xmFb+HHSxqG7Ri4c5mnbVpjabX1jtZKkK6yv7oppZlGjCLJ9rIh2yDz7Bv6L2a
         HPPpSWKUgIn/hCdx2azOZVYPpGi19BhwSsVDbvk7Nj8HDhN1D59OP+T3jEdW9CtDRVMP
         NbTt/wPQU+X/ufximct4v+1NLKfA2kdXjT47wqlbhurNo6QgC0iEYKmvfRiXl+3J0V9P
         tVvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Avx+z9S1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r16-20020a50c010000000b004538093a5f0sor1288794edb.28.2022.09.17.01.33.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 17 Sep 2022 01:33:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Avx+z9S1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=q4SRzcwcSalxtTyVkwVel6byYhpjWbRsmzP5G8GpKHU=;
        b=Avx+z9S1U7WhkusdjpMDUrFsiRY7sqXtUnCwnokgOq4z2XT2Yct/qW1MG9rz/yZdWj
         hpofPxk0w0UhZhES0gSDD/zGlsAkw8E1g3v/EVX25iLvN2IyAvHc7rF9v2uY1W72Ls1Z
         /G5GxzZJODkmA51AONWLJu5m/h4KCbREk5B01gLp+hZKHwHqsWGLG5fX9Oqjo2DoP+eq
         guvygnOlC3BfWftIH8lXZ+rwDdUdmUA87LXAcdHt70/6aWXLQOWTwWwrOMId3wzsvc/z
         +KDu1DjI+7B1wDmcVdej7Oi/weCnNkYBXu5uW1jGsWpp3mmXlWDUF4VjcHqQdumcIXO3
         AYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=q4SRzcwcSalxtTyVkwVel6byYhpjWbRsmzP5G8GpKHU=;
        b=fjptWrPQT62U/GuQLbiWRSNE3eHbJajtEiKPDKCTVFlhnf1KIZtmAKL4SgpuPh8oEJ
         FxjAllopMYMLS5kPPTPeBu7LbOgPDxUDuzeQGYSBC73ufWvZqfV8gCVBqzQlPDuoqHed
         Cd7CSMRJE11Fv/xMWLObMsdRw71mhraljHobiwVF8DtDULm9TNPPU3nq0qO+ZQhLP815
         UdUdEfCN6wKx7n/7RE99Tqj+xPNxFRP7klIDsfZyQxr4vzCSkZjb1vIQ/xdXTYY78zIj
         WxBsL1qjcUbWm0TF7KIPFOsnSpsnWKrGGc+FakGJvYbRwq8wtg+Wuy021tMIO6nI/XxK
         39gg==
X-Gm-Message-State: ACrzQf0ZbugTjX1Ul8KO+2fFMk1nhSNRWX5ePynyA5y/9Kl7XAvvl43R
	SYj+/ik//bB5nGl5QjKXZA8iXJfpMvUY4k3fMus=
X-Google-Smtp-Source: AMsMyM6ich318pxfppnyoCATm+JJwB7xxihfcnbr6PkDoAEvFtvUXnWJjte8/ynMVARpXCa7+ZwjdQ==
X-Received: by 2002:a05:6402:42d3:b0:435:2c49:313d with SMTP id i19-20020a05640242d300b004352c49313dmr7020995edc.86.1663403604445;
        Sat, 17 Sep 2022 01:33:24 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [10.9.7.77] (vpn-konference.ms.mff.cuni.cz. [195.113.20.101])
        by smtp.gmail.com with ESMTPSA id c26-20020a056402101a00b0044792480994sm15165554edu.68.2022.09.17.01.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Sep 2022 01:33:23 -0700 (PDT)
Message-ID: <6af8867f-2d4b-3326-950d-b1e12a2b087c@linaro.org>
Date: Sat, 17 Sep 2022 10:33:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH 3/4] hw/intc/gic: use MxTxAttrs to divine accessing
 CPU
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220914160955.812151-1-alex.bennee@linaro.org>
 <20220914160955.812151-4-alex.bennee@linaro.org>
 <ab834948-3bd9-8e42-f13d-de0a3c573cf1@linaro.org>
 <6aebb38e-551e-e241-bda7-4b748e672c29@amsat.org> <871qsb8h9y.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <871qsb8h9y.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: hIKKn4biIihS

On 9/16/22 17:28, Alex Bennée wrote:
> I pondered boolean but wasn't sure if that would blow up the size of
> MemTxAttrs so went for the bitfield.

You can use bool with a bitfield.  Though Phil's suggestion of .requestor_type has merit. 
  That depends on what comes of Peter's hw modeling suggestion that might integrate the 
types on any given bus.


r~
