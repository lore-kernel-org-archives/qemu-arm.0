Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1005934wru;
        Wed, 3 Jul 2019 09:38:07 -0700 (PDT)
X-Received: by 2002:a7b:c251:: with SMTP id b17mr9057604wmj.143.1562171887319;
        Wed, 03 Jul 2019 09:38:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562171887; cv=none;
        d=google.com; s=arc-20160816;
        b=FnJu2uArYDhsv+Agxade+5Oox+gIywXOa4elB7oT79mmOX64DNQTLs5KRpzUHp2xRY
         hiYyVRjf+iaeRMslQzwduXe5p7ts1JAOw1keZ2I5FUadj/nwumJoDJUyTc/Zw5XUTw6M
         AaDfNGSw6XSWrgjpRFAsxElNi/W9n9DA98EKWuJ8Q3psM1787LINgFMiLXucOheX+abt
         WSOhsvlAVwLo+e2ogjVEp9zKAMInKokoRZz7MYl8tU0axor7E2hgWYLl89ERGqtHvaT5
         PkKvRzGPhiRIohe+u6FZ8Ly9WTXTDozFLvrmLi5ndLGVf0GtrHW8JPNk5gjSEVVDWiiY
         LZWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=gqWP5SSxGp30JFoetdke1uxckIrhx8Qe6PCmPcFhYOU=;
        b=TvlE/5cV6qRRkBQSaCIh+hz0lVAu3ib+ny0WdqeFIM8TMcdNVBuIzqg7TwZilxISA4
         6icYZ2/H7TuNjBs/Vn5VvZUU5Zujkn6oQKQGkUG37V8CcaUdA0kqsHbTBPCRJTDfcaOq
         feJG59d/fKy72yB+CB9+VwLtV4ZTsK6SltNnBvSgigWyBeyVN/qlr88oG5dsKNlnWf3O
         f/mhGn0cuVgYgUVsOxIAItNv00a2ZXyVKb5ineRLwr+Umoovy6b/QgSweIfcXNd9tO+z
         SRosiHyIsMWERvcC3WPWPd9I9QSmT4+18jF9sMFJN2OgSK2gMLFattsThiR9FfqPT8E9
         hHfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q9GhwxeO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m10sor1617887wmg.1.2019.07.03.09.38.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 03 Jul 2019 09:38:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q9GhwxeO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gqWP5SSxGp30JFoetdke1uxckIrhx8Qe6PCmPcFhYOU=;
        b=q9GhwxeOZQ6iJ4pgbieZLlPwoZS+C417h+RqaALivtElu0414ND9Js44VOl65Vj4Ld
         liIwnzn2NdX6CPYt1RU+ucWaktsfdwfy+uObLkQKXUdgECxV+sGD1JooeqdbpU9do+2b
         VIlhfyAzH4XX+gHkCTgnrZZy0L6BVlSL9n72l9QEYZJmoicX35eD4LVmcKE2bCrzaKeB
         EoBQPk6Ylpa4hdDjYlX8fGhWExicFei07HfxUbJIOThUPnng9XpBshslMtaEVObOEZ5o
         SvM96F3NLK+X6L2J8Y0AI557U5RqMRatmwS21CSEbKD4XUmeXBBxQ+bM5n+KcdaF4c9y
         NpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gqWP5SSxGp30JFoetdke1uxckIrhx8Qe6PCmPcFhYOU=;
        b=NMIKl5CT2SbaIM8uHQrdrDSPbsauXu4xmX1HsvnIKltgQSHZKDAj/EQe/5LbGIpGBD
         ewLi0+kTvnDxQdsAyp75PEdGNxVcdHk/8eNzYa6mlkHHicR6UgSzTBFd5tczt3/P4d60
         VIOszx4IGO6GO8kXYpTP4Sq4jqp41trOsXCag+WVaZc30Gqv3VUhdtfXWwcQB+z4DxAM
         +Xw+BKHaRDgUbjRHDI/F2gxbniuOGu+UgVXa10iEO/5TlfrP48vH/31ZGuUgIyTHFB29
         VmEgmDkmgeVE/lZS17IL1us6mqQ+oXmsDbrj1DKhW8eo0i+WippGISAus/D7MY8DszJ7
         osjA==
X-Gm-Message-State: APjAAAXZphIserwFS1bZBHQcFxWoccmtZ1l9P+3e8bjGKnwHI7jnmri3
	HB7bP+HaB5zrvV/1B2gfh/2onodJBHm57uW+
X-Google-Smtp-Source: APXvYqyYTve4Xch6JLJU8wAwpPWz/AtazX/D1FvgxxRIwzRcSz7xpdqm6Ws1yOKl0z59iHC8TyPD+Q==
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr9224055wmj.64.1562171887020;
        Wed, 03 Jul 2019 09:38:07 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.3.43] (93-34-153-63.ip50.fastwebnet.it. [93.34.153.63])
        by smtp.gmail.com with ESMTPSA id 18sm2744321wmg.43.2019.07.03.09.38.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 09:38:06 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v1 4/4] target/arm: remove run time
 semihosting checks
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20190703155244.28166-1-alex.bennee@linaro.org>
 <20190703155244.28166-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <86d34c45-8a94-2d91-2e23-a3e6d7f8b116@linaro.org>
Date: Wed, 3 Jul 2019 18:38:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190703155244.28166-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: P4ryNbWIM5lC

On 7/3/19 5:52 PM, Alex Bennée wrote:
> Now we do all our checking and use a common EXCP_SEMIHOST for
> semihosting operations we can make helper code a lot simpler.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/helper.c | 84 +++++++++------------------------------------
>  1 file changed, 17 insertions(+), 67 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index ad29dc4072..5c1f741380 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -10364,83 +10364,33 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
>                    new_el, env->pc, pstate_read(env));
>  }
>  
> -static inline bool check_for_semihosting(CPUState *cs)
> +/*
> + * Check whether this exception is a semihosting call; if so
> + * then handle it and return true; otherwise return false.
> + *
> + * All the permission and validity checks are done at translate time.
> + */
> +static inline bool handle_semihosting(CPUState *cs)

Drop the inline, probably.

Since you are renaming away the "check", perhaps hoist

> +    if (cs->exception_index == EXCP_SEMIHOST) {

this check to the caller, change the return to void,

> @@ -10476,7 +10426,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
>       * code that caused the exception, not the target exception level,
>       * so must be handled here.
>       */
> -    if (check_for_semihosting(cs)) {
> +    if (handle_semihosting(cs)) {
>          return;
>      }

so we get

	if (cs->exception_index == EXCP_SEMIHOST) {
	    handle_semihosting(cs);
	    return;
	}


r~
