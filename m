Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2584369ejc;
        Tue, 17 Jan 2023 09:50:39 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtib/Dyjcjmr72R/0zTQDbywmzLs/VI2YOuY2MG7dROberrpRomB4tA+g25SIuLGxlRp3Qx
X-Received: by 2002:ac8:5242:0:b0:3b6:3f6e:c181 with SMTP id y2-20020ac85242000000b003b63f6ec181mr4117371qtn.36.1673977838891;
        Tue, 17 Jan 2023 09:50:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673977838; cv=none;
        d=google.com; s=arc-20160816;
        b=X34t9nu823hFdyiVwU8uJabPo1IMSjEy+5ASgqa9WMh3jGje+3/PENICpAuU1X9XEG
         VFtWT9uNSjX3FFWcKbUdMLdez6iWQskK1qvpyaD5FDOyjpc3DOBDxm8Dj6XFR4vX2Orm
         If1kKFejUX8abnylEZ1XMTId9mU3YjK6SKgAZMK3BDhIVxLXQKRtFFO/dmclbUyafDFe
         WSiVZAIYL5eTFqV4+wbHwuGD5gcbCLKOTnuR6HRffmpKIctAca7ZAZmZ6d/29oUbneu/
         MrwegubTwYPzzkto78G2EHfkQED+XAAlroaDvx5gb0OPM05zy1JRtJGTryNsWO/AzSFZ
         gvkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:feedback-id
         :dkim-signature:dkim-signature;
        bh=R8X2uySA5QQ1d3cYL7K64sdz6BNRWIEsN7hC/Ip3c5Y=;
        b=itB4lk01GrWq82lckJM2s1V74w0ljhszqPUAEJX08LaDj6Ge0Xxryx9JmfCilgvDZ1
         5TGYYWtbMNURhNBqaYhR3Q7uJ6MF0TgIWQ8sunD5H3GpZJYYkh3XZe52ksfb4JPkesEf
         s1/TXJS6Zjz/9uN1hfRsS4b5PtXKPdL4ItEaF1g4BlMKBnv7bYC9yOIaRvXfOr9HTmr/
         y9hXVQDp97YjgXb/zruhvcZRy6/pnLy9JAgBXAusM8UgXEkbeWJdp/k9uuB/DM7KI6mI
         1kdfDNH+xH2Kc6h051Ry/dGIv64Hr+JW3TcfUDKmFTxVuI1F9zJi89UmwFBIGHe2mrbw
         WFwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=yoAwmHis;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=amSMMorw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id br23-20020a05622a1e1700b003b62b4723fasi1472936qtb.522.2023.01.17.09.50.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 09:50:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=yoAwmHis;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=amSMMorw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHq6S-00085p-3n; Tue, 17 Jan 2023 12:50:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHq66-0007ta-4K; Tue, 17 Jan 2023 12:50:18 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHq63-0003vl-Pt; Tue, 17 Jan 2023 12:50:09 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 3B2DC3200944;
 Tue, 17 Jan 2023 12:50:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 17 Jan 2023 12:50:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1673977802; x=
 1674064202; bh=R8X2uySA5QQ1d3cYL7K64sdz6BNRWIEsN7hC/Ip3c5Y=; b=y
 oAwmHis50NzKtzaylxoEjeodAVnMKhwjzD8XEUiCgxIKi9lERGStbpU365qy+gE5
 HGcx5wGmi+CVKZQ7P0AqTx8V2p+R9CMWfRU9WM2VwJ7EnhiWteTYBC0ZqgUQ5Y/g
 E+UK6oRzkvqS37pg25mHvY4kgKS6vY9/xsUY4HbIiMIUtjQ1ar9QxfA530syH1ax
 B0qwDI8lktdR8PwmZJu/vdCNBoKfa8JPlbmvq2UNX6mmsfPI/xjsUNkRv59Dg2rm
 8O3pVmKW//F0y0m4mIuoIbmV7y0aIvvNak5BVaFqLnSR7tBMMuCD3MxQBDVqCyp3
 QXSRwvqPylQVee/63VZqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673977802; x=
 1674064202; bh=R8X2uySA5QQ1d3cYL7K64sdz6BNRWIEsN7hC/Ip3c5Y=; b=a
 mSMMorwwZeYZ7FSZ6UObqA7X9WIFFh0qBsI9iDh5BzNLSP1H9/v0W5rj40kdoiSi
 +tDD3hAFeGJrqmmf/3s5Nv5GGxbrUdYbIapvApMaRm+UbYep5KOFY8wMCE+bXMjD
 5G/o9/zh4GnwhhJhoJhDwVI2BzvGkrhQOH121dvwtYfqbIynvT6UJlQaLpY7LaH4
 xvbUcFYhCuR9Nx6/caTlS8wsncFUxyqSHgaDwkL92MrJkQS4zJIjp3ep+C0ZaXRY
 RqKkCvcCR2OqFNj7EbKD9HBcEPvTK95+bmZFEVEiydmyA0ozz1IYhpFQIKb3HOnO
 31unG/j8UL2w7uCXmeZ6A==
X-ME-Sender: <xms:yt_GY8I4LGStFK2p3M4uHpGWX_tBVBPPVpghWgrbg2sPebuXzsfRMA>
 <xme:yt_GY8KSoDhFme76PTKK1q9VyQqcBgZ4CicvGuMYxthOLzQSemRSpckWzKfcrizEb
 X-cUNPrBtUqSSSPX4I>
X-ME-Received: <xmr:yt_GY8sgcd7hvdrv6t5CHBP9PXnFZ2ytBYV5Ikc_GcCXWijCnlP7zi-qtrSZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtiedguddthecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrf
 grthhtvghrnhephfegffevudefveetgeekteeijefhhfduueejvdegvdehffehjeevtefh
 hffffeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:yt_GY5bEqOM1wYu-ksz3kQneYbsqRTDx1PRcvOdwbTyYvRYrJo0xJA>
 <xmx:yt_GYzY8BhpSD3yV1w9AqNhfjh1RzHgkhF0W59lXQTWZslF72j0O-Q>
 <xmx:yt_GY1DDboUlnk_2zfXHBAPnR9EKHCTXJxluLYC6w8nrNwuFAa8Bsg>
 <xmx:yt_GYxPSpZBRs-sah8lxzZWa6nYKY-6Co7hL_s4swV9NjlVX4HBkgw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jan 2023 12:50:00 -0500 (EST)
Date: Tue, 17 Jan 2023 09:49:55 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: patrick@stwcx.xyz, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joal@jms.id.au, hskinnemoen@google.com,
 kfting@nuvoton.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 6/6] hw/arm/aspeed: Init fby35 BMC FRUID EEPROM
Message-ID: <Y8bfw5lT1x2W+7QI@pdel-mbp>
References: <20230114170151.87833-1-peter@pjd.dev>
 <20230114170151.87833-7-peter@pjd.dev>
 <0ef1b0e3-7df0-e611-0335-bf0a24690a90@linaro.org>
 <Y8WH+aneXr/JkEXp@pdel-mbp>
 <f098f433-24e1-5f38-b479-d41ab1c51663@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f098f433-24e1-5f38-b479-d41ab1c51663@linaro.org>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=peter@pjd.dev;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BXqiYyjb1r11

On Tue, Jan 17, 2023 at 07:47:06AM +0100, Philippe Mathieu-Daudé wrote:
> On 16/1/23 18:23, Peter Delevoryas wrote:
> > On Mon, Jan 16, 2023 at 01:30:19PM +0100, Philippe Mathieu-Daudé wrote:
> > > On 14/1/23 18:01, Peter Delevoryas wrote:
> > > > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> > > > ---
> > > >    hw/arm/aspeed.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
> > > >    1 file changed, 49 insertions(+)
> > > > 
> > > > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > > > index c929c61d582a..4ac8ff11a835 100644
> > > > --- a/hw/arm/aspeed.c
> > > > +++ b/hw/arm/aspeed.c
> > > > @@ -922,6 +922,52 @@ static void bletchley_bmc_i2c_init(AspeedMachineState *bmc)
> > > >        i2c_slave_create_simple(i2c[12], TYPE_PCA9552, 0x67);
> > > >    }
> > > > +static const uint8_t fby35_bmc_fruid[] = {
> > > [...]
> > > 
> > > > +};
> > > > +
> > > >    static void fby35_i2c_init(AspeedMachineState *bmc)
> > > >    {
> > > >        AspeedSoCState *soc = &bmc->soc;
> > > > @@ -1363,6 +1409,9 @@ static void fby35_reset(MachineState *state, ShutdownCause reason)
> > > >        object_property_set_bool(OBJECT(gpio), "gpioB3", false, &error_fatal);
> > > >        object_property_set_bool(OBJECT(gpio), "gpioB4", false, &error_fatal);
> > > >        object_property_set_bool(OBJECT(gpio), "gpioB5", false, &error_fatal);
> > > > +
> > > > +    at24c_eeprom_write(aspeed_i2c_get_bus(&bmc->soc.i2c, 11),
> > > > +                       0x54, 0, fby35_bmc_fruid, sizeof(fby35_bmc_fruid));
> > > 
> > > Why transfer the prom content on the i2c bus at each reset?
> > > 
> > > In particular this looks wrong if the prom is initialized with a 'drive'
> > > block backend (using -global).
> > 
> > Yeah, it looks like this might not be the right way to model it. I'm going
> > to try Cedric's suggestions.
> 
> OK, but watch out this is a PROM, not a ROM, meaning it is legitimate
> for a guest to reprogram it, and expect the reprogrammed content after
> reset.

+1

> 
> Shouldn't we put the 'fill default content if no -drive provided' option
> in the device's realize() handler, to avoid overwriting content possibly
> updated by guest before reset?

+1, yeah I think you're right, if somebody is providing a -drive option, we
should allow that to override everything else (default zero initialization,
init ROM initialization, etc).

Because, if they're providing a -drive, they shouldn't need to provide an
initial value, they can just initialize the file with the data they want.
