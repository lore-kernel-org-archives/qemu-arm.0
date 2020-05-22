Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2164922lfb;
        Thu, 21 May 2020 20:05:42 -0700 (PDT)
X-Received: by 2002:a63:b10b:: with SMTP id r11mr10251591pgf.27.1590116742281;
        Thu, 21 May 2020 20:05:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590116742; cv=none;
        d=google.com; s=arc-20160816;
        b=yIwfQc6fnSGfV6iWblWsZXfAGNjUkiLo3on2qH4uQ5Gq5HkPDedMJQlaC4RSt2LX4o
         C5v3zVD1suOmEwIkmvT4Gm0Xj4LQG/XK7Rhgr4/Pq9DgVkKa+33SWpi9r2OBFIywhvst
         19DirznW6uQa6X3TiS6lGv5po1UIc5kwYu8MQyHaT54qKMoIxCpLf5eXFmcDcw0wdx4V
         2micBbNNz9367X7IERk/nmo8WhwdueKP3WlCPcqug0NT5fz0ga2GyZucbqIWrbPdwvBp
         p7FlVHVj3A5+uhdj1Pnb6Q7BZp8xKQhv9ixhW0xCkwtQWy/hMXgJEFgE1yNKX/WnBJbp
         nK6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=zDI/cC68y9Xtb2dfQ8wJ6nYgzR1AdykJatDlMiotk4o=;
        b=wYEIVgnxOKXIoAGzSapkbHuKA8HcKN9h6ZIqVvAGSD0PDxWpS4gBnUcN4xYRAJKEKy
         UUnAxBAnceni0xDoaiTfeLRc86bflq+RQSC2d5W1eBx/5dUVqf9tl/xzUXEC8Pa2vmEG
         fkcOUqz0Ph7/JyshToMZTfJIgaouJ92wYSXIrzapKAQKQzI8JUUclhhWi76+QDErM1oi
         RQvWBIyDTa3siYjLlpl2mxB1tLY1p4qGuw3S12MOZHyxzNfKNj6Bqygpzgq5kkw7DXHY
         +XtamSsAGhobZfyjSlXYdwzEDMXCOE9UfYEHlA46FDCLz7iRj4SuLQvIy35Ocn1kFCVc
         dWQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DXYim05B;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id bj8sor10226048plb.68.2020.05.21.20.05.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 21 May 2020 20:05:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DXYim05B;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zDI/cC68y9Xtb2dfQ8wJ6nYgzR1AdykJatDlMiotk4o=;
        b=DXYim05Bm2ACQi3qSPEKTtqzDPRQSCXW0wwYwM+CB7xM359QW3DLVT9ct5UAY9pol0
         21zfC5x2MiAT/OQFwB0aXQ3yq9pM6Bs2HwzjDOIPIXb5hY85A8zAJqC6enP5ixzypb1E
         gBQyYHDsqHZ/I7k9GubqPENo1lD8GChbo3oV3sESU5/HG9iueAVZm49Ofcyqg9Baqs0B
         p1KcWVHG13NTqwpHZJOLTx/+c/2udDT+W8b0b4TZaMicu+V+mKvg1Qwd8DSpv7+mOz5R
         m+qqAdKpaCS16i7tYBgJAXDOZuOjS3eLi7JA/36Sxavb8oBIIPi4WiCfH7OpqoN2/mx+
         YfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zDI/cC68y9Xtb2dfQ8wJ6nYgzR1AdykJatDlMiotk4o=;
        b=WAeWnDB9KIV08km7Ya2p6PMSjN41hNxrr8x0U/6T+4Wa5XVssGKsYxkwjEJpOVoOlF
         W9gJW5FVrg7l200Aq4Z3YNSlFpYVIcM9P8GyDwYe918SfQOP/tln2vIYEEgHST8HJeSt
         SK3bpdPZiFvKkfCTwFnSiFUU928QOryT01rZu7uAC94+EsYmKPOFtnRuld2BNbS5qpFG
         xAS3FbarysFn9YVQSmRPFsQmf64Rp+RhlbKd+2uUg8h4n8SHr0TELbisr0jrX+Tv4vVQ
         N3vjHNZf2tP4eZGth7bIgIzJb4m6YL72tGW7qDvLjiZJ4x6TbhcSr1hKSK/J1+945vpd
         HTRA==
X-Gm-Message-State: AOAM532LajAcd6wNqLS+764sOa4xcD6dkMzsKHyJS4w+4Ft6qCN5kia2
	DwQuMtsZ7DlngTmPWIWTVse7YxallLlBBg==
X-Google-Smtp-Source: ABdhPJzd+kEdinQGknB64k1M+iuG+rxDtU4XIWHpqBd75197uas6LRglUC+BaoA87BvGKZ9A9QS1/w==
X-Received: by 2002:a17:902:9049:: with SMTP id w9mr12911487plz.27.1590116741377;
        Thu, 21 May 2020 20:05:41 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
        by smtp.gmail.com with ESMTPSA id p9sm4994707pgb.19.2020.05.21.20.05.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2020 20:05:40 -0700 (PDT)
Subject: Re: [PATCH v1 11/15] tests/tcg/aarch64: Add bti smoke test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20200520140541.30256-1-alex.bennee@linaro.org>
 <20200520140541.30256-12-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cbe6d55f-b593-a802-f0e0-8abd63d4a4f9@linaro.org>
Date: Thu, 21 May 2020 20:05:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200520140541.30256-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 6Ii5FDaq3AmO

On 5/20/20 7:05 AM, Alex Bennée wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> Requires gcc 10 for -mbranch-protection=standard.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20200520023139.9812-3-richard.henderson@linaro.org>
> [AJB: add CROSS_CC_HAS_ARMV8_BTI check]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/tcg/aarch64/bti-1.c         | 62 +++++++++++++++++++++++++++++++
>  tests/tcg/aarch64/bti-crt.inc.c   | 51 +++++++++++++++++++++++++
>  tests/tcg/aarch64/Makefile.target |  9 +++++
>  tests/tcg/configure.sh            |  4 ++
>  4 files changed, 126 insertions(+)
>  create mode 100644 tests/tcg/aarch64/bti-1.c
>  create mode 100644 tests/tcg/aarch64/bti-crt.inc.c

This should be dropped from this patch set.  I have adjusted it and it and
posted as

https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg05891.html


r~
