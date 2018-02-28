Received: by 10.28.91.67 with SMTP id p64csp827938wmb;
        Wed, 28 Feb 2018 08:58:05 -0800 (PST)
X-Received: by 10.99.124.7 with SMTP id x7mr14636774pgc.356.1519837085659;
        Wed, 28 Feb 2018 08:58:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519837085; cv=none;
        d=google.com; s=arc-20160816;
        b=CSKV876VJIVpNk7NXNf5Jetn6G6EAn2HpqJIFlENShuvSi9tS3z0Y2XQcAFADYoBSP
         tCJql2jcm2ckYEq9V00ccnVOxBlGKExkenya/iE/v2AyiScovXHDBLeVh5iPvnR+hvoD
         pWOW6EI9Iapl14M/8nFYsCxrurA1I33j50g8w9rSzFXetm76F6J0SyAOIuIm8pDQ7Q/U
         8F2kWdqTNlueMAKZvnFbOzGy2N013xy3yCA/1vifsfsfXSmcc6jik7Uf/gM03kzQQzQZ
         qvN0JsTl5mBu7EHv8A3lBt5DbEsR9Q8fXdAg5lTt3GI2cLVj7Ff6vFNPHxAVuvLDY7PX
         rkag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=Mop8OmpSXotpchPIWOSice3eEnznSTscrXckm2H3bGM=;
        b=d1XtFMKqJcruclhAi9Ve2cxdSr1NYKoA3ZGNGcloEbIgdGWCf4rTcZsMg0na+hjs5V
         byWjQDjIM6urlusHhFjmI9jVlNxl6Hvi6BFQC35sYIC7947jjRbRTQ1ZskP6xa6WacI1
         R/2NvaCzzbElEUYyhC0wLJ+guUnp2A6f396a5uHT79A/luup0X6hqXWPL0MLqnGWGNjp
         tEvt1fssLaQNnKtkJlHS6xfg3jKgmFnkm0YPi+vEdrt5JueuQtXeQ1VGCP4qJZwd1s5R
         toH1wF2aGIxrVgsIjUtV7GEIlmuAYjo/XsAzNrlcfMIP0auDUlnCY4FkzDjs87NOv+gp
         3fvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BYilgkB4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g31-v6sor700935pld.40.2018.02.28.08.58.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 28 Feb 2018 08:58:05 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BYilgkB4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Mop8OmpSXotpchPIWOSice3eEnznSTscrXckm2H3bGM=;
        b=BYilgkB4DEa0Tv+F1i1ipDE3/Zi2SReoYyTr4syfsTu1J+jBFEBkgbpQnzlxctMeE2
         IrGoTl6KIj5GYtFcDhIDVY9UEzBiLTObWrVNqjcOhRGm/JDPuoFhyRRUE8bbdZex/PrP
         nvqz+uAucaR61pXL5uUopChT1LiVXXhI71F9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Mop8OmpSXotpchPIWOSice3eEnznSTscrXckm2H3bGM=;
        b=oFVRlijwTQxUdRltq3QsFgIAvPqW+BrusWmS3vG4gmXrb1Mla46WN/+kq/gXs0G1Ff
         VYJjGPm73+rjAr62c9N+XASATKmq0BoVPTI14a1UfgmBCgkcZ+BvBMNYXJ7Doeq1Ftsx
         xOooID4R3KJsuw0a1cJiFj1K6fPdVAmJE0eyloQdNwYx+4DZyxFTJbEVYBHgso/Xamvo
         7ZMwyYPG6K2CydNX9I25ydj8Wbg+2NWTOobx7gr4xxYorZvGOPaXigm17Nw3wAMoUeB2
         72ca3tHRrx1XYzoAD3hTJ0Jv0BhvWhTYKRnkcGM6g5V47CB3/d+1yRm1lHxi3RjIT8R/
         Cnsg==
X-Gm-Message-State: APf1xPDOwQRTaTz/hQleJ2i9YDd3U0+/+WCUlJuUfAwpZuM9cWyEFr1X
	D92M1owidzwPXRJPpycJDB839twp
X-Google-Smtp-Source: AH8x226dzvLKiQMdokUb/0aGond8vC0EkUeNtR4Rw/kBz78In2ZBd9Z7aTLixELeXKsnPH5ek0jGog==
X-Received: by 2002:a17:902:461:: with SMTP id 88-v6mr18554070ple.88.1519837085220;
        Wed, 28 Feb 2018 08:58:05 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net. [97.113.169.147])
        by smtp.gmail.com with ESMTPSA id d186sm4679689pfd.1.2018.02.28.08.58.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Feb 2018 08:58:04 -0800 (PST)
Subject: Re: [Qemu-arm] [PATCH v4 00/31] Add ARMv8.2 half-precision functions
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
References: <20180227143852.11175-1-alex.bennee@linaro.org>
 <CAFEAcA8LEG=bzXrj3etTdf_q3-AcMVfCCqSGQ2OkXUPGBHkMBQ@mail.gmail.com>
 <87woyxutms.fsf@linaro.org>
 <CAFEAcA9LGHjneP9qi0s2jyQE=hz=fa6fadgv-0Znujr62H-0NQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <51845d05-364d-864b-9380-0d8b09776efb@linaro.org>
Date: Wed, 28 Feb 2018 08:58:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9LGHjneP9qi0s2jyQE=hz=fa6fadgv-0Znujr62H-0NQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: uZiec1jQpiwP

On 02/28/2018 07:02 AM, Peter Maydell wrote:
> Do you have a feel for how much work the AArch32 side is?

Based on my experience adding fcmla support to aa32, probably less than a week.


r~
