Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1523560ejc;
        Mon, 13 Nov 2023 10:10:47 -0800 (PST)
X-Received: by 2002:a05:6a21:78b:b0:180:18f6:ca99 with SMTP id mg11-20020a056a21078b00b0018018f6ca99mr5216046pzb.56.1699899046953;
        Mon, 13 Nov 2023 10:10:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699899046; cv=none;
        d=google.com; s=arc-20160816;
        b=Lcjx0K3kENr/nZluSf6EG3L95v1DVmkb4CbkuqF2gyXv2BsTTFbzllNnGDi4bDhbkB
         BNRwLAeDC5zOjCXYzQkojd3HPXdBYSf5IQNU3bQgwDC19ApyKkd2XIY+cBHw3pJgICZ6
         LLiFRZ0u8o3xLBU6h+1LS25MINRcouwW9lf8e0GA5d6r9N8BVohGx+zxllJWee2bgcgI
         kT/Px0+SQgbw1E6fF/U1JWtjcrMs2z1NDF8iaVcTMqoIRMeFum98Uh4DaJ7/DR7PNAMP
         FFKtVDwPtEZ8avUZze7unxgt4owjggviXChZeoDIWg0ie00qKpb9/HPeECOYIz1QJmfg
         y0HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=G5/qOWZgkeSPPtH0EpFhTGO8tdIfjkfMdQotq8wuAKg=;
        fh=qTJptX6Yz3bMzLkwnCsSGl3LtT5PLyKYt6lpdUOfQog=;
        b=jFSayV2fj/8LnmFuPNIAssw2R07GmzdCNeJST+BRO/+Jx43E5BoUuahB2N7FhVbEmI
         +w7ZQNdloUA7dJ4JphS5LoM51oY5oj2EpIxptoGAJRc3ILvZNU/6px3FwReMa6sBV/qx
         3dXGYf0FCp4jngnYg/zQrOVwjaoCsnyRFRwQ8vIIckCuIlny5BP/I0C8BW4j/3WWpqn7
         qFH7tDYXb5D0agLBpyUntqwNHtmx4XvlclYhGWPdl3kzeK5YCT0iGCJxCShuvkGJXnzP
         VDx7Lp4ZqE+iSOwEgdQgtIPauR9IY4nwmQnWY+8G6pIqLjv8/omCGMwGiD0sto+5MMSN
         nXeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H3vYoY3b;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u20-20020a17090ae01400b0027927d03b79sor2217318pjy.4.2023.11.13.10.10.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Nov 2023 10:10:46 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H3vYoY3b;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699899046; x=1700503846; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G5/qOWZgkeSPPtH0EpFhTGO8tdIfjkfMdQotq8wuAKg=;
        b=H3vYoY3bK2vRp4dnEePit015DCwO5qIcHvTjfL217RNbHFz6TKKlaq82oW83BT4Q8C
         K0sYETEdwg2Y5Y6SoPkAyHOUEDEnTBI6JSDsD4NkhqiOflLiI6JI136b8xEo6AaSYKL3
         /05ID/TY6xm6ufq1S66s3ytBDhI6BZspvDbFyfU2aTcuRox2xWe58mmpD1Y4No9sSY1w
         kAkhWfBHWxHXclMTeNJRjHpI7PSwcncTtRaLv53N6Q6Y0WOwRKwEn1kRYwY9oWFQcQYg
         ZB2gQzlKyU65Jjun9xaz99/yw83a7sibYMAkclU0a9/tOlIBnukMmInimB/644yAe6FE
         ZPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699899046; x=1700503846;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G5/qOWZgkeSPPtH0EpFhTGO8tdIfjkfMdQotq8wuAKg=;
        b=biPRYBHm82R68eRjyx+atTtadLi2jkIhzx8wU3JY7N2qR/0527hDhsGpgV68BqtGVP
         VWx7Ms159yLfVYbrq1e7vnxkjlQ1YCip/ObOj0OC2ZHpBODD74BJQN1OkQ5hzlHpspJL
         sjFv3MNiyWv1YKykysAWxbSYM7j2CSJSKufd+oZx7BXTl9ssS3vGXHrTTzRRbuWvk+3s
         53of9vxDTZ7IfsYGiQVWVpzBSwg2DUl+xf2uj444xLIngqcZsIuVjd418VZNEbF14zaD
         seurWg4BX5mTgQlURKfU6s+yJJdrT4PclDdeO5VCdggqHqCMkiskLrqQEFUTOQDxPv6a
         hFmg==
X-Gm-Message-State: AOJu0YxX0k9562HwJ/qKVhO+u6mOF1ss++qXexvAUOUNCS/0K1Gll4Td
	aQ4ZoB8JvaWfjbPjzyeSXquQsK9d
X-Google-Smtp-Source: AGHT+IHUViJUi40vcCWJAbjeC1I6xdrwoRGcxD8HWAB7g1Sz2zxxUOjf7IqWCp/nkqVYvgGeqTiuOQ==
X-Received: by 2002:a17:90a:1789:b0:27f:fcc8:9196 with SMTP id q9-20020a17090a178900b0027ffcc89196mr5441493pja.32.1699899046448;
        Mon, 13 Nov 2023 10:10:46 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.149.95])
        by smtp.gmail.com with ESMTPSA id k9-20020a17090a910900b00280c285f878sm3923719pjo.55.2023.11.13.10.10.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 10:10:46 -0800 (PST)
Message-ID: <365f998f-b7e0-4f5a-bd75-177d23946e4d@linaro.org>
Date: Mon, 13 Nov 2023 10:10:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 01/10] sysemu/xen: Forbid using Xen headers in
 user emulation
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Paul Durrant <paul@xen.org>
References: <20231113152114.47916-1-philmd@linaro.org>
 <20231113152114.47916-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231113152114.47916-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ih+E/oImEtcO

On 11/13/23 07:21, Philippe Mathieu-Daudé wrote:
> Xen is a system specific accelerator, it makes no sense
> to include its headers in user emulation.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/sysemu/xen.h | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
