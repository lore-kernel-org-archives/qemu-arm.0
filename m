Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5576709wrt;
        Mon, 26 Nov 2018 05:41:41 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WKVkVFoNoRafTmZb+23gtqR+2TD32YgP1HTCaioIp/hrGXaqWzA+gQqJ2snBQpoeNJkxGO
X-Received: by 2002:a0d:c045:: with SMTP id b66mr14091384ywd.321.1543239701523;
        Mon, 26 Nov 2018 05:41:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543239701; cv=none;
        d=google.com; s=arc-20160816;
        b=ayB3t7pKP7ERd+RsloGTxv4FrXB/g9o9oXRLJVWMkMZIvcuudSlVbVJIQnkFnao5kh
         3LVw8uqwKvBmmmRq0jPQBIptgNnFj/l92kf4GL1euEyPGqvmd1yxCaQ2/TvnM9mVJD8V
         PuKexPLmAJApibLoYlJEPP90ZZO+RzCx4hl/KLpnJ7xcTqTarYWJl4Whs5YlKPzY+UDk
         AgjYRvNqnafKMB2mHI5wONoxw3w4ZdYKPdiHVnS9aFofSBxgCjLdnnz/mx+lVUue3f5H
         JX3De64kHeytwDArGKkMMcOX4QucQZHEwv+otfNxQ6OJ/d0toVfodvUK6VaXf4rL3Gi+
         rKdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fQx4DgoOuteqpXCW4Q8FGi049W7pdtl9K1PlipSu/1o=;
        b=sWuD1e7mv/24wVhCtJWVJCo4OUxg2D+qQKJURE10eWqmTvNIAJIPPCqTv6Ec5mh0p5
         5y955jtf+5tExvaNgo2Bq3Az8srCmJHyEW0lPuvOCLUtXVSg84VDoy9LCr9XeI4UBllA
         dlLJizYKz2/6rMaSH6xdKBkNYo6MTXq9e3ms3UVI4BQeSEEoyPW2OVNJk0KoCfFSMN2N
         00fsQXynRyFMLOvx61SVl0OaVz9Dlu41ZMZyELfCdq93q8eDsyWbf+Hv3KIRwcgoDBk+
         tpNKuO5ad7KzwidNVjj4nu5uxolR6Y5VQ4B1aGwsvwxEtw9nMeltppXc2uPDa1TZG9ju
         N8hA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EMu+DQlm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o79-v6si283359ybg.10.2018.11.26.05.41.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 05:41:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EMu+DQlm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36016 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRH8v-0000aP-0l
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 08:41:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37510)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gRH8i-0000aG-IQ
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 08:41:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gRH8h-0008Bm-RZ
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 08:41:28 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:44498)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gRH8h-0008BA-EM
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 08:41:27 -0500
Received: by mail-oi1-x242.google.com with SMTP id m6so4146331oig.11
	for <qemu-arm@nongnu.org>; Mon, 26 Nov 2018 05:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fQx4DgoOuteqpXCW4Q8FGi049W7pdtl9K1PlipSu/1o=;
	b=EMu+DQlm58SVGF8D2iSVNPSDSRSaFYnd963diwoPbR3UCunEAMe2ZX4RVVxd/+4/q/
	1KONUQMlmm7n7icvIQ+6do0+lhOYF6lOJHyqqzFJEvoFLuAsOVCqSPu9kRxq1xbju3uG
	gwbbMWon2KGgtFNHA8iGlu55T7pvHPGMmmtvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fQx4DgoOuteqpXCW4Q8FGi049W7pdtl9K1PlipSu/1o=;
	b=dXMn2Qq7MvhFMya510FMX1PMKv7Qdn57z7y8LhgFEo22zCqHTJVLTKYgjHk7gfO2Pc
	MkH5C9ZsMFp5PUxKrDqwnqexjTqo0NSAUAiAtZGW8187mqavgaHbRs/KN68ocRqHD62Q
	efvpoYx1yXoLGlUpax3g1IHSkW+Z1K7Uv89lJwPUuAFkSBz7hQtvG30iv1qT7NsqyIeG
	jytiAN6bajJQr0eoJhI/7RkAIdPlS9PfPOmimT6rhroC4YJ9VBGNpgAqixLqCOQ3K72E
	dl8YkvogssuxRpjDi5+luxbnQMaWDwMPrNJymW4DZUOKhLIOki1wSHOGLl83ixIkL+PJ
	S1OQ==
X-Gm-Message-State: AGRZ1gLodHQyYr+dmQJjxmXL9eE0RaHZPTLLGdLN3zcSGKtuPGLMkTgB
	4yiHXY2fQ54DTRRQerWbbyvPvApJxvIEGmqM3XTy5g==
X-Received: by 2002:aca:c501:: with SMTP id v1mr14308739oif.48.1543239686668; 
	Mon, 26 Nov 2018 05:41:26 -0800 (PST)
MIME-Version: 1.0
References: <20181122180143.14237-1-eric.auger@redhat.com>
In-Reply-To: <20181122180143.14237-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Nov 2018 13:41:15 +0000
Message-ID: <CAFEAcA-dFhqCOdp=FHVO1+2kZXS9-jPHcRXfRLpiaYs1jEExLg@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH for-3.1] MAINTAINERS: Add an ARM SMMU section
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +ep4GNrUXR50

On Thu, 22 Nov 2018 at 18:01, Eric Auger <eric.auger@redhat.com> wrote:
>
> Add a new ARM SMMU section and set Eric Auger as the maintainer
> for ARM SMMU emulation sources.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1032406c56..3cac9f0a0c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -151,6 +151,13 @@ F: disas/arm.c
>  F: disas/arm-a64.cc
>  F: disas/libvixl/
>
> +ARM SMMU
> +M: Eric Auger <eric.auger@redhat.com>
> +L: qemu-arm@nongnu.org
> +S: Maintained
> +F: hw/arm/smmu*
> +F: include/hw/arm/smmu*
> +
>  CRIS
>  M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
>  S: Maintained

Applied to target-arm.next, thanks.

-- PMM
