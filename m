Received: by 10.25.21.156 with SMTP id 28csp1138395lfv;
        Thu, 4 Aug 2016 01:23:58 -0700 (PDT)
X-Received: by 10.55.201.200 with SMTP id m69mr4911435qkl.235.1470299038319;
        Thu, 04 Aug 2016 01:23:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s22si7520876qts.105.2016.08.04.01.23.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Aug 2016 01:23:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38391 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bVDwb-0000K9-L5
	for alex.bennee@linaro.org; Thu, 04 Aug 2016 04:23:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54394)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1bVDwX-0000HY-Jf
	for qemu-arm@nongnu.org; Thu, 04 Aug 2016 04:23:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1bVDwR-0004gt-RY
	for qemu-arm@nongnu.org; Thu, 04 Aug 2016 04:23:52 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58878
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1bVDwR-0004gf-Lu
	for qemu-arm@nongnu.org; Thu, 04 Aug 2016 04:23:47 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
	u748JM9T072799
	for <qemu-arm@nongnu.org>; Thu, 4 Aug 2016 04:23:47 -0400
Received: from e06smtp08.uk.ibm.com (e06smtp08.uk.ibm.com [195.75.94.104])
	by mx0a-001b2d01.pphosted.com with ESMTP id 24kkak79a1-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-arm@nongnu.org>; Thu, 04 Aug 2016 04:23:46 -0400
Received: from localhost
	by e06smtp08.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <cornelia.huck@de.ibm.com>;
	Thu, 4 Aug 2016 09:23:44 +0100
Received: from d06dlp02.portsmouth.uk.ibm.com (9.149.20.14)
	by e06smtp08.uk.ibm.com (192.168.101.138) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 4 Aug 2016 09:23:42 +0100
X-IBM-Helo: d06dlp02.portsmouth.uk.ibm.com
X-IBM-MailFrom: cornelia.huck@de.ibm.com
X-IBM-RcptTo: qemu-arm@nongnu.org;qemu-devel@nongnu.org;qemu-ppc@nongnu.org
Received: from b06cxnps4076.portsmouth.uk.ibm.com
	(d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id 533F5219005E; 
	Thu,  4 Aug 2016 09:23:07 +0100 (BST)
Received: from d06av05.portsmouth.uk.ibm.com (d06av05.portsmouth.uk.ibm.com
	[9.149.37.229])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u748NfBv3146016; Thu, 4 Aug 2016 08:23:41 GMT
Received: from d06av05.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av05.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u748Nf1r016013; Thu, 4 Aug 2016 02:23:41 -0600
Received: from gondolin (dyn-9-152-224-112.boeblingen.de.ibm.com
	[9.152.224.112])
	by d06av05.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u748NfrB015994; Thu, 4 Aug 2016 02:23:41 -0600
Date: Thu, 4 Aug 2016 10:23:39 +0200
From: Cornelia Huck <cornelia.huck@de.ibm.com>
To: "Daniel P. Berrange" <berrange@redhat.com>
In-Reply-To: <1470241360-3574-5-git-send-email-berrange@redhat.com>
References: <1470241360-3574-1-git-send-email-berrange@redhat.com>
	<1470241360-3574-5-git-send-email-berrange@redhat.com>
Organization: IBM Deutschland Research & Development GmbH Vorsitzende des
	Aufsichtsrats: Martina Koederitz
	=?UTF-8?B?R2VzY2jDpGZ0c2bDvGhydW5nOg==?=
	Dirk Wittkopp Sitz der Gesellschaft: =?UTF-8?B?QsO2Ymxpbmdlbg==?=
	Registergericht: Amtsgericht Stuttgart, HRB 243294
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.23; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16080408-0032-0000-0000-000001F5E9A4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16080408-0033-0000-0000-00001C42EBE6
Message-Id: <20160804102339.31c6fb8f.cornelia.huck@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-08-04_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
	definitions=main-1608040094
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
Subject: Re: [Qemu-arm] [PATCH 4/5] hw: replace most use of
 qemu_chr_fe_write with qemu_chr_fe_write_all
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
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Amit Shah <amit.shah@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w+Mw9BirWkKS

On Wed,  3 Aug 2016 17:22:39 +0100
"Daniel P. Berrange" <berrange@redhat.com> wrote:

> The qemu_chr_fe_write method will return -1 on EAGAIN if the
> chardev backend write would block. Almost no callers of the
> qemu_chr_fe_write() method check the return value, instead
> blindly assuming data was successfully sent. In most cases
> this will lead to silent data loss on interactive consoles,
> but in some cases (eg RNG EGD) it'll just cause corruption
> of the protocol being spoken.
> 
> We unfortunately can't fix the virtio-console code, due to
> a bug in the Linux guest drivers, which would cause the
> entire Linux kernel to hang if we delay processing of the
> incoming data in any way. Fixing this requires first fixing
> the guest driver to not hold spinlocks while writing to the
> hvc device backend.
> 
> Fixes bug: https://bugs.launchpad.net/qemu/+bug/1586756
> 
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> ---
>  backends/rng-egd.c          |  4 +++-
>  gdbstub.c                   |  4 +++-
>  hw/arm/omap2.c              |  8 +++++---
>  hw/arm/pxa2xx.c             |  4 +++-
>  hw/arm/strongarm.c          |  4 +++-
>  hw/char/bcm2835_aux.c       |  4 +++-
>  hw/char/debugcon.c          |  4 +++-
>  hw/char/digic-uart.c        |  2 ++
>  hw/char/escc.c              |  4 +++-
>  hw/char/etraxfs_ser.c       |  4 +++-
>  hw/char/exynos4210_uart.c   |  4 +++-
>  hw/char/grlib_apbuart.c     |  4 +++-
>  hw/char/imx_serial.c        |  4 +++-
>  hw/char/ipoctal232.c        |  4 +++-
>  hw/char/lm32_juart.c        |  2 ++
>  hw/char/lm32_uart.c         |  2 ++
>  hw/char/mcf_uart.c          |  4 +++-
>  hw/char/parallel.c          |  4 +++-
>  hw/char/pl011.c             |  4 +++-
>  hw/char/sclpconsole-lm.c    |  4 +++-
>  hw/char/sclpconsole.c       |  2 ++

ack for the sclp consoles

>  hw/char/sh_serial.c         |  4 +++-
>  hw/char/spapr_vty.c         |  5 +++--
>  hw/char/stm32f2xx_usart.c   |  2 ++
>  hw/char/virtio-console.c    | 21 +++++++++++++++++++++
>  hw/char/xilinx_uartlite.c   |  4 +++-
>  hw/usb/ccid-card-passthru.c |  7 +++++--
>  hw/usb/dev-serial.c         |  4 +++-
>  slirp/slirp.c               |  4 +++-
>  29 files changed, 104 insertions(+), 27 deletions(-)
> 

> diff --git a/hw/char/virtio-console.c b/hw/char/virtio-console.c
> index 4f0e03d..d44c18c 100644
> --- a/hw/char/virtio-console.c
> +++ b/hw/char/virtio-console.c
> @@ -68,6 +68,27 @@ static ssize_t flush_buf(VirtIOSerialPort *port,
>           */
>          if (ret < 0)
>              ret = 0;
> +
> +        /* XXX we should be queuing data to send later for the
> +         * console devices too rather than silently dropping
> +         * console data on EAGAIN. The Linux virtio-console
> +         * hvc driver though does sends with spinlocks held,
> +         * so if we enable throttling that'll stall the entire
> +         * guest kernel, not merely the process writing to the
> +         * console.
> +         *
> +         * While we could queue data for later write without
> +         * enabling throttling, this would result in the guest
> +         * being able to trigger arbitrary memory usage in QEMU
> +         * buffering data for later writes.
> +         *
> +         * So fixing this problem likely requires fixing the
> +         * Linux virtio-console hvc driver to not hold spinlocks
> +         * while writing, and instead merely block the process
> +         * that's writing. QEMU would then need some way to detect
> +         * if the guest had the fixed driver too, before we can
> +         * use throttling on host side.

Probably best done via a new virtio-console feature bit, as this would
be OS agnostic.

> +         */
>          if (!k->is_console) {
>              virtio_serial_throttle_port(port, true);
>              if (!vcon->watch) {

