Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp4143002lfi;
        Tue, 31 Mar 2020 09:07:15 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsJHLId0hxkUyPAw9jjSxWe0JPdsbpYH2Ka5rUvJKjbo45j5uZLmtEM/BPy7d+2a5bj6sNM
X-Received: by 2002:ac8:24e4:: with SMTP id t33mr5897145qtt.107.1585670835612;
        Tue, 31 Mar 2020 09:07:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585670835; cv=none;
        d=google.com; s=arc-20160816;
        b=mL+KchMd4fOi9JZy4+oKk1ntfc2MEWySTRCZCTLdm38sHsKegT7ZZ7iO4V1YB4XtA4
         jJy6pMeSrSGMssvJZSQvw8LHaeljG+UnZ5Gt9SlF/vaIesv3Th582rhQ3wJsF3EEv5wb
         KOzZDueliCWoF+goGdVb+Bmd3gSVuqjiedmoRnhfZ2qwKnzBG/5k0uGvtfMBVkcOZlFE
         GBYnusCzdPbkgaucpq8h0YpyfA/WD99/MbgM29CzIWnmlAdlG633bUxvnT1Vn2LsqLTT
         8aFoLpTWe2FniMHwtbfuRMdn5/V5UlN1Ayz4tEH6NyVG9lv9SwpXJ11xTWxJXcDHgqbi
         B2NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Sy++P87sbZEppNqxvVyVv9hQ+AuUFKZHo9Yat8XC9E0=;
        b=b2I2sjG8cMz3XIgDze2LRtRBbbk/DIsyR7hv2ckjQGjFia5OmPU+p8DJsb1er16IiG
         lIKL3eiEQZk8QmbHDI4QJnXg6x1Pmx8wu69K+XrSc+UmnbQ861m4ZQknp7SVliZJ7Bpi
         BNd7iXUPHOiqSGDjtNuyeG4fAeAfouvUgWRI68W98e2zKjw+k9E0M//sUSe2852BN5sg
         OQRAi0ETRGB2zgbPN/Sen5nhIiUdGooVk16W5cHpE/qslbB6SfXQqKmkgC4gnkjd4O5q
         AOfHX+QMsFBP9KVzjOTbZhI/TyShH2aKWZ/1728iqBIAUQ/1wkV4veHEnK/tphRLZ5bo
         rDrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zN27r7lP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s13si10286018qtk.139.2020.03.31.09.07.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Mar 2020 09:07:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zN27r7lP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jJJQ3-0002rA-18
	for alex.bennee@linaro.org; Tue, 31 Mar 2020 12:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40554)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jJJPE-0001g1-An
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 12:06:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jJJPD-0001Ef-2b
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 12:06:24 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:41080)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jJJPC-0001DS-PB
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 12:06:23 -0400
Received: by mail-pl1-x642.google.com with SMTP id d24so4445238pll.8
 for <qemu-arm@nongnu.org>; Tue, 31 Mar 2020 09:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Sy++P87sbZEppNqxvVyVv9hQ+AuUFKZHo9Yat8XC9E0=;
 b=zN27r7lPfXuz7h4VK5GMvUSXyDl78V+oOkr8WLaZx8nvQFe0nq9DT1u3+VyjZq1zPx
 qk2pSM5qluSenikvBg1oRs/NTKgyb6uuPurHWovkvg35mMA46LHgn7ZCDbs9is2VPiun
 KdHOTxNGyT51CslW8O1uMIxIrLhAqJOXknnvIfGxCQuxQvfennnzXbgjhdXlt58KIDXk
 oVMrh0WZZFedkq7V583ZGFCKTv/M1m5XBs43vi7eFzfY5ROAT0/ROFhIg0nRusxE1jBj
 QGrATZRVMVrJ8x+zH5TefIK+pQXrrG5kTEntGiM4aJKGMsfEy62vERmqtZpJ6GmwUgu1
 Q4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Sy++P87sbZEppNqxvVyVv9hQ+AuUFKZHo9Yat8XC9E0=;
 b=nG+x40oFtOpHBSY9Ry+dndCElWlEUsaEraKjkH8mEDwKQzHniL6gA5AzQZ3CqK9qyu
 cTZAMRdP1KI1xvcpDXLrLVlKitA0ELOIPvMnPr9FQYFrqy2wO6GqK4y/D9H8l2oXkiVB
 gbvJDCNOXVyt1nj7D4KtNYkX+CyLLptQgcBrac/O1/w4BwDuVvO3PeMo2kmplONF7SFp
 tiDx7Ui1R2i38ZLXY5/qVrRWDe4w7rpNwEeUBBfJ/TsBIJfC8uSbUGeUwAhUBA0WProA
 tVbRYjBGHwMfvtGaGUBWgZZTCZyAP4GAlHWYb/PhP5IusbHOGF6rC3VGjDpWR3Cd+yEX
 9hmQ==
X-Gm-Message-State: ANhLgQ3AGWv4O1rkZQPObWZ+u/rcBYZzD/a7mOc0+Jj7AgKdEKW582Ra
 2S6DBJFX40Qnmu9SejvtFs2EGA==
X-Received: by 2002:a17:902:8e84:: with SMTP id
 bg4mr17617473plb.11.1585670780884; 
 Tue, 31 Mar 2020 09:06:20 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id e204sm12773621pfh.199.2020.03.31.09.06.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2020 09:06:20 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Remove obsolete TODO note from
 get_phys_addr_lpae()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200331143407.3186-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2c8317b5-68ca-c8b9-c6d7-917dc9bca526@linaro.org>
Date: Tue, 31 Mar 2020 09:06:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200331143407.3186-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
X-TUID: fnXDMtOMdtPL

On 3/31/20 7:34 AM, Peter Maydell wrote:
> An old comment in get_phys_addr_lpae() claims that the code does not
> support the different format TCR for VTCR_EL2.  This used to be true
> but it is not true now (in particular the aa64_va_parameters() and
> aa32_va_parameters() functions correctly handle the different
> register format by checking whether the mmu_idx is Stage2).
> Remove the out of date parts of the comment.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Randomly noticed this out of date comment while I was stepping
> through the code this afternoon...
> 
>  target/arm/helper.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
