Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp8511355wrp;
        Tue, 1 Oct 2019 10:52:24 -0700 (PDT)
X-Received: by 2002:a17:902:558f:: with SMTP id g15mr19498927pli.91.1569952344840;
        Tue, 01 Oct 2019 10:52:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569952344; cv=none;
        d=google.com; s=arc-20160816;
        b=LwRVvkKLMCAzhI8I+cClSD/RbrC4YsevdFkXb5lDSs0mUrx5EdvDl0+Qs1nTnpIMQw
         X+eaehDdA3NZwKlO87og1PZDOebDBQdf6REH/0ZOUbiryQ8VsNjjKauV5QWlRfjCBkIN
         M/vuZw0zi5/X3Nju9IvpZOw36MLTr+9FRA3+h4gpPhJ7W6OuM4qY6NDlWC9FOoQxUR2Y
         cRpuChLfyP4Cyx9dJ4pQT5jddfh5nLnnSw9Rc03kiBn8VE0mFHDlCgwXvVpm+j4k9Inz
         If99tnuEdRfFVD5CSp5ClnuI0eOn7yVHGWsrpts//Z71L2ax1N7Q7KfRmY8WjH5VPimT
         qCgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=IamS+0u8k2KB8OrUkHc8+dAuTrF8fBqWKyndWEEqrOo=;
        b=Pi3hfiJbmeQ+0RUXuXH8oprGjyZHILDLUi7vgVHWToqQKQuLzFsH+sgAuLkz5g0y+N
         bzUS92GI1wt690xFCrPGdqiR8KIONIo3cx+XWawjiILJ5PkNDIdGwIBUcqfbfNDOiHa3
         Ou1Wk6T8GmWrEj6bZBbIgD+EGE62PkR5umJmnQJpTHd20XAW5qOUlcHzdLwQrU83kokV
         hbz6aCeszWtkBxthrXc7ddNNLsfXTGRG91Hg7b2MfFhRNGiLm3y59yPhFMM5iDlzmMpv
         EJ3wCT/G52YM6ABCrT1IMQbMca8iK2F7jloHYl6jvfQvYrDfKYDhcPVfZN66ACajT+ml
         Hsyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dPqfyvzr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 10sor4514732pjj.22.2019.10.01.10.52.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Oct 2019 10:52:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dPqfyvzr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IamS+0u8k2KB8OrUkHc8+dAuTrF8fBqWKyndWEEqrOo=;
        b=dPqfyvzrh3a7uxqWuSxWN+VJy1GbNgTk7CU8m/eYN25DRIhxj5038QzyI73yyM7N1M
         qHwVBr6lwAQkw5PpYPNcIGjL9BX2YdtzYTXsTquRAe7g1oCAK3NVKis+2+zSKVKTUzfi
         RQ4moYvIlXNIN8NH7YV7pPrzmFCCLlMH8IuETmRyddUIO34foSrFEF9mq8TI2KxBAbUj
         pd2UDAgJYIJsVxhCrSfvZhEXlrGb4yAgsSH/01cjEWnn2McO/4F036Fvn1NsYiXfWqXg
         fDkR2fV02r3FCWkDQ9vc0Gqpzj6nxgcQBWmU+xIGxtD+4RPuycLT9GHlCXyD1DYjoUzA
         uLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IamS+0u8k2KB8OrUkHc8+dAuTrF8fBqWKyndWEEqrOo=;
        b=uWwSrs3qaSB9e8zZOxjVS195NIFmAzyqcLPIjEr3VmM7rxKbKoNmJa9b9y+LqKyE5j
         aSKOvaQa2tQOyuzqpPlYHVZHLpSDdqwhlTbfsUENqVwuGboxWcBEfzXCxCPEBEWVBUSP
         HretfHg0SP+tCknjifMa8oBBJcXFsN21mHbeJBvnJHrtPUQ9qSjXr+E9hQYasNvB5I9c
         ZfSe5bgvHdz4kYQ10WeLPbj4nmT7WdKEVp2ejs4inOTSM8VWQfCKMM7iFzgGRUOoHIww
         p7Fw596GAb/sKV3r9fQ+XSjEZ+Jx62v4R5KoSRN9uCjoVAqi3y/Htl7SDD7XeAFlRX4f
         B/Sw==
X-Gm-Message-State: APjAAAWQbIYI0flWJ9tY0LKo/ZwD/qgx+bmj7m9bKzTJeNbgcpFIx/oT
	XD+LABcKM/v3c1/X3WN4Kd1MobYx
X-Google-Smtp-Source: APXvYqyUdGXUSQpbOyELCIMlgZN1jCNn37UT+braM2Vl9kkDthbvSGTcqUvnsE5RmpDGMGaznr76cA==
X-Received: by 2002:a17:90a:5886:: with SMTP id j6mr6701868pji.137.1569952344168;
        Tue, 01 Oct 2019 10:52:24 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id r11sm23427490pgn.67.2019.10.01.10.52.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 10:52:23 -0700 (PDT)
Subject: Re: [PATCH v5 5/9] target/arm/kvm64: Add kvm_arch_get/put_sve
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, armbru@redhat.com,
 eblake@redhat.com, Dave.Martin@arm.com, eric.auger@redhat.com,
 imammedo@redhat.com
References: <20191001125845.8793-1-drjones@redhat.com>
 <20191001125845.8793-6-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5d79e6bf-2b16-b7c9-726d-226d149f7e4e@linaro.org>
Date: Tue, 1 Oct 2019 10:52:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001125845.8793-6-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 5xjWW+U9rY7l

On 10/1/19 5:58 AM, Andrew Jones wrote:
> These are the SVE equivalents to kvm_arch_get/put_fpsimd. Note, the
> swabbing is different than it is for fpsmid because the vector format
> is a little-endian stream of words.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/kvm64.c | 183 ++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 155 insertions(+), 28 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
