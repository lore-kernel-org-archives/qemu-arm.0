Received: by 10.25.159.19 with SMTP id i19csp503304lfe;
        Fri, 15 Jan 2016 06:37:28 -0800 (PST)
X-Received: by 10.55.204.216 with SMTP id n85mr13759744qkl.36.1452868648783;
        Fri, 15 Jan 2016 06:37:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v10si13586674qge.63.2016.01.15.06.37.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2016 06:37:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:47227 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aK5VI-0002M7-6t
	for alex.bennee@linaro.org; Fri, 15 Jan 2016 09:37:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35782)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aK5VG-0002Jd-4J
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 09:37:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aK5VC-0004GQ-Nv
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 09:37:26 -0500
Received: from mail-pf0-x22e.google.com ([2607:f8b0:400e:c00::22e]:33254)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aK5VC-0004Fv-GQ
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 09:37:22 -0500
Received: by mail-pf0-x22e.google.com with SMTP id e65so118926356pfe.0
	for <qemu-arm@nongnu.org>; Fri, 15 Jan 2016 06:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=1j7AeftnJtbvwJuWL6rhVtyZpOO07yiJdJhCavlZTJQ=;
	b=hV1/b49UUBR8z2rC3KiMvBFbJBx8GcFXNkaTIVDgTaGqjnyknW/zLi8ZvaQQFKAWcO
	oZN54t/VRZoNOCjd3k8N8iYrU454OTaAS67WLkhmREOVvsoAuDd87krwYLJUHTvtXDZh
	0IY5FTNOPiQhXpA148xeYoxaxbhUAHKZFc/fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=1j7AeftnJtbvwJuWL6rhVtyZpOO07yiJdJhCavlZTJQ=;
	b=C72bXgmsTtaEq+F4HsnrkNefrDkml6gR4/I8HEzVHvSK7aS7+RWvfLBsfbBjgjI7+u
	+i47Alo0D3eCtAvjoO64urXsZM/UriDyajD+LEAattM46T9h3GQErv4QwnsQFrwdAG6p
	+HsArbestYNf2URnYKOAAvuLuekfQwO4YJlfcSso0YZt8bBhE1otG+7NxK2xvT/xoqhO
	QrM/2I+Gel2BcqzmK9x5CfnRkhTV4npU1vFwpfp54E71+XwVH5CaC/D0iREeMBxai2y/
	fxmbmbSMjj5WqomTKm0PBfH9oYD7E5w189WmS+8fA2gZP5HI77y7p2taQVyLz+ENtqpc
	nlwA==
X-Gm-Message-State: ALoCoQlhGBuK2fLcVzKIyQE6E5plbcHm3+uXp7LNrcN8r30nB0v0l4VhRfmMr7SEd4kPyIaNI6GKJj7B6pk4WN7Xumaf4kDwkw==
X-Received: by 10.98.42.135 with SMTP id q129mr15324254pfq.13.1452868641809;
	Fri, 15 Jan 2016 06:37:21 -0800 (PST)
Received: from [10.13.145.18] ([167.160.116.205])
	by smtp.googlemail.com with ESMTPSA id
	cl3sm16106744pad.11.2016.01.15.06.37.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Jan 2016 06:37:20 -0800 (PST)
Message-ID: <56990425.3020004@linaro.org>
Date: Fri, 15 Jan 2016 22:37:25 +0800
From: Shannon Zhao <shannon.zhao@linaro.org>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, Laszlo Ersek <lersek@redhat.com>
References: <1452696857-4091-1-git-send-email-shannon.zhao@linaro.org>
	<20160113161641.GC10709@hawk.localdomain>
	<56967AA4.40300@redhat.com>
	<CAFEAcA_f=j0KupJG6z1E+O7oqbhgKbSCdUob9GOdsEQRCBuz_w@mail.gmail.com>
In-Reply-To: <CAFEAcA_f=j0KupJG6z1E+O7oqbhgKbSCdUob9GOdsEQRCBuz_w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::22e
Cc: Andrew Jones <drjones@redhat.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	"edk2-devel@lists.01.org" <edk2-devel@ml01.01.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
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
X-TUID: yBqhnNeHSpSz



On 2016/1/15 22:34, Peter Maydell wrote:
> On 13 January 2016 at 16:26, Laszlo Ersek<lersek@redhat.com>  wrote:
>> >On 01/13/16 17:16, Andrew Jones wrote:
>>> >>On Wed, Jan 13, 2016 at 10:54:17PM +0800, Shannon Zhao wrote:
>>>> >>>When booting the VM with UEFI, UEFI takes ownership of the RTC hardware.
>>>> >>>While UEFI can use libfdt to disable the RTC device node in the DTB that
>>>> >>>it passes to the OS, it cannot modify AML. Therefore, we won't generate
>>>> >>>the RTC ACPI device at all when using UEFI.
>>> >>
>>> >>I think a condensed comment similar to this commit message would be nice
>>> >>in build_dsdt, or somewhere. We have a policy for mach-virt of generating
>>> >>ACPI for everything we generate DT. It'd be good if we documented all the
>>> >>divergences in order to avoid confusion. [...]
>> >
>> >Good idea!
> I'm happy with the code in this patch, so you can add my
> Reviewed-by: Peter Maydell<peter.maydell@linaro.org>
>
Sorry, missed this. I've sent the v3.

> Shannon, I'm assuming you're planning a v3 with the comment that
> Andrew and Laszlo suggest.

-- 
Shannon
