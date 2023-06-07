Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp74588ejb;
        Wed, 7 Jun 2023 00:46:52 -0700 (PDT)
X-Received: by 2002:a5d:4b82:0:b0:306:3352:5b8c with SMTP id b2-20020a5d4b82000000b0030633525b8cmr3750704wrt.7.1686124012337;
        Wed, 07 Jun 2023 00:46:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686124012; cv=none;
        d=google.com; s=arc-20160816;
        b=P0CKpp8FhOVDTUAB9lzIudWQQ3PHeRFzlaywJ7L1lYUqromW6IGTzX86dOujfY1s4r
         3bTe9uyRzreVWPtS8dQlQvmRrQvGPKKVife32Flzv6Sye1IAKEAzcXQGxnbnEAPrdB38
         eYwhBJpvpvpxdraK8pUKO6EV0wiXHlrPOSjpfFLLEVCzXKmJp78tUhS1ZWUfSDbGdf2Z
         dQ1AciUDCeWrmGvsyn9WWhKK8JmyIVpMYZbcvB/f5HpnCDiVUUaWXBKkJtjk/iM1zyNo
         fdPX5iEi+hkgvmMbWMKCET8OE8r/ttVhJbXwGpxatl4GYsEaCl1FQTSNIJQPaEtoAYzj
         jq/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=weXaM3N7og6oPqkLmGRnoChCKjpn1ZdJQX//LF2/7FQ=;
        b=BvQrxp65V14sIOKNc869yee2HzGWbV5DNEXzRaNpXwLTSkGmu4hSw+Yzfsh7HGCktb
         SmU+ejiarm3A+i+ZM2mq8IGyIH8TF1cSSoGuNvqwxEzKSjcytA3+jTgrqrSrhGZD5UOT
         8i9n3mf5EcC0hy4K/1Nqxb82hzzcNFzY5d1G5AiBMwGw3tL0jaoDgy3NKB/LOM5W80Vp
         BzEIg0PNYcNEXL6TzDzcwxsxByxNvlnGW2zzhs7+LmXo4NxD3uJYk7KA/r3XRAw/VzCq
         pD1pn1khrzHWtfMFIYNc5tZ20NE5aFZ31xXIJQpyKXUdiIoliE4PPWYxG1Z47c6eldsP
         Qctw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZTiQEwuX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bs5-20020a056000070500b0030ae3d06d5dsor284970wrb.1.2023.06.07.00.46.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 Jun 2023 00:46:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZTiQEwuX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686124012; x=1688716012;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=weXaM3N7og6oPqkLmGRnoChCKjpn1ZdJQX//LF2/7FQ=;
        b=ZTiQEwuXpPZADK8EsiN/cEJQohtpZWO50uiF+pDHWOuZyIvmOO+Rqy4lj4xNVMrTaX
         ukRbXHu1mcZ6/2Yj84bq2AwdF3h+NM0MLzx8TwUs3EO9X3gRpWwVxH+rhl0K2xpo5Gcz
         5xCjbkRo5jE9l5YbTpOGGjuLlKc0lExqcmYjRvHLZGf/VgyZazPjEvRIfUuaLYPP8Ao3
         spKfSkEAcspt3h8cPHx7AJ6j7SgFuE3DDn4h6zfBMPWpUDvJh5ArwSZi+TaGgB+fH+2H
         UPuaV0i4zuSJ771YaeJ7wBtLLs3p/pOT8+MvaUOI4xeVhP/PAXvpkk5zJ/6rae0Innnw
         Ml+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686124012; x=1688716012;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=weXaM3N7og6oPqkLmGRnoChCKjpn1ZdJQX//LF2/7FQ=;
        b=PZRYDuKkvg++y6BS+/+9tqboIO/UP4nMQxfd9gfWTOILtoY72SfUS0fCvIgQxtuJRt
         u/WDLF8rdTysaXAdfXVyIXu3XIl8CTfyJIXHz51w9UOgZkbZhAPEUi14VyR16wYqAiWB
         jAf/Y0N2iOzfixzlANgirRYBCHJqHbcEdtTmVYdfFwf/IAo+ymqAloZOR37nzuc3BKwu
         enktSOFGI/m4WcGnBf6ISEAHMha8aqznr5qENvK67inXX4emEA2a8bglgpC3Iy9pERB/
         slNnEXtjPho8zkk+3ngoqsNEFoRADqtO78+WOEERHCQKV4e2se96NiPRLEQ1mcmijaL3
         JCgg==
X-Gm-Message-State: AC+VfDyU7MQr3tZNYM0WZvCj51+vnsNNLHCZLyNNLZC0kXO97C3X/LcZ
	3pbtuC5t0FwqIIt96HTQi9baa8XA
X-Google-Smtp-Source: ACHHUZ52AHsuLXzI4b/H34zQbyeyZ2YWv7ZGkz9bbUxd7757glqnCsX87wV3E5fTn3dMx1ma11il8w==
X-Received: by 2002:a5d:534c:0:b0:30a:a193:3987 with SMTP id t12-20020a5d534c000000b0030aa1933987mr9918087wrv.30.1686124011975;
        Wed, 07 Jun 2023 00:46:51 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (bd137-h02-176-184-46-52.dsl.sta.abo.bbox.fr. [176.184.46.52])
        by smtp.gmail.com with ESMTPSA id x15-20020a5d650f000000b002fb60c7995esm14713947wru.8.2023.06.07.00.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 00:46:51 -0700 (PDT)
Message-ID: <055657fc-92ba-0f91-df86-1ce4cf096ca4@linaro.org>
Date: Wed, 7 Jun 2023 09:46:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH 1/2] target/arm: Only include tcg/oversized-guest.h if
 CONFIG_TCG
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, thuth@redhat.com
References: <20230606224609.208550-1-richard.henderson@linaro.org>
 <20230606224609.208550-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230606224609.208550-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: FwFtQNWsKalB

On 7/6/23 00:46, Richard Henderson wrote:
> Fixes the build for --disable-tcg.
> 
> This header is only needed for cross-hosting.  Without CONFIG_TCG,
> we know this is an AArch64 host, CONFIG_ATOMIC64 will be set, and
> the TCG_OVERSIZED_GUEST block will never be compiled.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

