Received: by 10.25.208.211 with SMTP id h202csp2239274lfg;
        Tue, 22 Mar 2016 21:14:50 -0700 (PDT)
X-Received: by 10.140.153.135 with SMTP id 129mr760240qhz.38.1458706490748;
        Tue, 22 Mar 2016 21:14:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w198si582220qkw.58.2016.03.22.21.14.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Mar 2016 21:14:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40861 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aiaC2-00089f-8w
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 00:14:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55690)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aiaBz-00089Z-2p
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 00:14:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aiaBv-00053U-Sm
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 00:14:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42126)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1aiaBv-00053F-Nt; Wed, 23 Mar 2016 00:14:43 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 8DDAF1E21;
	Wed, 23 Mar 2016 04:14:42 +0000 (UTC)
Received: from pxdev.xzpeter.org (dhcp-14-238.nay.redhat.com [10.66.14.238])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2N4EUKZ003920
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 23 Mar 2016 00:14:35 -0400
Date: Wed, 23 Mar 2016 12:14:29 +0800
From: Peter Xu <peterx@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20160323041429.GG28183@pxdev.xzpeter.org>
References: <1458271654-23706-1-git-send-email-peterx@redhat.com>
	<1458271654-23706-3-git-send-email-peterx@redhat.com>
	<874mbyl64i.fsf@blackfin.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <874mbyl64i.fsf@blackfin.pond.sub.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, mdroth@linux.vnet.ibm.com,
	qemu-devel@nongnu.org, abologna@redhat.com, qemu-arm@nongnu.org,
	Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 2/5] arm: qmp: add
 query-gic-capabilities interface
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
X-TUID: o4u8SCt2AAQr

On Tue, Mar 22, 2016 at 07:28:13PM +0100, Markus Armbruster wrote:
> Peter Xu <peterx@redhat.com> writes:
> > diff --git a/scripts/qapi.py b/scripts/qapi.py
> > index 6b2aa6e..716474e 100644
> > --- a/scripts/qapi.py
> > +++ b/scripts/qapi.py
> > @@ -46,6 +46,7 @@ returns_whitelist = [
>    # Whitelist of commands allowed to return a non-dictionary
>    returns_whitelist = [
>        'human-monitor-command',
>        'qom-get',
>        'query-migrate-cache-size',
> >      'query-tpm-models',
> >      'query-tpm-types',
> >      'ringbuf-read',
> > +    'query-gic-capability',
> >  
> >      # From QGA:
> >      'guest-file-open',
> 
> The whitelist exists to except existing commands from design rules on
> return types.  New commands don't get to violate the rules without a
> really, really compelling reason.
> 
> Do you actually need this?
> 
> If yes, why should your command be permitted to violate the design
> rules?

This might not be required. Agree with you and Eric. Will use a hash
instead with single key.

> > +#include "qemu/osdep.h"
> > +#include "hw/boards.h"
> > +#include "qemu/error-report.h"
> > +#include "sysemu/kvm.h"
> > +#include "qmp-commands.h"
> 
> I very much doubt you need all these includes.  Try dropping all but the
> first and the last one.

I just copied them from machine.c and dropped lots, seems still
redundant... Will keep it a minimum subset in next version. Thanks!

-- peterx
