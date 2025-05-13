Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp409130njb;
        Tue, 13 May 2025 03:11:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXllEGmAwO8RN3Xh1wg+8sdXOQGUxiP03kHCCgz/XALzWYrysCu7zveqrQi6H7xi25YgkqpdUeUM/A/xw==@linaro.org
X-Received: by 2002:a05:600c:1d98:b0:439:9434:4f3b with SMTP id 5b1f17b1804b1-442eacba83bmr27080175e9.8.1747131080297;
        Tue, 13 May 2025 03:11:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747131080; cv=none;
        d=google.com; s=arc-20240605;
        b=EjvmAUhUO1QBb7hJH+2x8ougteV1Oh9Y/ALwgPfI1C+5d4F9D0gfQAJajzuN6ijXK8
         bzPuBy1hrVGqBEc0CDKZVr4X2IpkOjPjyaCR/7ljjOyUalh199sXrBZuibPpARs8ZO8x
         S3HIXwjk1K42/wZfKa6+8CQ4eQJXp4Dabnh6qPNA5FNh57HL10ppdzh+FZ7MRUudCq2k
         36JO0/tGcTgs2t14phi0Hn6y6tzzJA5odQOlQbix/roreMSOJfGlque/+3n5SVL1DTo0
         tHIfCdo1l08aYx9O2t1jqsMipIEnK4/ItLVyn4Kp70SrjHW5IdDAx83OIBpu6BDfDMo/
         LcnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=q5InSWHz49sEJKfoQ2QNQ6ZQPGuqc5C2fmBxgyhIp60=;
        fh=wbCFjZIa5XqZOEyHoh7Xl67sVRtcyjne0N8DL8kWKjY=;
        b=UDXStlSD/dGwgfcqXn1gEYAyPzIpYeRqSn0Ka1LN7KF8lz6ngPpi8DrDE4yjw0e1uN
         JIKq++oqHy5MDudmHbH1JaEypwTSigjczj/b9lJmin2D6iv+W9GWxhbkupApJAzCnXG4
         qR77ljACJqIrekkQTenJBOy9LqWOd1mCM4RNwgIij5kHnkyAWIgXypbbY5U+muzcIRXb
         3fZIlcD9mRe6UmePqUsGHJD61hoxKHVNtlrlHbrmDZlxCTw7DD9JHzoCWLW840mERjQF
         u73agGqNKSgmvhu+LBcGg8B6c5mvJSW/JomNELz0c/gCNOxTumK+44A9oGEomF/I7w86
         VaAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rROg+VuQ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-442d68606f7sor24131935e9.5.2025.05.13.03.11.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 May 2025 03:11:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rROg+VuQ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747131080; x=1747735880; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q5InSWHz49sEJKfoQ2QNQ6ZQPGuqc5C2fmBxgyhIp60=;
        b=rROg+VuQze677x8XbJqD82C7RWFinELpRK6mho15vPaLWTy1cE6hPiRFTLH0nYkmDr
         xPQWy2WanG3vbNUiKxLEHaeeXnU9Qtm4IXdr5nSzmdTPJ3AgNNK+rn1Yt+btoPqXKrkq
         kijYbEp3M8ZSzqNjxyCdzrJ82W0BLcUyyK4n5hs7hUt8SE/I+IYHA8Km7vbLPobzqRtE
         hn5fa44QeI2CdgpHcrjsxJ9lYvluerh7WfUn0NNi1c5bv5LL7goFMCwvUg8z5cahWIty
         TYR6frggct08Nj8//FfE7dO4gNPDRk3YRVq5qxMzYvKAnVWQdwcbXKBO0aTIha+3i/Wa
         GLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747131080; x=1747735880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q5InSWHz49sEJKfoQ2QNQ6ZQPGuqc5C2fmBxgyhIp60=;
        b=qrF5fMoGa7ZBBhstpn5HFTCV+uRe7EqDUl8gOvmJiTXnOc3OKJ2jP2vOotHiZDhbmo
         V+QeZzEJxvYr85Q9cjDG9Jg81gynYZ0JRgZkfWx3nQpHOSHaQN+mE00RK8hh5zjHCMS6
         YjkdLJtm0Orjh6wzCfyEIYQTEGpqcM00R37mgHucdaWkOxlpNe+rKNgYRzIGjT5g2iX7
         GJ4CV9keGKlHsTFIMTw/LZFxUR4/Ups2MzP4LXyRxlLAx39lhRRdwbixnZDFyozCOaL0
         tYSaZS3M9rhjYGdGo8qoQVQyRfSputmmBlR9V89fj4syZH2HNgtAVWzURSXs9TM+416s
         4Yww==
X-Forwarded-Encrypted: i=1; AJvYcCXeK2IYLWGewEYeFGC2Je/R9sXBwKKJHlp6zSLYVmfh6qT7NLGl80p9z1t09n+e25W9u0NxutBKcG5ZYA==@linaro.org
X-Gm-Message-State: AOJu0YzKCiAw1Z/INvShfNz9o+uOyesBAqs0XtQXy/WpZiEqhGbUHOuL
	dn1vYwmORH3bHq8vnAf/ROUMv3eG5FE2+59biYtbkMV6ijQQMclsrAYFrJhGo0UsfA==
X-Gm-Gg: ASbGncv2d91aGZBkr2XDzfeiZzYsNtZM7YqHWUDuQtoijGwylrWNGPnY3uyRlh5ZWwL
	/TtOH9H3PRqi9sJNEqMPaN45qr1RKoCDq+3OPsMPZs2CVfuuA0rrMr7E3KVgVwU+NZdqunjD4MG
	UsS3HZZlSpkd4Q3UDtylfdADGeKTsBRzjOecmrB6h19/GtNPWzPJKMnhr0ejDNO4sn5hvrf5Ttq
	RWSs67wukUqIlkwSKXSNubXiJTR+Mhe1C9pqWQToWatadtKaRRhQlNAarlQz6ZGnOjM0kx+Tt3D
	g+1I0NBGaBo/JOgCIY3o1SIPfv6KB6WFn+RPmUo398pQgeTwt/BawshZNhTWwqMrBTxyu1rJXfR
	24jxw4pyJGs0sHp8zQ9Ox7t/b/yF1
X-Google-Smtp-Source: AGHT+IEkcecHn0Htn5ABlcVlMJzuiyYg86vctMAyGuRrsKTB4IoF5CCoz34yObtxnuqTTVpntR6a/w==
X-Received: by 2002:a05:600c:3481:b0:439:9737:675b with SMTP id 5b1f17b1804b1-442eacba7b1mr26570885e9.7.1747131079771;
        Tue, 13 May 2025 03:11:19 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [10.61.1.197] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67e138asm159084715e9.10.2025.05.13.03.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 03:11:19 -0700 (PDT)
Message-ID: <70f097b4-3870-46a5-84d2-6aa558ffd152@linaro.org>
Date: Tue, 13 May 2025 11:11:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 38/48] target/arm/machine: compile file once (system)
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, alex.bennee@linaro.org, anjo@rev.ng,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
 <20250512180502.2395029-39-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250512180502.2395029-39-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: SoM/Q1vn94Ru

On 12/5/25 20:04, Pierrick Bouvier wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
