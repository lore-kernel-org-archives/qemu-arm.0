Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1872038wrp;
        Thu, 19 Sep 2019 20:33:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzoUvZfpzH67rIPWzeH4vfjUYAHrBbjaHVa6yhZDNi0I6DXOBQ+mLxApJO2cjK4UyyTlsGu
X-Received: by 2002:aed:2902:: with SMTP id s2mr912150qtd.205.1568950429549;
        Thu, 19 Sep 2019 20:33:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568950429; cv=none;
        d=google.com; s=arc-20160816;
        b=u3YpTLeR2u16ZqkS1zVwHVvVeiy2XG/qKIphMLdIry28Q9K8/Uj3iT6beoQ66C48L5
         Yo6g3DLiYdlBHB105muvTfij3c37ud3pya7Dw0sPk211k6bnNdOeYAFR1SsSUuhvId9i
         uof3z2i2Oy2C/N0mxWAtuPIBJGIwClYQJ2gXLefYMPtQ3D6noSSM/5AxY5T2LL0TNASz
         avJH3jytUjzczVCpPt0tkMde51HrHeus2rSPQbmC2EPojFIlJiXVz5v4L/+7AOqRoiC7
         jVyFnpqV916YHv1j25BBX10uV5PMVpFTTNecNQwMQXTg3D2GrUQUarSXbyLwiVnZR5kx
         Vjzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:from:date:references
         :in-reply-to:message-id:mime-version:user-agent:dkim-signature
         :dkim-signature;
        bh=ah7cQPmHf2Gk7WcmfSJ5XdfKJIREpKFJSm/kt3ZWmFo=;
        b=v/X+4VTv143oradnaDR+hQi/QZ/mBStiNDwtwfNolNIZy6V/m7qsv5L6hYIQZ+z18i
         cIFnaR7OO2ZIKrtmByWlfcM1mm+L7OmJh9V17OwahOV8M/TYr8gwnyI4fy7mhDVBWbMJ
         fNYpVeZoMkENEmbwy2ed9wITt5Lq2SrzJlFvwyB2Jw+PHzo4m+J37oztZhvvGK4LTaUn
         38ezgvYqrZn97/4HqAIh9PVW1/n/Eptlva316w2oXhuFS3+X+LGeLIHSrEziRxT0ytvl
         B4Ev1BvDfikuZyR+8jfTVxMOi08myiI4qVNAzVtKOCdhCoIscedrD4iPgV5uQNzQHCPO
         l5ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b="G6/Q01Qf";
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=v31LoSfY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b24si1084657qkl.27.2019.09.19.20.33.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Sep 2019 20:33:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b="G6/Q01Qf";
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=v31LoSfY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iB9g4-0002fs-UA
	for alex.bennee@linaro.org; Thu, 19 Sep 2019 23:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58636)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrew@aj.id.au>) id 1iB9fu-0002dH-KN
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 23:33:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@aj.id.au>) id 1iB9ft-0008LO-Cc
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 23:33:38 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:42949)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrew@aj.id.au>)
 id 1iB9ft-0008Kx-1c; Thu, 19 Sep 2019 23:33:37 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 626B8494;
 Thu, 19 Sep 2019 23:33:34 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 19 Sep 2019 23:33:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=ah7cQPmHf2Gk7WcmfSJ5XdfKJIREpKF
 JSm/kt3ZWmFo=; b=G6/Q01QfqhKg5dseK28VH/R7gwDemg3+6F/2TdBowN/E4HY
 ODzE/xsjZoLquflwS7z0EkzbHS6PXyjUkzLIMtDzhsdd7TfDFyq7TXjA+3sAu8ZR
 aXWhLumurK29+DusijthSrna+3zXK1CSgC6jfOEwuzlZbYb5u2nP51cFxhd9nQtf
 TgDj2K/LbwivUlqtq1zvKAprGwDl6tDSwghXMc9zqLHDQvJAJddt4w/9H6NXBpVb
 ivDLs8UjFz4kBbmLqmMQNiD/SuPbIca2drMr+Ev6ZpQ/EsgqCuVbOsVjP6A83Ogg
 OudiiJ/Nq+wMi3YIZwRhUvijJsF7iSApokCJj2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ah7cQP
 mHf2Gk7WcmfSJ5XdfKJIREpKFJSm/kt3ZWmFo=; b=v31LoSfYj19Xbu4DkDvcuW
 Jf/3E7GPBUkDMdXazvQHnBcRqkOsruG82fSjZUTBjuBntaEu2kj+AA1e7GuAaFqf
 ZHC6uocI4/OTUlTTudcKnHXNex4LLAWTB/HOCDe4y4nKgQTyfH0UBDSU8cQk2m8X
 vQ1bxKKKrN1lVygWJHN4RaFMeCS7oFVhSbMVS0TAoPmXpzdd4OdVenv4dETAwO2b
 7/cfIplJTyr0AkCpVB6h3TSFu7Ms9mLnmXWZdpLFBTlXmuTaIJzsb9OO5LxXeFoq
 k5Pp63wfT0Z1PpToZ2P3E/C9qLhY0mm4nOuPB5Cq/+efwKFPn8t+947NYT7W0emA
 ==
X-ME-Sender: <xms:jUiEXRV0InU27Zg5MMJYUHj-gIyNb1H81FyjRG5KwgQD5VFFq1G_mA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddugdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffohhmrg
 hinhepphgrthgthhgvfidrohhrghenucfrrghrrghmpehmrghilhhfrhhomheprghnughr
 vgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:jUiEXV3nTNuhZjAjMjqZmSL1tPhZiKnm6Nm7LUgsr6Gmj1noU8DrAw>
 <xmx:jUiEXQ8EqWl36QYLCHaPI49FcAqM6mtRuCJb20jHNcOzx27-3xKVWQ>
 <xmx:jUiEXTdFnO6s4pR_xVoeq2chKJOZDwKJANwmps4CpdmbROJNzWVWug>
 <xmx:jkiEXbnAi8Y76nL3m_YXWcrEpkmuhgPHzylakmvqsCvDard3FsgYQw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1EAB3E00A9; Thu, 19 Sep 2019 23:33:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-238-g170a812-fmstable-20190913v1
Mime-Version: 1.0
Message-Id: <d0707b66-4446-457b-a5fa-2b4225db9ad5@www.fastmail.com>
In-Reply-To: <156892658765.2125.17871103047730488122@1c8ae44fe5c0>
References: <156892658765.2125.17871103047730488122@1c8ae44fe5c0>
Date: Fri, 20 Sep 2019 13:04:09 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: no-reply <no-reply@patchew.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Subject: =?UTF-8?Q?Re:_[Qemu-devel]_[PATCH_00/21]_aspeed:_Add_support_for_the_AST?=
 =?UTF-8?Q?2600_SoC?=
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 64.147.123.20
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
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4eBUlNV0OsjL



On Fri, 20 Sep 2019, at 06:26, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20190919055002.6729-1-clg@kaod.org/
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
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> make docker-image-centos7 V=1 NETWORK=1
> time make docker-test-quick@centos7 SHOW_ENV=1 J=14 NETWORK=1
> === TEST SCRIPT END ===
> 
> libudev           no
> default devices   yes
> 
> warning: Python 2 support is deprecated
> warning: Python 3 will be required for building future versions of QEMU
> cross containers  no
> 
> NOTE: guest cross-compilers enabled: cc
> ---
> Property '.cntfrq' not found

Ah, we should drop the patch introducing the CNTFRQ configuration for the 2600
as well given the patch adding support to configure it isn't part of the series.

Andrew
