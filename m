Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3176238wrq;
        Sun, 24 Jun 2018 15:43:31 -0700 (PDT)
X-Received: by 2002:a63:8848:: with SMTP id l69-v6mr8402622pgd.377.1529880210953;
        Sun, 24 Jun 2018 15:43:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529880210; cv=none;
        d=google.com; s=arc-20160816;
        b=V+aXeDjKHaCGSHkLuJgqwHohX0r5ZV5A+dx9bC+EJQ+EeBB+W2PsMpEwQrycwUjWmN
         4lAO7lkK5C7/KR50LYZTbUuUAhTyshF2fnhauFOjDnr23Nl4FQYhaZjgOBXAkEoodOQl
         I/Q+Bh+TnHENsMLAM/a82xUX291o82d33dq6A2qLNkPu23vI3Iu4RCKsZMRxDdZiE9Dg
         JohwwLMLWIh80NH0C+0lzJys9U0Q91Fw+hURW10Lp1pKQxNGtwf7K1JAs1GaD0gdEJfX
         l4CJtlxPPpTt5zaYqE/Q8/KUL2vUoc9wvr/KL2WzOhz5jGxbu0ErIv8lV9sZZ4xTdRGB
         DEeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=LjI2b817iyMSxhhOCbcdduO+g1aAnj+n5Sx2DfgP9KQ=;
        b=WxcDG9i3bQYh06FQmXTedjZkWN0zOt056ByhyAjcHAIRzJRe0KAp9jo3DStg0FpUEQ
         hL3gYO4ozajiRuo+nbiJR9expu/nG5F0saA3TNSFozywuf5bgD6YODLZIFBNggWHUAd+
         /LdL/t05uzvCwE+c5VmD+M4qEeDRSYgm10RlxRM/tmKmAxR3e8U/qg+EN/1ZrTKlgGrs
         yz3zqOYRCC4pC5SHFGC2p0TiJ8HxgiYUKow18wgbeD2SEmpGGrZxyZdlfuODrVxsdiAC
         jw6XiRGK7jgwb1sMjfDOP5Xl8sjb+VaCdn5C7qml2k8OZqIXNIWXwvG33fo6P8tDYxVR
         Pyqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X8bobbN7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q2-v6sor2572643pgr.173.2018.06.24.15.43.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 24 Jun 2018 15:43:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X8bobbN7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LjI2b817iyMSxhhOCbcdduO+g1aAnj+n5Sx2DfgP9KQ=;
        b=X8bobbN7W4Gyf/YYb+wzpOzTC+EeN4ues8aXa8ROG1uCE9Z3ni5Ds/lkfLaLCvMoQ5
         fa02DuAU4wgW/vIjCBTxLvMWRczuZBEn6xsdxjdnLo4J6iC1lrh4M+QI11ZxhSMJRvwt
         WCkLXPFU85z5i4GIkhw0kgu342wjs39XPwEFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LjI2b817iyMSxhhOCbcdduO+g1aAnj+n5Sx2DfgP9KQ=;
        b=dtmMDEUfcxcJHgN3vNnTHPEnJBr7DMW24vQCpFdIPGOvTCeSAPhClRVCMq29dlwmXH
         yZhTInFgYpK9bRPYBo+5gF0ZsgoOCI9IZLKzVERPaELqutobV41SqukMYoZNxgNTU0J4
         0ew8lO15GkloraR2ePJfrNydvlgYIhZE3V625+mUp2rnzKmqq9Gt9t+FhvJ4lPmDH1DS
         pgYXov2x8T9zZZsoDK7zORwg+NtZy1YHwbn5I7iF61LvOtYon+qhctAMtDWWKewuIoxi
         oiUA23yahSXqgoPY1j/mBJmazhWbtGJ97QE5dAf3MaoXLLb3xjv+awZdEZ/buoum85rB
         Rb/g==
X-Gm-Message-State: APt69E2NRMLgqox04Te8iKIw+Kmp7BRjT+qvk4JHTdzspPQBypb77Bzm
	ysmWQE0/4WL4qOlkNgzLqYBeQejgxeSIQQ==
X-Google-Smtp-Source: ADUXVKLrxdHtyYAAv9GRrk1p+jYP8kPcRs/z6MEkvkTc3AK2ocRF9nLJs2LoX0XR9VpNF8XxVmD3sQ==
X-Received: by 2002:a65:4308:: with SMTP id j8-v6mr8559305pgq.351.1529880210445;
        Sun, 24 Jun 2018 15:43:30 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net. [97.126.112.211])
        by smtp.gmail.com with ESMTPSA id g80-v6sm25534805pfd.21.2018.06.24.15.43.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 24 Jun 2018 15:43:29 -0700 (PDT)
Subject: Re: [RISU PATCH v4 07/22] risugen: add --sve support
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20180622141205.16306-1-alex.bennee@linaro.org>
 <20180622141205.16306-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5a93b198-081b-590b-5080-0e493dbc5456@linaro.org>
Date: Sun, 24 Jun 2018 15:43:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180622141205.16306-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: rLKV7sy+j5ro

On 06/22/2018 07:11 AM, Alex Bennée wrote:
> This is similar to the approach used by the FP/simd data in so far as
> we generate a block of random data and then load into it. The loading
> is actually done by the current vector length but that is implicit in
> the run anyway.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - only one SIMD/FP/SVE block as they alias
>   - move efficient loading as suggested by Dave
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
