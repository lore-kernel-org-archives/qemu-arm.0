Received: by 10.25.21.96 with SMTP id l93csp2390304lfi;
        Wed, 22 Jun 2016 03:24:27 -0700 (PDT)
X-Received: by 10.55.130.1 with SMTP id e1mr36111396qkd.139.1466591067321;
        Wed, 22 Jun 2016 03:24:27 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k79si4704912qkl.33.2016.06.22.03.24.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Jun 2016 03:24:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57030 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFfKc-0001s1-Mp
	for alex.bennee@linaro.org; Wed, 22 Jun 2016 06:24:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49294)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bFfKY-0001gX-1S
	for qemu-arm@nongnu.org; Wed, 22 Jun 2016 06:24:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bFfKT-0007Ce-Mh
	for qemu-arm@nongnu.org; Wed, 22 Jun 2016 06:24:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37433)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bFfKT-0007CZ-GQ; Wed, 22 Jun 2016 06:24:17 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1A73581129;
	Wed, 22 Jun 2016 10:24:17 +0000 (UTC)
Received: from [10.36.112.60] (ovpn-112-60.ams2.redhat.com [10.36.112.60])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5MAODkU025136
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 22 Jun 2016 06:24:15 -0400
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>
References: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
	<1466528974-12183-7-git-send-email-peter.maydell@linaro.org>
	<20160621184552.p7trf4zpqnrmwruu@hawk.localdomain>
	<CAFEAcA_AnYGV0jy9HAUevHPB=FY3NP25-7BUpdbySZS-QPeGrg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <146dd497-f988-3b17-3f05-454ee7e97680@redhat.com>
Date: Wed, 22 Jun 2016 12:24:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_AnYGV0jy9HAUevHPB=FY3NP25-7BUpdbySZS-QPeGrg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 22 Jun 2016 10:24:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 6/6] hw/arm/virt: Set
 minimum_page_bits to 12
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
Cc: Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CqsBjExHoJXq



On 21/06/2016 21:47, Peter Maydell wrote:
>> >
>> > As this breaks migration, then I guess we also need
>> >
>> > @@ -1507,5 +1510,6 @@ static void virt_machine_2_6_options(MachineClass *mc)
>> >  {
>> >      virt_machine_2_7_options(mc);
>> >      SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_6);
>> > +    mc->minimum_page_bits = 10;
>> >  }
>> >  DEFINE_VIRT_MACHINE(2, 6)
> Doesn't hurt, but are we trying to claim migration
> compat between different QEMU versions with the
> versioned-machine names ?

For PC machines we are (but only towards newer QEMU versions).

Paolo
