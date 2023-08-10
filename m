Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp768283ejc;
        Thu, 10 Aug 2023 08:48:59 -0700 (PDT)
X-Received: by 2002:a05:600c:218f:b0:3fe:1d34:8f6 with SMTP id e15-20020a05600c218f00b003fe1d3408f6mr2284876wme.9.1691682539280;
        Thu, 10 Aug 2023 08:48:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691682539; cv=none;
        d=google.com; s=arc-20160816;
        b=f+xYi7tlbe6RU+dWy/9X2tTz+IZFgsCqFFlYg5peMS+zX65zQNaMacL+3wrnC2aEbU
         3MLhNFkM5362gDd5xhGwT1uOCmh6n9ydquSbMH+GLupfAAbikuKXMD2sMlRKus0AkW4v
         NKNDI7K6VydLIQ/V/R25SnNYybe3CGOsA3EbZGcUXjYlUKaUFWcAwoCxLHwZTp6JTZDA
         2YddBMKsxLEdA2Rd/ApB0EzGrzUJmTgqsM3AO7xNOEC5S95Y0kUlx0dtVjXJAupvq6J6
         JaVivJ1zPpqWeYjwpolFhHeL5X+ct+ETc5zcxbNhQsc55LfaeMduPSDIXdEK2M3OfvNq
         K/CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Nk4acP4Uv0/8SsNsniu2c5p3BtN/eqPfHVeL2n9W3M8=;
        fh=0rJWTZO+K/xkC8ROuHEDRt6D9sz7ASZ9XOSzgLP3ooM=;
        b=Mk7woVt2jqLpb/RmsIXQNNKV3qbNU/05/3g4m546pLFIv/js6l87iz1v1Zmq/Gkte8
         9FRssQi8e3/Aweb3iiQDUfvFuKtUUC34ZubFK0EeZDy2AclHAqFnGqRkC/fj+rajgHpM
         Cs8+7pCn6+rlLn5ArcS9M0CONH0ETOz7LD2yEP7nHbwNaRndIXU6kUyZ10PTyDEMbu4p
         +G7r85NfKrjfs4290/TLeIzVG3oSMkhbs2vWd+KRO451MKJb1C4Pk45GKYxFxYd5sQVi
         a9Oab5Bqv2foxBSiCzGbZJuqgMehezT2gS8OGthaLq2+JVZlYVuMHbyrLOks8quOBO3+
         3wcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="YPk/L1iQ";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f2-20020a7bc8c2000000b003fa8c55848esor716065wml.1.2023.08.10.08.48.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 Aug 2023 08:48:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="YPk/L1iQ";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691682538; x=1692287338;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nk4acP4Uv0/8SsNsniu2c5p3BtN/eqPfHVeL2n9W3M8=;
        b=YPk/L1iQfOSQ2cG+oLDSS8ozv/j0PEbbE4Zwqu9cXwrQXI9gADGlEShq+KVQhtsWon
         jCzJKE+zwsgMSpqxz512Iw/HWp6xO6pabQqFCPWeUekloTUEiWHpY5DssetErNjwHJz4
         aFrGXh2hQxRw/hmgIKevhsFa3piexnetHQanQqO45F0tvqs1hhrR3KGKc/8eL+QGS8Hz
         S61zYlDFWNgs3O3wGP8NIDkOViJrzM9mDV1wCjODURRkFQSTm6g1/7c5Nj7M0vLqh31J
         MsE8c4FnyLyiaQCdhQ97kMju673f9lcEDpTAO7goD3SZa+1PZY86aWPU7hzUfyHl2BC+
         6swg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691682538; x=1692287338;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nk4acP4Uv0/8SsNsniu2c5p3BtN/eqPfHVeL2n9W3M8=;
        b=MhtMdts7QTl5uHqPpYGKnL4tNjk51Wm4dyCFqR01oNH9YMYtIg7dgIA7M1b5cSLcJf
         N1Iu+jjVJnBg1LIGEBtvMxWWlPrmXSg51YDMND/RTDHDAi8QFGWTeHotSmnBZYbVdAny
         BZkhnf3e1tglIqTsI7mxjiukEayMNCVezDXzr0AoXloYg28VgxlhrEJYVpP2I64gfRv8
         xfWFUq34oOEBXtC9wRVfk2bKJwg0WKyzjx2Zhv+KxCcoIEryY1GLiSomHhr88MNur2tn
         TnE4duDqC8jqfkfOkWn/20Gtzw8H/wzoo3SoNWky1qp9JaDpvHY1myI5xdeJs7X7PjMD
         5SXA==
X-Gm-Message-State: AOJu0YzWeENoo3HEcOnV/1IthThNBW5XEDf/zk2NuU9Sq+AF4JV5NcyW
	IL3vYlzV0k6bBtiRzz37LIYbf7oqT36CL316jOYf+A==
X-Google-Smtp-Source: AGHT+IGt50j4Lrcl3qjS1pZHW5O5wvh868dB06amT98KalFob1+SgqSnSUdIrPmGmoX1qmb5xz8WxQ==
X-Received: by 2002:adf:de0f:0:b0:317:7b74:b9fb with SMTP id b15-20020adfde0f000000b003177b74b9fbmr2142502wrm.46.1691682538639;
        Thu, 10 Aug 2023 08:48:58 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (tre93-h02-176-184-7-255.dsl.sta.abo.bbox.fr. [176.184.7.255])
        by smtp.gmail.com with ESMTPSA id j8-20020a5d4528000000b0031779a6b451sm2538426wra.83.2023.08.10.08.48.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 08:48:58 -0700 (PDT)
Message-ID: <c7347932-7f3b-a260-2f54-d81d1f38df1b@linaro.org>
Date: Thu, 10 Aug 2023 17:48:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH 6/8] tests/tcg: ensure system-mode gdb tests start stopped
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Yonggang Luo
 <luoyonggang@gmail.com>, Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230810153640.1879717-1-alex.bennee@linaro.org>
 <20230810153640.1879717-7-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230810153640.1879717-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 3WjvweCfqZmo

On 10/8/23 17:36, Alex Bennée wrote:
> Without -S we run into potential races with tests starting before the
> gdbstub attaches. We don't need to worry about user-mode as enabling
> the gdbstub implies we wait for the initial connection.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/guest-debug/run-test.py | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
