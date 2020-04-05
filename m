Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2635730lfi;
        Sun, 5 Apr 2020 00:01:17 -0700 (PDT)
X-Google-Smtp-Source: APiQypJdGzTPV5da2I2InF7SGd2DyxOX449cs8eAY3Dzq/yEcXLYlQcqM1IGw0WXZwocsbZLvJN4
X-Received: by 2002:ac8:7769:: with SMTP id h9mr15838290qtu.234.1586070077467;
        Sun, 05 Apr 2020 00:01:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586070077; cv=none;
        d=google.com; s=arc-20160816;
        b=GTpg7oZBUMCgok2uSoKlRWUatfmOYWrzo1LGadKtiV+V8kcZtzOUKS+XvX2E7GNauw
         pVsAUtGM6ozHSbQ46p2blx9LcKu93jlAy0KcdUO88/Fxl/aBC+8ufw75vZoKYdUj4CPl
         HY4MwRXC8C6n1r2Qze9fY2OGuxNZTW8CUTY/U2D9g0I7SVMaS/5Ra3l+M5Gu7OhRMX9Z
         TdBZkaMD0dQsJ9wPOy0rjvclIoycrc1S28Lifa6tbAENzRfqKReEOHye5lx0tLa36rnP
         CqFg74IueuI3RL7sesyolsQABQzUPk/aL7jFdt8jCUJ9Yjdpf4ilORi9+pjzoXCVbmMU
         gFqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:from:date:references
         :in-reply-to:message-id:mime-version:user-agent:dkim-signature
         :dkim-signature;
        bh=6o54JLuDUZrJXC+5y05bmXhlK98pnAz3JDhw7aClEng=;
        b=hgChWvnuIIIBUV5No5VPZlz4DWnoypJDDTAOAb1EM+hqYriXQLj2CgmIg4R2yYrOr9
         TMGWjBkyiGKc/uTzErg2fK8VUM4ui5mPh5hWGxE4bnHvkuLo2VNdzsDKiVRMiSlM1om1
         7WN3sqgPLGvpcpeif//leJUitVca8FHieyMnPNApVmbTrzclgM/X18DX6wKYqEhBAKEF
         csYrAF2dDwNOpPYvf1UqdTt1j073N4n3Q/zSTJIal88YE0kIORUF1VBQHNAuVx7XTgIa
         KUPZb5uvY77iAIqc6jjWi9283QB2nvM6q+NZwy8MMfbafX3HGMzf9FR79rifqGQEFt9N
         767Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm2 header.b=u7auybRu;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=0BdjAwQB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7si8998863qkj.195.2020.04.05.00.01.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Apr 2020 00:01:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm2 header.b=u7auybRu;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=0BdjAwQB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jKzHQ-0003Vy-Tv
	for alex.bennee@linaro.org; Sun, 05 Apr 2020 03:01:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51676)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrew@aj.id.au>) id 1jKzH3-0003UO-IW
 for qemu-arm@nongnu.org; Sun, 05 Apr 2020 03:00:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@aj.id.au>) id 1jKzH2-0003M3-KA
 for qemu-arm@nongnu.org; Sun, 05 Apr 2020 03:00:53 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:39055)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrew@aj.id.au>)
 id 1jKzH2-0003Kb-9Q; Sun, 05 Apr 2020 03:00:52 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id D17055C0196;
 Sun,  5 Apr 2020 03:00:48 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 05 Apr 2020 03:00:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=6o54JLuDUZrJXC+5y05bmXhlK98pnAz
 3JDhw7aClEng=; b=u7auybRuhkN+8M/Yyfv6liTTSP3pB1s00mkhTjRUESmO9lX
 rAWag8xvet3XrkNLm67sLWNezudQj+pHVvBqk/DT8RgqUXgLGFT0i17FmDCbCIKr
 rhWnRDHMRdEKw8IMmRlMsxQugxCYG4bATfqEwkwPd9Sd4i0vxZQmaOwl/tvXWq7V
 AkX2/xq5NGWSNDyL43CIvJnMwpdEPzXzkhqx7gNq5ygUE6ebM8qzCvqlWNnX76Iz
 Nh4YZFW4KyIiF8TzPMlWfEg6tnwIOYKhElBNt8E57PBwThOk6pMj+wlrAnbyP+LM
 omBPDZmOujz+/DPT+Iz/AcypWAmuZCZsUC+qdgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=6o54JL
 uDUZrJXC+5y05bmXhlK98pnAz3JDhw7aClEng=; b=0BdjAwQBy5CCPygmfAF9RG
 unfmivmTXIv9o6vtAsHOKMHo/lVLSOpgbNdZYCeZOSXRp+kjttCNd/Ts4szQa+7B
 mG8lU1S21ORKfV+FdeF4rS2+3b5tXqemJpCreW9vixE3zmFuuZIXB9jKTS6jri1x
 Ou8TpykeGctaweyV2fNik1K+3+aVwNV+/Rm0ehPu3zaHC/HydGRCPoBU6AveZ6Jc
 NLiUVRsrn/b1JcC2opUdxilXC5SoGUwq1iz7ueLRA2zmVVcankcfhGFPFdLMeP3K
 QFbLeutWO5DIkLM1oBn6YOnJMpxeyMl3U8FrsL0F3rGGW8yEVvMNDxHHDQMWy+mA
 ==
X-ME-Sender: <xms:IIKJXpgu5189PM6vjk3lm1cKefeMiRfgXbF4ODTvB3PtNYQTqVItQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddtgddulecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:IIKJXo1Rzu_1Jy8cdK4RnfGyCrJGK3CR-HCBd00p72_cW62z4Qy_LQ>
 <xmx:IIKJXussm32WHz8zHlLyZN24HWfQhqQyGApvxsUzAOqJeUULfOZbKA>
 <xmx:IIKJXjDZuLeBqav7fV6uBxVP48cJzCHFqS01t8E0EJJVAivFAk3lTw>
 <xmx:IIKJXoBpLyn1bcUTpzVvmnXAEW07gguoH85NmfQufZR0dMjKa1Ldfg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id DA2F5E00B1; Sun,  5 Apr 2020 03:00:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1082-g13d7805-fmstable-20200403v1
Mime-Version: 1.0
Message-Id: <58494574-c378-4de9-85e1-4000a96ea53c@www.fastmail.com>
In-Reply-To: <20200403124712.24826-1-peter.maydell@linaro.org>
References: <20200403124712.24826-1-peter.maydell@linaro.org>
Date: Sun, 05 Apr 2020 16:31:08 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Peter Maydell" <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 "Cameron Esfahani via" <qemu-devel@nongnu.org>
Subject: =?UTF-8?Q?Re:_[PATCH_for-5.0]_hw/gpio/aspeed=5Fgpio.c:_Don't_directly_in?=
 =?UTF-8?Q?clude_assert.h?=
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 66.111.4.26
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rMwxn8QDOEjo



On Fri, 3 Apr 2020, at 23:17, Peter Maydell wrote:
> Remove a direct include of assert.h -- this is already
> provided by qemu/osdep.h, and it breaks our rule that the
> first include must always be osdep.h.
> 
> In particular we must get the assert() macro via osdep.h
> to avoid compile failures on mingw (see the comment in
> osdep.h where we redefine assert() for that platform).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
