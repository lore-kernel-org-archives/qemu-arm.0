Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1383780lff;
        Wed, 11 Dec 2019 16:31:37 -0800 (PST)
X-Received: by 2002:a62:ee06:: with SMTP id e6mr6824605pfi.45.1576110697235;
        Wed, 11 Dec 2019 16:31:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576110697; cv=none;
        d=google.com; s=arc-20160816;
        b=fkvfZ0ZPodlqJILmCDpSjAISpXmgkBXrbZq6NjUg9Q6W/G04gUc5yr2p/4OMG7W3uL
         XEnejeodCYrEQywscYARtH7NR2eu9aG5Lw70aK4m8oWRZoHO2A0nFTAN4Wzo54v+DYMG
         ClonIql/RAXtTt6UV/ctu7XKb4CXoHvUYpYguxip0/Z8slAUkqDSNBzwAlO8LV4/vyZg
         zAkaeoz3JmkNdoiME/PtzqRzvHkScmZ+PKqq+3/o3cKETWon9Ridicp/Vmli+S1aQTWD
         SdBGOJKAwDca8JVc/uWvyUAD6QWFBzFNMe4aL2n90MkIyuJVHuciEoDMOWToZRyc8ymP
         +yrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=7ahxi1d2bbzjUWQmcsGmCMgx9eDpy5No8A6ZKNnwCcs=;
        b=0pqmEOmhlEuSZqH1H4Di0sfQT+rsEiCNTs67fSSUDkgwGlfAnTeiOeyVRfxEpvphmE
         nf0TcfuCJjz1NvvlzVkRSQCt0TUfRuJI5QHUM9I4CHoBUwHaKSBOOpAsqb+7SFuhXQey
         KW3PJziPeU4WVw+DgglGCZwSsuoabrapa9n6ZwsPrS1FTtgAhXRA+XcsmGO+6yHUFMc+
         R34gff+8rcL5OIWV+hxtvqQNm5FuHtOEf/jez6l1Uvvkd44pDSnwaTFNQGUCAHe6fE0E
         q/YzgL2wON/7Y2hW/W5RMD0xVy/6s5xJ4Xez4xvvm8Zpl12TnPyFSmJ1Df3FYfVW/dD1
         9xLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Gdyt88Z/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 44sor4312487pld.49.2019.12.11.16.31.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Dec 2019 16:31:37 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Gdyt88Z/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7ahxi1d2bbzjUWQmcsGmCMgx9eDpy5No8A6ZKNnwCcs=;
        b=Gdyt88Z/Mcr4CQV9POK32maEJHE8LiMsUBTO0adeApEgFJsLWCioRG41OT4Po0ABqQ
         d1NdjQ8j1wfYVW7tAJH1EY/5iGZrUeSyrw0NYOsMgcRXUZ0ne/mc55QudU1vtvWnQREU
         9iXbpdQHPhJJnDMJ4+ZWSUYdGLog8Uys8bWjtW74WM1XBuEfRDmVmFjbVP9udnaD7D+X
         eontXFbljWwUeVmZKbTUlZQJWkumkl0sI6281zOk22fJMFlAlg7SKK1YUb7cz7CzCgpw
         kx3nn62bwkSX/n9pV2ZkCgCybhEz0o4Vi/7xoTWJNSvcbgs35OrZtOtexXVdRI8lVNfL
         Ztfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7ahxi1d2bbzjUWQmcsGmCMgx9eDpy5No8A6ZKNnwCcs=;
        b=LiYXjf5eteyvUcU/CVXZvpr65xDLilebYNPrHB6T28VZWPDo4Y7oYpM7AWIrwAxBkT
         rzpiHa4fW0nz3UmxtPYZ6cgDhJqc3qHS988Y26K0KCDt+0fP5crk0RjMS9VPePY/n+f+
         PlQhe1rGui6JkK//pIW5OXWttB5F1IWb8XHCw6x/LIjDiMniDQgt87Vx2wylx8ASGoHq
         pt8o/2BtSoiA3SkZtgqjMU7DLKilZc7ywVACsDaSp9IXs62g+tnjd1Zov4O1ZLhVTvDa
         Bh7Mqh5mAIWUNqasES8SYWSd6LZP393UecpV+nCwxA+x3Rgzy4SAWq7rD/MvYaa4wdJR
         0NOQ==
X-Gm-Message-State: APjAAAWuRl/pv71n+5lGKZvRnEHWOjj5XYRx/4WMkA0XMG43GSsm656b
	OmY8SLW1BdJL/9zmGDPTiThdexVH
X-Google-Smtp-Source: APXvYqyy6xGMmLJlnhIAxl5T79tL8JwPW3uYtM1zUhYaP9EZFnnJ8zJ9Di2L8uuVAbcHXFjNUHw1fQ==
X-Received: by 2002:a17:902:7c0c:: with SMTP id x12mr6449973pll.239.1576110696628;
        Wed, 11 Dec 2019 16:31:36 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id h7sm4749443pfq.36.2019.12.11.16.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 16:31:35 -0800 (PST)
Subject: Re: [PATCH] target/arm: ensure we use current exception state after
 SCR update
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20191209143723.6368-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c0c7e5e4-9d62-6a07-b972-d8cbf2c18c25@linaro.org>
Date: Wed, 11 Dec 2019 16:31:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191209143723.6368-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: brFXiTV0NnvM

On 12/9/19 6:37 AM, Alex Bennée wrote:
> +/* Re-read the current EL, don't use cached values */
>  #define ARM_CP_CURRENTEL         (ARM_CP_SPECIAL | 0x0400)
>  #define ARM_CP_DC_ZVA            (ARM_CP_SPECIAL | 0x0500)
>  #define ARM_LAST_SPECIAL         ARM_CP_DC_ZVA
...
> @@ -5179,7 +5179,7 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
>        .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 1, .opc2 = 0,
>        .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.scr_el3),
>        .resetvalue = 0, .writefn = scr_write },
> -    { .name = "SCR",  .type = ARM_CP_ALIAS,
> +    { .name = "SCR",  .type = ARM_CP_ALIAS | ARM_CP_CURRENTEL,

I don't think you should reuse this value.  It is not a simple bit.

While ARM_CP_* all appear to implement a 16-bit quantity, the type field is
already an int, and so can easily hold more.  I think you should use a new bit
for this.


r~
