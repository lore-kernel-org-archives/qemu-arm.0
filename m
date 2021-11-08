Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp71522lfk;
        Mon, 8 Nov 2021 14:06:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztPbMrXUItGi2E7NwYJjm1llD+aiPVQrOzPzM6lrWAjfQKMqW4lDkLq1q22Xr+LVEotL7Y
X-Received: by 2002:a1c:9dc7:: with SMTP id g190mr1726722wme.130.1636409189959;
        Mon, 08 Nov 2021 14:06:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636409189; cv=none;
        d=google.com; s=arc-20160816;
        b=hvlRBHHmX6DmnVIhR6hJdjKcAeSztTb2GdH52Vy5lxpgzGZzXlxgP9M4jPb0m+fXZu
         mByZm7pryql6/HnWixoc1F9/SuW1EOicDyUa3e3S49wInr83lCZI/RIyReip5rL8HkGJ
         lLWy66SWOXmTPo5QG1smHI9/P5dD3gLVcZLnRrpiQDrp9HjvvALA5HnVQmrxPsao3dqU
         n8x3a4hDS+4pzyEE1ckNDkmzdrsimbTDxaPKtF8AiEQrVToVPJ2YDmfO2AgGh5fDnH9r
         HDswnhTBbXo6RqXu3pd+7SzwDwtG+RyMM+9Dc0/V8UypaKf3LqSJYMq1W9wG5FWbyQwG
         OfJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=jj/c214hs0qiVjFZ6QNnQx3l8zRwIJXknY1TZx/lGzY=;
        b=uGOigLxF9Li9HaLtW1l5ss6TTJsbQcbYilhMpqurYPul7Gs+Rsk/7QuIgmmOTyANji
         JR/WmmEibGDlnaremIMZVnwqbgTETb1SBTOg6lT44dB5oFZFlSRKOUGcP7llDe0RBzeS
         V28qQmUGZsA874Z7gdn+ND0QTTSXIIYm3cynT5L71ul6s68V7oeNleU/14ipoHDO1pSz
         VaZDAUeF360DR8VI5qfF+BRJtFDiDa4QpJPgKcx9XJqgkOQx6BwJXuHJCkNN+Jh//OIi
         rpJuC1519z4SOe/zCLX17x4lj8uyCUIK/maTxO41sBIi+A7kg62SL2w1D9xjoPQldqAJ
         k1MA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jcd@tribudubois.net designates 217.70.183.197 as permitted sender) smtp.mailfrom=jcd@tribudubois.net
Return-Path: <jcd@tribudubois.net>
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net. [217.70.183.197])
        by mx.google.com with ESMTPS id b7si28688841wrh.540.2021.11.08.14.06.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Nov 2021 14:06:29 -0800 (PST)
Received-SPF: pass (google.com: domain of jcd@tribudubois.net designates 217.70.183.197 as permitted sender) client-ip=217.70.183.197;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jcd@tribudubois.net designates 217.70.183.197 as permitted sender) smtp.mailfrom=jcd@tribudubois.net
Received: (Authenticated sender: jcd@tribudubois.net)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 6859E1C0004;
	Mon,  8 Nov 2021 22:06:28 +0000 (UTC)
Message-ID: <7e8cc67c-2380-e401-ddc7-7dc24df31ede@tribudubois.net>
Date: Mon, 8 Nov 2021 23:06:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: Qemu and ARM secure state.
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 QEMU Developers <qemu-devel@nongnu.org>
References: <07e63acb-b756-2586-2ba2-b54b837f7fc8@tribudubois.net>
 <CAFEAcA89YQ_vN-JpCeB+L==F5g1hM=CNMBzjaf5c3EHF19NVyQ@mail.gmail.com>
 <c8b89685-7490-328b-51a3-48711c140a84@tribudubois.net>
 <d19f6d2c-7505-b326-3a67-48c336f111e9@tribudubois.net>
 <dd45f94c-6110-7251-4f9f-5b4e1fbb73a4@tribudubois.net>
 <e0a1b786-4b1c-c608-495b-3fb839de2376@tribudubois.net>
 <87k0hik9yc.fsf@linaro.org>
From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
In-Reply-To: <87k0hik9yc.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 6WmCOdO92WIy

Le 08/11/2021 à 15:14, Alex Bennée a écrit :
> Jean-Christophe DUBOIS <jcd@tribudubois.net> writes:
>
>> One small question/remark:
>>
>> According to the the "Arm Power State Coordinate Interface" (DEN0022D.b) document (chapter 5) PSCI calls can only be issued by
>> "normal world" (EL1 or EL2). Therefore, should we be adding a test for the current secure state in the arm_is_psci_call() function? This
>> would prevent calling the built-in Qemu PSCI function if SMC is issued
>> from secure state.
> All that should be handled in:
>
>    void HELPER(pre_smc)(CPUARMState *env, uint32_t syndrome)
>
> which should cause things to be trapped if the CPU is in an invalid
> state to execute the SMC instruction. If the exception is a valid SMC we
> end up in arm_cpu_do_interrupt where we may divert to
> arm_handle_psci_call.

The problem I have is that is seems that once the "psci-conduit" is set 
to SMC, all SMC exception would be handled only by the diverted  
arm_handle_psci_call().

It seems there is no way to handle SMC exception in my software once 
"psci-conduit" is set to SMC on a platform.

It used to be that only some PSCI services were diverted and other SMC 
services were handled by the EL3 software if any (and this split was 
actually also a bit awkward).

>
