Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp5029187lft;
        Wed, 6 Jul 2022 14:52:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ugzuzMpKGfIxMWVLJNphnzhFgz+vJGvJQmbY7xDJSDnySy59eH7tKkEGcZmdTrEVwGgtgs
X-Received: by 2002:ac8:5796:0:b0:31d:47a1:b640 with SMTP id v22-20020ac85796000000b0031d47a1b640mr17215306qta.618.1657144359817;
        Wed, 06 Jul 2022 14:52:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657144359; cv=none;
        d=google.com; s=arc-20160816;
        b=J7HT9bgrrjtJG5t+oCPVhGsIVci9yP9/Tpuof6y6JBelgRxk9qQajAdcUUfXUIuv+o
         G8xTxIqDLi9s40LJIRqdm42ZerstIp8AdiqpkO/iHPR1A5ichvpr0ckHbZO63Zxckrr4
         cnaYrKzpwBxAMgXeLrLJOtK7lzzxGt2GWJnwiQgrBHM00sh7+uLqZ/Fyufq5EaG0gHzo
         iWuHWNH/KwiLc1vb6d1lDy5v9ruR7n08/qs9VTwmj0fXSdZT9e3L10wxr1TcR7wGp4pD
         D9DxPjkOOfFegFBTq68DKfmUV/UZuyopBaWSWlQe3G6Z54jcbCDApkEWPbHhVf2k0nzZ
         Ebaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:feedback-id
         :dkim-signature:dkim-signature;
        bh=R2yDIufvXqrirJf8vhWjNeuXmgZAqcOfT5KSen8ayJg=;
        b=U+sSAybISdCivcVnN9FKuP1+5+b+yi+S3x+HuNN+l0GmgN5+LcC+XcMjGWWMWmTnG9
         JGugR6nlymiPEIbnnT/4NFfhrqElRqJNYGmBk1o++8OoBAm1oTOrjDontgJlbtlJ8LSm
         C2fOSHZg5cEnTtpnZpuJZXQD15kmKNyUxTzYoZ6AxWYtUrBJEHYFdqVJAhs8vdYnriVT
         g8uTz0IIcHHpu28Akow4JBBY6y0o+t6UhIFjgNsTZV9r/b372wR3EPF0BGM3ky9Ljryp
         2S3aGPhAj0bAkGqmE1ExszUPQ68/otlMSNSOouLHBVNzPwCXjYrEQBt/t7ka2IDBNBoa
         fP3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=mR6gQ6xS;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=Y2Ax6KDZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y19-20020a37f613000000b006b2b1c80a74si5222611qkj.271.2022.07.06.14.52.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 14:52:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=mR6gQ6xS;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=Y2Ax6KDZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9Cwp-0004Nz-7o
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 17:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o9CEU-0000zq-Jc; Wed, 06 Jul 2022 17:06:54 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:60213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o9CES-0004xw-KP; Wed, 06 Jul 2022 17:06:50 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1A4915808CE;
 Wed,  6 Jul 2022 17:06:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 06 Jul 2022 17:06:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1657141601; x=
 1657145201; bh=R2yDIufvXqrirJf8vhWjNeuXmgZAqcOfT5KSen8ayJg=; b=m
 R6gQ6xSr7T9RYn2d+pBLs+nc/m51UBAq/TrbdRr/fsqpQ0SVlM6UzRI6VSdy2OMF
 ZOA0Fzlrurl9ZvLkvz7eUcaeWNDk3/DiNqp4W/n85gClNCEfIlgFiryyKGs9sImT
 xXoSZ6WtHxYCTT1gXjwKz4U1IzpzCK+FCTGODwbWhvljm5ugRMto/1QX8hVT3C6p
 8d9olzLdOFO7FDygzUdrWg9Goj5Q61V7keFhjyqPGs/ZIt2u0UI4aXiMMe4BNot4
 0MpNZX5IkI2vJd5aD7hnancXjoYwrUgZTkink7SN+Jj34x7WKFUZhQyViVQ3EX8g
 pBuT21jaPMu4aXxaF7X9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1657141601; x=
 1657145201; bh=R2yDIufvXqrirJf8vhWjNeuXmgZAqcOfT5KSen8ayJg=; b=Y
 2Ax6KDZN2L4D2nrg4QtkbBgu96IbblrkD6ga4qs5EPqyCG0VqQd8T1WqGLPDmKv3
 JODMKPUAyItqoNwDVoBzUOdqAsv8y7U0USZZPwT1JhIK1ijq18aMBj1kqVd4dTFU
 djf0CPHxZcZj3ruRdTwBAlCYEIsUz/GrV0j1eHQnW8gZxGXvMR2PCkRy+bsgLpb9
 M9NsNyS///aGaAxkFhnVS1HLMnAJ1eJ4Z/X8Y/vw9Nqphd7ZrDrMOEgO4wdEmgk9
 WmM7YGmfwJV3iYVWT4ECvwugSVFjljXJXPVwDSbf1x0FsALDRS9y0h6TPEgfuotg
 6Sjqio8ENFdnpIXEXm5lA==
X-ME-Sender: <xms:YPnFYia8jFHYRIsSAo7K7sa_naILKu1CFvlv6y2_-9-tTE_MuXCEYg>
 <xme:YPnFYlZc9NiymaidNO0Ux13k3_BakrbeWKWvfRpxQ7dLCdq-upALgI764hy6cCIUa
 FkKYQ5gkMp8xa3Ahvw>
X-ME-Received: <xmr:YPnFYs_sqJXjbm4soa8sjrIunfaC1Dz7ZczoiUXbA4_-qOwcDlADfDIsgIZUIrZTflXNPC4ZCdU36m-sYgn9BuHV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeifedgudehjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrf
 grthhtvghrnhephfegffevudefveetgeekteeijefhhfduueejvdegvdehffehjeevtefh
 hffffeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:YPnFYko6ZpNN3ldi2liYKstOpQnbf-j4f_1uSN3wzSaU2G83Gem0NA>
 <xmx:YPnFYtoRYb-7thi_UPnokyJYDtdrc8cUUsVtUQcGwiwC3kclhplxxw>
 <xmx:YPnFYiQSPbSr59bnvS1aWT58DLMYxPts28yAEicJtLnqMAaSx9JJ1w>
 <xmx:YPnFYunyB9PZUTIBUQLPhvQfv21NnJRhE-Y33nfLCq3g3ORYEXnadw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Jul 2022 17:06:39 -0400 (EDT)
Date: Wed, 6 Jul 2022 14:06:37 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] docs: aspeed: Minor updates
Message-ID: <YsX5XcAdn3+inY56@pdel-mbp.dhcp.thefacebook.com>
References: <20220706172131.809255-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220706172131.809255-1-clg@kaod.org>
Received-SPF: pass client-ip=66.111.4.229; envelope-from=peter@pjd.dev;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM14=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
X-TUID: G8r4l1n34iwK

On Wed, Jul 06, 2022 at 07:21:31PM +0200, Cédric Le Goater wrote:
> Some more controllers have been modeled recently. Reflect that in the
> list of supported devices. New machines were also added.

Looks good, thanks for this!

Reviewed-by: Peter Delevoryas <peter@pjd.dev>

> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  docs/system/arm/aspeed.rst | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> index 445095690c04..6c5b05128ea8 100644
> --- a/docs/system/arm/aspeed.rst
> +++ b/docs/system/arm/aspeed.rst
> @@ -31,7 +31,10 @@ AST2600 SoC based machines :
>  - ``tacoma-bmc``           OpenPOWER Witherspoon POWER9 AST2600 BMC
>  - ``rainier-bmc``          IBM Rainier POWER10 BMC
>  - ``fuji-bmc``             Facebook Fuji BMC
> +- ``bletchley-bmc``        Facebook Bletchley BMC
>  - ``fby35-bmc``            Facebook fby35 BMC
> +- ``qcom-dc-scm-v1-bmc``   Qualcomm DC-SCM V1 BMC
> +- ``qcom-firework-bmc``    Qualcomm Firework BMC
>  
>  Supported devices
>  -----------------
> @@ -40,7 +43,7 @@ Supported devices
>   * Interrupt Controller (VIC)
>   * Timer Controller
>   * RTC Controller
> - * I2C Controller
> + * I2C Controller, including the new register interface of the AST2600
>   * System Control Unit (SCU)
>   * SRAM mapping
>   * X-DMA Controller (basic interface)
> @@ -57,6 +60,10 @@ Supported devices
>   * LPC Peripheral Controller (a subset of subdevices are supported)
>   * Hash/Crypto Engine (HACE) - Hash support only. TODO: HMAC and RSA
>   * ADC
> + * Secure Boot Controller (AST2600)
> + * eMMC Boot Controller (dummy)
> + * PECI Controller (minimal)
> + * I3C Controller
>  
>  
>  Missing devices
> @@ -68,12 +75,10 @@ Missing devices
>   * Super I/O Controller
>   * PCI-Express 1 Controller
>   * Graphic Display Controller
> - * PECI Controller
>   * MCTP Controller
>   * Mailbox Controller
>   * Virtual UART
>   * eSPI Controller
> - * I3C Controller
>  
>  Boot options
>  ------------
> @@ -154,6 +159,8 @@ Supported devices
>   * LPC Peripheral Controller (a subset of subdevices are supported)
>   * Hash/Crypto Engine (HACE) - Hash support only. TODO: HMAC and RSA
>   * ADC
> + * Secure Boot Controller
> + * PECI Controller (minimal)
>  
>  
>  Missing devices
> @@ -161,7 +168,6 @@ Missing devices
>  
>   * PWM and Fan Controller
>   * Slave GPIO Controller
> - * PECI Controller
>   * Mailbox Controller
>   * Virtual UART
>   * eSPI Controller
> -- 
> 2.35.3
> 
> 
