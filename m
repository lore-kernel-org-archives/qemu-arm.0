Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp1475179lfk;
        Thu, 10 Feb 2022 03:15:31 -0800 (PST)
X-Received: by 2002:a17:903:41ce:: with SMTP id u14mr5817465ple.49.1644491730856;
        Thu, 10 Feb 2022 03:15:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644491730; cv=none;
        d=google.com; s=arc-20160816;
        b=1I0xmOsuUlc1MmbriM6OoPQ4ruUxWy6zH0FbMriTHn7oRvrQDe4uxsJDRDGhpvg4GZ
         pHgpIiUyCRj7gTMge1BYzj4X33VDE70I3EyGkh6Qew+Ksj0oniyGuneHFluzWWEFFcEU
         l7g4OBvyEfhYzySwAm2o/YqAwVFR7HsilkZkwVq6mQyKsnHglqzlEpotTRo+zJaASkUF
         1a1MWT9foeBauhzMC9UIedbDXr6b4FA6O/dOlIzu9pHftGMPkJTKL0RjC6iNZV1X9qI2
         o1LkCYOsz5vLL5k4xx7Ah7mDUh81+6KRI7c7XIEvNIqk8tsnrT34Iqu0jzWdt7UtgOfH
         /LSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=k09n8+8FHHuY0lQRChijzRExEBMMBkK0+iAxH2STtfU=;
        b=jshyFRoqMMDxjW9/GP/UHU1jTsHtFYvVIqr4IG3YTX0LuGj78VPuzNiLG+0GacwfUK
         JW+hNsCgA+ntFPXotiboXxvbJMUkxs2lFfeWlTcASGYZyQ8Fe8lr2Zl4KAV1dhmFxOf/
         Wc7uJPpaznwOlayrII7psfOpYWjftcDw+Fa9OS3nhqCAfAa9hCPFU5tcmFwe/ZilEhDd
         fqTdG10PAYTDC3tiY0bC/4Xtpc/0Rmdg9l5GFVS1VNuVv/ljxh2I8y9e4PcBHjw33aq6
         HQxXrSXNaLbWLgDWNPbq8OtnxVb4t7gBegwihj6hVQ1yiETEp3+YDdAfOtwE2GraF8DK
         dWTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=egs0O9CK;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x124sor2125114pfx.61.2022.02.10.03.15.30
        (Google Transport Security);
        Thu, 10 Feb 2022 03:15:30 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=egs0O9CK;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=k09n8+8FHHuY0lQRChijzRExEBMMBkK0+iAxH2STtfU=;
        b=egs0O9CKwFy01kmt75D0oxwqOafyNM5Tf1E2Ldz+7SFlskbuxcC9ZIO08i5E6xA7Rn
         VOX2S11GtK3NkzxTkAfW+DlStUBiark5SiTsDbBjlxpUiNZQQOEgI5CIb8r7MEGns/Yd
         tv4LdQRH6PhebFWYUemTWnoW8DEUPE9f18QN7LDFzjr6e/XY7p2e0aWL7oTC6vb3GjxX
         UdD+ALXSqslj9QqdF0nDtQDQ3t7IAjDSRpRyK0sU8r2SIxH0TM4Tin0yJVBQpsr4HGBK
         FdE4Z9gJxWRsxHiwrSE7lciS57khfkFd/ycsokg62Nlnp2fh7OVbqcJCFDfFCQIymm1l
         A0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=k09n8+8FHHuY0lQRChijzRExEBMMBkK0+iAxH2STtfU=;
        b=i6ZQURakMwI+5BJfGnP8cITkA3rhKZnuVBcRQSjhVcKVG3vXZzBDOt3l3MqdoJ3dhL
         Sbklz05/mFY9UVAFoSIwsCs7NfMymQubIThbnZl0OQWb2dBTQjsE6UbI5TXP4KTI4sP6
         8pgvtNNzAll+EhZgMI0aLBm9ssm3JWUkUdynyhKFqR7osRZbbnGzhPXTY5ZuIoMkmPx+
         esqeFCp3hJfLOYLElhx1HsTGU+PzECFCN+dShCX07oDvOVvStKHZK9KxNIYD2LdsUzdi
         7+ropGJQfU2BmrBqKnrTTwRjOglfVdLYvjxKeWBXWmdyAdKKsaWL0b+8cb9JOKdXxoxY
         ZNBA==
X-Gm-Message-State: AOAM532hAFxrC9qVCUZK2d3B2Fs74hSJYGVzcB5UJltVn3SwrQTRqOzc
	ly28sh/DkEa3lVXVz2LAzrJc0Lt60No=
X-Google-Smtp-Source: ABdhPJypfpoNalKDsYc4kC5T6CM5OdsQPDfo+BHhD24ioZQR4J1iK6GSWHH+Q1rENPi6+TsjlEUsmA==
X-Received: by 2002:a05:6a00:1308:: with SMTP id j8mr7018515pfu.34.1644491730116;
        Thu, 10 Feb 2022 03:15:30 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
        by smtp.gmail.com with ESMTPSA id v9sm23592325pfu.60.2022.02.10.03.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Feb 2022 03:15:29 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Message-ID: <0db34d17-faa8-1355-3580-c0ab1e4da82f@amsat.org>
Date: Thu, 10 Feb 2022 12:15:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v2 01/15] hw/registerfields: Add FIELD_SEX<N> and
 FIELD_SDP<N>
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
References: <20220210040423.95120-1-richard.henderson@linaro.org>
 <20220210040423.95120-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220210040423.95120-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 1g5P3dP4G0oX

On 10/2/22 05:04, Richard Henderson wrote:
> Add new macros to manipulate signed fields within the register.
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/hw/registerfields.h | 48 ++++++++++++++++++++++++++++++++++++-
>   1 file changed, 47 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
