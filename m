Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1582552wrg;
        Thu, 23 May 2019 04:14:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwiPLIBGHjvYcoaaE6f+Ork2fKKj3Rl1wOWVnAdr19VJ1B3Q/DxpVylQHsqQ3iKAYOFQgCB
X-Received: by 2002:a50:a3dc:: with SMTP id t28mr94639245edb.256.1558610070108;
        Thu, 23 May 2019 04:14:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558610070; cv=none;
        d=google.com; s=arc-20160816;
        b=oJKRxx8Xs6j31cObkQiQZyITjsxLSbICHvi9IbV22lTabed3NRwvDoKxY0LwuW0eFd
         YstTKROHYCbqE0O8nLpGj6ec+Frs9PdvxH+0N2ycfdj5NJvrtxRCtcaiXT4akVzZWI9t
         MuRUNx5SfveQzSwLJ4ThdWQNsh0NJxT53PoemIgP5WbXc5cJaM+YBPv0/aMd0KFprJc6
         36NB/JduB+45p+uHDShuONdWwFq0BCAbUoov95pDzRD0AW6b/wFe2f9jmBoPb8fClvNy
         +4kDaGhChPxkywnINs+n3kZIXZrNNKYswfgCoISgWGtUuu5sltF2shizlq9rTGkBdUw8
         x+cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=Ow6Il5MaDkklMMFc0zjgB0QBfHnShX3GQZbde1iH6bA=;
        b=0QAv7SGsSNtmqBc/CNBNzrc+0V9KYzmm6M8jNiXGNkbBMwj8NixBvylyyCTVCK37LL
         0QuFytKYmMa1ks0zY1GjS4W0KI0jLvn+SUtcUOQUc/5i0yA6GkPvV95zUrIF2AWMTHHA
         LuNzpRQ7yRDaxB8CNkPgjnKSaF6lgMszGVT8NJFgAgtezo4EnrZtHl70j7wBetYFgbi7
         JTrlpMSiAe1Kh2iIjqA4Wa07zB5WGpZtaeGbtlQEYZ6x8u05pIvHnSF6CrO9XincmAys
         eDIO2IQunCrGtMwC2dRi6MjzTi9N9j1Ge9bjfRH+YAHVw5dRSmdJKRdsbJAlA/jmWA0t
         LjrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 22si11104295edu.283.2019.05.23.04.14.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 May 2019 04:14:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:33908 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hTlg5-0008Jo-3h
	for alex.bennee@linaro.org; Thu, 23 May 2019 07:14:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33299)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hTlfu-0008JG-3l
	for qemu-arm@nongnu.org; Thu, 23 May 2019 07:14:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hTlfs-00085d-08
	for qemu-arm@nongnu.org; Thu, 23 May 2019 07:14:16 -0400
Received: from 13.mo1.mail-out.ovh.net ([178.33.253.128]:39703)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hTlfr-00080l-G3
	for qemu-arm@nongnu.org; Thu, 23 May 2019 07:14:15 -0400
Received: from player792.ha.ovh.net (unknown [10.109.160.153])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 7D5D717872D
	for <qemu-arm@nongnu.org>; Thu, 23 May 2019 13:14:05 +0200 (CEST)
Received: from kaod.org (deibp9eh1--blueice1n0.emea.ibm.com [195.212.29.162])
	(Authenticated sender: clg@kaod.org)
	by player792.ha.ovh.net (Postfix) with ESMTPSA id 61E9762AB623;
	Thu, 23 May 2019 11:13:57 +0000 (UTC)
To: Wim Vervoorn <wvervoorn@eltan.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
	Peter Maydell <peter.maydell@linaro.org>
References: <d0fea426e8b245769f3022dad121c17e@Eltsrv03.Eltan.local>
	<3ee8eb5a-d38c-9570-3da5-a055e9f147e5@kaod.org>
	<fed595d26ce54222b42e005566b70308@Eltsrv03.Eltan.local>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9b49eb14-6dc8-29df-c617-8080551b4f6c@kaod.org>
Date: Thu, 23 May 2019 13:13:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <fed595d26ce54222b42e005566b70308@Eltsrv03.Eltan.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 9258274935155362577
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddugedgfeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.253.128
Subject: Re: [Qemu-arm] aspeed qemu question
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZMLGmN57Arg1

On 5/23/19 12:05 PM, Wim Vervoorn wrote:
> Hello C=C3=A9dric,
>=20
> I have another question regarding the ASPEED Qemu support. This is rega=
rding the SPI support.
>=20
> I noticed that in general the fmc_model and the spi_model for the flash=
 device
> are different even though there is only one flash device connected.

The flash devices are created but not attached to a file backend=20
unless you define it on the command line with -drive options :

	-drive file=3D$flashfile,format=3Draw,if=3Dmtd

The first mtd drive corresponds to the flash chip attached to the=20
FMC controller (BMC Firmware), the second is the flash attached to=20
the SPI1 controller (Host Firmware)

> I would expect that in this case the models used would be identical.

The flash device models are defined at the machine level in
hw/arm/aspeed.c:

    }, {
        .name      =3D MACHINE_TYPE_NAME("witherspoon-bmc"),
        .desc      =3D "OpenPOWER Witherspoon BMC (ARM1176)",
        .soc_name  =3D "ast2500-a1",
        .hw_strap1 =3D WITHERSPOON_BMC_HW_STRAP1,
        .fmc_model =3D "mx25l25635e",
        .spi_model =3D "mx66l1g45g",
        .num_cs    =3D 2,
        .i2c_init  =3D witherspoon_bmc_i2c_init,
        .ram       =3D 512 * MiB,
    },

> Can you explain how this is works and how I select the correct model
> for the fmc and for the spi controller.

You need to define a new machine (board) if you want different flash mode=
ls.

C.=20
