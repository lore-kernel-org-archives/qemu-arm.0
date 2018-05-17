Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp408981wme;
        Thu, 17 May 2018 13:26:41 -0700 (PDT)
X-Received: by 2002:a62:399c:: with SMTP id u28-v6mr6472508pfj.95.1526588800940;
        Thu, 17 May 2018 13:26:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526588800; cv=none;
        d=google.com; s=arc-20160816;
        b=cUxWZRoJSALbDMI5gsqG9ITWNLcqsF518Civ+WgHaSVjOk/eoY4wARCeg1ByYfGW8m
         Km3C/PziKjOIdig8ym8Zly1KFVUWxx4vSCb/jNlbXdjvCn2/bP1en7SvjRwrtpKVR+yC
         uMkas8fpqMLW82Ce47Oo0YPIq22KWHjYPIEtIA01+OyGx043RDfsFWfEXdeFO52PhSpA
         1BiPXhpCOSsc7SMgGp6ms6lmdkELebh3ZWrRJtIdJ4CsZOafjzja16ud8ehQGK7SpwP2
         DI6ZdcdgmBz9Kx6cpSfF3kVnMgGigld9BMF+nCdpuqSMfTEgSUbnP0mjgRCFyRDygV1T
         8dSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=PARkvCUF7imDQh5Zi9STMHjygz8YSF/a265soKx1gxc=;
        b=yIPSgxVz3YAWFh/MCNVpwwIIPiCZrR0XJW9jXifCzQ/i0nmQIyPUn8sEdZENi3dEkv
         yeQRmawuElP7XVD5sYRvGQh2xBDWi6txyFMXOc7O8JyTgBzJCZrX7zH+4MP+dLic3wcL
         UiRXKGZTej3x4p1fMPMBhGRmrhK6we6DLcLmDD6EewsiXLs51WS101fOxiLrBn1MO0iD
         uJwAdSfNCotBkVvkDWcTPoNykRL5QIko/A4+5wyT2Y0b7P4PWWjAqtNnYRfbNyZRZ3wq
         Qrcz4gRQ9ljZm6G1pLtjEioHBfko9nSyesqxkf1RWg3tc4HE3n0ZbWl3bWlyul2lemTq
         z1mQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EhUm+2Rr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id bh5-v6sor3767594plb.53.2018.05.17.13.26.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 17 May 2018 13:26:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EhUm+2Rr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PARkvCUF7imDQh5Zi9STMHjygz8YSF/a265soKx1gxc=;
        b=EhUm+2Rr07Lte/r5Jea+Jel0GSufe5yOWKR7EByKkahkny4j4/tpPvVnuo8M+O9Bp+
         pbBQu2g9uZghUBevLvZMwCNJ5Zqu4hElTZQF7QuhHDowt/T/TkbjU+ROu5usUXlE29hB
         debH/EGkveNmrRiD5j18GfPyZKxGRxF6RSXrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PARkvCUF7imDQh5Zi9STMHjygz8YSF/a265soKx1gxc=;
        b=sVlHnkyDbJwtJ8GC1Eu4tdzDllRtHXkNMkifdN9c0EVaFWKtBO0ZTJOyVT0YBd4TsV
         xJ1qe5V2XIZrlTpOL9U6s8KvjtkL3CZTPkw0EKKOy5BqoIObNrr37X+I2eQIypp7eSmh
         oqgBHED6ynE79GctR1wEx/8Td2xjOuMYS5yu+KDnCVcGWcTsDv939iBeLYO99obuSDhq
         BrMQ3XxbZeyr+MIQ8hDRWgRDCRx201UArEP44MGYaGJIxwt4USVQep8WtN2ZmnziNsX+
         /8BHVDiR43fejoXDt7w3KhBdrpAarOM9uNN4OUCrQbyuWp0tThYyRn5VRbld8DCd5Gn9
         DPDQ==
X-Gm-Message-State: ALKqPwdNjc20oTeCQnE5VV+9ML46bUAhTfisybfTrBwI2UC3RWR3gdvM
	ZaK6MWzTrGpgZhoaxvQx4YN6fPnd
X-Google-Smtp-Source: AB8JxZroFgN84j17DF6ZaSV+G0hQU/cX6SxsHSoI3FQBOJz8B8x3mB0TfjQzG0auIOTCBRb3LJPjIA==
X-Received: by 2002:a17:902:a512:: with SMTP id s18-v6mr6506617plq.223.1526588800544;
        Thu, 17 May 2018 13:26:40 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net. [97.113.2.170])
        by smtp.gmail.com with ESMTPSA id o190-v6sm7559512pga.20.2018.05.17.13.26.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 May 2018 13:26:39 -0700 (PDT)
Subject: Re: [PATCH v4 30/49] tests/tcg: enable building for AArch64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, cota@braap.org,
 famz@redhat.com, berrange@redhat.com, f4bug@amsat.org, balrogg@gmail.com,
 aurelien@aurel32.net, agraf@suse.de
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM" <qemu-arm@nongnu.org>
References: <20180517174718.10107-1-alex.bennee@linaro.org>
 <20180517174718.10107-31-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <016c5b98-6c8f-6cdf-3143-3b0dbab9829d@linaro.org>
Date: Thu, 17 May 2018 13:26:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180517174718.10107-31-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: esbJGHBSffLB

On 05/17/2018 10:46 AM, Alex Bennée wrote:
> We only have compilers for the (default) little endian variants.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v4
>   - update MAINTAINERS
> ---
>  MAINTAINERS                        | 1 +
>  tests/tcg/aarch64/Makefile.include | 8 ++++++++
>  2 files changed, 9 insertions(+)
>  create mode 100644 tests/tcg/aarch64/Makefile.include

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
