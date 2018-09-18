Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp5571014wrd;
        Tue, 18 Sep 2018 11:48:29 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdaTI94T6i93KSeZeZr6akrdDZx0ZUZ/iCQzWzpqUDAs/dF8ePgrQ0RPD8lRkmBtvhnVRnA7
X-Received: by 2002:ac8:51cd:: with SMTP id d13-v6mr22607141qtn.80.1537296509376;
        Tue, 18 Sep 2018 11:48:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537296509; cv=none;
        d=google.com; s=arc-20160816;
        b=0rC6dLpGuKPHaw6E3hQpCl2dXZj/pxDQVwgp+2PLJGhmN0pmjAFzPHATPeaMJwzjA0
         cGy5A8wH9MfUM9slJuGbVr0QELWdvXmYD8AsZArH+7Zk39KDn2nHnLn4z41yNYtIz2IW
         zKGZ6S2fzQqoDNcYGgLsHFc7qdSgKE3zWGsOqrjYq6skcgnRTQeZlWbSfNxN2ugyn0Ue
         Oz1dUa+JRNFDNQdzvpF3xMDauu2obhCgDnkrsfTVPQztsKhXgq6hgE773LwaCbQMJ3jp
         AlcUlr4miqvGApt4QFyOhcLzpwmUHir71xW08eT6qfkWfk1OGl06iO1PMte3xoMcSNWM
         pFJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=jTq/LLLR2K+i4vilPtmblGyOKk6X7a8xIOUVVqWRUJw=;
        b=UvQBB8zim0QZomtylOTqiaOz4rMQVYQcXan+2stQtSc/51xA5DL2BAj5fCxjQ7wxZF
         z0t0gqvXfz3+AKZUND1hcDKJHfSQ9R4thLbv+4I8oI06FjEgtt9fPCIMPhDUv8Qe6zts
         7aorXBG3EmB7q/9xPbyjuKyR15m0QNJ5WOOyy2nzG+w4cMPJVLeX2wIMOcnx04D0tfDm
         XVgPuxGSaW3wvJe98A1IRlQxNuXSt3FNXpQIXnPtc9gcLhVx4egA2YDwLi35130mRDb0
         7n1YOxqt7l/PzmVkZBYMSi1j/Yh9ydnLrYMS3mQx6PSF4dtOgqxOxjbuyjX/h5q9tsQJ
         TeaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h2dZiIVn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u43-v6si6699596qvh.150.2018.09.18.11.48.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Sep 2018 11:48:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h2dZiIVn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42085 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g2L2y-0003fq-2t
	for alex.bennee@linaro.org; Tue, 18 Sep 2018 14:48:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55305)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g2L2e-0003TS-82
	for qemu-arm@nongnu.org; Tue, 18 Sep 2018 14:48:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g2KwS-0001Dv-Ix
	for qemu-arm@nongnu.org; Tue, 18 Sep 2018 14:41:49 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:43150)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g2KwA-0000N5-AT
	for qemu-arm@nongnu.org; Tue, 18 Sep 2018 14:41:43 -0400
Received: by mail-ot1-x341.google.com with SMTP id u20-v6so3035216otk.10
	for <qemu-arm@nongnu.org>; Tue, 18 Sep 2018 11:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=jTq/LLLR2K+i4vilPtmblGyOKk6X7a8xIOUVVqWRUJw=;
	b=h2dZiIVnUxFk1GK+mL9oAbRf5F+u+95jNKTHcBz9/VD8Rh6aI4TIfCNOwiez3A2WNa
	5SIscInd3pF1uXgVhe4kDsLixVhNdPRWJHXWfBV5xJFAQb9tgvSXy1gVSsHlBBHMWYMD
	C6zAFbjmqNMuZOP2uIG36vkZ2Se03TR57mf4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=jTq/LLLR2K+i4vilPtmblGyOKk6X7a8xIOUVVqWRUJw=;
	b=Tku9yE4Ufvq+JOZsIupH8K0ALwnQ9LhII9DklME2h0EmZWBOG9XhpKVpuNowWhgOTh
	PkqkdwbVxGwn60bHZY3sZCZYigHyWBcJ1gFG7mBOiecMtHgvCJBY2T2RcB1BSt1Xpo6I
	pWLnIYsGgj7oooGhanZYTPjZDNfPXMVd9+rxcScBu3ZypCpcuzQashuqCvIeq2lHoR1+
	iWQCPdB/p4hp7RN6UZaSrDcgxMFMvVIlvLGgbRbbKT+WgIt/F8AI2P+Tj6CSCMnYhU4e
	PBX8y4JO4bgk138bMHsWslZ7qGxxmL3kem7JTm+SJI8H1+EwNF49KFWSAsQooP0qqn08
	03tA==
X-Gm-Message-State: APzg51DL7d/BTRINbD0vtSQlD4W1VQfQ8zYzdvtfmnsvCif4TVsf7uLK
	SPwWA8g1IL2goqX/JS8wW7QA4VRYRHbi9dJGfuYCew==
X-Received: by 2002:a9d:32c3:: with SMTP id
	u61-v6mr16071095otb.173.1537296077992; 
	Tue, 18 Sep 2018 11:41:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Tue, 18 Sep 2018 11:40:57
	-0700 (PDT)
In-Reply-To: <20180831103816.13479-4-clg@kaod.org>
References: <20180831103816.13479-1-clg@kaod.org>
	<20180831103816.13479-4-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Sep 2018 19:40:57 +0100
Message-ID: <CAFEAcA_61srcBba4Q=QoOPui35HeJ8m0S93DHkBcm5Kenp+1JA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH 03/11] hw/arm/aspeed: Add an Aspeed machine
 class
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4fFnCj9tF2TJ

On 31 August 2018 at 11:38, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> The code looks better, it removes duplicated lines and it will ease
> the introduction of common properties for the Aspeed machines.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  include/hw/arm/aspeed.h |  46 +++++++++
>  hw/arm/aspeed.c         | 212 +++++++++++++---------------------------
>  2 files changed, 116 insertions(+), 142 deletions(-)
>  create mode 100644 include/hw/arm/aspeed.h
>
> diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
> new file mode 100644
> index 000000000000..2b77f8d2b3c8
> --- /dev/null
> +++ b/include/hw/arm/aspeed.h
> @@ -0,0 +1,46 @@
> +/*
> + * Aspeed Machines
> + *
> + * Copyright 2018 IBM Corp.
> + *
> + * This code is licensed under the GPL version 2 or later.  See
> + * the COPYING file in the top-level directory.
> + */
> +#ifndef _ARM_ASPEED_H
> +#define _ARM_ASPEED_H

Leading underscore followed by capital is a C reserved
identifier. This should just be ARM_ASPEED_H.
Patch looks good otherwise.

thanks
--- PMM
