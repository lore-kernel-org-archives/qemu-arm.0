Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp2307446lfa;
        Sat, 5 Jun 2021 15:43:39 -0700 (PDT)
X-Received: by 2002:aa7:9809:0:b029:2ed:46da:1824 with SMTP id e9-20020aa798090000b02902ed46da1824mr3544897pfl.48.1622933019070;
        Sat, 05 Jun 2021 15:43:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622933019; cv=none;
        d=google.com; s=arc-20160816;
        b=GC/nu45qmiCHPl2DSROZoBqtRgMcl1L+0vS6bW1NigD3GiV3uMQEddku+Z/diymH7B
         VpN4m7KeRQAgT9hH8JG5IRFRdtyiZF8QVmi1Hqgs0Cv8FHJ8dI/FwnRLgs397BNR37Ym
         slOPp/ubwrkggaiBEp/W0cMBMKHsp6uursey7VEcDkJd+5dqNmJ/Lb52/PY+HAQ8MZCq
         I83q8oiqTMP10bMtCvsoUCGedkB6AwIlJ2jcTlTnGZPG1Piw0YPf+65/nmDOYSBqEFAd
         AJASNGHhdShXIkZOTA66lXra8Tl9xulGcW5M/7kMO/5dsEgZ1l/IfYvomVidmpcAGsf3
         Ynwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=1fzCTVj2OFU1+Ln2ryp4HC89w7XBy7JHTQdlAeMMRq8=;
        b=XJE6uhGXpbF7WhhjJdyQFl8xMlfruv9+8DVf+wgXz58li/x1E0ygfzSTBKOQuC/8Ec
         2CVzEwxM31487e2hS+eXYPxeUSDqM7/QU6JE6b3HeRhm9sNnPQnpoy0Di/ALEVCjx+ET
         CcaZOZR3VBVr4a2TI/maa/NFuXTCEwKlX1re/e2J2hVYE/O7FeamUFP8AZSjZeEyPVby
         lLAnLOUa5XgqOLVuVgeTjtHG288LW1k7KDwNXrrA9zWr8t6w5Qf8nVCcaMGZ9n84CEBu
         Zf79UIFHk10ZzCquI7dRU/k/vD1QeDYcrmUq2z1p/rJZQOP5a7m9Oc7KlWmayqo/YmRr
         bkhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="O/3/6hdB";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o10sor5566942plk.2.2021.06.05.15.43.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Jun 2021 15:43:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="O/3/6hdB";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1fzCTVj2OFU1+Ln2ryp4HC89w7XBy7JHTQdlAeMMRq8=;
        b=O/3/6hdBLSdUHSRsY2VIWTeX7Aafss84pEsj67mF3kDIXqqcjmqoCmsFnx0M46YDes
         gPBxOvlds+Lk/dgvzWckJs3PEZER2V+At/SKO7kFsAzMSDYdxj75eeT77RQsmO4dd21R
         JqPDql5tumZ77eaHF/Bf+bPEc67NhT2T4QfVup2sqUSwbqOvEcNCSn1ORTf7C8uYq7sU
         HGHvrD4vVeYIfWgdRcaq6aw+b/xrAbWM3gLayIdLsz2FZx+jqmkwUOvDzjf9hewmtPbK
         kwJ810fmxcTXUD1pk1aFMzBWeZMXwf3Cxpd/S3qgyZf4mPv0w88fmKlzNJltDtifPFca
         OiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1fzCTVj2OFU1+Ln2ryp4HC89w7XBy7JHTQdlAeMMRq8=;
        b=Dl0FqmSEsMxm6TgSvsXV9kDT9HJS1sG8nZcWOWnJJ+r0qLScNkLruU4tzVK44hvKAr
         1vzTFEbpMcQEAw2nEfh878bofVMoemr4KOw5wRSDaTbJjBhDPmzOjGhvmF+IsyCl2whq
         JdgrfgWuI0vGzByppmvl1AM0c+O7Ro/nRft4p1mAQzKhz56vMdp9SRAEqNip7/u1q0vs
         d0AZA27cxMiN5VEIawsJTHyY1jVj50a+rcZWJg1To7IOri9zdyXXQE5J/C80/DCUry9E
         LALjfO1xtsoCsBki8yUHaPBmPuyDrZZ6CfTNyHLxzqTroxLupTo1e8Wc3PCSDhvPF4jt
         QrwQ==
X-Gm-Message-State: AOAM533MEi8AjFMoruHeKCWZ3wM5YAEX7pJkFF35A0uGa65b26n/LtFG
	rrHGqErL15B2pdL0ZIm7P0riJn74by8CEeLB
X-Google-Smtp-Source: ABdhPJwaUHXxdCZlr2j17TK6p8Q7BDbVgBl7wgnpH8+wiKVsJdI9HU7fMPO4ypEeqhOKJ4qyqk/fYg==
X-Received: by 2002:a17:90a:7c4b:: with SMTP id e11mr24919323pjl.73.1622933018654;
        Sat, 05 Jun 2021 15:43:38 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id i21sm4662080pfd.219.2021.06.05.15.43.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 15:43:38 -0700 (PDT)
Subject: Re: [PATCH v16 95/99] hw/arm: add dependency on OR_IRQ for
 XLNX_VERSAL
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-96-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8097a8b7-d530-4199-7419-28bec27d2ae9@linaro.org>
Date: Sat, 5 Jun 2021 15:43:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-96-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 0nD8QT5leVjc

On 6/4/21 8:53 AM, Alex Bennée wrote:
> We need this functionality due to:
> 
>      /* XRAM IRQs get ORed into a single line.  */
>      object_initialize_child(OBJECT(s), "xram-irq-orgate",
>                              &s->lpd.xram.irq_orgate, TYPE_OR_IRQ);
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   hw/arm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
