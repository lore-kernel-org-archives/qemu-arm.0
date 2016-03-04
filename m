Received: by 10.25.208.211 with SMTP id h202csp176164lfg;
        Thu, 3 Mar 2016 18:22:29 -0800 (PST)
X-Received: by 10.140.102.142 with SMTP id w14mr7210150qge.58.1457058149712;
        Thu, 03 Mar 2016 18:22:29 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g81si19018qhc.0.2016.03.03.18.22.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 18:22:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38388 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abfNt-0006lH-3b
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 21:22:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49486)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1abfNq-0006l8-Ok
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 21:22:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1abfNl-0007zY-Pr
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 21:22:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52732)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1abfNl-0007zT-Kk; Thu, 03 Mar 2016 21:22:21 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 0769D29B23E;
	Fri,  4 Mar 2016 02:22:20 +0000 (UTC)
Received: from pxdev.xzpeter.org (vpn1-5-93.pek2.redhat.com [10.72.5.93])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u242M9v1011046
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 3 Mar 2016 21:22:14 -0500
Date: Fri, 4 Mar 2016 10:22:08 +0800
From: Peter Xu <peterx@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20160304022208.GE30973@pxdev.xzpeter.org>
References: <1456993272-32292-1-git-send-email-peterx@redhat.com>
	<1456993272-32292-3-git-send-email-peterx@redhat.com>
	<20160303115551.oaswd6litrm2tz3v@hawk.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20160303115551.oaswd6litrm2tz3v@hawk.localdomain>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, mdroth@linux.vnet.ibm.com, armbru@redhat.com,
	abologna@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/3] arm: qmp: add
 query-gic-capability interface
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
X-TUID: IOzueE/wWR4k

On Thu, Mar 03, 2016 at 12:55:51PM +0100, Andrew Jones wrote:
> On Thu, Mar 03, 2016 at 04:21:11PM +0800, Peter Xu wrote:
> > +
> > +GICCapabilityList *qmp_query_gic_capability(Error **errp);
> 
> I don't know anything about QMP, so just offering a superficial
> review comment. Is the prototype necessary here? It seems redundant,
> considering the function is defined right below.
> 
> drew

I added this to avoid a "missing prototype" warning. However found
the correct way to do it is possibly to include "qmp-commands.h" in
target-arm/machine.c. Thanks to point out! Will fix.

Peter
