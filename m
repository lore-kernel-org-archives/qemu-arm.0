Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1548974wrg;
        Sat, 8 Jun 2019 12:39:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxbYQ1MgFVkcQSoNVF3s0LwQxompndAGiSbVMndgcH+A4g5CfXbwkZK3MRyGmc95wW95iow
X-Received: by 2002:ac8:1a9d:: with SMTP id x29mr52797322qtj.128.1560022741289;
        Sat, 08 Jun 2019 12:39:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560022741; cv=none;
        d=google.com; s=arc-20160816;
        b=TRIRjXFR/+Vd3Lm8psVF+6MrpYKDgcPvwsKCaHCiMFGppsIjr35s3FhQyikidz1wM6
         agR4N7pjacMigkOh96owffw2p/KkqMNgGDC1Pl+AdEzPwUUow1n+1XcZWfL6b2RrxdeY
         J6I5v8vCNJY2V1R90Htl/x+SGx7BYZgw8X527UYm+Ez/fSLZ+DdEoaj2AqVHdlGPGh8B
         xWur2fibklJilotqsrFHGlNn4zdebRYjWeIxOQ5P8bF1w33j82R+YcIEZ3muBjyBy1Na
         diQKOnvjZ+f5jOAeSVnpwh5RWH8gxG2rr1rMI94gy9jGEYwfsf4cJV21mYgI5kGMKrEq
         Du4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=iNF66fVrfh+Mk6jIeUw/SWBN4Xy2b+MZYgPGAVRJdt4=;
        b=fIUZooxgDb8v95HT5cRKJ8uMyuJGwRr3WmO4GR8tN9vlC2g4vXpvs2T6XhQzuykS2S
         ieokWwBiADTwBvl61iVyujDEXjQYo3uIVq6oH9hFJLYkZKUkYMY1lmV1n60L4tDanT+l
         dy3jKfn2fYjKsJAnZdLMPVES/F3T+b1XmqEn83CcLehgcCXKIQaOsHNydE1Oy+QSOa8W
         eGGCuqYk3WEm0jEQO27FiocmAx/qaCoe5PSTeYZOtsebr+FmJjWjcvi0kgHPNfWc0vDm
         J8BXfgtLqkNFKoiN27YQuZrPeBAZZ/LuUei8bMHelAoC2WoKhbXwovqFq0l+0YSOiOM1
         +iDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CLWMNRto;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r129si3673743qkd.73.2019.06.08.12.39.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Jun 2019 12:39:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CLWMNRto;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60104 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZhB6-000791-R6
	for alex.bennee@linaro.org; Sat, 08 Jun 2019 15:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37848)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh1y-0007OZ-Be
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:29:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh1x-0007ba-Gv
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:29:34 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:36765)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZh1x-0007Z3-Cb
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:29:33 -0400
Received: by mail-ot1-x341.google.com with SMTP id r6so644073oti.3
 for <qemu-devel@nongnu.org>; Sat, 08 Jun 2019 12:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iNF66fVrfh+Mk6jIeUw/SWBN4Xy2b+MZYgPGAVRJdt4=;
 b=CLWMNRtoOoRCZ27bkZVHhD5Tg2U+mMnDScMBzL5CU4p9cAqBn2iyW16NgNIUoX8b8G
 FkXXm1Hq3AfYf1F609LPYN7SfYP7YDFNIXPTJtKOiSeHgCvBTDm9fNan/XX11n3VmkYR
 lCan8U4EakzwDqMekT6Eh0Ag2bEjgHQ51REy9wowWzGUnF3FgEcF5OGpUeD4ZIP5fR5S
 OTiv4pn4qATfds1HNeCxj2yr3yHWUXuz8el416WSJlnPQAFZAZmzcxfbZMhgBvABTxZZ
 zkyQcw53Ee/wDr3zPNfH9CpCxXDwaAA6H/ztb/jHDba513Kl8mGBIHNgrfzUtHTOIqM4
 d7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iNF66fVrfh+Mk6jIeUw/SWBN4Xy2b+MZYgPGAVRJdt4=;
 b=dBLZGGeewlzOThpTWwQdbmgDYhE51KUOIDjC4DvDq9/w7lab85tKOx1lNchNGxrl2g
 WHXE0Z0jjncrcPL1dgCKw+qX0P0tMjtHF3Sj3ayGcuQaBJt53Ire8IEsUA7S3Ep5hO+V
 IqnfUiK817qhcAb+z71LB5oYqANTm4czrvbcRfUhR/a0UtnSJdhgj3wrMY8pO9kuxYQ5
 B9TNdDZbgYNmPgmWxJLnJjUXmIeygNUcWL+HdZWZFs6dwHNZsfz9nyH+B3bWcvk4lfvD
 Uq88r1La2yVSfQk4uRvXo+xhsIT0xoTuexQpK/4GppjNN4KxnicZosfxIiUcCnIxTtB7
 k8kQ==
X-Gm-Message-State: APjAAAXidTo9Q/UJ/uihg3St9OYIWrKaZMBfx++jT7qF4I8WTry1cR0b
 HYXxoZI3SVvdP8foiAVBprPlNy0hNdJ54g==
X-Received: by 2002:a9d:7:: with SMTP id 7mr24842509ota.248.1560022169781;
 Sat, 08 Jun 2019 12:29:29 -0700 (PDT)
Received: from [10.219.49.199] ([187.217.230.84])
 by smtp.gmail.com with ESMTPSA id j189sm2119278oia.2.2019.06.08.12.29.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 12:29:29 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-32-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ee14ffb8-25fd-56ed-9d25-37dca0ff95ff@linaro.org>
Date: Sat, 8 Jun 2019 13:59:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-32-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH 31/42] target/arm: Convert VSQRT to
 decodetree
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S1FFsIyki0Wq

On 6/6/19 12:45 PM, Peter Maydell wrote:
> Convert the VSQRT instruction to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 20 ++++++++++++++++++++
>  target/arm/translate.c         | 14 +-------------
>  target/arm/vfp.decode          |  5 +++++
>  3 files changed, 26 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
