Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp186737ejt;
        Tue, 20 Jun 2023 03:39:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ61I6L+jOhlWSVxd2aosxJF7Y7xD6yzWIMkHWYknvmABna/T3ENvGZFwMeRSHtWo7S6JumD
X-Received: by 2002:a05:622a:1a9b:b0:3f4:cfed:969f with SMTP id s27-20020a05622a1a9b00b003f4cfed969fmr15301354qtc.13.1687257585445;
        Tue, 20 Jun 2023 03:39:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687257585; cv=none;
        d=google.com; s=arc-20160816;
        b=ES2LkDt+FuOjhecg/l85DwEREelOG/d+SldLB1jOPdJPrrBEp183O7KYbG1Z02GK+0
         Ldb3gxxmxyuQCewzpPKYJ/o6dLrimw0yV8jWHYFTmqQJ11KOCBPz45kpG2ilrpx14TOR
         gtqqSFvgJn7DSQKrz3Z4GHCDsoEe83pPl+U5wG42b6Fetqjo03gEoyyHO4+feNF1//Po
         +jHbZhd99kSKiqSsnMR9LL7CVXyNwXd0GGOyMkDN7UhnJ7MSeav1xsM9GiPlYI58ANVy
         WVayLi/2soZ+IfvbUf0EkaOmK8ke1PSXhgRQaG+G4VQBCIbcw6kIL8Zi4KAPihP8MW/F
         jPkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=mUmoYq8PPbCPQh1Ss4hnb9BZHMKS1FS70+9nY8yhubQ=;
        b=rNpkyRf+QVuTr4BO24MtomEnvjJgBworI1+7QQPR5Ij8SxlABo128OZ9xR2BIXM+xx
         ssYnMqGK8xvp6uRm61vPz45aN1NTDzV2c3mNPnRY6g70iI/ZC8nG5CcQw3m51W53ZyeN
         c/EX/Ey7fT55ha3UNZPei8AOCx85VNQSsWRB5LohVX8rfhXVtrZ/vCCgHRiS6zxSLOjJ
         og+dgHgsktqGQiPDE0DgeZHs+e41OHXVsD9yWsHjVbv7ONlTnLoYhGYRfQ7xHYhYUy3o
         Kgg77Ezk6ig3HFnqOyJb3iepslbsVwPSiNEiGbhaqrNSl2BFVSW2I/bshDoKUTR6LiYZ
         JxIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BRAFGnDX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f7-20020ac859c7000000b003f528ced1basi652271qtf.301.2023.06.20.03.39.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 03:39:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BRAFGnDX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBYlo-0004JT-93; Tue, 20 Jun 2023 06:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBYlm-0004IZ-MZ
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 06:39:30 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBYlk-0004Lr-12
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 06:39:30 -0400
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b4745834f3so33990221fa.2
 for <qemu-arm@nongnu.org>; Tue, 20 Jun 2023 03:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687257566; x=1689849566;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mUmoYq8PPbCPQh1Ss4hnb9BZHMKS1FS70+9nY8yhubQ=;
 b=BRAFGnDXMXYJp29fYb/UuY2ALe2d6YKSD8KKNynu7ZZJdMuGHeQsc/4I7BvWZZwgQg
 o3kr1EPQd2M8dYnCd7Pg5+2PODjC0XMkjINOGqLiIBZ7lwv4x+0LrzQfLlmoCXDcZslY
 iU56J+kM+P+YRy7GMumtWKVOdEFp7jIyRky47+qPdiQyyfT727X+RPOQoa5FeQMyzf5C
 WEBhiKwpSCemvPnHqb0IWIwpfP5bIhOZuj7WQlQlltrqER+v/fAcZqUh3WIEyhm5FJ1j
 +ul1ZRjLN5SQ9j7PEf5Z5ng2CuizupMOr1O+hHlEHcVAjCZIi9gjq/1ReK3eI37M+YZF
 uhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687257566; x=1689849566;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mUmoYq8PPbCPQh1Ss4hnb9BZHMKS1FS70+9nY8yhubQ=;
 b=b8HM8FU/YR77nfsyPbG2b+w2ZNG08phR2tIBL6nDZgVpUZnYf3HAjNnIXGRZv6A1lP
 LpJdquixY/6lqSq55TctLpKhZz34vJf284YFzvk7w+ogOPa4hBqrYy3mEw0zeB9P1Qfi
 TxF5OSNvglrqlQ4RkjxZPqBves762S4Ssf4xjgcZf6Xs9/AYXhZGrmKB1tkO9SVONmRL
 oxQIilVFSdlToyPME3ywajmDISb7+QH9xPP1CD6QRPbycLsgYC6qXvp/jw8/xLXhfbNB
 VuTJ6UYdsPzPaN3ZzRU3PubQ6+BOJ2R3KsZNzbFcWz7djuomazW6P8XT/stOCQvyt5j8
 R/FQ==
X-Gm-Message-State: AC+VfDzo47cJdLW6Fzp91WxdHY8TcGDPqHnUav+dCPiggyvtWE3uztJh
 xcOgfbbJ475jWzWjnaM+djLsmg==
X-Received: by 2002:a2e:9ad6:0:b0:2b4:78f6:d32b with SMTP id
 p22-20020a2e9ad6000000b002b478f6d32bmr4302427ljj.39.1687257565877; 
 Tue, 20 Jun 2023 03:39:25 -0700 (PDT)
Received: from [192.168.69.129] ([176.176.183.29])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a170906838400b0098696189722sm1118596ejx.192.2023.06.20.03.39.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 03:39:25 -0700 (PDT)
Message-ID: <e53998c9-676c-c9d1-0a0d-cde1b2ec6057@linaro.org>
Date: Tue, 20 Jun 2023 12:39:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 23/34] target/arm/tcg: Reduce 'helper-mve.h.inc'
 inclusion
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230619154302.80350-1-philmd@linaro.org>
 <20230619155510.80991-1-philmd@linaro.org>
 <20230619155510.80991-11-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230619155510.80991-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: sVQA65ei1SWA

On 6/19/23 17:54, Philippe Mathieu-Daudé wrote:
> Instead of including helper-mve.h.inc via helper.h which
> is included by all TCG files, restrict it to the few files
> that require it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/helper.h            | 2 --
>   target/arm/tcg/mve_helper.c    | 5 ++++-
>   target/arm/tcg/translate-mve.c | 6 ++++++
>   target/arm/tcg/translate.c     | 4 ++++
>   4 files changed, 14 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
