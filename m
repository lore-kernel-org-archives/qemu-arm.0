Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4190444wrs;
        Tue, 20 Aug 2019 09:34:21 -0700 (PDT)
X-Received: by 2002:a63:c64b:: with SMTP id x11mr25310397pgg.319.1566318861518;
        Tue, 20 Aug 2019 09:34:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566318861; cv=none;
        d=google.com; s=arc-20160816;
        b=0Ww7UA8YDOwkDXhwO3ACfVRtKr6kCE6nJmNNX/HiJ8T2nGPCxPp0RnY/xwtnkMNP3M
         XD022Le5EoR/rZ0xL8lMuKoO6b/NroCztKp20/prSSwrsMyarkdRn9KTpEJ5YZ/VHiYD
         7aCO5bQPJbk8ekrrsWWNhvOL6WuU3k3R0hPfZBzUFP4Ncw873eNbdhHo8/nx4+1lmObc
         QhiTIGue0Yx0g1bkpsuJkRI5BgT1Qd3zfLibwKgyeyryIAr4838qcC98L4bZox2oKyFD
         YbZtJWynhgMd/cGcjnYaLx3HoEyz3eiD0mIkMkD0CwV0GysCTzQYmKRAI59ohzvVCKkh
         PoWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=oEbrwXqTk1zOUa32Or96uUF3IfzXUKK8OjQz21po6lE=;
        b=CgyKZkqjwojTiTvcB+FBIM3OY6PWwKnagyFlkChXJ19wQ2ZqQm4imLn1OTBrXaQYps
         UnX5AHjAKdTEqDW/VhfGUG8zdYY9UZcYSkqnSTpeqHy82fGjGunZKcKav4WVDI8ol0rI
         W64RatiJqlr/6ZKqXTVbyOLNHfgrzSKw9YkYyk4bR6QDMNI46mRDlIXbVOTkEbFx7KUr
         FxrKd6BCcIbmwHhTUqUYMGSgqHfq5avbrD1FwMdgAcWiaWujSuV3R8e5abc1olKKSdZR
         LHMPm8tibYrxmd/tDXGSxQCXs7VKej193jW37QnC50JAep1Dry3sQecrhZAv6xjUCfTF
         JSTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dwub0VIJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a94sor5554682pla.29.2019.08.20.09.34.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Aug 2019 09:34:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dwub0VIJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oEbrwXqTk1zOUa32Or96uUF3IfzXUKK8OjQz21po6lE=;
        b=Dwub0VIJ84REu03BMtkb0NR8KouOzvWR9auwfY2nGh+8bswav1sz6s5BL9PoJtmDyL
         0d75bMsHQ0fFScXo3bQgCo51pFvmQrjgzRGOqjp+quvphraa/0fSb3ieTow6ujxbYm9I
         GALP83fB36J08hTkOCuJQydxtVZbX+f/HY8zMOOQvxxREcARN8Q0hjThTX7NDYFRUWBZ
         O3AVQPbEnZy3l1D8iUo1Ibh29VV7ObECg/2/FVis/CYFYsPwNdMY5CqbCARzs9Ml9nIo
         GKhIVgGVMrVk6361Je+JgpYM1aHOd5R38pdVRvLib6rq6wPZAkWxzRghSFKEwusOPYjt
         VOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oEbrwXqTk1zOUa32Or96uUF3IfzXUKK8OjQz21po6lE=;
        b=qU/6sLkiKw2uvR9WHX+7AbtFm0DnmyuOl/AduEsWY9tt0kXkhC3e5d907U455Bqhq6
         MZAuvHdO+idrBfXitfKZjYGADJv45GoGCzWHPv34/ri+W3dZeG378zBGDXHNSdtNKjg9
         UsjwwfWfWaFVGgYEa5XQmV1VSgAlm0uAlM9m/bSlbgM7Xjl9rH7OtH6W3v4kUJ81aOim
         /ve7WBSS+ySy8rCPby/0bZzP7j8v5MQ5C3Wk16kJn2JEDyNTrumuWV5VjHjjx7FNTrQa
         oK7AAJEXUpXwwz5SWxO/s7cXPrxpWOHTXtaHoUX6N3PyQ3CUoBAZnuUw/5SJil9INfQ7
         t7ig==
X-Gm-Message-State: APjAAAW0WFM4UY3PJNWlDlmocGVZ8XdESnzhjMuj6spB+wUOCjt+4IiS
	AzZRwyCqKDCziBIypXiIkwZWHP3x
X-Google-Smtp-Source: APXvYqweW6m2wdyS4S8m+EiPY75uAQOcnWZbn80PfKzYm3fvy6F+gRTQ6kxu6iJc0q9rJTmE8AVjOA==
X-Received: by 2002:a17:902:4ac2:: with SMTP id q2mr26744888plh.81.1566318860980;
        Tue, 20 Aug 2019 09:34:20 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id z16sm19417442pgi.8.2019.08.20.09.34.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2019 09:34:20 -0700 (PDT)
Subject: Re: [PATCH v7 6/6] tests/tcg/aarch64: Add bti smoke test
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Dave P Martin <Dave.Martin@arm.com>
References: <20190803210803.5701-1-richard.henderson@linaro.org>
 <20190803210803.5701-7-richard.henderson@linaro.org>
 <CAFEAcA-cFi8BLBhh3vPdT4d=ps_pmP5gNz1W00mskVhhzN175w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <88c745f9-b923-2303-18fe-4d5b855539ad@linaro.org>
Date: Tue, 20 Aug 2019 09:34:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-cFi8BLBhh3vPdT4d=ps_pmP5gNz1W00mskVhhzN175w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: VNY3WNm0Alma

On 8/20/19 8:31 AM, Peter Maydell wrote:
> Is there some way to suppress these warnings ? 'make check-tcg'
> output includes
> 
>   BUILD   TCG tests for aarch64-linux-user
>   BUILD   aarch64 guest-tests with aarch64-linux-gnu-gcc
> /usr/lib/gcc-cross/aarch64-linux-gnu/7/../../../../aarch64-linux-gnu/bin/ld:
> warning: /tmp/cccZ8Fk7.o: unsupported GNU_PROPERTY_TYPE (5) type:
> 0xc0000000
> /usr/lib/gcc-cross/aarch64-linux-gnu/7/../../../../aarch64-linux-gnu/bin/ld:
> warning: .note.gnu.build-id section discarded, --build-id ignored.
>   RUN     TCG tests for aarch64-linux-user
> 
> and these are going to come up in the merge-testing search
> for warnings in the build logs...

The only way is to use a newer ld.

Sadly, bfd doesn't really distinguish between warnings and errors when it comes
to printing, so there's no "-w" flag as for gcc.

I suppose we should just disable this test by default for now.  I'll note that
despite the warnings, you got a binary that runs as expected.



r~
