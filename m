Received: by 10.25.208.211 with SMTP id h202csp88070lfg;
        Wed, 23 Mar 2016 07:57:13 -0700 (PDT)
X-Received: by 10.55.22.162 with SMTP id 34mr4058242qkw.63.1458745033421;
        Wed, 23 Mar 2016 07:57:13 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j69si2477196qga.6.2016.03.23.07.57.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Mar 2016 07:57:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44428 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aikDh-0002ue-23
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 10:57:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34734)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aikDe-0002uX-FJ
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 10:57:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aikDb-0001T2-9E
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 10:57:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50627)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1aikDb-0001Sy-3Z; Wed, 23 Mar 2016 10:57:07 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id A399E3B71B;
	Wed, 23 Mar 2016 14:57:06 +0000 (UTC)
Received: from pxdev.xzpeter.org (vpn1-7-25.pek2.redhat.com [10.72.7.25])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2NEuraN007178
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 23 Mar 2016 10:56:58 -0400
Date: Wed, 23 Mar 2016 22:56:52 +0800
From: Peter Xu <peterx@redhat.com>
To: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <20160323145652.GW28183@pxdev.xzpeter.org>
References: <1458711153-15988-1-git-send-email-peterx@redhat.com>
	<1458711153-15988-4-git-send-email-peterx@redhat.com>
	<56F28BEC.2070008@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <56F28BEC.2070008@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, libvir-list@redhat.com,
	armbru@redhat.com, qemu-devel@nongnu.org,
	mdroth@linux.vnet.ibm.com, qemu-arm@nongnu.org, abologna@redhat.com
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 3/4] kvm: add
 kvm_support_device() helper function
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
X-TUID: HdgvPGwFBAji

On Wed, Mar 23, 2016 at 03:28:28PM +0300, Sergey Fedorov wrote:
> On 23/03/16 08:32, Peter Xu wrote:
> > diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> > index 6695fa7..8738fa1 100644
> > --- a/include/sysemu/kvm.h
> > +++ b/include/sysemu/kvm.h
> > @@ -306,6 +306,15 @@ void kvm_device_access(int fd, int group, uint64_t attr,
> >   */
> >  int kvm_create_device(KVMState *s, uint64_t type, bool test);
> >  
> > +/**
> > + * kvm_support_device - probe whether KVM support specific device
> > + *
> > + * @vmfd: The fd handler for VM
> > + * @type: type of device
> > + *
> > + * @return: true if supported, otherwise false.
> > + */
> > +bool kvm_support_device(int vmfd, uint64_t type);
> 
> Why don't name the function like 'kvm_device_supported' to better express its predicative nature?

Because I am trying to follow existing naming style, like:
"kvm_create_device" (please see above).

Thanks.

-- peterx
