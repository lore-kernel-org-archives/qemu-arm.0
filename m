Received: by 10.80.163.71 with SMTP id 65csp382860edn;
        Fri, 23 Sep 2016 05:21:42 -0700 (PDT)
X-Received: by 10.237.55.225 with SMTP id j88mr7554683qtb.131.1474633302708;
        Fri, 23 Sep 2016 05:21:42 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i198si4957390qke.191.2016.09.23.05.21.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Sep 2016 05:21:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45459 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bnPU6-0004uX-3a
	for alex.bennee@linaro.org; Fri, 23 Sep 2016 08:21:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1bnPTz-0004su-9f
	for qemu-arm@nongnu.org; Fri, 23 Sep 2016 08:21:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1bnPTv-0003P2-8g
	for qemu-arm@nongnu.org; Fri, 23 Sep 2016 08:21:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46300)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>)
	id 1bnPTv-0003O6-1e; Fri, 23 Sep 2016 08:21:31 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 142B63B3D1;
	Fri, 23 Sep 2016 12:21:30 +0000 (UTC)
Received: from dhcp129-212.brq.redhat.com (dhcp129-212.brq.redhat.com
	[10.34.129.212])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8NCLRRB010519
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 23 Sep 2016 08:21:28 -0400
Message-ID: <1474633286.3487.8.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Wei Huang <wei@redhat.com>, qemu-arm@nongnu.org
Date: Fri, 23 Sep 2016 14:21:26 +0200
In-Reply-To: <1474557203-4977-3-git-send-email-wei@redhat.com>
References: <1474557203-4977-1-git-send-email-wei@redhat.com>
	<1474557203-4977-3-git-send-email-wei@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 23 Sep 2016 12:21:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH V5 2/2] arm: virt: add PMU property to
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
X-TUID: jiyvWTnIQeG5

On Thu, 2016-09-22 at 11:13 -0400, Wei Huang wrote:
> CPU vPMU is now turned off by default, but it was ON in virt-2.7
> machine type. To solve this problem, this patch adds a PMU option
> in machine state, which is used to control CPU's vPMU status. This
> PMU option is not exposed to command line and is turned on in
> virt-2.7 machine type to make sure it is backward compatible.
> 
> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>  hw/arm/virt.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Tested-by: Andrea Bolognani <abologna@redhat.com>

-- 
Andrea Bolognani / Red Hat / Virtualization
