Received: by 10.25.21.156 with SMTP id 28csp662034lfv;
        Fri, 15 Jul 2016 08:08:06 -0700 (PDT)
X-Received: by 10.55.13.11 with SMTP id 11mr24922062qkn.150.1468595286260;
        Fri, 15 Jul 2016 08:08:06 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r123si5512073qkd.243.2016.07.15.08.08.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jul 2016 08:08:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33070 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bO4ij-0008Dl-JI
	for alex.bennee@linaro.org; Fri, 15 Jul 2016 11:08:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54881)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1bO4go-000708-O3
	for qemu-devel@nongnu.org; Fri, 15 Jul 2016 11:06:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1bO4gn-0006zt-Jb
	for qemu-devel@nongnu.org; Fri, 15 Jul 2016 11:06:06 -0400
Received: from chuckie.co.uk ([82.165.15.123]:39423
	helo=s16892447.onlinehome-server.info)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1bO4gf-0006yg-LU; Fri, 15 Jul 2016 11:05:57 -0400
Received: from host86-138-127-109.range86-138.btcentralplus.com
	([86.138.127.109] helo=[192.168.1.65])
	by s16892447.onlinehome-server.info with esmtpsa
	(TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1bO4gS-0000XD-PF; Fri, 15 Jul 2016 16:05:47 +0100
To: Marcel Apfelbaum <marcel@redhat.com>, qemu-devel@nongnu.org
References: <1468503826-10617-1-git-send-email-marcel@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <64f54148-13ec-ab1e-6e9f-dcb19a26c885@ilande.co.uk>
Date: Fri, 15 Jul 2016 16:05:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1468503826-10617-1-git-send-email-marcel@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.138.127.109
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Sun, 08 Jan 2012 02:45:44 +0000)
X-SA-Exim-Scanned: Yes (on s16892447.onlinehome-server.info)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 82.165.15.123
Subject: Re: [Qemu-devel] [PATCH 0/7] hw/pci-bus: Fix PCI bus regression on
 several archs
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, mst@redhat.com, agraf@suse.de,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, leon.alrae@imgtec.com,
	aurelien@aurel32.net, rth@twiddle.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VZLJ4E7aFdwN

On 14/07/16 14:43, Marcel Apfelbaum wrote:

> Commit b86eacb (hw/pci: delay bus_master_enable_region initialization) delayed
> enabling the 'bus-master' region for PCI devices until 'machine-done' event.
> The event registration happens in the PCIBus realize function, however
> the PCI bus is not 'realized' *at all* for some machines.
> 
> It appears to be a hidden issue revealed by the above commit.
> Thanks Mark Cave-Ayland and Leon Alrae for reporting it!
> 
> For all the series:
> Reported-by: Leon Alrae <leon.alrae@imgtec.com>
> Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> Patch 1: Increase the timeout for the prom-env-test since I encountered random failures.
> Patch 2-7: Separate fix for each arch so it will be easier for maintainers to ack.
> 
> Thanks,
> Marcel

Hi Marcel,

I can confirm that this patchset fixes the boot regression for me under
qemu-system-sparc64 - thanks a lot!

Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

