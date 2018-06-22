Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp252718wrq;
        Thu, 21 Jun 2018 17:58:35 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKhLggh6hykaerR/XkjqdXYF4N3TWtl4B6OKjiJo+ItkQ1Wa/8W4ewJwoJsiwqyKyLNnSgB
X-Received: by 2002:a0c:c683:: with SMTP id d3-v6mr24744028qvj.152.1529629115620;
        Thu, 21 Jun 2018 17:58:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529629115; cv=none;
        d=google.com; s=arc-20160816;
        b=TMWO4XIkvogklNMVZ4kBgJ5Iaj3FZCB7XAx5w+vqN8QGZ76WiTnfAQIZQRfKcgVJ4d
         zpR9HuRH5L1cuJrBmrEt4Sypim2iIAbYnb/ITRzBWdm6BbIk7U4tn1F9g9/Q3nAj4qJV
         yFEekN1Vys6AL8NxnUMiBPepTtNG8OdXtByA8Pyc4vxxv4tleg0q7SR0KI/IwtZQ6Pfo
         35kGFdTinAqceM61/aVnUw+atDr/gZp67ts1zSEbCGEuqIG/5Gy3wlOPs39kpNS/xJbZ
         JCtSt9ERJGtaUdkvFZ9RCYiCAG4GJMyasbsZ8rm3BfAewPNGjNBkIhDx9r4hqmOyTgIS
         fV3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=SHKcbb1n/kJ4+s2wUCBKPe/fkWPbreSXtPdUkAfG2W8=;
        b=OaM69KK8E4UGyFpYnxPX4wfXgApmYwPrTMBeCLBlYYi7bNjZqH/BHXuZFpum5VhsWh
         WHYnyOXheyIfbVCbSSfMUBxvuIsNjqJts5g2CO9aH7hUHBxKfgfIaZ+9dNDcSXxoX1ei
         8uw+flQznsNSBBepIp34OlIQqnzCjeobkiSIj17TztLtNMisQY2qbCWBxmEweFKZ9I5I
         fzLmCrIv0fwbFUbTTdDXRt8i9DUrtV1bSlcxSbpucwHPoIlFNRjnsOpL8c+i0NL6xTWi
         34UjBticNqsmyz7D8IYWYESFfcot0NXABcd1vKASZypEOS6HgQOkOg+JiBL+C4SQ3n+V
         Nyyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=k7HcZeRf;
       dkim=fail header.i=@jms.id.au header.s=google header.b=U6XqTGVU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j81-v6si383981qke.224.2018.06.21.17.58.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jun 2018 17:58:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=k7HcZeRf;
       dkim=fail header.i=@jms.id.au header.s=google header.b=U6XqTGVU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58218 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWAPL-0001Sy-7K
	for alex.bennee@linaro.org; Thu, 21 Jun 2018 20:58:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36707)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fWAPA-0001QS-PS
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 20:58:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fWAP9-0005jH-CU
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 20:58:24 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:38613)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fWAP6-0005fP-Ut; Thu, 21 Jun 2018 20:58:21 -0400
Received: by mail-qt0-x241.google.com with SMTP id e11-v6so4049954qtp.5;
	Thu, 21 Jun 2018 17:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=SHKcbb1n/kJ4+s2wUCBKPe/fkWPbreSXtPdUkAfG2W8=;
	b=k7HcZeRfq//UF7WHui8eGqldfDFOZq0KO08mEnZpuN9MOjSHv1rHXXTkrDBsLpgaLA
	jyemW6fIcR5iMUN4UAdGHiviHQBrJ+aaELdjytQgZcGRuV24j4FlxPxzPpm9Ebh4zbXZ
	MKdauoY7aAVoRvkIhII7pGZik1gkygm91J+uf0M7X1ak/LZMCriNOP49LwLXDXtVpZEn
	uLOT771AdZVaUDMN8OD1GXKJUTWD7UnX7EbT/NlRhak0Po8tP4cT6/pvww/nK5XiHhjR
	Yq4355fuU0kc4azQaMogAA0hSomgkKhCYjv/04OVU7hC/c3pVnpCIO/5VezRvUl1xmDc
	FHpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=SHKcbb1n/kJ4+s2wUCBKPe/fkWPbreSXtPdUkAfG2W8=;
	b=U6XqTGVUuG+zUsrR3vj2R6JBKCJwzcBIxd1/jRUXcDK+DJBCYu6gFORMQV4vLYB7Ec
	BAgIJiEV/+Qf5AK3EyEpPCmN1+wWyX+ISMclDYZ2+16RWd4S6GowMR1jA/hsVAOGPdO0
	ukifJnnRgSeqULOBNDNDn04/D9c9kJZ1lFrfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=SHKcbb1n/kJ4+s2wUCBKPe/fkWPbreSXtPdUkAfG2W8=;
	b=pgdmmillGl90FAoZ6/J3TqhyWzLV9DFjq3WOVIVl7ijfFZ8I5nImjmreQrXelNDX1F
	Nz3As3PnfeUPupxMYbXrKfVCpgtBnGYEj9Ud3XPAF+UcYsD5PStoBtRlAnhjY0Y9u2yB
	mJMneJo0mE6aeJdxEcRjo40r+xfgI/0LPEOZVePu1xpIvlGxYvfdMNj1cmlxGDqvXBiu
	cRSGg+hZ7OG+wJc4ZnIkrAL02MfaeL7GY51bBs8SROp7VYSigy42IwApF6iRiXrkGq9P
	ZlwhmHac8ElAIjMcbXKAcDCUe2kSFkMrLaRlrfg1qxnsgQvBbdkWC66tvsv8zLAas+Ed
	whEA==
X-Gm-Message-State: APt69E2rdD0PPyiWeHxuFBYxGT6n9GnHUqMsjdTF3VsCFudrX93uMKd8
	8AGiXn++UK/7aSKweiyeS5d4kE+mFLIvjhI6kDM=
X-Received: by 2002:ac8:260f:: with SMTP id
	u15-v6mr26232228qtu.368.1529629099911; 
	Thu, 21 Jun 2018 17:58:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac8:184d:0:0:0:0:0 with HTTP; Thu, 21 Jun 2018 17:57:59
	-0700 (PDT)
In-Reply-To: <20180621223946.20738-2-clg@kaod.org>
References: <20180621223946.20738-1-clg@kaod.org>
	<20180621223946.20738-2-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 22 Jun 2018 10:27:59 +0930
X-Google-Sender-Auth: Ik6o842keZkyeDJhY-i6cKoCLBE
Message-ID: <CACPK8XevZ-n9+M+zYmnnZPqb35SxCZjb8TB6fp17jZ+DZ1mPiw@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [PATCH 1/3] aspeed/scu: introduce clock frequencies
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9CnBYT+sH9PG

On 22 June 2018 at 08:09, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> All Aspeed SoC clocks are driven by an input source clock which can
> have different frequencies : 24MHz or 25MHz, and also, on the Aspeed
> AST2400 SoC, 48MHz. The H-PLL (CPU) clock is defined from a
> calculation using parameters in the H-PLL Parameter register or from a
> predefined set of frequencies if the setting is strapped by hardware
> (Aspeed AST2400 SoC). The other clocks of the SoC are then defined
> from the H-PLL using dividers.
>
> We introduce first the APB clock because it drives the timer.

Looks good! One small issue below.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  include/hw/misc/aspeed_scu.h |  70 ++++++++++++++++++++++++++--
>  hw/misc/aspeed_scu.c         | 106 +++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 172 insertions(+), 4 deletions(-)
>

> +static uint32_t aspeed_scu_calc_hpll_ast2400(AspeedSCUState *s)
> +{
> +    uint32_t hpll_reg =3D s->regs[HPLL_PARAM];
> +    uint8_t freq_select;
> +    bool clk_25m_in;
> +
> +    if (hpll_reg & SCU_AST2400_H_PLL_OFF) {
> +        return 0;
> +    }
> +
> +    if (hpll_reg & SCU_AST2400_H_PLL_PROGRAMMED) {
> +        uint32_t multiplier =3D 1;
> +
> +        if (!(hpll_reg & SCU_AST2400_H_PLL_BYPASS_EN)) {
> +            uint32_t n  =3D (hpll_reg >> 5) & 0x3f;
> +            uint32_t od =3D (hpll_reg >> 4) & 0x1;
> +            uint32_t d  =3D hpll_reg & 0xf;
> +
> +            multiplier =3D (2 - od) * ((n + 2) / (d + 1));
> +        }
> +
> +        return s->clkin * multiplier;
> +    }
> +
> +    /* HW strapping */
> +    clk_25m_in =3D (s->hw_strap1 & SCU_HW_STRAP_CLK_25M_IN);

I think you want to do !! to this result, or shift it down. Otherwise
you are getting 1 << 23 or zero, when I think you want 1 or 0.

> +    freq_select =3D SCU_AST2400_HW_STRAP_GET_H_PLL_CLK(s->hw_strap1);
> +
> +    return hpll_ast2400_freqs[clk_25m_in][freq_select] * 1000000;
> +}
