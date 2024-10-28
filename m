Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp36554njj;
        Mon, 28 Oct 2024 23:10:28 -0700 (PDT)
X-Received: by 2002:a05:6512:2386:b0:539:e6bf:caa2 with SMTP id 2adb3069b0e04-53b348ebfa9mr4917979e87.12.1730182228070;
        Mon, 28 Oct 2024 23:10:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730182228; cv=none;
        d=google.com; s=arc-20240605;
        b=jlzyqq8juGEX0KmE5RdkkIyzd3Q9sKHBJkTRerACzi9sO0fa4fAJQEaf7NL+t5MTey
         IC4PP1iGNs0CRA7Ljv+6b9YYbDqgQaRl+PPbRDxXyD6VzaUhrAQ9JFhriDgHKZ7e/Yln
         nqirWm8a2kOSd9RET3LaUqNqw5KBkhgTSinOnEy/post+CrTwrEExDVnWEPuqJrurJbY
         Ydkv7XBd5sAX8duw+zPduwQ9wSwkjYliRu1/CZbaNCuDoOf7kxhophu5aov313S4LC46
         LjizNXgkHUj2rjtLzZGvtWtTELJ2GsTWu142HNipD3ryRyd3jsQFdksUxUOTsA8TNnEK
         3+FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=LBYlIYtb56QjZCFiyBqEfxu1SvmGl3VLxj/CV2vqNcc=;
        fh=cV0x2MJ9gtIrfnrUMYB6k0QkF3vl+EU6F4WwtejqRuE=;
        b=KUqcmRHQHih4+V123ZM9tMCaJ+kVlDJb/3dW6AKpKZcEMTNanv1PLHIfBHy2rp2wn+
         5Vuu87p89o8067K7R9YqYphRtxuK1cHc1zWDkqfgmiDPI6yhMq50SHPB/O3+6imVQBOe
         V4dRcFNKD4HM17xLX4SlxZQGcVe57WrxEeEU2ZjpzSie84YI+WLVK+mbCgBffT6Qm2+X
         iAY6Qf9rM9DJB95rGB5r6cRuylg/GwqOZ2TFEEWmHdapknJBLBom3ggFy9W+q6y9Xmb3
         ahAvKh4SutA8Z8pxzoXmuBtBg4fVGDY94Cc2pL6aW+x3Fl+61z+mcu4mJUqH4RcNuxcd
         Bgzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yny51BSu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-431938f5068sor37533075e9.4.2024.10.28.23.10.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Oct 2024 23:10:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yny51BSu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730182227; x=1730787027; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LBYlIYtb56QjZCFiyBqEfxu1SvmGl3VLxj/CV2vqNcc=;
        b=yny51BSu3oaqyL44Dc5idPHzUhfFnNS0OIEVR3406Kd2QjSXz0GvxMuX6Yn2zJg2kE
         3j0/fScCWMd+XQ6CLPBMCKB9wg397mO1VuJitiU6IrR4HsvYDkWflyxx+gpIPARNT3+i
         TkSC8DKxAOBhlz9sY7+BjLa46YMxttHNkQuz5pQnVMlINLefEVfgaHskXv7BKG7n9cuw
         3IlZwf3BnYuXr9WWBbw1Ywa+ERKJ/E1dYjMkept/561+2dbJM3wxa9RgbpfFnO/IbjTe
         vWAgGRbJsWI+NXnkktNBMij1v1kfKIEhvSNCCEruyZNXzMy903Fy1tmwpi7mmSn/GZ16
         cilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730182227; x=1730787027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LBYlIYtb56QjZCFiyBqEfxu1SvmGl3VLxj/CV2vqNcc=;
        b=qr6rwTu/zgFlA6ieAnEKIe6ecS9EoWvZkF5j2jHYM6SgaR7ZhsVSMWFHDLeUQMKUpC
         1dTYMaTcg5bWQLuZNQMzUX7arqVOUb4mAeCxlcwvmwdP15GRA2tlpIT2bNhNCUSt9eEE
         WDnNdKfUS65gr/KDZoQKvSUQ6PGw2Df8evfV4sJRd3JpZEkWAhyrDI2/nzr3tcGREUeo
         1GGvZ+c0C02vMuZ2/rWylF3fOcH77uZXJnUqvff0qtAxES3hL0dlqCgKpvyif56a8VIH
         EyK1yv6TsvOmV2m1SmFSrkxmFVz0tEyqDwtDVniczI91WcbOIrN3ppa5uIeJoVxJFdGG
         yojg==
X-Gm-Message-State: AOJu0YxPQ3XhEMVcq+IvjKP8i+e6b1C5X5YEnVqNKclFoHNlrip1v4md
	5kC/lN2jVorg2PzNqpRgU5U77cszGai+gQAY9d+LFmNx+miZ/OWssyeX1f6O/mO8vg==
X-Google-Smtp-Source: AGHT+IFdtFbMOj449aVu5jRWariMT4S7TuC6Wj0sPDHtWdxpM1+tORNum1Aw16GIPVgVJsHqPw+JNA==
X-Received: by 2002:adf:e2c6:0:b0:374:c92e:f69f with SMTP id ffacd0b85a97d-380611282f0mr7941989f8f.16.1730182227467;
        Mon, 28 Oct 2024 23:10:27 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.21.227] ([90.197.151.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b70bc1sm11560253f8f.70.2024.10.28.23.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 23:10:26 -0700 (PDT)
Message-ID: <f1e6c7d1-b976-4b5c-af37-31e8e1a6352f@linaro.org>
Date: Mon, 28 Oct 2024 12:07:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/21] tests/fp: Explicitly set 2-NaN propagation rule
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Eduardo Habkost <eduardo@habkost.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
 <20241025141254.2141506-3-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241025141254.2141506-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: A9mPQVPC5U9U

On 10/25/24 15:12, Peter Maydell wrote:
> Explicitly set a 2-NaN propagation rule in the softfloat tests.  In
> meson.build we put -DTARGET_ARM in fpcflags, and so we should select
> here the Arm propagation rule of float_2nan_prop_s_ab.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   tests/fp/fp-bench.c     | 2 ++
>   tests/fp/fp-test-log2.c | 1 +
>   tests/fp/fp-test.c      | 2 ++
>   3 files changed, 5 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
