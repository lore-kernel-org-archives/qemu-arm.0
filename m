Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3183940wrq;
        Sun, 24 Jun 2018 15:58:43 -0700 (PDT)
X-Received: by 2002:a17:902:bd05:: with SMTP id p5-v6mr10155999pls.32.1529881123670;
        Sun, 24 Jun 2018 15:58:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529881123; cv=none;
        d=google.com; s=arc-20160816;
        b=N2po6R/r3A4llZoIqzhtwBw+wlz0KPsThqup/mIAhmIirSZM7RdEhTBIVgCqNsrfIm
         HOqDiKduWxXHrQs2aVAdkHOmWd64rhXbyrJbH6yq4BkvRDXi/r1wx8Rpo+nvDlJ+ryLY
         osHX5MRhOLn4ZX1z+mDuEacRXnN3xgnjTf6YslhJI+SFTaL/WE3gymiYZ80MSww9PXlP
         4JWDqpxvk07u0urq0SEJ7h6HSxbeRWjCvxDyD5Ev1D5/wsR0C7ZReO6KgCkG93TraSsI
         wMRW9Cju45IAWrqNUoX6tks/hsvd2NxSSBk5Y8G6vMvQIAVwgCxkVMHLZJRUy5MzbECg
         SLIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=pCJrxt+aaV562hOH4A6AR3WuZJLbFNvE7QXT7i5MtNw=;
        b=V3gyTZWdupm6pr5mWhHbkcHcQ2Pw9gkSdDtvjNMxkyQyLm123S0p1pQBmAE/u5a+W6
         tBM0EUrC46SHvn3B6VAMlKALK35oAM0nL1AMXjCxCfUTQiTIbNsrRynNRdps5SFACeNU
         xjJp8RkOK02H7S0sId4GUkJZGvfyxITrmeEl1QmiaiNXoT+jKovLcYZWlbUHbiG+PZNk
         HSF/pXGr6GIwOqHQJsjh11MEs0PhtQbz0chSxcEMm336on3lV2SWnjK/M8hmEtyRwMpx
         5DpzhJJcWjncKxIwMfo2nDZnx3Sq7bzR/xlwZ3Hf23hws5uQSlkurJWUqO3TGOG+7Drq
         CIig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E0VpZ2P1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id n1-v6sor2750984pgu.136.2018.06.24.15.58.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 24 Jun 2018 15:58:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E0VpZ2P1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pCJrxt+aaV562hOH4A6AR3WuZJLbFNvE7QXT7i5MtNw=;
        b=E0VpZ2P1H/vsLk73YGIa+wLQxYtf8vP1JuCiDABOAy60zOGh1479bDvyjWvYzjjwwD
         k2tv5dSp7OYQLPq9c2i9CFayaWuChQ6FHwtSUoPmPJiw/h73zou1cYWRaa/4uLxUF+S4
         LLVub2j86hMVhXKw0acUtq5FOtlKymtxMJFJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pCJrxt+aaV562hOH4A6AR3WuZJLbFNvE7QXT7i5MtNw=;
        b=EKX2QA42Fp3LLWPh4YelXin2A9isF7x2NT5FYpVmLJD4h2WuABb2FsrVgae3Nm6pXS
         XsyksOLJhPUaXHIQUtatEvlVbYKqypb6nzk6IUd+UALBCXI9D+JHc1Jkw3q7Lm70YzFt
         KsxCHbU/OXQAIaenwgH29McKv4DEIQqWu9xcm9OOzVGVJYx7wozuizVrBNYYlQkf6a8J
         dvlWvGMQaYNSEv+bvPAzld4OP5XGbBS4I49GBy9yJlUI/doiIAmtgINVCrVCXbdfXJSs
         2D6BCYz/fKjGyb1i4dCS8kv6Pqng6xpHjPjCxSyMlJfjeRNqxOfGCHrv0qxzpKULIZW1
         PhFA==
X-Gm-Message-State: APt69E0CalObm/ZPqMGVb87fq7lW4Y0+MEf7z81vzFLO0rY0x3G2IFF3
	8eOZA3vPQI9KKt94K3Z5FnHoUhO2NRM7Dw==
X-Google-Smtp-Source: ADUXVKLftKAW2qZYS3uxM75cYt5I8Fwn9kUpII76p07lUv+MUSJcnoqEu24delYYzbmVzFHqPZ2GCg==
X-Received: by 2002:a63:ba10:: with SMTP id k16-v6mr8369813pgf.145.1529881123243;
        Sun, 24 Jun 2018 15:58:43 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net. [97.126.112.211])
        by smtp.gmail.com with ESMTPSA id h27-v6sm33242274pfk.160.2018.06.24.15.58.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 24 Jun 2018 15:58:42 -0700 (PDT)
Subject: Re: [RISU PATCH v4 20/22] risu_reginfo_aarch64: add SVE support to
 reginfo_dump_mismatch
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20180622141205.16306-1-alex.bennee@linaro.org>
 <20180622141205.16306-21-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <dfdc22ae-aad9-be50-7613-86eb179580fa@linaro.org>
Date: Sun, 24 Jun 2018 15:58:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180622141205.16306-21-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 6ug6Ao1/Qubf

On 06/22/2018 07:12 AM, Alex Bennée wrote:
> We also tweak the justification of the rest of the registers so the :
> lines up nicely across the register dump and diff dump.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - include ffr in comparison
>   - mild re-factor of preg cmp/diff
> v3
>   - re-factoring
> v4
>   - alignment/justification tweaks
>   - merge chunks from the variable VQ patch
> ---
>  risu_reginfo_aarch64.c | 140 ++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 124 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
