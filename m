Received: by 10.25.30.65 with SMTP id e62csp43210lfe;
        Wed, 25 May 2016 10:23:07 -0700 (PDT)
X-Received: by 10.200.53.22 with SMTP id y22mr4880246qtb.3.1464196986980;
        Wed, 25 May 2016 10:23:06 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 14si8953015qtm.75.2016.05.25.10.23.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 May 2016 10:23:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34198 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5cWQ-0006Wq-Ag
	for alex.bennee@linaro.org; Wed, 25 May 2016 13:23:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44796)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1b5cWJ-0006Sm-RV
	for qemu-arm@nongnu.org; Wed, 25 May 2016 13:23:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1b5cWI-0000dS-Ul
	for qemu-arm@nongnu.org; Wed, 25 May 2016 13:22:59 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:35938)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1b5cWG-0000d0-HP; Wed, 25 May 2016 13:22:56 -0400
Received: by mail-oi0-x242.google.com with SMTP id x130so13250882oia.3;
	Wed, 25 May 2016 10:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=AtfjOwTgy+8sUgd6d3l9MhBlAskH1iNVZWjZ5ZEoElg=;
	b=xggMP+cZZKoUCqF0sUQ/FaKNOvSCdJh64UgmR5Hj716rHT2GAbCPO4C0oGuTLA/ii0
	14Y2nY2OmqRA4/4USLD3WGf3Zb/6hpPiWh2CD0BDtxN+C/VGNET+763JhHSoVzta/pUC
	ssAqb76YioEQ1hqjza189RqZPZujA2qMbrw0XvuTdKe4hByS4d33PmRF5fqqLteE6m2t
	aPKMf5KP7grrxU9IlSi4gUIMGeBfGAhaKlYmSl1VrFucR7iqkehL2uIc/04cThnCR6eL
	ptXbS70MgYlFjybMpPbRYIkEu8xyW9yOkMtP4cLsk4maukeRPRPEwAfhqgYcQRi9Tox+
	4xKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=AtfjOwTgy+8sUgd6d3l9MhBlAskH1iNVZWjZ5ZEoElg=;
	b=KcgLKu7u73tRS5CUP2yLLdtDh+YJpcGo2xgdyW6COoGnFrXnLp1O8b8PX7T7pMf2L/
	oyU5wFgj0nd0dZ9GSMxmLAcNnufUwi4tezLWpf4XpdbsKWXoNuCv0u534lzH9fwvkSX2
	X+o6bGV7Zf2RTiyPdIY6TKWjoVqv4aIw9Uuc/NAWJ5AC7Rfnqpe0mjoymoCMSvloANmM
	0HFHlme1zsIEkZdEbycFphp01To/PHfVJ0k4CPZ6U1qM5CWjwOe4C1GWO6v9gniv8w4l
	z2emM0xgk1DAS/gCmhKAiMQU5KMMNogsuZUzPlN7xMqDGT+2gbajksoK6nUoGDTeuwFX
	UdoQ==
X-Gm-Message-State: ALyK8tJh4Zpz0Jn5OyyGuxLokLY/fTXPtND10Z9qA9L6EU5t6T+Z+/oQ4hjWyQaLLVI0yXFPVm9eJH5B50C7Fg==
X-Received: by 10.202.199.198 with SMTP id x189mr3234253oif.44.1464196975478; 
	Wed, 25 May 2016 10:22:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.98.137 with HTTP; Wed, 25 May 2016 10:22:26 -0700 (PDT)
In-Reply-To: <1464173555-12800-2-git-send-email-edgar.iglesias@gmail.com>
References: <1464173555-12800-1-git-send-email-edgar.iglesias@gmail.com>
	<1464173555-12800-2-git-send-email-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 25 May 2016 10:22:26 -0700
X-Google-Sender-Auth: Y8MXuaVyKqpjg2jhhBGxaQ1PUIM
Message-ID: <CAKmqyKMZ+g1MOTL8q3zXXTvX6cevj3c90xbiazUBbpU0FC4YQg@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 1/4] xlnx-zynqmp: Add a
 secure prop to en/disable ARM Security Extensions
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
	Peter Maydell <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uFVM0AxXRJiE

On Wed, May 25, 2016 at 3:52 AM, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Add a secure prop to en/disable ARM Security Extensions.
> This is particularly useful for KVM runs.
>
> Default to disabled to match the behavior of KVM.
>
> This changes the default setup from having the ARM Security
> Extensions to not longer having them.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Looks good to me

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

> ---
>  hw/arm/xlnx-zynqmp.c         | 3 +++
>  include/hw/arm/xlnx-zynqmp.h | 3 +++
>  2 files changed, 6 insertions(+)
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 4d504da..965a250 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -238,6 +238,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>          }
>          g_free(name);
>
> +        object_property_set_bool(OBJECT(&s->apu_cpu[i]),
> +                                 s->secure, "has_el3", NULL);
>          object_property_set_int(OBJECT(&s->apu_cpu[i]), GIC_BASE_ADDR,
>                                  "reset-cbar", &error_abort);
>          object_property_set_bool(OBJECT(&s->apu_cpu[i]), true, "realized",
> @@ -370,6 +372,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>
>  static Property xlnx_zynqmp_props[] = {
>      DEFINE_PROP_STRING("boot-cpu", XlnxZynqMPState, boot_cpu),
> +    DEFINE_PROP_BOOL("secure", XlnxZynqMPState, secure, false),
>      DEFINE_PROP_END_OF_LIST()
>  };
>
> diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
> index 2332596..38d4c8c 100644
> --- a/include/hw/arm/xlnx-zynqmp.h
> +++ b/include/hw/arm/xlnx-zynqmp.h
> @@ -84,6 +84,9 @@ typedef struct XlnxZynqMPState {
>
>      char *boot_cpu;
>      ARMCPU *boot_cpu_ptr;
> +
> +    /* Has the ARM Security extensions?  */
> +    bool secure;
>  }  XlnxZynqMPState;
>
>  #define XLNX_ZYNQMP_H
> --
> 2.5.0
>
>
