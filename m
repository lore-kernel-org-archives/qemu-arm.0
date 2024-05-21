Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp2155252ejb;
        Tue, 21 May 2024 07:34:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW8A1BL4Ss44Dkhnp/CVFmQuMeArpwp1NxcGFtDkzHUjf5TTSjcatfTT9VJ2VarslaEYkZehGNIdO0hHihKWWmUUjHjQ3EG
X-Google-Smtp-Source: AGHT+IHmQ8yNX5rVi4qSZYL4wTFtQRJybFN/hAV2r2U2YQ3fsguglPrvcE9lQEpuvkg2qvuyLXwS
X-Received: by 2002:a05:6808:2a89:b0:3c9:6961:f2b1 with SMTP id 5614622812f47-3c997082edemr31339525b6e.33.1716302086234;
        Tue, 21 May 2024 07:34:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716302086; cv=none;
        d=google.com; s=arc-20160816;
        b=RMExCjp1lTgmtyeUDnLNUytg8JfpnIzjxOpYYJl1lPV2lGZzoK2Z3Pnc1Dd21/1d3p
         1SgyAxNcc94/zn4gYmPtkhiGuRoKcGIR+ybAzcEelS04PNFMF8GcQuclYVfWJPMPo5zO
         iMjaVypBzy3AOYzUoXEwOhoBpyel+l+9ormUH2vORDvTE+f9/9qV3YawVNoX+rqo1ncW
         Hhbajyn8WZaYCzaRzcE//fE1iTRn7ut5izZW5FkqVzAyMRbaEgbhSypZ9GJZvgsY/lUX
         CW1qVj+0jrjl0jko0rD2IESbPm/ptNaxZYBLEFO6LRdFMtaaM76px/k5pdMq+s42js1g
         YuAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=1raY6DegR7L8dxIzzsbo8b9EerfvgO0p2AcYjbVUunY=;
        fh=YK8WRXebwzJRsw53U4Cp/NTz8Nhis1cwOJE0HVRq2Co=;
        b=XCxk04mrpvrybSmSonp2yAU9JcGrZ67O1Ev9gi07bUwyPVHJhE59kUOOdCDGbFGaZZ
         ggQvnS1Bx0D2BjnxkQvMMyazFnXmACbAT+YE3DXC8p6c24pT54w7i3Hmn7HK7JJ4xbUj
         6oRzyLO2ICyJlnE6I65XAz1aKzEyofnPkmUXx2/K05chpslBEdNG9YWlZBdMwzpjaSFR
         nYp9SV9U5N0Bq8UB3U+iGlx7qqQ28u9MR6ariV+htVOn4vRFCt7LCji2dEJLPvOQ4oA5
         Yl46c33toSlgeQGLOZCLNhwWzz2tTdVydi466dUwFChnNDkGL4wmKByqlzK7wkOTHEf5
         6ITQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tHOgyvW6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-792bf297435si2713595185a.203.2024.05.21.07.34.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 May 2024 07:34:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tHOgyvW6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s9QZA-0007hS-9G; Tue, 21 May 2024 10:34:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s9QZ8-0007gx-52
 for qemu-arm@nongnu.org; Tue, 21 May 2024 10:34:10 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s9QZ2-0001mn-MB
 for qemu-arm@nongnu.org; Tue, 21 May 2024 10:34:09 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-5f415fd71f8so385801a12.3
 for <qemu-arm@nongnu.org>; Tue, 21 May 2024 07:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716302042; x=1716906842; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1raY6DegR7L8dxIzzsbo8b9EerfvgO0p2AcYjbVUunY=;
 b=tHOgyvW6Q5FeVQndpzTetPqCBs/7jc5dk8WP9+9bo51vbMvjiBlnQc2XuT1xzPVoQE
 6xk5Iuc99PZtVImE2OFAAq6jzSLgLso+bmQh0E/UGL7x3fQnnJ9Cov0ZuRSvWn4mESTn
 jJtTdC3aQ4dldYFL4znawKVNoKCuBndzHUq6I98/r/X9GuVgvhda1WKUL/Udw5/A5+9z
 7Jsrf/qioyT8TicWwi5YWKGdRBEhlL3Tkdc+JHo4DTt7S0o1IDQg3YUZgIId8mVGWEum
 DhK7+EoF9B5iUeP0oNG0jOw1u0VUCVSPXzgMo9Z4AZS2tyHm6SseJysC7OFOMOBDcln6
 4bfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716302042; x=1716906842;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1raY6DegR7L8dxIzzsbo8b9EerfvgO0p2AcYjbVUunY=;
 b=iNc6DquCFUxqGZ58H9G5TZ/6CnMc68SZQhNZNvzztd/HGNR5q4QAHikx8fbqhExywN
 5Yt8N6COLRduBX6yPuFFVs1t6jPHKUtKtZ6dQ5595Aqad+Jc9t6J+c6hzWSrAgBURe2j
 Ho7yLEpBCawbkFBuIqoGOZa50CBQ87meIfvDW/A18w1BA8V40YWzqv7yiYbzCFHRgDWb
 hUgXqX1QJksjBH124xWpzfDNoqRpIBw+BX091lB9S2wut6IZmovtgeFYMA67NSu/aSUJ
 d72IcAroX2wVgUzdJfT502yXJGk/qEh63bx9ACMFe/X/UH/toVHnZktFwOGRtlszqiho
 WBdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHbdADNCHcaSPMAbFo7edvlllHv/QhhVTXQgr7hGjI16TlExkP6rT+XXLjmPtlhLKhBdRG85WP2+1yQNtGhigets10
X-Gm-Message-State: AOJu0YxTzftvugVj8KyrTFs7yVMUO0Y8DDo0JnJQsxS49EPiRZQil9GI
 XjwEoJqbtzbQS3OLIYw11ewmSGNTUH34fciUjczzBR1sJ5ELa33YDnfFHTiZqkY=
X-Received: by 2002:a17:902:d584:b0:1f2:f50d:b4e0 with SMTP id
 d9443c01a7336-1f2f50db86amr84199865ad.25.1716302041985; 
 Tue, 21 May 2024 07:34:01 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0c2567absm221276455ad.297.2024.05.21.07.34.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 May 2024 07:34:01 -0700 (PDT)
Message-ID: <ea128bc6-c5c8-47d6-be4a-a4e306499e31@linaro.org>
Date: Tue, 21 May 2024 07:33:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/system/target-arm: Re-alphabetize board list
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240520141421.1895138-1-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240520141421.1895138-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 3/K01Z5QPlyN

On 5/20/24 07:14, Peter Maydell wrote:
> The board list in target-arm.rst is supposed to be in alphabetical
> order by the title text of each file (which is not the same as
> alphabetical order by filename).  A few items had got out of order;
> correct them.
> 
> The entry for
> "Facebook Yosemite v3.5 Platform and CraterLake Server (fby35)"
> remains out-of-order, because this is not its own file
> but is currently part of the aspeed.rst file.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   docs/system/target-arm.rst | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
