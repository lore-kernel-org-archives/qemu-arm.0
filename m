Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp2309517lfa;
        Sat, 5 Jun 2021 15:48:37 -0700 (PDT)
X-Received: by 2002:a65:6487:: with SMTP id e7mr11499352pgv.27.1622933316723;
        Sat, 05 Jun 2021 15:48:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622933316; cv=none;
        d=google.com; s=arc-20160816;
        b=fW3AJbXiCpHEBwrN0bCEoPaMLNm1R5vIBzexQbf4UzCXOHT42KlwnGx+cC/gNFgCc/
         bB7Mz3rWnZpMwIBNhVjlFvG7dMDy9bAN5M6IfHuwRckZlgYkQ2llsQYLW+CXImTNdelt
         +h0Y4J85bipzGSkskKgiRlY8+wulZpLv1ktDovcCCnAQQugkWrHpjBHNd7Li9mgC3Jl/
         cR/pNG+MqD1jEgoFAvfMxp5QohCPHIwouir/sv+ySze3qo3xhVb7S2sV/FobM4PWXmp5
         UlYa6g7wwTUTz02K7/5gHYPAjLk+xw6a/BuRIXOMXTEY1gSU/xX/EQ2J4mcRG4rkNs9n
         lycA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Z+XMb3a6PgCmS/uKdoinD+PPvpkdz31ARf49HWH7hy8=;
        b=dL225Gsnovqnv2WSedl5aTqQHi7BhFF/ZKB1sGdSqr/iIO05TNi7n4UQLfY+GDwoUC
         vfIF6kwMf0LbLOoBa56rRcmtEk0/nvtag+s+CiThwXzn4K51KG3DFny/LpP3PC/EBeOn
         Ax5tF8vOgYeBm0tgU5BBNpMuhzkEWBwDmUNSuAzSKhViUbL1B5fSXDarTwCffDB6yLQc
         MBzXac7sx+2dAk4bqDGu93u0hqjEP4GbFny7NmC8mu99jf5+SOoi63aTxwYu8WT1IzRt
         /mqEDQ5GHyCip33FP0HdAusOjfkCTjAjUb5e3VEnQhCvkxOgLGOuQ/O7KmrTrO3hl6dp
         7Whg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WjCI711s;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n14sor5657646pln.16.2021.06.05.15.48.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Jun 2021 15:48:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WjCI711s;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Z+XMb3a6PgCmS/uKdoinD+PPvpkdz31ARf49HWH7hy8=;
        b=WjCI711sba7r3LFNmoyTS2wTw6JEIikHypN8QCGRYgxd2+uyIXL2/7jd44WsuGGN+c
         /P/Dj62HdMwM43NBQzDgc8NKs9UVxGbQeG+R1elJlriBciWSIeIBSH+K1Zi/pz+y9RWK
         NUMGYZ/+MJOJyiolm2yaQmY33VHNjEC4T/EIJU/JQY0nA0WyrOu+Kr1c8qhTchjgNbwz
         pi71uvmuIJNH3/W+sPQFb8sCw5F1NJkrVvFG1eOYXW+4eaFk/u/8LIF0gZd3S016kjhV
         WYRRY9BccMQoKybG44sOgzeDfBDzr7Fh5ysDZYCf1q/wJKGH/nKxIl0u2llbuI4y+o2d
         3Dkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z+XMb3a6PgCmS/uKdoinD+PPvpkdz31ARf49HWH7hy8=;
        b=o7GSq3NtlTAXW4LiBEeam7MVvgG8WKtLvK5I42IjFmX/5u88k08LralrQWf7+eYtvi
         4k3usk627yU+8vBIrBSik/OdtC48Z+fG7A/JmsFap2iIxEtpe5kBX6eQWB+Kx0YFDAuz
         yDyF6B5VUtdbV/c7gJbXNE66rdhmtQtbSzu9oqdiRLV9zF04mZaPrTshb5Sf/5TOHWb7
         SinNZyAogmlnvFZVnuloBvcrYSgDMRIN5ro6N7m7R7/+CAT1KrFlLrSPnmaEAlO4Z4Q6
         umPjIspl6UZ5S21+n0DdDr+ocq5Yg0oRrXWJtgZi88ey+BP7zSq7zcAYfF58Dj5OUuvX
         m3Iw==
X-Gm-Message-State: AOAM531LOmlXIBvXiY7C+rqAW+BnwoC1GpX4agrv378kfJldccvJTOZD
	2tXApyIAd2rXisXXBt4OpbRz96pp
X-Google-Smtp-Source: ABdhPJwaQ0l9d6YKlC+YkyiY3yRwphsx+Wj4D7CnZd902cCeqNEyHsIjFZ9sm1Gi+jT13bEIRWsMyw==
X-Received: by 2002:a17:903:230b:b029:f4:b7cf:44aa with SMTP id d11-20020a170903230bb02900f4b7cf44aamr10742576plh.31.1622933316320;
        Sat, 05 Jun 2021 15:48:36 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id j4sm4468488pfj.111.2021.06.05.15.48.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 15:48:36 -0700 (PDT)
Subject: Re: [PATCH v16 97/99] tests/qtest: make xlnx-can-test conditional on
 being configured
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-98-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bd2b3f0a-1871-b264-1e5d-3934967584d1@linaro.org>
Date: Sat, 5 Jun 2021 15:48:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-98-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: /a9NR/WgMFF/

On 6/4/21 8:53 AM, Alex Bennée wrote:
> It will soon be possible to build an qemu-system-aarch64 system that
> doesn't have this.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/qtest/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
