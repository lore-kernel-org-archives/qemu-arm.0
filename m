Received: by 10.25.208.211 with SMTP id h202csp2223095lfg;
        Tue, 22 Mar 2016 20:18:22 -0700 (PDT)
X-Received: by 10.140.225.6 with SMTP id v6mr600793qhb.0.1458703102602;
        Tue, 22 Mar 2016 20:18:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x20si401984qhx.118.2016.03.22.20.18.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Mar 2016 20:18:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40678 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aiZJO-000366-39
	for alex.bennee@linaro.org; Tue, 22 Mar 2016 23:18:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47160)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aiZJL-00035z-Hn
	for qemu-arm@nongnu.org; Tue, 22 Mar 2016 23:18:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aiZJI-00009w-Bs
	for qemu-arm@nongnu.org; Tue, 22 Mar 2016 23:18:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58295)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1aiZJI-00009n-6T; Tue, 22 Mar 2016 23:18:16 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 23E458F4EC;
	Wed, 23 Mar 2016 03:18:15 +0000 (UTC)
Received: from pxdev.xzpeter.org (dhcp-14-238.nay.redhat.com [10.66.14.238])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2N39Moj011547
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 22 Mar 2016 23:12:48 -0400
Date: Wed, 23 Mar 2016 11:09:18 +0800
From: Peter Xu <peterx@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20160323030918.GE28183@pxdev.xzpeter.org>
References: <1458271654-23706-1-git-send-email-peterx@redhat.com>
	<1458271654-23706-2-git-send-email-peterx@redhat.com>
	<56F18FBC.3030909@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <56F18FBC.3030909@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, armbru@redhat.com,
	mdroth@linux.vnet.ibm.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, abologna@redhat.com
Subject: Re: [Qemu-arm] [PATCH v5 1/5] arm: qmp: add GICCapability struct
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
X-TUID: a+L8nxwh3Cp6

On Tue, Mar 22, 2016 at 12:32:28PM -0600, Eric Blake wrote:
> On 03/17/2016 09:27 PM, Peter Xu wrote:
> > +##
> > +# @GICCapability:
> > +#
> > +# This struct describes capability for a specific GIC version. These
> 
> Might be nice to spell out what the acronym GIC means, but that's cosmetic.

Ah! I thought I have added that... It's missing again. Will do in
next spin.

> 
> > +# bits are not only decided by QEMU/KVM software version, but also
> > +# decided by the hardware that the program is running upon.
> > +#
> > +# @version:  version of GIC to be described.
> > +#
> > +# @emulated: whether current QEMU/hardware supports emulated GIC
> > +#            device in user space.
> > +#
> > +# @kernel:   whether current QEMU/hardware supports hardware
> > +#            accelerated GIC device in kernel.
> > +#
> > +# Since: 2.6
> > +##
> > +{ 'struct': 'GICCapability',
> > +  'data': { 'version': 'int',
> > +            'emulated': 'bool',
> > +            'kernel': 'bool' } }
> > 
> 
> I might have squashed this with the patch that first uses GICCapability,
> as defining a type in isolation doesn't do much.

I can do the squash in next spin if you prefer that one. Actually I
got this question before, about when I should split and when to
squash. E.g., shall I make sure that I should have no "definition
only" patches in the future?

-- peterx
