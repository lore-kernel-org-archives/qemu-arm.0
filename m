Received: by 10.182.158.201 with SMTP id ww9csp160321obb;
        Thu, 19 Nov 2015 15:44:49 -0800 (PST)
X-Received: by 10.129.80.11 with SMTP id e11mr9279102ywb.303.1447976689408;
        Thu, 19 Nov 2015 15:44:49 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r11si7957343ywg.179.2015.11.19.15.44.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Nov 2015 15:44:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44542 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZzYsj-00036n-1e
	for alex.bennee@linaro.org; Thu, 19 Nov 2015 18:44:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39767)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1ZzYsP-0002np-IL
	for qemu-devel@nongnu.org; Thu, 19 Nov 2015 18:44:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1ZzYsO-00027g-K8
	for qemu-devel@nongnu.org; Thu, 19 Nov 2015 18:44:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57795)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>)
	id 1ZzYsJ-00026r-Sb; Thu, 19 Nov 2015 18:44:23 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 8121142E5B2;
	Thu, 19 Nov 2015 23:44:22 +0000 (UTC)
Received: from ul30vt.home (ovpn-113-137.phx2.redhat.com [10.3.113.137])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAJNiKqJ020650; Thu, 19 Nov 2015 18:44:20 -0500
Message-ID: <1447976660.4697.210.camel@redhat.com>
From: Alex Williamson <alex.williamson@redhat.com>
To: Eric Auger <eric.auger@linaro.org>
Date: Thu, 19 Nov 2015 16:44:20 -0700
In-Reply-To: <1447946528-1533-1-git-send-email-eric.auger@linaro.org>
References: <1447946528-1533-1-git-send-email-eric.auger@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: b.reynal@virtualopensystems.com, peter.maydell@linaro.org,
	eric.auger@st.com, patches@linaro.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, suravee.suthikulpanit@amd.com,
	pbonzini@redhat.com, thomas.lendacky@amd.com, christoffer.dall@linaro.org
Subject: Re: [Qemu-devel] [RESEND RFC 0/6] AMD XGBE KVM platform passthrough
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yGuXLbb1Ure6

On Thu, 2015-11-19 at 15:22 +0000, Eric Auger wrote:
> I am resending this RFC from Oct 12, after kernel 4.4-rc1 and
> QEMU 2.5-rc1, hoping things have calmed down a little bit.
> 
> This RFC allows to set up AMD XGBE passthrough. This was tested on AMD
> Seattle.
> 
> The first upstreamed device supporting KVM platform passthrough was the
> Calxeda Midway XGMAC. Compared to this latter, the XGBE XGMAC exposes a
> much more complex device tree node. Generating the device tree node for
> the guest is the challenging and controversary part of this series.
> 
> - First There are 2 device tree node formats:
> one where XGBE and PHY are described in separate nodes and another one
> that combines both description in a single node (only supported by 4.2
> onwards kernels). Only the combined description is supported for passthrough,
> meaning the host must be >= 4.2 and must feature a device tree with a combined
> description. The guest will also be exposed with a combined description,
> meaning only >= 4.2 guest are supported. It is not planned to support
> separate node representation since assignment of the PHY is less
> straigtforward.
> 
> - the XGMAC/PHY node depends on 2 clock nodes (DMA and PTP).
> The code checks those clocks are fixed to make sure they cannot be
> switched off at some point after the native driver gets unbound.
> 
> - there are many property values to populate on guest side. Most of them
> cannot be hardcoded. That series proposes a way to parse the host device
> tree blob and retrieve host values to feed guest representation. Current
> approach relies on dtc binary availability plus libfdt usage.
> Other alternatives were discussed in:
> http://www.spinics.net/lists/kvm-arm/msg16648.html.
> 
> - Currently host booted with ACPI is not supported.

I won't pretend to know all the politics in the ARM space, but doesn't
this last bullet sort of imply that this is dead-on-arrival code?  Maybe
not in the embedded space, but certainly in the server space, I thought
ACPI was declared the winner.  Thanks,

Alex

