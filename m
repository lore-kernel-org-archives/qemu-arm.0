Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5781137wrq;
        Tue, 26 Jun 2018 21:52:22 -0700 (PDT)
X-Received: by 2002:a65:5288:: with SMTP id y8-v6mr2380713pgp.284.1530075142273;
        Tue, 26 Jun 2018 21:52:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530075142; cv=none;
        d=google.com; s=arc-20160816;
        b=vZJfQpQ3DAKe07hJ/YsStpZO3gvThasXYxObAwOwW6IeKtnhFlW6SPVdMgGnu5YMCK
         hx6Vadm69RvP7tXiaNNgLGI4BCteH/yiCoJzwXVC4kPD/ePBZ62/g5/U/u2S8GA80rs8
         mW3efhKZTzCO3Z3H7mw1xnELGcvuhTzp5MEC0GPrWTwUCmh2Ck9Hdy3MZ54gevhJE0bB
         433KdywuZxytPwTJ0sb6VJlAWDruegtofy0QsJ/5sQnGZz80zL+42iAppNcG8wS28XXz
         TCHGJlkW0V/4XzTg3kjM45GyumBtv0/XbIidG/+7t2kT6/PsaqwfCIc9pkBCugO04PUN
         iqWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=8lR1ccJdmEAfA1rM7csMuNv11mRtmo0fmqip8sQfTyY=;
        b=eAvJW4oZif99UT+lXIUWFBSRKo6bTjjqYagvf/QdD64Hz3Q3TYcLOOCQrMwB46kiF5
         H+bwIIgiAkzh3ngWfJ40MHsZS2x0h9fuAWlhOXVO2MisFlXkUH4ssajkr/tEah6sAXpr
         DCpTyqehRAM0LOEYKoh/XZ0583HM+t+mQVtFwvYU3Wa57dGqTtyoTt/eCPfzD6p7/33g
         O12zbxC5d5MIL5X8e/zSIlpCyar/56LyqM7Pc6pScSKVgZsoF4CW9RAEC4wHb1yUeUfA
         KOBUBv3mcCN5FRiECml4drLC7xD2NKvcTlJJNkUqiJNxzqAaqgwKM/BSm8EOPxLGWmj1
         eRwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SXTxXpyS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y15-v6sor1042480plr.84.2018.06.26.21.52.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 26 Jun 2018 21:52:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SXTxXpyS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8lR1ccJdmEAfA1rM7csMuNv11mRtmo0fmqip8sQfTyY=;
        b=SXTxXpyS7c3BVHVbUZ1SFWp8WaBoVkNuhMQQqgViUVtm+SFZx4An97GXqpx/Kl223G
         bqqblk7NRrzGbtRKLvAwOzkrY8N4ZqOrchOgchPBttX5MoPTQMDfANyGTDJ8r+/EHIYB
         gUKfRHxNe41htnenaYIjVOGUsULTHfCEu0idE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8lR1ccJdmEAfA1rM7csMuNv11mRtmo0fmqip8sQfTyY=;
        b=mEuku9q7JLA3iCQxIgjYwgKwLcxyGKOFnmO5WEOMNNEoaYR7O7pE7sEVxYfKmYGqhO
         /+hhs8+k9jElywNrLQZsCkqO/1DIQo2Sxdz3WVW/sgyPA9w+C+4Bqj5TW5oiK9tEK+my
         tb9gczkQBG8c9WVViWRmWyMxoaiF+0alZ4cMR5IZF0/6G1Ddn//0/XsjkHrYehWaR9EC
         KGNZJkyeQ0Y+c3rI5BEuLoRT5B1SXiuqi1dWbaaggCluYMuJRJf6hw4wJEPcM+SlzSMN
         uE3J7qnXctn0X9MOHRj/V97XXX1B1yGZ+jEWhmH0WuIyFu1/kKkQQdjHW5zcAxKhm6XM
         bGxg==
X-Gm-Message-State: APt69E1SVakqm08ig3rWNAPfhMTKfjnf5ISAg+9rL+Ie253zyVZ5rJeD
	9ibhrPzP9xpdcoumLjKZwYe0DT8X
X-Google-Smtp-Source: ADUXVKKT/pWJo8C3B86JZKOFIAGGk+mnEEWm8PhV5WVYjQ231JIGzVbPm0JzyBvj0fOhOFuiM83TNw==
X-Received: by 2002:a17:902:5a0c:: with SMTP id q12-v6mr4455211pli.300.1530075141788;
        Tue, 26 Jun 2018 21:52:21 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net. [97.126.112.211])
        by smtp.gmail.com with ESMTPSA id q82-v6sm5988503pfg.170.2018.06.26.21.52.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Jun 2018 21:52:20 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v3 1/5] target/arm: support reading of
 CNT[VCT|FRQ]_EL0 from user-space
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20180625160009.17437-1-alex.bennee@linaro.org>
 <20180625160009.17437-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d50f4ce2-6219-d9d1-34a2-e4246f20e927@linaro.org>
Date: Tue, 26 Jun 2018 21:52:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180625160009.17437-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Dw0SjSMda9EA

On 06/25/2018 09:00 AM, Alex Bennée wrote:
> Since kernel commit a86bd139f2 (arm64: arch_timer: Enable CNTVCT_EL0
> trap..) user-space has been able to read these system registers. As we
> can't use QEMUTimer's in linux-user mode we just directly call
> cpu_get_clock().
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - include CNTFRQ_EL0 for PL0_R only
> v3
>   - use NANOSECONDS_PER_SECOND / GTIMER_SCALE
> ---
>  target/arm/helper.c | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
