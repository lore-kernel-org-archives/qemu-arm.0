Received: by 10.25.208.211 with SMTP id h202csp2447509lfg;
        Wed, 23 Mar 2016 05:22:02 -0700 (PDT)
X-Received: by 10.140.30.245 with SMTP id d108mr3052775qgd.31.1458735722249;
        Wed, 23 Mar 2016 05:22:02 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x189si1953190qhb.21.2016.03.23.05.22.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Mar 2016 05:22:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43769 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aihnV-0002Iq-PA
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 08:22:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50533)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aihnU-0002Il-6t
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 08:22:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aihnP-0000MP-6M
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 08:22:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36479)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1aihnO-0000ML-V7; Wed, 23 Mar 2016 08:21:55 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 79391804FF;
	Wed, 23 Mar 2016 12:21:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-21.ams2.redhat.com
	[10.36.116.21])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2NCLqZP008321
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 23 Mar 2016 08:21:54 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 46C39303F90D; Wed, 23 Mar 2016 13:21:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Xu <peterx@redhat.com>
References: <1458271654-23706-1-git-send-email-peterx@redhat.com>
	<1458271654-23706-2-git-send-email-peterx@redhat.com>
	<87zitqjrhj.fsf@blackfin.pond.sub.org>
	<87vb4eicdu.fsf@blackfin.pond.sub.org>
	<20160323025819.GD28183@pxdev.xzpeter.org>
	<87shzhbktm.fsf@blackfin.pond.sub.org>
	<20160323114830.GR28183@pxdev.xzpeter.org>
Date: Wed, 23 Mar 2016 13:21:52 +0100
In-Reply-To: <20160323114830.GR28183@pxdev.xzpeter.org> (Peter Xu's message of
	"Wed, 23 Mar 2016 19:48:30 +0800")
Message-ID: <8737rh8jvj.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
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
X-TUID: fETX/tJuirle

Peter Xu <peterx@redhat.com> writes:

> On Wed, Mar 23, 2016 at 10:33:09AM +0100, Markus Armbruster wrote:
>> Peter Xu <peterx@redhat.com> writes:
>> 
>> > On Tue, Mar 22, 2016 at 07:41:17PM +0100, Markus Armbruster wrote:
>> >> Markus Armbruster <armbru@redhat.com> writes:
>> >> >> +##
>> >> >> +# @GICCapability:
>> >> >> +#
>> >> >> +# This struct describes capability for a specific GIC version. These
>> >> >> +# bits are not only decided by QEMU/KVM software version, but also
>> >> >> +# decided by the hardware that the program is running upon.
>> >> >> +#
>> >> >> +# @version:  version of GIC to be described.
>> >> >> +#
>> >> >> +# @emulated: whether current QEMU/hardware supports emulated GIC
>> >> >> +#            device in user space.
>> >> >> +#
>> >> >> +# @kernel:   whether current QEMU/hardware supports hardware
>> >> >> +#            accelerated GIC device in kernel.
>> >> >> +#
>> >> >> +# Since: 2.6
>> >> >> +##
>> >> >> +{ 'struct': 'GICCapability',
>> >> >> +  'data': { 'version': 'int',
>> >> >> +            'emulated': 'bool',
>> >> >> +            'kernel': 'bool' } }
>
> [*] Marking here...
>
>> So GICCapability essentially tells its users whether certain
>> configurations have a chance to work.
>> 
>> I think what's missing in your patch is the connection from
>> GICCapability to the actual configuration options.  As is, you just have
>> to know what options the presence of each possible GICCapability value
>> unlocks.  It needs to be documented instead.
>
> What I understand is that, above [*] should have explained what does
> each entry mean. E.g., as mentioned in the qapi-schema, there are
> explainations about "version", "emulated" and "kernel" key words. If
> we go deeper into e.g., "emulated" key word, we will got:
>
> "whether current QEMU/hardware supports emulated GIC device in user
>  space."
>
> So this boolean will tell just as it is explained.
>
> Maybe I failed to get the point of your review comment... :( Would
> you please give an example on how should I better express this
> relationship?

Can you tell me what a management application is supposed to do with the
information returned by query-gic-capabilities?  Not just in general
terms, like "using this information, libvirt can warn the user during
configuration of guests when specified GIC device type is not supported,
but specifics.  Something like "-frobnicate mutter=mumble won't work
unless query-gic-capabilities reports emulated version 2 is supported"
for every piece of configuration that should be vetted against
query-gic-capabilities.

> (btw, I have updated the commit message in v6 for current patch, to
> tell more about why we need this, and why we decided to add this ad
> hoc command. I'd be glad if we can continue the discussion based on
> that one.  Thanks!)
