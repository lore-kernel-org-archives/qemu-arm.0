Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp5970303wrh;
        Wed, 1 May 2019 07:50:35 -0700 (PDT)
X-Received: by 2002:a17:902:e293:: with SMTP id cf19mr18814648plb.151.1556722235632;
        Wed, 01 May 2019 07:50:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556722235; cv=none;
        d=google.com; s=arc-20160816;
        b=V1RZS8jqzgt1rveDYfmfo4UtMr+v93eLpzmgmOYYcoc7yHMDua9KGZiZXZkoI6d7GS
         StTPkMkaWuB+BIS4oNcAgYyWVvzz3KR6XAiIJPbrfEfxkTfg5baD7gQfxC90rgV27xA0
         EWNnStdRArP6bWwYJPuowL63R928vJ8D37rQ1QMLX2pqGC6NGsFi6QE6HsUW1niINyYx
         ovE7va+5hC2xXlZPwkmKUUpCQ+XPi7/Jy9y/6XfRcGtGFG3/GGSmWzIlbInkcOqKvcKr
         S04nmbEEyCiYkI3uY2dzFzCT7qWRNYIdfrBAl0fBPvprBPY5r2dd8zJM+ILnbwYtcREK
         yOXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=IOAkbCcQFdqXOsIVHmJhxaHx0qbrWozYia1wPmyXSt0=;
        b=ELUfYxuupxz2iTmx+Xfb8vNOe3UWQXKyAzPy0ohnu91KKF79EhUOUeYWWnG0ibO8bE
         V1dcdg1Lal+XNz3qb8Hc150AGzdkKV+uIubBKxLRLwp6wfNghIBQB3QeOqkwf+IZ3um3
         HVC/DMkCL4hCVUmHfRV1F6zu49yuMQkGzf4XQPC1nmG6jRJr2d6LylC25mPQ9u3nLd/v
         Ui8sVnkJ5j/JrdzWCsa4WIiTJlPMSnNEYYYV4Ec6wTQdTaY2KPIZmocpyR0tjWjUs2HQ
         ZfvhWuni/IS4inhzPuasxcKK8Z+UmrIouDHYT4vBLopPUpEkvE02bd7dFgQdbj1O43O3
         7O3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="oAxuO/9b";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v24sor44257973pfa.57.2019.05.01.07.50.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 01 May 2019 07:50:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="oAxuO/9b";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IOAkbCcQFdqXOsIVHmJhxaHx0qbrWozYia1wPmyXSt0=;
        b=oAxuO/9bGz/Q22bK6A+p0o07gvdlBmGzgMmWN3O14PbO1hX8MpJybCfo2NwMuOmGjz
         qfWu96xbJq7ZtnIMYrPRWFwtu+tAHXnZsCBPBmkV0PtyjY6aMqrGUd0er3EaWTSEQe+K
         UKrej/i3y3uePe+QSXzaxYfjrLgZuj1jgilese6oQnyMsTIaQ5UQFNS4Tzu4NrCb/VIC
         KVeM40KhkOTGEceAgQ9mSzDMnwztt5HqkLk1thjrxOOUStzS49RSvoFsbfZ/bg4+NkhY
         zE1AvHfoghNnMO7Lv60MdfF1r2/YY5Cd3fn2cCkXwWqokGnVuR1PhFvSdVwzbtGc5ewz
         2NSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IOAkbCcQFdqXOsIVHmJhxaHx0qbrWozYia1wPmyXSt0=;
        b=Dom36dGUKfSYAXDz+V62hFWPZtu1Zz+DTWGDTgwrqSqA7g3268F5tFjkmpH5WorMUJ
         8cdMthOvxSHo59+M6iiEWl6CEeqIaAkbEogUy2vowpkjD7t+UdLY/Rt35Pgqz+kuZnEd
         Dt1dJ0zztbqsx+Jll3IzF25r5c82GDm+uURWeauPOF0zLDTygMo1e9bZ4pOKl5OIkiyp
         Q07ATYNesVBYLP+iOZC7MU3/+0Sjo8GOSS1VMoA4RrvNoPCx1139Nf7WguRbpybgDLLG
         fmUVQWGkjfjawbC3P2MehZyuGi8mN+cgfUlhpNtkj+fXxTj4eO36LiiotybTYKPuVCjO
         SRWw==
X-Gm-Message-State: APjAAAVBxBKNhODhfW2eswOXqpbhbfexPYyoO6p/PWnmEMEmBwFRil+D
	0MLcZUY+3V6JWTYMnfGfLbDUN9Yh
X-Google-Smtp-Source: APXvYqzMOzo9IqtYUd8ZPAbKAq4rjyAYK3ErUScr9YYf7IOgAmAGrYA+pBo2RKFecuwVIMrY9WWvKQ==
X-Received: by 2002:a63:f115:: with SMTP id f21mr73534705pgi.65.1556722235156;
        Wed, 01 May 2019 07:50:35 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-189-189.tukw.qwest.net. [97.113.189.189])
        by smtp.gmail.com with ESMTPSA id o15sm18018005pgb.85.2019.05.01.07.50.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 May 2019 07:50:34 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v5 15/15] Makefile.target: support per-target
 coverage reports
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, mark.cave-ayland@ilande.co.uk, cota@braap.org
References: <20190430165234.32272-1-alex.bennee@linaro.org>
 <20190430165234.32272-16-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9cb38f75-291c-b30a-b009-532e3b56d5eb@linaro.org>
Date: Wed, 1 May 2019 07:50:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430165234.32272-16-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: jU4LMt0gSnmX

On 4/30/19 9:52 AM, Alex Bennée wrote:
> Add support for generating a single targets coverage report. Execute:
> 
>   make coverage-report
> 
> In the target build directory. This coverage report only cares about
> target specific blobs so only searches the target build subdirectory.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  Makefile.target | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
