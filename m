Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp690556ejc;
        Wed, 25 Jan 2023 14:08:03 -0800 (PST)
X-Google-Smtp-Source: AK7set/1c9aUkEtRGjF7o9nCuKnBf3KlTcgpPVeqnSvKVz44ZADoC/a2J05ELoMHhzIkG90i7/nB
X-Received: by 2002:a05:622a:4cd:b0:3b7:f65e:33c2 with SMTP id q13-20020a05622a04cd00b003b7f65e33c2mr12393031qtx.13.1674684483048;
        Wed, 25 Jan 2023 14:08:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674684483; cv=none;
        d=google.com; s=arc-20160816;
        b=xyLYDxTI3EHe441WapebpuoOu6ChWd1pfnI6tDAdZIu/0nLjzS0r8HSfUjD96kKEuz
         dlHGceAYFbnARcoGQwKjvoSDQXMCuyy3ZwTPoLNGtdThVo1OiWEJ5AIpwAQJtFm7azPc
         LJJ5SMQ6DSFixgr4o+JrHJP86oAFf3oXyLRPb6EpAEpExAcVPsmoTgewX2fHhTszhfkq
         Eif5mdGHZ2AMDgio8rGiaa5D6tTcEWy1GM6o+bC6TfawU1szVWSS8gWLyADcYzNEYnvP
         1v4y0TAvCnZt7pWwgwRmfI05p4NASO+NfMJojihu+xbSTdLyY6YxaC08HlupZq27sjie
         zCwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:dkim-signature:dkim-signature;
        bh=OIGcSgi+FN6vHWNhF43c2FHv9XBW7xmBBYI4y2iyfl8=;
        b=pxVU/wnyVnJIpQ+9lEqgXNi5NaKui4byW2Wb/j2cAayXpwqPbpTyl+R6Em+HNq1jTu
         +1DNBBtLzbzYQSO0RuYbn3AqG7wM7OkrRTeAyRngSOuLSujxYoTkG3CjZ7mOo3jEml8H
         +VxCqwR6Jxr5gZVeKWX/ZQp+dLqoFXotuc48rAILgAzKgDZnyXJBAKaN/me+7mKx3cA+
         w0l2mIKr6tIvqk/YMlZcKWbCweUTGc326cKL9HqzDxyxwYPMlEn7QFWVay7wMrPJTgG8
         jZlf7fJKtaFcsRnjKEqWgiDFRwPPFpAD/Vzgqv9EPeLCFGN8gtDlm5mltRFTttJkrLkI
         2qcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b="quZcD//M";
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=Wt+E56Kl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c19-20020ac85193000000b003a68b8303c4si4257958qtn.690.2023.01.25.14.08.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Jan 2023 14:08:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b="quZcD//M";
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=Wt+E56Kl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pKnvl-0000Fi-E1; Wed, 25 Jan 2023 17:07:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pKnvg-0000EC-Rf; Wed, 25 Jan 2023 17:07:41 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pKnvd-0002VM-Bw; Wed, 25 Jan 2023 17:07:39 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id F3D9B320090E;
 Wed, 25 Jan 2023 17:07:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 25 Jan 2023 17:07:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1674684454; x=1674770854; bh=OIGcSgi+FN
 6vHWNhF43c2FHv9XBW7xmBBYI4y2iyfl8=; b=quZcD//Me75AOUTEm5pUle4wr+
 SOSRdDSlL3ZsGEecVZdSEpH8wNBhDG4wACg7JwdTAlxtHxaXNMAtkWjXRiDVFfc0
 mLB+MooQX0wEi/uYQh6Gp73NxO6p0SS/sgsPF0Alyz54Qg2cjGdvuTCsx7JEVtFx
 wDAkKtC9whP8aYqqJvpOnG2kSBCKNpGbXtoE5Pvb/gRDiZXhk1lzHx/Op30Iyyvm
 8b9F8GbV72zbZ/gtHMFd3rgb7I6adALqdcw4bYBPxB34yO/lKaLy9MFj6Kq9F3zw
 psguRETLaFVUBcqGxRMNb/u0agzumxVgCjv/aAK2jMJgchAP5TICVma0aMSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1674684454; x=1674770854; bh=OIGcSgi+FN6vHWNhF43c2FHv9XBW
 7xmBBYI4y2iyfl8=; b=Wt+E56KlZXJ0fHqH2R5c12L9rsQ8XBjAdWm3gI8XiLRn
 sg7cwddIJrB3peiQX7/bba0MM7egTswHNSyCWh4zdnPA19gPZj5i2bsRMflSUqPS
 ySbTt+zyKsdqSR1uwlksauYcmMCp2loNLjs+86HctRpL7xGnkRD2R/MJDQLgpPw+
 5ssr3hZgzL8M64dLze7FpPv6zjZz+wSOB1A2s13tDUaNX6jA6Oa6r5UrFtTpyaYf
 mhtSmnZGKycU53z/Z9ruTSEHUqDsflk+7ZThGEikv7TnTqRd9Pyp1JT9Z3/oMI/O
 3Hethctup00BzLZaeBh10pjhppxn9MIrQ9GdS6mryw==
X-ME-Sender: <xms:JqjRYzZqWmIP034ZlQC7RByH6qnmjTSFMkN9M6mRBsDxSZ8avlx53A>
 <xme:JqjRYybZqSEmfEdIm7fJr4BovMzp3731DdV6NcjBh5POlCfxSvaiZ5mN6N2rNDVwo
 96x5yCaaEwlC5f8KEA>
X-ME-Received: <xmr:JqjRY1_x0Qi1eYcg_R26tR0XBPVyuE-Cob_HOPC_yf1q6qX2puSQsO8tWUYiyl-RqOEeSFP5rEHusVLBm7_Z58fc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvvddgudehlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpeduteeihfffleeuveekgedugfeffeehtdeguefffffhleehgfduueejjeek
 feeukeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:JqjRY5qLtorWoMk_QLE87vixWe76hYPB5Dn6FwrEbsa-2g91ecWsBg>
 <xmx:JqjRY-qQYYut41QvDLVY-N5jwoByCk0SzyE0cWXamWYsCeroFtQmOA>
 <xmx:JqjRY_SLWwWIdkzDGSE78Y94ryqhSbyzzGd6ej-IvBp422mwgQkLzQ>
 <xmx:JqjRY6fv6xfFl7p6U2qWpTbmyproTl9tvljLCATS3kor61W4kxnTsA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Jan 2023 17:07:32 -0500 (EST)
Date: Wed, 25 Jan 2023 14:07:30 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: Corey Minyard <minyard@acm.org>
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, philmd@linaro.org
Subject: Re: [PATCH v4 5/5] hw/nvram/eeprom_at24c: Make reset behavior more
 like hardware
Message-ID: <Y9GoIsyCamKsQJVK@pdel-mbp.dhcp.thefacebook.com>
References: <20230118024214.14413-1-peter@pjd.dev>
 <20230118024214.14413-6-peter@pjd.dev>
 <Y9GiCmi7GRW0e/dm@minyard.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9GiCmi7GRW0e/dm@minyard.net>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=peter@pjd.dev;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
X-TUID: 1A9sDB8kE2LU

On Wed, Jan 25, 2023 at 03:41:30PM -0600, Corey Minyard wrote:
> On Tue, Jan 17, 2023 at 06:42:14PM -0800, Peter Delevoryas wrote:
> > EEPROM's are a form of non-volatile memory. After power-cycling an EEPROM,
> > I would expect the I2C state machine to be reset to default values, but I
> > wouldn't really expect the memory to change at all.
> 
> Yes, I agree, I was actually wondering about this reviewing earlier
> changes.  Thanks for fixing this.

Oh great! I'm glad everyone has agreed with this so far.

- Peter

> 
> Reviewed-by: Corey Minyard <cminyard@mvista.com>
> 
> > 
> > The current implementation of the at24c EEPROM resets its internal memory on
> > reset. This matches the specification in docs/devel/reset.rst:
> > 
> >   Cold reset is supported by every resettable object. In QEMU, it means we reset
> >   to the initial state corresponding to the start of QEMU; this might differ
> >   from what is a real hardware cold reset. It differs from other resets (like
> >   warm or bus resets) which may keep certain parts untouched.
> > 
> > But differs from my intuition. For example, if someone writes some information
> > to an EEPROM, then AC power cycles their board, they would expect the EEPROM to
> > retain that information. It's very useful to be able to test things like this
> > in QEMU as well, to verify software instrumentation like determining the cause
> > of a reboot.
> > 
> > Fixes: 5d8424dbd3e8 ("nvram: add AT24Cx i2c eeprom")
> > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > ---
> >  hw/nvram/eeprom_at24c.c | 22 ++++++++++------------
> >  1 file changed, 10 insertions(+), 12 deletions(-)
> > 
> > diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> > index f8d751fa278d..5074776bff04 100644
> > --- a/hw/nvram/eeprom_at24c.c
> > +++ b/hw/nvram/eeprom_at24c.c
> > @@ -185,18 +185,6 @@ static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
> >      }
> >  
> >      ee->mem = g_malloc0(ee->rsize);
> > -
> > -}
> > -
> > -static
> > -void at24c_eeprom_reset(DeviceState *state)
> > -{
> > -    EEPROMState *ee = AT24C_EE(state);
> > -
> > -    ee->changed = false;
> > -    ee->cur = 0;
> > -    ee->haveaddr = 0;
> > -
> >      memset(ee->mem, 0, ee->rsize);
> >  
> >      if (ee->init_rom) {
> > @@ -214,6 +202,16 @@ void at24c_eeprom_reset(DeviceState *state)
> >      }
> >  }
> >  
> > +static
> > +void at24c_eeprom_reset(DeviceState *state)
> > +{
> > +    EEPROMState *ee = AT24C_EE(state);
> > +
> > +    ee->changed = false;
> > +    ee->cur = 0;
> > +    ee->haveaddr = 0;
> > +}
> > +
> >  static Property at24c_eeprom_props[] = {
> >      DEFINE_PROP_UINT32("rom-size", EEPROMState, rsize, 0),
> >      DEFINE_PROP_BOOL("writable", EEPROMState, writable, true),
> > -- 
> > 2.39.0
> > 
> > 
