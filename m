Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1648338njc;
        Wed, 21 May 2025 23:08:02 -0700 (PDT)
X-Received: by 2002:a17:902:d4c6:b0:231:eb7f:107e with SMTP id d9443c01a7336-231eb7f1265mr310503085ad.22.1747894082269;
        Wed, 21 May 2025 23:08:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747894082; cv=none;
        d=google.com; s=arc-20240605;
        b=ZbTuLg+FV93CTokD+sk4vd7fh8cR8MCeDb7PFojlOIATkTSJN3iA21H7ydPLyKRH9A
         wsJkqz55x8VscE28P08vTHbXcVt9EEEez4OH8kNWpieiFGmUY+JDnercbEdVfNhG5Bvg
         31YMCqv+KYkFGsGJQ05wrlOb9fi+BK3Ze3hMftgP8eyAdnAq3gFOeqsseumvlxulbLsK
         wHE882eqzVIYXaacPmNffvKHJxnr/iExTILJq5ipXQCo+9TaRvAYxjMrDX86OpDgazoo
         G1DRxFGh6lodoswt0YBTbaFIRbOXWQnNYNjoDYF2k9x5w4MR/p1W2mE8deMEWG8wv5X0
         /r+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1/zbCeClAfxLgAhFNJwlJvnFHsn5ox5S+Nz8tMBzj9U=;
        fh=GpPa81iljgXyLXdnOoH/gVHeJjssJBaU+DJT2gHz7Eg=;
        b=Uj9FLol1tq4ujpJSDizJgf6XiQAfLhg6gUWBM3vhOCWRz76t7qSrVjnp244+fLb3QY
         ksiuZ10QHsR/QBVcwOBLgLHZ4X/+zC/kVmU1NbKGlOEtn0/PUr2uHi2B1jqRncK6ACfx
         hha9BDYMQ3cs6a3sBjb7PD19By8HKxlwyyMGJsLHwxnqNfMhIE9xYyt5vxWWiMtfaA2S
         NmRB2YMZG2CPW+5lfvdSxduL9F4bMBkTUeXlZqYr0aGQMPEeMvk1Y3+/8r+NjavYDVJI
         XhveUyp/oABzREYci98zhYi07wqDuz721GSaKdqeVld+yaenewmJzy3Fh4YHnxI9RYts
         UugA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=xNq2H6t2;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-231d4aab239sor71448755ad.2.2025.05.21.23.08.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 21 May 2025 23:08:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=xNq2H6t2;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1747894082; x=1748498882; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1/zbCeClAfxLgAhFNJwlJvnFHsn5ox5S+Nz8tMBzj9U=;
        b=xNq2H6t2HAG7+BAyCrCdYY0WpJPK+7E4sbVTJIwlNa2tGMcUQAAKGvf8R611fx7SIx
         str3Ds1ZLMv4UWLsIHpEeZoZxjfLIghP9aJfz03QKVX14GBLepsxir5PVhxmMPd7ryRw
         PlqOr1vpzjhmhf6/AcZAO+96ieesb7n1ycV7sQGx5maRS4aCny+6b/8C1xeTXHdft01f
         lya1bQsJAAFil9hRR7hYtKej7FT4nJs0kB9SlgCusGQYjqbDJ6di213l2SFl7dlIX0Ez
         loBMhA25oOPmIR91OpwN4rMEhuwFClMZ951ARA4dx+cIgOqUDBwYr1i5FluBVTI98okp
         Aw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747894082; x=1748498882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1/zbCeClAfxLgAhFNJwlJvnFHsn5ox5S+Nz8tMBzj9U=;
        b=naGRsaMzJraRGZTuYUHc6aMJ3Wg6MH2UrYi3F84zXYG9KbBOl9zy8r5zhVPe7mv6Wa
         CQUKcG7PXoiciB/2056kGnTAR90YTPOnx1o9V5hZak3qyXYvTCcp/8vHilUyVjeL5OtK
         4K68M+V50150X6vQps7GUWdgjVi2rcEyRTZMNPgdpXH4hDndXEFvGfkgYI5S7wx4CqEL
         fTe3qyi6IB6Yr8hdtKoWLXchi5zQ5XbLQpvvKu6aJeIfeTW/azTfD9VU+Pan5PgUWpMm
         swW65KPWe7ug3TlhzL1BXivQyw3lb8hKJTYnVY7uUDVd+R5gf+t9/oD6Gdcdv0xHbV60
         kH9g==
X-Gm-Message-State: AOJu0YxiFEufzbZjwqjHw7mjbOQWL55RIRTcXeF0aWidKYsOGYE5j8ev
	bT+deq5dXwEe7PemavlDz3AEHxQcKNuwn19VeSIS4fYsYt6+1aUIccOeRCqZ2iIeVUgFUFYifkT
	+7x7S
X-Gm-Gg: ASbGncsoEGy23x+q/9oNW1WAzoskE8E6/fL4npF6jDXYVh2N3fEJfEeUk1WSkn+6KYe
	mTeBUHOifp5Zbomd6yOWdthyEs/YZC1wpyL4S05uzQVOUeZatk6aK7B8FmYPf7qdfVb0TE18D/c
	v9JDccieQzIKO71fviQ5NsKzBrZIKGuDbFLv4nS2Qp3UZiED8bsw9NblKqkxJLhnToq9GEUPjpe
	fU2plzxHOic+RRfNghNNpdof+IxbUBpyvpeUmMNSqm+eXZF1N8tBPz2UB1cRLMQhoiL1bmgYDhJ
	hvH3Hkx1/txOCMuvO8WRECyBqTmAnpSzu2r3ugI5q014r4IiB9S6r7Vjawurng==
X-Google-Smtp-Source: AGHT+IE3FVxFNCag2LpCvus0IyKip1VOr6LBz2pMT21bNPBHqu/FOw9nn4kFDMvwf+D00GnTfU35MA==
X-Received: by 2002:a17:903:41d2:b0:232:108b:7bf4 with SMTP id d9443c01a7336-232108b7d59mr222539455ad.6.1747894081621;
        Wed, 21 May 2025 23:08:01 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [10.100.116.185] ([157.82.128.1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed571esm102120095ad.248.2025.05.21.23.07.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 23:08:01 -0700 (PDT)
Message-ID: <e6af12bd-1c36-4e50-8bae-d8d80cad13a0@daynix.com>
Date: Thu, 22 May 2025 15:07:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/20] include/exec: fix assert in size_memop
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250521164250.135776-1-alex.bennee@linaro.org>
 <20250521164250.135776-17-alex.bennee@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20250521164250.135776-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: A9OgUj1o3U1o

On 2025/05/22 1:42, Alex Bennée wrote:
> We can handle larger sized memops now, expand the range of the assert.
> 
> Fixes: 4b473e0c60 (tcg: Expand MO_SIZE to 3 bits)
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> ---
> v2
>    - instead of 128 use 1 << MO_SIZE for future proofing
> v3
>    - fix comment, 1 << MO_SIZE goes to 1024
> ---
>   include/exec/memop.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/exec/memop.h b/include/exec/memop.h
> index 407a47d82c..e934bde809 100644
> --- a/include/exec/memop.h
> +++ b/include/exec/memop.h
> @@ -162,8 +162,8 @@ static inline unsigned memop_size(MemOp op)
>   static inline MemOp size_memop(unsigned size)
>   {
>   #ifdef CONFIG_DEBUG_TCG
> -    /* Power of 2 up to 8.  */
> -    assert((size & (size - 1)) == 0 && size >= 1 && size <= 8);
> +    /* Power of 2 up to 1024 */
> +    assert((size & (size - 1)) == 0 && size >= 1 && size <= (1 << MO_SIZE));

You missed the following thread:
https://lore.kernel.org/qemu-devel/eec76ce0-c3ca-48ed-befe-e0930d4a39d9@linaro.org/

I think you need to check the replies to the previous versions of this 
series. There are several comments not addressed.

>   #endif
>       return (MemOp)ctz32(size);
>   }
