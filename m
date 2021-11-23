Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp9083117lfk;
        Tue, 23 Nov 2021 09:55:36 -0800 (PST)
X-Received: by 2002:adf:e109:: with SMTP id t9mr9027161wrz.387.1637690136705;
        Tue, 23 Nov 2021 09:55:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637690136; cv=none;
        d=google.com; s=arc-20160816;
        b=wWfn5RHv0EpwjHDWEVbSs0LTdFDLa8/gjdkr8evkutzaXEzxtTdl/vszGEHAT8STfU
         Np8G0+bWvRlKzFaIkHMtdsT6KRwS8eUq3yV8aHmGen6zc43iBsHCi5zOJUKNXFApfApT
         PUP88CHE2hF+EZ1b5lX6a8zu/pXU9LCv0bIPNHUG7ihrdCeS6DFKC08SuBt1DGZmnZgL
         UF19rnKJZ/bR3HgQeXnZZtbgam2sdLhvKgw9YO/sGybzCSOjWvscpr4eD4evfCTcWrXR
         7TADQuaSP1/YdvLFkdTbADQ/6hXTrOv8GsfnFz9jldGU2RTaZz1J/N/IjZUDEfAuhYMn
         7Dfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=AaamTke+m53pF+W3Pv1hIIS9uUQ7lg2Dt+VqwSuIDqo=;
        b=Zchkf3J3QDnHBSCaNYtqEKsnEh/NNgd/GG/jeMEOFvUt0IJHSZ3E2IOtQ9ROLHLLoy
         USsXqvyZoy5b9arc2PW1GNzffBmCOsVK9i0RRjvRh/7sNpl00/bEMfGBEj2cozVhCrsX
         Eud6Qxw4BpowNPb7iIuWtuvTxkk1jOTbK72ESDskUHQszhGAGJWd7ZxLA8IuuYuCRDxX
         y6SMP/QeAaNwspyMjNUmz+ITf6SfQfiV+u9EwDuBrs1II4GEVaZp45iQJ6HoJT8ijkl/
         TsgkypFaoMp16egseOjYaxx9glUwWnXmwEdoPulLjBJDFUQwFj74C+16zSwVfdvOjoqq
         OUEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JKS13+f3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v13sor1347155wrx.60.2021.11.23.09.55.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 23 Nov 2021 09:55:36 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JKS13+f3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AaamTke+m53pF+W3Pv1hIIS9uUQ7lg2Dt+VqwSuIDqo=;
        b=JKS13+f361NiLjnnYgy/JG7PHF6MkssWZGoxhOaaRLvc7iZhfLV5z5mhaT9QO3a29E
         3IPLVgFnN4YgV9fyV/iww8AgQ/2sGasO9qSF91zOvT5nxiXsrcEkOQJZnhnXLcAGtPKe
         MtpBTI2xLQb6jYlAx7CbNVWFHQd5W7p5FlJ+8PksoITkW2eaMiOJX5b/3k9CN4mW35Y8
         Godn0Py4zajwrpHaXC/I+2WeTryviLAEmDudexeWGhrvyGOZ05DPIf2SadAOb+NPTDBM
         2inR/q0mYdjuu7csgDxs6vs5zrL9nQImUqk/dNsb6F9hdSLZ3cFiOYx2fHw3CkkMyg6n
         zk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AaamTke+m53pF+W3Pv1hIIS9uUQ7lg2Dt+VqwSuIDqo=;
        b=tyDtEp8GXYLHvPteuwNBlzdJXEPkn4hMVchq4YQEksXSCCYouK5s3DomddgLNiUDU1
         u4d9QMu4G91pW4C4noQ3vTlE0d6oLvIH6/hahgxpZY/IQzdW9Dwfi1t8fFSDivfD0VLd
         51AHHhmopZ2Av/ynQfm3S/Hbmo4vFcyshomwqYfhXJ/7fZ/RxUlXzJ6sdnjt5knZg/ni
         476VH6cF9irrsXTVCm6QiA2TJmepnUSzJu7357Hkzqawx7HsN+wZpWQ/qqMIz+Gv+dKg
         D4jueprQHgrjfIRlREIDFqdbzW3836kHm8NcZVvydbGjvFLNwmrmKIkW7mU/Q8pfcYyh
         5o1w==
X-Gm-Message-State: AOAM5334yEk+P9zIjDcTqJIOjE7gS/9n1BecZfulpjtB30FjssjIBj0U
	xz90KkRmq0+vrZWqT6SYV6aVgiwK451dlj+FIKmWbA==
X-Google-Smtp-Source: ABdhPJx7eJtwwjkt0EGvSV8Tj2Bx3AG6gW93qKD8rPzL0RHcb8SNCXoXU2QNb0+ifXkA7ziN6YgJig==
X-Received: by 2002:a05:6000:2a3:: with SMTP id l3mr9691859wry.415.1637690136033;
        Tue, 23 Nov 2021 09:55:36 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es. [37.14.164.149])
        by smtp.gmail.com with ESMTPSA id x4sm1773491wmi.3.2021.11.23.09.55.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 09:55:35 -0800 (PST)
Subject: Re: [for-6.2] hw/intc/arm_gicv3: Update cached state after
 acknowledging LPI
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211123171031.975367-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4fdee2c9-464b-7e39-be91-135bdbc315ab@linaro.org>
Date: Tue, 23 Nov 2021 18:55:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211123171031.975367-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: +or21FKh/kCE

On 11/23/21 6:10 PM, Peter Maydell wrote:
> In gicv3_redist_lpi_pending() we update cs->hpplpi to indicate the
> new highest priority pending LPI after changing the requested LPI
> pending bit.  However the overall highest priority pending interrupt
> information won't be updated unless we call gicv3_redist_update().
> We do that from the callsite in gicv3-redist_process_lpi(), but not
> from the callsite in icc_activate_irq().  The effect is that when the
> guest acknowledges an LPI by reading ICC_IAR1_EL1, we mark it as not
> pending in the data structure but still leave it in cs->hppi so will
> offer it to the guest again.
> 
> The effect is that if we are using an emulated GICv3 and ITS and
> using devices which use LPIs (ie PCI devices) then Linux will
> complain "irq 54: nobody cared" and then hang (probably because the
> stale bogus interrupt info meant we never tried to deliver some other
> real interrupt).
> 
> Add the missing gicv3_redist_update() call.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Marked for-6.2 because this is a bug fix to the ITS support
> which is new in this release. At least for me this is necessary
> to boot Debian on the virt board, since the ITS is default-enabled.
> The failure seemed to be somewhat intermittent; I haven't bothered
> to try to work out why.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
