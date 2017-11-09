Received: by 10.223.150.237 with SMTP id u100csp2227803wrb;
        Thu, 9 Nov 2017 00:18:59 -0800 (PST)
X-Received: by 10.80.195.78 with SMTP id q14mr4119352edb.1.1510215539171;
        Thu, 09 Nov 2017 00:18:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510215539; cv=none;
        d=google.com; s=arc-20160816;
        b=KJPQqLh8rt3HhS2Ce9Ai3peXg+V46P+zlYn0tD/eTwPeMBbsBSFurQPYVc6g6XHYM6
         U14i2r6m2uDGFj1q212MNM052oOy3SyC/ozdxaoqsImadytSVFobyArhuXMuQZR1qkNH
         HsJ9fFQftBj04Udd01xnmKHoUKXzmHGLSzrXL67SHxQaX1y1mkO7IolY2vjF6LywI6r2
         l0SUpeM6hLmtLhBoe4AKaCXX5qp+NhGPmdWcnf+Qtyt95OVa79OTFUsvuab2xbx18dI5
         lPILup4FCvHu4sH8pdT7urQo+JkV6S5U7I4iarQOHizAISZWTkjuU6FGukPj/sPqQPP5
         WXtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=GXMRJIBfHD1nbKfSajkS/pq+r2hJrserScxftqaGeqk=;
        b=pcm7ralFHRKb0tZLu/mzUp+BdvdXLCpPTOtFssoApQacXaVam2SS2I4xEuY3IPMUVo
         5RTPOzxC7jOacAgT3vA0+RBLBIZ1f3VsoTzfXuHdlkwYm+q/tK7VvD7ol4cRw58RiD43
         wHpe82DZXAl/6S401AEHyZMQvwpNweXFZJMdA2ugaCcAfkmygmSvoav3cCvbHOmWY08T
         FpwuDLTL8cNKtTFP/QlZF2VPFSVJLUaG+QvKs0MlBRjfWP01nWuhrBt7ZVaIhJKELotM
         uYt12M7LbKbPs4j0Yhp73yqDu86ehnIunBpI3WMdvAtLIT6uF+l2RR5JEaK/owtLzix0
         BgDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fYdnbDoJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n15sor3609747edl.24.2017.11.09.00.18.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 09 Nov 2017 00:18:59 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fYdnbDoJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GXMRJIBfHD1nbKfSajkS/pq+r2hJrserScxftqaGeqk=;
        b=fYdnbDoJMLhzjPiIpnk4yMjVLP5ytauOagQS/7qH7SQwTJyng7r4ocd2WF32MQestz
         Z5d1fojhemP6e6tvRtRjQHwZpsov+qVhpUEeq/u9Xd7zzVgTBo7BY8Y3kDvKsSumsOYv
         Gu3eKGEIkPzB2HA5D1TszYtEbkVN3dGvkiXz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GXMRJIBfHD1nbKfSajkS/pq+r2hJrserScxftqaGeqk=;
        b=N979MBPFJtPeXQ5A5eIGny8tVKjyRTwPLQ/UIFnDIihiNlMGBWmGdrtsSyMTCN8cOq
         ZK2H6LOnmlGNkB8baJMr0p8cFjnLHDASIBEf16WbOupUlYaOsUPpIoEIsXUBDq8jKp+A
         S6SRHGdRUHEQBTQsad0PTvhLPwXY4Z4HypbOWnjU8KuZMQXuiCHKdwrIszGl57CrLgTe
         +5XK4WAR4PTq4r5MacsPWQ9cXFUqbbLq+Ld8PW0N0Z4muRiW+amFJYa92MPyr6X1twl1
         GRKfG++zCiYVg0Uri5lb181dbWh+Qr6Otx+Vy5qFnairkjzSxNAQBkHt7rJzIA60AJgf
         nUMQ==
X-Gm-Message-State: AJaThX7M7v0O1hvv18DvW+alIhIzTiPVFPUVnnJN9q4M/8j7JlYQVqFm
	tP81F1/FnupuVNsQDiGDXAiNo9ilG6ZA1Q==
X-Google-Smtp-Source: ABhQp+TmHbSBnANES84rOL4La5R6H2iWAcI4E1fCDsBKpNa39z1o2vBhyNBTIH1ly5H06cO0RZm03Q==
X-Received: by 10.80.218.202 with SMTP id s10mr4305910edj.212.1510215538910;
        Thu, 09 Nov 2017 00:18:58 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (93-45-2-58.ip99.fastwebnet.it. [93.45.2.58])
        by smtp.gmail.com with ESMTPSA id f39sm5667700edf.83.2017.11.09.00.18.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Nov 2017 00:18:58 -0800 (PST)
Subject: Re: [Qemu-devel] [RISU PATCH 07/10] risugen: add --sve support
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, Dave.Martin@arm.com, qemu-devel@nongnu.org
References: <20171107150558.22131-1-alex.bennee@linaro.org>
 <20171107150558.22131-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3aa5840c-6bd6-f585-5e4f-12219e8c6047@linaro.org>
Date: Thu, 9 Nov 2017 09:18:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171107150558.22131-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 0ehnG/g+07MA

On 11/07/2017 04:05 PM, Alex Bennée wrote:
> @@ -483,6 +521,10 @@ sub write_random_aarch64_regdata($)
>          write_random_aarch64_fpdata();
>      }
>  
> +    if ($sve_enabled) {
> +        write_random_aarch64_svedata();
> +    }

Should write either sve or fpdata, but not both, since the registers overlap.


r~
