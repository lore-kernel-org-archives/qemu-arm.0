Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1396400ejf;
        Mon, 15 Aug 2022 13:27:46 -0700 (PDT)
X-Received: by 2002:a05:620a:4489:b0:6b5:d373:dd02 with SMTP id x9-20020a05620a448900b006b5d373dd02mr12547642qkp.409.1660595266062;
        Mon, 15 Aug 2022 13:27:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660595266; cv=none;
        d=google.com; s=arc-20160816;
        b=Atn2XzYCA+6KJ8TIHi3yXLMfTmpm8j4gOLvHU3sBv9HTrtdSTnOxuQLZtyMjUvprJn
         rkCbRKKavoixgRMfvK6IHT+31XbwqwKd8xTwwnhLK/i3SITVmJwEUIgcFi3bU+iv/I3Y
         zP89zIyAanVGXPeBHH4fumDXWX5+vDJRCMY6kAHYjkOMird+BaFBcDXN6gYIsYQRQ0at
         BPm4Yz7bwdtIvInWTsRJN9Sl0X4/ZTQfaL/O0nsWyDbPUyw2Q2l2IY/3oQ75fjskbWp4
         VyWsh38W31VnpPF7peJbURsELRmPw7+1EnhuL0buPhvOGNsEBZqqzGxgmzh8r24EKkT9
         ngGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=UYWcVUCm8A4Zo1ovf15GFjMc5swI2yDbuMF4qzITRzQ=;
        b=YkNrUZUs7A3pkiPUsZP//GdbgLs/ONDXHPFLqePmodo584pyQFVkD8o5fvvDABwrBc
         CxHwaKBgGxJXDJAXyR28LpopIrcFAVH2pJq//w1WP7J2ObfvJYz1aJhH8QG6DuJhzWCd
         lCwR0VRr444um1gMrh4DkHYvYDgmdlLaVpGuAk7er6e5Mp7ZY1sbybfKDye4o7o686wP
         VatfvdoHcO6NbA43jJ+sBocIQTItSKEToIk6wwMVkZjK62vdo/Q5ID21E3DJvmTOTXlm
         jFg1Ta9JE9LDh2DaS7wfMtXdgUIob1IZmIhsoF7rYOV07XUbr0mlrLwIftUfiVzb0OCy
         AKig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lQG36e3Z;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q10-20020a05620a024a00b006bb313439c3sor1072946qkn.21.2022.08.15.13.27.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 15 Aug 2022 13:27:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lQG36e3Z;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=UYWcVUCm8A4Zo1ovf15GFjMc5swI2yDbuMF4qzITRzQ=;
        b=lQG36e3Z9j1Fb8Sv3OiW9gqVl6zE0ARVF4wkOG87Q6QvUL+2O5bnhXqOY6mfnDql4X
         X1Xd9UVAmRlEIylsVbu4QaOmcZnt1tUkgshZ06VYYDe0mBA4BKxPyFwAtCTk0DZ0Mly5
         8Hh1kXRBWiz0KLHmpIxu+XyoHOenfD24GvftImzRsKFTwMwAvalpL6Wkc6ACS8aTos69
         F1anHL+nAiZn95IF1E8mFE5lHWXgpGyntMRSs98tNVqf2Gk4Z/vzBSs6FMAz91rnV1ob
         tnqnlnnGNS7dwEN0l6xBm39XxbDEQJC+yckIoqtXm/ZZOEIYU7Tci/AySiITK5N5kg4R
         oxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=UYWcVUCm8A4Zo1ovf15GFjMc5swI2yDbuMF4qzITRzQ=;
        b=3DQo6WI5UN1o5IXsCvYHOgDcT92U6wMGwXuuuJ4EeXRP/0DbtPmEqtPRsvmfyINKpa
         i+EF3Ni2ArJP4g2Qan1SQudiXZL6Rw1nAfhAbiB2idhS6J15qFdra/aAf9BTKQKzhwq6
         T45SG+mMdcFJIDyhgMgZwh/8uqiaHR4fREo1JGGjUl0/vEuRPa+24/ISdGScbZ3Psm87
         iRfRIWsZ5VoOOWSLgB/TEJiznhvlLTs1t0xyVw9ZGtJf3b2opSjKBOHTT2QH0gg6DaR6
         GH1nfu5ydNtIgEpGg4mFSfOqoSQUNA8k5wB4H15yEtYAOTD6Na/xRFcrnda2z0uBvwBd
         wNvw==
X-Gm-Message-State: ACgBeo22HP7fZ0Qp5+JQ+sdhYxEz1ZcHuiiJI43BxwcNKGs6fg+qEcek
	8Gbm9lBBmn7q2u5iTxODtxkjg+HT2DRxMajh
X-Google-Smtp-Source: AA6agR50wn9lxZ+Wt4WE7D++3xd+SMpVO2LFQ5j/5lLSnI/BFQyDrjHONWbgFwo4iMSPe08xJqSlkw==
X-Received: by 2002:a05:620a:1426:b0:6bb:268c:1c67 with SMTP id k6-20020a05620a142600b006bb268c1c67mr4876535qkj.298.1660595265701;
        Mon, 15 Aug 2022 13:27:45 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.125.227] (173-11-255-51-houston.txt.hfc.comcastbusiness.net. [173.11.255.51])
        by smtp.gmail.com with ESMTPSA id o4-20020ac872c4000000b0033fc75c3469sm8309176qtp.27.2022.08.15.13.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Aug 2022 13:27:45 -0700 (PDT)
Message-ID: <ac44051d-ca57-a39d-90ba-d993efbcf924@linaro.org>
Date: Mon, 15 Aug 2022 15:27:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/7] Allow semihosting from user mode
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stefan Pejic <stefan.pejic@syrmia.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Furquan Shaikh <furquan@rivosinc.com>
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220815190303.2061559-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: jN1yff89k7C9

On 8/15/22 14:02, Peter Maydell wrote:
> Peter Maydell (7):
>    semihosting: Allow optional use of semihosting from userspace
>    target/arm: Honour -semihosting-config userspace=on
>    target/m68k: Honour -semihosting-config userspace=on
>    target/mips: Honour -semihosting-config userspace=on
>    target/nios2: Honour -semihosting-config userspace=on
>    target/xtensa: Honour -semihosting-config userspace=on
>    target/riscv: Honour -semihosting-config userspace=on and enable=on

Except riscv, for which I think needs changes,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
