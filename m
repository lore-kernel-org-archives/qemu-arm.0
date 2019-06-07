Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp374512wrg;
        Fri, 7 Jun 2019 09:20:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxpsHMiCuVFTuSsnvrC5p6yQTDNi/Sq32r8aQQryZukdjitwW82/3ZsbksnatMGJdNgVUok
X-Received: by 2002:ae9:c311:: with SMTP id n17mr43300113qkg.291.1559924450278;
        Fri, 07 Jun 2019 09:20:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559924450; cv=none;
        d=google.com; s=arc-20160816;
        b=dXy43ihzFzknErll1nebqaB8RcSBNw8p+ooZMuFXRZ3BOLhgLWTS0o9vlYxFC2rAYG
         HKeJqhctgLzIM1nKdUp5WQjGZbA6mMx06xd51yX9ePulsS6vy+K6uI999mHRtpu6aCEY
         rx7gFn0D/M9/UC2CEhY2xxuzXTZW8Nqf/w5YgwKrUZY7+WS529Ou1tnXGRxdhgVSB6NV
         XDzooQA3Al75sXgcCBO/SlYy9cRQPw+B1+M5ZKY5S2sZu4JhyoqY0R2MTZeWjWZ0COrF
         mDQp24YKklUuAv0Pbl52bW9pH5LdTE/HMDfYFQmhBK5zLyJmFl6nuUeyF5JPD2CXAoeA
         Ba2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=oHzHXPzXYlWN69DqEELeV6l5D1ewq4CPbBpdr086xKQ=;
        b=Zg6XOuURF7XEDtWwkOG3S6rniCErtES/+gkFqGulocoua6LkDN4+Gy/TKRUDmRGrag
         OHK9Z9kqeEDg/3yh8RmwvNysiKZBa5LPLWJsPmHnp1m2gHjutZsODA3mN5DLQD1s7jL0
         1Ks/OoE/aFGizckV2HPVnketWRGYp7uFAp8eiBgTxrF9Rkcb6WKwfj7YdaWqD3vi7dm8
         WUOnA6iV5PQAL3ypyKD3JoFFB4BivpxnP5xpWWCPaX+NkZ7pxWsE4o5vxYMvMa/+L6Xq
         njwfm9ATOciuGrp+rrectNHEmxtmp8kTbt35oqm5QCGvcrU2ZDlE8KIrVQAU++3EM9U/
         T8SQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pDKEQrcR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n43si164203qvg.83.2019.06.07.09.20.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2019 09:20:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pDKEQrcR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49316 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZHbl-0008I4-0D
	for alex.bennee@linaro.org; Fri, 07 Jun 2019 12:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39709)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZGC1-0002LZ-6z
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 10:50:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZGC0-0000f2-B6
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 10:50:09 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:38275)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZGBv-0000KL-Hg
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 10:50:03 -0400
Received: by mail-ot1-x344.google.com with SMTP id d17so2088401oth.5
 for <qemu-arm@nongnu.org>; Fri, 07 Jun 2019 07:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oHzHXPzXYlWN69DqEELeV6l5D1ewq4CPbBpdr086xKQ=;
 b=pDKEQrcRtCeBpPN2En7vgEXeLf8WNQS6mBmsrD2/yoMT869VF5HXzLcYqypICrDKtP
 Vnqh//8/ejxh1iZ3ErH6vLHlmjlgaNfcmvmYd+sH/iF7Xog4NrTMeAvXdru5Ggnoi78J
 7RFzmLfsOBDX46SzSAZXFmnPvwJPWOnkUIiIfgKWwtBs5rAlrburQ3hJ3DFGO2ou5zNN
 w4FdBdUr8wSRSGdkNbJYgbJBQUOX2KKidqt6WCrveP1huKmWdcZFXBiJFdFz0b6AiAm7
 FefJE8671jCQ8IXN69I/o32CYKxgEMC89j4NgAOyDp8Dpu71Hf3zkQ/XCYAgDLj0CpNr
 DLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oHzHXPzXYlWN69DqEELeV6l5D1ewq4CPbBpdr086xKQ=;
 b=QEZAPcAFQCYKMnMG1UqNUx2wm10r6dQBROZ1DdGmWq7BAe6vdGIyTwDRNH00UqExl8
 wtTfsRy8P7pTbgED8uAa+STSChBCQmypszCPvz1UFce70ZxOqgiA0UdjoUmwITzg9FMw
 iuOUonhMr2ZAfpJJapMWNFYfTkxj/tc0EP0uiA8RQU594yEqTeUKV98DJ5+/NBTcpmOK
 CjuEZtQe4MXyOZiHEkWGBuZO3d8z+Runs4BjZ8mA2QHX9a02EbnSDD/U/pQElQx6G0ks
 DrVcGpYbXHsLGSoOnRh2OUQ59URgmYoiYUjW/eozot5FkllP47+4wPOS+Ynf6svqhn37
 eMjw==
X-Gm-Message-State: APjAAAUMxSrjfA+hJyU4ZzqNLlzvpKvu3Ct/HQh9eeC3Ro4O71PJFVpc
 ui+4QLA/6hWD4yZMXah3jwP17g==
X-Received: by 2002:a9d:a0d:: with SMTP id 13mr20031406otg.238.1559918997692; 
 Fri, 07 Jun 2019 07:49:57 -0700 (PDT)
Received: from [192.168.3.43] (200-56-192-86-cable.cybercable.net.mx.
 [200.56.192.86])
 by smtp.gmail.com with ESMTPSA id x21sm805430otk.4.2019.06.07.07.49.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jun 2019 07:49:56 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <94c6b711-7944-e2cc-a8a7-9a653409a6b0@linaro.org>
Date: Fri, 7 Jun 2019 09:49:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH 03/42] target/arm: Factor out VFP access
 checking code
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
X-TUID: CpK9zfp8rYLD

On 6/6/19 12:45 PM, Peter Maydell wrote:
> Factor out the VFP access checking code so that we can use it in the
> leaf functions of the decodetree decoder.
> 
> We call the function full_vfp_access_check() so we can keep
> the more natural vfp_access_check() for a version which doesn't
> have the 'ignore_vfp_enabled' flag -- that way almost all VFP
> insns will be able to use vfp_access_check(s) and only the
> special-register access function will have to use
> full_vfp_access_check(s, ignore_vfp_enabled).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 100 ++++++++++++++++++++++++++++++++
>  target/arm/translate.c         | 101 +++++----------------------------
>  2 files changed, 113 insertions(+), 88 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

