Received: by 10.25.208.211 with SMTP id h202csp72460lfg;
        Wed, 23 Mar 2016 07:25:22 -0700 (PDT)
X-Received: by 10.140.18.114 with SMTP id 105mr3869225qge.41.1458743122706;
        Wed, 23 Mar 2016 07:25:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m69si2334477qkl.67.2016.03.23.07.25.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Mar 2016 07:25:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44260 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aijis-0007QP-7R
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 10:25:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54351)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aijip-0007QD-PN
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 10:25:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aijim-0000VC-VG
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 10:25:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35945)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1aijim-0000V0-Pq; Wed, 23 Mar 2016 10:25:16 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 6ED5D821C3;
	Wed, 23 Mar 2016 14:25:14 +0000 (UTC)
Received: from pxdev.xzpeter.org (vpn1-7-25.pek2.redhat.com [10.72.7.25])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2NEP1DT003743
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 23 Mar 2016 10:25:07 -0400
Date: Wed, 23 Mar 2016 22:25:00 +0800
From: Peter Xu <peterx@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20160323142500.GU28183@pxdev.xzpeter.org>
References: <1458271654-23706-1-git-send-email-peterx@redhat.com>
	<1458271654-23706-2-git-send-email-peterx@redhat.com>
	<87zitqjrhj.fsf@blackfin.pond.sub.org>
	<87vb4eicdu.fsf@blackfin.pond.sub.org>
	<20160323025819.GD28183@pxdev.xzpeter.org>
	<87shzhbktm.fsf@blackfin.pond.sub.org>
	<20160323114830.GR28183@pxdev.xzpeter.org>
	<8737rh8jvj.fsf@blackfin.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8737rh8jvj.fsf@blackfin.pond.sub.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, mdroth@linux.vnet.ibm.com,
	qemu-devel@nongnu.org, abologna@redhat.com, qemu-arm@nongnu.org
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
X-TUID: PL7osnC7FOl/

On Wed, Mar 23, 2016 at 01:21:52PM +0100, Markus Armbruster wrote:
> Can you tell me what a management application is supposed to do with the
> information returned by query-gic-capabilities?  Not just in general
> terms, like "using this information, libvirt can warn the user during
> configuration of guests when specified GIC device type is not supported,
> but specifics.  Something like "-frobnicate mutter=mumble won't work
> unless query-gic-capabilities reports emulated version 2 is supported"
> for every piece of configuration that should be vetted against
> query-gic-capabilities.

I suppose that won't be a very big problem since possibly only
libvirt will use it... I agree that it's better to explain it more
clearly though. How about adding these lines into patch 1 commit
message:

"""
For example, if we got the query result:

{"return": {"capabilities":
  [ {"emulated": false, "version": 3, "kernel": true},
    {"emulated": true, "version": 2, "kernel": false} ] } }

Then it means that we support emulated GIC version 2 using:

  qemu-system-aarch64 -M virt,gic-version=2 ...

or kvm-accelerated GIC version 3 using:

  qemu-system-aarch64 -enable-kvm -M virt,gic-version=3 ...

If we specify other explicit GIC version rather than the above, QEMU
will not be able to boot.
"""

Thanks.

-- peterx
