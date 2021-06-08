Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4850977lfa;
        Tue, 8 Jun 2021 15:27:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpv/tmopsn9y5Z3FH950vMDbQdjoxa8snjsB15ytfSmj3UzyRSRd4UgjX1BkRp8HGjbKdp
X-Received: by 2002:a5d:9484:: with SMTP id v4mr5616958ioj.147.1623191266664;
        Tue, 08 Jun 2021 15:27:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623191266; cv=none;
        d=google.com; s=arc-20160816;
        b=yeCRjtv1rxuxrnBXr/1dAC/CHFIbVl0ZycUGgPhNdYDJ213/w1ErHc0hEOELDuWPfs
         tsNKvQwWPkQxCAycjKjZEZnDWAe+uYS089ywAsrGBucJt5S5Rvk1nR81iqkpcpdZceKq
         W2njbgmGbyCv43m+h/v0Y9Th0mulHLcp17R+9UmZ3VEPj7qeTzt5hoQYEzYW2hbhDBye
         dzyQOmbT/0aSMhSQe5TbRXgM1pRhX60w8WQdvQaFs5Ssdl24EwoqgLraEF9NoVIyU/Vu
         dLm1aYx0NY9++7cPRS6Sz/Tp1FO6VwVzC9Jmk7w3bz8N396yi1ImwRn1GcoHwZBFfX6N
         68YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=RaDdDbD/AlLqwQ8GC9YGSUk8vdMIbCD4miwJWHj0fyA=;
        b=I0ua59MrMGQ0u/NdU9uSv/gzU3+m+1WWScUAfaYkJz5hKPmAnmPdoHZ4oaSvlHWjX+
         4Dwf4Gl/N/N/O9/PcF4ytb3x/5qasWQwDQ2geCOHNQ1NlUTxj+F9LaLevcx2kcDU2TXD
         O9Lg/HX/X6X/QpDgC5U1GFu9a7wicb+g0D4UGTCzgQ1ZiT4Zb1kplHh4iMAmSO7LpnJl
         A15aOpT0DoeqBST8ffsxrFrOM5lq3RP38vcMWZVYlY4DRVdfu+4cCj3zWXF5msdM6Wvs
         WNfgOCXMyxymQdi4L+mEi978X23g8n0V3WN0D7GSe3FuQfMqF5TFn9OmxX1hr7Vcwr2S
         kcaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VilV7tRs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r24si1283091iog.39.2021.06.08.15.27.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 15:27:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VilV7tRs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqkCI-0001bh-07
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 18:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqkCA-0001bL-8y
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 18:27:38 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:42556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqkC8-0002HS-Ng
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 18:27:37 -0400
Received: by mail-pf1-x429.google.com with SMTP id s14so15942509pfd.9
 for <qemu-arm@nongnu.org>; Tue, 08 Jun 2021 15:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=RaDdDbD/AlLqwQ8GC9YGSUk8vdMIbCD4miwJWHj0fyA=;
 b=VilV7tRsjbXxzE+2DQJkxLpQfDTaI4ict4zc8ONKihS/Py4T5VyxhZmb89uSybO0T3
 jF95mOdEjKMeY9XxkvlGqNw2h+sbiHP23NdSEoq+9jkWBZNOUHiEEVFEHGfZOlsk5aH4
 Do/tKP+Me4pwZUZoiOGkA/Cekh6pcD1yRVFvFF++t81ttxtNTXYRi3hL4/X3J+ts1lUb
 gkEAR8xeJIZ/S5rj0h9RZYha8lYHP19AOowtjgu8u/yv+pFG6P3Ufe2lNWzeIhDW92Wk
 RGnV7UDIStE77dzXlZw41IMP5Z1G1UQplu52KM9oLXl97+rb0jLqPtm5tKgkhTPKRQ0i
 9XQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RaDdDbD/AlLqwQ8GC9YGSUk8vdMIbCD4miwJWHj0fyA=;
 b=L33NwLOpsmQnjZ1BZt1nM8Z+9MlxZ8vB0KulIlluOXjcX7xbGZZm7oN+y4+uDzmzIK
 LytzLn/3PHuuRsMdvSe1cnESnVqlpcAM4B01U3G29D6VAqbctBjBAlTHw5ELyQ6JQDhT
 ZT6DGkAfehWJfR5WpFKopxwPuazZYhvP1K7gMZvdhhXkMYg5hHIkogqQ4yM0zTi2aznt
 ZFQhhFiaQ+t5uOCi4RSPkKtfOmDZBc27FN9hNKTlCBietXkLyECGk4LOFRxvyibbwtMk
 2Df2Wi9RztaYiOznbQ4QXNBW2KGdJMNLhrZKXEepXkL5Aet9Copm7XfY9zQNSJ2P9xza
 pVSA==
X-Gm-Message-State: AOAM532bmGrJRT+R3+/1SFi3tM2oJ1yh4yDYf/R7WA1NLu1nn4BHRccD
 PjxBJVrcAboqUtIdyTC/tLI0W1xXAXsmsQ==
X-Received: by 2002:a62:1701:0:b029:2e9:a8ed:fcce with SMTP id
 1-20020a6217010000b02902e9a8edfccemr2015610pfx.19.1623191255129; 
 Tue, 08 Jun 2021 15:27:35 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 c20sm3089006pjr.35.2021.06.08.15.27.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 15:27:34 -0700 (PDT)
Subject: Re: [PATCH 17/55] target/arm: Implement MVE VMVN (register)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-18-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d0f5928d-e298-4fb7-139d-ab99c81c2940@linaro.org>
Date: Tue, 8 Jun 2021 15:27:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wxqX/s81+1OK

On 6/7/21 9:57 AM, Peter Maydell wrote:
> +DO_1OP(vmvn, 1, uint8_t, H1, DO_NOT)

This is a logical operation; you might as well perform in uint64_t.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
