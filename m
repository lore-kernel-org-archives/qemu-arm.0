Received: by 10.28.71.27 with SMTP id u27csp1175174wma;
        Fri, 23 Feb 2018 15:30:26 -0800 (PST)
X-Received: by 10.101.75.193 with SMTP id p1mr2676585pgr.63.1519428626524;
        Fri, 23 Feb 2018 15:30:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519428626; cv=none;
        d=google.com; s=arc-20160816;
        b=LBuivT/EQpucwX9jWarjILQdpzJtXV9uk4C2NdGJzG4aMIoqP1oa8GCyh4WsEJgFQr
         lZuR+yZkrObuvAsCa3pznmgpvnECtZg7TD9iHIAXBSl47Q8+qhEaUZuBoiQHZigHtkHg
         IPyqS51lLxA0UicgF/KhGfqnGXMF4ACGP5qnx4AKqc6wyMKnIYN4yWHT6NjdOh4EwY9T
         2tSzNwtKPHQSDx91Hn+39ZjzAgWirmagGxpZ/BjcUqaQdXc5xy9/RY0lmuye3Uv8IaNx
         OiovSEdgR0UAeS+oPbZQ9J57qzxwFMQFoz7RWvK9zVkw7hh9Nplq0oMdV+qjVivHdFAG
         thFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=QsWQzjC+DelZIO95p/gqNOKBUNLYQoJiaUmPKm/agRE=;
        b=K3XjWvVzf25uVkH1miM0FnUqC+9568wzTwDTf5Gnltjxe8PpWO1RajFTevZPfLi2KX
         FgBbLV053+tYJxQj/sHGhd9fPVUVhO7hV0O+EpNwHmZxuYNWYcXvEtcqRIwc6QUACri1
         rj2KgLACxGWCrVKrqC6x6fAP0fcnK4cwDnhBbgj4xNkL9j3ofzhh13AT6GZJjEAtmStd
         gIBX5zyB9OQmHvv1YLqmLLVJiVqYBeWQ8750ddKSR+WT4o4CsCE55O8vkdXBWKE1LY79
         ko7pzAcFH2h2cRv77iklY99RM5r2/J/aUR9uTj/wBzR1BtQHWzA8aBkpG4aujea6PMx6
         xPrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hobD8OB3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n189sor917975pfn.108.2018.02.23.15.30.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 23 Feb 2018 15:30:26 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hobD8OB3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QsWQzjC+DelZIO95p/gqNOKBUNLYQoJiaUmPKm/agRE=;
        b=hobD8OB3xhW705sW0t+VNQmzU70xvxaGIR9V+wiU4Y0I+OBoHl+2WYoYJr4Fv7tu7K
         oyEfAUD7bdJXTHhVVLy1wGZXOBypYX+vYQKHHtu1IQ55Dx3onVM9sSYqA6WwrJy8lp3o
         4QMfDaXnGSNhhM/27MW1XpH2UMFHKwN7UcP8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QsWQzjC+DelZIO95p/gqNOKBUNLYQoJiaUmPKm/agRE=;
        b=GVwjCh4N3n31P7g3LJyBas/UuU8o9ufXmAxhh+7DauoptIP1R9U8q8M+3ZGDEhkcId
         G8SbxFRXSiqePHZRoq0qG1i9A/Vy4t4x/rTcgd+7guue+nmE4PyN1YYGKZPps0kmbzRZ
         3Hoc6MZsKs8jjCIgo7IrWKF2f/ezriLGVHP9AdvslItOaF/OdoXWqxZDkGciGXvgQiKJ
         aGmrJV4Ua6DC8bbB9FHZ5qFoklI2yefbs66/OJFmCtiKTLpNihwNK7rEaSK2MQfDbhyH
         iAWUIfAmN/VnmnKrNFK7AoYVlTTxdmlrHwVIQK6CcBHjjG+wvYQMwErVWFvadiBCBdAx
         QxDg==
X-Gm-Message-State: APf1xPBkCGCQdACXjRK6Lz0YS2yGy7BUOOjRnBOmUjbHoywquhIoZWG2
	vO9UEflc876+urUPhuyEtidne8kAWQICcw==
X-Google-Smtp-Source: AH8x224aJlTKZkJxF9ArhIpTpuFRTBE1YKkFrvIQr8xaQHtzXKCdrcY5BOUf2Z78fRP7xnvLwvDudQ==
X-Received: by 10.98.11.19 with SMTP id t19mr3320432pfi.70.1519428625493;
        Fri, 23 Feb 2018 15:30:25 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net. [97.113.169.147])
        by smtp.gmail.com with ESMTPSA id r14sm6484364pfa.136.2018.02.23.15.30.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Feb 2018 15:30:24 -0800 (PST)
Subject: Re: [PATCH v3 03/31] target/arm/cpu.h: update comment for
 half-precision values
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20180223153636.29809-1-alex.bennee@linaro.org>
 <20180223153636.29809-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ee422087-7454-8bff-ecac-cdee71bb570e@linaro.org>
Date: Fri, 23 Feb 2018 15:30:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180223153636.29809-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: eIU6LuLX4TjN

On 02/23/2018 07:36 AM, Alex Bennée wrote:
> @@ -168,6 +168,7 @@ typedef struct {
>   *  Qn = regs[n].d[1]:regs[n].d[0]
>   *  Dn = regs[n].d[0]
>   *  Sn = regs[n].d[0] bits 31..0
> + *  Hn = regs[n].d[0] bits 15..0 for even n, and bits 31..16 for odd n

Everything past here --------------^ is wrong.


r~
