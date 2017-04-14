Received: by 10.25.0.144 with SMTP id 138csp422202lfa;
        Fri, 14 Apr 2017 13:55:50 -0700 (PDT)
X-Received: by 10.55.97.67 with SMTP id v64mr8263398qkb.241.1492203350278;
        Fri, 14 Apr 2017 13:55:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j4si2766295qtc.331.2017.04.14.13.55.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Apr 2017 13:55:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54601 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cz8Fx-0005Ta-OI
	for alex.bennee@linaro.org; Fri, 14 Apr 2017 16:55:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60009)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cz8Fs-0005RX-Pp
	for qemu-arm@nongnu.org; Fri, 14 Apr 2017 16:55:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cz8Fr-0005r7-Im
	for qemu-arm@nongnu.org; Fri, 14 Apr 2017 16:55:44 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:35045)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1cz8Fo-0005pA-5o; Fri, 14 Apr 2017 16:55:40 -0400
Received: by mail-oi0-x241.google.com with SMTP id a21so2373008oic.2;
	Fri, 14 Apr 2017 13:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=lcjXh3YhmbBcIVHxoasR4QkrqjXyjpwnO/G39vapfBc=;
	b=VkvTYEAmNkn6B0YLDs5Lj3TX8N8YZGSsQt/DzXIXMW7oJ+UkVPEOwMJ6TzEsaqJ+dd
	JX6k51dJ4RO5+q1oE9aKRIpt5fz6Fd4Ff2Ym6boY/I5UmsB2/prnfl7QGFF9EwVB64Lx
	Qw2kWKoN59cj6OPSAkfuQsG1VCoe51ysuGOalZnPIPjsKdyMCTGNGtd1a0DNoJIDrRoi
	bZJcUYjVD5CRQc5CcbjJui9YXafi+5VYQExvVGqlY0Hj3FXMRkoXN+pWuAwa5h521LGE
	GlALDDRo5OA6SIzHJEmU5uA8bDu+QoxqK0ahmxqAqGroYynMjagLgvcfUAtcwRpTS1kt
	e6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=lcjXh3YhmbBcIVHxoasR4QkrqjXyjpwnO/G39vapfBc=;
	b=Skg2Ex54HJWBE7nwVEQOGAj08LbBoJ9YElctH3UrIaMgg9xq7aNQCHCCUkIl83df/5
	f55ba0iUFrIXu/byP4mNkZeEu/cDswJ03lsiocd+WlUWLMpHthj9xGmxCLZXtEIxZh5M
	XH14RBaziRrfq0HYu0zMHR5GmWzdwRBgR1iC2iZFpnQ5OSXK62EqivQBX4Uf/PzXd8rR
	nkXRX75b/OzqsPOCbVtB5Ywswy1/9McvMYrBOyxUolB3kedWLvBB3E+XLXM2FH41tB7B
	wXmkYtEWrEuumxOP2vg8JSdLE6ezISnV7zqh2rk73F1xqIT145Np5hKlmR+DYmryLM+r
	+Pzw==
X-Gm-Message-State: AN3rC/44x485G+azfOuELPk0gzzJretvrolYjxOHRiCQwGgd1mGcqYFe
	LbziCdDSaWtBi4Jz/gS/rhwnsHvFXw==
X-Received: by 10.202.71.67 with SMTP id u64mr6471192oia.12.1492203339051;
	Fri, 14 Apr 2017 13:55:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.44.229 with HTTP; Fri, 14 Apr 2017 13:55:08 -0700 (PDT)
In-Reply-To: <20170414083717.13641-2-lvivier@redhat.com>
References: <20170414083717.13641-1-lvivier@redhat.com>
	<20170414083717.13641-2-lvivier@redhat.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 14 Apr 2017 13:55:08 -0700
X-Google-Sender-Auth: 5Iwb8UdpSTgGh-JYWFq8Z8Hk47I
Message-ID: <CAKmqyKN6Wuf1H0E=T4RrpKZQnsgExJwShW42WNMr7b8ZQjv=RA@mail.gmail.com>
To: Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 1/4] arm: remove remaining
 cannot_destroy_with_object_finalize_yet
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, qemu-ppc@nongnu.org,
	Antony Pavlov <antonynpavlov@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UshfeakpKpiu

On Fri, Apr 14, 2017 at 1:37 AM, Laurent Vivier <lvivier@redhat.com> wrote:
> With commit ce5b1bbf624b ("exec: move cpu_exec_init() calls to
> realize functions"), we can now remove all the
> remaining cannot_destroy_with_object_finalize_yet as
> unsafe references have been moved to cpu_exec_realizefn().
> (tested with QOM command provided by commit 4c315c27).
>
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Acked-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

> ---
>  hw/arm/allwinner-a10.c | 6 ------
>  hw/arm/bcm2836.c       | 6 ------
>  hw/arm/digic.c         | 6 ------
>  hw/arm/fsl-imx25.c     | 5 -----
>  hw/arm/fsl-imx31.c     | 5 -----
>  hw/arm/fsl-imx6.c      | 5 -----
>  hw/arm/xlnx-zynqmp.c   | 6 ------
>  7 files changed, 39 deletions(-)
>
> diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
> index ca15d1c..f62a9a3 100644
> --- a/hw/arm/allwinner-a10.c
> +++ b/hw/arm/allwinner-a10.c
> @@ -118,12 +118,6 @@ static void aw_a10_class_init(ObjectClass *oc, void *data)
>      DeviceClass *dc = DEVICE_CLASS(oc);
>
>      dc->realize = aw_a10_realize;
> -
> -    /*
> -     * Reason: creates an ARM CPU, thus use after free(), see
> -     * arm_cpu_class_init()
> -     */
> -    dc->cannot_destroy_with_object_finalize_yet = true;
>  }
>
>  static const TypeInfo aw_a10_type_info = {
> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> index 8451190..8c43291 100644
> --- a/hw/arm/bcm2836.c
> +++ b/hw/arm/bcm2836.c
> @@ -160,12 +160,6 @@ static void bcm2836_class_init(ObjectClass *oc, void *data)
>
>      dc->props = bcm2836_props;
>      dc->realize = bcm2836_realize;
> -
> -    /*
> -     * Reason: creates an ARM CPU, thus use after free(), see
> -     * arm_cpu_class_init()
> -     */
> -    dc->cannot_destroy_with_object_finalize_yet = true;
>  }
>
>  static const TypeInfo bcm2836_type_info = {
> diff --git a/hw/arm/digic.c b/hw/arm/digic.c
> index d60ea39..94f3263 100644
> --- a/hw/arm/digic.c
> +++ b/hw/arm/digic.c
> @@ -101,12 +101,6 @@ static void digic_class_init(ObjectClass *oc, void *data)
>      DeviceClass *dc = DEVICE_CLASS(oc);
>
>      dc->realize = digic_realize;
> -
> -    /*
> -     * Reason: creates an ARM CPU, thus use after free(), see
> -     * arm_cpu_class_init()
> -     */
> -    dc->cannot_destroy_with_object_finalize_yet = true;
>  }
>
>  static const TypeInfo digic_type_info = {
> diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
> index 2126f73..9056f27 100644
> --- a/hw/arm/fsl-imx25.c
> +++ b/hw/arm/fsl-imx25.c
> @@ -290,11 +290,6 @@ static void fsl_imx25_class_init(ObjectClass *oc, void *data)
>
>      dc->realize = fsl_imx25_realize;
>
> -    /*
> -     * Reason: creates an ARM CPU, thus use after free(), see
> -     * arm_cpu_class_init()
> -     */
> -    dc->cannot_destroy_with_object_finalize_yet = true;
>      dc->desc = "i.MX25 SOC";
>  }
>
> diff --git a/hw/arm/fsl-imx31.c b/hw/arm/fsl-imx31.c
> index dd1c713..d7e2d83 100644
> --- a/hw/arm/fsl-imx31.c
> +++ b/hw/arm/fsl-imx31.c
> @@ -262,11 +262,6 @@ static void fsl_imx31_class_init(ObjectClass *oc, void *data)
>
>      dc->realize = fsl_imx31_realize;
>
> -    /*
> -     * Reason: creates an ARM CPU, thus use after free(), see
> -     * arm_cpu_class_init()
> -     */
> -    dc->cannot_destroy_with_object_finalize_yet = true;
>      dc->desc = "i.MX31 SOC";
>  }
>
> diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
> index 76dd8a4..6969e73 100644
> --- a/hw/arm/fsl-imx6.c
> +++ b/hw/arm/fsl-imx6.c
> @@ -442,11 +442,6 @@ static void fsl_imx6_class_init(ObjectClass *oc, void *data)
>
>      dc->realize = fsl_imx6_realize;
>
> -    /*
> -     * Reason: creates an ARM CPU, thus use after free(), see
> -     * arm_cpu_class_init()
> -     */
> -    dc->cannot_destroy_with_object_finalize_yet = true;
>      dc->desc = "i.MX6 SOC";
>  }
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index bc4e66b..4f67158 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -439,12 +439,6 @@ static void xlnx_zynqmp_class_init(ObjectClass *oc, void *data)
>
>      dc->props = xlnx_zynqmp_props;
>      dc->realize = xlnx_zynqmp_realize;
> -
> -    /*
> -     * Reason: creates an ARM CPU, thus use after free(), see
> -     * arm_cpu_class_init()
> -     */
> -    dc->cannot_destroy_with_object_finalize_yet = true;
>  }
>
>  static const TypeInfo xlnx_zynqmp_type_info = {
> --
> 2.9.3
>
>
