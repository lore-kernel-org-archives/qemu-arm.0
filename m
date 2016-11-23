Received: by 10.25.150.194 with SMTP id y185csp2676778lfd;
        Wed, 23 Nov 2016 09:28:02 -0800 (PST)
X-Received: by 10.200.35.250 with SMTP id r55mr4105834qtr.161.1479922082141;
        Wed, 23 Nov 2016 09:28:02 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u189si19940390qkh.94.2016.11.23.09.28.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Nov 2016 09:28:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35264 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c9bKz-0003A5-IO
	for alex.bennee@linaro.org; Wed, 23 Nov 2016 12:28:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45207)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1c9b4T-0006Xp-25
	for qemu-arm@nongnu.org; Wed, 23 Nov 2016 12:11:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1c9b4O-0000z3-5E
	for qemu-arm@nongnu.org; Wed, 23 Nov 2016 12:10:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57456)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1c9b4N-0000xo-R2; Wed, 23 Nov 2016 12:10:52 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E7E923B70D;
	Wed, 23 Nov 2016 17:10:49 +0000 (UTC)
Received: from localhost (ovpn-116-207.phx2.redhat.com [10.3.116.207])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uANHAmFm015175; Wed, 23 Nov 2016 12:10:49 -0500
Date: Wed, 23 Nov 2016 15:10:47 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20161123171047.GA27297@thinpad.lan.raisama.net>
References: <1479777133-23567-1-git-send-email-ehabkost@redhat.com>
	<20161122223450.GD21830@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161122223450.GD21830@thinpad.lan.raisama.net>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 23 Nov 2016 17:10:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] -nodefaults and available buses (was Re: [Qemu-devel]
 [RFC 00/15] qmp: Report supported device types on 'query-machines')
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jia Liu <proljc@gmail.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Michael Roth <mdroth@linux.vnet.ibm.com>, Greg Kurz <groug@kaod.org>,
	Beniamino Galvani <b.galvani@gmail.com>, libvir-list@redhat.com,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Laine Stump <laine@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrea Bolognani <abologna@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XPA74oTF7ReC

(CCing the maintainers of the machines that crash when using
-nodefaults)

On Tue, Nov 22, 2016 at 08:34:50PM -0200, Eduardo Habkost wrote:
[...]
> "default defaults" vs "-nodefault defaults"
> -------------------------------------------
> 
> Two bad news:
> 
> 1) We need to differentiate buses created by the machine with
>    "-nodefaults" and buses that are created only without
>    "-nodefaults".
> 
> libvirt use -nodefaults when starting QEMU, so knowing which
> buses are available when using -nodefaults is more interesting
> for them.
> 
> Other software, on the other hand, might be interested in the
> results without -nodefaults.
> 
> We need to be able model both cases in the new interface.
> Suggestions are welcome.

The good news is that the list is short. The only[1] machines
where the list of buses seem to change when using -nodefaults
are:

* mpc8544ds
* ppce500
* mpc8544ds
* ppce500
* s390-ccw-virtio-*

On all cases above, the only difference is that a virtio bus is
available if not using -nodefaults.

Considering that the list is short, I plan to rename
'supported-device-types' to 'always-available-buses', and
document that it will include only the buses that are not
disabled by -nodefaults.

[1] I mean, the only ones from the set that don't crash with
    -nodefaults. The ones below could not be tested:

> 2) A lot of machine-types won't start if using
>    "-nodefaults -machine <machine>" without any extra devices or
>    drives.
> 
> Lots of machines require some drives or devices to be created
> (especially ARM machines that require a SD drive to be
> available).
> 
> Some machines will make QEMU exit, some of them simply segfault.
> I am looking for ways to work around it so we can still validate
> -nodefaults-based info on the test code.

The following machines won't work with -nodefaults:

These make QEMU segfault:
* cubieboard
* petalogix-ml605
* or32-sim
* virtex-ml507
* Niagara

These exit with a "missing SecureDigital device" error:
* akita
* borzoi
* cheetah
* connex
* mainstone
* n800
* n810
* spitz
* sx1
* sx1-v1
* terrier
* tosa
* verdex
* z2

-- 
Eduardo
