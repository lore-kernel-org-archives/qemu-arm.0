Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7557670lff;
        Wed, 15 Jan 2020 14:54:25 -0800 (PST)
X-Received: by 2002:a17:902:d694:: with SMTP id v20mr28904004ply.127.1579128865088;
        Wed, 15 Jan 2020 14:54:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579128865; cv=none;
        d=google.com; s=arc-20160816;
        b=KAC/f1xw7AUaKtLEYSTgzPyBCzfkVKasWGVpu8nafxsFpU7MmCaCd8X2KWIDUQsJk8
         Zu9rB0E/B0nUWUAXFgWJtLtqjGRN+mhG2jQknCQP6pO80UEamEI0OmDWRqZlrMJtk/gZ
         D3UrJWiQPlu2F1zvqIPCGnYc7vLbTgrxGIKVb8p94/r1lm6VEowf1XrhVsfaSl95MqwX
         s4P/f74nfBBieSe5tBve6/LMpKO0lpWqQrkbnPJVzaIqjo+84xlJJBZnBpjhXuFThoK7
         CBcmIMk/AkKX1PWhR/0dBFbUcFfoETd2TxqxNdBAHNKgsjfLAAukIae1EwKztpCMzCY8
         s5Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=tr5vJHb3uDT+O2mN2W7qy1j5IR9fMbuiG5JV2TeiUr8=;
        b=VdIsNMiDkhFyNbbZ4mObTw++zCfOBoadV4PDRVAUJ+rKKhCyl5Beeg9CXBD1NDk0PB
         jEb+eiAnTZc+5V1XpTx/2T32MA1ibIXkRnRKpc5sJBOR7OKLFDT3CuBplLWrUYPk0qo/
         MhtOCwLRWBHRwwj1TbYOK8evhOwKgv3uoyue6uRhh4QNZ0bSTJ1x6GzXTuODgeJD69QP
         WQ+Ol1JJoC6Q66N9703CccCqEQFcDpJiDvCCSDfODkXwUjQz6SRuHsz7FL6hjibelfxF
         n5C3+I0Nd+QCy766RQfgRa+tKjG5UhnzO5SIeR1OFKM9O9v+8T3UQmnH7i3ELNUzjohy
         WnpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PL7pvNqZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s6sor21896043pgg.60.2020.01.15.14.54.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 Jan 2020 14:54:25 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PL7pvNqZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tr5vJHb3uDT+O2mN2W7qy1j5IR9fMbuiG5JV2TeiUr8=;
        b=PL7pvNqZYzisEAhdEOkftzi/ZumRsvAnyjuFTdtl30UmaBIYM3t/zvw8CCIDEIEi60
         qXLO+AIQQ/qYrzZTBZH5Tv+Hb9T+rhKA4d77opyveds+ojW6g/4u+Xagh5hvd3GpZnji
         AP1z5wVdmPJtdiBr6ClRPZNX95jrIy6iJ2BNGE8uIcVS6pA8T1bgr7hJjtP1RXIHMN6a
         uLtEZogzY/46nKzTVcjTTYseZ7uCmhGcSzFwIuvLNoHTq/JrUqh4f+cIH6R2guhl/ppg
         akRhfRENB6/A3mhv9j7RKUmJgpb3DMvrvpAUHzBmi4pVfDq6quDnkyFrrfSx3AynB7TX
         rKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tr5vJHb3uDT+O2mN2W7qy1j5IR9fMbuiG5JV2TeiUr8=;
        b=ZL7ax+7SHZKGzpBgun4EpJi7bmlms0VMht6/q92UP2XaWCRRuMapUeZrkXmWGGTsec
         zxX4FkAlOGR4NJCTWmS9GmwMQFZJ1BUBfOnx0oD9RXOkQRMFLranuAK3/Ct5k9n+hfkN
         tJTXqD3Rz2raB1MBcbSvBjTBjtKU7kZbLu9YgizJCU+CZQ1z2iHspJhXbYNAuWkK+c81
         ER/LWcig6Yv3OimIRyv118Jt0PeAo0Hu1CHAxaHB2ebbp9mE4ZS6SnXa2LEeZz/h6Fx2
         pLpQ5efJB34mgIhHI+jmr3OXBbHSs4L8tndtl0k1aeYmZLedQ13ntg8cO5KPDP/L4JFQ
         7U1Q==
X-Gm-Message-State: APjAAAXcttKNPqWYp4HM+JDXobSA5hpkPhzWhjdJCudwUOxJdNCFeNhf
	vYkj24zr1AEbp3kwgfMxZtioiyH1Sms6xg==
X-Google-Smtp-Source: APXvYqw2gAYd/tposAiiEU6ZWvd30UDLUYSbTm1FbuqOkRh6k4vE2lN9Ymo6SqV824In9X6xCS2ImQ==
X-Received: by 2002:a63:1b54:: with SMTP id b20mr35484886pgm.312.1579128864652;
        Wed, 15 Jan 2020 14:54:24 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.3.43] (rrcs-66-91-136-155.west.biz.rr.com. [66.91.136.155])
        by smtp.gmail.com with ESMTPSA id x11sm22078793pfn.53.2020.01.15.14.54.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2020 14:54:24 -0800 (PST)
Subject: Re: [PATCH v5 18/22] tests/tcg/aarch64: add a gdbstub testcase for
 SVE registers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20200114150953.27659-1-alex.bennee@linaro.org>
 <20200114150953.27659-19-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f31669c6-ee62-6019-a09a-85a133eb68ae@linaro.org>
Date: Wed, 15 Jan 2020 12:54:20 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200114150953.27659-19-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: T7AjlXtA1Y6h

On 1/14/20 5:09 AM, Alex Bennée wrote:
> A very simple test case which sets and reads SVE registers while
> running a test case. We don't really need to compile a SVE binary for
> this case but we will later so keep it simple for now.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v5
>   - properly plumb in
>   - skip if fails to connect
> ---
>  tests/.gitignore                      |  1 +
>  tests/tcg/aarch64/Makefile.target     | 15 +++++
>  tests/tcg/aarch64/gdbstub/test-sve.py | 81 +++++++++++++++++++++++++++
>  3 files changed, 97 insertions(+)
>  create mode 100644 tests/tcg/aarch64/gdbstub/test-sve.py

I don't understand how this is working.  What's the process that provides the
container for the register state?

I would have expected *some* binary to be used, even if it is only "int main()
{ return 0; }".



r~
