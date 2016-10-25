Received: by 10.80.166.35 with SMTP id d32csp2925542edc;
        Mon, 24 Oct 2016 18:10:26 -0700 (PDT)
X-Received: by 10.31.179.69 with SMTP id c66mr13546751vkf.52.1477357826399;
        Mon, 24 Oct 2016 18:10:26 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f67si2153100vka.1.2016.10.24.18.10.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Oct 2016 18:10:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51005 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1byqG1-0003o8-SL
	for alex.bennee@linaro.org; Mon, 24 Oct 2016 21:10:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jerry@smartechhomes.com>) id 1byqFy-0003nx-Lk
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 21:10:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jerry@smartechhomes.com>) id 1byqFt-0001cV-La
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 21:10:22 -0400
Received: from smartechhomes.com ([66.246.75.169]:47660)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jerry@smartechhomes.com>)
	id 1byqFt-0001ZP-J6
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 21:10:17 -0400
Received: from pool-173-73-25-174.washdc.fios.verizon.net ([173.73.25.174]
	helo=[206.223.85.7])
	by smartechhomes.com with esmtpa (Exim 4.80 #2 (Debian))
	id 1byqFX-000343-FU
	for <qemu-arm@nongnu.org>; Mon, 24 Oct 2016 21:10:10 -0400
To: qemu-arm@nongnu.org
References: <d5394b04-170e-bdbf-2a23-bfd057cd1ad7@smartechhomes.com>
From: Jerry Stuckle <jerry@smartechhomes.com>
Message-ID: <a4c75a7b-fdf5-2ddd-762c-723f25677b9d@smartechhomes.com>
Date: Mon, 24 Oct 2016 21:09:52 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <d5394b04-170e-bdbf-2a23-bfd057cd1ad7@smartechhomes.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-ACL-Warn: Your server announces itself ([206.223.85.7]) with a bare IP
	address which is in breach of RFC2821
X-SA-Exim-Connect-IP: 173.73.25.174
X-SA-Exim-Mail-From: jerry@smartechhomes.com
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:57:07 +0000)
X-SA-Exim-Scanned: Yes (on smartechhomes.com)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.246.75.169
Subject: Re: [Qemu-arm] Defining a bridge
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dpIYwticRTZt

Anyone have an idea on this?

On 10/21/2016 3:45 PM, Jerry Stuckle wrote:
> Hi, all,
> 
> To start out, I am a programmer, not a Linux administrator.  So please
> be gentle with me - I'm in over my head here. :)
> 
> 
> To start, my setup is: Windows 7 as the base OS with two nics, wired and
> wireless (only one active at a time).  Under this I have Oracle Virtual
> Machine running Ubuntu 4.4.0-38-generic (latest stable release).  I have
> set up a bridge in Ubuntu's Network Manager as described on
> http://ask.xmodulo.com/configure-linux-bridge-network-manager-ubuntu.html.
>  The bridge is defined as "bridge0" and works correctly in Ubuntu.
> 
> I start QEMU under Ubuntu with:
> 
> qemu-system-arm -m 1024M \
> 	-sd /export/armhf.qcow2 \
> 	-M vexpress-a9 \
> 	-cpu cortex-a9 \
> 	-kernel /export/boot/vmlinuz \
> 	-initrd /export/boot/initrd.img \
> 	-append "root=/dev/mmcblk0p2" \
> 	-device virtio-net-device,netdev=net0 \
> 	-netdev bridge,br=bridge0,id=net0,helper=/usr/lib/qemu/qemu-bridge-helper
> 
> Guest system is Debian 3.2.0-4-vexpress, again the latest stable
> version.  I get a SLIRP connection just fine when I don't specify the
> -device and -netdev parameters.  The "lshw" shows the driver to be
> smsc911x, but I don't know how to relate that to which NIC is being
> emulated (it at least works).
> 
> When I do specify the -device and -netdev parameters, I get no network.
> The log shows nothing unusual other than no network device is found.
> 
> Are there any known problems with a setup like this?  If not, does
> anyone have an idea as to what I am doing wrong?  I appreciate any and
> all suggestions.
> 
> Jerry
> 

