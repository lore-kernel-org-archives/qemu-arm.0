Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp4137584lfb;
        Tue, 19 May 2020 08:26:03 -0700 (PDT)
X-Received: by 2002:a63:e60b:: with SMTP id g11mr5477958pgh.120.1589901962864;
        Tue, 19 May 2020 08:26:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589901962; cv=none;
        d=google.com; s=arc-20160816;
        b=ndkYKbuE9JUjKyOfJ1x0zcvBj6F5ntsZ2NyphHkbDFlC7vUACsLcmXbgADp5FUp0H/
         F2P0V0/Sia0NXtW4Qbrdv1kCgd2gUAwkdRb09pbJGWxIV+oBCmEfdd7NX7Qn0O0I8huw
         iXsRgOWU5QW/ZtulVuhs7cE+CzfSeOBwsYcFN/E25nuyikPj0JioKDBjpxFgwDYCew4t
         gF1c/xpwR0G4RrVTvjA/b/SS1quhRvPIUPOm6jeKxuS5jIPikwRBs5P+wtNMKZFyN5Ym
         KvjLmCibAZFCFixdyVMcIgfqA8cx62KYLYR0EaPTUvpox2eR0FkDjC6nuTzByIDkzpcX
         XcyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=1yOKRJBrLMOqpYn7HveRFDPZudPhxWBTAMeOFnmFlyE=;
        b=wSO46AWrF+Av1RMPjRaY0ILg9jH2IdxqAqmzxV9sDAUI4S2q/rHqW1r13OPaDOOJ7C
         C0UTSMSuia6zuef19KictZPoqKRNtSpoy+E+vzxpdhWkKdDlFP67gt96K0Dq0Heu+X9x
         UWFo9ZYrNMO4THmYgiPQPfo2BvbfsK1JAts2Y7crNWKkQWYZInAQ9U0s9spJPshrwbaN
         rY62X1Q06+zpFqUuhbDZmdYDnE0/sVEax7VLx4w3i3qjOLczpx8TV9N1a8mGngVBrPY5
         WEa5WHlIF2RKEzALv9Qs+V4Y4A0+03WZCuS/K6tR7zAfr3GFyIdiPdtHo7OXW+3sQMvw
         bxFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ULk/fcTB";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id bj8sor4990887plb.68.2020.05.19.08.26.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 19 May 2020 08:26:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ULk/fcTB";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1yOKRJBrLMOqpYn7HveRFDPZudPhxWBTAMeOFnmFlyE=;
        b=ULk/fcTBsT81MIJcEJ9Ddzsqsl0UuTpaNk2/bROU1Id7ePFtMU/jfEtl06iDb3dwBS
         NYPJtSGYwYKK3NUg43rX2YaCMNyGYwrTlYac39EGaCrOvPcClSWKze0X3Ruror6IZplm
         jFzL9Q1zCZN+G+RWQ50sjwB9BNZj9wQG1CcSAPlIY51My73iHmawhvmqLGLPeWrmKQMY
         J5MqEGrWQbehDSJo8meD2VpRVair6z6OwaWtW/wcGMu9ZL2p+xKp26olo1hWwg90L6PA
         ZMZQDrRS8WV/JlwcY2cQoXZGLNpmgstCTR3MCCZgM8j31+/GQiA7MOur2e62LtqXma3o
         3/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1yOKRJBrLMOqpYn7HveRFDPZudPhxWBTAMeOFnmFlyE=;
        b=rZBcw3pJnIQ72CVNbhc3Mit3RukW8yEawSBh4ZLgpcveWLS+udLJGDd/+cXrtSUF2L
         l+T7CglZsPmx6oUAsDdlLq/OzMfWv46GQYh8xl0hum9g3+e1K/ARgg/0ESP+LuzaYvfJ
         m0+KLTjhRdfiuLnwmW0PrWeM/Jl3fJVlnaKCOmJ8U6o4/rEWJzHc2k+T28Gz1IsA0YS1
         LD2ZwXtJDkNykUFVQzzNnKqYTvF38bXGajfGS+04Jk0Zs4WX6HtTyuIEdQs3s4Axuyh/
         5gX7C8Nhesjzv/SeX+oO2qumzNjLKStn5+w/aWqrqgLadqselRHQj8inVv3c4UyX3Vp7
         9nhA==
X-Gm-Message-State: AOAM533Llc/YVPsGvmFnfB8cNQ7ViAGc7yVe1Lq+c04f+hxPvvG+WBbw
	GkW9lnMPx1AGWSZIwyiHbb+Ntl94if6sWg==
X-Google-Smtp-Source: ABdhPJxO9moHaODU8HfiQSlOLMw7FcQjTDdUHRaJYui5wy6CPhr1zG2fZdZszxSzkeDzxuY/xdYN1g==
X-Received: by 2002:a17:902:8f8b:: with SMTP id z11mr78549plo.208.1589901962381;
        Tue, 19 May 2020 08:26:02 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
        by smtp.gmail.com with ESMTPSA id r12sm10107011pgv.59.2020.05.19.08.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2020 08:26:01 -0700 (PDT)
Subject: Re: [PATCH v2] tests/tcg: fix invocation of the memory record/replay
 tests
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20200518162903.883-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9c82070d-8024-9d5e-82c9-5c81fa711e20@linaro.org>
Date: Tue, 19 May 2020 08:25:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200518162903.883-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: fys6OqSwemso

On 5/18/20 9:29 AM, Alex Bennée wrote:
> I'm not sure when this broke but we should use EXTRA_RUNS for
> "virtual" tests which are not generated from the binary names.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - keep the PHONY's for the benefit of output
> ---
>  tests/tcg/aarch64/Makefile.softmmu-target | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
