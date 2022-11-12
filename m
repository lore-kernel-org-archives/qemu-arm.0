Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1391400ejx;
        Fri, 11 Nov 2022 21:36:40 -0800 (PST)
X-Received: by 2002:a17:902:d708:b0:186:5ce5:8022 with SMTP id w8-20020a170902d70800b001865ce58022mr5248175ply.62.1668231400357;
        Fri, 11 Nov 2022 21:36:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668231400; cv=none;
        d=google.com; s=arc-20160816;
        b=xOpCB5Hd9xMqAfeV5BnEankWn/TjOpBUZ2U5ukNQ/9N5g/2A62FvWcEC4HprKsNRj5
         xYMYft9BYMXG11/EsJNt+qvl62JWFNif/8MVHjkNmzLgkHKYMxF3kugCckn68ykEB5iU
         lslv/gl2MPAu1qtbghPlmy8pLFJgW31RVJDz5lodFDIsrKwUr4oyfhVPkF8OJeXGO6RD
         sRifgLM2V6H7aPXYcW44d8d4pfwMNAT0y0xewdShE2HGrG5MWeeAeI48TGA0ZrMyROgS
         9mgUrdH88spc5/AAnN4/jefQ9rMvt3xK0kpwIf+35o0ccmSsYs8Z4IFEI9rv6a3nxnEJ
         WNLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=B5CmKZdv20Fh17i8B2oiw0Q96Yjk01rGk8R9YTBKu+8=;
        b=I0sSQeopIsA5iWAtSSBS7ZlH3KoTeOfIifDoz4+RnjPH5fKaJUJBurv3F6wYfoX1vf
         Xns6UtxvEfm/QTLVbNeDlE12sKSnzqHqLqrD9Y1DZCPsvIylPW4PvoBROk5UfP75JTjV
         HJtxvV+ze/XVkJUCDQoGKCQ75lX1bo8KxbEPzqAzkq2gkGeHm/57mCpCKklt1ape9Zf0
         1UGod1is0eafisWL5+gsbHDoeilcygDiJAPJGID53RzB0KFq7mlnHdwY8S5cDywPczKe
         bMnXe6I1VyZ5BUVs27dcA/kLXl3oTV/P5ojd5ZEw08mD7yYQKFpD/odI3cnjQVWBxFlX
         tlog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hIoRyTWi;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d190-20020a6336c7000000b0045686aad456sor1937300pga.82.2022.11.11.21.36.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 11 Nov 2022 21:36:40 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hIoRyTWi;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B5CmKZdv20Fh17i8B2oiw0Q96Yjk01rGk8R9YTBKu+8=;
        b=hIoRyTWiPTjHGEOvA267HQsZoRugtSpNhryTnIZ9PgBr+F2EPpAJEF0lGFDtz7FpVf
         oVxwGIcYN8ngbUnHMhf0eKXkII5Ic8mBRjnDLpKWKVf2of++K91lVj+4jw0Bx1R5PYEq
         odsFG8lG1pNYrQxl3SuOUhgndhw8MFs3U3qZzEC4tvF3U0otVQ+b2GGsmX8TSJVRjghy
         CZt6rZhuBQjwluSaO3Nu730cQu76/jxqpCOKpRiAu/zN8RE/MdMc5PMk9GE7LpayghG4
         jqqhQKvjDzw6SB/PL4yWNkcwJo9DF9/4K5cORIPbr2AX591yKUXexV+hXsNPEJ1SUaKq
         oa8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B5CmKZdv20Fh17i8B2oiw0Q96Yjk01rGk8R9YTBKu+8=;
        b=5aeSd6IRiYJe7m66wmGlcIcoXD+9yi8jgSGvV+fGHTJoCCdmlgGcLvHEWYFTnIFGIk
         CBXGnHX7//+jBwEmIHY56ylVJFVJk1WIHJfbsY62vAZqQKGUvsfaSwP/ZbqDUd/IZy/G
         9e3QLODIxxlhEZc/8cfuZ6Fhv3SP6pyVdEsC8UtkmBqgk40d+ywK/8VRdMHADnwz9cpw
         Pjbuca01QAh9Z7Ts/k3y4ANzQuSgHS4k2wDaGb9bbtKyd3ffaOjZz2cfNAaNX+d4S4m1
         SAad2GQ6tPfVSMePfc8UC9PjfW7h3pbEdSI5aIgZTbwlL9t6q5zsOUHrVsh2IR5WcHG2
         grBw==
X-Gm-Message-State: ANoB5plObsfQNyy60oSY8dGAPdI7h4ktD5MVPg4IXbbUahNS0vRBe1QX
	Z7uAX0LD5pjkJEnCKjQt9B9Rh94dmDnQIQNkl08=
X-Google-Smtp-Source: AA0mqf7RqjGHu1JQdt3NcBOnj8e1kikou3LK87gwrzMIqmrxVr5MvfI+HenHo6mJ1vwALCnmNotEIQ==
X-Received: by 2002:a63:f0e:0:b0:46e:b0e3:ee46 with SMTP id e14-20020a630f0e000000b0046eb0e3ee46mr4193883pgl.622.1668231399798;
        Fri, 11 Nov 2022 21:36:39 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2001:44b8:2176:c800:8228:b676:fb42:ee07? (2001-44b8-2176-c800-8228-b676-fb42-ee07.static.ipv6.internode.on.net. [2001:44b8:2176:c800:8228:b676:fb42:ee07])
        by smtp.gmail.com with ESMTPSA id q7-20020aa78427000000b0056baca45977sm2490742pfn.21.2022.11.11.21.36.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 21:36:39 -0800 (PST)
Message-ID: <a3d83f6c-a2b6-888c-19be-fe7d6b47017f@linaro.org>
Date: Sat, 12 Nov 2022 15:36:33 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 09/20] hw/arm: remove current_cpu hack from pxa2xx
 access
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, Peter Maydell <peter.maydell@linaro.org>,
 "open list:PXA2XX" <qemu-arm@nongnu.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221111182535.64844-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: X1lUP1sDgJ6E

On 11/12/22 04:25, Alex Bennée wrote:
> We can derive the correct CPU from CPUARMState so lets not rely on
> current_cpu.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   hw/arm/pxa2xx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
