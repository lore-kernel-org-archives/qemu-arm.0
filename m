Received: by 10.55.129.195 with SMTP id c186csp1234861qkd;
        Mon, 25 Jan 2016 03:56:42 -0800 (PST)
X-Received: by 10.140.165.7 with SMTP id l7mr21798592qhl.101.1453723002298;
        Mon, 25 Jan 2016 03:56:42 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r9si24099412qhb.7.2016.01.25.03.56.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jan 2016 03:56:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:38028 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aNflC-0000vu-16
	for alex.bennee@linaro.org; Mon, 25 Jan 2016 06:56:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35454)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aNfl9-0000vV-5A
	for qemu-arm@nongnu.org; Mon, 25 Jan 2016 06:56:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aNfl8-0006NO-Bc
	for qemu-arm@nongnu.org; Mon, 25 Jan 2016 06:56:39 -0500
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:33298)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aNfl8-0006NC-7Y
	for qemu-arm@nongnu.org; Mon, 25 Jan 2016 06:56:38 -0500
Received: by mail-vk0-x231.google.com with SMTP id e64so73018047vkg.0
	for <qemu-arm@nongnu.org>; Mon, 25 Jan 2016 03:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=byurhGwkEbRxT2mL7ODJQGHlB8OVcD/K2UewFJK/dRg=;
	b=UA5cPj5yqYMFgstG6ELQTB+w2nrhCYe1owNS2iG6F1ApwDraL2bNdcfEQ9uPuK95Yu
	bnPoh+yPDAniCOG92/Kty1M7wfc3cubIxFg0YryM4mOd0zJbisacxiXJxyFNSeipSi+1
	FsDybzGP+Bw5YoUIfz9zSU1sVDFcgH8JlIKgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=byurhGwkEbRxT2mL7ODJQGHlB8OVcD/K2UewFJK/dRg=;
	b=UXabZ/V1+pl+9p3nieMRHvVsjtAuhUtar3xUq7bwzVXuDGIcyBTH37pe+EfUFJDXVJ
	VC2D0wESMCgUg8zLF2GyLKgODuiAcfB8z+woCVNU1Wkyaw5FOXgtIrdfhlLO+CPqlLsX
	jArRpWVa88UA0rX6C98FsYSYbKy3mskpQwwNWdvj5wuUQsivg4cefscur82A/uL2Ahbx
	kxo0hx9L6/K++blCvAv+0qWdmIn/4aUnEoBg2WcYKsfaY3DxWBj3Ze1vew41cRd69sdM
	/qB9GrBChBY3zroiB20E/NhcXmUtUmgeEbnkQoQgCJWPAuH7KIY87T6LWWroqsK+goCt
	qkKg==
X-Gm-Message-State: AG10YOTaFhI4bbElGU1CG+TOOj4LvCbA8rV90QeR2kV8acOX8D0AgDhRmeMEbBnYAuhfZydFnTzTrvHuO7wWNm5J
X-Received: by 10.31.107.138 with SMTP id k10mr9451868vki.27.1453722997811;
	Mon, 25 Jan 2016 03:56:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Mon, 25 Jan 2016 03:56:18 -0800 (PST)
In-Reply-To: <1453380893-26174-1-git-send-email-drjones@redhat.com>
References: <1453380893-26174-1-git-send-email-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jan 2016 11:56:18 +0000
Message-ID: <CAFEAcA-Hw-MaJyRCgb4NLH4Hi7_N_=J1v=VBnhRXYUqJdwZexQ@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: Re: [Qemu-arm] [PATCH] virt-acpi-build: add always-on property for
	timer
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
X-TUID: s1HJz0Bn6mbQ

On 21 January 2016 at 12:54, Andrew Jones <drjones@redhat.com> wrote:
> This patch is the ACPI equivalent of "hw/arm/virt: Add always-on
> property to the virt board timer". The timer is always on, and
> thus setting this informs Linux that it may switch off the periodic
> timer. Switching off the periodic timer substantially reduces the
> number of interrupts the host needs to inject.
>
> Testing note: AArch64 guests (the only ones currently booting with
> ACPI) do not actually need this patch to determine it can turn the
> periodic timer off. I therefore used a hacked guest kernel to ensure
> this patch works as the equivalent DT patch does.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>



Applied to target-arm.next, thanks.

-- PMM
