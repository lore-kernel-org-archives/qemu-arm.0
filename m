Received: by 10.25.208.211 with SMTP id h202csp2217590lfg;
        Tue, 22 Mar 2016 20:02:25 -0700 (PDT)
X-Received: by 10.140.222.136 with SMTP id s130mr533492qhb.62.1458702145394;
        Tue, 22 Mar 2016 20:02:25 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a12si379069qha.52.2016.03.22.20.02.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Mar 2016 20:02:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40640 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aiZ3x-0007fT-1h
	for alex.bennee@linaro.org; Tue, 22 Mar 2016 23:02:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aiZ3v-0007fO-7E
	for qemu-arm@nongnu.org; Tue, 22 Mar 2016 23:02:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aiZ3q-0004Vo-76
	for qemu-arm@nongnu.org; Tue, 22 Mar 2016 23:02:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60800)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1aiZ3q-0004Vg-1O; Tue, 22 Mar 2016 23:02:18 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id F06B4804FA;
	Wed, 23 Mar 2016 03:02:16 +0000 (UTC)
Received: from pxdev.xzpeter.org (dhcp-14-238.nay.redhat.com [10.66.14.238])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2N2wS18010587
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 22 Mar 2016 22:59:57 -0400
Date: Wed, 23 Mar 2016 10:58:19 +0800
From: Peter Xu <peterx@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20160323025819.GD28183@pxdev.xzpeter.org>
References: <1458271654-23706-1-git-send-email-peterx@redhat.com>
	<1458271654-23706-2-git-send-email-peterx@redhat.com>
	<87zitqjrhj.fsf@blackfin.pond.sub.org>
	<87vb4eicdu.fsf@blackfin.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87vb4eicdu.fsf@blackfin.pond.sub.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, mdroth@linux.vnet.ibm.com,
	qemu-devel@nongnu.org, abologna@redhat.com, qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 1/5] arm: qmp: add
	GICCapability struct
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
X-TUID: RXwXD7oW9mGA

On Tue, Mar 22, 2016 at 07:41:17PM +0100, Markus Armbruster wrote:
> Markus Armbruster <armbru@redhat.com> writes:
> >> +##
> >> +# @GICCapability:
> >> +#
> >> +# This struct describes capability for a specific GIC version. These
> >> +# bits are not only decided by QEMU/KVM software version, but also
> >> +# decided by the hardware that the program is running upon.
> >> +#
> >> +# @version:  version of GIC to be described.
> >> +#
> >> +# @emulated: whether current QEMU/hardware supports emulated GIC
> >> +#            device in user space.
> >> +#
> >> +# @kernel:   whether current QEMU/hardware supports hardware
> >> +#            accelerated GIC device in kernel.
> >> +#
> >> +# Since: 2.6
> >> +##
> >> +{ 'struct': 'GICCapability',
> >> +  'data': { 'version': 'int',
> >> +            'emulated': 'bool',
> >> +            'kernel': 'bool' } }
> >
> > Are all four combinations of (emulated, kernel) possible?

Currently, version can only be 2 or 3. And for now, we should only
support:

- emulated/kernel support for v2
- kernel support for v3

and emulated v3 is still not supported.

> Moreover, what do the combinations mean from a practical point of view?
> What would a management application do with the information?

AFAIU, this command will mostly be used by libvirt. E.g., on ARM
host, user can choose which kind of GIC device he/she uses. However,
not all of them are supported, and it is decided by both the ARM
hardware and the software (here software should include at least
QEMU and the kernel version). With this command, libvirt can easily
know what is supported, and what is not.

So it can: warn the user before-hand during configuration like "GIC
emulated/kvm-accelerated version X is/isn't supported",

rather than: firstly, configuration success. After that, QEMU boot
failed with ambiguous error.

I can add more explainations into the commit message (some can be
added to the schema directly possibly) about why we need this
command, and what does every entry mean.

Thanks!

-- peterx
