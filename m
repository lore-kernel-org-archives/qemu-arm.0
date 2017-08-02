Received: by 10.25.44.15 with SMTP id s15csp6417152lfs;
        Wed, 2 Aug 2017 10:48:45 -0700 (PDT)
X-Received: by 10.55.168.214 with SMTP id r205mr29583803qke.155.1501696125492;
        Wed, 02 Aug 2017 10:48:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501696125; cv=none;
        d=google.com; s=arc-20160816;
        b=Xgdrcx93tLR7y5HCHNvoeJRLgG/UAZ5eW2B/Dp/oVBCeNU11ZUr+XYlKrTqpodoRb0
         JLZHZrgmllKkyc9/g+q78mRAI8w94akBL3xR1hIfsEayK8ECUSZ7PAHuJM8DvIKRTACf
         t39FEfeLA4GwsxFqiPRili48Rf5Uqvt6k5iOyC1jC4buWmUiaH6YGCE2p0R+s7Qkjohp
         KqhBJTx1PM9eYbSQsxn3MtX1eOehYZd5k7Q7wuwtgMtV7cPmWppvg1sgpBd1OHXgyHJ+
         d+yyPGe7/1S9maJ0bk2o2ZUAoCyDX3XklbCBD43f5IHQ7MS+BS7R/PZBArYmPO8Gf21P
         Muvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=6dAyCeVoJcpU2vtnI//BkDJWU/LZpgOF/4FjXyXxguA=;
        b=JIsbH16ngKtRkZZG+SUdGqT0CGot3HbR1lgCrztYMsH38k1eQRzhjHRz4HyX9/8HiY
         8b2+5oLOhgCIZmBBPPg8tvhjcT/5P+Qr4+MdhmPtMzPtB6o5R5cqLsqH2fALwAk4V+06
         jykd+L1NlFCQMipdOKr2Mi964iTGQEYdOwqgKW1zdOBZbWbQnMacZ9vYe12e8jO5uzGo
         RKSAv2SX1rsZi8Fxt+k0tWmt6M3PC6U28mDR7wh13qBpzZaiha6BGRML9EJOoJwEcfnC
         twzCznlAUFqN3LPiYb0YyJdIP9DdXmeQ8jAJDmRHKDu3tnIsqg+03+/sgOObEjZPg/CI
         R2Pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=I6Ih6RFn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t15si25742462qti.532.2017.08.02.10.48.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Aug 2017 10:48:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=I6Ih6RFn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49151 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcxlC-0005NO-KQ
	for alex.bennee@linaro.org; Wed, 02 Aug 2017 13:48:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1dcxl7-0005Iq-1q
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 13:48:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1dcxl3-0000Ff-PX
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 13:48:37 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:33215)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1dcxl3-0000E8-HT; Wed, 02 Aug 2017 13:48:33 -0400
Received: by mail-lf0-x241.google.com with SMTP id 65so4245056lfa.0;
	Wed, 02 Aug 2017 10:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=6dAyCeVoJcpU2vtnI//BkDJWU/LZpgOF/4FjXyXxguA=;
	b=I6Ih6RFnA47tzezsRR8cinaYatxXeepaPHzEGrN19RjnXW4HWIrzMBqFQUr0nH1YFb
	TZrauO6BsQA2DVbBHHXEM2H1v8cN5BtLPmYBeMOQ7xrRJGPCZ37NFNR3iDzte3pfetq4
	EuNpWTOsc3Ie+zhIWNEA21yMljX/QFdwDmWGX/iEFkGn2wfQy0pJCXksmAayQwih/89p
	R8oQ/IBD+rddlfmmOgqrRs1ORQ8OzfWDRWn7OqBsBsxCqTnvecFYATQe+LHF3IJt+R4g
	u4NwHlPB71AHcaZQr/D285MMgYJsd5XX2uWLRg5mrLyX1RXE+XjKywE/bNhcOg6p/DGK
	jllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=6dAyCeVoJcpU2vtnI//BkDJWU/LZpgOF/4FjXyXxguA=;
	b=V4Mlvqn7uIUgMFhbhHNIZniHApXtq9EDSMG3XRQDx3gVqHPeIY2kbjlnki85RkNth5
	K/VlXRWylHwNrmJjSmV5xMjYHjXf+vVh11x66I7gXbrUsudbbFjalLa8RoTLDCSd8npJ
	1BX0zF+aQ6NiOvojSvwjEbGHNmAKfFh5aMaTXB60eogCuckk09UHywjPUnakc6moHAuZ
	+yyIBkvR/XuhD7yigJz3v481mEvc/k4wDDdt5pRcvhF3vB+VPMYLALYkYRC/ZKTFz705
	VSPaunG+vTE2AzFk0Iun13+DEBlmBKiALpyd8RAZFhfPojJZ8gDsqsWmu7ClH+OyRvT7
	O4wQ==
X-Gm-Message-State: AIVw111SGGcelC2mzztDo6CBo/CIMINSobk5VAdssGlAy6YwAUlkR4SA
	xQCG25rRyuaOrA==
X-Received: by 10.25.56.3 with SMTP id f3mr6645552lfa.253.1501696112158;
	Wed, 02 Aug 2017 10:48:32 -0700 (PDT)
Received: from gmail.com (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	n72sm3888849lje.51.2017.08.02.10.48.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Aug 2017 10:48:30 -0700 (PDT)
Date: Wed, 2 Aug 2017 19:48:29 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170802174829.GK4859@toto>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-6-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501692241-23310-6-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-arm] [PATCH 05/15] hw/intc/armv7m_nvic.c: Remove out of
 date comment
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GfOI+bQ7iTto

On Wed, Aug 02, 2017 at 05:43:51PM +0100, Peter Maydell wrote:
> Remove an out of date comment which says there's only one
> item in the NVIC container region -- we put systick into its
> own device object a while back and so now there are two
> things in the container.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  hw/intc/armv7m_nvic.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 323e2d4..2e8166a 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -1036,10 +1036,6 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
>       *  0xd00..0xd3c - SCS registers
>       *  0xd40..0xeff - Reserved or Not implemented
>       *  0xf00 - STIR
> -     *
> -     * At the moment there is only one thing in the container region,
> -     * but we leave it in place to allow us to pull systick out into
> -     * its own device object later.
>       */
>      memory_region_init(&s->container, OBJECT(s), "nvic", 0x1000);
>      /* The system register region goes at the bottom of the priority
> -- 
> 2.7.4
> 
> 
