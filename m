Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp50074wrt;
        Thu, 6 Dec 2018 20:43:37 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X7XjlgZyWffMMA6sr7AHHLs7Ru+1Ph9J+26jy+QiPU5CD1ESg8jMWEs6DDURLyw/gGDzln
X-Received: by 2002:ac8:478f:: with SMTP id k15mr614631qtq.281.1544157817199;
        Thu, 06 Dec 2018 20:43:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544157817; cv=none;
        d=google.com; s=arc-20160816;
        b=A/Do+a/c7SGMCXnyvEjosD84UwJ9LJk64kXAwWhWvKc34xAsgHWY9ZxSelz3ebqJSC
         QyZJndBDgyl5oy4ZK4Gi/GtRuy3wuVDNi1StJ/DcniDbMPYObmHpNQJurwRGTRYkBJX5
         fdWEhJuojnnJs95CEc2teB3gLxYpXj9Z/W+JOoNuuPAVoj6HekoFzOPEjk0yIJQNls4D
         27ODUCDzwUSSsofEkfMzoXt2lDowXEoN/JUzTpB69LH77M4ed1WTEX63sYn1P+8s5ODP
         mTqkH8vZif0J/Fqt2WC8p+a2qZqb3C4jrptO8QnL7ib/PCXd2tQtsa+I+F0r3bX1X6Lu
         hIEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rOvU8HxXubgeW9wERvLCTppoiQiOn3U83M6i6QizKvw=;
        b=eRu968x5QD3r2Wso6mopRYZMBcrzfFXfP/Z2K7tOJWSexDj4TwDzBPe0uP8TTWEfWH
         ufMMzBAGAW47t2TwWM9xE3ojuivRXggqmDd717K00PXkghafLg9NpFWsREApbPiZSKq8
         3IuR83buwRDcUdx/0B0xzXfU6yBwAZ7pyQUntIT/14nSHNTglaJnOeN/+EuUmvBbkD3g
         wWYGyAOgj5j6iB3lGU4yjeZwkjFZhnTV5CizoUHRojvfEuaDhcKZs3ZCP8lDdR0sDw5w
         IK7SXpiJA5u3jkN9zOeYP8wNVdTI2eyi432TCBcYWHHJ/NV+Rlp0rtHTZOPYYjOUcNLI
         PvsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@zx2c4.com header.s=mail header.b="x8+Gv/x1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=zx2c4.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m36si1046133qvc.170.2018.12.06.20.43.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Dec 2018 20:43:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@zx2c4.com header.s=mail header.b="x8+Gv/x1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=zx2c4.com
Received: from localhost ([::1]:44172 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gV7zE-0003QG-O6
	for alex.bennee@linaro.org; Thu, 06 Dec 2018 23:43:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47081)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1gV7z2-0003Nd-Cq
	for qemu-arm@nongnu.org; Thu, 06 Dec 2018 23:43:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1gV7yx-0002Ft-Ti
	for qemu-arm@nongnu.org; Thu, 06 Dec 2018 23:43:24 -0500
Received: from frisell.zx2c4.com ([192.95.5.64]:39977)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Jason@zx2c4.com>)
	id 1gV7ym-0002AA-JE; Thu, 06 Dec 2018 23:43:09 -0500
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b2b20f79;
	Fri, 7 Dec 2018 04:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
	:references:in-reply-to:from:date:message-id:subject:to:cc
	:content-type; s=mail; bh=HzHI8sTdgQqsOQ9i5/NIcsWC3Yg=; b=x8+Gv/
	x1SlPsmK8CpsXGIkAfSA1u+nXEzQjbw3SQQkwtSCRgJDUEk0rWN/FPhWYc0zpBuy
	MYVYAIz4LGiw6NXaWf9akUq/8437ghFtquMhngwd8uS9CnKyw9/XxmjGNqiPnlJ/
	ye6E72wVckg0yYxD02rzfXJjnyiJGluPQuazp9AWcxWlzVO5Qes9cRSgisUX9FmY
	GpOPqZcBEqVFh93hthMrbg9NtPNPldgtqoG6235+jDQ/YYSKYm7KRHQES57nm286
	pOPZeTeUbpPDgCZmkK7zlF8PcmPdp+WE3zt7fhTjO5rCVHBduOmS7hG9SD4aWp5h
	3as40I4Qqjc/WGoA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 945b667c
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
	Fri, 7 Dec 2018 04:34:50 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id v23so2659914otk.9;
	Thu, 06 Dec 2018 20:43:05 -0800 (PST)
X-Gm-Message-State: AA+aEWbwT619kP0PCAtT1FWbFPIbIS30vSHTd/JZWrYhF8Qz2iGZzJvp
	pTCGGSG4YcLmX+LoEge3SW/5DnQHwD1D01h0daE=
X-Received: by 2002:a9d:12e3:: with SMTP id g90mr502753otg.223.1544157784769; 
	Thu, 06 Dec 2018 20:43:04 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9qhe0ZemTkc2jkEO=_hu6PhvKUKGHC9QYTj2j+QHhNf8g@mail.gmail.com>
	<CAFEAcA8fYaKTZkLR8Ja3P590bSWy1cu61-gSxyf6+wXCfCLoxA@mail.gmail.com>
In-Reply-To: <CAFEAcA8fYaKTZkLR8Ja3P590bSWy1cu61-gSxyf6+wXCfCLoxA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 7 Dec 2018 05:42:53 +0100
X-Gmail-Original-Message-ID: <CAHmME9qQo4XfRgZUZDt3xbx=5KmRoYbO3N0+3m9gdKi9hvnZQA@mail.gmail.com>
Message-ID: <CAHmME9qQo4XfRgZUZDt3xbx=5KmRoYbO3N0+3m9gdKi9hvnZQA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 192.95.5.64
Subject: Re: [Qemu-arm] more serial ports on arm?
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PoJa611Bl7yB

On Tue, Nov 20, 2018 at 11:08 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> It's still stuck, because unconditionally adding a second serial
> port to the virt board breaks some commonly used existing guest
> code (UEFI + Linux), and it's not clear to me what the best
> command line UI is for allowing the user to request the second
> serial port.

Can the UI be the same more or less as for x86? Specify a second
-serial, and then the machine gets one added? If it's in secure mode,
then it's added as serial 3 instead of 2, to remain backwards
compatible.
