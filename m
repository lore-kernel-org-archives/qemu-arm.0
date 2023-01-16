Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1595793ejc;
        Mon, 16 Jan 2023 09:21:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvE2Q0ZqIlCNALawyT8kZnZzD84Zi4FLI5OrBfbL+XhKqsqtonDDkYZbzpjSMXorfW+2LUX
X-Received: by 2002:a05:6214:3993:b0:535:1825:2bf7 with SMTP id ny19-20020a056214399300b0053518252bf7mr738614qvb.29.1673889710189;
        Mon, 16 Jan 2023 09:21:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673889710; cv=none;
        d=google.com; s=arc-20160816;
        b=dCvVxQbJdOHWBKQbOh63GGsSXsuiexfbOfPqvgZRBBbyo8F2Ooj0EFHn2MZIp5WHLp
         oAly+6bsWF1SYTxppKdrXRO0qxr0xYJm4t5+dbRjbVurR0pXgdFaK+RxQbcJkIJf3sl9
         ANN0RkBW1wNFfoS1LtGyKCAlBLCIuJaxk9yk/nWv3f8mvynZ9bWA5oAoqucWp/LOCUIx
         9gRZSDNnhluAwg1FsUOjUPAZq3Lj2KgpSIjdWjBBq61YESOM+xB4mlPWKAcWmNRGMA0p
         fFogIHSCGyWwvE9wB/O8MB9NHKdMnaWQO6Kcv+ch2FLsUzu3LFDNrs4HpNTYoYzaaL5X
         Si5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:feedback-id
         :dkim-signature:dkim-signature;
        bh=ecJc+iVBb7iX0G6Zw8YcUv+SEVFBIVOm65XrOMmeBQw=;
        b=wtmgrH+407/aag/rrpzuI8cBknmc+O9XNqaMwWEnJGjLq+ew2ewnDZdbn0P59ca4Gb
         KJffDA72sAkQlf8YlF1voVcNrNJl63mU2i5cx3drJ8XDWr634+rKSPKYWhNdZODvJvC5
         tjlUBb9A19eMXdvJfGk/LtIkmueUY8CrH/uwmVveNNdsttAPP2TedhmP8upNEqKj3yku
         4ZrhFd0mtE7qcYqUdkzn2hj8Ea2i8NL0Nu16I6GqgQzWKWm2VHJI2IotLMgmpjXvpJqo
         9xP9wqFMiGIc702l1rbkK5omFN6AHh0brdSZSVWrISib/nu1AleV17Bss0IO7XArqy9O
         qjpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=NfLHioa2;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=XlUXZxKV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ed7-20020ad44ea7000000b005346f90a29esi7596940qvb.562.2023.01.16.09.21.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jan 2023 09:21:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=NfLHioa2;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=XlUXZxKV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHTAo-0006qm-74; Mon, 16 Jan 2023 12:21:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHTAm-0006qX-O5; Mon, 16 Jan 2023 12:21:28 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHTAl-0002nC-C6; Mon, 16 Jan 2023 12:21:28 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 23E3F320090F;
 Mon, 16 Jan 2023 12:21:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 16 Jan 2023 12:21:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1673889684; x=
 1673976084; bh=ecJc+iVBb7iX0G6Zw8YcUv+SEVFBIVOm65XrOMmeBQw=; b=N
 fLHioa2ijG7DWZxSYIPHtWoTwass0bkpjysF4/TIxR73eyWYmlTn6r7bFjqS92C1
 6cpbO2yEpft/jk7jcEocqQqHAQLdc6qO67dPuQ5xxR5maP6JD5TsbLIXxLSaRumw
 6BbcDgAAHTOnErcFN4WlSUHnPmWYQwtRmH4jJBsEkM9wkWduBtbTdZ4L4o6CeGTn
 Zq/dOZOhEjoSX3yeITiK4jy3FBQAw4iW1nrPKW9G3QrrPzaa744AAFO5iMxh3Ncl
 8cJDb9STu2qpJgwFlagEAGl5sLyKYfprqFplm8P/uofleuAC1rkzIrKCmbLLh85L
 qaDufPjGqIh64KqPjI3KQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673889684; x=
 1673976084; bh=ecJc+iVBb7iX0G6Zw8YcUv+SEVFBIVOm65XrOMmeBQw=; b=X
 lUXZxKVqsa+mNk1z9R5BZCmileSo/X+TZGuxXbwaL0K4L70iSleHfMAru/VOre6k
 5ZY4k1FAURfWy1CST2i/o8N5O3eGuvZIYhe1gwwNrxkqOakY0mk1VBKt7LHnW5QT
 B2lFqUg8hFQprwMrSGZ3tfns/P/2dt7Vn7cPs2q/bY0ZvhalV5YiUt58QJXYMwJk
 Ntq2nPOocAlV+uBHhx/ey9O3jG3hrEhimU0kARxgSnDPdJoM/Mqv4haj2RoEFtpr
 DoHj9U/vwmK0VvolouM3m6H3KZe1cXd086EqgsI8wETKaujXK2Zzf0VLvpLnTfx1
 773IsJZWpk86XoHnhbjGA==
X-ME-Sender: <xms:lIfFYyHyYCrU2Jb5c79R_BruzSLR5CD78ayFOomO76IDW1MYljQ5lA>
 <xme:lIfFYzXaMkFBXanvNDHMLGVptFobMX-u0OTzfxNS3ufnhQs_QDToKTVDSJZdCNQKL
 rLCmUPWf6i-Kz2JN-c>
X-ME-Received: <xmr:lIfFY8Le7og_VFE6lqTxaNdYA0XXA9KufO4N5Wn6MIGJQuvw7B7KYllxzXY5VchpCRCFXCfz8MCNLSPNwIoC3QuDyw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtgedguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrf
 grthhtvghrnhephfegffevudefveetgeekteeijefhhfduueejvdegvdehffehjeevtefh
 hffffeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:lIfFY8GQksWbQBdT-_Q8Y1CYLBPVg11j43T6pJraRn0_y-ZmQd5uJQ>
 <xmx:lIfFY4XMpNl0H9owCpFJ484B4aA0H56o2k-uHOenpyUL8sOS39zgMQ>
 <xmx:lIfFY_MubRzXIwmBa2huga5qzMlZx5y4dniPe32DHsiqZBkZ-YFM8g>
 <xmx:lIfFY8r7-olcNPaoY57m5YHhRMx6MQF2sGSDV794Q_s2te111Utf0g>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Jan 2023 12:21:23 -0500 (EST)
Date: Mon, 16 Jan 2023 09:21:21 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: patrick@stwcx.xyz, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joal@jms.id.au, hskinnemoen@google.com,
 kfting@nuvoton.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/6] hw/nvram/eeprom_at24c: Add header w/ init helper
Message-ID: <Y8WHkdAukdM/YK3F@pdel-mbp>
References: <20230114170151.87833-1-peter@pjd.dev>
 <20230114170151.87833-2-peter@pjd.dev>
 <c8e17594-9eb5-ce6c-c414-622f4f68d008@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8e17594-9eb5-ce6c-c414-622f4f68d008@linaro.org>
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
X-TUID: cn8AXoDtZtx/

On Mon, Jan 16, 2023 at 01:23:01PM +0100, Philippe Mathieu-Daudé wrote:
> On 14/1/23 18:01, Peter Delevoryas wrote:
> > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> > ---
> >   hw/nvram/eeprom_at24c.c         | 10 ++++++++++
> >   include/hw/nvram/eeprom_at24c.h | 10 ++++++++++
> >   2 files changed, 20 insertions(+)
> >   create mode 100644 include/hw/nvram/eeprom_at24c.h
> 
> > +void at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size)
> > +{
> > +    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", address);
> 
> Please use the type definition: TYPE_AT24C_EE.
> 
> > +    DeviceState *dev = DEVICE(i2c_dev);
> > +
> > +    qdev_prop_set_uint32(dev, "rom-size", rom_size);
> > +    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
> 
> Although the allocated object is somehow reachable from the i2c bus
> object, it would be simpler to deallocate allowing the parent to keep
> a reference to it. So consider this prototype instead:
> 
>   I2CSlave *at24c_eeprom_create(I2CBus *bus, uint8_t address,
>                                 uint32_t rom_size);
> 

Oh ok, yeah that sounds good. In this case, if I let the parent keep a
reference, maybe I shouldn't use i2c_slave_realize_and_unref, and just use
qdev_realize/etc (to avoid the unref?). I'll try just returning the pointer
from the function to start with though.

> > +}
