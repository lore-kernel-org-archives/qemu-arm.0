Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4353603wre;
        Tue, 29 May 2018 22:36:00 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLvfytcLR9AIW8fxksJCxduh1l6pZw6XTzI9fcBQlmPBwdvA3WtqzSkopggSfd5N+KCfb/b
X-Received: by 2002:a0c:85e6:: with SMTP id o93-v6mr1205427qva.27.1527658560785;
        Tue, 29 May 2018 22:36:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527658560; cv=none;
        d=google.com; s=arc-20160816;
        b=tPNNbT+ZuSXgOctOSlKBXe/Gy2T9/XctWVF90hje8C6hw/y64p1vOq1pdRANlgAyH8
         sU1qck0QQhZr2xyTSsJd6ZwvPPau7ndILk2ToyV1rKzgYd/hXmW6V2kcEqp7MIYTzrIT
         pkX7L2Bjv/jpboOHuzq3hzEyQSUFkHvr2A7mXMcPHIbMGY9Z8vzmKEztMW9PoXYZYfTB
         tfVXD6L0r77LDUPrfLUBOcm1rGSfbs2sgWzCv4jEhrtz1jAzaHTrW1u8VNUFifvlPCMz
         REQkR/cKp5jn11YK2/3oPq+/nbG9z6TPbQrqG2qu2sUXRm+hELHD3wWmrapG5OICQAs3
         xxTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=PhQoZWkzj/g5gcbbeJL+RK7mJIPQm8MlVHRJm79RAc8=;
        b=NbNjMOqVzB+9dmJSX5Uaj/KLb4QyRpZmfKkj5monZdb3M1hoAwMDZR+BawP+rlXftZ
         hm4UKB1gF3hAu5sMbDE0tMjfvfHd0TaQpsFKLMDTMaRTofbxRa5MmXzPTFsMuMcs9yx0
         SzKSE0CTSdKAsh/MyIMm0W8KmwJ0trBouESn6liMyRFyGTpTCooZNHSoEn90GrBVq7kL
         acbU2mCT08VGPmeRDCPcpHn2usarJwqj0qDQa51rKdj6tWH8Am1qgy2QHNI7Skg09Moj
         aS4gIdWXnnFPh7vNOb3fFTxbIMMadD/zWUYpyhgcB7vf1UFeH/DraGKnwlTp2DoGBZbb
         MhHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=im0NFFme;
       dkim=fail header.i=@jms.id.au header.s=google header.b=Gys5EvN5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n20-v6si4599247qtk.219.2018.05.29.22.36.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 22:36:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=im0NFFme;
       dkim=fail header.i=@jms.id.au header.s=google header.b=Gys5EvN5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36300 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNtmC-0002qB-9j
	for alex.bennee@linaro.org; Wed, 30 May 2018 01:36:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52782)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fNtm1-0002q2-Gx
	for qemu-arm@nongnu.org; Wed, 30 May 2018 01:35:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fNtm0-0001Z9-8o
	for qemu-arm@nongnu.org; Wed, 30 May 2018 01:35:49 -0400
Received: from mail-qt0-x22d.google.com ([2607:f8b0:400d:c0d::22d]:43117)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fNtlz-0001Yx-Qv; Wed, 30 May 2018 01:35:48 -0400
Received: by mail-qt0-x22d.google.com with SMTP id f13-v6so21772800qtp.10;
	Tue, 29 May 2018 22:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=PhQoZWkzj/g5gcbbeJL+RK7mJIPQm8MlVHRJm79RAc8=;
	b=im0NFFmeVvpv2blbdBnqHsodMEdeEwkK6LFZtUGJNwl8j6NIW/InJ1RkcUm2eDp85m
	fLoZoKJr5NdxPYJFyzilVboXh1GwNpwwQlmb/7zHSk8PtOirpFMn7FUuHpHS6jo6kbMx
	EtVWJGndm7Tac8lr9A4aYjueGL7sDO3kKEZNc3euvc5UaHUjYFrUI/8+iZdhO5pSAHHD
	RLSKRFXqOJjPjJD/p5g233Ys1dsn/qRUQC9q4rG7GK+YbCljRZ/aQjGNk0HSXHEUTut6
	3EIc4EGwpMLBsMNROU4lq/o5pmf+v4SfcWvNB5nRjVtK/8FJZgFyUNJpqZ4z699hk0Ao
	Lv/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=PhQoZWkzj/g5gcbbeJL+RK7mJIPQm8MlVHRJm79RAc8=;
	b=Gys5EvN5W8oQuj7x+yRBaUW/XIdOtG378Jdeg9kY3psV0/UWe8SRm+nudxkQ8qq4PW
	bVzPUNcEekj+k1G5Yj6AKCdY2xyNAsTYuX+OX/OJxMw+IUiH0ubNQhQ6H+5z+22nCi4D
	cejB0GMifW9K46xRWXpYs+pqiHDJ/6gzyZYlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=PhQoZWkzj/g5gcbbeJL+RK7mJIPQm8MlVHRJm79RAc8=;
	b=o95/jnbJWgkcDSVA3poIro5JaihT58cMq9rIiQLdMHxcScFk9Bw9xXH4RGJePiTs4F
	dnU65omw/GaBqz8CBqD+A/MB5sFNAAPD98OCYmMvs6LPofEzegigdTIs9jre2xU6ViCP
	JuwdeCwoaJUgj5+DYrJiPEmJyQCGeCUuc1ycEjwdmxNaLOmcOjAccirS19/osepGRrZ9
	dV4ISBLeqsvW15RXwBHFx9o7cjY7xBidzhzsNNxFUFKy0SIqCjx7E6DsjOJVniKxpyi8
	Ua6LlHOQ6g6tzMc19jFmnQLHYTSRY8m2RZG2pupM4RUzwqMGFWeXcxQVkAPSx6hdQCkm
	enXA==
X-Gm-Message-State: APt69E0L66zwO+DRGz5zjbTUQn083C7+g7Xkb5D2C9w6IkZEpx8ObXUi
	XK7Fs+jqN4NUyL5Ecmf76i3HygVr5ugjOzOqZy0=
X-Received: by 2002:a0c:8cc5:: with SMTP id q5-v6mr1216838qvb.60.1527658547030;
	Tue, 29 May 2018 22:35:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac8:184d:0:0:0:0:0 with HTTP; Tue, 29 May 2018 22:35:26
	-0700 (PDT)
In-Reply-To: <20180529062838.20556-1-clg@kaod.org>
References: <20180529062838.20556-1-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 30 May 2018 15:05:26 +0930
X-Google-Sender-Auth: cOvd7wpbr4EeNqtTBq4sFOFjga8
Message-ID: <CACPK8Xe9a5q5tvFJ=Q0ArkDnf1-e=cW+bVY6a-peD7hpyLn_jw@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22d
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/6] ftgmac100 and NC-SI
 enhancements for the Aspeed SoC
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AQSF4S4TlkBW

On 29 May 2018 at 15:58, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Hello,
>
> Here is a couple of enhancements and fixes for the ftgmac100 NIC used
> on the Aspeed SoC. It includes VLAN and multicast support.
>
> Following is an assorted set of changes for the NC-SI backend also
> used on the Aspeed SoC when soldered on OpenPOWER boards. These fix a
> few problems found when running OpenBMC on aspeed QEMU machines.
>
> Thanks,
>
> C=C3=A9dric.
>
> C=C3=A9dric Le Goater (6):
>   ftgmac100: compute maximum frame size depending on the protocol
>   ftgmac100: add IEEE 802.1Q VLAN support
>   net/ftgmac100: fix multicast hash routine
>   slirp/ncsi: fix "Get Version ID" payload length
>   slirp/ncsi: add a "Get Parameter" response
>   slirp/ncsi: add checksum support

I tested these with -M palmetto-bmc and linux-next as the guest, and
networking appeared to work fine. For the series:

Tested-by: Joel Stanley <joel@jms.id.au>

One question I had. I get these messages on boot:

[    1.184472] ftgmac100 1e660000.ethernet: Read MAC address
52:54:00:12:34:56 from chip
[    1.184751] ftgmac100 1e660000.ethernet: Using NCSI interface
[    1.197107] ftgmac100 1e660000.ethernet eth0: irq 19, mapped at b30b8905
[    1.904237] ftgmac100 1e660000.ethernet eth0: NCSI: Handler for
packet type 0x82 returned -19
[    1.905682] ftgmac100 1e660000.ethernet eth0: NCSI: Handler for
packet type 0x82 returned -19
[    1.905943] ftgmac100 1e660000.ethernet eth0: NCSI: Handler for
packet type 0x82 returned -19
[    1.906182] ftgmac100 1e660000.ethernet eth0: NCSI: Handler for
packet type 0x82 returned -19
[    1.906415] ftgmac100 1e660000.ethernet eth0: NCSI: Handler for
packet type 0x82 returned -19
[    1.906643] ftgmac100 1e660000.ethernet eth0: NCSI: Handler for
packet type 0x82 returned -19
[    1.906873] ftgmac100 1e660000.ethernet eth0: NCSI: Handler for
packet type 0x82 returned -19
[    1.907103] ftgmac100 1e660000.ethernet eth0: NCSI: Handler for
packet type 0x82 returned -19
[    2.024094] ftgmac100 1e660000.ethernet eth0: NCSI: configuring channel =
0
[    2.025428] ftgmac100 1e660000.ethernet eth0: NCSI: channel 0 config don=
e
[    2.025544] ftgmac100 1e660000.ethernet eth0: NCSI: No more
channels to process
[    2.025608] ftgmac100 1e660000.ethernet eth0: NCSI interface up


Comparing to hardware, I see:

[    4.071159] ftgmac100 1e660000.ethernet: Read MAC address
98:be:94:83:00:ad from chip
[    4.079024] ftgmac100 1e660000.ethernet: Using NCSI interface
[    4.085976] ftgmac100 1e660000.ethernet eth0: irq 19, mapped at a0963000
[   40.670099] ftgmac100 1e660000.ethernet eth0: NCSI: Handler for
packet type 0x82 returned -19
[   43.852036] ftgmac100 1e660000.ethernet eth0: NCSI: configuring channel =
1
[   43.877060] ftgmac100 1e660000.ethernet eth0: NCSI: channel 1 config don=
e
[   43.877093] ftgmac100 1e660000.ethernet eth0: NCSI: No more
channels to process
[   43.877112] ftgmac100 1e660000.ethernet eth0: NCSI interface up

Is it expected that we get multiple ENODEVs for packet type 0x82 in qemu?

Cheers,

Joel
