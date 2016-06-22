Received: by 10.25.21.96 with SMTP id l93csp2435508lfi;
        Wed, 22 Jun 2016 05:13:16 -0700 (PDT)
X-Received: by 10.55.20.208 with SMTP id 77mr36067199qku.124.1466597596253;
        Wed, 22 Jun 2016 05:13:16 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id a4si5860459qkh.203.2016.06.22.05.13.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Jun 2016 05:13:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57821 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFh1v-0002Py-MI
	for alex.bennee@linaro.org; Wed, 22 Jun 2016 08:13:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1bFgxO-0005vY-Co
	for qemu-devel@nongnu.org; Wed, 22 Jun 2016 08:08:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1bFgxN-0006td-8k
	for qemu-devel@nongnu.org; Wed, 22 Jun 2016 08:08:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52558)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>)
	id 1bFgxF-0006qs-VQ; Wed, 22 Jun 2016 08:08:26 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A03B785542;
	Wed, 22 Jun 2016 12:08:25 +0000 (UTC)
Received: from work-vm (ovpn-116-97.ams2.redhat.com [10.36.116.97])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5MC8Mpt018999
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 22 Jun 2016 08:08:24 -0400
Date: Wed, 22 Jun 2016 13:08:22 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Kevin Zhao <kevin.zhao@linaro.org>
Message-ID: <20160622120821.GH2274@work-vm>
References: <CAN76PtRzf2qAwkMi9PMCUCaUha+6EpFnA_TiBB_oWLVFEQ8yyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN76PtRzf2qAwkMi9PMCUCaUha+6EpFnA_TiBB_oWLVFEQ8yyw@mail.gmail.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 22 Jun 2016 12:08:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] Question about a qemu Aarch64 error when adding
 several SCSI disks
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YIBr1I/38O0I

* Kevin Zhao (kevin.zhao@linaro.org) wrote:
> Hi All,
>        Greetings from Linaro. This is Kevin from Linaro, and recently I
> have met a problem of qemu-system-aarch64 when I am working on virt-manager.
>        I have reported a bug here:
> https://bugs.launchpad.net/qemu/+bug/1594239
> 
>        It's mainly bout adding several SCSI disks to Aarch64 guests.
>        If you have a moment, pls kindly give some advice about this.Thanks.

Hi Kevin,
  The assert you've got there really should not happen:

 starting domain: internal error: process exited while connecting to monitor: qemu-system-aarch64: /build/qemu-zxCwKP/qemu-2.5+dfsg/migration/savevm.c:620: vmstate_register_with_alias_id: Assertion `!se->compat || se->instance_id == 0' failed.

I've only seen that error once before, and that was when the
device had a really long device path (lots and lots of PCI bridges)
but you've not got that.

Can you get a full backtrace from that?
If you can rebuild it and debug then adding some
prints into vmstate_register_with_alias_id should help, in particular
if you can print the name that qdev_get-dev_path returns it would
be good and also the vmsd->name value.

Dave

--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
