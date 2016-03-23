Received: by 10.25.208.211 with SMTP id h202csp2363452lfg;
        Wed, 23 Mar 2016 02:33:22 -0700 (PDT)
X-Received: by 10.55.74.197 with SMTP id x188mr2009297qka.104.1458725602750;
        Wed, 23 Mar 2016 02:33:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d201si1461688qkb.37.2016.03.23.02.33.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Mar 2016 02:33:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42122 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aifAI-0000N0-BW
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 05:33:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53444)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aifAC-0000Mh-9l
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 05:33:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aifA8-0004RC-8E
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 05:33:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52517)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1aifA8-0004R7-0W; Wed, 23 Mar 2016 05:33:12 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 9EF626445D;
	Wed, 23 Mar 2016 09:33:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-21.ams2.redhat.com
	[10.36.116.21])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2N9X9lj024588
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 23 Mar 2016 05:33:11 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 5DADA303F90D; Wed, 23 Mar 2016 10:33:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Xu <peterx@redhat.com>
References: <1458271654-23706-1-git-send-email-peterx@redhat.com>
	<1458271654-23706-2-git-send-email-peterx@redhat.com>
	<87zitqjrhj.fsf@blackfin.pond.sub.org>
	<87vb4eicdu.fsf@blackfin.pond.sub.org>
	<20160323025819.GD28183@pxdev.xzpeter.org>
Date: Wed, 23 Mar 2016 10:33:09 +0100
In-Reply-To: <20160323025819.GD28183@pxdev.xzpeter.org> (Peter Xu's message of
	"Wed, 23 Mar 2016 10:58:19 +0800")
Message-ID: <87shzhbktm.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 23 Mar 2016 09:33:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-devel@nongnu.org,
	mdroth@linux.vnet.ibm.com, abologna@redhat.com, qemu-arm@nongnu.org
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
X-TUID: nB50vWIMCVw/

Peter Xu <peterx@redhat.com> writes:

> On Tue, Mar 22, 2016 at 07:41:17PM +0100, Markus Armbruster wrote:
>> Markus Armbruster <armbru@redhat.com> writes:
>> >> +##
>> >> +# @GICCapability:
>> >> +#
>> >> +# This struct describes capability for a specific GIC version. These
>> >> +# bits are not only decided by QEMU/KVM software version, but also
>> >> +# decided by the hardware that the program is running upon.
>> >> +#
>> >> +# @version:  version of GIC to be described.
>> >> +#
>> >> +# @emulated: whether current QEMU/hardware supports emulated GIC
>> >> +#            device in user space.
>> >> +#
>> >> +# @kernel:   whether current QEMU/hardware supports hardware
>> >> +#            accelerated GIC device in kernel.
>> >> +#
>> >> +# Since: 2.6
>> >> +##
>> >> +{ 'struct': 'GICCapability',
>> >> +  'data': { 'version': 'int',
>> >> +            'emulated': 'bool',
>> >> +            'kernel': 'bool' } }
>> >
>> > Are all four combinations of (emulated, kernel) possible?
>
> Currently, version can only be 2 or 3. And for now, we should only
> support:
>
> - emulated/kernel support for v2
> - kernel support for v3
>
> and emulated v3 is still not supported.
>
>> Moreover, what do the combinations mean from a practical point of view?
>> What would a management application do with the information?
>
> AFAIU, this command will mostly be used by libvirt. E.g., on ARM
> host, user can choose which kind of GIC device he/she uses. However,
> not all of them are supported, and it is decided by both the ARM
> hardware and the software (here software should include at least
> QEMU and the kernel version). With this command, libvirt can easily
> know what is supported, and what is not.
>
> So it can: warn the user before-hand during configuration like "GIC
> emulated/kvm-accelerated version X is/isn't supported",
>
> rather than: firstly, configuration success. After that, QEMU boot
> failed with ambiguous error.
>
> I can add more explainations into the commit message (some can be
> added to the schema directly possibly) about why we need this
> command, and what does every entry mean.

So GICCapability essentially tells its users whether certain
configurations have a chance to work.

I think what's missing in your patch is the connection from
GICCapability to the actual configuration options.  As is, you just have
to know what options the presence of each possible GICCapability value
unlocks.  It needs to be documented instead.
