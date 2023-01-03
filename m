Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp7415620ejb;
        Tue, 3 Jan 2023 07:53:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtopEaDn4iZMukA2hUtiSLaBPrxERPEVajTNQ7d/mGhy3gsvPON8y7zIK1BRpvuQ8plFGUY
X-Received: by 2002:ac8:6f19:0:b0:3a9:84bd:7cc5 with SMTP id bs25-20020ac86f19000000b003a984bd7cc5mr68196851qtb.39.1672761182516;
        Tue, 03 Jan 2023 07:53:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672761182; cv=none;
        d=google.com; s=arc-20160816;
        b=DOyxxqCylsjRMmYAOOyQ6dhGy4o3WxpHUpyV9A55LmTLZTR0hIPO+E0Q7HTjLBPnqB
         /NzrApAEGvCelYgmS2+PkpjxkxhFgdN0HqpoyEILMTuTUPWvgIawS2PStKEkRx762nkc
         tzf1alMxngcCped0522a1yyyfEhZH3bvqk9yA8XsJ5h8u4p8LBBwwzambuv4xL0tJIeW
         k4rGFtxqWzqVXhdox0P/U+L7TsaOMIRenbEHgWyHE9bswtNBeTeJCd5tpeq0XvjvVWkR
         GmVJaXYYdDFKnCMCS04BbxgRxmXRJLUPdz0OmOEPMiwti0MLkNE3k8FnvAVfmg43vR/a
         GEEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:feedback-id
         :dkim-signature:dkim-signature;
        bh=nVOvuZSG+O1P8Gww1Hjj04lHV91IU6hC66vx/Sj4D0Q=;
        b=R3t0jjXgArVWADp45qqd0LwKSfrVYfJ/dWXPCb3YsgebJh28mAjLnC5UfwZti4kncX
         A6PON8kb/bueQgH/rdxQ0U0ChGTxShr+vYPdsaRzHxdIn2aXkXGcosOLwHQ20Nxgyvtx
         pxZTlCxAPopVlyDCkY5q3Y7xJOdq2iD50BkUmd/Cu2LPR8vHfiTfhlvnyjQ5bjyD/sTF
         Uo6KAPe5ogYPAZWuNqUzNqcBCt+iMmxl1avL4DQ1hkwok6Pbh07411O/K2MdgArG7lhp
         u9PzFxiWYhYx9HqEIAp1ojlubxx+Yc8OHFHurU7XAxhDTYhVouRpgX5p7e2rGnNS0Zep
         oWIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=IvvS1EM1;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=kdsm+Q5p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r15-20020ac867cf000000b003a519d61a17si15723202qtp.9.2023.01.03.07.53.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Jan 2023 07:53:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=IvvS1EM1;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=kdsm+Q5p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pCjam-0007x1-0U; Tue, 03 Jan 2023 10:52:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pCjak-0007wO-Cl; Tue, 03 Jan 2023 10:52:42 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pCjai-0005Xz-Dh; Tue, 03 Jan 2023 10:52:42 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 0D6613200344;
 Tue,  3 Jan 2023 10:52:36 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 03 Jan 2023 10:52:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1672761156; x=
 1672847556; bh=nVOvuZSG+O1P8Gww1Hjj04lHV91IU6hC66vx/Sj4D0Q=; b=I
 vvS1EM15hteb9/owfJXy77HD7xwV68j8xzdAmkQPcB0Sfa+XpkFJrkR7PGh2grB/
 S/qF/hmNlAe9r61mJwdrjm+gYwUR4ExEVGk6JyeJAvIJLJMJixrMzhHOYIQwNCIc
 uumtvX+wC5hdfQN2pVielX8lVDzJNFc0K/XFsGmFjuzFosml5krDgMyuhCXaG5sL
 bD10hR/nUGQEYvXdsRZYISwuCHaHRazhfAfSa3Fv74kqocWECtXO5Ndu1gDimwXQ
 qrkZpRt9xjYKZv9EU2DnzFalw4LvkcNgPJGF4YrnftOQ+QseTMqIWnwK9XjZmcOi
 ZGek61nerBLlBVgnDdFLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672761156; x=
 1672847556; bh=nVOvuZSG+O1P8Gww1Hjj04lHV91IU6hC66vx/Sj4D0Q=; b=k
 dsm+Q5pI6LSvHQQnv50S1N0McptkvjwHHjvzAf0aJSP1+xDpXWlEYNTca2mZEmB+
 c3z2oOgBLHa5DDKAax8JnXKFnh9FVG8wOuTZzquyqc9WxtvS0WLsmQLkQJ3EJJWX
 HHhj7KwrA05Tu26Q+pgq1FM1j1oc0MJKaGqCxrNfJmhbQFIIuTg60d3bTgZIEmeH
 SuNSLPi82Y4eod4hpexwGVEF/2JBHshYdQgHf6NPewW5BdeF1AVMP/RXZ3ZM1A9W
 ZSblo49yvlX5npN7vSpaBY74cX+Paxo7cvRWdAr0WfeMJLhCrcIH6F3xnHmQmxl9
 6nib601Fh06K9P8eM1cZw==
X-ME-Sender: <xms:RE-0YxEqBqQ_mw620KPla1CpiROUdd1M8SCjwsEYAqBTpwUyGWrErA>
 <xme:RE-0Y2VLDS4GHq4NsaXZXtxm7bdtmAKsuyq773JQEL-XMd1GHFqHsSAX1BpIL4Hnp
 b_7NZc1Khq5EkpPeZA>
X-ME-Received: <xmr:RE-0YzIw4pvRdLvrybTGq2hmweyYrc4LyrjHIjrvPeC8xF1HSV1ySisPEqIhcJ2o5eKs1YBiQx-cQgUQxfsDsw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeeggdekudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomheprfgvthgv
 rhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrfgrth
 htvghrnhephfegffevudefveetgeekteeijefhhfduueejvdegvdehffehjeevtefhhfff
 feeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepph
 gvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:RE-0Y3HdlqXoVF4RrTUhKn3iepULx5kQ6lghg2GH6UyfLNWGQlM1Tw>
 <xmx:RE-0Y3WTn2oG-llhDgATWIRN97_J3IgmMGIdwScqFo_QfT37LV-AFQ>
 <xmx:RE-0YyODL6sREf-cMCRCwoWTRa6Zsukhp-BOncGB7PdERjJC3JzKSg>
 <xmx:RE-0YwVgKrNf-5aA83bYK-QsJJfomL8oEUGk3s1w1ZV_RyzO37xlYw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Jan 2023 10:52:33 -0500 (EST)
Date: Tue, 3 Jan 2023 07:52:32 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: "Dong, Eddie" <eddie.dong@intel.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Delevoryas <pdel@fb.com>, Peter Delevoryas <pdel@meta.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH v2 02/11] hw/watchdog/wdt_aspeed: Extend MMIO range to
 cover more registers
Message-ID: <Y7RPQE15gcR1sFDb@pdel-mbp.dhcp.thefacebook.com>
References: <20221230113504.37032-1-philmd@linaro.org>
 <20221230113504.37032-3-philmd@linaro.org>
 <BL0PR11MB30427F00C5A2058197E9B6488AF19@BL0PR11MB3042.namprd11.prod.outlook.com>
 <19cb9a03-c98e-cdff-1474-2db0c55ae971@kaod.org>
 <Y7RKWym8vuDKvUIr@pdel-mbp.dhcp.thefacebook.com>
 <96ac1ff1-7876-655a-d92e-9ec8870137a1@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96ac1ff1-7876-655a-d92e-9ec8870137a1@kaod.org>
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
X-TUID: G/8PORkRn1sC

On Tue, Jan 03, 2023 at 04:48:14PM +0100, Cédric Le Goater wrote:
> On 1/3/23 16:31, Peter Delevoryas wrote:
> > On Mon, Jan 02, 2023 at 02:31:31PM +0100, Cédric Le Goater wrote:
> > > On 12/31/22 23:52, Dong, Eddie wrote:
> > > > > When booting the Zephyr demo in [1] we get:
> > > > > 
> > > > >     aspeed.io: unimplemented device write (size 4, offset 0x185128, value
> > > > > 0x030f1ff1) <--
> > > > >     aspeed.io: unimplemented device write (size 4, offset 0x18512c, value
> > > > > 0x03fffff1)
> > > > > 
> > > > > This corresponds to this Zephyr code [2]:
> > > > > 
> > > > >     static int aspeed_wdt_init(const struct device *dev)
> > > > >     {
> > > > >       const struct aspeed_wdt_config *config = dev->config;
> > > > >       struct aspeed_wdt_data *const data = dev->data;
> > > > >       uint32_t reg_val;
> > > > > 
> > > > >       /* disable WDT by default */
> > > > >       reg_val = sys_read32(config->ctrl_base + WDT_CTRL_REG);
> > > > >       reg_val &= ~WDT_CTRL_ENABLE;
> > > > >       sys_write32(reg_val, config->ctrl_base + WDT_CTRL_REG);
> > > > > 
> > > > >       sys_write32(data->rst_mask1,
> > > > >                   config->ctrl_base + WDT_SW_RESET_MASK1_REG);   <------
> > > > >       sys_write32(data->rst_mask2,
> > > > >                   config->ctrl_base + WDT_SW_RESET_MASK2_REG);
> > > > > 
> > > > >       return 0;
> > > > >     }
> > > > > 
> > > > > The register definitions are [3]:
> > > > > 
> > > > >     #define WDT_RELOAD_VAL_REG          0x0004
> > > > >     #define WDT_RESTART_REG             0x0008
> > > > >     #define WDT_CTRL_REG                0x000C
> > > > >     #define WDT_TIMEOUT_STATUS_REG      0x0010
> > > > >     #define WDT_TIMEOUT_STATUS_CLR_REG  0x0014
> > > > >     #define WDT_RESET_MASK1_REG         0x001C
> > > > >     #define WDT_RESET_MASK2_REG         0x0020
> > > > >     #define WDT_SW_RESET_MASK1_REG      0x0028   <------
> > > > >     #define WDT_SW_RESET_MASK2_REG      0x002C
> > > > >     #define WDT_SW_RESET_CTRL_REG       0x0024
> > > > > 
> > > > > Currently QEMU only cover a MMIO region of size 0x20:
> > > > > 
> > > > >     #define ASPEED_WDT_REGS_MAX        (0x20 / 4)
> > > > > 
> > > > > Change to map the whole 'iosize' which might be bigger, covering the other
> > > > 
> > > > The root cause is that ASPEED_WDT_REGS_MAX is too small, right?
> > > > Probably the Qemu is emulating an old version of the hardware.
> > > > 
> > > > Given the meaning of ASPEED_WDT_REGS_MAX, it should be larger than iosize, not?
> > > > Probably ASPEED_WDT_REGS_MAX should be per device type (aspeed_2400/2500),
> > > 
> > > yes. We would need a new class attribute for it. Please use these values, they
> > > should be correct.
> > > 
> > >             #regs    iosize
> > > 
> > > AST2400   0x18/4      0x20
> > > AST2500   0x20/4      0x20
> > 
> > I think only one additional register was added in the AST2500, bringing it to 0x1C.
> 
> yes.
> 
> > 
> > > AST2600   0x30/4      0x40
> > > AST1030   0x4C/4      0x80
> > 
> > I know the Zephyr driver for the AST1030 directly from Aspeed is claiming that
> > the iosize is 0x80, but the datasheet I have says it's only 0x40. And, that the
> > #regs would still just be 0x30/4. Afaik the AST2600 and AST1030 should have the
> > exact same peripheral.
> 
> Hmm, I see 5 extra registers in the AST1030 SoC compared to the AST2600 SoC. All
> related to write protection.

Oh really? Hmmm ok, perhaps my datasheet is outdated then, I'm referencing
AST1030 A0 v0.5 from Feb 2021, which might be outdated.

Thanks, sorry for the confusion. Erg.
Peter

> 
> C.
> 
