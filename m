Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp7250640wrq;
        Thu, 28 Jun 2018 03:30:26 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdBuaq66GichHjOP6XDHdssjV1UHe8m3kOtjyBBo+fFFzyiPWjxZZYTGqdSBAzH9RLo/Ron
X-Received: by 2002:aed:3e13:: with SMTP id l19-v6mr9030272qtf.345.1530181826251;
        Thu, 28 Jun 2018 03:30:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530181826; cv=none;
        d=google.com; s=arc-20160816;
        b=iFCtre+2XgLNDoBrLPrurA2tCTA34sgKPi7/LTHEESiRVZlbf2iSQOz8FpRD6jok3Z
         mkFB1cykkKZRDSrey+TFmlBy1EA5ZuPgxnsTGQ5iBwBQ3xAnY5GSBsSikeuvruEeQYQP
         SMgN0imXgxocQ17qhmcWHhVbDybE8yJ57H71butlWlmLs8VcqJR/sktYbhUTf0OTuoK8
         DIkGeToQ4aZjDXR7onIp3eTodFpkY+F7KLaiVrMNy+8SzASdbgwYx5YKEVaJ/0M6p9Iu
         YhnsCFLLxZpsjJdiVzJvirQRRBb5/Yble1eOfb2WcD2+Pzl2NoaTDZcdublPblsUrrrH
         p4AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=PdruDTqucIYmGF2odTK466xw/U0ywsL8lGrK0G/SfGw=;
        b=sCCTbBSZ8z1WU2biMf4DLdhWd+FHQYgplJZahRZxfkvT6pbThFIlM3rEs2OCh9fFyJ
         Puc9q4FbZ7a9rvJQ3dKmVwQtFRCrmXeXrprdRchmrv2NHkYUCXVhkkYWdDY5yshBHI/S
         N09Qh0vUUWqlCDHgTy7E9aq5YPxlY1yfIRg03QD0db+8vW1kP4AhuxQCWriainfHt0cC
         QGpRv4wk1tH6nIIQS9LXK/5Qdm7umiU13WEdY1fdseKVoxyjxAe3cj9uZ8eH75H1wlh8
         2Uf71IG76GpgNLhRhSycZB0xTHKTN+XBtD60wKbQewHLrySIQg8lJzV1wafaxw7Mu1AN
         RxNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZsjsDzSo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f6-v6si171802qkd.264.2018.06.28.03.30.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jun 2018 03:30:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZsjsDzSo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35587 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYUC1-0006Cq-Qg
	for alex.bennee@linaro.org; Thu, 28 Jun 2018 06:30:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40497)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYUBw-0006CJ-1D
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 06:30:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYUBv-0007UB-7i
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 06:30:20 -0400
Received: from mail-ot0-x232.google.com ([2607:f8b0:4003:c0f::232]:37349)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fYUBu-0007T5-Jt
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 06:30:18 -0400
Received: by mail-ot0-x232.google.com with SMTP id q11-v6so3350619otk.4
	for <qemu-arm@nongnu.org>; Thu, 28 Jun 2018 03:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PdruDTqucIYmGF2odTK466xw/U0ywsL8lGrK0G/SfGw=;
	b=ZsjsDzSocTgy+RWpIFqlt+vztTP5EhHexAPAb63jABd1jl24oAryNyMCc2y5KiCSSC
	enes3mfq+WDz/OMZtGZwQGuQ74BMwGpEWlttIiSLmBFbY1ulSXWof3XoZ49jVkxclxl+
	85fYYMvT0DOjontN+S4vmGcWfnM8d74aLWwA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PdruDTqucIYmGF2odTK466xw/U0ywsL8lGrK0G/SfGw=;
	b=ACz+WDwAO8APkuFatgnmiDAkGfagliMpyAIjd6SihKVfjq8+mYWaXqW9hVNanSfc7S
	PjlSmXAseAVrlVdAJXbZAHKzjM7yeUkBe70gEr1sMszVy9Sq3yga6soBOzT4kOJMJXED
	ZybyS1s6pevknIvmOGx3VO52J+tPwq41Z40DeVxGv5P2FmaX7GN9Q8vve6JNZCoLxo61
	B974Y+1LzdakbFtjkMUBRQSZiOSNuX74sRM++0xrL9YVgm93FRnjARRU09YVTPx7dtY+
	AwBQJWO689y22Aa8S+5F8zuBh8u+1AMKeZNiRGbyTF3a+pC7Y5tB+ZUwkO5dYPZWjmVc
	eUrg==
X-Gm-Message-State: APt69E3PTz3tjHmArO8vWZtxE+BOCitkBYn+cwwhsrsqT52pyhAs6cFJ
	JusP9G4qwLoN/sIVXtk2WKSAYeVzchk6Do4TnuYHIg==
X-Received: by 2002:a9d:1a0b:: with SMTP id
	a11-v6mr5222901ote.205.1530181817658; 
	Thu, 28 Jun 2018 03:30:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP;
	Thu, 28 Jun 2018 03:29:57 -0700 (PDT)
In-Reply-To: <20180627043328.11531-8-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
	<20180627043328.11531-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jun 2018 11:29:57 +0100
Message-ID: <CAFEAcA8ZHpr9hiE22jNaZevXxCZUuZ+duaCEXz7ysE4XjUjKxQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::232
Subject: Re: [Qemu-arm] [PATCH v6 07/35] target/arm: Implement SVE FP
 Multiply-Add Group
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J3GkuSgzMRFi

On 27 June 2018 at 05:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>
> ---
> v6: Add some decode commentary.
> ---
>  target/arm/helper-sve.h    |  16 ++++
>  target/arm/sve_helper.c    | 158 +++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c |  49 ++++++++++++
>  target/arm/sve.decode      |  18 +++++
>  4 files changed, 241 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
