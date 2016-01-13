Received: by 10.25.159.19 with SMTP id i19csp1216273lfe;
        Wed, 13 Jan 2016 08:16:56 -0800 (PST)
X-Received: by 10.55.82.193 with SMTP id g184mr181951638qkb.65.1452701816595;
        Wed, 13 Jan 2016 08:16:56 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c189si1962918qhc.122.2016.01.13.08.16.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jan 2016 08:16:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37992 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJO6S-0000o0-12
	for alex.bennee@linaro.org; Wed, 13 Jan 2016 11:16:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aJO6N-0000nj-Mj
	for qemu-arm@nongnu.org; Wed, 13 Jan 2016 11:16:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aJO6J-0004eq-JF
	for qemu-arm@nongnu.org; Wed, 13 Jan 2016 11:16:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:15617)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1aJO6J-0004e1-EW; Wed, 13 Jan 2016 11:16:47 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 84C3FC07582F;
	Wed, 13 Jan 2016 16:16:46 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-158.brq.redhat.com [10.34.1.158])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0DGGfoD027028
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 13 Jan 2016 11:16:44 -0500
Date: Wed, 13 Jan 2016 17:16:41 +0100
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <shannon.zhao@linaro.org>
Message-ID: <20160113161641.GC10709@hawk.localdomain>
References: <1452696857-4091-1-git-send-email-shannon.zhao@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1452696857-4091-1-git-send-email-shannon.zhao@linaro.org>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, ard.biesheuvel@linaro.org, edk2-devel@ml01.01.org,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	zhaoshenglong@huawei.com, lersek@redhat.com
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] ARM: Virt: Don't generate
 RTC ACPI device when using UEFI
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fcVhffJEtgfM

On Wed, Jan 13, 2016 at 10:54:17PM +0800, Shannon Zhao wrote:
> When booting the VM with UEFI, UEFI takes ownership of the RTC hardware.
> While UEFI can use libfdt to disable the RTC device node in the DTB that
> it passes to the OS, it cannot modify AML. Therefore, we won't generate
> the RTC ACPI device at all when using UEFI.

I think a condensed comment similar to this commit message would be nice
in build_dsdt, or somewhere. We have a policy for mach-virt of generating
ACPI for everything we generate DT. It'd be good if we documented all the
divergences in order to avoid confusion. I won't insist though.

Thanks,
drew
