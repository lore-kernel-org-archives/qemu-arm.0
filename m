Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4258078lft;
        Tue, 5 Jul 2022 14:45:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ufIFiv8DM2U6oNRDdkQNwY222p1zklRXN42vJsZrhJrELrdJwunff1sqCGWpNALM5/TvU8
X-Received: by 2002:a37:630c:0:b0:6af:2864:3d87 with SMTP id x12-20020a37630c000000b006af28643d87mr24785285qkb.524.1657057502700;
        Tue, 05 Jul 2022 14:45:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657057502; cv=none;
        d=google.com; s=arc-20160816;
        b=JSq6V/O85+IX+U+c2F4XturuS1z3s4MYnwqMl+UxDbqAoVWl2KpDz2nm8cUJdKQON5
         U71nU5lNjOxt0dRNgU4IqV4ONgpiNvtE2MllwpM5UFfQxUrEN2lFVsBc7LReuQ/iDDA6
         Hrn/2HUhnB+YGnA8oXoBSoNUPs4nJyL8zRYaG6T7V4Hp0nIBhknIYy+fHN9Wta91+Dnf
         tp8Hj22a88LAHlsES94JCUDjzyoKrtT9i+tjIpECTpVe0CDgkM6vFjQuymPxt5to8neY
         Rk335hJzC77lrQbQjRWZKz1BSGF86VTgPXG0+S1hAsxSIrhx6MEPOKLEhjVIGpIgllsq
         A9MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:dkim-signature:dkim-signature;
        bh=rerWXuxifw+j5IvUvVufAQXwswhZGjZfBx+rpPtAf3Q=;
        b=0Ag64P1NMSKGb+zXjb7ssTNKp69Qemdq2KuQrsuu4bEOA4w06X5Fzg/dmXqdBhPx2J
         Mn1bhEmafPydPJEZvEPwUEuPrz19wQn0cT8p2e9aeIxc8p46uMu9wNRFqkndhejmeGTS
         e3C5W+OSrfCGxYJaz1xp9OLyxPfm932lqreRLFgi87MCF9gQ4Yq7Av1CnHBPFrIzZBPP
         x34bywAuZF1L88+vrwn0w5w6R9dRCvIHOUhpoZOLmJQy6Su5++f5sqlacqoGZHEUxi69
         Hef7ckDq7AA5WHSAczwZPuHLPsBmNyxBqwFbI202zL5qRtT4UlDN9LUyEjYxFBhXlSuV
         weTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=ovu+VBCY;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b=b4sj26F5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fv12-20020a056214240c00b00472f1de95edsi3932268qvb.31.2022.07.05.14.45.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Jul 2022 14:45:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=ovu+VBCY;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b=b4sj26F5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8qLu-0006do-1b
	for alex.bennee@linaro.org; Tue, 05 Jul 2022 17:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8qLi-0006dY-Ue; Tue, 05 Jul 2022 17:44:50 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:36649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8qLh-0005wM-0z; Tue, 05 Jul 2022 17:44:50 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3BBBD58020F;
 Tue,  5 Jul 2022 17:44:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 05 Jul 2022 17:44:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1657057488; x=1657061088; bh=rerWXuxifw
 +j5IvUvVufAQXwswhZGjZfBx+rpPtAf3Q=; b=ovu+VBCYEudnyjKExrkwc59JIN
 tq7m18vTffms56BrtP9ei4pvQwVwKlwXFTN1onYktNpwIdCO85kTGF7DOM+bYben
 rHsh/ul/J8abUSpvHhy2tl6/xpPLRi1ojR4tRvxvRJsM0IRmlfChLexClJ7vfoH/
 6SovNpDfdepxIWw35CCIZqk9m18a0yjSqJjtMWMvfahZn25Ixs6XqJbPUFlgOe/1
 VdQIjamFRoTMWrXTAZPMYOaFAoZHQeyGCwNyOry9P/AwbdBgktu+xPDxd6r98/z0
 zkY9uRM+UZwzBTTeCcXvRREK9PUqhAfS3/QwxJcVERfr1UD9sezaUrkUumaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 i9e814621.fm2; t=1657057488; x=1657061088; bh=rerWXuxifw+j5IvUvV
 ufAQXwswhZGjZfBx+rpPtAf3Q=; b=b4sj26F5HVEHk5q4A9P9PGwIoQP855hdCb
 SVtvuWGNxU1R4LkgPhjxFKEWpUSjQ/+qyrTlS3tsC0ke3ggNqD33JYcG+F+x3np4
 jXZ96L7VVZ+0VbhJ8ipgbja4paM+JLlyDebXpFCVvJ4WvyXNVC5El+jSoD95Hos/
 XNsJS1CWHxsXd9NyOfGwva1B8lLAobIgkPQexVvNmcaiirf83m2NLWlP/Eko0+EI
 d63MHLDtwHEvvlAjP3ntwvzAgsW+C5uq/Ugww7NSBrcE1/4+Zv+MWGLFmVXuCgP4
 zp+6C2r2A4Tsh/070kAKfKPeRlrLb74NwXy0MA7jpTGwTbkUPxUQ==
X-ME-Sender: <xms:z7DEYvuQ4QDq0KBtuhgkiNokKz74D1hA8DUKTQw4H4IzWKGF3nJ-Mg>
 <xme:z7DEYgdZpqH4s56YZGDkW8-FKdSFgtdzdKuZImeS8oWAx_etlepGyAXzPkfluk1DT
 qusamz5QjDLpM5GLSE>
X-ME-Received: <xmr:z7DEYiyKpGOuzt0cGYgM0fqX797ME-6CsyQLP_cubsBJyimP6Odl1hzcUQhUWVjkdCz5NXxF87OCdFzPj88Y26Nq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeiuddgudeilecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpeevgfehgedvvdekveeifeekjeduueetieegvdeitedvffdvgffhjeekveek
 tdehfeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:z7DEYuPIpQ5S9f9OgBfvMPUmjF09da-e8g_Jqqy7-Qw0bjU_PlEFPQ>
 <xmx:z7DEYv8-mnZ5cZwmtsCqPy-8UYjZo6PZm2tRjG9jJL56oIl8K6zlNQ>
 <xmx:z7DEYuWIQMpUkK68BEHJ39290HYb06fuwFUwW5fhmmNxPvlGx11ylQ>
 <xmx:0LDEYvwqkXkqVvxRD1vVXzq42GYm4Vy7yGpbxa6M_3at9asufby5cg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Jul 2022 17:44:46 -0400 (EDT)
Date: Tue, 5 Jul 2022 14:44:45 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: Corey Minyard <minyard@acm.org>
Cc: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Patrick Venture <venture@google.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/9] hw/i2c/pca954x: Add method to get channels
Message-ID: <YsSwzVXXS5u3GH3j@pdel-mbp.dhcp.thefacebook.com>
References: <20220705191400.41632-1-peter@pjd.dev>
 <20220705191400.41632-2-peter@pjd.dev>
 <20220705200624.GK908082@minyard.net>
 <YsSv0NU8WfU6APoN@pdel-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YsSv0NU8WfU6APoN@pdel-mbp.dhcp.thefacebook.com>
Received-SPF: pass client-ip=66.111.4.229; envelope-from=peter@pjd.dev;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PiITHsIAiErF

On Tue, Jul 05, 2022 at 02:40:32PM -0700, Peter Delevoryas wrote:
> On Tue, Jul 05, 2022 at 03:06:24PM -0500, Corey Minyard wrote:
> > On Tue, Jul 05, 2022 at 12:13:52PM -0700, Peter Delevoryas wrote:
> > > I added this helper in the Aspeed machine file a while ago to help
> > > initialize fuji-bmc i2c devices. This moves it to the official pca954x
> > > file so that other files can use it.
> > > 
> > > This does something very similar to pca954x_i2c_get_bus, but I think
> > > this is useful when you have a very complicated dts with a lot of
> > > switches, like the fuji dts.
> > > 
> > > This convenience method lets you write code that produces a flat array
> > > of I2C buses that matches the naming in the dts. After that you can just
> > > add individual sensors using the flat array of I2C buses.
> > 
> > This is an improvment, I think.  But it really needs to be two patches,
> > one with the I2C portion, and one with the aspeed portion.
> > 
> > Also, the name is a little misleading, you might want to name it 
> > pca954x_i2c_create_get_channels
> 
> You're right: Cedric, you can just ignore the pca954x patch then if you'd like,
> I can resubmit it with the future I2C series that uses it. I probably shouldn't
> have submitted it quite yet.
> 
> I can also resubmit the series with that patch removed, not sure if that's
> necessary or not.

This was hastily written, what I meant to say was:

Cedric, feel free to remove this patch from the series. If you'd like, I can
also resubmit this series as v3 with the patch removed.

> 
> > 
> > -corey
> > 
> > > 
> > > See fuji_bmc_i2c_init to understand this point further.
> > > 
> > > The fuji dts is here for reference:
> > > 
> > > https://github.com/torvalds/linux/blob/40cb6373b46/arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts
> > > 
> > > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> > > ---
> > >  hw/arm/aspeed.c                  | 29 +++++++++--------------------
> > >  hw/i2c/i2c_mux_pca954x.c         | 10 ++++++++++
> > >  include/hw/i2c/i2c_mux_pca954x.h | 13 +++++++++++++
> > >  3 files changed, 32 insertions(+), 20 deletions(-)
> > > 
> > > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > > index 6fe9b13548..bee8a748ec 100644
> > > --- a/hw/arm/aspeed.c
> > > +++ b/hw/arm/aspeed.c
> > > @@ -793,15 +793,6 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
> > >      create_pca9552(soc, 15, 0x60);
> > >  }
> > >  
> > > -static void get_pca9548_channels(I2CBus *bus, uint8_t mux_addr,
> > > -                                 I2CBus **channels)
> > > -{
> > > -    I2CSlave *mux = i2c_slave_create_simple(bus, "pca9548", mux_addr);
> > > -    for (int i = 0; i < 8; i++) {
> > > -        channels[i] = pca954x_i2c_get_bus(mux, i);
> > > -    }
> > > -}
> > > -
> > >  #define TYPE_LM75 TYPE_TMP105
> > >  #define TYPE_TMP75 TYPE_TMP105
> > >  #define TYPE_TMP422 "tmp422"
> > > @@ -814,20 +805,18 @@ static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
> > >      for (int i = 0; i < 16; i++) {
> > >          i2c[i] = aspeed_i2c_get_bus(&soc->i2c, i);
> > >      }
> > > -    I2CBus *i2c180 = i2c[2];
> > > -    I2CBus *i2c480 = i2c[8];
> > > -    I2CBus *i2c600 = i2c[11];
> > >  
> > > -    get_pca9548_channels(i2c180, 0x70, &i2c[16]);
> > > -    get_pca9548_channels(i2c480, 0x70, &i2c[24]);
> > > +    pca954x_i2c_get_channels(i2c[2], 0x70, "pca9548", &i2c[16]);
> > > +    pca954x_i2c_get_channels(i2c[8], 0x70, "pca9548", &i2c[24]);
> > >      /* NOTE: The device tree skips [32, 40) in the alias numbering */
> > > -    get_pca9548_channels(i2c600, 0x77, &i2c[40]);
> > > -    get_pca9548_channels(i2c[24], 0x71, &i2c[48]);
> > > -    get_pca9548_channels(i2c[25], 0x72, &i2c[56]);
> > > -    get_pca9548_channels(i2c[26], 0x76, &i2c[64]);
> > > -    get_pca9548_channels(i2c[27], 0x76, &i2c[72]);
> > > +    pca954x_i2c_get_channels(i2c[11], 0x77, "pca9548", &i2c[40]);
> > > +    pca954x_i2c_get_channels(i2c[24], 0x71, "pca9548", &i2c[48]);
> > > +    pca954x_i2c_get_channels(i2c[25], 0x72, "pca9548", &i2c[56]);
> > > +    pca954x_i2c_get_channels(i2c[26], 0x76, "pca9548", &i2c[64]);
> > > +    pca954x_i2c_get_channels(i2c[27], 0x76, "pca9548", &i2c[72]);
> > >      for (int i = 0; i < 8; i++) {
> > > -        get_pca9548_channels(i2c[40 + i], 0x76, &i2c[80 + i * 8]);
> > > +        pca954x_i2c_get_channels(i2c[40 + i], 0x76, "pca9548",
> > > +                                 &i2c[80 + i * 8]);
> > >      }
> > >  
> > >      i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4c);
> > > diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
> > > index 3945de795c..6b07804546 100644
> > > --- a/hw/i2c/i2c_mux_pca954x.c
> > > +++ b/hw/i2c/i2c_mux_pca954x.c
> > > @@ -169,6 +169,16 @@ I2CBus *pca954x_i2c_get_bus(I2CSlave *mux, uint8_t channel)
> > >      return pca954x->bus[channel];
> > >  }
> > >  
> > > +void pca954x_i2c_get_channels(I2CBus *bus, uint8_t address,
> > > +                              const char *type_name, I2CBus **channels)
> > > +{
> > > +    I2CSlave *mux = i2c_slave_create_simple(bus, type_name, address);
> > > +    Pca954xClass *pc = PCA954X_GET_CLASS(mux);
> > > +    Pca954xState *pca954x = PCA954X(mux);
> > > +
> > > +    memcpy(channels, pca954x->bus, pc->nchans * sizeof(channels[0]));
> > > +}
> > > +
> > >  static void pca9546_class_init(ObjectClass *klass, void *data)
> > >  {
> > >      Pca954xClass *s = PCA954X_CLASS(klass);
> > > diff --git a/include/hw/i2c/i2c_mux_pca954x.h b/include/hw/i2c/i2c_mux_pca954x.h
> > > index 3dd25ec983..3a676a30a9 100644
> > > --- a/include/hw/i2c/i2c_mux_pca954x.h
> > > +++ b/include/hw/i2c/i2c_mux_pca954x.h
> > > @@ -16,4 +16,17 @@
> > >   */
> > >  I2CBus *pca954x_i2c_get_bus(I2CSlave *mux, uint8_t channel);
> > >  
> > > +/**
> > > + * Creates an i2c mux and retrieves all of the channels associated with it.
> > > + *
> > > + * @bus: the i2c bus where the i2c mux resides.
> > > + * @address: the address of the i2c mux on the aforementioned i2c bus.
> > > + * @type_name: name of the i2c mux type to create.
> > > + * @channels: an output parameter specifying where to return the channels.
> > > + *
> > > + * Returns: None
> > > + */
> > > +void pca954x_i2c_get_channels(I2CBus *bus, uint8_t address,
> > > +                              const char *type_name, I2CBus **channels);
> > > +
> > >  #endif
> > > -- 
> > > 2.37.0
> > > 
> > > 
> 
