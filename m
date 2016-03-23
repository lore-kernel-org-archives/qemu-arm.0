Received: by 10.25.208.211 with SMTP id h202csp2369064lfg;
        Wed, 23 Mar 2016 02:44:15 -0700 (PDT)
X-Received: by 10.140.28.98 with SMTP id 89mr2019528qgy.36.1458726255241;
        Wed, 23 Mar 2016 02:44:15 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f81si1470116qkb.82.2016.03.23.02.44.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Mar 2016 02:44:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42202 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aifKo-0006zV-SG
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 05:44:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aifKl-0006zC-B8
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 05:44:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aifKh-0004Cq-BY
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 05:44:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60042)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1aifKh-0004Ci-67; Wed, 23 Mar 2016 05:44:07 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id B09D93B709;
	Wed, 23 Mar 2016 09:44:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-21.ams2.redhat.com
	[10.36.116.21])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2N9i5ZQ000853
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 23 Mar 2016 05:44:06 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 8EB31303F90D; Wed, 23 Mar 2016 10:44:04 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Xu <peterx@redhat.com>
References: <1458271654-23706-1-git-send-email-peterx@redhat.com>
	<1458271654-23706-2-git-send-email-peterx@redhat.com>
	<56F18FBC.3030909@redhat.com>
	<20160323030918.GE28183@pxdev.xzpeter.org>
Date: Wed, 23 Mar 2016 10:44:04 +0100
In-Reply-To: <20160323030918.GE28183@pxdev.xzpeter.org> (Peter Xu's message of
	"Wed, 23 Mar 2016 11:09:18 +0800")
Message-ID: <87mvppbkbf.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, mdroth@linux.vnet.ibm.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, abologna@redhat.com,
	Eric Blake <eblake@redhat.com>
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
X-TUID: gDugbKP3sD2X

Peter Xu <peterx@redhat.com> writes:

> On Tue, Mar 22, 2016 at 12:32:28PM -0600, Eric Blake wrote:
>> On 03/17/2016 09:27 PM, Peter Xu wrote:
>> > +##
>> > +# @GICCapability:
>> > +#
>> > +# This struct describes capability for a specific GIC version. These
>> 
>> Might be nice to spell out what the acronym GIC means, but that's cosmetic.
>
> Ah! I thought I have added that... It's missing again. Will do in
> next spin.
>
>> 
>> > +# bits are not only decided by QEMU/KVM software version, but also
>> > +# decided by the hardware that the program is running upon.
>> > +#
>> > +# @version:  version of GIC to be described.
>> > +#
>> > +# @emulated: whether current QEMU/hardware supports emulated GIC
>> > +#            device in user space.
>> > +#
>> > +# @kernel:   whether current QEMU/hardware supports hardware
>> > +#            accelerated GIC device in kernel.
>> > +#
>> > +# Since: 2.6
>> > +##
>> > +{ 'struct': 'GICCapability',
>> > +  'data': { 'version': 'int',
>> > +            'emulated': 'bool',
>> > +            'kernel': 'bool' } }
>> > 
>> 
>> I might have squashed this with the patch that first uses GICCapability,
>> as defining a type in isolation doesn't do much.
>
> I can do the squash in next spin if you prefer that one. Actually I
> got this question before, about when I should split and when to
> squash. E.g., shall I make sure that I should have no "definition
> only" patches in the future?

Depends.

The general rule is to keep separate things separate, and patches
self-contained.  The narrow sense of self-contained is each patch
compiles and works.  The wider sense is each patch makes sense to its
readers on its own.  You can't always have a perfect score on the
latter, but you should try.

Adding a definition without a user is generally not advised, because you
generally need to see the user to make sense of it.

For a complex feature, adding its abstract interface before its concrete
implementation may help liberate interface review from implementation
details.

Note that your interface consists of type GICCapability and command
query-gic-capabilities.  You could add just the interface with a stub
implementation first, then flesh out the implementation.  But I doubt
the thing is complex enough to justify that.
