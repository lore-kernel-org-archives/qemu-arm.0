Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2226299lfg;
        Sat, 20 Mar 2021 09:03:24 -0700 (PDT)
X-Received: by 2002:a9d:70c9:: with SMTP id w9mr5331873otj.62.1616256204274;
        Sat, 20 Mar 2021 09:03:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616256204; cv=none;
        d=google.com; s=arc-20160816;
        b=gv7O1iQ/Hk/8N9ni2zFl2ogAjQ++Oov9wycGcxtIjppIl6wsTTPst1URk/lYhdzP/U
         6zhC8rj/iLPO1zIg54e7wb3NDtUc5i+royM6IsTYRxUKchtCjXJcUbz9vOotvrpI3weY
         7v19eWlVzL0IZRrUDHdVi2lcMuDvvJacS1krED0KnkrU94U7aV2zgjbbY9mhX0DE+sxI
         5rFMlfLLc3jmHUc8fKsKBdcWIPfB+3gr41gdLcptw8G6V4zPCZ/JEopYSa4xnKJQL5vV
         gSSHvBMnTB+hWDsKTrzLqSTqKgXYz0klKWvshhjeEC+3FU9oNWOvXdZNdzefDqu36V7q
         2TAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=KFysDJ08D9omJTXIYlcLRJ7jgqI0qmUjZq0yFR6tzCE=;
        b=SXWbPXC411fnvQm3gpEs99uvFTFed2sqgmjVHwUXlzzrHhnxdEdxKEH7UFoNJ02N/Q
         AEB6YRYVDmtVwn3/abFEJGcIDr/FB6uXPkmT+0DTu9NwW7H8YqbP3bEazpihdKdcxEy+
         ZokvRRHJcQinEwaBylqSHfY060kf4CLYEki3IxYPPYIhvUtMu8JYFUdYLB/2cUBO4hTx
         QZ3rnwdq7tUrDwXlZ3asRqYDCOjmVbDSYuOwwJ3TtmmHwmVLPpH9okX70zJ4+0WS7NiJ
         2eD9fpbMqGo6HJ1ymtnDPgbtcoc21iAAlGbULK7uqrr7zvUCK52e0VNu3kq10i6/bsiw
         cqtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XghXtDIi;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t15sor1849194otk.49.2021.03.20.09.03.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 20 Mar 2021 09:03:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XghXtDIi;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KFysDJ08D9omJTXIYlcLRJ7jgqI0qmUjZq0yFR6tzCE=;
        b=XghXtDIiYlIVe+ByLL40W8wbwWTnH97u0CpksdXCN01QLz/Z8pV+3mtKc72X1A2uXy
         ppYPF4z8z10PwHH8Pce4PkQT5fS0dLsgkzM5ioZ87w3Lo5zGLhNZtBGudGvnCZyxe+DC
         e2nh+JWSxrnBxpSsrR/ZwUx5Jad52Y1u7NryPkIvRV2d8E+m8KJdsDg1Ia/kp7GxallR
         DtcC2dW573vGnCdV8Po+WjeUVyEUySW3yMiCEKqkLld6a18LBnXGgCLJSyCw8F3JRkU0
         4JeTkLSjw/zFr20xJEUyjncVy7ogh998N+ap/zdhnpIt72Tmpx2YSPXcfq/QchTcH7Oe
         KnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KFysDJ08D9omJTXIYlcLRJ7jgqI0qmUjZq0yFR6tzCE=;
        b=CNeoW3kAUJOQU9cj46jLZCW4mB5KUFERZ7p3JKy93TIRcAgIFfSrlHjwrOz5Wm0Flq
         PS5eCqYE4WpAE5gbTeJbYUiq78rPMknO99/clvWxjZGw4YiK/TVeMAJZGtPvMUr5IybI
         1tJ2dmO7x7Nv2x4dqUv79P2172RqkXH0FyafpbPGzB5d+ebvyi8sg+7kAbx42IMLgh9N
         7NcyVf86LME5PdAmiTgpXUl0as54wKYxmFqJOU40OJ5ZG06jj/Uff6OwMQ9yKRLvAh14
         kI6taOz7VtU/YobWmnqSduExK1rk8fdrUsuvNAevjrPMI80cHV0doj1groxUn06ZS852
         iV6w==
X-Gm-Message-State: AOAM532axA55bgsXsEssdbhDkWjx7TfM+dY1iVDdm4MG9nLGHRt2wtdp
	NfgDG3pMCmecP3l4dAMfFkHuQzjiBv9T1A9+zuc=
X-Google-Smtp-Source: ABdhPJwxdjfuLVMFES428jSmwjO39VPbcodbtPjDmHkG+IzEjpliyDcqFb93lXdvtlPJvbXcKpAnqg==
X-Received: by 2002:a9d:3b85:: with SMTP id k5mr5125431otc.237.1616256203790;
        Sat, 20 Mar 2021 09:03:23 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id m19sm1946701oop.6.2021.03.20.09.03.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Mar 2021 09:03:23 -0700 (PDT)
Subject: Re: [PATCH v1 05/14] semihosting: move semihosting tests to multiarch
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210320133706.21475-1-alex.bennee@linaro.org>
 <20210320133706.21475-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ecfe75b0-1275-bca5-68d7-e6ed2e1abbaf@linaro.org>
Date: Sat, 20 Mar 2021 10:03:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210320133706.21475-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 3C8kPN2AUxnu

On 3/20/21 7:36 AM, Alex Bennée wrote:
> It may be arm-compat-semihosting but more than one architecture uses
> it so lets move the tests into the multiarch area. We gate it on the
> feature and split the semicall.h header between the arches.
> 
> Also clean-up a bit of the Makefile messing about to one common set of
> runners.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20210312102029.17017-2-alex.bennee@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
