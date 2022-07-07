Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp5666708lft;
        Thu, 7 Jul 2022 10:50:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uYjGjWdPfPprMnXRo+e8vOTPX4fvyC2fZ9C58Fqb/MEeOMxXQDzzjablFNGO7n2azHehy1
X-Received: by 2002:a0d:e8c8:0:b0:31d:555:b4ce with SMTP id r191-20020a0de8c8000000b0031d0555b4cemr6100240ywe.94.1657216248379;
        Thu, 07 Jul 2022 10:50:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657216248; cv=none;
        d=google.com; s=arc-20160816;
        b=j0+2EEMTdH2uPd5igKdhP27LjVjzmYyrX39G6akDRtzSkv+gnNd0DmrgR9wBoKWtQK
         eIOoInYYM70eWq0bo+vmoRyihV6DD4XOKp2f0bBx8/fseNwxl8llsg671C/WXpNm/p8x
         JecmvGFuCwOjmhs9pjvMp+ZzcaY41y/s82KPH0ljvB2qgAq+vp90UOdq5sMpP8fs/XJU
         UrzAhxBrKYi/yNd2iMgtD1GbgWer8/nF4ltra5ewUR/TJIijcAhk7Fus1vl9/yoSD2bJ
         Kig1F6z13jwLdXaFn6endKvWQJkUw6nuMI8zLCQKtf6vOIKhzPKo+ejZWa+sKPqo4vVx
         +3CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:dkim-signature:dkim-signature;
        bh=gQDLwY5ydqhtZSXB3M8Xr1FTL2/dl3ZEnOYN+KkdxG4=;
        b=IU6FDCDOwuRwO70e6E3gm1XwXWAlReAIRqh8fSEpzXYQxnRBJbaS0+pdGzSbrGJ9gw
         nOzmydLc2CAOLJikCVUednbKfsYrLjtINKGoWJnVb9ISj8pHBlzmAJdxeHqFb2U9wsgS
         stGfnd7LgPxKmZQmIrBYpxxJQVbgCT6Dy388BvlRHn/kvVm8fpMdDSLVJkRRp0+JFjlR
         pKBpXgcBc3zOrb+KGcAxXSpNTA02pVsQrcPJsE8gRvl1SnWKLrfR1Sqa56eOs/OuB8nu
         mh7RyojM4KvZYHbBXVjaYcZ2q8a2r2aYoA/UBNUcC9F1QqcEUyGpCXZoQo0ui5SKZfGu
         DYyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=b0fZQoJR;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=cOIWi5ta;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 125-20020a251983000000b0066e2b64076csi20506510ybz.315.2022.07.07.10.50.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jul 2022 10:50:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=b0fZQoJR;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=cOIWi5ta;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9VeJ-0007Tx-QP
	for alex.bennee@linaro.org; Thu, 07 Jul 2022 13:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o9Ve9-0007TH-OA; Thu, 07 Jul 2022 13:50:37 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:56561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o9Ve7-0006zW-Hq; Thu, 07 Jul 2022 13:50:37 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 2A9072B05DE3;
 Thu,  7 Jul 2022 13:50:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 07 Jul 2022 13:50:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1657216231; x=1657219831; bh=gQDLwY5ydq
 htZSXB3M8Xr1FTL2/dl3ZEnOYN+KkdxG4=; b=b0fZQoJR2ZnIPZDQQp9Ppn2VPt
 /JhLbgpfKHP/NY/03dshCbqc1RIqZFppEtcDOKJsJ6r8/H5yBUmgDX7CF7fO8Vv6
 Zf3A8fY5YvgNY2umRcOBt2//Qn09unSQ/q6VgQ3XXwci6WxONddMfoehpMxk0s4G
 w3iaL1Lbc19cjOfrEWkllcIVAtet+2muWQeGpJE4FHa762j9KYEppPJ6mqnXSKyl
 h0Xd/7HOfkp/unIImSjGhZ5lvUxO9oOjs/pZw2Mpm5rrul2ztGpRHz3zAPlkm1JK
 BuKKSU8Ynj2JybmSFGqX7M/S8xubXuoaqLEru/6M6qJhOp7Nmsa0ttIBFQ/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1657216231; x=1657219831; bh=gQDLwY5ydqhtZSXB3M8Xr1FTL2/d
 l3ZEnOYN+KkdxG4=; b=cOIWi5taCqn7Wwz+MNlK5kR9G5iMky8biKAo8XiXLDAT
 ScJokcopgNkdtO4KtX3KMCQu+EOuqKLHVrsYSNDnpDg/ZkIJhdsqZT8W7T/bUHBl
 qCIipHsXThkq/ubwM0Ns2nchnBwF4TzfAWV5Q2rghG7xkw1J1TFAiydFy7+V4nRx
 1m1C0+RhTFT0iX7/kDgf3xT4XbeV2LteNXF7Wgwnya2dt0vFwXqM1Dwj68Lw33EK
 V4sPFlc97IMLGHfokkzhInJ1IXYU8qc40QBIfo6IGWAPqTLMEVe4uT2wl8nnXIdC
 k8jN7eXax0oOTIOGyRWrLty0lJ8as4eqffZ2qJcYiQ==
X-ME-Sender: <xms:5xzHYmvY2uk8Z7kTWb3BzixZjhSoYOEyYd6cUXR8YRXkk_wf94UTbA>
 <xme:5xzHYrdjOMW5J4H9c6z1Y0XSCqw6vOOYwyM6JupkNdtc-ZMG01C1IUN7tuwjnpyzp
 guZAJbtUHGvLYqSoW8>
X-ME-Received: <xmr:5xzHYhw3rTijH5IsIQEojbkqSAXWABtaZmwU1T9-_PYLI4i5V36sZvliZqMI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeihedguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpeduteeihfffleeuveekgedugfeffeehtdeguefffffhleehgfduueejjeek
 feeukeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:5xzHYhML9xtnQ0wvjl_A2tWERZq5zzMpX1lseEJ7KNc5g0nJW83YVg>
 <xmx:5xzHYm-N6sfoiQKCKVDiIzoJyyAWBPTA7DYrSKh1Mt1h7pdmCHE5Ug>
 <xmx:5xzHYpWOKv9Eg2p2xs52kGRu85yOmeWOLVHkp7YnZaF8pM7arOMYlA>
 <xmx:5xzHYqa7EJwW-p5LyLF6ZtEI2T-vIV1q3ZamWscIq6IuvkOMEdazw318YFY>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Jul 2022 13:50:30 -0400 (EDT)
Date: Thu, 7 Jul 2022 10:50:28 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: Joel Stanley <joel@jms.id.au>
Cc: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [PATCH 1/2] hw/gpio/aspeed: Don't let guests modify input pins
Message-ID: <Yscc5N0I/t/iYpED@pdel-mbp>
References: <20220707071731.34047-1-peter@pjd.dev>
 <20220707071731.34047-2-peter@pjd.dev>
 <CACPK8Xe-BXFt7oefdO-QS67tQSRP6arzgnGO973MYDYOMrQK4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8Xe-BXFt7oefdO-QS67tQSRP6arzgnGO973MYDYOMrQK4w@mail.gmail.com>
Received-SPF: pass client-ip=64.147.123.27; envelope-from=peter@pjd.dev;
 helo=wnew2-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM14=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: O7njNrsyho7U

On Thu, Jul 07, 2022 at 08:20:01AM +0000, Joel Stanley wrote:
> On Thu, 7 Jul 2022 at 07:17, Peter Delevoryas <peter@pjd.dev> wrote:
> >
> > It seems that aspeed_gpio_update is allowing the value for input pins to be
> > modified through register writes and QOM property modification.
> >
> > The QOM property modification is fine, but modifying the value through
> > register writes from the guest OS seems wrong if the pin's direction is set
> > to input.
> >
> > The datasheet specifies that "0" bits in the direction register select input
> > mode, and "1" selects output mode.
> >
> > OpenBMC userspace code is accidentally writing 0's to the GPIO data
> > registers somewhere (or perhaps the driver is doing it through a reset or
> > something), and this is overwriting GPIO FRU information (board ID, slot
> > presence pins) that is initialized in Aspeed machine reset code (see
> > fby35_reset() in hw/arm/aspeed.c).
> >
> > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> > Fixes: 4b7f956862dc ("hw/gpio: Add basic Aspeed GPIO model for AST2400 and AST2500")
> > ---
> >  hw/gpio/aspeed_gpio.c | 22 ++++++++++++----------
> >  1 file changed, 12 insertions(+), 10 deletions(-)
> >
> > diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> > index a62a673857..2eae427201 100644
> > --- a/hw/gpio/aspeed_gpio.c
> > +++ b/hw/gpio/aspeed_gpio.c
> > @@ -268,7 +268,7 @@ static ptrdiff_t aspeed_gpio_set_idx(AspeedGPIOState *s, GPIOSets *regs)
> >  }
> >
> >  static void aspeed_gpio_update(AspeedGPIOState *s, GPIOSets *regs,
> > -                               uint32_t value)
> > +                               uint32_t value, bool force)
> >  {
> >      uint32_t input_mask = regs->input_mask;
> >      uint32_t direction = regs->direction;
> > @@ -293,10 +293,12 @@ static void aspeed_gpio_update(AspeedGPIOState *s, GPIOSets *regs,
> >              }
> >
> 
> Reading this model hurts my head a little. Perhaps we also need to add
> a test for this case to make it clear what's going on.

Yeah, I guess the idea was to create one function "aspeed_gpio_update"
to handle register writes, so it takes a 32-bit register value function
parameter.

The problem is that it still iterates over all the GPIO's in the
register and updates them individually anyways. Maybe there's an
opportunity here to move the xor + for-loop to a wrapper.

But yeah, I'll add another commit that includes a test case for this.

> The test above the code you've changed does this:
> 
> >            /* ...and we're output or not input-masked... */
> >            if (!(direction & mask) && (input_mask & mask)) {
> >                continue;
> >            }
> 
> For clarity, !(direction & mask) means "is input".
> 
> The comment confuses me because it says "or", but the code has "and".

Yeah I was looking at this as well and noticed the comment doesn't make
any sense.

> 
> input_mask doesn't seem to feature in the Linux driver, so that will
> always be zero. The test will be X && 0, which is always 0.

Ohhhhhh I didn't notice that though. Good catch!!

> 
> If you changed it to || then we would do the test that the comment
> suggests. When the pin is input, we will skip updating the value.
> 
> This will solve the bug you had with your input pins being reset. It
> won't fix the QOM case, but we could consider handling that separately
> without confusing the logic in this function.

Yes good point: I'll change this to || and figure out a different way to
update the value through the QOM property setter.

> 
> 
> >              /* ...then update the state. */
> > -            if (mask & new) {
> > -                regs->data_value |= mask;
> > -            } else {
> > -                regs->data_value &= ~mask;
> > +            if (direction & mask || force) {
> > +                if (mask & new) {
> > +                    regs->data_value |= mask;
> > +                } else {
> > +                    regs->data_value &= ~mask;
> > +                }
> >              }
> >
> >              /* If the gpio is set to output... */
> > @@ -339,7 +341,7 @@ static void aspeed_gpio_set_pin_level(AspeedGPIOState *s, uint32_t set_idx,
> >          value &= ~pin_mask;
> >      }
> >
> > -    aspeed_gpio_update(s, &s->sets[set_idx], value);
> > +    aspeed_gpio_update(s, &s->sets[set_idx], value, true);
> >  }
> >
> >  /*
> > @@ -653,7 +655,7 @@ static void aspeed_gpio_write_index_mode(void *opaque, hwaddr offset,
> >          reg_value = update_value_control_source(set, set->data_value,
> >                                                  reg_value);
> >          set->data_read = reg_value;
> > -        aspeed_gpio_update(s, set, reg_value);
> > +        aspeed_gpio_update(s, set, reg_value, false);
> >          return;
> >      case gpio_reg_idx_direction:
> >          reg_value = set->direction;
> > @@ -753,7 +755,7 @@ static void aspeed_gpio_write_index_mode(void *opaque, hwaddr offset,
> >              __func__, offset, data, reg_idx_type);
> >          return;
> >      }
> > -    aspeed_gpio_update(s, set, set->data_value);
> > +    aspeed_gpio_update(s, set, set->data_value, false);
> >      return;
> >  }
> >
> > @@ -799,7 +801,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
> >          data &= props->output;
> >          data = update_value_control_source(set, set->data_value, data);
> >          set->data_read = data;
> > -        aspeed_gpio_update(s, set, data);
> > +        aspeed_gpio_update(s, set, data, false);
> >          return;
> >      case gpio_reg_direction:
> >          /*
> > @@ -875,7 +877,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
> >                        PRIx64"\n", __func__, offset);
> >          return;
> >      }
> > -    aspeed_gpio_update(s, set, set->data_value);
> > +    aspeed_gpio_update(s, set, set->data_value, false);
> >      return;
> >  }
> >
> > --
> > 2.36.1
> >
