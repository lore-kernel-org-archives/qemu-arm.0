Received: by 10.25.208.211 with SMTP id h202csp86791lfg;
        Wed, 23 Mar 2016 07:54:31 -0700 (PDT)
X-Received: by 10.141.5.137 with SMTP id h131mr4246853qhd.47.1458744871233;
        Wed, 23 Mar 2016 07:54:31 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a12si2439475qha.52.2016.03.23.07.54.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Mar 2016 07:54:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44418 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aikB4-0001Z1-Nn
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 10:54:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34302)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aikAx-0001Xg-Dt
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 10:54:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aikAt-0000ty-Hs
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 10:54:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56981)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1aikAt-0000tu-Bw; Wed, 23 Mar 2016 10:54:19 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id C6465C049D7F;
	Wed, 23 Mar 2016 14:54:18 +0000 (UTC)
Received: from pxdev.xzpeter.org (vpn1-7-25.pek2.redhat.com [10.72.7.25])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2NEs4Ku001175
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 23 Mar 2016 10:54:09 -0400
Date: Wed, 23 Mar 2016 22:53:57 +0800
From: Peter Xu <peterx@redhat.com>
To: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <20160323145357.GV28183@pxdev.xzpeter.org>
References: <1458711153-15988-1-git-send-email-peterx@redhat.com>
	<1458711153-15988-3-git-send-email-peterx@redhat.com>
	<56F28AF0.8010506@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <56F28AF0.8010506@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, mdroth@linux.vnet.ibm.com,
	libvir-list@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
	qemu-arm@nongnu.org, abologna@redhat.com, eblake@redhat.com
Subject: Re: [Qemu-arm] [PATCH v6 2/4] arm: enhance
 kvm_arm_create_scratch_host_vcpu
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
X-TUID: YDNpgGXwlSnj

On Wed, Mar 23, 2016 at 03:24:16PM +0300, Sergey Fedorov wrote:
> On 23/03/16 08:32, Peter Xu wrote:
> > diff --git a/target-arm/kvm.c b/target-arm/kvm.c
> > index 969ab0b..0a7f9a6 100644
> > --- a/target-arm/kvm.c
> > +++ b/target-arm/kvm.c
> > @@ -62,13 +62,17 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
> >          goto err;
> >      }
> >  
> > +    if (!init) {
> > +        goto finish;
> > +    }
> > +
> >      ret = ioctl(vmfd, KVM_ARM_PREFERRED_TARGET, init);
> >      if (ret >= 0) {
> >          ret = ioctl(cpufd, KVM_ARM_VCPU_INIT, init);
> >          if (ret < 0) {
> >              goto err;
> >          }
> > -    } else {
> > +    } else if (cpus_to_try) {
> >          /* Old kernel which doesn't know about the
> >           * PREFERRED_TARGET ioctl: we know it will only support
> >           * creating one kind of guest CPU which is its preferred
> > @@ -85,8 +89,12 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
> >          if (ret < 0) {
> >              goto err;
> >          }
> > +    } else {
> > +        /* Not providing cpus_to_try, do nothing. */
> > +        ;
> 
> I think it's probably not the best idea to skip CPU initialization here.
> I'd rather raise an error in such case. If we supplied non-NULL init
> argument then we need VCPU been initialized, don't we? If we pass NULL
> as init then we actually skip this code.

Though current we will never go into this else... I agree that we
should raise error if stepped into it.

Will fix. Thanks!

-- peterx
