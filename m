Received: by 10.28.71.27 with SMTP id u27csp4843747wma;
        Tue, 27 Feb 2018 05:51:20 -0800 (PST)
X-Google-Smtp-Source: AG47ELsvla3VIVAp3iHaFyHEATWqE89/lLJJ7R/lXNt6nXKwM+ZW67LJV8nGjt1+NfUpJD3dylTN
X-Received: by 2002:a25:c6d6:: with SMTP id k205-v6mr9234830ybf.269.1519739480660;
        Tue, 27 Feb 2018 05:51:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519739480; cv=none;
        d=google.com; s=arc-20160816;
        b=S+u4psLaw3rttiuQYt/nrMuOZ3szKpHaH2n69WN4KxQj7Aaiy0fo13v8W0D7pkK/VB
         rMHU63SlRNuWdLuA/0Mk+cr+A2TQ7U9c0BGactpG6bj2QlkHbs7KyJnItIOZvkwxEL5Q
         4yzPECK1Jgw+xETCmubvNn1DvijbHPhfrjXOCYtJzi1POjxM+mMoFFCWRCK8ftJTDN5R
         LFABXlUdHEE3wRQQ/qVm+m5kTXz0JVW/VUFkpJtqe5vc2cXXTTHsvPuMrDhxCW0FACxm
         lBXtH8neyzR0BflOISW5HjTF5rbd12wLlwKluxmN21vWTB/CQ8dvPMK2slWvNWaaJVZB
         uJRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=qzYAMKLmcXbLynnxXb+Fjjj166IY9SpbN/p7A8peMfo=;
        b=qSRRyxgwVCGzGAzgPAgL9V1FEMU/ymiiCSLbsChdIw8Nk27jIJpEMezdh8jt/ZkdU0
         OzIZQeAoqXE3j4KRivMZvCqWPTe1TcFBP2sE5SHTOwpNzNngBhiSJOPAF8TI+CIGyFcv
         LGx85K7kJpCoSlbg/PWxd60lPoNk02yc5XkcsBRMdNPST7+lNnPOzUodPwyo0c/kYyGR
         ne5nDb1qOxcQCCogjBontna6rEQNW0S9D9JXCJp/1+gXYuVwYqFsmMAJmJYrREjUfiNk
         Ig8ggAJyaW/3CDgu3BvXJ25j1z8GvbXnepkM+GJNrKtxn9UfoNZCexWZMeLPR5euLwah
         kFzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IQohDzZS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 189-v6si1915081ybo.817.2018.02.27.05.51.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 05:51:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IQohDzZS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37273 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqff6-0004nH-32
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 08:51:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42252)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqfeu-0004lp-49
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 08:51:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqfet-0004EQ-CN
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 08:51:08 -0500
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:34421)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eqfet-0004EJ-6x
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 08:51:07 -0500
Received: by mail-oi0-x243.google.com with SMTP id c83so12908769oib.1
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 05:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qzYAMKLmcXbLynnxXb+Fjjj166IY9SpbN/p7A8peMfo=;
	b=IQohDzZSS/C8WyoSuB4lH5TzESnL7mzjDT2UzQOMoNqaf+Lxc13ovR1vi1l/SIboPk
	IrGj5KAhZI3JAzKv7fMAfCl3rMl40h47JNOGbHvXMc1d4EgSfRRI/hdn9bYeQrbmABIL
	0GES5jOrU+h/EyOP2pSKZ9DxWqXD7ptzmcAfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qzYAMKLmcXbLynnxXb+Fjjj166IY9SpbN/p7A8peMfo=;
	b=XUTHBa298wx44VUFXkCQWPDneKx3YT3+WHrde3fUmakciuyJeaCu3M8bUFbW58D2Hd
	fQ7HSXBOoRnYdWYMIzxMX+5rayLb4sGhK7Ysz9ogubElbUkKuPaYljdrUiz4X1DB3+fL
	yw1OsHrnZZG6q9AGO6b2TFCErSkXb9D/pFaI1HDEVZJTTfTesHI9z9CgeYsmuQ3RWTBb
	70wx8hlT7nxHYrAObjIlwUEynXj5CqK2gxEbGMjYlFDJBnGAx4MiwbOQdfQNfcUVHBZG
	oZLriMm9I2lEU36F6Jbvk+7JvaXbtgevVrZAAzfIDffyBuefof+Nt1Nmhl1xTjoVeWbu
	0G5w==
X-Gm-Message-State: APf1xPBS23MvAs15HnOgcnadRPTzw6G6uiYCetkZs33zIKngx/P26UBn
	ktrIOZxrTbor10ioylHUVzWiA9LUJLOHz9GC8wDxt5LK
X-Received: by 10.202.216.67 with SMTP id p64mr8742579oig.337.1519739466484;
	Tue, 27 Feb 2018 05:51:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 05:50:46 -0800 (PST)
In-Reply-To: <20180217182323.25885-49-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-49-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 13:50:46 +0000
Message-ID: <CAFEAcA-gMG-V0dudD-9B2msPYMC7NmkU3Xsz9GimxMhVwQtPBw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 48/67] target/arm: Implement
 SVE floating-point arithmetic (predicated)
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
X-TUID: WCR/FacciQjz

On 17 February 2018 at 18:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  77 ++++++++++++++++++++++++++++++++
>  target/arm/sve_helper.c    | 107 +++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c |  47 ++++++++++++++++++++
>  target/arm/sve.decode      |  17 +++++++
>  4 files changed, 248 insertions(+)

> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index a1e0ceb5fb..d80babfae7 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -2789,6 +2789,113 @@ uint32_t HELPER(sve_while)(void *vd, uint32_t count, uint32_t pred_desc)
>      return predtest_ones(d, oprsz, esz_mask);
>  }
>
> +/* Fully general three-operand expander, controlled by a predicate,
> + * With the extra float_status parameter.

lower-case "w"

> @@ -3181,6 +3227,7 @@ static void do_zpz_ptr(DisasContext *s, int rd, int rn, int pg,
>                         vec_full_reg_offset(s, rn),
>                         pred_full_reg_offset(s, pg),
>                         status, vsz, vsz, 0, fn);
> +    tcg_temp_free_ptr(status);
>  }

Shouldn't this be squashed into an earlier patch?

otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
