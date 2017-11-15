Received: by 10.223.150.237 with SMTP id u100csp4701000wrb;
        Wed, 15 Nov 2017 03:57:59 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYuCTnLFHd8vgbnqu94oyTQ8CvvqN7QhqhOeVvIeOzFGVPdpn731GHfYGFaWdEJhbUqmlYU
X-Received: by 10.37.186.200 with SMTP id a8mr9251615ybk.56.1510747079038;
        Wed, 15 Nov 2017 03:57:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510747079; cv=none;
        d=google.com; s=arc-20160816;
        b=CtJ7y5/oaEDurYtY/jeXT+yGra1Sf6jI/OH2EIODfc9kpPMQIWNOlHZuDFSPcgg4QH
         NWdiWEN1aE3WCCH0iWXR8rmnq1MqUxMetP7/i78CnOMnOZtGWe/SMeLTIXOVjJi7KKhm
         1vc6Wr/mSI2dlzyJkjFbE0aSLuM7CMEjv0DzR3awdA9NRlfwWFHkuanzn5V4KvFqH1CY
         r6MFRXNvaOBVk1lzdseGgfSgKyUbpvPbyRxWNxmiHHEsxKJ6deirndI935AOrbrgacZe
         77QQcOApbjAyfelIKNQEPVvJdDusvELmDf7uHrWpJ439vH0wIKGesino618rscegqs+A
         1KPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=BiH27kpVO6hlOb2gVkOrNdFDsf8VJYwRUYnbwebNeRY=;
        b=pHRXfFEk97BAT+3LlO0lyn1Wsv3R4jpo8HhaJrGK1v1dlLj3m8qBdSxz3CXb0O6nC7
         lYJaQ0ntkI1VARBEzsIDEI9ACXr1E6KA5UpUCcND4xv6XNwUM1bo8oYVwmXHHS0EM9CD
         L6bMhuCKkHZKJHD/WOtvUNgjApk1lC+Hyx+X41DOxLzGGI9b0U4nanKwJvxtdL+HZ+22
         xLiBOqlFtLJkkAvzBo1Ob1P/G4Fbu6AftSZZuncoJvTId+tdYmFeEX3WQsr+tGf86IAp
         EKZYFr+fZbMkl9O7wQ28njudCIePLAl1mqOU0o8beqzYqwuDvcaOKWMS4iIwm/xggmd8
         lnVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kPeIhqrw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m37si1264481ywh.674.2017.11.15.03.57.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 Nov 2017 03:57:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kPeIhqrw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35703 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eEwKM-0006BW-IU
	for alex.bennee@linaro.org; Wed, 15 Nov 2017 06:57:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52176)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eEwJU-0005ph-4p
	for qemu-devel@nongnu.org; Wed, 15 Nov 2017 06:57:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eEwJT-0003R9-ID
	for qemu-devel@nongnu.org; Wed, 15 Nov 2017 06:57:04 -0500
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:43154)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eEwJT-0003QH-AY
	for qemu-devel@nongnu.org; Wed, 15 Nov 2017 06:57:03 -0500
Received: by mail-wr0-x242.google.com with SMTP id 4so20276098wrt.0
	for <qemu-devel@nongnu.org>; Wed, 15 Nov 2017 03:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=BiH27kpVO6hlOb2gVkOrNdFDsf8VJYwRUYnbwebNeRY=;
	b=kPeIhqrwv3dZb9TS1LpKgmxjxF3i5rgF9uzUTePHMRPFC7jtcI250L15s3ZzovkLdJ
	8unNLTFhviY+gh2zb4kv/at7SY/0dizGBToV2MkddFwAufL0HpSbEFxp+QycbRKR3QCo
	H2ubhX1ieCJucFeKK1qfYXCjPAq5HG3O63QRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=BiH27kpVO6hlOb2gVkOrNdFDsf8VJYwRUYnbwebNeRY=;
	b=GF8mX5E/0f70qLiC+iPqon8GqPe8Ev61VpAuDCNruPC/qNgosScQ0UKx9FnyP+3ohU
	gkVSiYI0fBPQNZ/4NaDFOmifpQACZnykWXHxfV6Gqhsq9UcI2MRwAPwbuJRHcxiW1xui
	iiTdts+7nd6iPKUuKr+mn+h5370i+MeRSuVgci7e5co8eVDJ8uqSNYvlWIAbJJLUIW0L
	nT+Td8l54sd40ul936WaSSYgO4GNY18XuCqS3zigPhEfs2t1Tzc/et3ykkzQQjIo3BxB
	X3Pg3YXMwGOM+JD0x3J9L5FLdwOsP2A+T3UNhEoPx6Q/xAA7UvRElFq7u1c5vPPUonn3
	Dkaw==
X-Gm-Message-State: AJaThX4ZtSw7kEPmOCldovcw4PmdwwFz9KlsdLLvhLQz6CjTX6aD6Fg4
	L3D7st1uTZ+siRYBNdamRbPA5PSyGatocOOQ75yhDQ==
X-Received: by 10.223.171.161 with SMTP id s30mr12312768wrc.194.1510747021907; 
	Wed, 15 Nov 2017 03:57:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Wed, 15 Nov 2017 03:56:41 -0800 (PST)
In-Reply-To: <27983ce7-8de1-620f-ca06-ee4f92dab180@kaod.org>
References: <20171114122018.12204-1-joel@jms.id.au>
	<27983ce7-8de1-620f-ca06-ee4f92dab180@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Nov 2017 11:56:41 +0000
Message-ID: <CAFEAcA9udAJpnJVrkPcS9TrM5EAxPHn70tAjM5Bvr7HvUrqY=g@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: Re: [Qemu-devel] [PATCH v3] hw/arm/aspeed: Unlock SCU when running
 kernel
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 22/M/j+m7p2H

On 15 November 2017 at 08:18, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 11/14/2017 01:20 PM, Joel Stanley wrote:
>> The ASPEED hardware contains a lock register for the SCU that disables
>> any writes to the SCU when it is locked. The machine comes up with the
>> lock enabled, but on all known hardware u-boot will unlock it and leave
>> it unlocked when loading the kernel.
>>
>> This means the kernel expects the SCU to be unlocked. When booting from
>> an emulated ROM the normal u-boot unlock path is executed. Things don't
>> go well when booting using the -kernel command line, as u-boot does not
>> run first.
>>
>> Change behaviour so that when a kernel is passed to the machine, set the
>> reset value of the SCU to be unlocked.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks. Should this go into 2.11 ? It sounds like the kind of
bugfix that ought to...

-- PMM
