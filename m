Received: by 10.25.208.211 with SMTP id h202csp207477lfg;
        Wed, 16 Mar 2016 21:09:50 -0700 (PDT)
X-Received: by 10.140.146.143 with SMTP id 137mr11831407qhs.15.1458187790760;
        Wed, 16 Mar 2016 21:09:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w19si5873778qhb.30.2016.03.16.21.09.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Mar 2016 21:09:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60561 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agPFu-0007Xx-7q
	for alex.bennee@linaro.org; Thu, 17 Mar 2016 00:09:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58950)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1agPFr-0007Xk-RH
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 00:09:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1agPFn-0007dv-QZ
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 00:09:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53684)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1agPFn-0007dE-Kx; Thu, 17 Mar 2016 00:09:43 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 094E5C049E19;
	Thu, 17 Mar 2016 04:09:42 +0000 (UTC)
Received: from pxdev.xzpeter.org (vpn1-6-212.pek2.redhat.com [10.72.6.212])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2H49ZqY027717
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 17 Mar 2016 00:09:38 -0400
Date: Thu, 17 Mar 2016 12:09:35 +0800
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160317040935.GE23495@pxdev.xzpeter.org>
References: <1457422582-28799-1-git-send-email-peterx@redhat.com>
	<1457422582-28799-3-git-send-email-peterx@redhat.com>
	<CAFEAcA9jCwLnG5QKTG9Hd+r8tVYSN6A8dwWp2JMPV1rMUAAjLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA9jCwLnG5QKTG9Hd+r8tVYSN6A8dwWp2JMPV1rMUAAjLQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Andrew Jones <drjones@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v4 2/3] arm: qmp: add query-gic-capabilities
	interface
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
X-TUID: cJtHsdLHog27

On Wed, Mar 16, 2016 at 10:24:39AM +0000, Peter Maydell wrote:
> On 8 March 2016 at 07:36, Peter Xu <peterx@redhat.com> wrote:
> > diff --git a/target-arm/machine.c b/target-arm/machine.c
> > index 03a73d9..813909e 100644
> > --- a/target-arm/machine.c
> > +++ b/target-arm/machine.c
> > @@ -5,6 +5,7 @@
> >  #include "sysemu/kvm.h"
> >  #include "kvm_arm.h"
> >  #include "internals.h"
> > +#include "qmp-commands.h"
> >
> >  static bool vfp_needed(void *opaque)
> >  {
> > @@ -345,3 +346,8 @@ const char *gicv3_class_name(void)
> >
> >      exit(1);
> >  }
> > +
> > +GICCapabilityList *qmp_query_gic_capabilities(Error **errp)
> > +{
> > +    return NULL;
> > +}
> 
> Why is this here? machine.c is for migration code.

Hi, Peter,

Thanks for the review comments. Do you have any suggestion on which
file should I add this in (or create a new one)? I failed to figure
it out myself. :(

TIA.

-- peterx
