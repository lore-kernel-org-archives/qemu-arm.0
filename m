Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2630202ejc;
        Tue, 17 Jan 2023 10:32:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuLgrfaKnvc54yzt54+/0wWkUgYRuXhQ29lXHBb1vfpI1IkvBBIjSuJzY+dxxL0o9RBkbHt
X-Received: by 2002:a25:758a:0:b0:71b:cef3:10a2 with SMTP id q132-20020a25758a000000b0071bcef310a2mr3850341ybc.41.1673980358456;
        Tue, 17 Jan 2023 10:32:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673980358; cv=none;
        d=google.com; s=arc-20160816;
        b=gPfHbro8YHd0Hy5oUvzjpz73HNeFXsPRsSnXVX/6T382k/InlRveKODiaGMAkwYBIv
         pKM+U2JfFp+cH2N1ol/h/hKlvi6EUnExAUMwE5kcd5TbX7FYAyR0rUAQDxKP/AATHVD1
         ZKe7uftBlDbrRq7lyrVisIcwNGI6OLmIVxW0g5M4Dn0IKFp8xKGA+RscDmzp3ZxD8NC6
         yGlIg0g1IZA5FpENLD1vLADDavcqMZHZR+lSx1smzWCNdP/l0PiLXjP6kys+3ekC0pJY
         EfqVXDsV5Ey3Hp0G3S46K0MIUptP3VEga2WVcERBhJQRfJPJDyzi/NcAC6l6Hnzin7mB
         H2yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:feedback-id
         :dkim-signature:dkim-signature;
        bh=TDl0pSXtjsTf+N3SYnRhOJHop3ICupx9F2jTeBtNGEo=;
        b=iePlgNRSjPv+EpmikQjPcfBdMx+fRlwBaf90ullE1OSJvbAbn5O9cewijYVezNuwpc
         NYI706Qahs1qbBDBCb3Ev1nUARFHNaFCPlWdDFoqYJKkKZdfy0mzSHbVL4RC4DoSEsCC
         ItnlhLm+XREtvyCFjPgKF9o7i5jfm4XVHiaulOm7Ino9vlbNJ9Ex2tEifZ3bSabFzAK/
         jhdWd8xbUg9RUsqwSK7RvsuZzxGmGNQJhDY0wsMdcsCTVSI7G9LxmLz2JUu4E4PK21Kf
         MHlYiDz7KPkQTeDQ3rMe7EQosJuJzusv4gp9jvYzIqAV30vODNXDIFvgNdbSqA8b4SZY
         EqqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=oxFoUxe1;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b="FJSp1/wn";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m8-20020a05620a290800b0070529228168si20249929qkp.535.2023.01.17.10.32.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 10:32:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=oxFoUxe1;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b="FJSp1/wn";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHql0-0000PF-Mr; Tue, 17 Jan 2023 13:32:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHqkw-0000II-O4; Tue, 17 Jan 2023 13:32:24 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHqkv-0007Yl-AD; Tue, 17 Jan 2023 13:32:22 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 0B3A25C0132;
 Tue, 17 Jan 2023 13:32:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 17 Jan 2023 13:32:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1673980340; x=
 1674066740; bh=TDl0pSXtjsTf+N3SYnRhOJHop3ICupx9F2jTeBtNGEo=; b=o
 xFoUxe1DlY5sp2nsLdUIWXgbS5H/t4VzxEb4ms8HIogTMfemVooU7yO8zT33R4C8
 6Wt87nnQKiy3+wP+K6v7vTa2xNzmcgCOqf2NNCmnxUmH1ghVlKePhIoOquGJKFgU
 b1b2ZRSRRfMHVWi9QQLY9ZMVa/z6ilosfJle2kfD9D6wsFzjg11PIn1X1YrEvHr1
 p5RQn9Xu423Zl4R0Nzp9x2rgGWXWWmMb+UjhNb2zc4TBO8jdAI9nJn7/alAwvHJK
 JQzU1nXCufHqxdTM7Hj0t9vagtZxv0fYmyWQrK42wsKA48pzVCgRgcI+pn58Zn95
 xHYd5SVq2tUsnv3qagM3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673980340; x=
 1674066740; bh=TDl0pSXtjsTf+N3SYnRhOJHop3ICupx9F2jTeBtNGEo=; b=F
 JSp1/wnakhlRRHspQj1jZG0hcTGox3TRxqS5L1ZqSUtUFROMF/lR7ogjvJXkfsEh
 fyAeTAx08D2iA+tBibQi52xGlrWIqlxHlksXi5m+XsAdOxsMjWMpVoGXhI3B7Vij
 D2J1XzZVXQoz7iSo06YAFJWFDL4TRzRLt3OmDIcPAcmCIG0WkVBslqehAEsG9XbX
 fQbOdhC4khD4ZXYmowgkdFck7I5Cg/aHI67e9nblzOV8zGTJtA0PvvXsjd0+XkMD
 LC5vBgjdmQKaO16Aflx8F4cRLyEamTkLldfr7HWzeH8HhY8ayf+iiT+TvOwZJAkC
 CfNEtzn1akrd59uA4cP0w==
X-ME-Sender: <xms:s-nGY72WTtZCmU4i2IF5vxTf2dRaMcelIVIvWfHOFzpvP-oa_INLnw>
 <xme:s-nGY6EYFv9GiWkMl6I3rjjoa2kuNfGBTPjdtrO5Ro2r-EQbP8555XodLRS0BVoIW
 SRFjRBh8OcPQdtMhI8>
X-ME-Received: <xmr:s-nGY756VcDU0Ur1RRlqwft98BT-9KRo4ZpFd21_XD6mpf9oJ9TNYoeksHsh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtiedguddufecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrf
 grthhtvghrnhephfegffevudefveetgeekteeijefhhfduueejvdegvdehffehjeevtefh
 hffffeeunecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:s-nGYw1jt-C3-Rg0be3U1Bs3TUOol6jz3TCV49MF30Ux8cIHX1zqLw>
 <xmx:s-nGY-GeUkOqYj5r8QbL_45r64PCv6P7fFHjjgvelinb9-mWnm2QZw>
 <xmx:s-nGYx9oPvsQ0D0qWFtofDgs3OtoSVEcfcze9OjbqYq2dfROzTgxzQ>
 <xmx:tOnGYx0NK2xprWtsReGq0AQSvSL-_2DPSfVm6CpgHpVwBOqj09LN4Q>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jan 2023 13:32:18 -0500 (EST)
Date: Tue, 17 Jan 2023 10:32:15 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/5] hw/arm: Extract at24c_eeprom_init helper from
 Aspeed and Nuvoton boards
Message-ID: <Y8bprzjwzIRXej60@pdel-mbp>
References: <20230116235604.55099-1-peter@pjd.dev>
 <20230116235604.55099-2-peter@pjd.dev>
 <961515e6-65ad-ec7f-f51e-a862424f574d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <961515e6-65ad-ec7f-f51e-a862424f574d@linaro.org>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=peter@pjd.dev;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TiAeeTrSJouT

On Tue, Jan 17, 2023 at 09:00:34AM +0100, Philippe Mathieu-Daudé wrote:
> On 17/1/23 00:56, Peter Delevoryas wrote:
> > This helper is useful in board initialization because lets users initialize and
> > realize an EEPROM on an I2C bus with a single function call.
> > 
> > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> > ---
> >   hw/arm/aspeed.c                 | 10 +---------
> >   hw/arm/npcm7xx_boards.c         | 20 +++++---------------
> >   hw/nvram/eeprom_at24c.c         | 12 ++++++++++++
> >   include/hw/nvram/eeprom_at24c.h | 10 ++++++++++
> >   4 files changed, 28 insertions(+), 24 deletions(-)
> >   create mode 100644 include/hw/nvram/eeprom_at24c.h
> 
> > diff --git a/include/hw/nvram/eeprom_at24c.h b/include/hw/nvram/eeprom_at24c.h
> > new file mode 100644
> > index 000000000000..79a36b53ca87
> > --- /dev/null
> > +++ b/include/hw/nvram/eeprom_at24c.h
> > @@ -0,0 +1,10 @@
> > +/* Copyright (c) Meta Platforms, Inc. and affiliates. */
> 
> What license for this copyright?

Erg, yeah, thanks for calling this out, I did this wrong. Meta has some new
licensing guidelines and I misinterpreted them. Contributors are just supposed
to use whatever license the open-source project has, so I'll just change this
to say it's under GPL2, like the one I used in hw/arm/fby35.c

> 
> > +#ifndef EEPROM_AT24C_H
> > +#define EEPROM_AT24C_H
> > +
> > +#include "hw/i2c/i2c.h"
> 
>  /**
>   * Create and realize an AT24C EEPROM device on the heap.
>   * @bus: I2C bus to put it on
>   * @addr: I2C address of the EEPROM slave when put on a bus
>   * @rom_size: size of the EEPROM
>   *
>   * Create the device state structure, initialize it, put it on
>   * the specified @bus, and drop the reference to it (the device
>   * is realized).
>   */
>  I2CSlave *at24c_eeprom_create_simple(I2CBus *bus, uint8_t addr,
>                                       size_t rom_size);

+1, I'll include this comment

> 
> > +I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size);
> > +
> > +#endif
> 
