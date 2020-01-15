Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7527678lff;
        Wed, 15 Jan 2020 14:21:56 -0800 (PST)
X-Received: by 2002:a17:902:8c8b:: with SMTP id t11mr26741101plo.319.1579126916453;
        Wed, 15 Jan 2020 14:21:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579126916; cv=none;
        d=google.com; s=arc-20160816;
        b=Ks7ZAlaBKQZtgwi7+DwZJSvt//KMso+iyyOHm4tXYOzquhQz85KxpsGl+nJ0pfgm2v
         xjq82IncB5MgeXSvTzT7cCsOb5XVUWZrUueQe8JovbrCx92a7nUSHYnj0T0pbTohitoN
         gi4U9y/y7eBCDgCYmPpQ9g5ctK968h17bm54NH0bCYrCOY00CWF4OVb2KORJkeUgzaq8
         tEDBMGBJrPnDV63bSUWi2scVTQAMirwiRDxI+BOPNg3X27oNyWj/pcMcLRX3mIPg7l3I
         ESlhjxmRI29na7oS+UcxId9BGXA2CEkfM5C1O0AY/4tdmIebJ6QLKl6Mlyg3NWRxKe1F
         Yhdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=5AERv8nsR5Ukb39KPVGYVp9RsFSYNeIq1f64nvTPkCA=;
        b=PDavzrF/RuuomZ+2+2V/TUrThwzXFzOr9cVMb+XgCNYYxWlx02bDtnJf4f3fedgLQd
         gnxVMtGGDhi9ssdYDslCjIPM2gXETFaDmxIf2MvWVvOiWgW/hX9xMz5/F6onLKkKVjKh
         He5QS0gameAwrZj/SNtX+QDQuXLpd23oaZXTj8wxrMtQaRQaKryBMZOixpH+toQ9Abdj
         XiNAkM9RpGZda3fgz5ulSrZhSA+0ar7zNIoYzrKC1u1ZkJ02c82qgF2MgGRC08ThmaWK
         Qx5JepcYXbi0+LFPdSbGIJZyX7DeXmikD6ry8S23PhthQZM8Gxnb1RDaQJg/8ZasFhYw
         xCKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qL6RK7KB;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q8sor22515491pff.70.2020.01.15.14.21.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 Jan 2020 14:21:56 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qL6RK7KB;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5AERv8nsR5Ukb39KPVGYVp9RsFSYNeIq1f64nvTPkCA=;
        b=qL6RK7KB59o4BfL6HrXgUdKpvIPbQ7NsNDtvXWUXUXNQTGqtWinYYv5P+oTviJKnyZ
         pSuJdVZftsydTn3wdGH+tAkIjbIc2VCFptWYRFW5zdZ6M6MBXlTi5mbCzAPUc52U1vBZ
         Xrm6MEys4UtIC/en0VRLMvHF1ATA421U7YsvNVPDyDn+OwxkZ/+di4RJccwcStyeBCDv
         1QFxW188jOqrW0aOHFnwmzO0JT6ao8Yw1TAuiMuUPtdz6t0WMaVQy7BDKg2nFNGubwhK
         4b1nDsOzVQfzl5sN55FthTgY2rxyOpYazsL46UNGbD+5xkZlD6B3RmsOitA/C3TYE9AW
         /A7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5AERv8nsR5Ukb39KPVGYVp9RsFSYNeIq1f64nvTPkCA=;
        b=koTUZbad43RsU0hDgKlewg7zRasp6nbkrx73zw+KTPSqjxUce7y0VZ8U84SK+NWEPD
         y5t+OyNKRu6gFHtRBC0VntCbOjqyJfZq1DOY3KbQP520d1cOmwrr8dRBCicUR7AR2fDN
         rn/RZLZ+2RHSHAe7iZfBxYMbTf9RHOgzRPU6U2RMdlaG5rBJWZW3EfpSfxN72whj7FDT
         /OBmPsiMLUkeD3xENuGG/OiArFgVPfWxINZq36DQXlScVytEj4FlcmCTX/z1uUbD32bW
         UtbVsju1cdi0xraRhPWm/pzU6PB49J2uuS5B/PKR46IRO/4W4FMQVLUk6gICCwSf9a/Y
         6FYg==
X-Gm-Message-State: APjAAAWt8qdUTqREwFUjfVnHk+1mgPLXjM9xGzCq4Bi3K4hzLcDY2ZrV
	6FIX8Jm1mFhA69NNb2jOkiG2gWM6ZpL8cA==
X-Google-Smtp-Source: APXvYqyb5hNQ0T4Hv11MmQm43ZKjeINB1oj4QLJU4g3/S5XUQai/1kchkrdhnOUT1b13y0QKMY9G1w==
X-Received: by 2002:a17:90a:cb0f:: with SMTP id z15mr2654832pjt.131.1579126915831;
        Wed, 15 Jan 2020 14:21:55 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.3.43] (rrcs-66-91-136-155.west.biz.rr.com. [66.91.136.155])
        by smtp.gmail.com with ESMTPSA id 11sm23467531pfz.25.2020.01.15.14.21.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2020 14:21:54 -0800 (PST)
Subject: Re: [PATCH v5 09/22] target/arm: prepare for multiple dynamic XMLs
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20200114150953.27659-1-alex.bennee@linaro.org>
 <20200114150953.27659-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5c6987f3-0c6d-22d4-af11-773741f6613a@linaro.org>
Date: Wed, 15 Jan 2020 12:21:50 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200114150953.27659-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: RRByQlCGxJEM

On 1/14/20 5:09 AM, Alex Bennée wrote:
> We will want to generate similar dynamic XML for gdbstub support of
> SVE registers (the upstream doesn't use XML). To that end lightly
> rename a few things to make the distinction.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/cpu.h     | 20 +++++++++++++-------
>  target/arm/gdbstub.c | 30 +++++++++++++++---------------
>  target/arm/helper.c  |  4 ++--
>  3 files changed, 30 insertions(+), 24 deletions(-)

It seems to me, that if vg were present in the xml, and honored by gdb, that
the xml for the rest of the registers *could* describe the maximum register
width as opposed to the current register width.  At which point this wouldn't
need to be dynamic at all -- merely have a comment next to ARM_MAX_VQ that
changes must be reflected in the gdb xml file too.  Which I expect to never happen.

But again, this is how gdb works today, so
Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~
