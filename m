Received: by 10.25.208.211 with SMTP id h202csp2428069lfg;
        Wed, 23 Mar 2016 04:48:57 -0700 (PDT)
X-Received: by 10.140.100.246 with SMTP id s109mr2724158qge.35.1458733737626;
        Wed, 23 Mar 2016 04:48:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u24si1813295qku.113.2016.03.23.04.48.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Mar 2016 04:48:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43411 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aihHV-0005r7-7p
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 07:48:57 -0400
Received: from eggs.gnu.org ([208.118.235.92]:35945)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aihHR-0005qm-Pm
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 07:48:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aihHM-0008Ep-Px
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 07:48:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56397)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1aihHM-0008Ei-Kg; Wed, 23 Mar 2016 07:48:48 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 1F5581E4D;
	Wed, 23 Mar 2016 11:48:48 +0000 (UTC)
Received: from pxdev.xzpeter.org (vpn1-7-25.pek2.redhat.com [10.72.7.25])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2NBmV0U019301
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 23 Mar 2016 07:48:36 -0400
Date: Wed, 23 Mar 2016 19:48:30 +0800
From: Peter Xu <peterx@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20160323114830.GR28183@pxdev.xzpeter.org>
References: <1458271654-23706-1-git-send-email-peterx@redhat.com>
	<1458271654-23706-2-git-send-email-peterx@redhat.com>
	<87zitqjrhj.fsf@blackfin.pond.sub.org>
	<87vb4eicdu.fsf@blackfin.pond.sub.org>
	<20160323025819.GD28183@pxdev.xzpeter.org>
	<87shzhbktm.fsf@blackfin.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87shzhbktm.fsf@blackfin.pond.sub.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
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
X-TUID: 7jagcySpP/EF

On Wed, Mar 23, 2016 at 10:33:09AM +0100, Markus Armbruster wrote:
> Peter Xu <peterx@redhat.com> writes:
> 
> > On Tue, Mar 22, 2016 at 07:41:17PM +0100, Markus Armbruster wrote:
> >> Markus Armbruster <armbru@redhat.com> writes:
> >> >> +##
> >> >> +# @GICCapability:
> >> >> +#
> >> >> +# This struct describes capability for a specific GIC version. These
> >> >> +# bits are not only decided by QEMU/KVM software version, but also
> >> >> +# decided by the hardware that the program is running upon.
> >> >> +#
> >> >> +# @version:  version of GIC to be described.
> >> >> +#
> >> >> +# @emulated: whether current QEMU/hardware supports emulated GIC
> >> >> +#            device in user space.
> >> >> +#
> >> >> +# @kernel:   whether current QEMU/hardware supports hardware
> >> >> +#            accelerated GIC device in kernel.
> >> >> +#
> >> >> +# Since: 2.6
> >> >> +##
> >> >> +{ 'struct': 'GICCapability',
> >> >> +  'data': { 'version': 'int',
> >> >> +            'emulated': 'bool',
> >> >> +            'kernel': 'bool' } }

[*] Marking here...

> So GICCapability essentially tells its users whether certain
> configurations have a chance to work.
> 
> I think what's missing in your patch is the connection from
> GICCapability to the actual configuration options.  As is, you just have
> to know what options the presence of each possible GICCapability value
> unlocks.  It needs to be documented instead.

What I understand is that, above [*] should have explained what does
each entry mean. E.g., as mentioned in the qapi-schema, there are
explainations about "version", "emulated" and "kernel" key words. If
we go deeper into e.g., "emulated" key word, we will got:

"whether current QEMU/hardware supports emulated GIC device in user
 space."

So this boolean will tell just as it is explained.

Maybe I failed to get the point of your review comment... :( Would
you please give an example on how should I better express this
relationship?

(btw, I have updated the commit message in v6 for current patch, to
tell more about why we need this, and why we decided to add this ad
hoc command. I'd be glad if we can continue the discussion based on
that one.  Thanks!)

-- peterx
