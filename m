Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp5968193wrh;
        Wed, 1 May 2019 07:48:08 -0700 (PDT)
X-Received: by 2002:a63:550c:: with SMTP id j12mr5547347pgb.450.1556722088590;
        Wed, 01 May 2019 07:48:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556722088; cv=none;
        d=google.com; s=arc-20160816;
        b=xgqw6g8HrNNVPXcllH1+7+tZaWlxWO3JoGPaKs8LxpUqw7PLefq1XcZmpXPRCpDEzZ
         smZ/BiRcZz4AHoNZxFapzmOI2Fd39IOIe3/dT2YECZ3hthjR2PJvEetAaTqSIjbEkEBP
         4M/7qKrsFLUbiZka657L06JcS72FcnKWjljxjWR7vlXioLDfBgnrnVYKcqQh8KG8DSbF
         lN1+YS1D5z8N4OF3RtcQwUSz2gvAyDcMODj6O2HfYKc+UJ1uWPoVGypgSmyVavYlNvrh
         nH9AZNRog/mj8D9fS+FF5wO2Tbf5jKU+6fW6ML+CJyZ9OWNUugd97Q2m+u2b5XcnqTZv
         j3Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=VIJuHIpKvUcVZ02vd5bDbLNfE3oPYwrTjUosQXqdGxc=;
        b=0bWVyoZ4TwPYVuFOj3PjV6LUyWe98P+zfwqtUdqdtETRVjnfziVQ0gBfh0ZTqH/pDi
         M6SPC35nUWJBXAn4xzb9AmZ4Vv0d9tYrQ76vnzJLwBQcAk1NpfK8a22dZZaJvd6Uew18
         NMwqq1HEGv0HBIV5N2Y2/eHLNjXHu/TrsbhkvaSxfpW8GoXkh3g1W7H4O8bjFPRz3bod
         /C41R+fh0Ixvetd8r3oKq0IYzpY0nqEsG56KiNq1qp47NY1IiPu+zOSsiCQfR2uYBIun
         tsSM7v7rVNh1a/Mag/KaVvLB0hR//Pn21lMvXv6UjKw6UthZx+i81GbnDeKwUVoIACoT
         BW0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q+z4QJX3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r18sor15371138pgk.12.2019.05.01.07.48.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 01 May 2019 07:48:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q+z4QJX3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VIJuHIpKvUcVZ02vd5bDbLNfE3oPYwrTjUosQXqdGxc=;
        b=q+z4QJX3klSV1xNSkH39BeQr8SAGtj50yLYWLSD4EEMf1M5c8/FG8haYxS0JnajlPw
         bJwoS5AWOluIT9mU3GOZr/OZkj0J8ccTZ5kwf9BMF851C15fXSat0FKie5UxmkMqaMnq
         fN/8TmJfXZMt3ToRX2Ks6N3TcE9ozLT1kTKqyC7Lc/wb3XPJfB15+7Lsytia9zS2lF+R
         kANLZ0wXeaUkcSzjZQrEZGhdwgovl4KX4P0bp0burF4A8aRLqTpl5rEISdlmE+v++hxj
         fBbY0jvIbzM2+/SqtJw0I8r06RtCHxQnYBHZKETk3U/e7P7GuSk/tlinWB03Anda9yQ3
         9i2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VIJuHIpKvUcVZ02vd5bDbLNfE3oPYwrTjUosQXqdGxc=;
        b=Zbq9PDwSqNvuIpmxsVMA9O4wabEb0Qw1bwheUSGIUG+jB5v685T+dmxrwnsKLhTi3l
         aTtiLgozzvwVpequCrUqKbdo6uhSgDsg6FpLYOvi3ptpTTWFBsV/V0p39eUOIO8X/d3q
         KZ2eU8U5csjcvc/YS4HzSNP1fVS8nsUnvB2h6S79ECOLF/u7BhQS2/mzTchINQ8dcvD4
         RkpvkddMxatdKxpDKLnrAfe7XxGjQzH147Az6QUjtIOrNR1vZe94gSbzq6g6DGCYQFmd
         jF4SQw9CkdCmitjhWIynRcSi0KgxLjao/Sr5UGqHeYDthobBJpk+ZDzv4+y44RNZSRew
         +PMg==
X-Gm-Message-State: APjAAAWjTu3t/5tlho2Gq4D+iz+gdycSARuWyD52MLyEe7qx/p0OIIUr
	XgNOIiDBbaEDDMPURSv8zulhS65J
X-Google-Smtp-Source: APXvYqz7f5M4TzcRsi+EpqCP1BW5YFxKG8Zj9d0zAxpREBHNspYjxza2DiKY/9XCAU6lke26FxapfQ==
X-Received: by 2002:a63:2c55:: with SMTP id s82mr73048706pgs.356.1556722088179;
        Wed, 01 May 2019 07:48:08 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-189-189.tukw.qwest.net. [97.113.189.189])
        by smtp.gmail.com with ESMTPSA id j1sm43885961pgp.91.2019.05.01.07.48.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 May 2019 07:48:07 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v5 13/15] Makefile: fix coverage-report
 reference to BUILD_DIR
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, mark.cave-ayland@ilande.co.uk, cota@braap.org
References: <20190430165234.32272-1-alex.bennee@linaro.org>
 <20190430165234.32272-14-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <4495b23c-99e8-d9f8-d408-fcd9aefeb458@linaro.org>
Date: Wed, 1 May 2019 07:48:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430165234.32272-14-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 4AHtlOFWP9mX

On 4/30/19 9:52 AM, Alex Bennée wrote:
> Commit 337f2311f actually claimed to do this in the commit log but
> didn't actually. Oops.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
