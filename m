Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3206254lfg;
        Sun, 28 Feb 2021 19:04:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylRXHFFn/vvGsZh4In39Tol6eC6zi+SiryEzDhngE4KAvpcsoBii54WhIIGzSkHwrRALqX
X-Received: by 2002:a05:6e02:1a29:: with SMTP id g9mr11074059ile.54.1614567878026;
        Sun, 28 Feb 2021 19:04:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614567878; cv=none;
        d=google.com; s=arc-20160816;
        b=HgwIJd3bKF79BjW8LEazYSCl2G5K2zQ2vYZbG0ptNX9BsQqcYUrXmoqR35UQUNhZdH
         uRVnEzxDgsxsD3LdgYZUD1Lib06ZOkrx4tAtiE6Hr94XB7efRXg3i6U4YfjZiqhZxZCO
         9Hci9FQtVZ3G/akloLLODKFfxHC8WLzpFgOZoaT2TjPnd9+WOTMdOb6L0l0lGoPI3Iw4
         MgDz8InDvGjkj3X+dsD2x6sqUfxQuWSYhu+3fLCIl6GPrzmzAl2gdviu5sTiDiAKdK5g
         r4d7QXIF/q74gyHmugyKQ3rPWSXjkCEFCRg+I8ce3daBcpz4+Rh8oVXJ6wHsPKmQvm1Y
         Snxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=VW6+hyeABJJrREIt3wuokqgBVyt5mMwfc4EqOuS7hUg=;
        b=wb3o+Kt3KU7Xk97n4pYbmiAHgtVg9R4ZanCm4WIXq1r1yiYrI0zWGgEOb8RwuKxTbq
         1S0CXKLj1x7lWbrr/1FbX5sPPfeI/e0DsL37noLzHlpOKji38MmJemskvFyRkKoRlTvy
         Y1cwuL9GPPBizQnFHiRn6vTRUxHErCzQVPi/PmgPusmEjlChDYfXL295B8X2r7L+v8RU
         tp9e6GCjCEbWnGBbdA3qN7mu0KsxkFS0kAdvPt5YPjPyt431vtPXA07ZSyD0vPKFqoom
         ZOHqW7K/W4VQtv6vXWwqHDJv0skp/cU35jbTovBNVqHbYbTfrMDtroO2n/L94rxFe9EO
         mudQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zYKyZ7t0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e11si14570226ilu.32.2021.02.28.19.04.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Feb 2021 19:04:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zYKyZ7t0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGYrN-0001e7-Cr
	for alex.bennee@linaro.org; Sun, 28 Feb 2021 22:04:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGYrG-0001do-56
 for qemu-arm@nongnu.org; Sun, 28 Feb 2021 22:04:30 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:35947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGYrE-00032N-G9
 for qemu-arm@nongnu.org; Sun, 28 Feb 2021 22:04:29 -0500
Received: by mail-pj1-x102b.google.com with SMTP id s23so10759318pji.1
 for <qemu-arm@nongnu.org>; Sun, 28 Feb 2021 19:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VW6+hyeABJJrREIt3wuokqgBVyt5mMwfc4EqOuS7hUg=;
 b=zYKyZ7t0LlVv8wmyNYqeyJdPllQRV76zu2QdWjr8TVeJWr+G0jMwagbJZIJcMSUK2Y
 uSzasLHAEmxV/PlzVn6mO1ejb5p20q++uRDqksLq8z8+/TgdF89NwmmQJD11XyZ5eVjX
 4TnVNzbDSXs2bznw8F3HjK/G2WAYNSG91cy3+52Kz7tnv5MkRvXFeWbfyX73yjFij1zT
 eifflW1UcAyTomEOQrsrjg889X8G2UjRnuSfa3Ou2Uj7mwSAk1aTfIeuHGx5NfvXB2GF
 hx0CXDeN5bDOWSsgjTbw95JuqFAl5mvdXVI1PmQl31utJyc7CJ0w57LMgMeayhdZGbFi
 iRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VW6+hyeABJJrREIt3wuokqgBVyt5mMwfc4EqOuS7hUg=;
 b=GFiOLp7AH2KdYy2hXI4Tda7+EKyg0rE/IBm5fqnLfeAghXP226vrLTjlps/qu8fMvy
 +AAZTuGBTDPDwLXtOD+9QBCSpJ0nn6ie1ysas0vNLNb5hZ973I8+kwuiQwgFyKpibe6c
 BNViZR5wtlt/cuiWKXRhc1uGJo+G1QXQCwqbfq6CDKPRpIVXWShVn7b+ALjxQdMcfths
 KKgtItIAipQSX4Q8pkomTDHNRrtbJ15zVUsZpxojrSwT8C5h/nOWCqkpRgg2h+GlO8QE
 w95z5eBnUgTXKX4rOA+k95XO4LLgM1NTVaw0AwF+DmS4GYFF5Urt6cAsRrIj3hYQYasM
 HopA==
X-Gm-Message-State: AOAM5326M/3Pfy/dCMPbZon7kul5PKXIaURtuA7Y1iNtmKMYzPzbKZmv
 7tpn4VUnuU3M06SjaOQSw15x5Q==
X-Received: by 2002:a17:90a:6b49:: with SMTP id
 x9mr15827849pjl.19.1614567867094; 
 Sun, 28 Feb 2021 19:04:27 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id r13sm16250937pfg.37.2021.02.28.19.04.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 19:04:26 -0800 (PST)
Subject: Re: [PATCH v2 05/24] hw/misc/mps2-fpgaio: Make number of LEDs
 configurable by board
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <48011eb0-4418-3121-5d00-7ca3b324f24f@linaro.org>
Date: Sun, 28 Feb 2021 19:04:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ARvbbxd2fp9X

On 2/15/21 3:51 AM, Peter Maydell wrote:
> The MPS2 board has 2 LEDs, but the MPS3 board has 10 LEDs.  The
> FPGAIO device is similar on both sets of boards, but the LED0
> register has correspondingly more bits that have an effect.  Add a
> device property for number of LEDs.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/hw/misc/mps2-fpgaio.h |  5 ++++-
>   hw/misc/mps2-fpgaio.c         | 31 +++++++++++++++++++++++--------
>   2 files changed, 27 insertions(+), 9 deletions(-)

Similar comment with 'int i' / 'uint32_t num_leds'.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

