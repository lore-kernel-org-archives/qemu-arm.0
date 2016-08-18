Received: by 10.25.21.156 with SMTP id 28csp332627lfv;
        Thu, 18 Aug 2016 07:00:35 -0700 (PDT)
X-Received: by 10.55.158.16 with SMTP id h16mr2525909qke.32.1471528835439;
        Thu, 18 Aug 2016 07:00:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 18si1326890qto.8.2016.08.18.07.00.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Aug 2016 07:00:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52836 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1baNs2-0007ol-T0
	for alex.bennee@linaro.org; Thu, 18 Aug 2016 10:00:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49429)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1baNru-0007ob-3y
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 10:00:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1baNrn-00068s-E0
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 10:00:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56342)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1baNrn-00068e-85; Thu, 18 Aug 2016 10:00:19 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4BC3AC0578C9;
	Thu, 18 Aug 2016 14:00:18 +0000 (UTC)
Received: from kamzik.localdomain (dhcp-1-170.brq.redhat.com [10.34.1.170])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7IE0EGe031794
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 18 Aug 2016 10:00:17 -0400
Date: Thu, 18 Aug 2016 16:00:14 +0200
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Message-ID: <20160818140014.qhbctpmlg6umqkvm@kamzik.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 18 Aug 2016 14:00:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] hw/arm/virt: vmstate-static-checker.py results
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Amit Shah <amit.shah@redhat.com>, peter.maydell@linaro.org,
	David Gilbert <dgilbert@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xC3U22RyuHUj

Hi all,

We've recently started versioning mach-virt, v2.6 was the first versioned
release. As an effort to try and make sure we're doing things right, I
tried the vmstate-static-checker.py script. I compared a 2.6 machine
from a QEMU built from the v2.6.0 tag with a 2.6 machine from a QEMU
built from today's latest pull (5844365fe8). I see lots of errors. I have
no experience in this area, so I can't even state whether they're truly
a concern or not. I can say a few things;

 1) Most of the errors look like the same problem. Something is wrong
    with xilinx_spi state, which shows up everywhere. Here's an example

Section "en25q64", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest

 2) Several of the remaining problems are also present on a check of the
    x86_64 pc-i440fx-2.6 machine type. To be precise

Section "am53c974", Description "esp": expected field "cmdlen", got "cmdbuf"; skipping rest
Section "dc390", Description "esp": expected field "cmdlen", got "cmdbuf"; skipping rest
Section "e1000-82544gc", Description "e1000": expected field "tx.ipcss", got "tx.props.ipcss"; skipping rest
Section "e1000-82545em", Description "e1000": expected field "tx.ipcss", got "tx.props.ipcss"; skipping rest
Section "e1000", Description "e1000": expected field "tx.ipcss", got "tx.props.ipcss"; skipping rest
Section "esp", Description "esp": expected field "cmdlen", got "cmdbuf"; skipping rest
Section "rtl8139", Description "rtl8139": expected field "tally_counters", got "tally_counters.TxOk"; skipping rest

    x86 only has three additional messages, which look harmless to me

Section "apic-common" does not exist in dest
Section "apic" does not exist in dest
Section "kvm-apic" does not exist in dest

 3) I analyzed one error I saw, and see it should be fine, as the device
    simply went from unmigratable to migratable (for TCG anyway)

Section "arm-gicv3-common" Section "arm-gicv3-common" Description "arm_gicv3": minimum version error: 0 < 1


Any help with this would be appreciated. I probably won't be looking into
it myself, at least not any time soon. So, IOW, this mail is really just a
bug report, not a progress report :-)

Steps I did and full output attached.

Thanks,
drew
