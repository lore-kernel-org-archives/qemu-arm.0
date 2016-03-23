Received: by 10.25.208.211 with SMTP id h202csp2432156lfg;
        Wed, 23 Mar 2016 04:57:14 -0700 (PDT)
X-Received: by 10.140.91.106 with SMTP id y97mr2809301qgd.20.1458734234290;
        Wed, 23 Mar 2016 04:57:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g49si1845182qge.120.2016.03.23.04.57.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Mar 2016 04:57:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43468 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aihPV-0001MC-SI
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 07:57:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45546)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aihPR-0001HD-Pa
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 07:57:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aihPL-0002VQ-Mw
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 07:57:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49713)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1aihPL-0002Uk-Ho; Wed, 23 Mar 2016 07:57:03 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 198AA90E71;
	Wed, 23 Mar 2016 11:57:03 +0000 (UTC)
Received: from pxdev.xzpeter.org (vpn1-7-25.pek2.redhat.com [10.72.7.25])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2NBufR9024494
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 23 Mar 2016 07:56:50 -0400
Date: Wed, 23 Mar 2016 19:56:40 +0800
From: Peter Xu <peterx@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20160323115640.GS28183@pxdev.xzpeter.org>
References: <1458271654-23706-1-git-send-email-peterx@redhat.com>
	<1458271654-23706-2-git-send-email-peterx@redhat.com>
	<56F18FBC.3030909@redhat.com>
	<20160323030918.GE28183@pxdev.xzpeter.org>
	<87mvppbkbf.fsf@blackfin.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87mvppbkbf.fsf@blackfin.pond.sub.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, mdroth@linux.vnet.ibm.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, abologna@redhat.com,
	Eric Blake <eblake@redhat.com>
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
X-TUID: i/U0ok1smOGd

On Wed, Mar 23, 2016 at 10:44:04AM +0100, Markus Armbruster wrote:
> Depends.
> 
> The general rule is to keep separate things separate, and patches
> self-contained.  The narrow sense of self-contained is each patch
> compiles and works.  The wider sense is each patch makes sense to its
> readers on its own.  You can't always have a perfect score on the
> latter, but you should try.
> 
> Adding a definition without a user is generally not advised, because you
> generally need to see the user to make sense of it.
> 
> For a complex feature, adding its abstract interface before its concrete
> implementation may help liberate interface review from implementation
> details.
> 
> Note that your interface consists of type GICCapability and command
> query-gic-capabilities.  You could add just the interface with a stub
> implementation first, then flesh out the implementation.  But I doubt
> the thing is complex enough to justify that.

Thanks for the thorough explaination on this.

It's indeed not easy to figure out the best way every time for
me... Now I do feel it strange to split the first patch alone from
the 2nd one. Anyway, it's squashed into the 2nd patch in v6.

-- peterx
