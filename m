Received: by 10.182.158.201 with SMTP id ww9csp2617935obb;
        Tue, 15 Dec 2015 10:37:09 -0800 (PST)
X-Received: by 10.55.78.207 with SMTP id c198mr6105987qkb.34.1450204629603;
        Tue, 15 Dec 2015 10:37:09 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e38si2279940qgd.22.2015.12.15.10.37.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Dec 2015 10:37:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:38664 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a8uTF-0006We-9j
	for alex.bennee@linaro.org; Tue, 15 Dec 2015 13:37:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a8uTC-0006Vh-OS
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 13:37:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a8uTB-0008Ql-9E
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 13:37:06 -0500
Received: from mail-ob0-x232.google.com ([2607:f8b0:4003:c01::232]:33758)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a8uTB-0008Qe-3b
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 13:37:05 -0500
Received: by mail-ob0-x232.google.com with SMTP id sd4so13936081obb.0
	for <qemu-arm@nongnu.org>; Tue, 15 Dec 2015 10:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=axtdZmvol9I1p8DQVYOtNhKmvBUd+OcNBVmwSTOcNNU=;
	b=AuR2/jq3Qnh8j/y3iVQZEc+Ysg5HBxgP+A9yYl0on09pcdcOXMF+KkNJtqvXPeY+A0
	t13NXOwoHZulrSqT+mrmcDHV99axr4tmWYRKWnvtHUutL2gw4RIbGCGgEP6FJaPhPEvc
	pV9xPnHXRxjs4PI2rn5j/KLv12GTSQkfCAeoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=axtdZmvol9I1p8DQVYOtNhKmvBUd+OcNBVmwSTOcNNU=;
	b=DHbZ7cdXcQR/Mafdu6yMwMm6mRp7ulhSky/Z9NwXFQ68B+42ELrOyVUBnLsC7arOWR
	5BRD9glXkTe083RtMjmMTisR1emDXcNklvwuvwkbLy3msmY8uwlED/5zR53P78DwHFRs
	yQYyRcRmBikW6liShjNje6AxsV/RZXtzsIxK7IoYDi/sA2uoLE9vzVxMIRRZXRxlE1mc
	C9LRbaoJJcTzslvs/HSniXsj5VtimoJbKCWVA+/jOduQx0NbCxJ7kbNjkaueYfSLtbL6
	rNiD6sXExXz4qOmsyF/1r70htPd9GhzadeD0UMfB/lcRaNcalnfQOrnJ1MV2jMnUdRV0
	SEdw==
X-Gm-Message-State: ALoCoQlPKOORBG8Ubv9Qw5tY30woVCZ7mH1RVcvnx3RAnyZXziscZC/kWfQzZn1QC5dfGgiQRQGlxNqQujRYB4TgVKus3pJzlNRnApPaDPxZT0ozPJ7IfBg=
X-Received: by 10.182.213.7 with SMTP id no7mr31157058obc.22.1450204624541;
	Tue, 15 Dec 2015 10:37:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.52.97 with HTTP; Tue, 15 Dec 2015 10:36:45 -0800 (PST)
In-Reply-To: <1449804086-3464-1-git-send-email-zhaoshenglong@huawei.com>
References: <1449804086-3464-1-git-send-email-zhaoshenglong@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Dec 2015 18:36:45 +0000
Message-ID: <CAFEAcA9mMH8AJ4t-Y_2mGyBgkL3UbO8X_QzQfoH2A_GvqV10hg@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::232
Cc: G Gregory <graeme.gregory@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Igor Mammedov <imammedo@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v5 00/10] Add system_powerdown support on ARM
	for ACPI and DT
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
X-TUID: Qshyr3yDdSjy

On 11 December 2015 at 03:21, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
>
> ACPI SPEC 5.0 defines GPIO-signaled ACPI Events for Hardware-reduced
> platforms(like ARM). It uses GPIO pin to trigger an event to the guest.
> For QEMU, here we add PL061 GPIO controller and use PIN 3 for
> system_powerdown, reserving PIN 0, 1, 2 for PCI hotplug, CPU hotplug and
> memory hotplug.
>
> This patchset adds system_powerdown support on ARM through both ACPI and
> DT ways. It adds a GPIO controller(here is PL061) in machine virt and
> uses GPIO-singled event for ACPI while gpio-keys for DT. It has been
> tested for the guests starting by ACPI or DT while guests use systemd or
> acpid.

Thanks, applied to target-arm.next.

-- PMM
