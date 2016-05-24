Received: by 10.25.30.65 with SMTP id e62csp822533lfe;
        Tue, 24 May 2016 09:27:26 -0700 (PDT)
X-Received: by 10.55.70.66 with SMTP id t63mr4363378qka.173.1464107246122;
        Tue, 24 May 2016 09:27:26 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u73si3161738qka.270.2016.05.24.09.27.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 May 2016 09:27:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54246 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5FAz-0001V9-Dd
	for alex.bennee@linaro.org; Tue, 24 May 2016 12:27:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59354)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b5FAw-0001RQ-An
	for qemu-arm@nongnu.org; Tue, 24 May 2016 12:27:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b5FAp-0003cM-Ni
	for qemu-arm@nongnu.org; Tue, 24 May 2016 12:27:21 -0400
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:35586)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b5FAp-0003c9-Id
	for qemu-arm@nongnu.org; Tue, 24 May 2016 12:27:15 -0400
Received: by mail-vk0-x22c.google.com with SMTP id f66so28910250vkh.2
	for <qemu-arm@nongnu.org>; Tue, 24 May 2016 09:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=So8x459wVsb5YvOT8hXogXYbkViGYfxETnC/exI/H5c=;
	b=VfJB50lXvq387Ap3LccUxlDU9L5/l3L7N4pZfPsThC60bXEtzLQZenrX1bHZ//MKzv
	rwq3HoBtVwEjk0wttNH5PZXsZ1r5A/jRDP4tX6aQuFVPSIN8w5v6hQ5itLIVtMJ+r53L
	NDndGYlhWbeUVRvnuNW4j9kJjNIARo8MOMuLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=So8x459wVsb5YvOT8hXogXYbkViGYfxETnC/exI/H5c=;
	b=B6xrLouLA7bSHtr1PgsUF06fvcusahLZs/pHBTYUpSPpVJS9h3+UVwwu8P+Qam+XQP
	PVl2GRtcq9lsvCvcgNKNw7kB84ZV/M96l+Z6lwjA7aISqTsWMVe/DRXRxJ5cLAhNrGYj
	Hksk3m5PxYhT2CP89KEL1g/tFi2FFTPh8hMDXNrLj77UItMJ8IavVRIt9tXWv21i7tR6
	nbrewOPKwldkBNmv6gloTAOhOUdSLTgLhF58nu/IvTBmwKcnZAyRYeZ+cy6VnWwnXn/v
	vur4lorxmHttIsNjFZt86SfeXd0s4H3w9wwsVPco6GmeNWxTmEV7rhy3ctF4kBJZyAYt
	/LfA==
X-Gm-Message-State: ALyK8tKppvK1euARGtdVJFHq+gkDZvWwesi4qJWxU5k2Bbpu9z8BOBQvEus+qejHJPUbK0Bzy6kZOGcsO73xntFo
X-Received: by 10.31.88.196 with SMTP id m187mr3025480vkb.37.1464107235022;
	Tue, 24 May 2016 09:27:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.69.66 with HTTP; Tue, 24 May 2016 09:26:54 -0700 (PDT)
In-Reply-To: <1463698459-31312-4-git-send-email-edgar.iglesias@gmail.com>
References: <1463698459-31312-1-git-send-email-edgar.iglesias@gmail.com>
	<1463698459-31312-4-git-send-email-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 May 2016 17:26:54 +0100
Message-ID: <CAFEAcA9+ow6BAhqk5hUeoR50gUhX0TJy75r1ViUZJ-vEbLawJw@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Subject: Re: [Qemu-arm] [PATCH v1 3/5] xlnx-zynqmp: Make the RPU subsystem
 optional
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NeNznOqDb7Ti

On 19 May 2016 at 23:54, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> The way we currently model the RPU subsystem is of quite
> limited use. In addition to that, it causes problems for
> KVM and for GDB debugging.
>
> Make the RPU optional by adding a has_rpu property and
> default to having it disabled.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  hw/arm/xlnx-zynqmp.c         | 50 +++++++++++++++++++++++++++++++++++++-------
>  include/hw/arm/xlnx-zynqmp.h |  2 ++
>  2 files changed, 44 insertions(+), 8 deletions(-)
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 250ecc4..c180206 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -83,6 +83,40 @@ static inline int arm_gic_ppi_index(int cpu_nr, int ppi_index)
>      return GIC_NUM_SPI_INTR + cpu_nr * GIC_INTERNAL + ppi_index;
>  }
>
> +static bool xlnx_zynqmp_get_has_rpu(Object *obj, Error **errp)
> +{
> +    XlnxZynqMPState *s = XLNX_ZYNQMP(obj);
> +
> +    return s->has_rpu;
> +}
> +
> +static void xlnx_zynqmp_set_has_rpu(Object *obj, bool value, Error **errp)
> +{
> +    XlnxZynqMPState *s = XLNX_ZYNQMP(obj);
> +    int i;
> +
> +    if (s->has_rpu == value) {
> +        /* Nothing to do.  */
> +        return;
> +    }
> +
> +    /* We don't support clearing the flag.  */
> +    if (s->has_rpu) {
> +        error_setg(errp, "has_rpu is already set to %u",
> +                   s->has_rpu);
> +        return;
> +    }
> +
> +    /* Create the Cortex R5s.  */
> +    for (i = 0; i < XLNX_ZYNQMP_NUM_RPU_CPUS; i++) {
> +        object_initialize(&s->rpu_cpu[i], sizeof(s->rpu_cpu[i]),
> +                          "cortex-r5-" TYPE_ARM_CPU);
> +        object_property_add_child(obj, "rpu-cpu[*]", OBJECT(&s->rpu_cpu[i]),
> +                                  &error_abort);
> +    }

Do we have to create them in the set function so we can
set properties before realize, or could this be deferred
to realize time?


thanks
-- PMM
