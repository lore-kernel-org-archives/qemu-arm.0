Received: by 10.25.21.156 with SMTP id 28csp336727lfv;
        Thu, 18 Aug 2016 07:07:24 -0700 (PDT)
X-Received: by 10.55.165.202 with SMTP id o193mr2714244qke.285.1471529244618;
        Thu, 18 Aug 2016 07:07:24 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a12si1344189qte.3.2016.08.18.07.07.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Aug 2016 07:07:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52881 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1baNyd-0002K1-UA
	for alex.bennee@linaro.org; Thu, 18 Aug 2016 10:07:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51787)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1baNxj-0001fO-MB
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 10:06:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1baNxe-0007ot-Io
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 10:06:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49896)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1baNxe-0007og-A8; Thu, 18 Aug 2016 10:06:22 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CA0FE30C7B1;
	Thu, 18 Aug 2016 14:06:21 +0000 (UTC)
Received: from kamzik.localdomain (dhcp-1-170.brq.redhat.com [10.34.1.170])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7IE6Iww007337
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 18 Aug 2016 10:06:20 -0400
Date: Thu, 18 Aug 2016 16:06:17 +0200
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Message-ID: <20160818140617.y7czdw3xwrbp4rcm@kamzik.localdomain>
References: <20160818140014.qhbctpmlg6umqkvm@kamzik.localdomain>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ar6qcot2hljtkiw5"
Content-Disposition: inline
In-Reply-To: <20160818140014.qhbctpmlg6umqkvm@kamzik.localdomain>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 18 Aug 2016 14:06:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] hw/arm/virt: vmstate-static-checker.py
 results
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
X-TUID: 9d6tSEl2jmYz


--ar6qcot2hljtkiw5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 18, 2016 at 04:00:14PM +0200, Andrew Jones wrote:
> Hi all,
> 
> We've recently started versioning mach-virt, v2.6 was the first versioned
> release. As an effort to try and make sure we're doing things right, I
> tried the vmstate-static-checker.py script. I compared a 2.6 machine
> from a QEMU built from the v2.6.0 tag with a 2.6 machine from a QEMU
> built from today's latest pull (5844365fe8). I see lots of errors. I have
> no experience in this area, so I can't even state whether they're truly
> a concern or not. I can say a few things;
> 
>  1) Most of the errors look like the same problem. Something is wrong
>     with xilinx_spi state, which shows up everywhere. Here's an example
> 
> Section "en25q64", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
> 
>  2) Several of the remaining problems are also present on a check of the
>     x86_64 pc-i440fx-2.6 machine type. To be precise
> 
> Section "am53c974", Description "esp": expected field "cmdlen", got "cmdbuf"; skipping rest
> Section "dc390", Description "esp": expected field "cmdlen", got "cmdbuf"; skipping rest
> Section "e1000-82544gc", Description "e1000": expected field "tx.ipcss", got "tx.props.ipcss"; skipping rest
> Section "e1000-82545em", Description "e1000": expected field "tx.ipcss", got "tx.props.ipcss"; skipping rest
> Section "e1000", Description "e1000": expected field "tx.ipcss", got "tx.props.ipcss"; skipping rest
> Section "esp", Description "esp": expected field "cmdlen", got "cmdbuf"; skipping rest
> Section "rtl8139", Description "rtl8139": expected field "tally_counters", got "tally_counters.TxOk"; skipping rest
> 
>     x86 only has three additional messages, which look harmless to me
> 
> Section "apic-common" does not exist in dest
> Section "apic" does not exist in dest
> Section "kvm-apic" does not exist in dest
> 
>  3) I analyzed one error I saw, and see it should be fine, as the device
>     simply went from unmigratable to migratable (for TCG anyway)
> 
> Section "arm-gicv3-common" Section "arm-gicv3-common" Description "arm_gicv3": minimum version error: 0 < 1
> 
> 
> Any help with this would be appreciated. I probably won't be looking into
> it myself, at least not any time soon. So, IOW, this mail is really just a
> bug report, not a progress report :-)
> 
> Steps I did and full output attached.

Sigh... forgot to actually attach. Am now.

> 
> Thanks,
> drew
> 

--ar6qcot2hljtkiw5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="vmstate-checker.results"


# Run with build of v2.6.0 tag
x86_64-softmmu/qemu-system-x86_64 -M pc-i440fx-2.6 -dump-vmstate x86_64.v2.6
aarch64-softmmu/qemu-system-aarch64 -M virt-2.6 -dump-vmstate aarch64.v2.6

# Run with latest QEMU build
x86_64-softmmu/qemu-system-x86_64 -M pc-i440fx-2.6 -dump-vmstate x86_64.latest
aarch64-softmmu/qemu-system-aarch64 -M virt-2.6 -dump-vmstate aarch64.latest

# x86_64 pc static checker output
../qemu/scripts/vmstate-static-checker.py -s x86_64.v2.6 -d x86_64.latest
Section "e1000-82544gc", Description "e1000": expected field "tx.ipcss", got "tx.props.ipcss"; skipping rest
Section "rtl8139", Description "rtl8139": expected field "tally_counters", got "tally_counters.TxOk"; skipping rest
Section "esp", Description "esp": expected field "cmdlen", got "cmdbuf"; skipping rest
Section "dc390", Description "esp": expected field "cmdlen", got "cmdbuf"; skipping rest
Section "e1000-82545em", Description "e1000": expected field "tx.ipcss", got "tx.props.ipcss"; skipping rest
Section "apic-common" does not exist in dest
Section "apic" does not exist in dest
Section "am53c974", Description "esp": expected field "cmdlen", got "cmdbuf"; skipping rest
Section "kvm-apic" does not exist in dest
Section "e1000", Description "e1000": expected field "tx.ipcss", got "tx.props.ipcss"; skipping rest

# AArch64 mach-virt static checker output
# Note1: The 'grep -v' is used to avoid over 100 lines like
#  Section "<DEVICE>", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
# which all seem to be the same issue. Unfiltered output below.
# Note2: I think the arm-gicv3-common error should be fine, as that
# device simply went from unmigratable to migratable (for TCG).
../qemu/scripts/vmstate-static-checker.py -s aarch64.v2.6 -d aarch64.latest | grep -v xilinx_spi
Section "e1000-82544gc", Description "e1000": expected field "tx.ipcss", got "tx.props.ipcss"; skipping rest
Section "aspeed.timer" Description "aspeed.timer": minimum version error: 1 < 2
Section "aspeed.timer" Description "aspeed.timer": version error: 1 > 0
Section "aspeed.timer", Description "aspeed.timer", Field "timer": missing description
Section "esp", Description "esp": expected field "cmdlen", got "cmdbuf"; skipping rest
Section "rtl8139", Description "rtl8139": expected field "tally_counters", got "tally_counters.TxOk"; skipping rest
Section "dc390", Description "esp": expected field "cmdlen", got "cmdbuf"; skipping rest
Section "imx.fec" Section "imx.fec" Description "imx.fec": minimum version error: 1 < 2
Section "imx.fec", Description "imx.fec": expected field "irq_state", got "regs"; skipping rest
Section "e1000-82545em", Description "e1000": expected field "tx.ipcss", got "tx.props.ipcss"; skipping rest
Section "arm-gicv3-common" Section "arm-gicv3-common" Description "arm_gicv3": minimum version error: 0 < 1
Section "am53c974", Description "esp": expected field "cmdlen", got "cmdbuf"; skipping rest
Section "imx.gpt" does not exist in dest
Section "e1000", Description "e1000": expected field "tx.ipcss", got "tx.props.ipcss"; skipping rest

# AArch64 mach-virt, the unfiltered check
../qemu/scripts/vmstate-static-checker.py -s aarch64.v2.6 -d aarch64.latest
Section "en25q64", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "m45pe16", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "w25q64", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "m25pe20", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "s25fl016k", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "w25q32dw", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "e1000-82544gc", Description "e1000": expected field "tx.ipcss", got "tx.props.ipcss"; skipping rest
Section "gd25q32", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "w25x80", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "m25p20", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "m25p80", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "n25q256a13", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "n25q256a11", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "m25px32-s0", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "at25df321a", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "sst25wf020", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "aspeed.timer" Description "aspeed.timer": minimum version error: 1 < 2
Section "aspeed.timer" Description "aspeed.timer": version error: 1 > 0
Section "aspeed.timer", Description "aspeed.timer", Field "timer": missing description
Section "en25f32", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "640s33b", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "m25p05", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "mx25l25635e", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "w25x16", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "esp", Description "esp": expected field "cmdlen", got "cmdbuf"; skipping rest
Section "w25x10", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "rtl8139", Description "rtl8139": expected field "tally_counters", got "tally_counters.TxOk"; skipping rest
Section "en25p64", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "w25q256", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "s25fl512s", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "s25sl004a", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "w25x20", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "mx25l4005a", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "n25q032", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "s25sl032a", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "sst25vf016b", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "sst25vf080b", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "s25sl032p", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "mx25l12855e", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "at25df641", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "w25q32", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "m45pe80", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "w25x32", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "dc390", Description "esp": expected field "cmdlen", got "cmdbuf"; skipping rest
Section "at25df041a", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "m25p16", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "m25p64", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "m25p10", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "mx25l3205d", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "en25p32", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "sst25wf080", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "at26df081a", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "at25fs040", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "sst25wf512", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "m45pe10", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "mx25l8005", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "sst25wf010", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "w25x40", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "m25p32", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "sst25vf032b", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "imx.fec" Section "imx.fec" Description "imx.fec": minimum version error: 1 < 2
Section "imx.fec", Description "imx.fec": expected field "irq_state", got "regs"; skipping rest
Section "mx25l6405d", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "e1000-82545em", Description "e1000": expected field "tx.ipcss", got "tx.props.ipcss"; skipping rest
Section "n25q032a13", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "n25q032a11", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "mx25l25655e", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "s25fl256s0", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "s25fl256s1", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "s70fl01gs", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "m25p128", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "s25fl064k", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "gd25q64", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "n25q064", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "sst25vf040b", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "w25q80", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "n25q512a", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "m25px64", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "mx25l2005a", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "m25pe80", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "at25256a-nonjedec", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "at25128a-nonjedec", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "m25px32-s1", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "w25x64", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "s25sl016a", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "m25pe16", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "160s33b", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "m25p40", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "arm-gicv3-common" Section "arm-gicv3-common" Description "arm_gicv3": minimum version error: 0 < 1
Section "am53c974", Description "esp": expected field "cmdlen", got "cmdbuf"; skipping rest
Section "n25q128", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "at25fs010", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "at26df321", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "n25q064a13", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "imx.gpt" does not exist in dest
Section "s25sl12800", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "s25sl12801", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "sst25wf040", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "s25sl008a", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "mx25l1606e", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "at26df161a", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "mx25l12805d", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "n25q256a", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "320s33b", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "at45db081d", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "at26f004", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "n25q064a11", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "e1000", Description "e1000": expected field "tx.ipcss", got "tx.props.ipcss"; skipping rest
Section "s25sl064a", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "n25q128a13", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "n25q128a11", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "w25q80bl", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "s25sl064p", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "s25fl129p0", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "s25fl129p1", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "m25px32", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
Section "en25q32b", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest


--ar6qcot2hljtkiw5--
