Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2489930wrq;
        Thu, 14 Jun 2018 13:25:52 -0700 (PDT)
X-Received: by 2002:a65:6559:: with SMTP id a25-v6mr3497184pgw.82.1529007952087;
        Thu, 14 Jun 2018 13:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529007952; cv=none;
        d=google.com; s=arc-20160816;
        b=pwn4pkvRcGNXfHhrDpJbCdSRHsIsN0y9lo7Y9w8rBqhJm80VUvdgxsCOqKOVcy56Kg
         w4b+RY41kHkzSVxp/vfWX9Srk7g+AAhg2FMhl/I8Zu37pi0oQq/ipfGaamKyXrxEq0Fy
         PMuoh7Ssig6JPU7HUOJ4E0HiVnRsvszecvyco+O616YWNAbPzl9cVNjLoRGYWCLoTwnq
         0dsWUtqEOt3cmYK+zg5SIT10o6WXDbnOUlu3iBgx+hsdisbRemMn2kvpXcIr1oHOT1lX
         v0u7P+05+5jI91u5nQXq8YL2gjrgZQohAqXMaKxcO5d12frOrSdv5YMqoCmAjRilVv9e
         qa+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=OaMW+vZGWTBh2HTvmfa97ZGZx/BaQ3VafDEHZvdEgEI=;
        b=OkKnMmZTgRvug36KkXqsaTsL8zoktt82lCAKurb5v91MM/QZJW554pwZ1Kw9pm2KKg
         B8PiSNqBBLnP4p7KSpB0C00jBApYNcYQPrUqfYtaNqnHBgwZpAwabp46dlDAhoNcWDT8
         zcKYhoSP/hiQDjgbboBx4hB1jkvjpWttPVe83Lwl21Hz3x1WwgtEe8mbJ5+QQJQ03mlc
         lUh8G5p4wFnBnwf81EuJRBXF4YTD+EiPJMd+8uaaxM3j5lv2ZtDyuWOKiSSXh8LmP2zy
         WyKV2iUzwV4217KCqGhuO8XvlQUD0hJAu5yZMRnqjIh4cfsh1v/3hBagAAoUb21S74n7
         kXFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HbdRsPqT;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w22-v6sor1205183pgm.311.2018.06.14.13.25.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Jun 2018 13:25:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HbdRsPqT;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OaMW+vZGWTBh2HTvmfa97ZGZx/BaQ3VafDEHZvdEgEI=;
        b=HbdRsPqTAhkh9La6x/+xGBjFiUmGMh4EhMWkEiuUi4TxML9/01tnJrY+hz5C4EnRgL
         WIKVDOPxOwoc4T/UgfeGwiQOlACadHd/oXz5Ln3DcHcyZ/X9lh0M2LU7BeQ0LCE1NnuH
         yJv0WoGh98alJDfpuOyODdA/T2DErtpVvxEY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OaMW+vZGWTBh2HTvmfa97ZGZx/BaQ3VafDEHZvdEgEI=;
        b=P9SEpPH8TkF5j93Oq3qLsMHpGg6XhlNpOb3qd2ZzX5qJKNNzzB3eTOksTNbJzw/ynK
         xkr9ZxMUJcaUHH+hzI5K4Blts2QiRbOr/9HpBz3zt7sTAkuscZHHTG2xEBOinoaDfu1T
         6/DWOurbmBctHlv3sDFGmgyTca1ETcXAjfHPIqr4s3ZMYskHSSTD/kt3PgWRQeqwsqvU
         I5edF070AwinbW1dZoPzRgbzDDJeLM37eLp4kwKs8o+I8MjDu3gNowWHtHnHXpWo4UxJ
         PDSfRzsKqwW5s+FpEBpR5sUI/rCpip6B9G1/g9ZTOoiQQmLmRlw8ah+YEaijAjJ7b7Lw
         GDVw==
X-Gm-Message-State: APt69E18kTP+9reMzhFS/gBSqevHfR5S5+pe9gTyUUokUjVmenOCYa+/
	l8XaH6+LfnYia4wrBT6YpRZ6t4JB
X-Google-Smtp-Source: ADUXVKJzgzM2Iox0FurN22OCszTI0WNpSs1JdcXBmO8yPjsH/d7bUPkOc50oQDaRI1VZC1Jk+cvfIQ==
X-Received: by 2002:a63:7906:: with SMTP id u6-v6mr3548632pgc.284.1529007951667;
        Thu, 14 Jun 2018 13:25:51 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (rrcs-173-198-77-219.west.biz.rr.com. [173.198.77.219])
        by smtp.gmail.com with ESMTPSA id j23-v6sm9051281pfh.45.2018.06.14.13.25.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Jun 2018 13:25:50 -0700 (PDT)
Subject: Re: [RISU PATCH v3 17/22] risu_reginfo: introduce reginfo_size()
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20180613125601.14371-1-alex.bennee@linaro.org>
 <20180613125601.14371-18-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <118766dd-d000-f5bc-17f4-fa00685df5ef@linaro.org>
Date: Thu, 14 Jun 2018 10:25:48 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180613125601.14371-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: IF5clFcEpFJy

On 06/13/2018 02:55 AM, Alex Bennée wrote:
> In preparation for conditionally supporting SVE we need to be able to
> have different sized reginfos. This introduces reginfo_size() to
> abstract the size away to the code the actually knows. For aarch64 we
> also use this while initialising the block.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  reginfo.c              |  6 +++---
>  risu.h                 |  3 +++
>  risu_reginfo_aarch64.c | 11 ++++++++++-
>  risu_reginfo_aarch64.h |  1 +
>  risu_reginfo_arm.c     |  5 +++++
>  risu_reginfo_m68k.c    |  5 +++++
>  risu_reginfo_ppc64.c   |  5 +++++
>  7 files changed, 32 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
