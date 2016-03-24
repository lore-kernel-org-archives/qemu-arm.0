Received: by 10.25.208.211 with SMTP id h202csp356883lfg;
        Wed, 23 Mar 2016 19:20:43 -0700 (PDT)
X-Received: by 10.140.29.34 with SMTP id a31mr7509016qga.69.1458786043116;
        Wed, 23 Mar 2016 19:20:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f185si4695415qkb.71.2016.03.23.19.20.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Mar 2016 19:20:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47132 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aiut8-0001dR-Jb
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 22:20:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33542)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aiut4-0001dB-CD
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 22:20:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aiut1-0008Tf-18
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 22:20:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56945)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1aiut0-0008TK-NH; Wed, 23 Mar 2016 22:20:34 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 37AE7C049D7F;
	Thu, 24 Mar 2016 02:20:34 +0000 (UTC)
Received: from pxdev.xzpeter.org (vpn1-7-35.pek2.redhat.com [10.72.7.35])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2O2KQAK021389
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 23 Mar 2016 22:20:28 -0400
Date: Thu, 24 Mar 2016 10:20:25 +0800
From: Peter Xu <peterx@redhat.com>
To: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <20160324022025.GY28183@pxdev.xzpeter.org>
References: <1458711153-15988-1-git-send-email-peterx@redhat.com>
	<1458711153-15988-5-git-send-email-peterx@redhat.com>
	<56F28D15.5070302@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <56F28D15.5070302@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, mdroth@linux.vnet.ibm.com,
	libvir-list@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
	qemu-arm@nongnu.org, abologna@redhat.com, eblake@redhat.com
Subject: Re: [Qemu-arm] [PATCH v6 4/4] arm: implement query-gic-capabilities
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
X-TUID: OK/QuTZL5Ve9

On Wed, Mar 23, 2016 at 03:33:25PM +0300, Sergey Fedorov wrote:
> On 23/03/16 08:32, Peter Xu wrote:
> > diff --git a/target-arm/monitor.c b/target-arm/monitor.c
> > index 254a9c9..4a2db59 100644
> > --- a/target-arm/monitor.c
> > +++ b/target-arm/monitor.c
> > @@ -21,8 +21,66 @@
> (snip)
> >  GICCapabilityResult *qmp_query_gic_capabilities(Error **errp)
> >  {
> > -    return NULL;
> > +    GICCapabilityResult *result = g_new0(GICCapabilityResult, 1);
> > +    GICCapabilityList *head = NULL;
> > +    GICCapability *v2 = gic_cap_new(2), *v3 = gic_cap_new(3);
> > +
> > +    v2->emulated = true;
> > +    /* FIXME: we'd change to true after we get emulated GICv3. */
> 
> Maybewe'd better use'NOTE:' or 'TODO:' instead of 'FIXME:'?

Right.

> 
> > +    v3->emulated = false;
> > +
> > +#ifdef CONFIG_KVM
> > +    {
> > +        int fdarray[3];
> > +
> > +        if (!kvm_arm_create_scratch_host_vcpu(NULL, fdarray, NULL)) {
> > +            goto out;
> > +        }
> > +
> > +        /* Test KVM GICv2 */
> > +        if (kvm_support_device(fdarray[1], KVM_DEV_TYPE_ARM_VGIC_V2)) {
> > +            v2->kernel = true;
> > +        }
> > +
> > +        /* Test KVM GICv3 */
> > +        if (kvm_support_device(fdarray[1], KVM_DEV_TYPE_ARM_VGIC_V3)) {
> > +            v3->kernel = true;
> > +        }
> > +
> > +        kvm_arm_destroy_scratch_host_vcpu(fdarray);
> > +out:
> > +        ;
> > +    }
> > +#endif
> 
> Probably, it would be neater to put KVM part into a separate static
> inline function.

Seems so. Will fix.

Thanks.

-- peterx
