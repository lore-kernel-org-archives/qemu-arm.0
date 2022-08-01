Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp2224338lfg;
        Sun, 31 Jul 2022 19:19:49 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5YW3RApgjdXETYBS+TXce4PeVgotJBLlaJUHgm2XbUvIYPdjhmaFNq+I/hLut0U7y4cn5n
X-Received: by 2002:a05:6214:2307:b0:46e:5fbc:3c30 with SMTP id gc7-20020a056214230700b0046e5fbc3c30mr12073433qvb.21.1659320388946;
        Sun, 31 Jul 2022 19:19:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659320388; cv=none;
        d=google.com; s=arc-20160816;
        b=MLrJozgxZW/h9ZQRsyC0+HnAKbYcMsFj5SwLAt42rTklDPttmATzlsuYkjd7iFSdza
         9lKoepkvGa3D8IGgsMLyzdEqsD9CgPFgNFZs5vHk6gk7vc8LnthKBU2NOP6p1J9TeN8E
         v+zEwTul7RgMqdlYBwsoN9GWXjqgfa0G/ywzVuSjOLjVwV/QZZf0W36ALc+GXiICIxvP
         zKIbVPxpgTWIJJ9hyEAUEl5NY7xbHsapBm9uviOMq2qFH3xCYr8lew8kpRNFPPTnYiAQ
         4nRw8hTfzNTMPcCrJv3wmgcR2Jgyo/Tfkp9CNp5ejMeiF/WUJPZgxnMZbnh6E46Hw9YM
         mLzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :subject:cc:to:from:date:references:in-reply-to:message-id
         :mime-version:user-agent:feedback-id:dkim-signature:dkim-signature;
        bh=94SQCVOv87NvBj4h4hrsvcG17dfnbrIG600jYpAufZQ=;
        b=aWv61QS5CW4GJbQVRGcwkfyTqaX+ttg/Lnw0OCDBl4lV4qqmCIM+nykjgOqD9gdN+M
         5clRqH4HmXrkv/0ev+1L2rUbqLb6NDDXHAxgUG+D7KhOgoHvz8JVTEJcnwpiLCIEJSwa
         HiAcBicJaxZhh/E+BNbmrR3MhVJrPnY98lJogzTeRujI91YjMgNdyM1FPk5fXalkYUrU
         roqI+iVxIJyWok9f05U8J0ffLbOcXhkK9ENbIiumotfMGUwouUwEXcG0/Fu6wg3Rc5s9
         dKeos6fjE0GiYzaYSy4dsdoqLiCBFehe7QaBzJtjhorX9MyA5tqAjG1xmprNxja33CAf
         WLgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm2 header.b=kkCTaXXp;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=t8RAwpts;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kk2-20020a056214508200b004730bcbaef4si2246375qvb.588.2022.07.31.19.19.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 Jul 2022 19:19:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm2 header.b=kkCTaXXp;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=t8RAwpts;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oIL24-0001ek-FY
	for alex.bennee@linaro.org; Sun, 31 Jul 2022 22:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1oIL1s-0001eE-AR; Sun, 31 Jul 2022 22:19:36 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:51237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1oIL1q-0006ZG-MC; Sun, 31 Jul 2022 22:19:36 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 6DCA45C00FD;
 Sun, 31 Jul 2022 22:19:31 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
 by compute3.internal (MEProxy); Sun, 31 Jul 2022 22:19:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659320371; x=
 1659406771; bh=94SQCVOv87NvBj4h4hrsvcG17dfnbrIG600jYpAufZQ=; b=k
 kCTaXXpyvSzZexgPkyOMcgYCybhkTkiIvE+hIDqw98lk+WCTx1kCMImnbF7I54jo
 qTntR16RTBHnb/GBjy9oM9X+MU9b4o1cLcINa1kSplj4VdKXc4hwrmRLz1OZgeAN
 c707eOgtfBYSnIzSh+uaR07pCGKu0Nh/8B/DFWQCkULXJ+OZw+KH8CHyWJ7FAmC2
 6PL9V7LbPMIB9OsVGZT+h6zdDAulCOmvjp4QXbBGbcz1ZDi685QIiOVFIrx3GSUv
 hi2lBTdNEYJHUr7/Er+k54X4ZnmCx7NPY/Uet4htMWEfkCbtmmgAcISny6vHiAAz
 mfokU7yYt3WlQIBYOvs7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659320371; x=
 1659406771; bh=94SQCVOv87NvBj4h4hrsvcG17dfnbrIG600jYpAufZQ=; b=t
 8RAwptsQ4vQ2hWvpJS59q60CxIZ5SounhOL8LNcL+LLl/rzEzpDkKzqR5KpjHNht
 RI7YByY6yTd/rPQLZqA+NWV5v7XIQ4c+s5v7yfU3LX/I4qySrDjfPt+M3FoPSA4D
 eC1vqZKjTFVNCchf9UhkurtALQpwNcEOUtbxXgf9OZ2raaVXVCwc1lSAotR3IOhl
 3j5a2GDTJ3V5VjdMGZXy8tckqtaXJLx8Di4Sfuj46ZPiIOS1eENLE5MQWraNeigV
 1JypHPpHA9i7U17qb5ju8teK3MPQZ8cS2VCy2izWRhTu6jmh+7YM7o57waWLVP8Y
 uu9RqSMo5Vw41wN8e0M9g==
X-ME-Sender: <xms:MjjnYkJZv4SE-jX-vmlhGX1uXTuXyKPbYC_em-UC-Z7OUe6zQDKfvg>
 <xme:MjjnYkJpeDy4QPyah0gXnC177jY-qGZVdu5ntZAYWWw0x3uGzhcwzIfvwuYY-FE35
 8Y3GJ3ctA_W3Tc3lw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvvddggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
 nhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecugg
 ftrfgrthhtvghrnhepgfeiieettdelkeehffevieetgeejgeffveefhfffkedvudefuddv
 veejgeehheevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:MjjnYkt1Dirl1hZGUTKmmV78788wnCkimbAugRiwISQqlTzyELMElg>
 <xmx:MjjnYha_kFXknFYr5XYSY7OJZx38TqxJeGthr40-ZA9XgfCuCiqksQ>
 <xmx:MjjnYrbk2vLBTMvsDxzXu3ZwK6Yp-ZGEEdbPR2buBVnH8uQ5MiM6bA>
 <xmx:MzjnYhy4AE2bf1J-iXNYor0dwAXj1uaitvtbL3f5BBjTRmIMpb_f_g>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B67AA170007E; Sun, 31 Jul 2022 22:19:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-758-ge0d20a54e1-fm-20220729.001-ge0d20a54
Mime-Version: 1.0
Message-Id: <55427f60-0e51-4219-a753-d30d617fc35d@www.fastmail.com>
In-Reply-To: <6d4a3912-a386-a784-8db4-7743bb1f1063@kaod.org>
References: <20220728232322.2921703-1-irischenlj@fb.com>
 <435b3e89-f9fd-c257-b03d-a12d4b59ac6b@kaod.org>
 <YuQZP4xkkU2R9VmO@pdel-mbp.dhcp.thefacebook.com>
 <6d4a3912-a386-a784-8db4-7743bb1f1063@kaod.org>
Date: Mon, 01 Aug 2022 11:49:09 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Peter Delevoryas" <peter@pjd.dev>
Cc: "Iris Chen" <irischenlj@fb.com>, "Peter Delevoryas" <pdel@fb.com>,
 "Cameron Esfahani via" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9_via?= <qemu-arm@nongnu.org>,
 "Patrick Williams" <patrick@stwcx.xyz>,
 "Alistair Francis" <alistair@alistair23.me>, "Kevin Wolf" <kwolf@redhat.com>, 
 hreitz@redhat.com, "Peter Maydell" <peter.maydell@linaro.org>,
 "Joel Stanley" <joel@jms.id.au>, "Thomas Huth" <thuth@redhat.com>,
 "Laurent Vivier" <lvivier@redhat.com>, "Paolo Bonzini" <pbonzini@redhat.com>, 
 qemu-block@nongnu.org, dz4list@gmail.com
Subject: Re: [RFC 0/3] Add Generic SPI GPIO model
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.25; envelope-from=andrew@aj.id.au;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: r2aNlxatqmes



On Sun, 31 Jul 2022, at 06:48, C=C3=A9dric Le Goater wrote:
> On 7/29/22 19:30, Peter Delevoryas wrote:
>> Certainly we'd like to use IRQ's instead, but she ran into correctness
>> problems. Maybe we can investigate that further and fix it.

Yes, let's not work around problems that we have the ability to fix.

>
> So much is happening in that mode.

Yes, though while there's no-doubt accidental complexity in terms of=20
its implementation, the underlying hardware is also quite haphazard and=20
we need an approach that scales to the large number of GPIOs it=20
provides. So I'd argue there's a bunch of essential complexity involved=20
as well.

Do we start with a fresh implementation that allows us to get the=20
expected behaviour and then build that out to replace the current=20
implementation?

Or, can we add more tests for the existing model to pin down where the=20
bugs are?

> We need more trace events in the Aspeed
> GPIO model at least an extra in aspeed_gpio_update()

We can always fall back to this but my hope is we can get better test=20
coverage to iron out the bugs. Maybe that gets us a more refined and=20
maintainable model implementation along the way.

Cheers,

Andrew
