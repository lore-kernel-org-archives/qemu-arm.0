Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1597702wrq;
        Wed, 13 Jun 2018 22:43:45 -0700 (PDT)
X-Received: by 2002:a63:86c8:: with SMTP id x191-v6mr1028392pgd.2.1528955025273;
        Wed, 13 Jun 2018 22:43:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528955025; cv=none;
        d=google.com; s=arc-20160816;
        b=mZR5XhOTZmEbf1uJgeHgSClNOkkzIi3GgU4T1/g8JlUnxurgvYhYz3Nx1V0oea2nVv
         N6Mhm5NJfl9bm0CvMFiN+y0SiEBp7oyXkyp0OjAqQj3KFNvhs6EOG6LVKitUXDQG9cKB
         QGz5PLoAaPbKYObi2e7sljzPXBgjOWzsBHdODm34tjKXGhmZV/1Ddbpip+wAcDgs6KW6
         nXjfCmRLUgfmMR3J+7HewxkFDje7kS2b7lsrtSUjcAHqpSvDLmoeWpQUnu8/O6GHEC92
         EJTevSyzZdeKiwiqrwPDLuZhqyqxfpF2TL4I/bxEeAPCMAwCUzVPaXNmCa0ZlGmgO0tG
         VZdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=/bdUf9VpjhhQ54VP5rpSnn23zAmxlF6qK9wk1mItojc=;
        b=0DtGgvUygTsk5PoE4yZysCw2Ji/RHPiRjQ0QR6tRebNr4vTXiB1q7nKDtbeySn30Im
         //YJa0KeUrwzMDZ4EwEyOsnYc60b9JWOWCPlPCSAGiXfpo6qendbRadaYUdgoPShWOuS
         ag1gO1wxGyGP5LGl2iAryK/A7V3uGjcVFFSOPnv6EWUyP7I5mqNuykbwMR0O5XLQr+bf
         Ha9CGABsvrZO7MVr5Y87xu61mUa1UL+jkUSlF6MM4rRGMu8PyA4ovgVx6xnz6M9ftxy5
         k+67rpSyLj6k3E0Wn0E32ug/N6K4t6/xNhQMDqjBT8k1c8EOp7CHmwBSQrzBpg5kGJzM
         kH1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aLRzq5gQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x15-v6sor1645096plr.76.2018.06.13.22.43.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Jun 2018 22:43:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aLRzq5gQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/bdUf9VpjhhQ54VP5rpSnn23zAmxlF6qK9wk1mItojc=;
        b=aLRzq5gQR/ZGNJdFYJNT8szM2UhDS/05mnQhJpfMdmBxu0aNaZbVIJo/FHhqdF9wb9
         z5xCUIQqyv3y2gNvLachFwj3a55krXMpLuPqYtIWMF3nvkS269nFlOCppi545GHPL89c
         Qn5va/XGwgC1WelMjfnPddadsHBql0pZnIQkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/bdUf9VpjhhQ54VP5rpSnn23zAmxlF6qK9wk1mItojc=;
        b=VeeUAdF+1Ag3amGMezokkWdgia2Ilfy0ZFsAzH9JEGMoYfCHAij5Eip3E0cWL9tHZc
         CtMLq6eQiH4OHvOjdtuulK9s6jpZ25LHp0z1fC3N+QBcTybV8nl+pl+2SadB+83wZme6
         LiBJafSfEIZh1DWAwRjccGp4NZ2qceXpW/AS80RwU4iKzON8Cmio3NFWRvs2v+m2AsF3
         P1y2jyaKHdKf183TuZmssd1GlR7iSNfKq1vq2aGCO4Ni+MbFzEXOlF/EJw1bJR18QlZK
         ++DhJMAeSskL2MJXbwylTuzWHQRWQcHuiCykLYzF77kK9GtNQd1Od8rIE9fubrDHmeSX
         y5Ww==
X-Gm-Message-State: APt69E2CXLTY5/R6hDosEm9ldKJtPuUhyi7faCouaPLje+Qnvee5lHnM
	+xVFkXPhaQA4lXxw772dKGNGmQwe
X-Google-Smtp-Source: ADUXVKIjgs8HKygKrGJ01sYZus7m7FJGENc2xEFhP4DYhJ1QdZ2S3bA50R0Y/ChwZLZWknBjtw9aOg==
X-Received: by 2002:a17:902:6b86:: with SMTP id p6-v6mr1360898plk.75.1528955024876;
        Wed, 13 Jun 2018 22:43:44 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (rrcs-173-198-77-219.west.biz.rr.com. [173.198.77.219])
        by smtp.gmail.com with ESMTPSA id e189-v6sm6988576pfc.134.2018.06.13.22.43.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 13 Jun 2018 22:43:44 -0700 (PDT)
Subject: Re: [RISU PATCH v3 04/22] build-all-arches: do a distclean $(SRC)
 configured
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20180613125601.14371-1-alex.bennee@linaro.org>
 <20180613125601.14371-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6006f5da-f3ae-be22-71f4-4beb12ceb4bd@linaro.org>
Date: Wed, 13 Jun 2018 19:43:40 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180613125601.14371-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: EPnq4a0nuOu9

On 06/13/2018 02:55 AM, Alex Bennée wrote:
> This can cause much confusion when you have been building in your
> source tree. I've added a distclean so we don't unexpectedly drop the
> config for normal make clean invocations.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  Makefile        |  3 +++
>  build-all-archs | 10 ++++++++++
>  2 files changed, 13 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
