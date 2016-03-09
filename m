Received: by 10.25.208.211 with SMTP id h202csp2516248lfg;
        Wed, 9 Mar 2016 06:06:21 -0800 (PST)
X-Received: by 10.55.192.154 with SMTP id v26mr29927432qkv.36.1457532381086;
        Wed, 09 Mar 2016 06:06:21 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v10si8069092qge.63.2016.03.09.06.06.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 Mar 2016 06:06:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41747 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1adekm-0002YR-Ie
	for alex.bennee@linaro.org; Wed, 09 Mar 2016 09:06:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59402)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1adekh-0002WZ-6Y
	for qemu-arm@nongnu.org; Wed, 09 Mar 2016 09:06:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1adekb-0003sj-45
	for qemu-arm@nongnu.org; Wed, 09 Mar 2016 09:06:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56319)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1adeka-0003se-TY; Wed, 09 Mar 2016 09:06:09 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 5592D30248F;
	Wed,  9 Mar 2016 14:06:08 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-29.phx2.redhat.com
	[10.3.113.29])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u29E66kH011161; Wed, 9 Mar 2016 09:06:06 -0500
To: Paolo Bonzini <pbonzini@redhat.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
References: <1455288361-30117-1-git-send-email-peter.maydell@linaro.org>
	<56DD9C58.7050306@redhat.com>
	<CAFEAcA8C2VzkD=87W5Jn7X523cFZLZL6onxjKDoOcZsCPMQxZw@mail.gmail.com>
	<56DEBF6A.6070809@redhat.com>
	<CAKv+Gu9LzTTzdw5CSCDfpCyjSgB2h6+KawTTJQXSqJ7mhV_YdQ@mail.gmail.com>
	<CAKv+Gu8OgSK5+X71GLrvWLkcGcQ9=MuwOuFAsQroQTa3bWbHNA@mail.gmail.com>
	<56DEC234.70907@redhat.com>
	<CAKv+Gu-joM8MqtM=G_F7NLZEwpxLBMPeqimDwZv7yivTjYBFVQ@mail.gmail.com>
	<56DEC860.1060707@redhat.com>
	<CAKv+Gu91CH9WURYaLFtP7HHEm7Z18FMk19HXEWaj1=LBqM6mCQ@mail.gmail.com>
	<56DECE5F.6000207@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <56E02DCD.5060008@redhat.com>
Date: Wed, 9 Mar 2016 15:06:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56DECE5F.6000207@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/4] virt: provide secure-only
 RAM and first flash
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rU0pJnrS0/Bv

On 03/08/16 14:06, Paolo Bonzini wrote:
> On 08/03/2016 13:50, Ard Biesheuvel wrote:
>> Note that, for KVM, it is unlikely that we will ever support all of
>> this inside the guest. It makes *much* more sense to lock down the
>> emulated flash, and implement the UEFI Runtime Services using a thin
>> layer in UEFI that hooks up to interfaces exposed to the guest by
>> QEMU.
> 
> Well, it makes a bit less sense if the SMM code is already there for you
> to use. :)  More seriously, implementing secure boot on x86 KVM was
> "just" a matter of reading the architecture manual and chipset
> datasheets, and implementing what they said.  Likewise, the firmware
> work can reuse a large part of the work done for bare-metal hardware.
> Laszlo would kill me for saying this, :) but in terms of sheer SLOC his
> platform enablement patches were dwarfed by the SMM code that Intel
> contributed.  The SMM code in turn is _exactly_ the same on bare-metal
> and virt.

Your statement about the SLOC proportions is correct. And, while I could
try to depict (again) the challenges that regardless surfaced in the
platform enablement, this is not the right forum, so I'll save it. :)

However: despite reusing the core SMM code identically in the guest,
there is at least one stark behavioral difference: in QEMU the SMI is
raised only on the processor that triggers it. This exercises paths in
the core SMM code where processors have to count down timeouts and bring
each other in, and these busy loops are very visible to an interactive
user in certain circumstances.

For example, Windows installers seem to be absolutely crazy about
massaging UEFI variables -- the rotating animation rather crawls than
rotates for a minute. I traced KVM just the other day while the
installer was in this phase, and 2 VCPUs together produced about 30-50
"(entering|leaving) SMM" messages per second.

Laszlo

> Designing good PV interfaces is hard, designing secure PV interfaces is
> harder; reading a spec is easy.  To me, the only reason to do it in PV
> interfaces is that the hardware doesn't allow virtualization of EL3.
> 
> If the hardware makes you jump through extra hoops, sometimes it's
> necessary, sometimes it's not.  If it's not, rationalizing it is bad.  I
> cannot think of a good reason for hardware not to let you virtualize
> hypervisor or secure mode, or to force the hypervisor to use two-level
> page translation.
> 
> Paolo
> 

