Received: by 10.25.21.96 with SMTP id l93csp1514589lfi;
        Tue, 28 Jun 2016 01:36:23 -0700 (PDT)
X-Received: by 10.237.34.100 with SMTP id o33mr2535126qtc.57.1467102983261;
        Tue, 28 Jun 2016 01:36:23 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f9si21630827qtc.27.2016.06.28.01.36.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Jun 2016 01:36:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35048 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHoVK-0006bT-KD
	for alex.bennee@linaro.org; Tue, 28 Jun 2016 04:36:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56195)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bHoTZ-0004zo-NO
	for qemu-devel@nongnu.org; Tue, 28 Jun 2016 04:34:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bHoTX-0005BL-PC
	for qemu-devel@nongnu.org; Tue, 28 Jun 2016 04:34:32 -0400
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:36783)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bHoTX-0005B2-L2
	for qemu-devel@nongnu.org; Tue, 28 Jun 2016 04:34:31 -0400
Received: by mail-vk0-x232.google.com with SMTP id k62so2497386vkb.3
	for <qemu-devel@nongnu.org>; Tue, 28 Jun 2016 01:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=qu3c06taljGRYjLvzmasl1RoCrHr7J8Ka5RrNmtkP4g=;
	b=Xeq07eFgW2bEwBVWoTsFNZHWf7w/HAuJ56k1cQ7UYNHHyGAfWPzw1x6cGTB+59zc+v
	fBQ/iT7LZGzo8odo5k0U6i6McxPC9AbK/u8iW0+T+8uchEBEdn6k02Lyvbnqtt9oyAcM
	6dSST++AbZuyiwziWynCpXLje3QDkv9GloSdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qu3c06taljGRYjLvzmasl1RoCrHr7J8Ka5RrNmtkP4g=;
	b=MGub3EPlUVmVEjTDLmXU3NU+7FB68BfjU0OT7dC0ohxiKoAWA0k0JAz4bFUlg0nKl2
	DjHFiSfUdnNfkpYuEB3ALIwNCOqEe/a8JeJTczgyeYmqxq3OfNshd8r2hBX/u9TLKvWX
	e8Z3C6R0smmFMcBf6+wxoqdUu7CYwA/CP5BzBF957i4/2a1QpzZ51O9Dzx2A3Qs5xtJM
	jVlTZflJlCS5QorsWCy3L8VsVTfWXk3hccYgpCtheUxoTRrhkYl4B0RhEunZLlVhHVl5
	FhzxfM55fGuKFnQaGJaGxeTrG4j2ti/5NLjQUfTUh4F4+ni10MO5NCv6g6NXg1qJrL8Q
	Kxhg==
X-Gm-Message-State: ALyK8tKHFhfE+mQ6NuCqHgOpZM8Ph6E+sFizUYbRGt4f7JqVYLDgVRTaGVcvoZB1yxVTE6iTIGSWRwrnSKP8/Fl6
X-Received: by 10.31.96.207 with SMTP id u198mr583305vkb.50.1467102871231;
	Tue, 28 Jun 2016 01:34:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Tue, 28 Jun 2016 01:34:11 -0700 (PDT)
In-Reply-To: <6276f949-6031-07fe-91f2-7037f0438302@kaod.org>
References: <1467045813-18144-1-git-send-email-clg@kaod.org>
	<1467045813-18144-6-git-send-email-clg@kaod.org>
	<bed58244-e877-aeda-d7c6-76d01540beb3@redhat.com>
	<6276f949-6031-07fe-91f2-7037f0438302@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jun 2016 09:34:11 +0100
Message-ID: <CAFEAcA-UkVQu49yTFx0PNbfB74=7iqAnV=a4BhSTGmXq-5BTog@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Subject: Re: [Qemu-devel] [PATCH v4 5/5] tests: add a m25p80 test
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
Cc: Kevin Wolf <kwolf@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0IAjGGvI9qxu

On 28 June 2016 at 09:32, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 06/28/2016 10:01 AM, Paolo Bonzini wrote:
>>
>>
>> On 27/06/2016 18:43, C=C3=A9dric Le Goater wrote:
>>>  check-qtest-arm-y =3D tests/ds1338-test$(EXESUF)
>>> +check-qtest-arm-y =3D tests/m25p80-test$(EXESUF)
>>
>> This should be a "+=3D".
>
> OK. I will fix the above line also then :
>
>         check-qtest-arm-y =3D tests/tmp105-test$(EXESUF)
>         check-qtest-arm-y =3D tests/ds1338-test$(EXESUF)

That's fixed in master.

thanks
-- PMM
