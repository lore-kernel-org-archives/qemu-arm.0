Received: by 10.25.208.137 with SMTP id h131csp11761lfg;
        Wed, 27 Apr 2016 19:34:45 -0700 (PDT)
X-Received: by 10.55.74.141 with SMTP id x135mr12442148qka.20.1461810885125;
        Wed, 27 Apr 2016 19:34:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j129si3843292qkd.267.2016.04.27.19.34.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Apr 2016 19:34:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46242 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1avbmu-0001Ci-MF
	for alex.bennee@linaro.org; Wed, 27 Apr 2016 22:34:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43818)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1avbmr-00019l-Gv
	for qemu-arm@nongnu.org; Wed, 27 Apr 2016 22:34:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1avbmm-0004XZ-HV
	for qemu-arm@nongnu.org; Wed, 27 Apr 2016 22:34:41 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:47604)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1avbml-0004V1-PV; Wed, 27 Apr 2016 22:34:36 -0400
Received: from 172.24.1.47 (EHLO szxeml430-hub.china.huawei.com)
	([172.24.1.47])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DGF69321; Thu, 28 Apr 2016 10:34:14 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml430-hub.china.huawei.com
	(10.82.67.185) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 28 Apr 2016 10:34:02 +0800
Message-ID: <5721768E.407@huawei.com>
Date: Thu, 28 Apr 2016 10:33:50 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: <r.sande@samsung.com>, "kvmarm@lists.cs.columbia.edu"
	<kvmarm@lists.cs.columbia.edu>, <qemu-arm@nongnu.org>
References: <BE.E9.04928.D4C61275@epcpsbgx1.samsung.com>
In-Reply-To: <BE.E9.04928.D4C61275@epcpsbgx1.samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.572176A9.0120, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 18f5f7ba130adb0ce4ec2991bb4e6d38
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Subject: Re: [Qemu-arm] [Query] Does Linux & Qemu support KVM for ARM32
 guest on ARM64 host
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
Cc: Marc Zyngier <marc.zyngier@arm.com>,
	Andre Przywara <andre.przywara@arm.com>, qemu-devel@nongnu.org,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 33stsomLzcQ+



On 2016/4/28 9:50, RAVINDRA KUMAR SANDE wrote:
> 
> What I did  :
> 1) Just for investigation, I took a ARMv8 ( OdroidC2 ) board
> 2)  I compiled Linux 3.14 with KVM support for this ARMv8 ( OdroidC2 )
> board, with modification replacing meson_timer by arm timer in its dts
> file.
> Why Linux 3.14 : I took Linux 3.14 because display drivers for this
> board are officially for this version; and I am interested in seeing
> some Linux guest booting with display on.
> 3)  I see from boot log of  that KVM is initialized successfully, and I
> can see /dev/kvm node.
> 4) I built latest Qemu with --enable-kvm on this board natively.
> 
> What I find :
> 1) running "qemu-system-arm  -enable-kvm   -machine vexpress-a9 ...."
> gives error :  no accelerator found
> 2) running "qemu-system-aarch64 -enable-kvm  -machine vexpress-a9 ...."
> gives error : kmv_init_vcpu (IOCtl on /dev/kvm) failed, guest not supported
> ( I experimented some modifications as well to overcome above error,
> such as replacing value assigned to cpu->kvm_target etc, but IOCtl call
> is failing)
> 
> Query:
> 1) Does Arm64 Linux not enable KVM support for Arm32 guest ?
> 2) Can qemu-system-arm not use the KVM feature on Arm64 host ?
> 3) Can qemu-system-aarch64 not use KVM feature for Arm32 guest ?
> 
You can use below command to boot a ARM32 guest on ARM64：

qemu-system-aarch64 -enable-kvm -machine virt,kernel_irqchip=on -cpu
host,aarch64=off ....

-- 
Shannon

