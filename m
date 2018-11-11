Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2064701wrw;
        Sun, 11 Nov 2018 06:00:21 -0800 (PST)
X-Received: by 2002:adf:8b0a:: with SMTP id n10-v6mr13482795wra.282.1541944821605;
        Sun, 11 Nov 2018 06:00:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541944821; cv=none;
        d=google.com; s=arc-20160816;
        b=a0lV8LTLr54R5eAXD5nPhqk3qRc8QUVjRdxG2R1cyvYLmaJsI2hMppPJ8dEbGwa1EC
         DRBa6F/Kl5S7dXvILqddpv7p6D7ZFbCH3jqbJoBvtvfrz2KSuiAQpGqHh87oql9MIhf5
         BSgGd4R1DnFmTGbbauv7OSKe1QehiWyaTDlKHMRxqeGfN4LS72qUpooihP3NXrqz/DJk
         gqd+x2i4UPbb1MZIV2JXqDdnqDnY9X9S25bDwMqs7m8795hBB2PhFxqGEdKiii6YOK2F
         NUjkvXjKKJuAERN3izd1Wfl/EMiSCu3MX+8pmwIFNe2OYfIEvVP/c0HYsgKAG/l74bqB
         Q+AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=sJtDq0OHcoi7QlzI/HBVoyam0aupZgdGrQwy7HkwgvY=;
        b=E0GF4g7wQco7deNOBeOlYmL8xyIfizCzvY/eL7SB1/6yIw1B/ZS3ts6ixZDbF8wuix
         ODCF1Y100oERISJOYRR34YeTJjGy093VHXEqqBrtWoCfv1KCI/ZUrUhQJwAXnT0n2D3c
         +33onySJAO4Fg+UBctxW4afyCbGgDP80IHAE9anGqHjtK3C2AE+s5+yCnoW8RVyIXhfx
         3Q1vlYD9k6+qUCJbVd0aC/AI+uaQi0hOt3K+gs7SRL2DxHOTgHBW3uoydvf7oN3K4Apr
         Ltvhr3yvwD6jAWuU2FYCn+pO7yzXX4raEAM6Wsm2m4Hh+cIUTV/tkuppF/YDlI0lvgLQ
         +Aqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nv8BeJ2K;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b77-v6sor3918396wme.9.2018.11.11.06.00.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 11 Nov 2018 06:00:21 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nv8BeJ2K;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sJtDq0OHcoi7QlzI/HBVoyam0aupZgdGrQwy7HkwgvY=;
        b=Nv8BeJ2KcNOKV55YZcy+1zIAT9HsjiogGxjWMIuDf29WseXuNa1X4/ZLP1yNUz74DY
         B+QLXeKl+Q73P8b6nXmPwlc3uYrmvVPE7ZRBzlOixgcOPA+RAPhCD9741ZsETVC+lqos
         YW0OFZTh9903KQn7HkvAjn2GXI7KQ/GneQb5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sJtDq0OHcoi7QlzI/HBVoyam0aupZgdGrQwy7HkwgvY=;
        b=L6oTnqw6b1BWspnfXKZb896VkugXA+vMr/l3AhRM9+OFukqkGpH3tSzHQ4Df4FYYVV
         VEnDtgVsM+owKXh4SH2tdh9sZfJgzz9EACgwEgXNwQ1kl3U6j9bVfgZQq3liNkQ9X2wa
         6bBPJoqX2q30sA0EZLP+Kkm1FhJI6aBQnj7cDvby2jg/B3rrCm0180fPsiG+vhafLGvE
         KLjCiFU6W0nLw+HBEeMySt/4Lf0y8Y5Fvlzr/oeFfM7wwXixgn48TGKFhKYmMJQPaMrS
         XGDZgOJAMAJLAUDILozNsPSynmzamRbTzGwWuikFzbxH1y8/imNmaKfLoQrFj5RPgCWm
         VR7Q==
X-Gm-Message-State: AGRZ1gJbOy8WwT/bBHUVOut1zhEL/jawrVGatIzxw/M6d1BG+mthjHhb
	Ho+S/o8sB1YOtiyfK+8c2xc1DvQKAxS2QScz
X-Google-Smtp-Source: AJdET5fV8rePe6nppLKs1y2i92ngb/jPRcdB1EcFW7z3cxl0gfact5hNxIkYkV6k+YK76E2tj0Q5FA==
X-Received: by 2002:a1c:a782:: with SMTP id q124-v6mr4955930wme.21.1541944821178;
        Sun, 11 Nov 2018 06:00:21 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (151.red-213-99-169.dynamicip.rima-tde.net. [213.99.169.151])
        by smtp.gmail.com with ESMTPSA id d15-v6sm9619930wre.25.2018.11.11.06.00.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 11 Nov 2018 06:00:20 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v3 7/7] arm: fix
 aa64_generate_debug_exceptions to work with EL2
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20181109152119.9242-1-alex.bennee@linaro.org>
 <20181109152119.9242-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <01878252-88e2-43cd-1431-afde9510eecf@linaro.org>
Date: Sun, 11 Nov 2018 15:00:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181109152119.9242-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: unrVBfDsLc4r

On 11/9/18 4:21 PM, Alex Bennée wrote:
> The test was incomplete and incorrectly caused debug exceptions to be
> generated when returning to EL2 after a failed attempt to single-step
> an EL1 instruction. Fix this while cleaning up the function a little.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v3
>   - further re-arrangement as suggested by rth
> ---
>  target/arm/cpu.h | 39 ++++++++++++++++++++++++---------------
>  1 file changed, 24 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
