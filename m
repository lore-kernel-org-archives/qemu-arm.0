Received: by 10.25.159.19 with SMTP id i19csp1221689lfe;
        Wed, 13 Jan 2016 08:26:22 -0800 (PST)
X-Received: by 10.55.27.164 with SMTP id m36mr36553608qkh.84.1452702382077;
        Wed, 13 Jan 2016 08:26:22 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j61si2011306qgj.96.2016.01.13.08.26.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jan 2016 08:26:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38047 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJOFZ-0003u1-L9
	for alex.bennee@linaro.org; Wed, 13 Jan 2016 11:26:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1aJOFU-0003sU-5y
	for qemu-arm@nongnu.org; Wed, 13 Jan 2016 11:26:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1aJOFT-0006ss-FL
	for qemu-arm@nongnu.org; Wed, 13 Jan 2016 11:26:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44180)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1aJOFT-0006sc-9p; Wed, 13 Jan 2016 11:26:15 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id D0F94C09FA9B;
	Wed, 13 Jan 2016 16:26:14 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com ([10.3.113.3])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0DGQCbg020142; Wed, 13 Jan 2016 11:26:13 -0500
To: Andrew Jones <drjones@redhat.com>, Shannon Zhao <shannon.zhao@linaro.org>
References: <1452696857-4091-1-git-send-email-shannon.zhao@linaro.org>
	<20160113161641.GC10709@hawk.localdomain>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <56967AA4.40300@redhat.com>
Date: Wed, 13 Jan 2016 17:26:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20160113161641.GC10709@hawk.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, ard.biesheuvel@linaro.org, edk2-devel@ml01.01.org,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, zhaoshenglong@huawei.com
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
X-TUID: lyYJK3Zucwd9

On 01/13/16 17:16, Andrew Jones wrote:
> On Wed, Jan 13, 2016 at 10:54:17PM +0800, Shannon Zhao wrote:
>> When booting the VM with UEFI, UEFI takes ownership of the RTC hardware.
>> While UEFI can use libfdt to disable the RTC device node in the DTB that
>> it passes to the OS, it cannot modify AML. Therefore, we won't generate
>> the RTC ACPI device at all when using UEFI.
> 
> I think a condensed comment similar to this commit message would be nice
> in build_dsdt, or somewhere. We have a policy for mach-virt of generating
> ACPI for everything we generate DT. It'd be good if we documented all the
> divergences in order to avoid confusion. [...]

Good idea!

Thanks
Laszlo


