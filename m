Received: by 10.28.71.27 with SMTP id u27csp2519064wma;
        Thu, 8 Feb 2018 12:36:05 -0800 (PST)
X-Received: by 10.36.118.21 with SMTP id z21mr590591itb.116.1518122164953;
        Thu, 08 Feb 2018 12:36:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518122164; cv=none;
        d=google.com; s=arc-20160816;
        b=hxpaPV/xS5RGAjAaU/OPJFIx5R25kuCuL9VXUgwwFa5n3WhVb5mT2tIyfVrnbVxTBu
         9NVhZzQJGZ23zm/yByhOEV5+3QDWO+fkfElgV7FiahJT6EjAQk6hH5/TePdsnnHbmspw
         mZHhmQohna7C23Xrmp9vKxksG0UfYMLO0NijwZOvyrFGmU3E5u8xgOhqZ6azI3E2q3j6
         wmSB8p4hJgEqxdW71IZpcFBEsCjSG26Wx1OOgUGQ6zUoirAv3dWj8W6Y5fIqdHmVH7nZ
         RS9gK0vc5kRgcrVlFZrU88ygMkIgCdztHJtn4x5RRNrP3Yt4wPJLXzrVVflJqw4sQkQY
         7Luw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=nNdX5TE5Wcw8mBk2iYO0J3vMxVoj9u0uAK8qielq1GA=;
        b=SPjle8l5e0p9STuaTSlbM2d9Zt3qhUuGrJ3ZppqvrGx5I8AgZ+oj2dqc8iIOvPAgHT
         A0A/qoi5K8HaYOM5Hu20wBvizD/FMXkeCUwRVv8fSF4dX1m7D8j8yp6JQtBXIQcrp0+I
         rEW8HMzYZcl2gj6FuxSG3jmvw4120mG88CxwiARl8Z57l7QM2psX63hlIShOI2R/s++6
         x0sw2WYybEyQd5OLvGyXp2b6exgyGyuiS+mScplUt7tsSk04exY1Jy2BoCwB1jrS9GPX
         ZoGbxGeGIJce1R4M47Glk+uXbcCZblCMIMgnASelVtJ4vpuleu93I5Nl3Y8qSvTRAdTb
         l7Xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dj+I6bMh;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x38sor417791ioe.278.2018.02.08.12.36.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Feb 2018 12:36:04 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dj+I6bMh;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nNdX5TE5Wcw8mBk2iYO0J3vMxVoj9u0uAK8qielq1GA=;
        b=Dj+I6bMhkU71vZyetAz+imrWHKfftUosgiNu3JVeQ5vGFnegktTI+7ETiOwfurNaVc
         +w3X9eb/s6iGLqJuPj2zKPBa/M3vhFrOkTHNRULjHUelMyk2AWrmtHdZsqI5U5FkRLvI
         /+cvo0ldBGGTk1+TWTWwNEQJbcXPsVhQBYdCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nNdX5TE5Wcw8mBk2iYO0J3vMxVoj9u0uAK8qielq1GA=;
        b=lXEcf+rhfXEQ4Rzv68MUSUdqVp8swpDE0FMr7irnmpMgJASq5Cd3YD+iacBHhvho03
         1EWMLlgLFEf4C7qey+WDu3pDpZ72Hzba1PSqj1plKlODqn2AZe5OxYE5Bv3vWeWZNCr4
         KoIr+tXemPkWbeGJRdVn+3V/tHtccXvpZNvZ0juzAhXuOKMvotQw6LZYBl5bbNAyXX7h
         bZzZfMgWb1hEMmToGvCSMu0gYPVswA3T0JanPU24TR3qamkClubhjlY+Ug3hiYK8Pvyk
         V7U+OfGzlDuQjtTvUHlsP2icjsdmoCd2DcbbMu3IQtdjKDr6usoOCpD0B77Q30ZueDH8
         3v5A==
X-Gm-Message-State: APf1xPDmu7Xsw0YRB16JIlUfpII2m6A1rTd+qF4XyEwf8n+0lNqpiVEY
	L0OIEEpqgLkxaak5bX1Dz0BbV0KiVxRFdQ==
X-Google-Smtp-Source: AH8x225kBZ2WRqBBsaTOAumZq7kCVXPBiRhMQHZzOndTnGVx9nrX54DHWMMUucLW5ex5ffouxfQsZg==
X-Received: by 10.107.142.202 with SMTP id q193mr452925iod.100.1518122164114;
        Thu, 08 Feb 2018 12:36:04 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net. [174.21.6.47])
        by smtp.gmail.com with ESMTPSA id a19sm578680ioc.17.2018.02.08.12.36.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2018 12:36:03 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 03/32] target/arm/cpu64: allow fp16 to be
 disabled
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20180208173157.24705-1-alex.bennee@linaro.org>
 <20180208173157.24705-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9e5fbe91-3c4f-315a-a116-be97a319229e@linaro.org>
Date: Thu, 8 Feb 2018 12:36:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180208173157.24705-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: GEKAtq5NMsUC

On 02/08/2018 09:31 AM, Alex Bennée wrote:
> While for CONFIG_USER_ONLY it is policy for the "cpu" to be the most
> capable is can be this does cause problems. For example legacy RISU
> runs would fail as there are a bunch of implemented instructions which
> would have caused failures that now trigger actual calculations.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/cpu64.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
