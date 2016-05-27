Received: by 10.25.27.66 with SMTP id b63csp60104lfb;
        Fri, 27 May 2016 02:42:43 -0700 (PDT)
X-Received: by 10.140.201.143 with SMTP id w137mr12815119qha.66.1464342163011;
        Fri, 27 May 2016 02:42:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 66si7714221qgz.58.2016.05.27.02.42.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 May 2016 02:42:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44872 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b6EHy-0007eR-H3
	for alex.bennee@linaro.org; Fri, 27 May 2016 05:42:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58563)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1b6EHu-0007e6-9R
	for qemu-arm@nongnu.org; Fri, 27 May 2016 05:42:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1b6EHo-0000oj-Ab
	for qemu-arm@nongnu.org; Fri, 27 May 2016 05:42:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41577)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1b6EHo-0000oe-4Y; Fri, 27 May 2016 05:42:32 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A3689C04B327;
	Fri, 27 May 2016 09:42:31 +0000 (UTC)
Received: from [10.36.112.66] (ovpn-112-66.ams2.redhat.com [10.36.112.66])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4R9gQt8014843
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 27 May 2016 05:42:28 -0400
To: Peter Maydell <peter.maydell@linaro.org>,
	xiaoqiang zhao <zxq_yx_007@163.com>
References: <1464173896-4088-1-git-send-email-zxq_yx_007@163.com>
	<1464173896-4088-2-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA8oEjC0wUudEpKKmtbk86eB87KOh-__QB+GrcW6LFy5uA@mail.gmail.com>
	<5747AB8C.7040502@163.com>
	<CAFEAcA8XO+6y8LoVnPa-WVKT2+HFFYC8KS5i0yHCa2jjingR=w@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bf2900b6-980f-6a0c-fabe-6037b7592647@redhat.com>
Date: Fri, 27 May 2016 11:42:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8XO+6y8LoVnPa-WVKT2+HFFYC8KS5i0yHCa2jjingR=w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 27 May 2016 09:42:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/6] hw/char: QOM'ify pl011 model
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
Cc: Rob Herring <robh@kernel.org>, Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?B?0JDQvdGC0L7QvSDQn9Cw0LLQu9C+0LI=?= <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0/nwqHSiJmPU



On 27/05/2016 11:01, Peter Maydell wrote:
>> > I found bcm2835-peripherals is only used by bcm2836 code, you mean
>> > this(bcm2836) is the 'board level' and I should set chardev properties here?
> Device models subclass DeviceClass (possibly indirectly).
> Boards subclass MachineClass. Only boards should be looking
> at serial_hds[]. Sometimes you have a device which is just
> a "container" which encapsulates several other devices
> (typically this is a model of an SoC). For that kind of
> container device, it should expose chardev properties for
> its UARTs, which will usually be alias properties for
> the properties on the actual UART devices which the
> container has.
> 
> bcm2835-peripherals is a device, not a board, so it shouldn't
> be using serial_hds[].
> 
> If it's clearer, you can use a separate patch to push the
> serial_hds[] usage out another layer, rather than folding
> it into this one.

I agree.  This patch is fine (perhaps with the FIXME comment left
there); then chardev properties can be added to bcm2835-peripherals and
set in bcm2836.

Thanks,

Paolo
