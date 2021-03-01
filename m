Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3122412lfg;
        Sun, 28 Feb 2021 16:24:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/eRb59ND7QjcsoQMiyMY6dyXNX1eNcuWJ6mPr0UaC3U44SHOP3wZNUDXxFJ/zSCqlAMzT
X-Received: by 2002:aca:3181:: with SMTP id x123mr8457973oix.167.1614558285458;
        Sun, 28 Feb 2021 16:24:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614558285; cv=none;
        d=google.com; s=arc-20160816;
        b=Y8gPQN6KnBWTSvjVLiLUFKI5nU+TlHXk5PToOe3j1TJjmvxl7cwhWCRtO1xrHJwnXm
         k13hKDB/gCfnMY8+8IwKo3i19ySow54TizMUF5uBv/QgT9ZBd1xQ8G/amNoS5tcFIGb0
         Pu5l+vp13j1Xxu7HRKmoRUWKbsudabBdLFrSjNt0HpprESbdHQJbXbVdsRz77i+4B/pJ
         ZBUOnj4s7ZJf6H39m+7BVfIRuDZ3sKcVqV2P1MFRRoQtCNBaMPB3mCPty5DlPPKPbn2G
         7BS6bY8wbXC9laTHEpsLchSnxW1FA5D4V0ZpZUX8565+ytycvyM5WpegmzIESrScfR4b
         ETiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :subject:to:from:date:references:in-reply-to:message-id:mime-version
         :user-agent:dkim-signature:dkim-signature;
        bh=oCq4QunK43b84aCJiEMy8CNDpGBxn0yGXLhQcfvtcew=;
        b=0McgidSe3dbQORiYPh9DdlaDXo98sF4ham3QSrJezdsWpIl2INSyD9XjGkw4hLs1Ik
         2Qezixs+syM/oFxGu2bTpQ8RyC5TaKf/D0HgnPyRnqBs4XMj77HjrgUGx2Xe5kh4+7ms
         3LJsG4SJaRtjNfFdJCmCzemRs0FTAaXWOconHcsbSpbXm2w6Y8tNs9jHQlob6QcfOlO2
         J+dX/ARDUdDynvNrf0TwlcT+loldyyZChDUKr14bsGgWk9+/8288/ZJWdB+UfPI1eb3H
         S7XMCXFkcSkcc3s6ELijfQCZITD4GLzgloF3h/x5Blne9cUZdfRAhhSUKB7udV910E/d
         uXaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm2 header.b=jm7p3JWG;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=OcnJWQEZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l25si12565303otf.141.2021.02.28.16.24.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Feb 2021 16:24:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm2 header.b=jm7p3JWG;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=OcnJWQEZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGWMe-0000rj-Q9
	for alex.bennee@linaro.org; Sun, 28 Feb 2021 19:24:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGWMN-0000r0-Nr; Sun, 28 Feb 2021 19:24:28 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:35829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGWMI-0008V2-3P; Sun, 28 Feb 2021 19:24:27 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id B8E6A5C00BA;
 Sun, 28 Feb 2021 19:24:20 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 28 Feb 2021 19:24:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=oCq4Q
 unK43b84aCJiEMy8CNDpGBxn0yGXLhQcfvtcew=; b=jm7p3JWGbxM/j4c0U7CxJ
 mHG7z1i8GQUQbU/U7uNlWXzJ3eBOWEClX9rJNiiqq6TNbf9L+jGgowAdBJdHa9m0
 /787WOZvpQNrqF3vmrAZRdJro2wW/pnO6+rpp4s0bT6t+32fOfBkPraESbHE7yb2
 R66VMppPp3hPmrr9sd5snejm/KzisA5OhZpzu0+OxsmiAE0vuG2MZODZX3CgaTLP
 pKIOrrGzhOS+S8Iw54E592KxhQVw3qNULeEiHVjQbDtQ7Q2nKNfCwqDbyO/49DkA
 ht65bfsgJuU+FrXmPuEHunJDSkosUre0J7K5olJFKCp+6POEjKicL/PLTOnCV7Gg
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=oCq4QunK43b84aCJiEMy8CNDpGBxn0yGXLhQcfvtc
 ew=; b=OcnJWQEZlRPRwsaJLRxwiUbs2AXxRxPjDz5iquAGPB5iumUmQbc17iBpZ
 4OxFBe4RdK54q84yURpU7ZE9DKlfIHLFp6vXhqYPXbMjmDJ1h8NV5QYYYY1vNayQ
 F4QxRbUBjW7bZAq5z+J5fuDRUm9/SD/O8VYPkP5pVNaJRwGwjV8C1e61L1e4j0KI
 5iTb7NUEu1n//9pQp1Z3UoJ/3kUO4J2QbPBwQ+VbgHjbcxYaLTMIMU9FYg/oEy51
 /SRsUqvepiksDEOhB8Z4blgpMvcXfx5/0dwrc2Coe+P4w5ApUAR4nJNyIvQtCo/K
 uDMRn0f182SOiD5HvB48TdjbGjd4w==
X-ME-Sender: <xms:MzQ8YP96IEBe4L8872RuAMgXqDlurKa6ucQxB8OSVoPhqS1yi4T_YA>
 <xme:MzQ8YLuUX0lYqhRteHmJF6f2JTOfdU1xakuYg7e3UK_U_HZNInxWbotvpYaCAPdpK
 xDBHPYfnFZfNJL_7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleejgddvfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepvdegkeehgeefvdfhteehhfduteetgeeugefgieeigeeuheekudegtdek
 gfelgfehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:MzQ8YNCtFlvBg0K-D-50sG3v46e-abzkZaR3SE_USximPNSVjycJRA>
 <xmx:MzQ8YLdNdAnPebJRIGWHHamQOCMx_M1i5jih4TB8Wwys-BxTOY89Sg>
 <xmx:MzQ8YENFTxfMhHCYRdb99vv5zichIqDvxkn-Plp8eaI3sxE8YTvEQg>
 <xmx:NDQ8YD0BB1DY57x7pk9mfVNem8IBon4Dn1JJbUnJxdvuVqrqTuEOYw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 08095A00064; Sun, 28 Feb 2021 19:24:19 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-141-gf094924a34-fm-20210210.001-gf094924a
Mime-Version: 1.0
Message-Id: <2885b969-3386-4d73-b187-d395b253543e@www.fastmail.com>
In-Reply-To: <10a65ca0-0f6a-46be-a292-d37647e03a7f@www.fastmail.com>
References: <20210226065758.547824-1-andrew@aj.id.au>
 <20210226065758.547824-2-andrew@aj.id.au>
 <1681fdc1-2c9d-db2c-a872-c0ff156e07c4@amsat.org>
 <10a65ca0-0f6a-46be-a292-d37647e03a7f@www.fastmail.com>
Date: Mon, 01 Mar 2021 10:53:18 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org
Subject: =?UTF-8?Q?Re:_[PATCH_1/4]_arm:_ast2600:_Force_a_multiple_of_32_of_IRQs_f?=
 =?UTF-8?Q?or_the_GIC?=
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.26; envelope-from=andrew@aj.id.au;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Corey Minyard <minyard@acm.org>,
 Cameron Esfahani via <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aNwjHRffFGZS



On Mon, 1 Mar 2021, at 09:37, Andrew Jeffery wrote:
>=20
>=20
> On Fri, 26 Feb 2021, at 19:26, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 2/26/21 7:57 AM, Andrew Jeffery wrote:
> > > This appears to be a requirement of the GIC model.
> >=20
> > If so this should be adjusted in the GIC or a15mp_priv_realize(),
> > not in each caller, isn't it?
> >=20
>=20
> Maybe, let me look into it. I'll clean it up in v2 if it makes sense.

So the current behaviour has been around since 2009, originating in=20
41c1e2f54e6f ("arm: make sure that number of irqs can be represented in=20=

GICD_TYPER."). The GIC architecture specification says:

"The GICD_TYPER.ITLinesNumber field identifies the number of=20
implemented GICD_ISENABLERns, and therefore the maximum number of SPIs=20=

that might be supported."

While the code says:

    /* ITLinesNumber is represented as (N / 32) - 1 (see
     * gic_dist_readb) so this is an implementation imposed
     * restriction, not an architectural one:
     */
    if (s->num_irq < 32 || (s->num_irq % 32)) {
        error_setg(errp,
                   "%d interrupt lines unsupported: not divisible by=20
32",
                   num_irq);
        return;
    }

My feeling is that it's better to be explicit in the models that are=20
affected (i.e. leave the ROUND_UP() as I have it in this patch). This=20=

way if the implementation restriction is ever lifted, we know which=20
models we can clean up. I won't be reworking the GIC to remove the=20
restriction in this series, so unless you have a particularly strong=20
preference/justification for the implicit ROUND_UP(), I plan to leave=20=

it as is.

Cheers,

Andrew
