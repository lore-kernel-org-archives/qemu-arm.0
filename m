Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp145891lfm;
        Tue, 21 Apr 2020 20:22:18 -0700 (PDT)
X-Google-Smtp-Source: APiQypLa1oKZzbduySZTOpRnaf5753dsztvBREILSYgDr/idFO+1R30J+jCXgmsZ5n3em1xbm1OH
X-Received: by 2002:ac8:45cf:: with SMTP id e15mr24602996qto.21.1587525738083;
        Tue, 21 Apr 2020 20:22:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587525738; cv=none;
        d=google.com; s=arc-20160816;
        b=J30d+q333H7gsnBsurEdogGnYUr7tyoL/+RV9+8o3tT0dyUOjVgKNCUt+GzN5MzVKz
         3hlAu900C6mLTzCW0tu/fVmCNh8iYbZP7FZhym9KiMi8CFQdJ0TP4XjbCmk81CCvdeLR
         dm1kGJe1CtPJDawHckJfI59aF2ZwbRtOcOlZQb4be+rUdP+3NiNu5ADqAMFaGSRqmcTy
         OExs9OfBgU8gAGY2PRiXqYY3d2Gh5pUZEaB1OFIRqdO9q0iFRxS5KSTi8uvzsqSFbGxs
         gVU/DQSOdcYdQjeJ89c9wPiHfUvh2gtU6wDx8tLoKOgpYicwF43+korqG0Ace0JtO2em
         N6Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=LSac1QTTZ7wQ13jD7Q3AfAMsMClaAbzuB0bS+btyUWU=;
        b=Aouuc2urx/xRD70t7/sXwzAiz0HzcrpUSM7xDaw+TcHuAAuecQ1OIYyhtCAh8bitfx
         4l8fpKZH6C+4eAmtQJ8a7oLC5A1NmjSwZ5RPg6MwgFTMLO+1B7Z1nrYa084PEy5+58J4
         Pmom4IaRh3Q/9YQjzDx3ocRnhp45MFKePWRVym7EO+2ZAMNITidtqRiIwpZFf9vABxvF
         xVjF9E6rTkurDcvzZZZKpPcbvSGfIQwsWvNLxOX+NqTddpx9k501xEMPLoQRldN2g98B
         KNWLjoa0LDdpqjpB00ypArSpxkt0radNcKCXBt3A0tqwThqiYJOJQkmayhWIQdpFJuXe
         JmOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DW8/eRZE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r17si2426274qtk.333.2020.04.21.20.22.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 20:22:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DW8/eRZE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jR5xp-0000ML-DN
	for alex.bennee@linaro.org; Tue, 21 Apr 2020 23:22:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60198)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR5xM-0008KJ-Sn
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 23:21:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR5xK-0007bh-Kn
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 23:21:48 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:37023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jR5xK-0007YL-3C
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 23:21:46 -0400
Received: by mail-pf1-x441.google.com with SMTP id d184so364983pfd.4
 for <qemu-arm@nongnu.org>; Tue, 21 Apr 2020 20:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LSac1QTTZ7wQ13jD7Q3AfAMsMClaAbzuB0bS+btyUWU=;
 b=DW8/eRZEZ4nt32RLrKX7qPNcMCRqyCj6btPdFGUqVNSz+/XdjPd/B/EWKP4gdBzgli
 kZajsfCFmLWh65jCxbC90zzlUqJ6apW7Vj61XhjS7YnXfoQ1h/LfAKwvQZgAfHhoI2bA
 sGkZnQRp8EhtPsyU26j65pum+nx7rCl1vEZKsyjK4Uv4yfU3BumNLnRasNZ0lmuNlwhN
 kj0iyK+XrQxjmtfia5LEzD271wSg1SrQdOl6BIYJOb96YsAqjANE9yOowEDiZr2bPm0f
 iQ7SELmN+Crq1817qC7R5grm+Tw+geEIOzai0mUFd95EJpktBx/Tn3jb8AIL7rx0z24y
 BBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LSac1QTTZ7wQ13jD7Q3AfAMsMClaAbzuB0bS+btyUWU=;
 b=n0OxPjif7AacIdOdNx6rhq/8TapP9zi3RsfP6CBnQsmFPjZJliXV5DGDybZaUgmiY7
 oXnExfZy0S+YYEqNF5Fh/VfVO9qDUdATY+GssNzOEgCqTlU4G5oYYHtdM6x0tQFq6NSA
 eEH6LXRXEd2E00sOsAxHnrC90ygfAU9u09S5RdxB69vch5LREyOLDOP0w2mhNaIVDoKJ
 XevhiisJl6VCK/hKuZ5nJd4uNkAk7DrTpp9v8ULi4o75lULWiuisyUTOvDRxBs7VQi+M
 ZO440BnqKrT5odQBwVeK2oNFPyUo6teEdIDxOt2tsRGS9coa3S1vNm84sJHrckoIqq7u
 nQuA==
X-Gm-Message-State: AGi0PuaM5BmwI0h+d0ZTsKizY/p866O/aRliJODp/eEw37wClJ3acm7d
 rSE7IV/p57eu3zdyW/aGhCkHfA==
X-Received: by 2002:a62:2506:: with SMTP id l6mr23854953pfl.184.1587525704080; 
 Tue, 21 Apr 2020 20:21:44 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id 1sm3828470pjc.32.2020.04.21.20.21.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2020 20:21:43 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Implement SVE2 FMMLA
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200420151044.12186-1-steplong@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d6e4b681-751f-cc36-0453-38db6635c227@linaro.org>
Date: Tue, 21 Apr 2020 20:21:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200420151044.12186-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::441
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wt4wp410Pjcv

On 4/20/20 8:10 AM, Stephen Long wrote:
> +#define DO_FP_MATRIX_MUL(NAME, TYPE, H)                                     \
> +void HELPER(NAME)(void *vd, void *va, void *vn, void *vm,                   \
> +                     void *status, uint32_t desc)                           \
> +{                                                                           \
> +    intptr_t s, i, j;                                                       \
> +    intptr_t opr_sz = simd_oprsz(desc) / (sizeof(TYPE) >> 2);               \
> +                                                                            \
> +    for (s = 0; s < opr_sz; ++s) {                                          \
> +        TYPE *n = vn + s * (sizeof(TYPE) >> 2);                             \
> +        TYPE *m = vm + s * (sizeof(TYPE) >> 2);                             \
> +        TYPE *a = va + s * (sizeof(TYPE) >> 2);                             \
> +        TYPE *d = vd + s * (sizeof(TYPE) >> 2);                             \
> +                                                                            \
> +        for (i = 0; i < 1; ++i) {                                           \
> +            for (j = 0; j < 1; ++j) {                                       \
> +                TYPE addend = a[H(2*i + j)];                                \
> +                                                                            \
> +                TYPE nn0 = n[H(2*i)];                                       \
> +                TYPE mm0 = m[H(2*j)];                                       \
> +                TYPE prod0 = TYPE##_mul(nn0, mm0, status);                  \
> +                                                                            \
> +                TYPE nn1 = n[H4(2*i + 1)];                                  \
> +                TYPE mm1 = m[H4(2*j + 1)];                                  \
> +                TYPE prod1 = TYPE##_mul(nn1, mm1, status);                  \
> +                                                                            \
> +                TYPE sum = TYPE##_add(prod0, prod1, status);                \
> +                d[H(2*i + j)] = TYPE##_add(sum, addend, status);            \
> +            }                                                               \
> +        }                                                                   \

This has a read-after-write problem, when D overlaps any of the inputs.  You
need to read all of the inputs before writing anything.

It might be easiest to just unroll these two inner loops:

    TYPE n00 = n[0], n01 = n[1], n10 = n[2], n11 = n[3];
    TYPE m00 = m[0], m01 = m[1], m10 = m[2], m11 = m[3];
    TYPE p0, p1;

    // i = 0, j = 0
    p0 = mul(n00, m00, status);
    p1 = mul(n01, m01, status);
    a[0] = add(a[0], add(p0, p1, status), status);

    // i = 0, j = 1
    p0 = mul(n00, m10, status);
    p1 = mul(n01, m11, status);
    a[1] = add(a[1], add(p0, p1, status), status);
    ...



r~
