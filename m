Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1376426ejy;
        Sun, 25 Sep 2022 03:11:25 -0700 (PDT)
X-Received: by 2002:a0c:dd94:0:b0:4ad:4f0e:d660 with SMTP id v20-20020a0cdd94000000b004ad4f0ed660mr13191709qvk.118.1664100685242;
        Sun, 25 Sep 2022 03:11:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664100685; cv=none;
        d=google.com; s=arc-20160816;
        b=EHhpxnZjEmAaNTF9PiEjp+S2njYZ5f+dlBCgiDwgq/8HNMjbJLHCqYyglrNhXMXjud
         E0cgVvFKkU5tyYv8+DI5gOMbrouaylFSA15V4Tv4NzcJvzmC5wgBa8ks619njfwl5031
         AyOKGjQhlO0gFkbLHBEiE7oKTk30WGyVr/0NAXjGncEJ6sFExMlkYfF5fZC4xGb2MSt/
         vJGOntaallwnViGuFS0+G60+MtYs6Q2EZ01pdMXcRBV5pTzVFbh/zQhnMY58viD5FehR
         3evzlC4GIFwBgV7SYnB0fxS4Xq/5HSLo/1pd2Cq2WtK9wdsdJNyMGwu9WxqKs01ixw9u
         ghpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Tp0j7Ir4Q/oDjgl6K6DlH5K975hmCLxVH1Tk/7AUlh0=;
        b=cE0amZWk+fs0tQ8y0CHAKmbgoJAhvSu6qqDXkRwfHv27G9G+8MsyIVquZvHrgSHBrl
         f81zvBYPHUzmjVckwLpxLOavjTKeHqqzTJGhYCO/uZY98YsoaGKbDth2giG1DGKQBNHW
         6NUs9uUwjt2xDV/0Zs5C9AdE+dNkuM+8G0oLDNA4xl9QtT5V/y5+ZYmz9IuizGJLidAc
         eJ9fdvlgrmWuBlkh9ucPlJqkohrjPynYnlIer+/K4zoBzDmRcFYvG3j9tNf5ywiPQl2i
         USJ7kr1QdPHvFSr93kf6ck2EVaPtwQSprAXXEFdNOQ2nlJW8FCdrxLXJWKsbU4OmmWkt
         NiaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GxmH7jtx;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id fc16-20020a05622a489000b0035d27b23b27sor2956521qtb.50.2022.09.25.03.11.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 25 Sep 2022 03:11:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GxmH7jtx;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Tp0j7Ir4Q/oDjgl6K6DlH5K975hmCLxVH1Tk/7AUlh0=;
        b=GxmH7jtx0oQOdgSAZKr5Xd2Haz7giNKNNPH1KmCLOncoy1QzLL3XTOf0KGgXwH4Ybn
         gkI+i6ZAZ6DIO80NhFbOG1LP7J5KOdT3fbms8T5xMAO9yJQ1gNw2HNmmCgStFyu/ROJ2
         gArL/CLR8mEl91WxHIyQy2S9RfUSHm76lxsVkXfXE1o9qaPp48PrCC0M3VKtDoEEtNbk
         wA3RajNYTxyy+IwizsQYA4FnA7KYc0x9xD0wdR8d0HLPcWO3QxKepx03q090RnHtBRLe
         piPVa8AOSd2tiob31FeiGA9d2AIbESaaNYlFM4xQRwAflckrEUk34BjxdZsetjmhIpqw
         HhjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Tp0j7Ir4Q/oDjgl6K6DlH5K975hmCLxVH1Tk/7AUlh0=;
        b=yOU4EJf18Pw4FEUAfLiAee5VqvalZMRGhc7ZGjmSJkkPE7HK2lpB/GWIzYq+a/vlj8
         L69V7Jh/47DXcGLDc/CNN7EdvLhVSRXwPXYKfjWjVCeP3OZv0lHV6knu/7i/03QHOGzs
         zhPtW9Udd0Il9Yr3+J4ITLJ/orh3SWSVBqldbZhzNQ5OCs0FEIMfSZrQHg7Ib88vXv3K
         z0ShInmav5OYqhLYIUfWnNp2RNXx1Ka+fSaxFM/nZTTfLt3YSgKc/+cdT43/Yuq/zNPI
         mwYa5e/X99fyEazLio3EILy8eoRQdkhsqdMKLXzxm5N0kIbxXd1CTYHA19nUwZw4cSM/
         HqQA==
X-Gm-Message-State: ACrzQf3Lcjlaj7i/z3DyV9YlJYuBqrSytsJlGf+s2o9//NmpGBHsZELb
	sFgs4V0Q30vG5mH6hV0Yn51RQ8H3u94IiNJ+
X-Google-Smtp-Source: AMsMyM4ZgCuTWNW+ZixIzl9I7uoWzywpjozAVSUecXg+JuO/LTJnYQBKhQvbtLrn9IU96q3kPd+aBA==
X-Received: by 2002:a05:622a:14f:b0:35c:ffc8:93b9 with SMTP id v15-20020a05622a014f00b0035cffc893b9mr14087247qtw.174.1664100684842;
        Sun, 25 Sep 2022 03:11:24 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2605:ef80:80b2:413a:430d:cdd2:88af:d4b3? ([2605:ef80:80b2:413a:430d:cdd2:88af:d4b3])
        by smtp.gmail.com with ESMTPSA id v18-20020a05620a441200b006bb82221013sm9771996qkp.0.2022.09.25.03.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Sep 2022 03:11:24 -0700 (PDT)
Message-ID: <b1ad6e2d-7e2b-6737-f936-32cd72c3fe6c@linaro.org>
Date: Sun, 25 Sep 2022 10:11:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 3/9] hw/intc/gic: use MxTxAttrs to divine accessing CPU
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk, Peter Maydell
 <peter.maydell@linaro.org>, "open list:ARM cores" <qemu-arm@nongnu.org>
References: <20220922145832.1934429-1-alex.bennee@linaro.org>
 <20220922145832.1934429-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220922145832.1934429-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: uFh8JXCFz0Zp

On 9/22/22 14:58, Alex Bennée wrote:
> Now that MxTxAttrs encodes a CPU we should use that to figure it out.
> This solves edge cases like accessing via gdbstub or qtest.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/124
> 
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
