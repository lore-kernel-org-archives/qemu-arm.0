Received: by 10.25.0.144 with SMTP id 138csp806425lfa;
        Thu, 20 Apr 2017 09:13:09 -0700 (PDT)
X-Received: by 10.55.125.132 with SMTP id y126mr8304667qkc.314.1492704789193;
        Thu, 20 Apr 2017 09:13:09 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b38si6335785qtc.26.2017.04.20.09.13.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 20 Apr 2017 09:13:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54931 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d1Ehg-0001U7-L2
	for alex.bennee@linaro.org; Thu, 20 Apr 2017 12:13:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35474)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1d1EhX-0001Ty-CR
	for qemu-arm@nongnu.org; Thu, 20 Apr 2017 12:13:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1d1EhU-0001HA-M0
	for qemu-arm@nongnu.org; Thu, 20 Apr 2017 12:12:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60586)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1d1EhU-0001Gj-Cv; Thu, 20 Apr 2017 12:12:56 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BF7133B70F;
	Thu, 20 Apr 2017 16:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com BF7133B70F
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com BF7133B70F
Received: from blackfin.pond.sub.org (ovpn-116-149.ams2.redhat.com
	[10.36.116.149])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63EB1827B0;
	Thu, 20 Apr 2017 16:12:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B1CAB1138646; Thu, 20 Apr 2017 18:12:42 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
References: <20170419222258.13415-1-eblake@redhat.com>
	<87k26fffxa.fsf@dusky.pond.sub.org>
	<20170420120922.GJ20955@redhat.com>
	<1f4e72ed-fab1-7099-768e-2a111df3a633@redhat.com>
Date: Thu, 20 Apr 2017 18:12:42 +0200
In-Reply-To: <1f4e72ed-fab1-7099-768e-2a111df3a633@redhat.com> (Eric Blake's
	message of "Thu, 20 Apr 2017 08:20:11 -0500")
Message-ID: <87r30n83d1.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 20 Apr 2017 16:12:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] event: Add source
 information to SHUTDOWN
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
	"open list:Overall" <kvm@vger.kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Cor nelia Huck <cornelia.huck@de.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Rob Herring <robh@kernel.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Alexander Graf <agraf@suse.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"open list:Calxeda Highbank" <qemu-arm@nongnu.org>,
	Jan Kiszka <jan.kiszka@web.de>, Paolo Bonzini <pbonzini@redhat.com>,
	Scott Wood <scottwood@freescale.com>, Richard Henderson <rth@twiddle.net>,
	"Daniel P. Berrange" <berrange@redhat.com>,
	Paul Burton <paul.burton@imgtec.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, Michael Walle <michael@walle.cc>,
	"open list:New World" <qemu-ppc@nongnu.org>,
	Yongbok Kim <yongbok.kim@imgtec.com>, Igor Mammedov <imammedo@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v8f2cwItoj/w

Eric Blake <eblake@redhat.com> writes:

> On 04/20/2017 07:09 AM, Daniel P. Berrange wrote:
>
>>>> +++ b/qapi/event.json
>>>> @@ -10,6 +10,10 @@
>>>>  # Emitted when the virtual machine has shut down, indicating that qemu is
>>>>  # about to exit.
>>>>  #
>>>> +# @guest: If true, the shutdown was triggered by a guest request (such as
>>>> +# executing a halt instruction) rather than a host request (such as sending
>>>> +# qemu a SIGINT). (since 2.10)
>>>> +#
>>>
>>> "executing a halt instruction" suggests "halt" is a machine instruction.
>
> Which is indeed what most of the places I patched to pass 'true' are
> emulating - the machine halt instruction.
>
>>> I think you mean /usr/sbin/halt.  Suggest something like "executing a
>>> halt command".
>> 
>> Well technically /usr/sbin/halt just terminates all processes / kernel and
>> halts CPUs, but the virtual machine is still active (and a 'reset' in the
>> monitor can start it again. /usr/sbin/poweroff is what actually does the
>> ACPI poweroff to trigger QEMU to exit[1]
>
> I'm thinking of this wording:
>
> triggered by a guest request (such as the guest running
> /usr/sbin/poweroff to trigger an ACPI shutdown or machine halt instruction)

A quick glance at the patch suggests the instructions in question are
typically writes to some device register.  I wouldn't call them "halt
instructions", in particular since there's the x86 "hlt" instruction
that does something else.
