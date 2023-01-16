Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1597124ejc;
        Mon, 16 Jan 2023 09:23:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtcbUmqVrJAn46MyrOkwdnmc9JrLdbHK2FAmTj04uDjzE8vRqYgSPR/kJLQd33Cy13WZicp
X-Received: by 2002:a05:622a:428e:b0:3b6:312f:8720 with SMTP id cr14-20020a05622a428e00b003b6312f8720mr6130961qtb.43.1673889828326;
        Mon, 16 Jan 2023 09:23:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673889828; cv=none;
        d=google.com; s=arc-20160816;
        b=JDHoSohBlIm8dBCLaf00yLlkS9B+LcswkznvuTRAprs75MsxnCsmEvrNUe0rz4wzs0
         8/EphscTfbfJpnN8uqglUl9ZlFU4lGukOoIGK/rcGU2x4VhsvptdOk/sCMHjUDkVorZM
         djdnrLs2HnamAkUsAmfnibHog/9AgiVp2ylXdrwR3YZ7lwbISNnb/H3Ak5dhWjChzki7
         uPzOiKsq4yqgdOw9wWExksnvgQmG8++4xCXAXDqFllOiQhC7YHjjarY93e7aIqqNlgal
         rxtTsgXy95rzLvDAWLUxbuvdUTUduNArKA16gUigftdW2lGXZj9lN6hGUrvW8TrFpDKr
         wlVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:feedback-id
         :dkim-signature:dkim-signature;
        bh=ennun2qqqXCfU/CBtnAyBjRAVIOvL8V5uwS5AIXTy78=;
        b=aWfBFUx+jnx2tf2ggL7HFyyfBhwsHw2XZkSBV/RZTthPpVPkXHivS9VUshBTVMkKcg
         5BohRR7csCI+17KQ0y6eu4ki/mP+6sGYhhDsd22VqbUsTGFqShOhxGO+lJkU38nRTW/i
         gEYijAhZc6BqAefoNRfWiK9qzO7tn4ruOmAEl7r+FfW1ERFL/Rn7p77LKRr/keT6k/gW
         wqlrQ/8zyWoVj6tmQcdsLLp1k9SVXwFSQ+Wbcf71pCQiKBYe8GrjQszdFVNlJbsf1AlS
         JWz7xF7iiFIcr/5MQcYC5idADqgjtaBFB90sll04ylotBAZoq2bQd8E8BFwMPClE7yra
         2y6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=NXzmPAZI;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=E4EaeSwT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k15-20020ac8474f000000b003a7f5484791si17080609qtp.487.2023.01.16.09.23.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jan 2023 09:23:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=NXzmPAZI;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=E4EaeSwT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHTCb-0008PL-5n; Mon, 16 Jan 2023 12:23:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHTCZ-0008Ox-SQ; Mon, 16 Jan 2023 12:23:19 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHTCT-00035H-2Y; Mon, 16 Jan 2023 12:23:16 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 4CF3C320090F;
 Mon, 16 Jan 2023 12:23:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 16 Jan 2023 12:23:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1673889788; x=
 1673976188; bh=ennun2qqqXCfU/CBtnAyBjRAVIOvL8V5uwS5AIXTy78=; b=N
 XzmPAZIac9xoU3zAKNYRWuQmigXa26ftrxvQDYvmwiL9uXYOz7hoetuvwxjaHjpZ
 PiEvG1uOkRl03R2JXxbHQ1IrhItsEhFUpZ7vyE3hqE18YzBk/kw6FIPO2hBPc8VI
 lkWdDdHnD6WUiKWx65UuqNkSu0PqSoetHSFDMuiHNjDg3fLnK8PK/3014awhET5i
 Y9etL/peGr2NHb+g0XZTX4dBxOmBNNeS9+GAWO4V1s8d2LggxhEtNaE/DuPGMt7f
 t1Ox/gVMgMyt1bbqSooFd4yjDeFsgFOXR/m+xpcL18yJB4OdL7JlAaIXPABgVyTg
 khp/Rl/lp5davRi+wKZ2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673889788; x=
 1673976188; bh=ennun2qqqXCfU/CBtnAyBjRAVIOvL8V5uwS5AIXTy78=; b=E
 4EaeSwT6vZaZxSNWPjGyirl0QPphpfOhVXeMOmeaPvfGy0XfvTJN6MD4BvVfZJaB
 mJ/9FFs2v+Flwqut9HEVXkjpV5mY9BE7uIRlShET8/lIEPpwOA21NEaJRe9C5YRt
 bc5pXZFzjvYjyAl5EJtra6rnDvx7krvzSCf+cH/8p4SX5G/2Il+A2zPjf3IugbIL
 WH0Odbt5eG4voBnlT9vZCuWNCgcB9LckDZQAlZVJX9FUxzv7CjMuizSXnG38gapo
 AZ/sypvtHw0cWsVhz9QgQR1PReoBOKT7+pftyqUPNgqLTk7RzKKIazrGtAsffrTU
 jCAURkyarvn36ihCY57AQ==
X-ME-Sender: <xms:_IfFY_MzoYBmMgMHGiQFYFqVnhnv6NEbuxpltL2ruSwzuCgDHhyy6Q>
 <xme:_IfFY5-MSX8_71DHDUDbCuPrtqIpAtH1iVimP3k6sRgtCoozI6fvl6IKbFExeZTpy
 i1WfzjFFnpEJMHq3dI>
X-ME-Received: <xmr:_IfFY-QRnMJD8XpYaXoGOvrJ0jLLT6TwN97RFg3id8eYxNegzjo8tAWtWtVfZUkE8SbHWcOkcV4S7iHVFYg5Su0LFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtgedguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrf
 grthhtvghrnhephfegffevudefveetgeekteeijefhhfduueejvdegvdehffehjeevtefh
 hffffeeunecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:_IfFYzvimY8s8K-h1vc_zKsuGYGWW9B-JzEaQperKWzn-t7DYSrXyw>
 <xmx:_IfFY3cZblqOz9vCCZy8uSD34C3dJiIebI56TmHDTtcFmq8WRW9BBA>
 <xmx:_IfFY_1dXJgmvIiVko5oQSIU6GCEU0nf_bTg4Snr3lJ9GMNtmpyX_Q>
 <xmx:_IfFY2w7w3Tb1GPUmR5AF6O75pvnkDw47NA-kxFHfOk_NoOTkRAIkQ>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Jan 2023 12:23:07 -0500 (EST)
Date: Mon, 16 Jan 2023 09:23:05 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: patrick@stwcx.xyz, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joal@jms.id.au, hskinnemoen@google.com,
 kfting@nuvoton.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 6/6] hw/arm/aspeed: Init fby35 BMC FRUID EEPROM
Message-ID: <Y8WH+aneXr/JkEXp@pdel-mbp>
References: <20230114170151.87833-1-peter@pjd.dev>
 <20230114170151.87833-7-peter@pjd.dev>
 <0ef1b0e3-7df0-e611-0335-bf0a24690a90@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ef1b0e3-7df0-e611-0335-bf0a24690a90@linaro.org>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=peter@pjd.dev;
 helo=wout1-smtp.messagingengine.com
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
X-TUID: vrK8ghhx/+B+

On Mon, Jan 16, 2023 at 01:30:19PM +0100, Philippe Mathieu-Daudé wrote:
> On 14/1/23 18:01, Peter Delevoryas wrote:
> > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> > ---
> >   hw/arm/aspeed.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 49 insertions(+)
> > 
> > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > index c929c61d582a..4ac8ff11a835 100644
> > --- a/hw/arm/aspeed.c
> > +++ b/hw/arm/aspeed.c
> > @@ -922,6 +922,52 @@ static void bletchley_bmc_i2c_init(AspeedMachineState *bmc)
> >       i2c_slave_create_simple(i2c[12], TYPE_PCA9552, 0x67);
> >   }
> > +static const uint8_t fby35_bmc_fruid[] = {
> [...]
> 
> > +};
> > +
> >   static void fby35_i2c_init(AspeedMachineState *bmc)
> >   {
> >       AspeedSoCState *soc = &bmc->soc;
> > @@ -1363,6 +1409,9 @@ static void fby35_reset(MachineState *state, ShutdownCause reason)
> >       object_property_set_bool(OBJECT(gpio), "gpioB3", false, &error_fatal);
> >       object_property_set_bool(OBJECT(gpio), "gpioB4", false, &error_fatal);
> >       object_property_set_bool(OBJECT(gpio), "gpioB5", false, &error_fatal);
> > +
> > +    at24c_eeprom_write(aspeed_i2c_get_bus(&bmc->soc.i2c, 11),
> > +                       0x54, 0, fby35_bmc_fruid, sizeof(fby35_bmc_fruid));
> 
> Why transfer the prom content on the i2c bus at each reset?
> 
> In particular this looks wrong if the prom is initialized with a 'drive'
> block backend (using -global).

Yeah, it looks like this might not be the right way to model it. I'm going
to try Cedric's suggestions.

> 
> >   }
> 
> 
