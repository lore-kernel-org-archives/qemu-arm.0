Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp410229wme;
        Thu, 17 May 2018 13:28:21 -0700 (PDT)
X-Received: by 2002:a63:3706:: with SMTP id e6-v6mr5109441pga.281.1526588901758;
        Thu, 17 May 2018 13:28:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526588901; cv=none;
        d=google.com; s=arc-20160816;
        b=Vc3k+BXKuWN0NIjzdEpKxZPZKesNRCFuv6CtDL1O9H21qwXwgchD2d+gV9rlwjssXt
         B0C/1RvWYb/dvj+JBu6UGm3Z6tsVcrOqUfu30KzefHqwQp18K3/4FdLIQIMHVZB7dxos
         8fWewtnJN9b6qsv10QFMr643oE+SUi0dOIyBKD4RjRi+kK9fEW47AunQ1rw/q6OvE70R
         XEgCFiMeUMUMJA0VwDAH4pmZYDPeKcoQBVD/kijuvl/YBH5Msq6WvXJ6vYyIBMOXjcXB
         6sit8H7nyAN/KIrGY8ftTiPaM2l6hy02Q2YvyYHIJ0lJg4gx+U/NBQ08yBV8j/lpGGJI
         dacA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=bkUPkXKRkfNLpKLGxgmxypvZe1jtHEd+82tywpN9Gzo=;
        b=PPZB7kres+hRW8ftHscNC6I2WLFWGZq9c1trO9g0kCvNHMR0yk8l/Ym0LvkoTNj75S
         FBriUg3kwmQOzq4NAHU3BwAnauXu9IlOJWxfWRODprKc/mblFwlidHfS1vdVkW153/dA
         1gcCtkqVgSQpFE+f5nMuBhPtMD8/W9N8tYAGjieLxe05AOYtV03YTJgM+3lgDSDNTPC4
         gquXrN1UOxgfc7IkDp9m1DNQs3EfdLFUAOrko7rvjNUVqNtNdRte01BwVdhPjHAyJpV3
         6Cwb2/xEDfjmPg0++KYy7ydxidFbIyULKnNv8UDIoDuND3QFhH0LcQ8UixKfS7fEqBGa
         J46Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GUe02hLA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id u17-v6sor3747361plj.121.2018.05.17.13.28.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 17 May 2018 13:28:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GUe02hLA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bkUPkXKRkfNLpKLGxgmxypvZe1jtHEd+82tywpN9Gzo=;
        b=GUe02hLA/4NRC3Wme/eoWQTSHj2AT9/kp5madPXz5BJ2CgKuHKeSmqJMj9SlEf6kQf
         OoNsCOvvnWAXUE04TeciSU1coUiHisU1OuegQLZVy1BDXm4X+miZY14mdCdB1LP/gDR3
         OklQ9MGBFiFmQVLV3j0NaOCkaWqKz4NQB7tP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bkUPkXKRkfNLpKLGxgmxypvZe1jtHEd+82tywpN9Gzo=;
        b=ekN+fEWK//H6fCQh1R0VUYiqymo/lsSnSgST8IE+NfrK2OpTlUqlAUm/POQa9ZLGy2
         Rm52am1sdYuibn5qnvPxnolWsR3ZYCnKg1cD0gpdeuD0PNFZQ1jqsdFNlnLklDJ9uAtP
         3r9H+c4FohB3tUpSbVCS8feO5bdHQJEVvB4af0IY5jftn8YylrpIn24jC78cuRyyEQAG
         CA2RNeQQni4vFtw2jF1+ubo70bbraJvRTNnHqNKFHO9JXoWE7NtnfzsOlIj9/klCm+HP
         BpIj6aV6f1dquhSN9pZJ0NYxURzd1ImT7EXKRm+XWxEL8dLbk2eCvjndPGgL0qI4jCxE
         4i5w==
X-Gm-Message-State: ALKqPwceWpkSvd0V8AYtYPMTWjW6M9wB+LwyZ+E+aCb/QNpu44ixi2Ct
	jQOJsVAqAzZfWfMhxIpwW0lJNAtc
X-Google-Smtp-Source: AB8JxZoKSYQKu6vcxKpNTaxexsR+k8wHvEje7FsTAWl9ZiPmcEBx51DNFUj8r74LDL0xbpnoD7Nqrw==
X-Received: by 2002:a17:902:380c:: with SMTP id l12-v6mr6595625plc.19.1526588901360;
        Thu, 17 May 2018 13:28:21 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net. [97.113.2.170])
        by smtp.gmail.com with ESMTPSA id b26-v6sm10386472pfn.73.2018.05.17.13.28.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 May 2018 13:28:20 -0700 (PDT)
Subject: Re: [PATCH v4 31/49] tests/tcg/aarch64: add Makefile.target
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, cota@braap.org,
 famz@redhat.com, berrange@redhat.com, f4bug@amsat.org, balrogg@gmail.com,
 aurelien@aurel32.net, agraf@suse.de
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM" <qemu-arm@nongnu.org>
References: <20180517174718.10107-1-alex.bennee@linaro.org>
 <20180517174718.10107-32-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0f3f1135-79fd-ba0e-080d-5366eb99093f@linaro.org>
Date: Thu, 17 May 2018 13:28:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180517174718.10107-32-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 8R8oDB3f505i

On 05/17/2018 10:47 AM, Alex Bennée wrote:
> Nothing much here yet.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/tcg/aarch64/Makefile.target | 5 +++++
>  1 file changed, 5 insertions(+)
>  create mode 100644 tests/tcg/aarch64/Makefile.target
> 
> diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
> new file mode 100644
> index 0000000000..4ac8fbe73f
> --- /dev/null
> +++ b/tests/tcg/aarch64/Makefile.target
> @@ -0,0 +1,5 @@
> +# -*- Mode: makefile -*-
> +#
> +# AArch64 specific tweaks
> +
> +fcvt: LDFLAGS+=-lm
> 

Merge this with adding fcvt, surely.


r~
