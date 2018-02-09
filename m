Received: by 10.28.71.27 with SMTP id u27csp1239819wma;
        Fri, 9 Feb 2018 10:16:11 -0800 (PST)
X-Received: by 2002:a17:902:61:: with SMTP id 88-v6mr3430409pla.428.1518200171138;
        Fri, 09 Feb 2018 10:16:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518200171; cv=none;
        d=google.com; s=arc-20160816;
        b=g1wqwicchDMbk1F9/9I92OpYyKcp2LUNl0nPvlxl+JwxUQPSn2Cizc+M0qnWw7TMCf
         Ikp0U5/fHyM347w4CKJkoJPtXgoVHRq3uTIgPNTINehT1/PwX4exy51+3mbvUsJvYVRA
         YqksH6C++mTldFWIoueFsGnrAX9r6b77WnpKc1UXS90O9PWWb298+rULDdJy8A/jRo1k
         xldsIvuk57c72gPLfqnRRdOwe47OZSWYa7i6/aOAYjvfnhKX740wtHJ30nbtGRDukdqp
         zXDn4dwVhfLlzhDZfgxgCzxZH9WdBuMXME/ZtIHfVJWTHkqMljtVanh2LstoQinUTPLx
         iFCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=KgoFzzz0RukG/aWGcLRRhYXGC+GagDco2iDwGw02VQk=;
        b=bORRUdnqWb5TtqIgDnAtM1ga5jVacYToC4bUywPu+ezHs/NuMg84Dk4XPRNVM9xfET
         P4xio4NESKrHRgBtj6XmusmI74KnJB5APJeQEJ7uYL6sv6EZQ4LJopVzFmckBxwWaa91
         cbFQDLqx0etUYaG1PuanUEdJGYbQTQpQ36o/iKNn68GqyUlfn35TYWa4VbvCOFsd6clR
         x2XnZ/e1vHUMB0vAESH2xyZRfJAisXhb+Uqvp7WtNa0/cngpwInu9OfR9L3A6tloOZ8X
         SvHl2Av/UrLS2G7j2EjmeWcznQkdEr/onkTSWvi0M4uau+Y8IgV71TCKGFz3i81Bj5YI
         dLjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OrvprRSh;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e82sor857098pfh.17.2018.02.09.10.16.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 09 Feb 2018 10:16:11 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OrvprRSh;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KgoFzzz0RukG/aWGcLRRhYXGC+GagDco2iDwGw02VQk=;
        b=OrvprRShnj/vtP+WwtOVPb6Iu4VYkwmIZihZWFdDyxlJY25vBN7utWk6/uE0m+mTTE
         cJcZDQqYFV0R1KuLST06UcFs+59AZHJ0ZhtvZbjfmOtJpjTMvkAuYjxTIjXgHBJFDf5d
         +Jh4wIe2HQ2pA63Wd7DHmp9HgRMaPCSybtE0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KgoFzzz0RukG/aWGcLRRhYXGC+GagDco2iDwGw02VQk=;
        b=Vtq4TedwS6n+oJtBviev5xTUqEzpOcL85p6C9rpP9u63EtCvaUSTTHz1pn4ogr6VBs
         fiR6AVKeII6sYDglblZBPcaV5M6PjSdphTHYNeuOlqZTX2Vzhz1EXaSgaD3MnZg2n7W2
         WrMgxuFCTMDPy8G4AhNfSsrvZljEuhPG0be7WMym/wDRqdKA2Lm0djfUy/Sgiw9KBbis
         9lXtnEvsM76MgsmHXtZRTd1KITiTGh0yquc08WvinsP2Y5chpor2xXzrb0gJqfEmh4cp
         jEbRBScZ8VKJdh+THfwIqT/MPjZWYifzRt8FgPoLg7bDqVBD7vzai16We3NqjqotBY82
         VnQw==
X-Gm-Message-State: APf1xPCTYAGVSnQ/5JpAle6jf4NyDRZUiSgVZ0J4WQ4lHKcTDHEezInC
	0M5tFFWlwh5C/CXDp3kmBuNrtmo+tY7AyQ==
X-Google-Smtp-Source: AH8x226bReshDsEnRJtyYF5gc4T941eZFeRY3cZcRlnAdx0ohjuNQMys47jyWo7JFpsmkCRrmnxr0w==
X-Received: by 10.98.75.11 with SMTP id y11mr3670306pfa.169.1518200170712;
        Fri, 09 Feb 2018 10:16:10 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net. [174.21.6.47])
        by smtp.gmail.com with ESMTPSA id e9sm6392436pgv.14.2018.02.09.10.16.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Feb 2018 10:16:10 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 27/32] arm/helper.c: re-factor rsqrte and
 add rsqrte_f16
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20180208173157.24705-1-alex.bennee@linaro.org>
 <20180208173157.24705-28-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0d8edd6d-663c-786c-c2b6-d96e76333550@linaro.org>
Date: Fri, 9 Feb 2018 10:15:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180208173157.24705-28-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Ew6tamCk08Pg

On 02/08/2018 09:31 AM, Alex Bennée wrote:
> Much like recpe the ARM ARM has simplified the pseudo code for the
> calculation which is done on a fixed point 9 bit integer maths. So
> while adding f16 we can also clean this up to be a little less heavy
> on the floating point and just return the fractional part and leave
> the calle's to do the final packing of the result.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - checkpatch fixes
> ---
>  target/arm/helper.c | 221 ++++++++++++++++++++++++----------------------------
>  target/arm/helper.h |   1 +
>  2 files changed, 104 insertions(+), 118 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
