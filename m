Received: by 10.223.197.9 with SMTP id q9csp740276wrf;
        Thu, 5 Oct 2017 09:42:29 -0700 (PDT)
X-Received: by 10.237.48.130 with SMTP id 2mr20104242qtf.220.1507221749447;
        Thu, 05 Oct 2017 09:42:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507221749; cv=none;
        d=google.com; s=arc-20160816;
        b=lbfUbnTNFI75hqtPdYGpXxr5EXowl1iW8E31tfqXCSCx+7pB95L128XjiIm24mv2Hj
         OA7T9o4X6I2NBqix6acRKAKgM89SJXFWS1DSgYrgQnbQMrYn9coIuNMyDxH1AOqwdRoL
         Dl4eNf7nokAma5we2fZWpbjmv1j7qCjp9qp4p1MTT+D4Gx4hPfNzwW7DSaikMo/hFjoI
         UEj/1qjWAA5/xEiwMbOjp46pv21LQybPf3MWopEY/91k7JCZDvscyul95p+kEQcs86zV
         IZpI01YZRwXqSDys4JAGxzGwkfSt8c2OXeX0Pcjwng1miguU/M6caNkzvbVfVr70MtHF
         1ArA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=lIOUeVc8tjKYD47fm2srawDjzR/k2cScqRKVfmGlA9s=;
        b=eWvk5Qnb49Aj3hmTnRd7Q1QV4mLyj7iTq4bbJgMG0VGIG358OrurzP8v2Y5vW6U9/v
         FO4Hr1eIRhOcYlKmUNGljtjFWV0stNtUOG04araW1cZBF1595UnvKiW0SRh2bq577smT
         cZM37pQEttf/txoGhdV4GdOCT4/cMYPMwVmV/uMa4il3I9XkPqGu5dAalgfK/VAQl3Rs
         Y06iTbO7K4zNJl6vK4Uua4zcnygsdxCRQU/U3XaubWVG29RnqxqM1uHiOOvUzJICPEOg
         xKHCFpcqbY6X73y/gXHyPqquaILKVttyZev0vJnNSrgNEpRtRLd2zHEMFSlv327DHLSy
         /ZaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BsDFLWuQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i63si221822qkc.315.2017.10.05.09.42.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Oct 2017 09:42:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BsDFLWuQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40857 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e09EC-0000aF-S6
	for alex.bennee@linaro.org; Thu, 05 Oct 2017 12:42:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e08yG-0003nd-Di
	for qemu-devel@nongnu.org; Thu, 05 Oct 2017 12:26:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e08yF-0004H2-IK
	for qemu-devel@nongnu.org; Thu, 05 Oct 2017 12:26:00 -0400
Received: from mail-qt0-x22f.google.com ([2607:f8b0:400d:c0d::22f]:55712)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1e08yF-0004GM-Df
	for qemu-devel@nongnu.org; Thu, 05 Oct 2017 12:25:59 -0400
Received: by mail-qt0-x22f.google.com with SMTP id x54so26371008qth.12
	for <qemu-devel@nongnu.org>; Thu, 05 Oct 2017 09:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=lIOUeVc8tjKYD47fm2srawDjzR/k2cScqRKVfmGlA9s=;
	b=BsDFLWuQuLBfxc7zc4Oj52s+Zthgek3d1+NyyZyoW9z2geM4r0AB01MUeMFFs5IbWm
	c5zZXO8KHsO5auhVe9vf711983pcTC7Bn2TXkBa46IpAPEDYayOrTB49wIadFD2650Xn
	TGzy8cLkcLt+qGC9p4n1AzqtqNgCnX8mow0yA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=lIOUeVc8tjKYD47fm2srawDjzR/k2cScqRKVfmGlA9s=;
	b=oi4FSsOpnf7/BuL5nIXhM8q5TofUZwWlqdKJ/ocwU4PPOEnWFo/HdrfVHRV99EeFfB
	rHKSFLZiFM8FRLkPgWYnqIalZA+B9gIWpCoTuWGtsMqwiD4F7mIStAW5QvJXpS3Sa59h
	rd1cphbhA/afA9F0aiC2BFzpq2Z+uIiLJ4P5ThX06KP3aSmosKVCES/es5aTY6qrnzLG
	aHI5Jx0b6SBaAI7QDZSxqONLqFCTZtzuPjJfVlUoMFH8xd0DvHV0jogLqsdH2XL9dRdL
	lIDdHq+BCR0hF1Yz4nKFmtKBh3SGhdpalp5gWTvBR9EUngYGZPzNTrxHqmfhVSSFiGAb
	C4vw==
X-Gm-Message-State: AMCzsaVJ69w1A1WUh9+i7wQj7v8QVu6gEGbkG60rF61qQ+WC+N8eMTjy
	tXbJFMw0lQzQ+mcUmYrjonclhA==
X-Google-Smtp-Source: AOwi7QD9Zvh933bRfNsvdIzK2bABm25YQuDrlF8Uex2nxoty8YQ2/Z/doUlZDRYvRSOUAc4i1gbPyw==
X-Received: by 10.37.219.82 with SMTP id g79mr5648820ybf.167.1507220758865;
	Thu, 05 Oct 2017 09:25:58 -0700 (PDT)
Received: from bigtime.twiddle.net ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id
	n131sm6772690ywb.107.2017.10.05.09.25.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 09:25:58 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-7-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <86c98e0d-ed73-6d6e-d4bd-9f28df46b4ce@linaro.org>
Date: Thu, 5 Oct 2017 12:25:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506092407-26985-7-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22f
Subject: Re: [Qemu-devel] [PATCH 06/20] target/arm: Check for xPSR mismatch
 usage faults earlier for v8M
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H5vc40lWN6ZS

On 09/22/2017 10:59 AM, Peter Maydell wrote:
> ARM v8M specifies that the INVPC usage fault for mismatched
> xPSR exception field and handler mode bit should be checked
> before updating the PSR and SP, so that the fault is taken
> with the existing stack frame rather than by pushing a new one.
> Perform this check in the right place for v8M.
> 
> Since v7M specifies in its pseudocode that this usage fault
> check should happen later, we have to retain the original
> code for that check rather than being able to merge the two.
> (The distinction is architecturally visible but only in
> very obscure corner cases like attempting an invalid exception
> return with an exception frame in read only memory.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 30 +++++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

