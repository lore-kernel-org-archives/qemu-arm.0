Received: by 10.25.208.211 with SMTP id h202csp321231lfg;
        Thu, 17 Mar 2016 02:41:02 -0700 (PDT)
X-Received: by 10.55.75.77 with SMTP id y74mr12497621qka.19.1458207662223;
        Thu, 17 Mar 2016 02:41:02 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c10si7155224qhd.92.2016.03.17.02.41.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Mar 2016 02:41:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33697 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agUQP-0002uC-Ok
	for alex.bennee@linaro.org; Thu, 17 Mar 2016 05:41:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51595)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1agUQM-0002pb-VS
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 05:41:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1agUQI-0004ym-Lh
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 05:40:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44646)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1agUQI-0004yi-F0; Thu, 17 Mar 2016 05:40:54 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id EBDB58F26E;
	Thu, 17 Mar 2016 09:40:53 +0000 (UTC)
Received: from pxdev.xzpeter.org (vpn1-6-212.pek2.redhat.com [10.72.6.212])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2H9em8R009550
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 17 Mar 2016 05:40:50 -0400
Date: Thu, 17 Mar 2016 17:40:48 +0800
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160317094048.GH23495@pxdev.xzpeter.org>
References: <1457422582-28799-1-git-send-email-peterx@redhat.com>
	<1457422582-28799-4-git-send-email-peterx@redhat.com>
	<CAFEAcA9zjVEvswjrHnnefHJKrtA1CWoTs+dWwV-hMVZunZ6RfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA9zjVEvswjrHnnefHJKrtA1CWoTs+dWwV-hMVZunZ6RfA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Andrew Jones <drjones@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v4 3/3] arm: implement query-gic-capabilities
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
X-TUID: pCEX2aWDjTg5

On Wed, Mar 16, 2016 at 10:30:36AM +0000, Peter Maydell wrote:
> On 8 March 2016 at 07:36, Peter Xu <peterx@redhat.com> wrote:
> > For emulated GIC capabilities, currently only gicv2 is supported. We
> > need to add gicv3 in when emulated gicv3 ready. For KVM accelerated ARM
> > VM, we detect the capability bits using ioctls.
> >
> > When probing the KVM capabilities, we cannot leverage existing helper
> > functions like kvm_create_device() since QEMU might be using TCG while
> > probing (actually this is the case for libvirt probing). So, one
> > temporary VM is created to do the probing.
> >
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  target-arm/machine.c | 94 +++++++++++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 93 insertions(+), 1 deletion(-)
> >
> > diff --git a/target-arm/machine.c b/target-arm/machine.c
> > index 813909e..8f52f74 100644
> > --- a/target-arm/machine.c
> > +++ b/target-arm/machine.c
> > @@ -1,3 +1,5 @@
> > +#include <linux/kvm.h>
> 
> This will break compilation on non-Linux hosts; you can't include
> linux headers like this.
> 
> (This is all in the wrong file anyway, machine.c is for migration.)

Okay. Will move all kvm lines into kvm*.c.

> 
> > +#include <sys/ioctl.h>
> >  #include "qemu/osdep.h"
> >  #include "hw/hw.h"
> >  #include "hw/boards.h"
> > @@ -347,7 +349,97 @@ const char *gicv3_class_name(void)
> >      exit(1);
> >  }
> >
> > +static GICCapability *gic_cap_new(int version)
> > +{
> > +    GICCapability *cap = g_new0(GICCapability, 1);
> > +    cap->version = version;
> > +    /* by default, support none */
> > +    cap->emulated = false;
> > +    cap->kernel = false;
> > +    return cap;
> > +}
> > +
> > +static GICCapabilityList *gic_cap_list_add(GICCapabilityList *head,
> > +                                           GICCapability *cap)
> > +{
> > +    GICCapabilityList *item = g_new0(GICCapabilityList, 1);
> > +    item->value = cap;
> > +    item->next = head;
> > +    return item;
> > +}
> > +
> > +#ifdef CONFIG_KVM
> > +/* Test whether KVM support specific device. */
> > +static inline int kvm_support_device(int vmfd, uint64_t type)
> > +{
> > +    struct kvm_create_device create_dev = {
> > +        .type = type,
> > +        .fd = -1,
> > +        .flags = KVM_CREATE_DEVICE_TEST,
> > +    };
> > +    return ioctl(vmfd, KVM_CREATE_DEVICE, &create_dev);
> > +}
> > +#endif
> 
> This is not ARM specific so it should go in kvm-all.c.

Will do.

> 
> > +
> >  GICCapabilityList *qmp_query_gic_capabilities(Error **errp)
> >  {
> > -    return NULL;
> > +    GICCapabilityList *head = NULL;
> > +    GICCapability *v2 = gic_cap_new(2), *v3 = gic_cap_new(3);
> > +
> > +    v2->emulated = true;
> > +    /* FIXME: we'd change to true after we get emulated GICv3. */
> > +    v3->emulated = false;
> > +
> > +#ifdef CONFIG_KVM
> 
> KVM specific code should be factored out and live in one of
> the target-arm/kvm*.c files.

Ok, will fix.

> 
> > +    {
> > +        int kvm_fd = -1;
> > +        int vmfd = -1;
> > +        /*
> > +         * HACK: here we create one temporary VM, do the probing,
> > +         * then release it properly.
> > +         */
> > +        kvm_fd = qemu_open("/dev/kvm", O_RDWR);
> > +        if (kvm_fd == -1) {
> > +            /* KVM may not enabled on host, which is fine. */
> > +            goto out;
> > +        }
> > +
> > +        do {
> > +            /* For ARM, VM type could only be zero now. */
> > +            vmfd = ioctl(kvm_fd, KVM_CREATE_VM, 0);
> > +        } while (vmfd == -EINTR);
> > +
> > +        if (vmfd < 0) {
> > +            goto kvm_fd_close;
> > +        }
> 
> Rather than open-coding this you might as well use
> kvm_arm_creat_scratch_host_vcpu() (you don't need the vcpu fd but
> it's pretty harmless to create it.)

Thanks for the func pointer! That's what I was looking for.

> 
> 
> > +
> > +        if (ioctl(kvm_fd, KVM_CHECK_EXTENSION,
> > +                  KVM_CAP_DEVICE_CTRL) <= 0) {
> > +            /* older version of KVM possibly */
> > +            goto kvm_vmfd_close;
> > +        }
> 
> Do this in kvm_support_device() [mostly just to parallel how
> kvm_create_device() does it.]

Will fix.

Thanks!

-- peterx
