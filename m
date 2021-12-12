Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3480281lfk;
        Sun, 12 Dec 2021 12:46:11 -0800 (PST)
X-Received: by 2002:a05:600c:3b8f:: with SMTP id n15mr33136687wms.180.1639341971729;
        Sun, 12 Dec 2021 12:46:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639341971; cv=none;
        d=google.com; s=arc-20160816;
        b=kF/NFVAuiFwkdL+RFLvEFZ3Et5SgpBidQr++0x1fyKaHoDqZ5LFKtfnUL+w2V2cubK
         lZpulUCVlI8y1ftVvrF/Y70MkIlqdyctlEI7qu3u0RWbpL/wUbt5iX/Aez0rwCg39jMX
         +7xqKouLsi//CJ21VhHNwYC7KT4/TTX6gs9jwAhk5xhubKg620DT6DMn0tjF/to+5bIV
         q5PLWGpu0ILZMuvpHFf2RQ1vXHksKZ6AeUpaOp6GDvL+jxUqITVizqFrKeZEX1uLNbHq
         sWofwA0ukaB9T4pD3eaj0tDFsJNcVmxgG97pX+endG03J9HLBMdLLBXiHOiHSZfRiV5E
         wqJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=hGM2NHUtnbFDEgpWxlzwlarIp6xK2fhN/yqxsB9M4XI=;
        b=QhcMQgvu0vwx2Ke339L+nmpYpb2lrPykVOf1pV0PXrvlYmjAmte5Wecm5juTMt6iHu
         RVnHQ7PAF6bc3JKCg+piG53jtURfMd9hKzpCRXkUAmpoW1vmrs4Ar+rX0jwM0Ueh16xK
         GJRH/Bu9PgLL6wnZB6djC07xO6fpXh7Xjvkkk53aKIsrCewjezYvu3bpC3QrBMoTEPm1
         L/Sv8obkPyia5gmC3kkLy0tV435PYjzGaltsP9rl+mNlFfn2RREt5sZXAFNBjUM8n2SG
         Q0+g3Yy/eetURDcM8uAT5gHO3l/Q5LtXSYsBY7U5Xsc9mIBxIfm9L7ZEFF6Wf6Bu+TBQ
         iy3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=gwM6uXXc;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i20sor451857wmb.14.2021.12.12.12.46.11
        (Google Transport Security);
        Sun, 12 Dec 2021 12:46:11 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=gwM6uXXc;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hGM2NHUtnbFDEgpWxlzwlarIp6xK2fhN/yqxsB9M4XI=;
        b=gwM6uXXcliG67oQufE/i5bs66VzU6+kSCSLNJx/JvzKMiJgviqsdvvj5FTb9KGdfXB
         x6XbijvU/BiaWbP7yX40g+X8AGmDXb+J6QSMlSn92E4RM3sqGpxZKMvNRm2mluNukrOw
         bdYlkOSaMUEoRtB0o1y6asg7nr149hNn8yudg8RHS//r4HuykakQ1+99coBDIkc9bBpp
         c1vpo9XHVIJsqYf+mKVlCSNn3rc/U+aAYJ7db6tzFXbhAkZyEBtPjTKZeOgyzGBqDHRp
         MrFz/Bm1shWPZoim8ijhiX4OuOmiu8wxkd83QOGXf/r7spcjjEJ4Ib1UhzV3zg0EAHz2
         AqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hGM2NHUtnbFDEgpWxlzwlarIp6xK2fhN/yqxsB9M4XI=;
        b=a7Y4cJs3aPulnP5fuBwm7xwew0V8d7+9RWyrbLYatCL2tDGPoJf+hhYddMAreJSzxw
         deE4be5dhcfwAnDx5zereZ+bh/7hftMeqffu37RaupyY7whSuXt7cTV2J3luHvF0ta8j
         cb6qsiqADEgkHI3Ke3QcNTm43S9KrmH14VEJsZsCA91rrounpkJIAX7mapO/A4tpEZcd
         cFaVhncbTEg549OhRICfkSpxz9/kshZHgllEY+44IeyKL0ap+spbO2Ov26Ow3bM4+sc2
         ONcPez/dcRvCd1vS6rt2yXHCh4qvlx0MCQcFSHYSBubxmAqsvy/EIq3FU74SYGlDqOER
         zy1w==
X-Gm-Message-State: AOAM5339CigIjKgEHa2Yh39BxhiU8IB1JSDXVMj42A+BZC30ZOdEORlG
	CzP18b682YcFyaj0MC+l5DtxxlKYJARR8w==
X-Google-Smtp-Source: ABdhPJz/fImkd0bhG0CYUp3Z9YJhRwlSL/T8Kya/WrdN0hL18FXBlK+H7ARrWE/+ZURhsg5I2eTTWQ==
X-Received: by 2002:a1c:7907:: with SMTP id l7mr32524567wme.72.1639341971149;
        Sun, 12 Dec 2021 12:46:11 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
        by smtp.gmail.com with ESMTPSA id az15sm5251678wmb.0.2021.12.12.12.46.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Dec 2021 12:46:10 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Message-ID: <717d0487-147f-14a9-34ed-993e8cc83c63@amsat.org>
Date: Sun, 12 Dec 2021 21:46:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 03/26] hw/intc/arm_gicv3_its: Remove redundant
 ITS_CTLR_ENABLED define
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211211191135.1764649-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: fG5Fx+qZfE0R

On 12/11/21 20:11, Peter Maydell wrote:
> We currently define a bitmask for the GITS_CTLR ENABLED bit in
> two ways: as ITS_CTLR_ENABLED, and via the FIELD() macro as
> R_GITS_CTLR_ENABLED_MASK. Consistently use the FIELD macro version
> everywhere and remove the redundant ITS_CTLR_ENABLED define.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/gicv3_internal.h |  2 --
>  hw/intc/arm_gicv3_its.c  | 20 ++++++++++----------
>  2 files changed, 10 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
