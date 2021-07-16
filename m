Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp1681764lfc;
        Fri, 16 Jul 2021 14:55:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEyYYRmDbZCA3iz1oyn3BcW8emQ0VhIYCMxteg4Y84/NfwRmvxJhOXVJ6kF9Pm0CojBmVq
X-Received: by 2002:a1f:9048:: with SMTP id s69mr14323625vkd.15.1626472540382;
        Fri, 16 Jul 2021 14:55:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626472540; cv=none;
        d=google.com; s=arc-20160816;
        b=0kbeACOdwLAtOy7AunaKPmcjY6KiRkwacQnjWO9F9KDxxjrxr4MH03xQyTn+Pu3bUk
         VpI11U0QHul6s3Ze9gFsMZ6J3gq/z6SebLO8pez2JwIsnQ4NrQmmXsV5GE5PNNm92SEM
         sQtmUGZA8zp5ebErJm9cqYsar0+Bm1nijmwfNoy+DjtMokTbDTDFsYJzIIaUWE5NO2/d
         6qgrF3hFGyeryC8HzXfP9uCHwIOnUMEUsVAsaA3Puwu8yhlWqg4i9O7xnOBEur3ODWGl
         JFt9zWHv/2aqAQkaxgDI1fYGMeSosOskkHnOFQTnHOW4SKkHENudj1jxZgTWcZXRoq0a
         LMIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=1BqdBsGjBtoWHQj1TYhqxlS7caDlCKdx2OmyK6SJONs=;
        b=atLgHyQmVx5+sQOuWSjGVBS9crS6wblhOdGJjH2iB0hZu28Y+QaOM1oWbX5Yd0WE9A
         +iGdtd/p4e4KnQ21nocPnEreXUMPqUmRo7omOhhAXe2Sk7Pyn+FebesO06ahwP724+n8
         nT/Sglq0RYOksRdUh28oDnHZA7cw+vfMEQyCswkoY0LGrfzvAJlu3pAD7ljShjWc8p6W
         nY9lVVH1qaKRPi6wb3FJXzj0c3a+2Pc842wY55BqhZaLChVRbsFksxb/W8JQ/l4Fvddq
         bXDPP7X23bMzYizt9ag03I4KQZgMJ/M+IJaO79E0Su7tP04D7ALsIRwAPubVvfkSI3bS
         CPaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wNfoSi3Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10si6801839uav.190.2021.07.16.14.55.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Jul 2021 14:55:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wNfoSi3Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m4Vo3-0004De-Em
	for alex.bennee@linaro.org; Fri, 16 Jul 2021 17:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Vnm-00049h-Dn
 for qemu-arm@nongnu.org; Fri, 16 Jul 2021 17:55:23 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:40814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Vnj-0000Cc-LK
 for qemu-arm@nongnu.org; Fri, 16 Jul 2021 17:55:22 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 g4-20020a17090ace84b029017554809f35so9550287pju.5
 for <qemu-arm@nongnu.org>; Fri, 16 Jul 2021 14:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=1BqdBsGjBtoWHQj1TYhqxlS7caDlCKdx2OmyK6SJONs=;
 b=wNfoSi3QrWS05oYK25ON9weZWKdXbAqNOb8t0raoDyFD9kuBA32/hp8RNfNTO0KBBA
 GMmYLoZoCiVS5z7TXbWnCPctrcGal3pBBv2Tq6XSPZTJudTDseceEQtAmmMkb/kEORa5
 uAay5irLOAzcoD4Fi6FX1wC9uFzSFRveioz2p15Xda2spvRJgxsDVxOScGlsToAxv1j4
 9wII+jIfOo7fOj3xfUuWUHpMckK2bGCIMEainWqJuJIXLX+RIEg/3tj93RlT7lDcfXLY
 LkrM7Jb5zk/qpQmtU8CwnkMABXp5JAzSIonfK8Pb+PO0uSQplUmIjngWhOCOvJLJ9SEb
 3XRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1BqdBsGjBtoWHQj1TYhqxlS7caDlCKdx2OmyK6SJONs=;
 b=iiPQnLYe0ZKtwkEelBIfhJfAcMixoYiA+9nQDEvkan5ucYMO4IBoq5/AV9qCH9EuIz
 OZQe4WecbEHON0Vm/XeE3gqzCXZbExHrhnUPomzSedTiqceZrg/Z9a/hxI/aYXglq96b
 LxiPT/b9ZctuRyWHOYWY1PluPmqjF4mItLCiXhZG/0bBvurhXa6N7bVimOuTDgmlZgFe
 Nph6A2yFmjWocBfyazG3FNZAZaSOr7zVTaJGYM/OT1kG64XXAqVPpasgTPW0ePLgmIXW
 R5sCKx63k0Cd2RTUqpoZv7ujraqJPAV5bNPO6tA33V9MbnUta+sPWw3PWpIS3yMShahg
 tJ8A==
X-Gm-Message-State: AOAM5314NxWz1hKfFljgLDBptQ/Fti11+86ttEZqaPhiNDipJheupuIJ
 WA6EqXLGOcBLps7kEmNmBD1o8Q==
X-Received: by 2002:a17:902:b193:b029:11a:a179:453a with SMTP id
 s19-20020a170902b193b029011aa179453amr9275353plr.69.1626472517250; 
 Fri, 16 Jul 2021 14:55:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 20sm11417386pfi.170.2021.07.16.14.55.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 14:55:15 -0700 (PDT)
Subject: Re: [PATCH for-6.2 14/34] target/arm: Implement MVE integer vector
 comparisons
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <10c0604e-968b-e89c-ba0c-4ceac9e6418e@linaro.org>
Date: Fri, 16 Jul 2021 14:55:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kihXurbUPmKi

On 7/13/21 6:37 AM, Peter Maydell wrote:
> Implement the MVE integer vector comparison instructions.  These are
> "VCMP (vector)" encodings T1, T2 and T3, and "VPT (vector)" encodings
> T1, T2 and T3.
> 
> These insns compare corresponding elements in each vector, and update
> the VPR.P0 predicate bits with the results of the comparison.  VPT
> also sets the VPR.MASK01 and VPR.MASK23 fields -- it is effectively
> "VCMP then VPST".
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 32 ++++++++++++++++++++++
>   target/arm/mve.decode      | 18 +++++++++++-
>   target/arm/mve_helper.c    | 56 ++++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c | 47 ++++++++++++++++++++++++++++++++
>   4 files changed, 152 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
