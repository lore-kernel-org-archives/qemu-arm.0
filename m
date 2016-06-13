Received: by 10.25.85.209 with SMTP id j200csp1114437lfb;
        Mon, 13 Jun 2016 03:06:36 -0700 (PDT)
X-Received: by 10.140.38.145 with SMTP id t17mr12937485qgt.10.1465812396861;
        Mon, 13 Jun 2016 03:06:36 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z191si8831165qhz.102.2016.06.13.03.06.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 03:06:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54962 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCOlQ-0007dd-7M
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 06:06:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55039)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bCOlL-0007cc-99
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 06:06:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bCOlG-0007u0-AR
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 06:06:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34892)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bCOlG-0007tu-51; Mon, 13 Jun 2016 06:06:26 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B2F1B25895;
	Mon, 13 Jun 2016 10:06:25 +0000 (UTC)
Received: from [10.36.112.17] (ovpn-112-17.ams2.redhat.com [10.36.112.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5DA6Kwt008653
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 13 Jun 2016 06:06:22 -0400
To: Peter Maydell <peter.maydell@linaro.org>
References: <1465808915-4887-1-git-send-email-vijayak@caviumnetworks.com>
	<1465808915-4887-4-git-send-email-vijayak@caviumnetworks.com>
	<16ef20d6-8c02-8617-0b6a-16fab76d3333@redhat.com>
	<CAFEAcA_0HXxBO7c0UjxuWbYgQv+nmP6JO7pHKKK8O53CWdG_fg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fb4bf179-fc78-5540-53ee-d572148633e5@redhat.com>
Date: Mon, 13 Jun 2016 12:06:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_0HXxBO7c0UjxuWbYgQv+nmP6JO7pHKKK8O53CWdG_fg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 13 Jun 2016 10:06:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC PATCH v1 3/4] translate-all.c: Compute L1 page
 table properties at runtime
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
Cc: Vijay Kilari <vijay.kilari@gmail.com>, Juan Quintela <quintela@redhat.com>,
	Vijaya Kumar K <vijayak@caviumnetworks.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>, Vijaya Kumar K <vijayak@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vNldH6/wtYaT



On 13/06/2016 11:36, Peter Maydell wrote:
>>>  /* The bottom level has pointers to PageDesc */
>>> >> -static void *l1_map[V_L1_SIZE];
>>> >> +static void *l1_map;
>> >
>> > You can make this array have a static V_L2_SIZE * 16 size too.  Peter,
>> > what do you think?
> I don't know this code well enough to have an informed view,
> but we only allocate this once at startup, right? I'm not sure
> why making it a static array would be better?

It makes accesses faster by avoiding a pointer load.  On one hand it
might be just microoptimization, on the other hand... death by one
thousand papercuts...

Paolo
