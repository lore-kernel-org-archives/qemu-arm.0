Received: by 10.80.166.35 with SMTP id d32csp3307872edc;
        Tue, 25 Oct 2016 10:16:42 -0700 (PDT)
X-Received: by 10.176.69.202 with SMTP id u68mr8695898uau.165.1477415802571;
        Tue, 25 Oct 2016 10:16:42 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p15si831104uap.211.2016.10.25.10.16.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Oct 2016 10:16:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56618 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bz5L8-0005OI-0H
	for alex.bennee@linaro.org; Tue, 25 Oct 2016 13:16:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33694)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bz5Kj-00057R-EL
	for qemu-arm@nongnu.org; Tue, 25 Oct 2016 13:16:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bz5Kg-0004qA-60
	for qemu-arm@nongnu.org; Tue, 25 Oct 2016 13:16:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46742)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1bz5Kf-0004pn-W1; Tue, 25 Oct 2016 13:16:14 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 43F2F7AEA4;
	Tue, 25 Oct 2016 17:16:13 +0000 (UTC)
Received: from [10.10.55.191] (vpn-55-191.rdu2.redhat.com [10.10.55.191])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9PHGBEb030820; Tue, 25 Oct 2016 13:16:12 -0400
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>
References: <1477086782-10479-1-git-send-email-wei@redhat.com>
	<20161024084920.5qrrwa3wfdyr5kn5@hawk.localdomain>
	<155d69d3-c8fb-4ff1-7de9-ca72d4086ccb@redhat.com>
	<20161025073327.kbbabkrdsgfuypzt@kamzik.brq.redhat.com>
	<CAFEAcA_xEd9ic-s+R8Fp8WrbwC1cF4Tf3+7_MM_21CF3RhyOmg@mail.gmail.com>
	<CAFEAcA_ESsQZt=qbrLYLhZZE-GjLAKz7MjtCAsCpas7ZE=DA5A@mail.gmail.com>
From: Wei Huang <wei@redhat.com>
Message-ID: <cf0eded9-f396-24e2-7a7b-6a924edd7372@redhat.com>
Date: Tue, 25 Oct 2016 12:16:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_ESsQZt=qbrLYLhZZE-GjLAKz7MjtCAsCpas7ZE=DA5A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 25 Oct 2016 17:16:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V7 0/2] Add option to configure
 guest vPMU
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Andrea Bolognani <abologna@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c+8Gt8IVJXT3



On 10/25/2016 10:59 AM, Peter Maydell wrote:
> On 25 October 2016 at 16:26, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 25 October 2016 at 08:33, Andrew Jones <drjones@redhat.com> wrote:
>>> Yes, I prefer it to not being able to easily switch a command line from
>>> KVM to TCG. Granted, right now we mostly need to run with -cpu host for
>>> KVM, which also needs to be switched for TCG. However that will hopefully
>>> change with Shannon's work.
>>
>> If the TCG default is different from the KVM default then you
>> will have problems with switching it anyway, because it will
>> silently change behaviour underfoot. I think we should avoid that...
> 
> So here's my suggestion: we should just not worry about printing
> a warning for not actually honouring the "please give me a PMU"
> flag under TCG. At some point we'll actually implement it,
> at which point the problem goes away. In the meantime (a) not
> providing a PMU and not bothering to say so is what we were
> doing before, and (b) there's lots of bits of the CPU that we
> don't actually yet implement in TCG but which will appear as
> we fix bugs in the emulation.

This is easy to implement. If Drew is OK with silence under TCG mode, I
will send V8 out.

> 
> thanks
> -- PMM
> 
