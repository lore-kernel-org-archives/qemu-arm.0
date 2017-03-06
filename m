Received: by 10.25.0.147 with SMTP id 141csp1359488lfa;
        Mon, 6 Mar 2017 05:04:16 -0800 (PST)
X-Received: by 10.200.3.157 with SMTP id t29mr15325403qtg.110.1488805456311;
        Mon, 06 Mar 2017 05:04:16 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y43si7581644qty.290.2017.03.06.05.04.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Mar 2017 05:04:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43743 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cksJB-0005zu-Qk
	for alex.bennee@linaro.org; Mon, 06 Mar 2017 08:04:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49976)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1cksJ7-0005zK-2X
	for qemu-arm@nongnu.org; Mon, 06 Mar 2017 08:04:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1cksJ1-0001Re-4L
	for qemu-arm@nongnu.org; Mon, 06 Mar 2017 08:04:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60966)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1cksJ0-0001RU-V9; Mon, 06 Mar 2017 08:04:03 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E0DD23B721;
	Mon,  6 Mar 2017 13:04:01 +0000 (UTC)
Received: from [10.36.117.21] (ovpn-117-21.ams2.redhat.com [10.36.117.21])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v26D3w9m016419
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 6 Mar 2017 08:04:00 -0500
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20170305214857.9510-1-krzk@kernel.org>
	<20170305214857.9510-3-krzk@kernel.org>
	<2130c1b2-0f81-13f6-a1f8-c0a2e294e3f0@amsat.org>
	<CAFEAcA8DOfstrMiEBLsgf6U6S9uT9ahA1ALrJdmQhcV+7K8Obw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4989d5b6-586a-de18-e8e6-6ab9e9ac131c@redhat.com>
Date: Mon, 6 Mar 2017 14:03:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8DOfstrMiEBLsgf6U6S9uT9ahA1ALrJdmQhcV+7K8Obw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 06 Mar 2017 13:04:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 3/3] hw/misc/exynos4210_pmu: Reorder local
 variables for readability
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k8k9ETZwj2VG



On 06/03/2017 10:46, Peter Maydell wrote:
> On 6 March 2017 at 04:06, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>> your change seems OK but while you are here, 'unsigned' is considered
>> harmful since more than a decade.
>=20
> Considered harmful by who, and why?

It is true that unsigned has all the disadvantages of "int" (it may be
smaller than the size of the object" and all the disadvantages of
"size_t" (it doesn't optimize as well because the compiler cannot
exploit undefined behavior).

I wouldn't call it harmful, but it feels like the worst of both worlds.

Paolo
