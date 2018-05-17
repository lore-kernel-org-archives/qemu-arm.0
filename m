Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp412125wme;
        Thu, 17 May 2018 13:30:47 -0700 (PDT)
X-Received: by 2002:a62:581:: with SMTP id 123-v6mr6548192pff.38.1526589047184;
        Thu, 17 May 2018 13:30:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526589047; cv=none;
        d=google.com; s=arc-20160816;
        b=tJd7LLLyTIddEzXoRM/oKNkwQNHtIn/Ej6SjZcLrL8AYV5UlMJoxOA2/M51L2kP//F
         lngJ1O1zbgey5ykX9Tbtg3mxYKAzJUnnqqMItf8Xj8aIH/nv1PhEBmWpLbn8RPOialTU
         QH5n+RJIeJssusQBrmGQDdfvdSKGRFf+5nKO0FP2+hA8y2bhoolWN57+HzmxdOlxbXNw
         VJ9sa8qPV7fHwa5/G+elGIxelLS/xlUFkiH8SE9PLgapb64EmKdKlJzjqRT5X1vxVEGu
         eCdFvbQAfNMu94XdGBpVitt5VjtNo8SHLWSeTbfnmsTE99Am0d+jwvhOg0JY3OjCNPa5
         TneA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=WiDMpjO3UWDI9k7AvbTR/2Yh9aR+OSDCFn95QGQrUPY=;
        b=Fx5GCFBIMepyces3RXWS/fdvN2x7uA8S54Dv7q1NRFdlR+qhNmgmxuEom194WmzSZV
         NJ2r88TJlLerHD2ha3RLHTV9plWFD1VOBdhPACg/Dds6ckSmc8gvbgjz9MSVPmIN59eK
         O+BUFNREvgQSY2mCa/1cewPYnrh7VqvtFpQxUki/heII2qNl/W1TrJ2szSh7pjDhGUaA
         +5AOL68dU81pF96HcI/C430+g17XGqS2BYmjCjbuh5QgYfktsieTh4UkaWxJTT9DxRqW
         qNZ/XMJEwJ/DCeGwPKkcJDNdJ5daQzZB/UpFDr6Y8fx7ypLPChYhnYkKH2wLRMihYdU9
         QlfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LkyLzYz3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e87-v6sor3168196pfl.135.2018.05.17.13.30.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 17 May 2018 13:30:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LkyLzYz3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WiDMpjO3UWDI9k7AvbTR/2Yh9aR+OSDCFn95QGQrUPY=;
        b=LkyLzYz3Tf/7vZR4wk3XSpgRD/ssOopIlHEQYN7ld8+4vHEiA+slLmVyFRujwp6lYW
         8BTtb/tDZqK2Aqu6Yhtr5Etb2DYMPeyupl8WtS/+lEhfT4L5skiR/TxXe94jooczFPgD
         1MbBUQsIl+aNMr1+42MkcfN+pFIf33va5Isr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WiDMpjO3UWDI9k7AvbTR/2Yh9aR+OSDCFn95QGQrUPY=;
        b=BFcB7eMRtT9pQM8sFWH3nOzeEWbTBNqxbUTulM9RxdLZfVjemAt/EgD4jfoQTM93LR
         mZvFHy1SOfvPM04cCcHE55TsY3xD4pHXIrZUN492nzDu7njFYs55wSjZEgLsevIxdqp7
         K/OW6/d8v4K2qBz3eMnsFsk+uscvq0IolhxJ1K5kr487bsGlGZwCuCysFpA7PEhiUTgK
         4vWTu8o2Mn6RQ7S5KQKqk2jmjn9IXT4wjSRj/TJJqhGON3hFLehGhk1Q4VhzB79Qji6d
         Depc6U7Ei5UpUE0YctLLr4qFuSEoeMl0E16RwMFLvKnBQP2a65yRI9FKK+AkGsWSmbGf
         iWIA==
X-Gm-Message-State: ALKqPweQUtFdNE8eawdrjAAIGA3w6gyndRxY4dOgi5cdnXfrZV1y88t7
	6EKWZFlhB8LKnIe0viF+WzUw7XY4
X-Google-Smtp-Source: AB8JxZo2y+24UNws4Qg16Wuovj+c9Yjm7qL1w50rm3qQ5Y3rPYrXgBx+fPrpjxBjqOSnbRFlKsToDQ==
X-Received: by 2002:a62:74b:: with SMTP id b72-v6mr6466996pfd.133.1526589046737;
        Thu, 17 May 2018 13:30:46 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net. [97.113.2.170])
        by smtp.gmail.com with ESMTPSA id o10-v6sm7840590pgc.80.2018.05.17.13.30.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 May 2018 13:30:45 -0700 (PDT)
Subject: Re: [PATCH v4 32/49] tests/tcg/arm: add fcvt test cases for
 AArch32/64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, cota@braap.org,
 famz@redhat.com, berrange@redhat.com, f4bug@amsat.org, balrogg@gmail.com,
 aurelien@aurel32.net, agraf@suse.de
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM" <qemu-arm@nongnu.org>
References: <20180517174718.10107-1-alex.bennee@linaro.org>
 <20180517174718.10107-33-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9ef2bc85-cead-080c-8313-bf0113d5019e@linaro.org>
Date: Thu, 17 May 2018 13:30:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180517174718.10107-33-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: iNu9iC3q54ot

On 05/17/2018 10:47 AM, Alex Bennée wrote:
> This runs through the usual float to float conversions and crucially
> also runs with ARM Alternative Half Precision Format.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> [rth: tweak vcvtb.f16.f32/vctb.f32.f16 code and regen]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> ---
> v4
>   - add fcvt.ref and check results against it
>   - fix single_to_half, single_to_double conversions
>   - properly toggle AHP mode (fpsr->fpcr)
>   - more values around the AHP margins
>   - add INF/NAN/SNAN inputs
>   - build for ARM and AArch64
>   - fix bug for hex literals
>   - add float-to-int
>   - checkpatch fix
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
