Received: by 10.223.197.9 with SMTP id q9csp3564800wrf;
        Tue, 10 Oct 2017 06:34:13 -0700 (PDT)
X-Received: by 10.200.19.75 with SMTP id f11mr19486966qtj.321.1507642453881;
        Tue, 10 Oct 2017 06:34:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507642453; cv=none;
        d=google.com; s=arc-20160816;
        b=JDRQDrZi+3WXOY40lz8ko6lKCHc77dHw4FroWdHX1zhR4RYlz6zxn/FSe5GfGt76Ya
         ECRYm5vcBp2kmd2gDBMn7gRDOJYDpItBdte2H3zEcpUO/4OYR02ggt24BKspiCD+Iia3
         0vF+UdXOvsz87dY5P24I3JVn7JsZRllb5wcfXppKllv3qY3Sh7MG1kiLK5GHMupAwgjq
         0508XpjjmGttEzBhktLvFbJ6OrvUKaHrYH7mpJmqcd5uQMxHmmwY+cN51vRhzhQhqZeE
         +M43SJWqaXX2i9dpqU+zbr5TyVTyA3/vR2Rfn2vOM+gD0zwRIdLsMrLWGkRQy2oECSy9
         bOiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=Xzm5lie6Prj14HHxiay+vzBu73jkQETslqvQInjzeW0=;
        b=PX7h85DvJsA1pK7OjPe2iAzK53JziEkJm+qyEDCONdiRoJEMrRK42J9Z/bATDj9vou
         SqcU/Vhy6PEAcUYmOB6616dgEqF4+HxzlxAazCNDGcWqhFLAEWefhPcZJtDtzK42iQ0t
         mDh5TkjSL8+cTp53Go+HZfLpi1uLy/hsiwr2KYftB4FmHBmU2ybkPgRWiO5kSuG0953Z
         rEc/A6y1j8sy4f4kBpbO3j6Vb2cIJttGbGO+OSXpL9UalsyOJrINlh5MgG/5x1hDCGzW
         lIR8zxWMvsHHaguxQsoaANuKZAXu3Gj2uXS/H7pAP8yLyoG4mrxcpA4b0Hl85F7Tl4qB
         f0iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MTolcJwp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p65si4308044qke.91.2017.10.10.06.34.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Oct 2017 06:34:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MTolcJwp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35122 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1ufj-0000Lz-Ok
	for alex.bennee@linaro.org; Tue, 10 Oct 2017 09:34:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59424)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1ueV-0008MS-Sc
	for qemu-devel@nongnu.org; Tue, 10 Oct 2017 09:32:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1ueV-0000us-0S
	for qemu-devel@nongnu.org; Tue, 10 Oct 2017 09:32:55 -0400
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:46891)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e1ueU-0000ua-OH
	for qemu-devel@nongnu.org; Tue, 10 Oct 2017 09:32:54 -0400
Received: by mail-wm0-x235.google.com with SMTP id m72so5230541wmc.1
	for <qemu-devel@nongnu.org>; Tue, 10 Oct 2017 06:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Xzm5lie6Prj14HHxiay+vzBu73jkQETslqvQInjzeW0=;
	b=MTolcJwpgsbbc314uHVYOZEz5LTYuNYjLoUmPcKVz+oETG2ALImedhUeyo3aJ7ib/O
	2rJcrn24+fwN1izDNOUWTYNUDKMTOVV6Nkv7DqPLUsKqMq7mCvXEP/MgAU6FNot3Wj5R
	wwru8ATQiFj28425hedbB5nbpVO6tfj2TuDS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Xzm5lie6Prj14HHxiay+vzBu73jkQETslqvQInjzeW0=;
	b=l+q3bhYsnD5vuakP6jOUg18A9BZ0L0uYVGO4fDujlpq///5+9shQe9Yuy6Wj5DGmgt
	4DQauykg26CkyrBGs66qe34iAyHWDWqnB01NARjXWa7Zg8zmnfwzPmV2IxmMdsiWjDKu
	kfvuvvMQKpam4pE12SPtTM8tFT9vHt3yT/GbYjlCuSN4ExbdQidgqmmvqRyPhuixzGN/
	O9q+aiYQYADXaC2nSH1caInGIWjVyOlhNTI5CHco7ILezRrjAQlZ06rMlKF2sRWVktPd
	EL2vJJizw+IQ9y11t358ANRd7TD+z+6dno4ESgZaZMYcQp01n9eIvHP/ybTG0mH7kF2I
	wqrQ==
X-Gm-Message-State: AMCzsaVzJcJCUGIb0TcxRYbnPcQRHVVPIvovBarmfhp8oeszMlAvjHVJ
	GTquf7vkcTT1JjQkOpjOvgSs/x6jIAE1N6y7gOVhrQ==
X-Google-Smtp-Source: AOwi7QB3ZypYhIPaLILSFKzcDCMZzxEdQQL1L6EpBr5m0IWxP1cnVCeWSkmo2hkyU6UDOswBMgdnqM7MwgqSsnFA0ow=
X-Received: by 10.223.186.201 with SMTP id w9mr12306876wrg.230.1507642373555; 
	Tue, 10 Oct 2017 06:32:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Tue, 10 Oct 2017 06:32:32 -0700 (PDT)
In-Reply-To: <48144f71-c876-0e89-f01e-cbfe87687aee@kaod.org>
References: <20170920070135.31379-1-clg@kaod.org>
	<20170920070135.31379-2-clg@kaod.org>
	<1507507449.5452.147.camel@aj.id.au>
	<48144f71-c876-0e89-f01e-cbfe87687aee@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Oct 2017 14:32:32 +0100
Message-ID: <CAFEAcA-oJrvJqpdw_7ybBH3oy0ykaVd7SsM_Xx+d9yY9ZXmDkA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::235
Subject: Re: [Qemu-devel] [PATCH v2 1/6] aspeed: add support for the
 witherspoon-bmc board
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nfASyduJWVGK

On 10 October 2017 at 14:30, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 10/09/2017 02:04 AM, Andrew Jeffery wrote:
>> On Wed, 2017-09-20 at 09:01 +0200, C=C3=A9dric Le Goater wrote:
>>> +static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc)
>>> +{
>>> +    AspeedSoCState *soc =3D &bmc->soc;
>>> +
>>> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 4), "tmp423=
", 0x4c);
>>> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 5), "tmp423=
", 0x4c);
>>> +
>>> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 9), "tmp105=
", 0x4a);
>>
>> Looks like I need to track down newer versions of the schematics I have.
>
> the device on the board is a tmp275 but the tmp105 model is compatible.

This kind of deviation from the real hardware is worth having
a comment to document, I think.

thanks
-- PMM
