Received: by 10.25.150.194 with SMTP id y185csp162758lfd;
        Thu, 24 Nov 2016 05:40:05 -0800 (PST)
X-Received: by 10.200.56.186 with SMTP id f55mr1920629qtc.75.1479994805297;
        Thu, 24 Nov 2016 05:40:05 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f28si15121407qte.167.2016.11.24.05.40.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Nov 2016 05:40:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40116 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c9uFw-0002Gt-Ou
	for alex.bennee@linaro.org; Thu, 24 Nov 2016 08:40:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49140)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1c9uFs-0002GW-Ox
	for qemu-arm@nongnu.org; Thu, 24 Nov 2016 08:40:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1c9uFo-0001Aj-Py
	for qemu-arm@nongnu.org; Thu, 24 Nov 2016 08:40:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54714)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1c9uFo-00019F-Fr; Thu, 24 Nov 2016 08:39:56 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AD26BCA636;
	Thu, 24 Nov 2016 13:39:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-44.ams2.redhat.com
	[10.36.116.44])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uAODdpLT024008
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 24 Nov 2016 08:39:53 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 590441132C2F; Thu, 24 Nov 2016 14:39:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
References: <1479777133-23567-1-git-send-email-ehabkost@redhat.com>
	<20161122223450.GD21830@thinpad.lan.raisama.net>
	<20161123171047.GA27297@thinpad.lan.raisama.net>
Date: Thu, 24 Nov 2016 14:39:51 +0100
In-Reply-To: <20161123171047.GA27297@thinpad.lan.raisama.net> (Eduardo
	Habkost's message of "Wed, 23 Nov 2016 15:10:47 -0200")
Message-ID: <87oa15dmjc.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 24 Nov 2016 13:39:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] -nodefaults and available buses (was
 Re: [RFC 00/15] qmp: Report supported device types on 'query-machines')
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
	Alex Williamson <alex.williamson@redhat.com>, Jia Liu <proljc@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Michael Roth <mdroth@linux.vnet.ibm.com>,
	Beniamino Galvani <b.galvani@gmail.com>, libvir-list@redhat.com,
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Laine Stump <laine@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>,
	Andrea Bolognani <abologna@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JsGWFdglUC3u

Eduardo Habkost <ehabkost@redhat.com> writes:

> (CCing the maintainers of the machines that crash when using
> -nodefaults)
>
> On Tue, Nov 22, 2016 at 08:34:50PM -0200, Eduardo Habkost wrote:
> [...]
>> "default defaults" vs "-nodefault defaults"
>> -------------------------------------------
>> 
>> Two bad news:
>> 
>> 1) We need to differentiate buses created by the machine with
>>    "-nodefaults" and buses that are created only without
>>    "-nodefaults".
>> 
>> libvirt use -nodefaults when starting QEMU, so knowing which
>> buses are available when using -nodefaults is more interesting
>> for them.

Yes.

>> Other software, on the other hand, might be interested in the
>> results without -nodefaults.

Maybe.

Related: other machine options, such as usb=on.

>> We need to be able model both cases in the new interface.
>> Suggestions are welcome.
>
> The good news is that the list is short. The only[1] machines
> where the list of buses seem to change when using -nodefaults
> are:
>
> * mpc8544ds
> * ppce500
> * mpc8544ds
> * ppce500
> * s390-ccw-virtio-*
>
> On all cases above, the only difference is that a virtio bus is
> available if not using -nodefaults.
>
> Considering that the list is short, I plan to rename
> 'supported-device-types' to 'always-available-buses', and
> document that it will include only the buses that are not
> disabled by -nodefaults.
>
> [1] I mean, the only ones from the set that don't crash with
>     -nodefaults. The ones below could not be tested:
>
>> 2) A lot of machine-types won't start if using
>>    "-nodefaults -machine <machine>" without any extra devices or
>>    drives.
>> 
>> Lots of machines require some drives or devices to be created
>> (especially ARM machines that require a SD drive to be
>> available).
>> 
>> Some machines will make QEMU exit, some of them simply segfault.
>> I am looking for ways to work around it so we can still validate
>> -nodefaults-based info on the test code.
>
> The following machines won't work with -nodefaults:
>
> These make QEMU segfault:
> * cubieboard
> * petalogix-ml605
> * or32-sim
> * virtex-ml507
> * Niagara

Bugs.

> These exit with a "missing SecureDigital device" error:
> * akita
> * borzoi
> * cheetah
> * connex
> * mainstone
> * n800
> * n810
> * spitz
> * sx1
> * sx1-v1
> * terrier
> * tosa
> * verdex
> * z2

Bugs only if there is no other way to provide the SD device.  I believe
some variation if -drive if=sd,... should do fine.
