Received: by 10.25.208.137 with SMTP id h131csp1487261lfg;
        Mon, 9 May 2016 03:27:48 -0700 (PDT)
X-Received: by 10.140.156.81 with SMTP id c78mr36317823qhc.58.1462789668263;
        Mon, 09 May 2016 03:27:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a20si18205292qkc.140.2016.05.09.03.27.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 May 2016 03:27:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40466 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aziPj-0006in-Pj
	for alex.bennee@linaro.org; Mon, 09 May 2016 06:27:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1aziPi-0006hA-07
	for qemu-arm@nongnu.org; Mon, 09 May 2016 06:27:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1aziPe-00023A-Og
	for qemu-arm@nongnu.org; Mon, 09 May 2016 06:27:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57314)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1aziPe-00022K-Jd; Mon, 09 May 2016 06:27:42 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6CCE081F03;
	Mon,  9 May 2016 10:27:41 +0000 (UTC)
Received: from [10.36.112.65] (ovpn-112-65.ams2.redhat.com [10.36.112.65])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u49ARbk4020076
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 9 May 2016 06:27:39 -0400
To: Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Sylvain Garrigues <sylvain@sylvaingarrigues.com>
References: <1461235306-3393-1-git-send-email-sylvain@sylvaingarrigues.com>
	<BLUPR0301MB20342C97DD66FA58E3462B889E6F0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<19E314DF-2836-4020-94F1-4D1B39CD6E6C@sylvaingarrigues.com>
	<BLUPR0301MB203485DA67E205999C1F0AC49E6F0@BLUPR0301MB2034.namprd03.prod.outlook.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <57306626.6050702@redhat.com>
Date: Mon, 9 May 2016 12:27:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.1
MIME-Version: 1.0
In-Reply-To: <BLUPR0301MB203485DA67E205999C1F0AC49E6F0@BLUPR0301MB2034.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] bcm2835_property: use cached
 values when querying framebuffer
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g8ND+mIpHMaR



On 22/04/2016 13:30, Andrew Baumann wrote:
>> From: Sylvain Garrigues [mailto:sylvain@sylvaingarrigues.com]
>> Sent: Friday, 22 April 2016 13:27
>>
>> Le 22 avr. 2016 =C3=A0 13:22, Andrew Baumann
>> <Andrew.Baumann@microsoft.com> a =C3=A9crit :
>>>> +            stl_le_phys(&s->dma_as, value + 16, tmp_xres * tmp_yres
>>>> + * (tmp_bpp >> 3));
>>>
>>> Personal style nit: I prefer * 8 rather than >> 3, because it's more =
immediately
>> obvious what you're computing, a trivial optimisation for the compiler

Note that it's only trivial for unsigned dividend.  A signed dividend
has >> rounding towards -infinity and / rounding towards zero.

Paolo
