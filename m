Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp950191lft;
        Thu, 30 Jun 2022 22:31:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uiwbtcfnbobAu8BJ7N2TCv7QYAKA/mqMeiGqRQMhislss5M9LmIYb1XcmP3z4+r6Z8Gb3Q
X-Received: by 2002:a05:620a:6008:b0:6af:5d81:870b with SMTP id dw8-20020a05620a600800b006af5d81870bmr9001152qkb.763.1656653483685;
        Thu, 30 Jun 2022 22:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656653483; cv=none;
        d=google.com; s=arc-20160816;
        b=RWHKbu3TmPa8g78gg/CZ6puQiIqVRi6Azm3JQqaPVnReiC9p0f8ZPSLZzS8vReIlaP
         KpQLhrmOx25QPwgMsTD6Xx6t391L0C8dqRn6uoau+xnY43YPDZakzMidJlHvjVhsYWC8
         sgTlfcnBDLQAsKdjOKyrDkaxiQEw954AcuWcItIGsJ6AlPSfUGFF4ZAb4ElfiW7t8O8z
         s+Nbo1OLk34AHQDaLple7bUArkSYVfpsg9rNFmumKn7YG/sqoWEm4wvsTlo7SyCU2yxB
         UWmW3t3Oq6swEUiXcvJWCD7thIAEK1fvoUW51RbViW+NsrbEbGZ5+6kQBopsUxcNL3LP
         kJMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:feedback-id
         :dkim-signature:dkim-signature;
        bh=TzrZedKca9gyiMwiGhpXhJVlnCIBmuSa8BF+/EliAm0=;
        b=gTwnj/ZMXuBlxsryX/cIDfOYQP3iOsEV24SkjxA62E42jMHPo1XFqlQv5pImKT5Tgq
         nsPSTGxPKbSXSzhk/MWExIvevT2sTTw6N/02+h2AShl/u47twcVfr2FSPntEU4vfuXiV
         1ZM5N2mkr63h8rLjUaxDssZvTgBKsjODM6fAf8S9NdvGtapJnf8EkkfveRZe2k6JxeX7
         qiUM5ThlfFPvsNuSyq8vHdmWV5QVBs0amCMy92isbKO4wxuoVanSkviDB81eJ7ZHnW75
         StuIEE4EbWK4lQPNTovmoMb38NM/6ryQam/toe30M4/v+P+IVDxSkuvqPpmgaJcTQcL1
         VV3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=108SOUBF;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b=cdcsAGrg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y18-20020a05622a165200b00304d85c5d24si12914914qtj.3.2022.06.30.22.31.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jun 2022 22:31:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=108SOUBF;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b=cdcsAGrg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o79FT-0002Cz-6e
	for alex.bennee@linaro.org; Fri, 01 Jul 2022 01:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o79Eo-0002CB-0N; Fri, 01 Jul 2022 01:30:42 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:54529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o79El-0000wv-Ql; Fri, 01 Jul 2022 01:30:41 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id B13FB2B05A12;
 Fri,  1 Jul 2022 01:30:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 01 Jul 2022 01:30:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656653430; x=
 1656657030; bh=TzrZedKca9gyiMwiGhpXhJVlnCIBmuSa8BF+/EliAm0=; b=1
 08SOUBFBFVb5ybyu5vh2nuoRalVzQYoOr8rmj+63ZjuyN8Y3wtvfZ24fTmmUSlDY
 34OvSqr574xPzjcjNnjkePkamCyS7suMyIkr+sztxsZp2/drUVY/Z0dck9AbO0ot
 s0shs28BPss09s7mcBdiBlv85hCjl2M5gu5aOgPyRmuoHTbvsCkdT8EPtmYVvyuH
 CGRgvZyQgDCmu2XpMlxdCkIaofKWG3PQPRBuXrOOGYSj25dd2fyy5cw4AepXt1+9
 9tyM4LH0E+koVLULz9U+NEqMDy0gCCJJHTPDCNcvmgkSvxt0gJ+ViiCYSjlWS4no
 pFgrgLY+IAdpPvzEmLM8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=i9e814621.fm2; t=
 1656653430; x=1656657030; bh=TzrZedKca9gyiMwiGhpXhJVlnCIBmuSa8BF
 +/EliAm0=; b=cdcsAGrgd/VPAQuSw079mGtLBNuFrWxMoZoEos3CVgs1Yt1b5Ym
 el3HrqxNvGeTBAHKnueOMtWkGJE+447iefDL3EaS9M3J9ZOHPS7xSMP4SAlbqsmg
 oH88a3YzoFa9FQBvTfsdTk3gGXmgqarjSgiVPfHWvfe7P/1jzigV4lCDp9N1UeX7
 rgKy4ldQHxU7u8ncwNOcNtAO5uEB4Ghan2SLYokD/4tvdSo4++V0MDY4eJJ5uS+j
 hTJIWTquSj6x8QxmD/2T5rW1Erjay/PUbS0HVxS9NYiVUDLPLeAyxn5UHCt5dqJ8
 Mp8lVtKugJKAsJa5ZhU4kttbcCoNoj7mYLw==
X-ME-Sender: <xms:dYa-Yq2F9QoLm6MWSxyARZmY5ykJdRCr5k11v2ExEcdw9XDDpuoqwA>
 <xme:dYa-YtF0Fco51obfQhjDs79JxgWaSwjPx--zpIvig5c7RjroZg7WooCN5LL8I51rH
 W9ogVQzskk4Y1HUJKU>
X-ME-Received: <xmr:dYa-Yi7bIjhpRZR9dReRVxs2JNodtBnGFgH1xWtKqIh36n8XI4EGpGocd3ClBOZxGE_-CEQoTqy7LrjHz4Byb6dmHd7KSnw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehvddgleekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehmvgesphhjugdruggvvheqnecuggftrfgrthhtvg
 hrnhepfefhhfekvdekgfdtffeuudejvdffkeefvddtfeduuefhjedviefhkefgjeefuddu
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgvse
 hpjhgurdguvghv
X-ME-Proxy: <xmx:dYa-Yr0SDm85jn9ahnpIH_luNYT3R38fw6fSgK-FTKs2sXWLiHWlEA>
 <xmx:dYa-YtGMU1bgQua7wxcZisTPQGma9hPK9gNSOylKOVJtVA2EvYZHSw>
 <xmx:dYa-Yk9XqWEcsSvWeyAqZnukRis-vwW0zVQcvKKt3aQdS050-LA1hQ>
 <xmx:doa-YhjD0-qZ5DVi1Z8zQ89oB7M8d_HJBxEFLZzKuNz-BzcU4IQLAnQD-3g>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Jul 2022 01:30:28 -0400 (EDT)
Date: Thu, 30 Jun 2022 22:30:26 -0700
From: Peter Delevoryas <me@pjd.dev>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 3/3] aspeed: sbc: Allow per-machine settings
Message-ID: <Yr6GcoK6QZPgXgcz@pdel-mbp>
References: <20220628154740.1117349-1-clg@kaod.org>
 <20220628154740.1117349-4-clg@kaod.org>
 <Yr5Pnbh3Fbtxdpsk@pdel-mbp.dhcp.thefacebook.com>
 <015aab44-ba72-1f47-b499-ea5fb06d76e6@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <015aab44-ba72-1f47-b499-ea5fb06d76e6@kaod.org>
Received-SPF: pass client-ip=64.147.123.26; envelope-from=me@pjd.dev;
 helo=wnew1-smtp.messagingengine.com
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
X-TUID: PDlOaaj1ApcS

On Fri, Jul 01, 2022 at 07:23:58AM +0200, Cédric Le Goater wrote:
> On 7/1/22 03:36, Peter Delevoryas wrote:
> > On Tue, Jun 28, 2022 at 05:47:40PM +0200, Cédric Le Goater wrote:
> > > From: Joel Stanley <joel@jms.id.au>
> > > 
> > > In order to correctly report secure boot running firmware the values
> > > of certain registers must be set.
> > > 
> > > We don't yet have documentation from ASPEED on what they mean. The
> > > meaning is inferred from u-boot's use of them.
> > > 
> > > Introduce properties so the settings can be configured per-machine.
> > > 
> > > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > > Signed-off-by: Cédric Le Goater <clg@kaod.org>
> > > ---
> > >   include/hw/misc/aspeed_sbc.h | 13 ++++++++++++
> > >   hw/misc/aspeed_sbc.c         | 41 ++++++++++++++++++++++++++++++++++--
> > >   2 files changed, 52 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/include/hw/misc/aspeed_sbc.h b/include/hw/misc/aspeed_sbc.h
> > > index 67e43b53ecc3..405e6782b97a 100644
> > > --- a/include/hw/misc/aspeed_sbc.h
> > > +++ b/include/hw/misc/aspeed_sbc.h
> > > @@ -17,9 +17,22 @@ OBJECT_DECLARE_TYPE(AspeedSBCState, AspeedSBCClass, ASPEED_SBC)
> > >   #define ASPEED_SBC_NR_REGS (0x93c >> 2)
> > > +#define QSR_AES                     BIT(27)
> > > +#define QSR_RSA1024                 (0x0 << 12)
> > > +#define QSR_RSA2048                 (0x1 << 12)
> > > +#define QSR_RSA3072                 (0x2 << 12)
> > > +#define QSR_RSA4096                 (0x3 << 12)
> > > +#define QSR_SHA224                  (0x0 << 10)
> > > +#define QSR_SHA256                  (0x1 << 10)
> > > +#define QSR_SHA384                  (0x2 << 10)
> > > +#define QSR_SHA512                  (0x3 << 10)
> > > +
> > >   struct AspeedSBCState {
> > >       SysBusDevice parent;
> > > +    bool emmc_abr;
> > > +    uint32_t signing_settings;
> > > +
> > >       MemoryRegion iomem;
> > >       uint32_t regs[ASPEED_SBC_NR_REGS];
> > > diff --git a/hw/misc/aspeed_sbc.c b/hw/misc/aspeed_sbc.c
> > > index bfa8b81d01c7..3946e6179bdd 100644
> > > --- a/hw/misc/aspeed_sbc.c
> > > +++ b/hw/misc/aspeed_sbc.c
> > > @@ -11,6 +11,7 @@
> > >   #include "qemu/osdep.h"
> > >   #include "qemu/log.h"
> > >   #include "qemu/error-report.h"
> > > +#include "hw/qdev-properties.h"
> > >   #include "hw/misc/aspeed_sbc.h"
> > >   #include "qapi/error.h"
> > >   #include "migration/vmstate.h"
> > > @@ -19,6 +20,27 @@
> > >   #define R_STATUS        (0x014 / 4)
> > >   #define R_QSR           (0x040 / 4)
> > > +/* R_STATUS */
> > > +#define ABR_EN                  BIT(14) /* Mirrors SCU510[11] */
> > > +#define ABR_IMAGE_SOURCE        BIT(13)
> > > +#define SPI_ABR_IMAGE_SOURCE    BIT(12)
> > > +#define SB_CRYPTO_KEY_EXP_DONE  BIT(11)
> > > +#define SB_CRYPTO_BUSY          BIT(10)
> > > +#define OTP_WP_EN               BIT(9)
> > > +#define OTP_ADDR_WP_EN          BIT(8)
> > > +#define LOW_SEC_KEY_EN          BIT(7)
> > > +#define SECURE_BOOT_EN          BIT(6)
> > > +#define UART_BOOT_EN            BIT(5)
> > > +/* bit 4 reserved*/
> > > +#define OTP_CHARGE_PUMP_READY   BIT(3)
> > > +#define OTP_IDLE                BIT(2)
> > > +#define OTP_MEM_IDLE            BIT(1)
> > > +#define OTP_COMPARE_STATUS      BIT(0)
> > > +
> > > +/* QSR */
> > > +#define QSR_RSA_MASK           (0x3 << 12)
> > > +#define QSR_HASH_MASK          (0x3 << 10)
> > > +
> > >   static uint64_t aspeed_sbc_read(void *opaque, hwaddr addr, unsigned int size)
> > >   {
> > >       AspeedSBCState *s = ASPEED_SBC(opaque);
> > > @@ -80,8 +102,17 @@ static void aspeed_sbc_reset(DeviceState *dev)
> > >       memset(s->regs, 0, sizeof(s->regs));
> > >       /* Set secure boot enabled with RSA4096_SHA256 and enable eMMC ABR */
> > > -    s->regs[R_STATUS] = 0x000044C6;
> > > -    s->regs[R_QSR] = 0x07C07C89;
> > > +    s->regs[R_STATUS] = OTP_IDLE | OTP_MEM_IDLE;
> > > +
> > > +    if (s->emmc_abr) {
> > > +        s->regs[R_STATUS] &= ABR_EN;
> > > +    }
> > > +
> > > +    if (s->signing_settings) {
> > > +        s->regs[R_STATUS] &= SECURE_BOOT_EN;
> > > +    }
> > > +
> > > +    s->regs[R_QSR] = s->signing_settings;
> > >   }
> > >   static void aspeed_sbc_realize(DeviceState *dev, Error **errp)
> > > @@ -105,6 +136,11 @@ static const VMStateDescription vmstate_aspeed_sbc = {
> > >       }
> > >   };
> > > +static Property aspeed_sbc_properties[] = {
> > > +    DEFINE_PROP_BOOL("emmc-abr", AspeedSBCState, emmc_abr, 0),
> > > +    DEFINE_PROP_UINT32("signing-settings", AspeedSBCState, signing_settings, 0),
> > > +};
> > 
> > This needs a DEFINE_PROP_END_OF_LIST(), I bisected to this commit in Cedric's
> > aspeed-7.1 branch.
> 
> Ah you did also ! Sorry I should have told. The problem only showed
> on f35 using clang, and I didn't notice until I pushed the branch
> on gitlab yersterday.

Oh glad you noticed too, it's no problem.

> 
> > Reviewed-by: Peter Delevoryas <pdel@fb.com>
> > Tested-by: Peter Delevoryas <pdel@fb.com>
> 
> I will include the patch in the next PR.

That's great, thanks!

> 
> Thanks,
> 
> C.
> 
> 
> > > +
> > >   static void aspeed_sbc_class_init(ObjectClass *klass, void *data)
> > >   {
> > >       DeviceClass *dc = DEVICE_CLASS(klass);
> > > @@ -112,6 +148,7 @@ static void aspeed_sbc_class_init(ObjectClass *klass, void *data)
> > >       dc->realize = aspeed_sbc_realize;
> > >       dc->reset = aspeed_sbc_reset;
> > >       dc->vmsd = &vmstate_aspeed_sbc;
> > > +    device_class_set_props(dc, aspeed_sbc_properties);
> > >   }
> > >   static const TypeInfo aspeed_sbc_info = {
> > > -- 
> > > 2.35.3
> > > 
> > > 
> 
