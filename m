Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1856672wrg;
        Thu, 23 May 2019 08:16:32 -0700 (PDT)
X-Received: by 2002:a67:eb82:: with SMTP id e2mr46040679vso.13.1558624592379;
        Thu, 23 May 2019 08:16:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558624592; cv=none;
        d=google.com; s=arc-20160816;
        b=Ksi56TdTen9gm4cFDuk6X3FAxc1iCDioC1U9H39khXkb+R6yDiB26ufxylYwV4k71B
         mh9TefpJwrFAl6TEymh6y07gIIHfrKaEkcQzhKzv+0LQna+XDzMvQO6WEjk8Za3vdXE5
         HuwuDFfsPZL2FqW+vVzn5ffr0f6PiiDvM3AfhXmtL+NGWrykzXydhXvZTM+lPdyvGBAD
         fGtJr7Kdd9eFETDFoQzIJeut546bDPpVfVyG2CQ86VsfO8WMhB2xqeOtfYMBjNn3m7HE
         0P12fwXi1tJx6jSGjwltMh8ndywMSL5X2ceGekwGeFl7xYDKCvXzLNyCxY9jSClVZX46
         skwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=q6BkwYnA3LMZb/vPh5D5GjjEYEOUkiYkYmHrGxhJUXA=;
        b=NyvSNRBYl1XzxbrZiYcWI8bKostT4BWBlFOjD7S20ju+U7cgdA0fax/zgmp+IaEGEE
         YR31i6mQ46sCkmVDn3DuGKQq+VjKW25gqe0fE1NDMNkw/IfRkx+P0asvN+nmg2A+05rm
         gEIovHSDJDRRT+UPBm71Pmg9L6mRdFfBtl2eMP3ssZkxn+pdi+fy8PsWYFAMOP/u+Ye4
         8X+cLKbZT9oKfjoRbqdGBwd9l8f/cE9X2RC/dAOXNZ/d/R2Ur+KQOpvM3hg1PrHwxRuD
         aA4Y11vKnTIchi3hpDcUxAhP9TPE2DJA1+xEl8m6h4l18sW362gI+aZOX7AblCh+UXNo
         BItQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FhmoTjMD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c8sor5466864uaf.58.2019.05.23.08.16.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 May 2019 08:16:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FhmoTjMD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=q6BkwYnA3LMZb/vPh5D5GjjEYEOUkiYkYmHrGxhJUXA=;
        b=FhmoTjMD2CnFaeEx9TKlKnLLavxclyxPPEbvJ+DH3iJrUGTXrQikT3OVBOAVYA/cjH
         Q6EG3mp7VsbS30IKt8SfhVvuM7FcMkZIpXS8+ngBXPM+RX4fzHHtT4XlrXW5d6gy4hYc
         Qs9Y1PAL1X8UD21JcTvQHmV9OFai21y+JbXDTJ6qkSEiAhnPTrNb1MtvZZbSaO6ta5Kq
         akv6Z7Xu2F7ibUVXSy0SCesUYuBHKw0KDtp3CQMkHkC62o4yS+sctARYS/j8XeF6mVIG
         VlkQW5dEAtgUiAHSKscndI9Qi0w71IOuVobEMO53kHMEE2XjmEnsd/ArrgRvnhx+OVdi
         Xuzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q6BkwYnA3LMZb/vPh5D5GjjEYEOUkiYkYmHrGxhJUXA=;
        b=gMZcX1ZgvCu7FUjFcOmTRSJkTbKq+1kBgYxrlUb9ebfqsGnNACy9j1BNu52W2nAZkE
         48HdLj0Vdzjc8nQg9zGSdCi1gHGLyUDm/zHpFDpyxq3RkM2GNZ24eFzILcuNIisfxxdE
         oF9FgFyTuLz/nKdIsZX49Etgz3h5v+4b/KD3cJBh61hLR8e528CgqOTDwdXJ8TrauIQ1
         ongfSnnk6q6rs6pHDeGTLZcIZ8tqsYoX5IhjWERNNivYR1/kcfzvqz8BvbNpvKML1mOR
         qo2Mvqtg0BIPUOzEFQDv36oyyq8TcNkGBR+FPS08TMzDSKA+dKLMv9EquAYBNtcnmmL6
         sDpA==
X-Gm-Message-State: APjAAAXs47B17empwgwcnjH27eLSYBLlhw7c0ETrt1r51BFmdfyo8SnB
	qPTpVinMttyPXVCSBIJPbjEiSp+N
X-Google-Smtp-Source: APXvYqzLLSEp8TL4I02ItwwJAllEBsL7Jc3agltwOs5gI4gwyVh3dT6f9lDMxt39FGWPkUKk1V/Jkg==
X-Received: by 2002:ab0:1849:: with SMTP id j9mr599743uag.75.1558624592004;
        Thu, 23 May 2019 08:16:32 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.43.94] (ip-173-130-215-183.orldfl.spcsdns.net. [173.130.215.183])
        by smtp.gmail.com with ESMTPSA id s65sm222053vkd.36.2019.05.23.08.16.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 08:16:31 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 04/28] semihosting: enable chardev backed
 output for console
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org
References: <20190523102532.10486-1-alex.bennee@linaro.org>
 <20190523102532.10486-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0426116b-6141-34ef-a6aa-a269c6d624d3@linaro.org>
Date: Thu, 23 May 2019 11:16:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523102532.10486-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: vsOAxy0keR9k

On 5/23/19 6:25 AM, Alex Bennée wrote:
>  int qemu_semihosting_log_out(const char *s, int len)
>  {
> -    return write(STDERR_FILENO, s, len);
> +    Chardev *chardev = semihosting_get_chardev();
> +    if (chardev) {
> +        return qemu_chr_write_all(chardev, (uint8_t *) s, len);
> +    } else {
> +        return write(STDERR_FILENO, s, len);
> +    }
>  }

Can we not create a default chardev that outputs to stderr, so that the
conditional is not required?  Or does that somehow interfere with how this
connects up for linux-user/?


r~
