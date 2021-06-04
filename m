Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp1389141lfa;
        Fri, 4 Jun 2021 11:26:11 -0700 (PDT)
X-Received: by 2002:a17:90a:8581:: with SMTP id m1mr6256058pjn.47.1622831171014;
        Fri, 04 Jun 2021 11:26:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622831171; cv=none;
        d=google.com; s=arc-20160816;
        b=EXd49DKnHFQGtQYxywt6HSlG+NOcuU2+ZtAXmp9OWQzEAtjs3Yu/LBMjrQb4arrg7K
         87OckXfq19zQUsF/I6IZtCEWalvJHFW0ppXhtetX+YQVUz2m9RU/xxbZ+ANrCSOu2heq
         NAU0zVU28Kx7/OeuiMqI+MBw2HItnmRuMzVa6XQKlWRnmqHqqlRpXwFKn5Ry/fEZsiuQ
         7bA4mubvku2jWbvvd7l8cI4fiUNCaAJADjFG5NtquC60eqD5Z7IZaV9GMuzr7T7ePChx
         w65t3HJJcLHfLCE4ue3L2FjDQJadQG2KFH46BSr1X9tboqVW8WzH4nKc5gwkMTvxfs3L
         Rg9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=GvKPn4yOmvl3IQQILO5knfcmN49zFoxSi7F3AMeduYA=;
        b=Dyuq5nrADlChEVWOe8G+lN9eqYNGGzjRQABS3KFY8UTDFK8TuyIvRgyWTO6prEYS3D
         tDY/53as8QSQs3ozkR/h1gQFtOBci8ECkWBS7VDfaHX2wMnlb+ILGIseAlo3p8pM1iKj
         j0p+ZayTIA6PQ5hetynuK2lID39iye7CYu+Q9gXhboMdtiF8ZHYb5r/J8ghTzmvxuZJx
         /zvUJmOxdGQgyHk8xpcURZt8r0trifWoPVaS+lCSvuFVwzBeY3wRYgqAsqbNrG2+Xzqv
         TWtK9J4vzCnXhJDBPp+Rzr9qTC1fBRGXwuH7PofnJVQj24zq1Zzy8mfOm45t5Bp1ZBKC
         cITw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f6bDALtL;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u10sor3990683pjl.28.2021.06.04.11.26.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jun 2021 11:26:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f6bDALtL;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GvKPn4yOmvl3IQQILO5knfcmN49zFoxSi7F3AMeduYA=;
        b=f6bDALtLxCc8SHEUsQWemQXMS2fdXgqTnY4JBIgcTVHJkPeOUonn/A2LlLQ2LDI6QJ
         CQLXDpO2NBPEGiplSw8BS2QzbDhfQlPkpV+OL/MJLErJIkgqhTlTlFScfR203n10TOqi
         HF6ewuXbPxauOlK3HWb3adKf1wG8m/Vx8CklvRCXAc2TtpN4xVmo6/Db6cIY8/gabt1m
         LGzr0FvogD0ebRWFiMkU29RlRsSuUbZL4atfSHL6JQsOjuJmDbo76dmYN+hpHff7EWKJ
         wRjJwNOt2xKwkAS//h2lQNwwFyHru5YhhzUYB4rfFYTjzNJEOFWDknUZViiDSt/FebMX
         CgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GvKPn4yOmvl3IQQILO5knfcmN49zFoxSi7F3AMeduYA=;
        b=IP8ruvmtIR7RTk3IbNXyW9z0TwJyqksKDJBB61ixRr59OSZd4VGQrrkZ1r7df5USd/
         Wy+u4t3U97MyicJP7pYhlBwN8TUiB0vNnVav8ClXT5pQAn6MKfSmldQxBPFtO99rfqYt
         +dwvNt/KtyTyBmAOBvhP6ChhzQh/NCwynCYoOjkBbTiXkHX0VOe+/tnBPYUZ1Ll6KaEw
         Z/ywi9RU8Eq+OGZHHjWb/b3MeWU6PLG+Xs0txlSI3qvLOHXrGINgQ5KoqCT5bnWdWjtr
         cVIXteAZFYliZPTCwLXWy21qvyQj/u9RZ9FX8tOM/NxTDte1B/w1c5IOR15g3WFq5fig
         sHng==
X-Gm-Message-State: AOAM5314q1hURiRaTM3s9jPkO0OqWiqY8EsPsXqAf9U4lfPqEqm9f7jR
	YfgeGStOhu57e5btFG6UAUp/NG3R
X-Google-Smtp-Source: ABdhPJwesw7+AZ/Wt9dL9xKepjnGD+RP/BzH+17JmNtHlA4guyJ0QbFj0gICwhlFxFPA+hhlfLgXUw==
X-Received: by 2002:a17:90a:e94c:: with SMTP id kp12mr17962191pjb.134.1622831170493;
        Fri, 04 Jun 2021 11:26:10 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id r19sm2224598pfh.152.2021.06.04.11.26.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 11:26:10 -0700 (PDT)
Subject: Re: [PATCH v16 01/99] MAINTAINERS: Add qtest/arm-cpu-features.c to
 ARM TCG CPUs section
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <915aa9b2-023a-0265-7faf-3592c4607438@linaro.org>
Date: Fri, 4 Jun 2021 11:26:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: d06O9plrFFbU

On 6/4/21 8:51 AM, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé<philmd@redhat.com>
> 
> We want the ARM maintainers and the qemu-arm@ list to be
> notified when this file is modified. Add an entry to the
> 'ARM TCG CPUs' section in the MAINTAINERS file.
> 
> Acked-by: Andrew Jones<drjones@redhat.com>
> Reviewed-by: Thomas Huth<thuth@redhat.com>
> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20210505125806.1263441-2-philmd@redhat.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
