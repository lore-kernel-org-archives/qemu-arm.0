Received: by 10.25.150.194 with SMTP id y185csp2269055lfd;
        Tue, 22 Nov 2016 14:39:16 -0800 (PST)
X-Received: by 10.200.56.228 with SMTP id g33mr4415qtc.140.1479854356699;
        Tue, 22 Nov 2016 14:39:16 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f67si17675920qkj.69.2016.11.22.14.39.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Nov 2016 14:39:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58344 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c9Jid-0008GS-JP
	for alex.bennee@linaro.org; Tue, 22 Nov 2016 17:39:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1c9JiZ-0008GB-Vz
	for qemu-arm@nongnu.org; Tue, 22 Nov 2016 17:39:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1c9JiV-0002qa-W3
	for qemu-arm@nongnu.org; Tue, 22 Nov 2016 17:39:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44010)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1c9JiV-0002pu-Pt; Tue, 22 Nov 2016 17:39:07 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 745B761BB0;
	Tue, 22 Nov 2016 22:39:06 +0000 (UTC)
Received: from [10.36.112.26] (ovpn-112-26.ams2.redhat.com [10.36.112.26])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uAMMd2QX002007
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 22 Nov 2016 17:39:04 -0500
To: "Alastair D'Silva" <alastair@au1.ibm.com>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org
References: <1479357400-17441-1-git-send-email-alastair@au1.ibm.com>
	<1479357400-17441-3-git-send-email-alastair@au1.ibm.com>
	<debe3f9c-d3ec-aad0-0424-7228bf60765b@kaod.org>
	<3888651b-fd60-e827-a9f8-575a8f01be72@redhat.com>
	<1479853887.11116.95.camel@au1.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6d4e34f8-4b0b-85f2-93d6-6f0b3e2e7fb3@redhat.com>
Date: Tue, 22 Nov 2016 23:39:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1479853887.11116.95.camel@au1.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 22 Nov 2016 22:39:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 2/4] qtest: Support named interrupts
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nhk7G2Gxz/A7



On 22/11/2016 23:31, Alastair D'Silva wrote:
>>>> > > > +        if (irq == NULL) {
>>>> > > > +            qtest_send_prefix(chr);
>>>> > > > +            qtest_send(chr, "FAIL Unknown IRQ\n");
>>>> > > > +            return;
>>>> > > > +        }
>>>> > > > +
>>>> > > > +        qemu_set_irq(irq, level);
>> > 
>> > This seems wrong.  The IRQ should not be modifiable by the test.
>> > 
>> > Paolo
>> > 
> Thanks Paolo, could you please advise as to why that is?
> 
> The situation I am addressing is that I device under test that changes
> behaviour when a GPIO line is raised. Is there another way I should be
> raising that line from within qtest?

What causes the GPIO line to be raised in the normal emulated case?

Paolo
