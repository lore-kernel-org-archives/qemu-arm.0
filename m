Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp5965505wrh;
        Wed, 1 May 2019 07:45:01 -0700 (PDT)
X-Received: by 2002:a65:5549:: with SMTP id t9mr73554153pgr.388.1556721901782;
        Wed, 01 May 2019 07:45:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556721901; cv=none;
        d=google.com; s=arc-20160816;
        b=jl9iGf1aiK7+pzXqM5Wzbox3wpFYIFIEwwaqFk4EL9kC/5ujUR7G3c8HypwYB09BBu
         KyKBvw/IsNmaA+vzOHZQk9J5Rsu7p54sVWln1vA3jNxffOfDP6z7KlnNvyTBOdhVO0z/
         IYfN1YDPzDfM7bY5MY6AGlEtYpHCMt/p92dBYjCMCvT18RNiPQcuTc9Pbtl5h9CYW4HW
         rfTbNBY6gWo+GZ+Ot9pEbjTXhyscrGOku/Z+KEXyBtsm/u1XNdZANwQbi9krFrt9fmcU
         jKTKX4aejDUqQwhZtbYw9dr4q0DTEcPMWeVpXPQaXVKdc+ESDqaq9aEh/zwns6i+nNhZ
         Zqtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=IqiOM+wpOEZCeB7Mus74BtlcmVq2X0DTRYyU8lE62DA=;
        b=kA+GKU93z6y5IlaugKmuf2CeT0M8SvYysupyv/l0xv8ARpEq+C4YN/6/u4ljfV54t/
         WI6YBC8+ycWJ7BUnFnGWBuWAGq0GGOsyVNSQsk2pZJDRMOEBrjEzrkSWwtc5gUPW4VXE
         ldjyBnBsVAeLE8mflMMo2o3EMjj4prpNCy5/fxd3cXjff6PS0IIAhvB5KrYBBcBaSid8
         U4SWOysuQm65EeTAY1ZJrDgAL+fUvs2A3p+vtrAaxGYRwBNGpd3Rz7PGLF33U+HlBz+R
         pPp4KbwyHnfm+qnD2rZJwvQmVwv8DUAr1Cy8ROEalJW3wML6N/uXc/SlrNMhZFrTJTUD
         9nag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SuV4aeM3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g12sor2028542pla.12.2019.05.01.07.45.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 01 May 2019 07:45:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SuV4aeM3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IqiOM+wpOEZCeB7Mus74BtlcmVq2X0DTRYyU8lE62DA=;
        b=SuV4aeM3OgFjvIyCDhfqdLsz3Ajp0YHPpnMgLB6z2hmle6o/1HgYuczEmI9XKgZTFg
         OVSkEf2pptmmEFEMt9AggIDSTx+CAgwD6/rZWywHRnkY/JsZ4JWQzS8lyWAyVGCS9uYO
         2EF/MMw2eudr5QvuW6Xrgxj9zbJSuF0+4K5/fsS9rNuseWN9A3L5fIQXRa3RJtzknbGe
         2jImIN7iBrTFshWqxdZkKRA3i9lM83/6nIKxFiT9+vsWHlmX4T+VkTzUpFIgHiLiPdsi
         sKDHAeM4kKsFVcI6jOUyR6EiqXkTWb+SFm4WrS0dNTMHZxMGoLn2oTT0RskyWexwdRVc
         L3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IqiOM+wpOEZCeB7Mus74BtlcmVq2X0DTRYyU8lE62DA=;
        b=VKvc9cCb6tViKUHUkzfOt/wRN6QblnYy/QS7PQ5A+x91hBzsoE4FzYUB7xVngS3z6r
         FfZGPpHJUMeST5gWrycDCPONXko5gbuCbFQThK4nIbKXZ541J3fZ6mYcBvsUr3w+uKIa
         AsOs+70dm6XYshR2yf8t1xVJbv5fBeU5ZVppf80LG8SMtZsHLZzHsFVjLLwPMXzxCQS1
         kXQYoaR5yl8lqBQwMmJgdU5UEkOrUcxTRKCHvyO4QL77jfoAITMbM58SGcduDybdHztw
         laN9+hGxeU74+9Kz/BBrOV4F1v74Zb2YAIWTDn/TLdg8a9/4k2KxUGYnoE3npl5KMOEk
         ttbg==
X-Gm-Message-State: APjAAAVHpmkA05WK+n8GDCEObyPa4q/zBen2IEfnRCU1+vrIpmRCV8Wi
	UG7d7ci7jXnRyab0/xFRzB6c5w8/oLKVaw==
X-Google-Smtp-Source: APXvYqw4Z1Hei0XcAHyYjCvt7J5fxagJmgpHou0JOC436h6OqxXlxvwuKMFHtfTGu4BzULJpFBMQTA==
X-Received: by 2002:a17:902:a585:: with SMTP id az5mr43202467plb.261.1556721901239;
        Wed, 01 May 2019 07:45:01 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-189-189.tukw.qwest.net. [97.113.189.189])
        by smtp.gmail.com with ESMTPSA id s20sm47870322pgs.39.2019.05.01.07.44.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 May 2019 07:45:00 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v5 06/15] tests/tcg/multiarch: expand system
 memory test to cover more
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, mark.cave-ayland@ilande.co.uk, cota@braap.org
References: <20190430165234.32272-1-alex.bennee@linaro.org>
 <20190430165234.32272-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <272feb46-4da7-7834-7a5e-5f54ed416f05@linaro.org>
Date: Wed, 1 May 2019 07:44:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430165234.32272-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: EukRbBzUvTob

On 4/30/19 9:52 AM, Alex Bennée wrote:
> +int do_signed_reads(bool neg_first)
> +{
> +    int r = 0;
> +    int off = 0;
> +
> +    while (r == 0 && off < 8) {
> +        r = read_test_data_s8(off, neg_first ^ (off & 1));
> +        r |= read_test_data_s16(off, !(neg_first ^ (off & 1)));
> +        r |= read_test_data_s32(off, !(neg_first ^ (off & 1)));

You're testing unaligned reads here.

While admirable, and necessary, that's going to limit the number of guests on
which you can run this test.

Do you perhaps want a compiler command-line -DALIGNED_ONLY to control this?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
