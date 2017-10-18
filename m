Received: by 10.223.197.9 with SMTP id q9csp5868591wrf;
        Wed, 18 Oct 2017 09:31:11 -0700 (PDT)
X-Received: by 10.200.49.228 with SMTP id i33mr4087525qte.95.1508344271705;
        Wed, 18 Oct 2017 09:31:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508344271; cv=none;
        d=google.com; s=arc-20160816;
        b=pq1nkxL0yJLjijYsGua7KBAmWWMjbLUIzfgMW6Z/YPCqukEYlM0pt8drgJ56+kUVCU
         wtTrFvJqkG3wPCz26FpxAHLTByNiM20Yid060SR2BgQdPLdOOJ2qyuNR+0MobwP1AF1d
         mlDF5Gy/hpTV4M+FMt5w9mi5tgtpEbmX3xC2x9DAoB8pwjVBEySytZ+UMUYVafKLXeiA
         Q4rrima5zufOWR+XagbUYFOmcX3UDFWWFnzVBGx1UvdB+B9+iIG6419dAWMRxklZnkf0
         x4jMW+e7G9oDUrcZ4XW62E16RMElQQklxQ9u3TKAbkh4/38qK69rWfpDSA8cF1hz+gJD
         Vccw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=yy0yD6oBzwqxNAda6fAvUA/1ZssS23KItil64ZkE8F0=;
        b=W/q7/8uZI0iGQlyMkaEFo8mbsm9+SHYbmlX2xqwwY9R/DyvfeC69/kcnLwm/86l9oD
         w28DyvSsSVleQOiHAvBkhx57ywLRu82ttr/mVt/LUxzayDJOzyTW6EmShrSG7HvYbPjb
         KYlR1Ftx98KTVgEI1baoMcQFfwbDyf5A6LOY5eRnxRcdh8upRh3NY+tPwm/mpka3zre7
         0Ss/Xmk5Br2J4L//o6MlRrpUxhDFPy2q4+wAZ6wFF76jvxtG2a7MJOHPyzuRIoPbPDBe
         vhJ4xBUOe4IvjbwlQ83DgB6KaXX/mN+4D4Zxt9FsQTmCBdTh+tTSZfwDiuvJPvqg0G51
         hF+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GVi0XJ5D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h138si748700qke.146.2017.10.18.09.31.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 18 Oct 2017 09:31:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GVi0XJ5D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45541 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4rFN-0006XE-CY
	for alex.bennee@linaro.org; Wed, 18 Oct 2017 12:31:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41208)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e4rEN-0005q6-I4
	for qemu-arm@nongnu.org; Wed, 18 Oct 2017 12:30:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e4rEM-0005VA-OZ
	for qemu-arm@nongnu.org; Wed, 18 Oct 2017 12:30:07 -0400
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229]:53310)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e4rEM-0005UE-Ht
	for qemu-arm@nongnu.org; Wed, 18 Oct 2017 12:30:06 -0400
Received: by mail-wm0-x229.google.com with SMTP id q132so11231375wmd.2
	for <qemu-arm@nongnu.org>; Wed, 18 Oct 2017 09:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=yy0yD6oBzwqxNAda6fAvUA/1ZssS23KItil64ZkE8F0=;
	b=GVi0XJ5D0dA4aLUBvbQ2tFvqgyN329ohZ320rsbgC3O7snnJImBivMzep4Dg7PGNkp
	4x4Yq/u/Kqf7Q3nfq7KjDIOav3hCXovh3uH6MFYWrkwmdS8B5sW4tlx+vXw6+bx6O7UC
	Ga2jDVXPXk7B5G7eiCuV9VAqPAsikb48Ua3y0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=yy0yD6oBzwqxNAda6fAvUA/1ZssS23KItil64ZkE8F0=;
	b=C6LE6gRx+q1sAthGz1gt8nWh5JNV8pAE4DeihtZNHcYHZiOdbzngYMLcHSiTnaxhFt
	u245Wy+P9vbrsvCTBscCjZJDDk06ulSu3QdAP4JNOVVRTxHkyJoHcl/jRjEaFld75JQU
	gMoQUfAcylaWHHFAy6lb44K4e5Vs+EU2zByqiCvN7YPhvjBg2OfNjayapkVhXXmUhycU
	Cg2QbwTrLiaUgJsgda1gU4QqujF7jU6XoTefggb0KvCExET46Hm/lTCa9l8rOAX7Uqnx
	LEjXbwGd9eKsXDwumE8fhL4UC72uXR4PPQ3JkbL+npBKNyHP5u1a1QDqCNLQpdQaQWIp
	gmDw==
X-Gm-Message-State: AMCzsaU0MefqVGjQa9OElXCV0pRVlAEcreCmPZgMDLnajmL1SUrCjoGF
	3l1z5slfMroo0c9edKK7VwReGVgGzUbtSK//GVdKVw==
X-Google-Smtp-Source: ABhQp+QoLsh5N447FZsJWryjee830y745oG9IvjpX254sOU8iQ9HNn/HNHD9gmK9qC59h1KPYwMKI7Moy9Pjna69MAk=
X-Received: by 10.28.92.136 with SMTP id q130mr6609371wmb.35.1508344203973;
	Wed, 18 Oct 2017 09:30:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.28 with HTTP; Wed, 18 Oct 2017 09:29:43 -0700 (PDT)
In-Reply-To: <8ded3a0e-f7da-00cd-3abd-7d4bb22a5016@kaod.org>
References: <20171013142852.916-1-clg@kaod.org>
	<20171013142852.916-2-clg@kaod.org>
	<CAFEAcA-gYYbQu-Nuds3E0Aw7j0OdD5_ySm=EdMb1_FzxEoMTBQ@mail.gmail.com>
	<8ded3a0e-f7da-00cd-3abd-7d4bb22a5016@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 Oct 2017 17:29:43 +0100
Message-ID: <CAFEAcA-7+XAXTVeemQvzEfRmCoMLTBDbM7VnCS6L6k0avXRcgA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::229
Subject: Re: [Qemu-arm] [PATCH v3 1/6] aspeed: add support for the
 witherspoon-bmc board
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bRURtubFfIuD

On 18 October 2017 at 17:10, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 10/17/2017 05:39 PM, Peter Maydell wrote:
>> A "reads like RAM but writes are ignored" lump of memory is easy...
>
> yes. It seems but I haven't found my way through :/

memory_region_init_rom_device() creates a memory region
which is backed by RAM for reads (and for debug writes,
like ELF file loading), but backed by the usual
device callback functions for writes. So I think you should
just be able to use one of those but with the write
functions doing nothing (or warning about unimp. behaviour,
assuming that your flash devices actually have some
kind of command behaviour for writes).

This is how we implement the flash device with actual
behaviour behind them.

hw/mips/boston.c actually has an example of doing a dummy
flash device like this (though it uses
memory_region_init_rom_device_nomigrate(), which is a bug
because your memory contents won't get migrated if you
do that. Use the plain function instead.)

thanks
-- PMM
