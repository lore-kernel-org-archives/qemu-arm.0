Received: by 10.25.44.15 with SMTP id s15csp2527084lfs;
        Thu, 20 Jul 2017 12:18:19 -0700 (PDT)
X-Received: by 10.237.57.199 with SMTP id m65mr6109271qte.243.1500578299759;
        Thu, 20 Jul 2017 12:18:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500578299; cv=none;
        d=google.com; s=arc-20160816;
        b=Q+N4bo7kd2h0mpFWz5ZOr5z5uPsIfNJ31AbuEmTlQmRiTQH8lUVVzSLh3Wv2MeVp8n
         YB5DmkBL0kjgcFttjDmsd1x/8fGj7+sM/reRV1qTxo0dAtV6r243CQE7DyyC19/Z+ca3
         SuewquWLH4iHyOEvjiVFLO8odSlx4g6nLwRdWzgoXjuYXrKjrgUEw0/574tAjyGIuM8G
         riuhTHQxTjmS+p1ksy773VE/Wywtzp2RnxP1Eats2ii72TT9eXAiNcPArf9wXMkk8uhW
         v3bM4iYlc/Heqo+oToAxGxEVZEz3BI+EQNEzQlx/YFI106j8YBYhB2FoM6h//jcXZiMa
         u4Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=VXexfTWfXfPiPBav7d+as7pLNfP30RMf146x5XatRfo=;
        b=WwaFOrynaFJ49xDmFHVGgs47QyLERtnzdDdQcv9fWUHIfF6hbssem0cJ2z9H8jY0NR
         6BByJFsrKvaTmAdaPnb8/CibZTrHnsSPkCsGGFF8hbhrJ0vb1bGFLho4KTN5qqsBcY4V
         Z6M8Y/HHpYVi2xWKkhPxCbB7hblmQUR/fr/VGMiYcG7DNiiizBAO+VqLD47epS1zZq4w
         25+YkPrCmCtKnLsFNflkHRpasHkLJ6EXMAQHvAzygOtY0gl5mmRUJSnfFZwMBM9W1P8e
         haaBuvUlM7RK/I6OonSAIlFEpb20oNe6SdHH3T9ClpGcB6g/KxaorH/XlyMeJ8fMgfRk
         nSEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=sSGMrscq;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qt0-x242.google.com (mail-qt0-x242.google.com. [2607:f8b0:400d:c0d::242])
        by mx.google.com with ESMTPS id q10si2550328qkh.96.2017.07.20.12.18.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jul 2017 12:18:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::242 as permitted sender) client-ip=2607:f8b0:400d:c0d::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=sSGMrscq;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qt0-x242.google.com with SMTP id h47so4579037qta.5;
        Thu, 20 Jul 2017 12:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VXexfTWfXfPiPBav7d+as7pLNfP30RMf146x5XatRfo=;
        b=sSGMrscqKfnjFbsk3pZn82KPK38ZFGc4gq4R3ALv4e8230vy+4yqgZtqf7Lu3YsNgs
         gIstt6HYrCm80pSoIALvJnF3Bt5do9of6mqxOPqdTu6lE+Q4xHCWz6L6xUHgbCuu51Ch
         mSUQYScKQaHnMGVbHI5ea5QG0IrKUqWdSTEL8ZGQRJY72H2tpJn1e2CfJZxuvTSiPd7U
         3fW/9DLmPuOlRjexzfIzq4F4JDjBhrznX/AWi8qflhGmbW4vd+e0IzvPDrkOTCDhWlTq
         BD4LxzWXg660rbUDMoW5WR3kQxi18g83dIDAD8PNBhdLumEY1cImKoB56FRc0skdclvA
         +L7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VXexfTWfXfPiPBav7d+as7pLNfP30RMf146x5XatRfo=;
        b=YsvgS0l/FWJAnO7EuKd6F52BxjdTp+f2UUb/xeAe0T6p+xD7wgyNjRwbsT0oETnP51
         FBZvsmpOGRbvG5f6SFrASTAT6Q02Sz4d2lFRUTK6ubygPSPSzWXh7Bi/s7XJ55Sc7JEq
         CgdnBPVwy0qHGTQFpb0cSHSts7Uk/EU06fJKlkOcwU/cAQIRStMuJixAh8sGQjJCZ/ef
         h1ukcz0r4I6sst0ZtBUHp0J/hgdp6hUob9I4+1DAQn2Wj9mfQZOksbh6Ijp2qDiiFmPI
         srg5c8iUSSaUvXW4chdRfU8pmftsuXgxG4+P7Er1Nh8DU4JF7Br4X67qekWBRvRN2dVi
         l4aQ==
X-Gm-Message-State: AIVw112ba5WBJBjdfPBu1zv3PpyBNRbQdf2x+bcWWzoKz/9WcLWbscgY
	ia4QvfqOjogvCw==
X-Received: by 10.200.0.81 with SMTP id i17mr6181503qtg.5.1500578299393;
        Thu, 20 Jul 2017 12:18:19 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (14-203-206-9.tpgi.com.au. [14.203.206.9])
        by smtp.googlemail.com with ESMTPSA id o39sm2222724qto.10.2017.07.20.12.18.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jul 2017 12:18:18 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [RFC PATCH for 2.11 05/23] softfloat3c: initial build machinery
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20170720150426.12393-1-alex.bennee@linaro.org>
 <20170720150426.12393-6-alex.bennee@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <71a11f23-39e7-d89a-36d5-2870ed76d940@twiddle.net>
Date: Thu, 20 Jul 2017 09:18:11 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170720150426.12393-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: nrFqqNxj/s8l

On 07/20/2017 05:04 AM, Alex Bennée wrote:
> +# so they can still be linked when needed. We build these files surpressing so of the normal CFLAGS.

"surpressing so" -> "suppressing some"

Do we gain any confidence for our still supported but less tested 32-bit hosts 
(all of which do support a 64-bit type) by dropping the FAST_INT64 distinction?

> -#ifdef __GNUC_STDC_INLINE__
> -#define INLINE inline
> -#else
> -#define INLINE extern inline

Why are you removing this?



r~
