Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp5958604wrh;
        Wed, 1 May 2019 07:37:15 -0700 (PDT)
X-Received: by 2002:aa7:8b88:: with SMTP id r8mr25456304pfd.174.1556721435279;
        Wed, 01 May 2019 07:37:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556721435; cv=none;
        d=google.com; s=arc-20160816;
        b=UElpaxKRVb3g9a2rHKJ+/kMO4pTzCL9ANjQ4JvQC387YNBjveFek89+zmrgLJwj5HE
         JYcVdAxqz6h8QflREsYbK9klWvXTxh2oWKdC0dJw4mz+V6f0fzKE8aZz6IizixqkHDG5
         wB0iIqjF/GdBiDJZWpROA6Tv2NVmtzOI84vVVLH0HnmoOV4Ia6vRGrhd4Wh4ygF4ZO4x
         XtfQRvZXx10MNY7qoQGv46k+wclpGUGYtBcClmqCJrWwbm/2Fey1biqmGOo2MSDlLDKq
         qhU62SIczUWnVPdHKVwmkqcHRG374DSqJA9D/SfAOaHYfZ2xRj00mYqJRIs+Z/h0DzyY
         0Weg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=K8HRtfqe/DTpbny1cHPqirCPHy9DvhWS1/adCdvc9fw=;
        b=Gv5jNYNRpn86UB2YO78PiuwkqOEmNt5e3JwBcE5P0Omirh6gcCUg92Z6JYYDculr0F
         Se8e8feGVQgQSy6/BkCAhHcdLEeFHCxwVMlgVp5ijhhINezSegFhQjS3xv9VV9I5mJPz
         BjDCW+EralpLSDbEQStRD7k/cTDq4LyF5L/2Yh3EHHoMiXZxS843T1f7QpKqkGo8hGSG
         tXAFBM5zwoKOnxG5UuwLZsQul/iKJoQaM5wUThsgWNoCZtKrj5gYxZKPwGKxVCYJPcKl
         98dNnT+BNdd0JyTXCQHA/tZMAeZQ2Ey+/anl5XujqTRJ8T47ElGZ5BQ3WwNbQzKwgqvv
         gZrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BF3C2QUx;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a23sor15119853pgm.45.2019.05.01.07.37.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 01 May 2019 07:37:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BF3C2QUx;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=K8HRtfqe/DTpbny1cHPqirCPHy9DvhWS1/adCdvc9fw=;
        b=BF3C2QUxrV5wQoLEAedIUw7JC6x31XlMxhgfBxL7kaYwQ3Z/4Do06s34hlZM7c4SzL
         Hyod2YWyc0LQYB75LUr4SruGOqwMYqkzmKcYWE2EsIwVcFSbytWGyPUeYT8D39LqTUMq
         crO+f3uAGpAmNrZIyIMRSBw22JnoYb6LIh7eAZeJ0siy8upwcar/EXHFE1nTxZ4GzXna
         i3SUO2oI7njYdKRZwvPeC65aLQZuINYZv4YIN2O15xp9r4sjKShUDEH9GAT0kuVQRFxo
         HGrU33I9guJ1pM7VECqDoTfqsYgwrD+MakM5XgTg0gTN3OeW0rQVaXe40jgy2Yfz0eM6
         FZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=K8HRtfqe/DTpbny1cHPqirCPHy9DvhWS1/adCdvc9fw=;
        b=GEK0X7DdsXGcHkAokMCxVYuIgw+kH//mt2+Up5eRoBA0n9aZQMsHk23JZauYB2Tvxw
         wQZlx5UD1WKwIYyf0guWiH+gTO6n+aeQJ/hecdlIWYoemSjl1dTw0uKz5z3yxxcxBijK
         7DFK7U7FuE0Hj033lHMjV9Zl4ohCdCL3vjQu3agXnux7v8430p9cVa7NTr9JH1vsQxG0
         pYF1JSen6F94pYUrd6rdJBQKV49YeRUwwsZA/ovNzenz4AVZiWgunHL+ydF+DYaVR/2H
         YsBca63GHPMLByrL99Q/GSi9sz8WOvgVjX7l6KdxSLw/Am71xSMBL6CabphtG6lpaMAK
         2s5w==
X-Gm-Message-State: APjAAAV0fCNU9Xm0zK4f25LdAORl99KuPEGZob/st60FrkyAV7AvEDiC
	UAzQ5iW5cE2aSWYBQSH0133av5Kt
X-Google-Smtp-Source: APXvYqx9eeE/66IX+bIUYsQP/lMdSFG1sEQVEyUf2XvGpqUNcw6FQsgQlX4ZGYt5NAiSPhcgImJNsA==
X-Received: by 2002:a63:1d09:: with SMTP id d9mr21471236pgd.289.1556721434462;
        Wed, 01 May 2019 07:37:14 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-189-189.tukw.qwest.net. [97.113.189.189])
        by smtp.gmail.com with ESMTPSA id f63sm67220159pfc.180.2019.05.01.07.37.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 May 2019 07:37:13 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v5 03/15] tests/tcg/aarch64: add system
 boot.S
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, mark.cave-ayland@ilande.co.uk, cota@braap.org
References: <20190430165234.32272-1-alex.bennee@linaro.org>
 <20190430165234.32272-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <83e4f91b-a590-2a2a-bf5f-14b99c5aa0fc@linaro.org>
Date: Wed, 1 May 2019 07:37:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430165234.32272-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: xqdu4s+x593k

On 4/30/19 9:52 AM, Alex Bennée wrote:
> +.error:
> +	.string "Terminated by exception.\n"

Put it in .rodata just because we can?

> +        /* Page table setup (identity mapping).  */
> +	adrp	x0, ttb
> +	add	x0, x0, :lo12:ttb

You are in control of the layout of the executable,
and adr has a 1MB range.  Why use adrp+add?

> +        /* Create some (big) pages */
> +	adr	x1, .				/* phys address */
> +	bic	x1, x1, #(1 << 30) - 1		/* 1GB block alignment */

Do you really want 1GB pages?  You'll pretty much only be able to test valid
memory operations with that.  Which is also true until there's something other
than an exit for the exception vector... but ya know what I mean.

> +        /* Setup some stack space and enter the test code.
> +         * Assume everthing except the return value is garbage when we
> +	 * return, we won't need it.
> +         */
> +	adrp	x0, stack
> +	add	x0, x0, :lo12:stack
> +        mov      sp, x0

You need a pointer to the end of the stack, not the beginning.
Again, I think this could be just

	adr	sp, stack_end

Also, there's tab/space confusion all through this file.
IMO, this is assembly, so it *should* be tabs.

> @@ -0,0 +1,22 @@
> +ENTRY(__start)
> +
> +SECTIONS
> +{
> +    /* virt machine, RAM starts at 1gb */
> +    . = (1 << 30);
> +    .text : {
> +        *(.text)
> +    }
> +    .data : {
> +        *(.data)
> +    }
> +    .rodata : {
> +        *(.rodata)
> +    }

If you ever wanted to make this read-only, swap .rodata before .data, so that
it's next to .text.


r~
