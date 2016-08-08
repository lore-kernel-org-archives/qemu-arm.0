Received: by 10.25.21.156 with SMTP id 28csp2983592lfv;
        Mon, 8 Aug 2016 02:04:34 -0700 (PDT)
X-Received: by 10.55.101.71 with SMTP id z68mr27874699qkb.189.1470647074223;
        Mon, 08 Aug 2016 02:04:34 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id x3si16730111qke.303.2016.08.08.02.04.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Aug 2016 02:04:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55746 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bWgU5-0006XW-Mo
	for alex.bennee@linaro.org; Mon, 08 Aug 2016 05:04:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bWgSj-0004qf-0p
	for qemu-arm@nongnu.org; Mon, 08 Aug 2016 05:03:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bWgSg-0007Rq-NL
	for qemu-arm@nongnu.org; Mon, 08 Aug 2016 05:03:07 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:36567)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1bWgSZ-0007R0-T4; Mon, 08 Aug 2016 05:03:00 -0400
Received: by mail-wm0-x243.google.com with SMTP id x83so14101599wma.3;
	Mon, 08 Aug 2016 02:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=rtBoB2rJWxMSZYGr5r5s1Y2eBC7paw65aDlxb+2QOPs=;
	b=ZLMQkZobKn1EgTDAzZMSsDAiZJWwfJoGhlpv2uDiD+gNLX1zZW64CTZYrU/ez3F/FH
	5A44I4SgG2O+3DNjktUpMkiv4mQwTMRzBrzJJAW/2XfTAHdbsJ/8UyXKCfpNhnVPaL1f
	suzdNqdqwU2GRUZLUB0YwEkmY1SbDvPXty0uvEcPcHyt+3Dz8o8ZQPCuX2w175D1aEF9
	zaYPOpH8ECrbCeQtVJcRRyB0UF7/eIGB1t2lOMjVHTMg5ZA1oc6kxXuwxmBsOfPci8xv
	HFdd46vMJS4CGDYdcZcTHaktwHATX/G+yA++hT3Byjo3LIIFnbfWF4b4B7kGPOsRdIco
	+MLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=rtBoB2rJWxMSZYGr5r5s1Y2eBC7paw65aDlxb+2QOPs=;
	b=T+0APVGxxkvqTU+2DiS5t8vyrM65zhuqdicw2cEYF9N9WoPzi4bCDmxCsyEd/CSe24
	+zSw5b+sLab95H/RuqSMRlUum7MNHf8a+eHSleWcN02UuzfFk+ebv0WgcH8NYB1zBadb
	Yd3WNeNnKeuGL9q6gD3MQ2R/TuQZZbLh4WAcdYZEehFkOl3eCHj2ZLCsa5refaByXv0h
	iQ1xuVMHdWEm4KUVRsZ4iGgvSk64VPbSg8kAxk9QDhs+byxPPm209VdofHlpdO4PA8R8
	HAApBl0aOoVVnftzqsujkGEJc94ifxs1/NUtnyo5K+eybzJU8kd/A+Nb7tmz+quR/u+r
	NXAw==
X-Gm-Message-State: AEkoouuJLhCJl0hsh1ZIRU0ysymgYLu3pqVSRdqImvfIEp6r8KkRZ1yWEGtUMEqQ3wvzRg==
X-Received: by 10.28.37.71 with SMTP id l68mr15680970wml.50.1470646979062;
	Mon, 08 Aug 2016 02:02:59 -0700 (PDT)
Received: from [10.201.49.221] (nat-pool-mxp-u.redhat.com. [149.6.153.187])
	by smtp.googlemail.com with ESMTPSA id
	r67sm22583084wmb.14.2016.08.08.02.02.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Aug 2016 02:02:58 -0700 (PDT)
To: Lv Zheng <lv.zheng@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Shannon Zhao <shannon.zhao@linaro.org>
References: <24044757332cd427e378053739e6f49980e0ac5d.1470392366.git.lv.zheng@intel.com>
	<5d4b5e6b17eadf92b61e9ef6f3118f7658bb99d0.1470641028.git.lv.zheng@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b978a34e-298e-2513-ad2c-6ebf542946a6@redhat.com>
Date: Mon, 8 Aug 2016 11:02:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <5d4b5e6b17eadf92b61e9ef6f3118f7658bb99d0.1470641028.git.lv.zheng@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-arm] [PATCH v2] ACPI: Enable AML DBUG() control method
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Lv Zheng <zetalog@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PXSEKpSdsEMS



On 08/08/2016 09:26, Lv Zheng wrote:
> This patch enables DBUG() control method, making it independent of seabios.
> 
> DBUG() is defined in the default DSDT, and is used to dump the AML
> debugging information to the debug port. Thus it can be used by the ACPI
> open source community developers to probe the de-facto standard AML
> interpreter behavior.
> 
> But the debug IO port address used in DBUG() (DBG operation region field)
> is currently not synchronized to any debugging facility implemented in
> qemu.
> 
> Originally, we managed to use this feature by specifying
> "-global isa-debugcon.iobase=0x402 -debugcon stdio" to make it working with
> the debug console device. Note that the "iobase=0x402" implies that this
> feature is currently dependent on seabios.
> 
> But since the AML tables are now provided by qemu itself, this feature
> shouldn't be dependent on any BIOS rom. This patch thus changes DBG AML
> generation code using isa-debugcon iobase so that we can always use this
> feature by only specifying "-debugcon stdio".
> 
> Signed-off-by: Lv Zheng <lv.zheng@intel.com>
> ---
>  hw/char/debugcon.c         |   23 +++++++++++++++++++++++
>  hw/i386/acpi-build.c       |    4 +++-
>  include/hw/char/debugcon.h |   33 +++++++++++++++++++++++++++++++++
>  3 files changed, 59 insertions(+), 1 deletion(-)
>  create mode 100644 include/hw/char/debugcon.h
> 
> diff --git a/hw/char/debugcon.c b/hw/char/debugcon.c
> index e7f025e..7f70ec3 100644
> --- a/hw/char/debugcon.c
> +++ b/hw/char/debugcon.c
> @@ -30,6 +30,7 @@
>  #include "sysemu/char.h"
>  #include "hw/isa/isa.h"
>  #include "hw/i386/pc.h"
> +#include "hw/char/debugcon.h"
>  
>  #define TYPE_ISA_DEBUGCON_DEVICE "isa-debugcon"
>  #define ISA_DEBUGCON_DEVICE(obj) \
> @@ -134,6 +135,28 @@ static const TypeInfo debugcon_isa_info = {
>      .class_init    = debugcon_isa_class_initfn,
>  };
>  
> +static Object *debugcon_isa_find(void)
> +{
> +    bool ambig;
> +    Object *o = object_resolve_path_type("", TYPE_ISA_DEBUGCON_DEVICE,
> +                                         &ambig);
> +
> +    if (ambig) {
> +        return NULL;
> +    }
> +    return o;
> +}
> +
> +uint32_t debugcon_get_port(void)
> +{
> +    Object *obj = debugcon_isa_find();
> +
> +    if (obj) {
> +        return object_property_get_int(obj, "iobase", &error_abort);
> +    }
> +    return 0xe9;
> +}
> +
>  static void debugcon_register_types(void)
>  {
>      type_register_static(&debugcon_isa_info);
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index a26a4bb..ce7cbc5 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -44,6 +44,7 @@
>  #include "hw/acpi/tpm.h"
>  #include "sysemu/tpm_backend.h"
>  #include "hw/timer/mc146818rtc_regs.h"
> +#include "hw/char/debugcon.h"
>  #include "sysemu/numa.h"
>  
>  /* Supported chipsets: */
> @@ -1442,7 +1443,8 @@ static void build_dbg_aml(Aml *table)
>      Aml *idx = aml_local(2);
>  
>      aml_append(scope,
> -       aml_operation_region("DBG", AML_SYSTEM_IO, aml_int(0x0402), 0x01));
> +       aml_operation_region("DBG", AML_SYSTEM_IO,
> +                            aml_int(debugcon_get_port()), 0x01));
>      field = aml_field("DBG", AML_BYTE_ACC, AML_NOLOCK, AML_PRESERVE);
>      aml_append(field, aml_named_field("DBGB", 8));
>      aml_append(scope, field);
> diff --git a/include/hw/char/debugcon.h b/include/hw/char/debugcon.h
> new file mode 100644
> index 0000000..a2420fd
> --- /dev/null
> +++ b/include/hw/char/debugcon.h
> @@ -0,0 +1,33 @@
> +/*
> + * QEMU debug console emulation
> + *
> + * Copyright (c) 2016 Lv Zheng <lv.zheng@intel.com>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#ifndef HW_DEBUGCON_H
> +#define HW_DEBUGCON_H
> +
> +#include "hw/hw.h"
> +#include "sysemu/sysemu.h"
> +
> +extern uint32_t debugcon_get_port(void);
> +
> +#endif
> 

This should be okay, but will have to wait for QEMU 2.8.

Thanks,

Paolo
