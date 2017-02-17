Received: by 10.25.77.65 with SMTP id a62csp229871lfb;
        Fri, 17 Feb 2017 07:39:48 -0800 (PST)
X-Received: by 10.200.47.100 with SMTP id k33mr7569997qta.241.1487345988455;
        Fri, 17 Feb 2017 07:39:48 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m189si7733377qkc.38.2017.02.17.07.39.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Feb 2017 07:39:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54343 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cekdP-0006gW-Ve
	for alex.bennee@linaro.org; Fri, 17 Feb 2017 10:39:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cekcU-00064t-LH
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 10:38:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cekcU-0004o2-0K
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 10:38:50 -0500
Received: from mail-wr0-x231.google.com ([2a00:1450:400c:c0c::231]:34893)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cekcT-0004mv-Q1
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 10:38:49 -0500
Received: by mail-wr0-x231.google.com with SMTP id c4so32028154wrd.2
	for <qemu-arm@nongnu.org>; Fri, 17 Feb 2017 07:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=usBVh3/4VO1ulOSBHM0ajXdwEJ7ftUSfgAT6kHyrbsQ=;
	b=K6ZW496z0NsZl6JiKM1/g2+CU+WLggLUiMi8fbj72DZ2bRCP2GsFuWJVUfQHPy/2E4
	zq9zTSa86ownfPOxpeBwFxhZT1g0zwqveJWowLZCnWhLpqE+QZ87o9mYgUjSJSi11d9z
	BYOswa3uQQnOBK6llcCy1x0xM+ZC/ks8n+kDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=usBVh3/4VO1ulOSBHM0ajXdwEJ7ftUSfgAT6kHyrbsQ=;
	b=eN2rkIjF4YFQS6N3ALNQqmxcn6O1oqbwRqGr+Ac6ksXxnpN3XHGCtGyeNqF3SCER2u
	W1+nz9lOZfWS88/r8CO8ReneRbBBNicXh74iROPyMok3MdsiPYo0e5W2VQkIcj0SKAhD
	973TJlXR368oIW67Vm+ckQl7XgKMPXRded9PnFPrEiY31n1OfNLTt1m675JIqmmz+wl5
	vmbFRCq3ArL72GAiClOFjzyASsF+vURnvxwTHrhURTK89kfLk7XS9QG6Ql2kkucjkLGd
	niVSy0mWguJh9B7FSAw7FynWfM00X0a+BHCyBTajrok1BklobxnYh8vUSX4Z0FF7jcsf
	GTPA==
X-Gm-Message-State: AMke39m5KDk8fHVqo6TbmlxKnV3H2xHn5MVfhk0dsCvcRmg3qcPr9r05yVng7xgamkJrVWo3BCnS3XVkwiAa/eXL
X-Received: by 10.223.136.152 with SMTP id f24mr6707957wrf.187.1487345928447; 
	Fri, 17 Feb 2017 07:38:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 17 Feb 2017 07:38:27 -0800 (PST)
In-Reply-To: <CAFEAcA-i6xqsik1=hMk9N0w-rCa8JxZD9VF7h==hjYJokx1fCw@mail.gmail.com>
References: <20170210210857.47893-1-marcinch7@gmail.com>
	<CAFEAcA-i6xqsik1=hMk9N0w-rCa8JxZD9VF7h==hjYJokx1fCw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Feb 2017 15:38:27 +0000
Message-ID: <CAFEAcA9DCBsqcWasVpvYWm6sKNUiQWiBJezEqQTQBgnO3zZgiw@mail.gmail.com>
To: Marcin Chojnacki <marcinch7@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c0c::231
Subject: Re: [Qemu-arm] [PATCH v2] target-arm: Implement BCM2835 hardware RNG
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
X-TUID: V67ot0aWdckv

On 17 February 2017 at 12:54, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 10 February 2017 at 21:08, Marcin Chojnacki <marcinch7@gmail.com> wrote:
>> Recent vanilla Raspberry Pi kernels started to make use of
>> the hardware random number generator in BCM2835 SoC. As a
>> result, those kernels wouldn't work anymore under QEMU
>> but rather just freeze during the boot process.
>>
>> This patch implements a trivial BCM2835 compatible RNG,
>> and adds it as a peripheral to BCM2835 platform, which
>> allows to boot a vanilla Raspberry Pi kernel under Qemu.
>
> So this looks good to me (other than the rand issue which
> I just posted a patch for).

Dan's reviewed the fix for the rand issue so I'm going to
apply this to target-arm.next. Thanks!

-- PMM
