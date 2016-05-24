Received: by 10.25.30.65 with SMTP id e62csp821853lfe;
        Tue, 24 May 2016 09:25:56 -0700 (PDT)
X-Received: by 10.140.150.209 with SMTP id 200mr3951550qhw.62.1464107156750;
        Tue, 24 May 2016 09:25:56 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h184si3219594qke.54.2016.05.24.09.25.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 May 2016 09:25:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54238 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5F9Y-0000Nz-4A
	for alex.bennee@linaro.org; Tue, 24 May 2016 12:25:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58024)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b5F8E-0008DM-Ic
	for qemu-devel@nongnu.org; Tue, 24 May 2016 12:24:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b5F7v-0002r3-Q4
	for qemu-devel@nongnu.org; Tue, 24 May 2016 12:24:34 -0400
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:33017)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b5F7v-0002qr-Lj
	for qemu-devel@nongnu.org; Tue, 24 May 2016 12:24:15 -0400
Received: by mail-vk0-x22d.google.com with SMTP id r140so28841192vkf.0
	for <qemu-devel@nongnu.org>; Tue, 24 May 2016 09:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gUECpv4qi/8LG+i9QOKXuJ+0RC/igPIWjQoz/BOFMok=;
	b=P7S85yeCuZijhA7cB3fXOezLgRWjK7v3aTF1PLUd/HkYymaAQxPIbPnMQI7XMj2eqe
	GN8Htf8xZVZEuPcEijP6IDcxfjbbNyd1RsjcupNXaSJhrOePiJLWkbPXW7a+KdWJj3va
	vqHPK+fuvA5Q4TOtTa7cjxALhl5/pE2AYzveE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gUECpv4qi/8LG+i9QOKXuJ+0RC/igPIWjQoz/BOFMok=;
	b=buoJiuirJ2ZfiT61yzIq2/BIO+1FjPQCt+uZaNZm4QbKozzEoEY8P9GkelCOWA5m/D
	yyHsbfuXwJDsMGln57uviyVAeepk7bncHoFgrFVoqRNrHlBCb0Z+MgVmj3XUjGVLy/Ow
	gBO8r61bRNgO9Y/+FSdp/xlOiBd3rBBW2mzSnxCu1zBK2wCYfTZNxqjUXD95QJ2/8t86
	3JhkPK5pPTYiFpOTnrVf/fiX+9Rb2nr0mihy5+JSefv1OsSdyvI3k7p3DU65aCEhirGL
	Bg/GkUGusDullOlqgcAQUVTm/MCgJYleXEDeIEJ228F3nLw5xU6+rfa2aE6gAlau0LvN
	LyQA==
X-Gm-Message-State: ALyK8tIjyTb80+BiDK28I9ohXDa655oKTTouCPr1ge2Cn19F95YqaqLnWxORsy74D9eenM/Xo0O92/08SwZgRB3J
X-Received: by 10.31.148.1 with SMTP id w1mr3016210vkd.6.1464107055036; Tue,
	24 May 2016 09:24:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.69.66 with HTTP; Tue, 24 May 2016 09:23:55 -0700 (PDT)
In-Reply-To: <1463698459-31312-3-git-send-email-edgar.iglesias@gmail.com>
References: <1463698459-31312-1-git-send-email-edgar.iglesias@gmail.com>
	<1463698459-31312-3-git-send-email-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 May 2016 17:23:55 +0100
Message-ID: <CAFEAcA-tBcUAweU44Pec--MBDyvs7pfDUv7+2Q3k7m8iZhiZTA@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Subject: Re: [Qemu-devel] [PATCH v1 2/5] xlnx-zynqmp: Break out RPU setup
 into a separate function
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ni73Wirvk1E6

On 19 May 2016 at 23:54, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Break out RPU setup into a separate function. This is in
> preparation for making the RPU optional.
>
> No functional change.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  hw/arm/xlnx-zynqmp.c | 53 ++++++++++++++++++++++++++++++----------------------
>  1 file changed, 31 insertions(+), 22 deletions(-)
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 965a250..250ecc4 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -83,6 +83,36 @@ static inline int arm_gic_ppi_index(int cpu_nr, int ppi_index)
>      return GIC_NUM_SPI_INTR + cpu_nr * GIC_INTERNAL + ppi_index;
>  }
>
> +static void xlnx_zynqmp_setup_rpu(XlnxZynqMPState *s, const char *boot_cpu,
> +                                  Error **errp)
> +{
> +    Error *err = NULL;
> +    int i;
> +
> +    for (i = 0; i < XLNX_ZYNQMP_NUM_RPU_CPUS; i++) {
> +        char *name;
> +
> +        name = object_get_canonical_path_component(OBJECT(&s->rpu_cpu[i]));
> +        if (strcmp(name, boot_cpu)) {
> +            /* Secondary CPUs start in PSCI powered-down state */
> +            object_property_set_bool(OBJECT(&s->rpu_cpu[i]), true,
> +                                     "start-powered-off", &error_abort);
> +        } else {
> +            s->boot_cpu_ptr = &s->rpu_cpu[i];
> +        }
> +        g_free(name);
> +
> +        object_property_set_bool(OBJECT(&s->rpu_cpu[i]), true, "reset-hivecs",
> +                                 &error_abort);
> +        object_property_set_bool(OBJECT(&s->rpu_cpu[i]), true, "realized",
> +                                 &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;

This used to return from xlnz_zynqmp_init, but now it only returns
from this setup function, and xlnx_zynqmp_init will blithely continue.

> +        }
> +    }
> +}

thanks
-- PMM
