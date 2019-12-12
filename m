Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp13640lff;
        Wed, 11 Dec 2019 17:44:54 -0800 (PST)
X-Received: by 2002:a17:90a:f84:: with SMTP id 4mr7165978pjz.74.1576115094744;
        Wed, 11 Dec 2019 17:44:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576115094; cv=none;
        d=google.com; s=arc-20160816;
        b=n659YLOhoxCclK/VwVqvqMWQ3xw15esktlxs1vcB55NqT8MrVjAt8HKx4rN2bOVecP
         eD7NbVoLUGd3t26DX8JsGm0AIwLTWIDFcpOZN19F4jZ76+NAfSDqOt7IfkDKnA8DvLM7
         KgQkNSobvCcQoRQtZdsP3nACNT0ObAW2CUbRBJzhZAMcqLxTrSfF9UgsicgydmJxgU/k
         mAp+vJTQnVS6Ba0G2xysqVbGwePqDIXjxZQ6pTqZFdYyHZJRdeFLer1hi4PNQhCfVwFG
         vGDwLLSrttnPsVaP3jen266SDJ1a4UT/7+SDtyl8TRO7YbOu4/bvwWqKwmxGT/5M7Enu
         jGyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=TCHmnrkRlOqZCr2wFwT0K+hY8xftWllzo35pAoSr184=;
        b=Z81dreHFPef/fbo1GN77ctZB0efahDfMR//easS3VG8VmREsQzgZ2FMb3ACs1g53+y
         KmARCvHcr1JbjcVnCYm+7HiU5CEobOxmVhtPVkwKqSGLZld1hZmQq2eFkvBxKyA/E20T
         enRoiZoAr4Cm61IH8/UGeosGiZiXOhI9TBwZOsEo1AHeu2bHJpYPKECZ6eY5tK2hZhvL
         zGJfJmAXYcOisMmzzPmBxTzirUBtSLvrqVsXm6YAj8hDURtD0DHzvCLGAnzY3wnb4Q8e
         TXZrH4V2RxS1+NxUV5X3K82gakhpelY1MWAg2xqvURDsItNdDqepBIEheaqmo37GmucM
         9E8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xcbnq6dW;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y189sor4953360pfy.15.2019.12.11.17.44.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Dec 2019 17:44:54 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xcbnq6dW;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TCHmnrkRlOqZCr2wFwT0K+hY8xftWllzo35pAoSr184=;
        b=Xcbnq6dWxVNKQ9PHm+s6raRNrO1JBPbKqqRx4WGaITmPvYb+AxldCCl9Yuj0dHo2Ik
         CzTo0qy0OkDf2H6GyMMp1l8UQ7Gu/MHR1K7RpeOthBjOj/ylMDLY/gaipWpVXcU4oSAT
         Nz5f775eP52sw//qPqipDo2OYR5w8wvKHKiUuHd1ARudTR+3M5VuKEe2jr+hxOSoyrqO
         TdNv2NF2t6rcQmn2kLI5qVqGvqV/4oU3skOj0wN+FEAdxDLw8YkOhmUOnO92vZMBoNAZ
         +1fBbs1zrXDXTG/3pda+qqnySVAg7WaD0bZbdSNVtRsD/UKWbWTkUe0NJMsjadrEcWDe
         Xssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TCHmnrkRlOqZCr2wFwT0K+hY8xftWllzo35pAoSr184=;
        b=gvXjZ7TyQNuHjykFMj46eMghs5WFqxcU4h+009Zb805SKDQt3wmKksB32BvdQ+/GwC
         C+b9nyc1o78hAlHxolqvDrWxREG36UM6C6PBf7JVXtdsirRctSn7GqUnYKaobQGh4m4W
         n7cuYIUBvf928xD/N8wdzn8dFkBzLTBcMUoaVn3sve1GOXVdP97groU5fHmPs7STvysy
         lBO/8WWDuFv88paiHSzoPkDCwGWiZ7lm7GgXC4p4iaZzO4+lZixCZ4Ofot2Ws9+bIaNd
         isclyEnER5PrqvA/TXT6gb1HUOdcsHBBE249v0ufw0xill9clAOOU22yj2W2tALEvrO2
         UIcw==
X-Gm-Message-State: APjAAAVnbricjGQpra3uOaNibEBjrD6tASlIbsQeA4OC/O82bpEgl6Pr
	ekG71a2BXsdyjKBS3jMgoKAYw+7O
X-Google-Smtp-Source: APXvYqzzDU4q6Fi1ak3VWWokenhkt0/WbG/wlVPpo/4QyoriQTx6IHM/BgiB+WNzauHF0HJi7MMbVg==
X-Received: by 2002:aa7:9ab6:: with SMTP id x22mr7030799pfi.260.1576115094279;
        Wed, 11 Dec 2019 17:44:54 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id w200sm4451871pfc.93.2019.12.11.17.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 17:44:53 -0800 (PST)
Subject: Re: [PATCH v3 06/20] target/arm: use gdb_get_reg helpers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: alan.hayward@arm.com, luis.machado@linaro.org,
 damien.hedde@greensocs.com, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20191211170520.7747-1-alex.bennee@linaro.org>
 <20191211170520.7747-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <63022f19-cc59-0b08-c3d8-3a002381789d@linaro.org>
Date: Wed, 11 Dec 2019 17:44:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191211170520.7747-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: wTWCWX3WF8Fl

On 12/11/19 9:05 AM, Alex Bennée wrote:
> This is cleaner than poking memory directly and will make later
> clean-ups easier.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> ---
> v2
>   - make sure we pass hi/lo correctly as quads are stored in LE order
> ---
>  target/arm/helper.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
