Received: by 10.25.159.19 with SMTP id i19csp697679lfe;
        Tue, 2 Feb 2016 07:01:31 -0800 (PST)
X-Received: by 10.140.44.38 with SMTP id f35mr35839131qga.49.1454425291452;
        Tue, 02 Feb 2016 07:01:31 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m66si1318258qki.88.2016.02.02.07.01.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Feb 2016 07:01:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:57622 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aQcSR-0003Iq-43
	for alex.bennee@linaro.org; Tue, 02 Feb 2016 10:01:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35281)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aQcSL-0003Ch-UA
	for qemu-arm@nongnu.org; Tue, 02 Feb 2016 10:01:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aQcSF-0006lx-Uj
	for qemu-arm@nongnu.org; Tue, 02 Feb 2016 10:01:25 -0500
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:36443)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aQcSF-0006ll-QB
	for qemu-arm@nongnu.org; Tue, 02 Feb 2016 10:01:19 -0500
Received: by mail-vk0-x230.google.com with SMTP id n1so98925410vkb.3
	for <qemu-arm@nongnu.org>; Tue, 02 Feb 2016 07:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=NSp4Z5weZ+ASB05LAJ0T1PB2QdiIjba35sGLSPl9a64=;
	b=Bd4qlEsAyM1Zfl44IIgjiQqFPAoERhdRvvl+bnQNykxU7Ef5idCuV/IMJo0TXqJ+sF
	3XmTJ0J3Eg7W1+F22lsIl7x0egnG4ae/GJ9LAbSgPJJDTURt/v8jCwWnkxPfZnwikah0
	7CAZZdVdQ2SqiOfyqh+/DlzT7KTqglO+3WMKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=NSp4Z5weZ+ASB05LAJ0T1PB2QdiIjba35sGLSPl9a64=;
	b=DPr0jgVmGja/pMiUV18rtyKI7OGEhHZ4DbbASrj0D1k4UC2OAXZ1d70mrPk308n58i
	zZY8hpLHrn43MUTpBSQszwVKrv67nAcnzmbOpUa++EW6fx0/zOwjRlaMBWKF9h9cKTXx
	Wd2hWQfX7+iwiJt+PCrpIgC2P6lCI06WJqT/wTyWinBHCpwLv6jMDTlokYjNLrCLXHIG
	N/SbDQaSNwFZL0O/cdzT279knBQEc+1877+VPZJKY5D6ahD/sDVwl7YGb8Sejj4eJ4Mv
	im+ilZ1YICAb5xoclz8tV5RevkWgOxe1WULOBcVVOJLfkayvkOeqsJoJbFKfGTA1k3xP
	D2OA==
X-Gm-Message-State: AG10YOSzYtXJwh1RMjrL76RniOkFqq8eSOGCfMdD9L0EgTGpaJNv4gi/XGRdrntU/8seZyX4NKqiQQMQvzSB6G0p
X-Received: by 10.31.52.147 with SMTP id b141mr20508826vka.82.1454425279183;
	Tue, 02 Feb 2016 07:01:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 2 Feb 2016 07:00:59 -0800 (PST)
In-Reply-To: <1454323689-248759-1-git-send-email-imammedo@redhat.com>
References: <1454323689-248759-1-git-send-email-imammedo@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2016 15:00:59 +0000
Message-ID: <CAFEAcA8Ms4EF4y_LigwW2R3eXJUq5qDtkUpGsXjHYwMkKuKtKA@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Cc: Andrew Jones <drjones@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: Re: [Qemu-arm] [PATCH v2] arm: virt-acpi: each MADT.GICC entry as
	enabled unconditionally
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
X-TUID: 2CrKj61gT6Ii

On 1 February 2016 at 10:48, Igor Mammedov <imammedo@redhat.com> wrote:
> in current impl. condition
>
> build_madt() {
>   ...
>   if (test_bit(i, cpuinfo->found_cpus))
>
> is always true since loop handles only present CPUs
> in range [0..smp_cpus).
> But to fill usless cpuinfo->found_cpus we do unnecessary
> scan over QOM tree to find the same CPUs.
> So mark GICC as present always and drop not needed
> code that fills cpuinfo->found_cpus.
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
> v2:
>   - drop unused VIRT_ACPI_CPU_ID_LIMIT macro
> v1:
> It's just simple cleanup but I'm trying to generalize
> a bit CPU related ACPI tables and as part of it get rid
> of found_cpus bitmap and if possible cpu_index usage
> in ACPI parts of code.
> ---
>  hw/arm/virt-acpi-build.c         | 26 +++-----------------------
>  include/hw/arm/virt-acpi-build.h |  1 -
>  2 files changed, 3 insertions(+), 24 deletions(-)



Applied to target-arm.next, thanks.

-- PMM
