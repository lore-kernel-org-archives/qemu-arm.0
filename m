Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp814808wrp;
        Wed, 11 Sep 2019 05:44:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx/PUDATbWx3g06HKu1QofbKmyArgsL++wyMGoSpYBjPLKXAzqqeBMutEe4BSTmM8zOl47V
X-Received: by 2002:aed:3168:: with SMTP id 95mr35020770qtg.262.1568205848758;
        Wed, 11 Sep 2019 05:44:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568205848; cv=none;
        d=google.com; s=arc-20160816;
        b=IkTihCQl6/FJgmM/Q4VPh1VpxkRYDxDJvwTJq6L/JQYyr1a5ELUNitTQ06XzB2Whqt
         mLkbBtufI136arqcLA7U11+7vnI2eH1SdlOO/OLq4KSb6FnS1hnXpuABK/F0xXljrTBI
         EZRN/abwFlOulIR+xJmFj+Mqs8YVDO7KBw2I5IgeYN5zUadapRkQQLNVTCdPXAN1QuMd
         pxt77Mz3SCDiy5nZdD9S/p4KNtmHS9cN3U7aRZgWVIfEC1PS7hwn5eGW3tjKrtFXdaZ5
         idN3UPAKGQ8VCzflz7k7ygPXUMUZRzbk5MIvjq/4x1T0xEYsE1D734IDfvQCVG8VaqAE
         sR5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:from:date:references
         :in-reply-to:message-id:mime-version:user-agent:dkim-signature
         :dkim-signature;
        bh=brIFlPy8Qp7zupq+ZvUdWHnnTaM1npvVAdYKI+B+rjs=;
        b=vxzsvdUtWNQkSYzETqrV/P0WUc6vVWM2YUH5XOHVZ5+l1x2eI4ZPt5PgD77UBmK4QR
         Xc8Yp4zNbfq0Pckvlu08EkCs+Pb7kSuak1SLTWWSQOI7j1ZPYN8qQdySPen6jKeR2FQR
         uDmB6tz+mFiAHoLPrkfNuo+yb6a5/rK1ZU5ul5HUPrSShpDRNbh2dXzY4EWX9gYkpZHf
         38h5iq/jiyMSkzQVAKG1EIOwg6uBs/kR4OhhnlbQz19KextKcyU0TRYjbaHSChN8Dw9H
         wsPhSxYVJZoOr9xppTwxPIS0+gxhYRHiNcghc8XEFXQCmUqrjRLAfSt1nMfU4tYg1/ht
         C8lQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=TYQCeck3;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=md5fT95g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k49si16512266qvh.140.2019.09.11.05.44.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2019 05:44:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=TYQCeck3;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=md5fT95g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i81yi-0002kx-5T
	for alex.bennee@linaro.org; Wed, 11 Sep 2019 08:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51579)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrew@aj.id.au>) id 1i81yP-0002kp-WE
 for qemu-arm@nongnu.org; Wed, 11 Sep 2019 08:43:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@aj.id.au>) id 1i81yO-0005uu-RD
 for qemu-arm@nongnu.org; Wed, 11 Sep 2019 08:43:49 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:45741)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrew@aj.id.au>)
 id 1i81yO-0005uL-Hs; Wed, 11 Sep 2019 08:43:48 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 15D3F2243F;
 Wed, 11 Sep 2019 08:43:47 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 11 Sep 2019 08:43:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=brIFlPy8Qp7zupq+ZvUdWHnnTaM1npv
 VAdYKI+B+rjs=; b=TYQCeck3GjIQTA2inbVFb90nQwqvySl7p4Pn/C0MB+iiBB/
 pYYDadEXBStHFIBmrQSVw8910P6bekpi50Kfmpqfgoe7JzEM8/27gHTnwL/K30rm
 Z8e6YLet2vC8jFw4JAWdpUWaBp4UoUO2fn9iyuEIdZqKa3kf9JkEnpVMcF3VpY1t
 rZEQ47x6eG6+PqmbLRL2zsvg6I5FrqW13jcp0NF7ipC4YS0mq+o8K2IfsUE1oML6
 pNm9N2vxOry8QpQWDhQ17kuWiwQrikhDPTan01SFZh1qgMIf9IFFpAIiRIi0s/Im
 AB1HdNYS+1iwOtmeV8qTV7JCK4V2j6Xj26Pysdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=brIFlP
 y8Qp7zupq+ZvUdWHnnTaM1npvVAdYKI+B+rjs=; b=md5fT95g+Qemstr2PKw8kF
 BrFEInsj58xijO7iQ6KgEiPZGt/0bI7SRAx9urW1xKKzVgEcZvQMgPKK9FJ1yPww
 9FDHkTn0LcfsS6YSLv2B67z4a1gCCF5pPitfOPD7YKMLfOFq/ba23QzPNhL+hrrZ
 cIY+eBbrZZa67UTwUW2Mcp04NLGOggRg/2VfvF3LVKqLN42rI/Mc3C3KGdUDmjJL
 FpKr8/8jsXNyJ3gwTlM+Q3rTUel6l26fz+99U67lHuChKLqismV5bi6ur2vVlxIb
 Z1ZcipaHiysN2EGxIWiirwjgCFEjZ+cOwiXAlIV/mgxzPulgzV0f3hh+6Gn9Il0A
 ==
X-ME-Sender: <xms:Aux4XfAqKf-_Dn2qhdFJRUxOl8fSe1XTxn0HQTWddF0YSXSOo0luyg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrtdefgddvlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffohhmrg
 hinhepphgrthgthhgvfidrohhrghenucfrrghrrghmpehmrghilhhfrhhomheprghnughr
 vgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:Aux4XQT5hq7gnu3_UC5hc__ymvlqpZXCqeFLUXSMsg48j5-nAH3yUg>
 <xmx:Aux4XZduhKcNt1OpARlfr38Hr6A5U6cpK-W3R4eHEdnJoKuU-jUpAQ>
 <xmx:Aux4XYgZO9BdNM2UCpbV1BB_ExH0rXSWi63T1q7X-2q73XjDPjwvuA>
 <xmx:A-x4XfkZkmU7Z6eFGrxtBMI55bWkWKfMt3S9BhfgoeCBDtbPZStVjg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E8A26E00B1; Wed, 11 Sep 2019 08:43:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-227-g18586b54-fmstable-20190911v1
Mime-Version: 1.0
Message-Id: <fa83efd1-9085-4ba2-b60a-f5d8f6f39162@www.fastmail.com>
In-Reply-To: <156818224605.15929.1567552683650395230@5dec9699b7de>
References: <156818224605.15929.1567552683650395230@5dec9699b7de>
Date: Wed, 11 Sep 2019 22:14:17 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: no-reply <no-reply@patchew.org>, qemu-devel@nongnu.org
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.26
Subject: Re: [Qemu-arm] 
 =?utf-8?q?=5BQemu-devel=5D_=5BPATCH_v3=5D_target-arm?=
 =?utf-8?q?=3A_Make_the_counter_tick_relative_to_cntfrq?=
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GxTQnPUdHCBY



On Wed, 11 Sep 2019, at 15:40, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20190911034302.29108-1-andrew@aj.id.au/
> 
> 
> 
> Hi,
> 
> This series failed the docker-quick@centos7 build test. Please find the 
> testing commands and
> their output below. If you have Docker installed, you can probably 
> reproduce it
> locally.

Disregard v3, I got distracted by some updates to the way ASPEED's u-boot configures
CNTFRQ and didn't test some relevant cases.

Sorry for the noise.

Andrew
