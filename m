Received: by 10.80.163.71 with SMTP id 65csp3347700edn;
        Thu, 6 Oct 2016 10:44:19 -0700 (PDT)
X-Received: by 10.55.119.134 with SMTP id s128mr15113106qkc.39.1475775859901;
        Thu, 06 Oct 2016 10:44:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b144si8349372qkg.46.2016.10.06.10.44.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Oct 2016 10:44:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58610 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bsCiQ-0003i8-MV
	for alex.bennee@linaro.org; Thu, 06 Oct 2016 13:44:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56367)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1bsCiJ-0003gj-EV
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 13:44:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1bsCiG-0003RE-BJ
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 13:44:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35908)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>)
	id 1bsCiG-0003R5-4z; Thu, 06 Oct 2016 13:44:08 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9B0A56ACD;
	Thu,  6 Oct 2016 17:44:07 +0000 (UTC)
Received: from dhcp129-212.brq.redhat.com (dhcp129-212.brq.redhat.com
	[10.34.129.212])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u96Hi4VA011739
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 6 Oct 2016 13:44:06 -0400
Message-ID: <1475775844.3533.76.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Wei Huang <wei@redhat.com>, qemu-arm@nongnu.org
Date: Thu, 06 Oct 2016 19:44:04 +0200
In-Reply-To: <1475617134-28180-3-git-send-email-wei@redhat.com>
References: <1475617134-28180-1-git-send-email-wei@redhat.com>
	<1475617134-28180-3-git-send-email-wei@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 06 Oct 2016 17:44:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH V6 2/2] arm: virt: add PMU property to
 mach-virt machine type
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-devel@nongnu.org,
	shannon.zhao@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xVHouA2AIk05

On Tue, 2016-10-04 at 17:38 -0400, Wei Huang wrote:
> CPU vPMU is now turned off by default, but it was ON in virt-2.7
> machine type. To solve this problem, this patch adds a PMU option
> in machine state, which is used to control CPU's vPMU status. This
> PMU option is not exposed to command line and is turned on in
> virt-2.7 machine type to make sure it is backward compatible.
> 
> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>  hw/arm/virt.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

On both Moonshot and ThunderX,

Tested-by: Andrea Bolognani <abologna@redhat.com>

-- 
Andrea Bolognani / Red Hat / Virtualization
