Received: by 10.25.21.96 with SMTP id l93csp1488068lfi;
        Mon, 4 Jul 2016 05:11:52 -0700 (PDT)
X-Received: by 10.55.59.196 with SMTP id i187mr14650725qka.167.1467634311954;
        Mon, 04 Jul 2016 05:11:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q38si1819844qkq.62.2016.07.04.05.11.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jul 2016 05:11:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47121 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bK2j9-0001tX-Ay
	for alex.bennee@linaro.org; Mon, 04 Jul 2016 08:11:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40908)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bK2j6-0001sN-41
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 08:11:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bK2j4-0001uE-2W
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 08:11:47 -0400
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:32774)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bK2j3-0001u5-Uc
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 08:11:45 -0400
Received: by mail-vk0-x236.google.com with SMTP id k68so142439396vkb.0
	for <qemu-arm@nongnu.org>; Mon, 04 Jul 2016 05:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=KBLDatpozLcJx0IRUqHyYRtxSneLnSl7edVUFqdaA0E=;
	b=SZCM7WzV3eS16dhaNhusw5eYLToW5fSGXRTrl95OFHYTur4Cv5qbxUyNRvTzSm6fny
	PwuI97Su0pHIeno4JhaiTczhrvsUoGCCIEhHUrXMQ8U2w0rgn8mdXI6I3JmAs+6jjvK0
	0zV51LnipiDdiwA8TleevwJmVUp+EuR2BJQCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=KBLDatpozLcJx0IRUqHyYRtxSneLnSl7edVUFqdaA0E=;
	b=K4AhHy0dZmIpWaYY+cejZJPolQeV1/Vqyn4IlRUYZ/ummo1yWYVTlOk8ZXk9A7PY0T
	kwvNtnnnpWFbbAJrmjJiAJ5nyPUkx1nMofJaI2R5Zi/gLYiUDZVehQggCS3fVPdTOZmA
	Q+S95hbmwDCWnILJC2PiuSzs8ZRqvYF9CAjd01MAWCfkahwF442PnXHObIhpOEdundo0
	Tmh1gouoWUt0oQq03tJh5MPpV4hXhmKHeQwjPnA6AcLZMYrgibv1hVhh/j0GYc3yNczo
	/9zBbhypWuoiwNZ6PfGJVlRw95RwkaFHyyaEQRUY74gd27wiB+7gQq1dBLmFaXdppmxi
	i7gg==
X-Gm-Message-State: ALyK8tK38fio12t0lxCI23scC+xpVnIWmAick6BNeSA2HNsU04ZuhMdYjAN39PFWgBcg/nMH+sXpMksCcaUqxi2J
X-Received: by 10.159.37.245 with SMTP id 108mr5132032uaf.66.1467634305463;
	Mon, 04 Jul 2016 05:11:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.242.75 with HTTP; Mon, 4 Jul 2016 05:11:26 -0700 (PDT)
In-Reply-To: <b7a505f6-459f-377d-9e88-c42ba1b2897c@kaod.org>
References: <1467138270-32481-1-git-send-email-clg@kaod.org>
	<1467138270-32481-10-git-send-email-clg@kaod.org>
	<5778025A.9020608@gmail.com>
	<8ace1056-de8d-cfbb-9e63-e0e26df71952@kaod.org>
	<CAFEAcA8Mrxj8y=MiHv0RpqNijAGrSS71wpT2JYU6k0okAqM=nw@mail.gmail.com>
	<b7a505f6-459f-377d-9e88-c42ba1b2897c@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2016 13:11:26 +0100
Message-ID: <CAFEAcA-26vuv+7uXBfzzccydOjeg1eG=YVCqnXEfcLuDW=fdBQ@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 9/9] tests: add a m25p80 test
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
Cc: Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"mar.krzeminski" <mar.krzeminski@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j1wW60Gr11vX

On 4 July 2016 at 13:01, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 07/04/2016 01:14 PM, Peter Maydell wrote:
>> What is the test actually supposed to be doing?
>> writel() says "write this 32 bit value as if the (guest) CPU
>> wrote it to memory with a 32-bit write instruction".
>
> The test (and the guest) is writing and reading data on the memory
> region used by the SPI controller. This 'data' is then passed on
> to the SPI flash module objects which expects BE order when there
> are flash storage addresses are in the flow.
>
> So I think the test needs to use mem{write,read} and not write*.
> The result looks correct in the code. I will send a patchset
> right after starting with this patch.

If you were writing this test in a bit of native ARM code
running in the guest, how would you write it?
memread/memwrite are only the correct answer if you'd write
the native arm code as something like
memcpy(SPI_REGISTER, buf, len), which is not generally the
way you talk to devices.

thanks
-- PMM
