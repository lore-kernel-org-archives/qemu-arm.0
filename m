Received: by 10.223.197.9 with SMTP id q9csp2724535wrf;
        Mon, 9 Oct 2017 11:20:18 -0700 (PDT)
X-Received: by 10.200.12.131 with SMTP id n3mr15955810qti.237.1507573218154;
        Mon, 09 Oct 2017 11:20:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507573218; cv=none;
        d=google.com; s=arc-20160816;
        b=P19SPY31J9ZKgi8yiOkltPGhEpHMwMKcwC6Z4mQ0w0OKvqRsSfRnmoZYvxvHt1t+xZ
         31R9JUxDNHQtyMpJOI5M7f/9heRCsLj0yI+UvHEQPBJDmJyn3YFS1hG+aWswlc1H1iQW
         4YnRjAU3RWqejqS4Uyah5nJXdQrlVoIFR3DMvFKlo/FWctUOiVbXa6vql6cvwszUTmBo
         ES6+4Zw3VQY0646IeLL+FKSqgmgi6pzYtPs/RiTEnxYXMRNy/cpj52oEm+2raQr7+hL7
         RfHNrHZmcNn1S4hXwzKKOBkgkzJesnWKHyTWvQ9G9LRirY2IvBvQTjoQtzpRBZErtAOE
         xiNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=JFde07IO1mZtegRSLB/alArOIZhTxQ9UzPApDugNWig=;
        b=x+/Zpz3StT2GZQWKpuhvKNDtCZVS9zu66/WVpHSO/ZSc7+rRgBR0vuYwJkS2n1/bD5
         51kDnJL9xILz8NpdHJQcikDldPFs0ugJ2mEenVCEpRdBIk5OC/vRnZvu2ijN409VK4L+
         aYnaGC37k9AynfPcV8/tt5cn1deb1FM73k+/uQNjs2yU/G5zdy96amyktuYjFpDyKztJ
         yg1+m5+w4GJkvJY66t0ENd1VuPUAPd5MUqiAJbwdFSoMKvJqeblwevsvBxjBh1dq8jhl
         d9byjWGp2pDDr1zLMMJ5ZHdsLAFQCtweiR3kmi/JDjIJe8+wVGgikh3d+LiJWnl4HrTy
         zBoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hpXOn+j8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q126si3178149qka.159.2017.10.09.11.20.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 11:20:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hpXOn+j8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59217 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1cf3-0000Rq-NC
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 14:20:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38020)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1cex-0000Qw-FJ
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 14:20:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1cew-0005lQ-KC
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 14:20:11 -0400
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:51726)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e1cew-0005j6-ET
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 14:20:10 -0400
Received: by mail-wm0-x22e.google.com with SMTP id f4so25855296wme.0
	for <qemu-arm@nongnu.org>; Mon, 09 Oct 2017 11:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JFde07IO1mZtegRSLB/alArOIZhTxQ9UzPApDugNWig=;
	b=hpXOn+j8zvAED9VjUZnN/JOKM3V15tg8tPsZb/P8DWByGfrqemPtDGhXpWzRkFuGbG
	dOpEcd3Wt89QhKrJQJXLjAhQdavagYyFyGse8X0BbmDQYPXCWPFzbh5mXKNwVRyUnR/h
	0+kn4cH6K7eWVYHzTkg0NO3ATPR+4ST4uzaFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JFde07IO1mZtegRSLB/alArOIZhTxQ9UzPApDugNWig=;
	b=mK0fz2kY4O9jY945Bj/zofAWn2I8OHlNCeO9FdavTa5WpFQKBf+fLk7KmEMi2sxUsV
	TuS2vuL8g5buLx9iLzVzL9z87yKCT4qTp27U5okF/fqqs5ZTiOrUow+pHjo7DvjC55cQ
	beuRlOlVCxBc68/4DpPoCJFhoSFvdO/kXBqiopM2Km5mRKJp02ROZU2r5X8hbFtwRmQH
	Ly+WTTUwg3KMyGhJ/LoT0MzeiTDxgBlMAkXwQYONS4i1z+rQRjtW/DJwr+ANYfO1Zhin
	YWlpAd0O7YA9+JqGCsttdKSZicSLSRdpAWIG5OGOMJuSzIFlBmyNNQyid5zw76LzKeFh
	aNUA==
X-Gm-Message-State: AMCzsaVs5yzggVjvR7nJvh+fRKb5AciY0bcK4q14Lco6bjzrnB/EYfvB
	uB1PIIRhrHSHL4kZ3GUE277Jr/IUbir+JtWMHmUVpA==
X-Google-Smtp-Source: AOwi7QAWZzUGVZBFa85WEq0kERFH6tar/bsWvh3YiKS8CWZ2ic1wYPnwKhdtGWC4Icew8w93hJJ1aWgMCr0tE8hmIkw=
X-Received: by 10.28.236.203 with SMTP id h72mr9860470wmi.147.1507573209485;
	Mon, 09 Oct 2017 11:20:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Mon, 9 Oct 2017 11:19:48 -0700 (PDT)
In-Reply-To: <1492623684-25799-2-git-send-email-alindsay@codeaurora.org>
References: <1492623684-25799-1-git-send-email-alindsay@codeaurora.org>
	<1492623684-25799-2-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Oct 2017 19:19:48 +0100
Message-ID: <CAFEAcA-18f=10NENHVpqmhobf2camcqxVaq8KzquCSkJGknoZQ@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22e
Subject: Re: [Qemu-arm] [PATCH 01/13] target/arm: A53: Initialize PMCEID[0]
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
Cc: qemu-arm <qemu-arm@nongnu.org>, mspradli@codeaurora.org,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9GiWGzvKShaL

On 19 April 2017 at 18:41, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> A53 advertises ARM_FEATURE_PMU, but wasn't initializing pmceid[01]
>
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/cpu.c   | 2 +-
>  target/arm/cpu64.c | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 04b062c..921b028 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1342,7 +1342,7 @@ static void cortex_a15_initfn(Object *obj)
>      cpu->id_pfr0 = 0x00001131;
>      cpu->id_pfr1 = 0x00011011;
>      cpu->id_dfr0 = 0x02010555;
> -    cpu->pmceid0 = 0x0000000;
> +    cpu->pmceid0 = 0x00000000;
>      cpu->pmceid1 = 0x00000000;
>      cpu->id_afr0 = 0x00000000;
>      cpu->id_mmfr0 = 0x10201105;

This is A15 code, which the commit message doesn't say anything about.
Fixing this code style nit should probably be a separate patch.

> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 670c07a..7b1642e 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -198,6 +198,8 @@ static void aarch64_a53_initfn(Object *obj)
>      cpu->id_isar5 = 0x00011121;
>      cpu->id_aa64pfr0 = 0x00002222;
>      cpu->id_aa64dfr0 = 0x10305106;
> +    cpu->pmceid0 = 0x00000000;
> +    cpu->pmceid1 = 0x00000000;
>      cpu->id_aa64isar0 = 0x00011120;
>      cpu->id_aa64mmfr0 = 0x00001122; /* 40 bit physical addr */
>      cpu->dbgdidr = 0x3516d000;

Does this actually make a difference? The field values should be 0
anyway if the CPU-specific initfn doesn't set them to anything.

thanks
-- PMM
