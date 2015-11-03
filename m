Received: by 10.182.105.169 with SMTP id gn9csp1711829obb;
        Tue, 3 Nov 2015 00:16:30 -0800 (PST)
X-Received: by 10.140.168.11 with SMTP id o11mr36801451qho.28.1446538590198;
        Tue, 03 Nov 2015 00:16:30 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 77si21482747qhh.73.2015.11.03.00.16.29
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Tue, 03 Nov 2015 00:16:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:46319 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZtWlW-0005Qf-Rp
	for alex.bennee@linaro.org; Tue, 03 Nov 2015 03:16:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49292)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZtWlN-0005DR-HE
	for qemu-arm@nongnu.org; Tue, 03 Nov 2015 03:16:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZtWlM-0004nX-Oi
	for qemu-arm@nongnu.org; Tue, 03 Nov 2015 03:16:17 -0500
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:35324)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZtWlM-0004nQ-G8
	for qemu-arm@nongnu.org; Tue, 03 Nov 2015 03:16:16 -0500
Received: by vkfw189 with SMTP id w189so4916720vkf.2
	for <qemu-arm@nongnu.org>; Tue, 03 Nov 2015 00:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zm3+x/P1GTQFW9jb5Q2gF1P+1biSu0NtDLkrorLEBms=;
	b=l66TrNYWg7fs0d+Gc+2Zl5DhJNUJ3+pX312bg2uEV5GqSCe8CjgllRb9305rwObfhf
	6FIIOP37g4VXKCcxpept3ji8Y/StSNUuGHDM3K+K8CJGIERD738Hxk7j4PTQoadE/eNK
	ihvRkfaEn1AoZoKAsXkss7M1So8TWIKBRFsfZYo4fA5sL1myfpfevV9wxmH5xfBNvO2R
	aeTFL404LOc3Qf0W4eR6pUba7JF2opdYm1fWwoxPvnx3CaZalxAmVzKSvTWGWSg6fwZ2
	iIvQCPUGUBSxuwaz1melJ6XY5bXyVcieVqZucE/krqUd1JLbYWHTYijBlnXsbur1EBWI
	9yHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zm3+x/P1GTQFW9jb5Q2gF1P+1biSu0NtDLkrorLEBms=;
	b=DDi2fFvU00e0IBJZsFir0fiom8yyohAb1KRNtTE+A10DGOUrYtVGtGxY4W7ek04D1d
	z/RtNySitaypQyZnOfnGDlj88YqxxPv1od9vPGBBV88kFXxI0Qdq+bCVRJNF1BJczBpZ
	f9UoFAC4AppwnIIit0UlOa6AnRNIKS24DQNpUjUKkNwHUCaGtPPbQ2Xn7fC4OP4ADeYW
	CIjIt6up75hUkNkC8QOgZixFI05jJcpBJiG9OCp12NYmmBklhsVuHDxnHv1DHnjP0p5v
	G/HrUH/lwyAhwzkeJciXsOYNBqz93RU/VpUpuA0g/2wBpNcweF8kwhaKGUiQBXAGQBub
	IzKw==
X-Gm-Message-State: ALoCoQnbeEUie/P8x+rXacy/PAuYJFRjaBKljhVI01Axh6rDw2fIRMm/IIBxgLDtALXWc3uFUy8V
X-Received: by 10.31.136.144 with SMTP id k138mr17719722vkd.92.1446538575961; 
	Tue, 03 Nov 2015 00:16:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 3 Nov 2015 00:15:56 -0800 (PST)
In-Reply-To: <CAPokK=q9G22p6LZFcnzpjuNo2KntmstQDTeoVTSmmAx-Tw3S1Q@mail.gmail.com>
References: <1446285001-7316-1-git-send-email-zhaoshenglong@huawei.com>
	<CAPokK=o74VZSArfMBuybGFHhWu3g6+o=2Mcegwg7PDCT1n9n5g@mail.gmail.com>
	<CAFEAcA9d2VLd=3spu_3Ji+Zw_pRJr_yEQUjyh87Av6c7wHHE-w@mail.gmail.com>
	<CAPokK=q9G22p6LZFcnzpjuNo2KntmstQDTeoVTSmmAx-Tw3S1Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Nov 2015 08:15:56 +0000
Message-ID: <CAFEAcA_4dQvMOU0R5DZ6maB8fJ+U7uKZOYzDvPDRdVj8NYk_Lw@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::230
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	qemu-arm@nongnu.org, Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: Re: [Qemu-arm] [PATCH] ARM: ACPI: Fix MPIDR value in ACPI table
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
X-TUID: EJd59gGw3CGd

On 3 November 2015 at 04:33, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> So, I think this is just another case of the MPIDR information flow
> going the wrong way. It should go from board to all of CPU, DT and now
> this. I guess we can just fix this incrementally when we fix the
> implicit setting of MPIDR in mach-virt.

The difficulty with that is that to support KVM we need
to let KVM (ie the CPU object) override the board's ideas
about mpidr, because the kernel doesn't yet support letting
the board model inform it about what mpidr values to use.
So we probably need to have 'board model sets cpu property,
everything else reads cpu property which might or might not
be what the board hoped for'.

thanks
-- PMM
