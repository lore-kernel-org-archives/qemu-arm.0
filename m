Received: by 10.25.44.15 with SMTP id s15csp3840607lfs;
        Mon, 10 Jul 2017 12:52:18 -0700 (PDT)
X-Received: by 10.129.74.133 with SMTP id x127mr2115634ywa.42.1499716338173;
        Mon, 10 Jul 2017 12:52:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499716338; cv=none;
        d=google.com; s=arc-20160816;
        b=az2YrBLbV6JxHy1YKh+r9WCxKPA6GTHLhNP9rELQLrVNqd3OR553KEAV/woyyQPACk
         kbikNr6Rz5z9qw76fQcLcKD61EHIjimcgQnMDC4HYOrrlyN/LKnBvqqRzSMj5dI7fiIj
         gxlkRGEwunAyP1uzNxLnN1f3V/hi3KqEizD+/eeMZkN/oLKU+Gc8INnnsjiiPg5IKDUE
         aQhhGFR8CFO5hABqCaOLeCHYSUlPsQL/aD3bympJgVef6Fj2ST5VK4XjdQQLRVFJ9sza
         l1QpK0iAzzX6AxE1f9BQ9shvztvd0UNB+kumHSpgvcWYHxgU5VuXDmAgOHpVsAsKLGCU
         ogcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=XXIQDdy4PEVIupXG19nhl33eND8uLjfPvHxjijQU1jI=;
        b=SCjQ+UBwgj/92nN1jKDOUxJd5vdpYzbPFHELrELpHazQI3jyhHKW2OCZ7cVLIj2YUu
         2wN6Nfkfjb6iFhei6YR8W510dKbnuAGiBiojoIZ3WqEt/PN3jv+xXk+Pqec/TaNc4LC8
         7Ve9naIgfqwjn+Y/dpvQbz1VZmqsff6ZOqqIC+eF4kBTU/5ao7n5sbSzkCzZublMTwod
         8E9NmvuwNLBk4tfChTZLWnO/Yv+E0IMbJTns73n8bTGYTnCYXNc8Q/ifb/JRn0J80h9a
         cq6nltOMNJyqWv9tNAMh9HNtdkx2swDO/KwYR6EDgNn7xv0873v13qhPNcEwn7DExTWH
         CBRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=tYttLU8W;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com. [2607:f8b0:400d:c09::242])
        by mx.google.com with ESMTPS id b5si3377012ywa.116.2017.07.10.12.52.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 12:52:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::242 as permitted sender) client-ip=2607:f8b0:400d:c09::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=tYttLU8W;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x242.google.com with SMTP id 16so14216438qkg.2;
        Mon, 10 Jul 2017 12:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XXIQDdy4PEVIupXG19nhl33eND8uLjfPvHxjijQU1jI=;
        b=tYttLU8WHyvAdFks2T6j0r9uOOXX3Et9RmnMmiSrgAN+BhcHxTERLzK6/aFoxazexb
         rO9iWwUQUCEwEixqvMK2+P745tU25YWs43MZDCdCZ2LBOM/CP3RsPlQhD6qLXHb4thN7
         yMvYLjdrA4Zg0F14E5PjHWlvwvMCFyIeuhmZdVtCA7WjFhHWbaWNo8e9f++GoMIYKBEZ
         /HRPAhv6/6hIDewfEues3I/vmLGBQUPgjHD5vqd40HyZPhFe/xPELlZDTjxDmMim2Bee
         r+N2SA04DXxaQJeI2eXlX88MxE57OvPyHhNANg1vjz+0hhQZV1ENrlqI58yEEhLUHLbL
         yzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XXIQDdy4PEVIupXG19nhl33eND8uLjfPvHxjijQU1jI=;
        b=afnk7AgnkXS5l6AjHyu6tVTE62OmqBGG34YtIp48N9IDxvGZjnZrRjy6P7dvHHwFqH
         soR4199dHcyXzT6EngyS1Ws4ZLfymVe9PyRqQ1wTU9b8BlVcDC9iBTV4tg07UoBK6cdT
         +pvtO4ZwNd1egdBQDDzGdaUzN+RCv83fv8Wutl0ZuFjznPBG186JG2tuMk5tx8/BI4xQ
         tG1oxHItmvvNrPsywG2+UBPyUZ2DtXhlep0SdB0cgkYxHT1Sl04Fkn2uMogcSdLzh2ad
         KEWEbhmnB2HwGb2ZvYkuY6EbhBOK8wKvgt/B8l1V0aDByyQ/ZpRkhEKt4v4oPYjXRc9Q
         FsKQ==
X-Gm-Message-State: AIVw11072A72eIxwF3kUEbzr7d0Ohq+oPTdJkGLpE2xcnWV7ZGXJDcxw
	aiKr4atmV9CTSZtasAw=
X-Received: by 10.55.157.135 with SMTP id g129mr5759175qke.241.1499716337781;
        Mon, 10 Jul 2017 12:52:17 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com. [173.197.98.123])
        by smtp.googlemail.com with ESMTPSA id l12sm9843154qtl.24.2017.07.10.12.52.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 12:52:17 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v2 3/5] target/arm/translate.h: expand comment on
 DISAS_EXIT
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org, cota@braap.org
Cc: qemu-devel@nongnu.org, "open list:ARM" <qemu-arm@nongnu.org>
References: <20170710192128.9048-1-alex.bennee@linaro.org>
 <20170710192128.9048-4-alex.bennee@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <82189fae-76cf-0f28-50ae-5150cd595176@twiddle.net>
Date: Mon, 10 Jul 2017 09:52:12 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170710192128.9048-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: fpa2/9IzV5m2

On 07/10/2017 09:21 AM, Alex Bennée wrote:
> We already have an exit condition, DISAS_UPDATE which will exit the
> run-loop. Expand on the difference with DISAS_EXIT in the comments.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/translate.h | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
