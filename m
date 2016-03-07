Received: by 10.25.208.211 with SMTP id h202csp1246928lfg;
        Sun, 6 Mar 2016 23:38:28 -0800 (PST)
X-Received: by 10.140.225.6 with SMTP id v6mr28521449qhb.0.1457336308255;
        Sun, 06 Mar 2016 23:38:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n6si15729905qge.102.2016.03.06.23.38.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Mar 2016 23:38:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54191 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1acpkJ-0004eG-Nk
	for alex.bennee@linaro.org; Mon, 07 Mar 2016 02:38:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1acpkH-0004dx-MG
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 02:38:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1acpkC-00020Y-NU
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 02:38:25 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33662)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1acpkC-00020U-IB; Mon, 07 Mar 2016 02:38:20 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 06755A287D;
	Mon,  7 Mar 2016 07:38:19 +0000 (UTC)
Received: from localhost.redhat.com (ovpn-116-27.sin2.redhat.com
	[10.67.116.27])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u277cEqI023900
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA256 bits=256 verify=NO); 
	Mon, 7 Mar 2016 02:38:17 -0500
Date: Mon, 7 Mar 2016 08:38:13 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Xu <peterx@redhat.com>
Message-ID: <20160307073813.GB1865@localhost.redhat.com>
References: <1457324608-11434-1-git-send-email-peterx@redhat.com>
	<1457324608-11434-4-git-send-email-peterx@redhat.com>
	<20160307051025.GB2885@localhost.redhat.com>
	<20160307053824.GB7438@pxdev.xzpeter.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160307053824.GB7438@pxdev.xzpeter.org>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, armbru@redhat.com, qemu-devel@nongnu.org,
	mdroth@linux.vnet.ibm.com, qemu-arm@nongnu.org, abologna@redhat.com
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 3/3] arm: implement
	query-gic-capability
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
X-TUID: au3oUZbQCjYp

On Mon, Mar 07, 2016 at 01:38:24PM +0800, Peter Xu wrote:
> On Mon, Mar 07, 2016 at 06:12:38AM +0100, Andrew Jones wrote:
> > On Mon, Mar 07, 2016 at 12:23:28PM +0800, Peter Xu wrote:
> > > +#ifdef CONFIG_KVM
> > > +/*
> > > + * This is merely the same as kvm_create_device(). The only
> > > + * difference is we are using raw fds rather than KVMState, so that
> > > + * we can use it even without kvm_state initialized.
> > > + */
> > > +static int kvm_create_device_fds(int kvm_fd, int vmfd,
> > > +                                 uint64_t type, bool test)
> > 
> > I don't think we need this helper function. Who else will call it?
> > Particularly without test==true? Anyway, I think three ioctls directly
> > called from qmp_query_gic_capability should be OK.
> 
> Right. However, I would still consider using a helper function if
> you would not mind. E.g, how about this:

Fine by me.

Thanks,
drew

> 
> #ifdef CONFIG_KVM
> /* Test whether KVM support specific device. */
> static inline int kvm_support_device(int vmfd, uint64_t type)
> {
>     struct kvm_create_device create_dev = {
>         .type = type,
>         .fd = -1,
>         .flags = KVM_CREATE_DEVICE_TEST,
>     };
>     return ioctl(vmfd, KVM_CREATE_DEVICE, &create_dev);
> }
> #endif
> 
> Thanks.
> Peter
> 
