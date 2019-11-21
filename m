Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp3386546lfc;
        Thu, 21 Nov 2019 04:01:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqwqAxeg1zP3TCBWUaqoam6mwAx7h2eJNuMnLYj0LeZ9DmWy+FocmV2fInjLv6dWzPDcwD27
X-Received: by 2002:aed:2799:: with SMTP id a25mr8174863qtd.226.1574337662868;
        Thu, 21 Nov 2019 04:01:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574337662; cv=none;
        d=google.com; s=arc-20160816;
        b=hz2BBQOHhCP2/a+9crZopQnF4NeuqL5JVV+V9h9cicVHTCyZe8rMjgiK1kzjzK60m1
         YI+DpDFVbVr+WM+/YJDsl8squvYUXGGy92teXFBczYr40BeZXJr/egPfv7FonacHUA2t
         ADBRpVp0RwdN8igW9AgBxz/spUJZdv5MBorxz0WRo1YpIbv7YoG9JqCCeOXrqlEw6xVZ
         KyW8Ct0yKi3JAe8ZsIXVMdUBS2ranPA/etOtcaCQjBZ1W2NTJ90rJCjev1Khc+eTsRLd
         TCAA0mwmSqcUyFET3RQx5X9hx4D1E7euoHvDoTuWzq0A4yVDBhGUmmHhGJ5xc+zMRulK
         ylRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=1ZSVUygWqqvpgPVhgmoisGrNwXh6NiUNOAv/hgDFlws=;
        b=OxFLBNj5N1JL942HYAa6DSTqrIMWUmoSiPPB6HwK2MvS6BZmuyGBfWgvMMWFtJzCbD
         6zo0Lw3BMNgcwMPZv+AiaQwPGAyrHAqQtOoT0psl0HJWpVRbCIT8vSsC5PeMHMm3cl27
         EHajGY4IqOWZK7FP3IfGt3yoXaGOxIP1/qb8Y+3GHU3n/Hy5jyrgJXtcm6+eWb4zkQH5
         oCse/oFumMVm++2RWep+NXUBcuCm4d9aS5nQDW8vU1wnUDchNLN0gYAjuMo1elVrfQ6k
         d/j6GJxOi+s1wCC315Ucf2/sD9YU201DNid7umfDOu/A01J5LqVD3IJfcthNwV/swLK/
         G2Rw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="WMvS/5er";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c16si1772656qvb.118.2019.11.21.04.01.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Nov 2019 04:01:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="WMvS/5er";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iXl8v-0005Bm-OY
	for alex.bennee@linaro.org; Thu, 21 Nov 2019 07:01:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35616)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iXl8l-00059O-3Y
 for qemu-arm@nongnu.org; Thu, 21 Nov 2019 07:00:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iXl8j-0005UP-M0
 for qemu-arm@nongnu.org; Thu, 21 Nov 2019 07:00:50 -0500
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:38063)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iXl8j-0005UC-Bv
 for qemu-arm@nongnu.org; Thu, 21 Nov 2019 07:00:49 -0500
Received: by mail-il1-x142.google.com with SMTP id u17so3000502ilq.5
 for <qemu-arm@nongnu.org>; Thu, 21 Nov 2019 04:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1ZSVUygWqqvpgPVhgmoisGrNwXh6NiUNOAv/hgDFlws=;
 b=WMvS/5erZw/LIJpzjJZOWcQLVYTSOLBdJ434G0zO/hNV//y6dPbfBJd69XjdwzarKR
 T6iKQ8It9hGBlmiS3mPu8vOGXnfq62mKLYbf5WQ3Vl202PnYeuma8ArNEnaGIYRS+55A
 LMy+KSNIITh6C2yNwn8pFgkk9whH324txyPYTPM5zwMF1wmh6gTO10XrWY2dbBNuYh1S
 ite6nabo8bZtrnYtJx4LZ4hdDdtZDlPHxbbozJr18v4xOAy18+qu5tCiCNdncIPyFeeg
 PxbwacB2JQimMgWVF6FC4sKpIvzJpJh9B1q6j9vMEy0FmeYd+8NUsFBrqyfwxw2WITf3
 Ln/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1ZSVUygWqqvpgPVhgmoisGrNwXh6NiUNOAv/hgDFlws=;
 b=tY7f3cG35qVE+HcEX3kM8BnxxeiWEt3/ndAf1Qqec7nGsE2ziE99dFBTecc0qBN5Ai
 U91TwjjxEdaknxGF5tybe8s/rUXrui2DAOvn3Ag3+BWNQJHq/T4D/VOiu2dT/CeGrncv
 8GaaXD6kFyyEEi5XWu3PD51Vr/z5WV08IXyvQlIwbLn3lEfcYU5PomkuDZhi3fxsEOiQ
 ev6parAG76Mmc845uiCzioWQjw7tuoQ7UurVJows9rJ6yinVIQankQUSoVFzLXWgT1nh
 zEmn30pOotw7BiYM3WLNQ2Zxa3nmml11rZP5+jTDAjaDOhb6StLl13N8iVv1TbP7345u
 Do0A==
X-Gm-Message-State: APjAAAU7ph8GqMBqN01Sdxq4JPWQqludV2uG3OcMTc1VtLVQtKzP4hvo
 reIalqncbv71wLxWrOwwIb8DeohTX/0chQ==
X-Received: by 2002:a92:1d51:: with SMTP id d78mr10050371ild.166.1574337648267; 
 Thu, 21 Nov 2019 04:00:48 -0800 (PST)
Received: from [192.168.44.35] ([172.58.139.152])
 by smtp.gmail.com with ESMTPSA id q7sm1024353ild.81.2019.11.21.04.00.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 Nov 2019 04:00:47 -0800 (PST)
Subject: Re: [PATCH v2] exynos4210_gic: Suppress gcc9 format-truncation
 warnings
To: David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org
References: <20191121013859.287372-1-david@gibson.dropbear.id.au>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f0190fa3-ac79-e936-6a71-4f6d8df98689@linaro.org>
Date: Thu, 21 Nov 2019 13:00:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191121013859.287372-1-david@gibson.dropbear.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::142
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MS+1kLcvda+S

On 11/21/19 2:38 AM, David Gibson wrote:
> exynos4210_gic_realize() prints the number of cpus into some temporary
> buffers, but it only allows 3 bytes space for it.  That's plenty:
> existing machines will only ever set this value to EXYNOS4210_NCPUS
> (2).  But the compiler can't always figure that out, so some[*] gcc9
> versions emit -Wformat-truncation warnings.
> 
> We can fix that by hinting the constraint to the compiler with a
> suitably placed assert().
> 
> [*] The bizarre thing here, is that I've long gotten these warnings
>     compiling in a 32-bit x86 container as host - Fedora 30 with
>     gcc-9.2.1-1.fc30.i686 - but it compiles just fine on my normal
>     x86_64 host - Fedora 30 with and gcc-9.2.1-1.fc30.x86_64.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> 
> Changes since v1:
>  * Used an assert to hint the compiler, instead of increasing the
>    buffer size.
> 
> ---
>  hw/intc/exynos4210_gic.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
> index a1b699b6ba..ed4d8482e3 100644
> --- a/hw/intc/exynos4210_gic.c
> +++ b/hw/intc/exynos4210_gic.c
> @@ -314,6 +314,14 @@ static void exynos4210_gic_realize(DeviceState *dev, Error **errp)
>              EXYNOS4210_EXT_GIC_DIST_REGION_SIZE);
>  
>      for (i = 0; i < s->num_cpu; i++) {
> +        /*
> +         * This clues in gcc that our on-stack buffers do, in fact
> +         * have enough room for the cpu numbers.  gcc 9.2.1 on 32-bit
> +         * x86 doesn't figure this out, otherwise and gives spurious
> +         * warnings.
> +         */
> +        assert(i <= EXYNOS4210_NCPUS);

You should be able to do

    n = s->num_cpu;
    assert(n <= EXYNOS4210_NCPUS);

    for (i = 0; i < n; i++) {

What's happening here is that the compiler thinks that s->num_cpu may be
modified by the loop, and that's why an assert on s->num_cpu doesn't help.


r~
