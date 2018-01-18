Received: by 10.28.153.193 with SMTP id b184csp39817wme;
        Thu, 18 Jan 2018 13:32:00 -0800 (PST)
X-Google-Smtp-Source: ACJfBos6GcMS4jpXCvxE1wnK3BfaQ4AX3NspalD83k1BO77XqkJsOtcrX1CgsDlEuDOcxGoi/ub4
X-Received: by 10.37.162.136 with SMTP id c8mr26309139ybi.213.1516311120819;
        Thu, 18 Jan 2018 13:32:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516311120; cv=none;
        d=google.com; s=arc-20160816;
        b=GwADJJe2yEuvPdflOAgR/Y/DIRBFIxJ/mRuuvlR508NKIavuaaZlc3SVBhPcdq62pE
         D08LBeqiu/VtqiOkDt/dKxavOiVMBgUJiMwzNPgP8kW3iDXskeDIBaGu0LG0ybPXQsNW
         fldHmUfIOYfM4ic0nsAZo320DY3P/J9HZ/9XC14q5qijJ5hovSg+v38D7cqbriwAI8OC
         b+2Phwrg922dJ7E7IxlYYgUpIt32hUJekT6z/5z8+QC5lsQ9sEqaI30j3bFMLsS4WHnI
         DgXExFGOw5ctCFReSvpDM4c8y+M7+GM9GxZRctlkO/0BFoguVqQTljHfYFTlVuWLpeiZ
         x9/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=TtKsb0sAHjh9aaXV77Csw6gwCZqZ7UnzEEW2Q+8P1hU=;
        b=hLZX8RCu34eK3A9k0SuoCOjaI20IUWGgq1qqUp/HIvFkq0EZ5jFViOn/LKB4fS9Kj4
         37sFshIgkcG0ss/xs6YKdEnpK5t/t5W1wOhOoqn3ixH54bxPAiLY9iDjDnkAsdStdgur
         21r7qZseIhDII1YaGjOSWu6LTl8jj3Bkq2LNHFZRpj7t8NLPW8boc55irW0+0PMQKJ82
         kum+g55pQ8PHHCfPWwxgleBefaUomJUT4aqg7dHXlKAxwweJO7auBg8BbOVe/JL1bIRz
         ZcFVln2SZWebrDEmXhQh4HsikzxmGSMJN5YNQFrRbwX3B4OOoFzqnNBkKRbErY3MopWX
         lrgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bCY+Q9IX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b67si1899460ywh.533.2018.01.18.13.32.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 13:32:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bCY+Q9IX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56748 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecHmy-00016u-Az
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 16:32:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33049)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ecHmr-00016f-0z
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 16:31:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ecHmn-0001z3-SC
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 16:31:53 -0500
Received: from mail-qt0-x234.google.com ([2607:f8b0:400d:c0d::234]:46427)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ecHmn-0001yv-OW; Thu, 18 Jan 2018 16:31:49 -0500
Received: by mail-qt0-x234.google.com with SMTP id o35so23831042qtj.13;
	Thu, 18 Jan 2018 13:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TtKsb0sAHjh9aaXV77Csw6gwCZqZ7UnzEEW2Q+8P1hU=;
	b=bCY+Q9IXuuzkTGxP8Q8LLQC3Fxln5RisdCjJNxTIUMbfin/Dx0IsDwPuozz23w8BAz
	7zpyhZbKsFhTqo7pgu6kDFs53hiWKEHZZxOvpLkQ1qsHwT/8KfJ4bNq+KOJzk5WvQ6MK
	T6jnXseCiyPrw69+/6KQg9HWI3v/Ax9FkjrDcuirZQP6N5QDjLHaNqi7QKxJr3J7fTYL
	VlYVlk0gqfy842op8Jv4A4RG+tX36HEUpNdStbTWVObhRnTB9n36Xo8HolJ4CBB9+Mn+
	Q/FGb3rR6rzKJqIhdoTHQ4BPPp/YDM9sI+IWk+gyLXYPJL4j3r0pUhbVGYlC5sZ5YDxo
	9XZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=TtKsb0sAHjh9aaXV77Csw6gwCZqZ7UnzEEW2Q+8P1hU=;
	b=dIMIFpcPHZTTtkOSpgt81UZnBGNtIVExTzfZ9JoPh2051CatCvpPnY+QZpcqar0FxF
	YBERxF3hpqMzDKxB3C7kVn6rQSsFpZHZ0DiqChoz4hyTCPwVMTKBSCk5Sp9RWd62R3t5
	cuh/maOSFNXTrdSbKYoORNkVsnhbN/KRS3Mh2cZW1EgL1mq2E1KaIpjAykRghMLDc6lK
	JayHYwisID4nrLKJzIo7dWgAkkVjelYNVbOj9mTINO0oGWK6bJsZ4mXChVLwrYOqO5Jc
	jDjzecDA0xHMG4wsz6nYuJ2EnmReUJxFpWhNtq1kyEj/Gej4Yp6qjmX7R5mKR767kiDc
	JjZg==
X-Gm-Message-State: AKwxytcZHpiDl1MZVcz33yqLsx0rM3bdmLlbjzAgvs+U5T5GaTjKEtA3
	6FJDI54+se8D4ajUBiPEND1EuXRb
X-Received: by 10.55.24.96 with SMTP id j93mr37207439qkh.113.1516311108994;
	Thu, 18 Jan 2018 13:31:48 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	m123sm1249742qkd.55.2018.01.18.13.31.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Jan 2018 13:31:48 -0800 (PST)
To: Alistair Francis <alistair.francis@xilinx.com>, qemu-devel@nongnu.org,
	edgar.iglesias@xilinx.com, edgar.iglesias@gmail.com
References: <cover.1516300623.git.alistair.francis@xilinx.com>
	<01de185b273b999f1a4df07cb0e4b2e8216689f0.1516300623.git.alistair.francis@xilinx.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <9c36cbf6-3bbb-02ed-af88-ce1e8faaa491@amsat.org>
Date: Thu, 18 Jan 2018 18:31:45 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <01de185b273b999f1a4df07cb0e4b2e8216689f0.1516300623.git.alistair.francis@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::234
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 6/9] xlnx-zynqmp-pmu: Connect
 the PMU interrupt controller
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
Cc: alistair23@gmail.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2TVB6f49f4EH

On 01/18/2018 03:38 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
> 
>  hw/microblaze/xlnx-zynqmp-pmu.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
> index 145837b372..7312bfe23e 100644
> --- a/hw/microblaze/xlnx-zynqmp-pmu.c
> +++ b/hw/microblaze/xlnx-zynqmp-pmu.c
> @@ -24,6 +24,8 @@
>  #include "cpu.h"
>  #include "boot.h"
>  
> +#include "hw/intc/xlnx-pmu-iomod-intc.h"
> +
>  /* Define the PMU device */
>  
>  #define TYPE_XLNX_ZYNQMP_PMU_SOC "xlnx,zynqmp-pmu-soc"
> @@ -34,14 +36,18 @@
>  #define XLNX_ZYNQMP_PMU_ROM_ADDR    0xFFD00000
>  #define XLNX_ZYNQMP_PMU_RAM_ADDR    0xFFDC0000
>  
> +#define XLNX_ZYNQMP_PMU_INTC_ADDR   0xFFD40000
> +
>  typedef struct XlnxZynqMPPMUSoCState {
>      /*< private >*/
>      DeviceState parent_obj;
>  
>      /*< public >*/
>      MicroBlazeCPU cpu;
> +    XlnxPMUIOIntc intc;
>  }  XlnxZynqMPPMUSoCState;
>  
> +
>  static void xlnx_zynqmp_pmu_soc_init(Object *obj)
>  {
>      XlnxZynqMPPMUSoCState *s = XLNX_ZYNQMP_PMU_SOC(obj);
> @@ -50,6 +56,9 @@ static void xlnx_zynqmp_pmu_soc_init(Object *obj)
>                        TYPE_MICROBLAZE_CPU);
>      object_property_add_child(obj, "pmu-cpu", OBJECT(&s->cpu),
>                                &error_abort);
> +
> +    object_initialize(&s->intc, sizeof(s->intc), TYPE_XLNX_PMU_IO_INTC);
> +    qdev_set_parent_bus(DEVICE(&s->intc), sysbus_get_default());
>  }
>  
>  static void xlnx_zynqmp_pmu_soc_realize(DeviceState *dev, Error **errp)
> @@ -80,6 +89,21 @@ static void xlnx_zynqmp_pmu_soc_realize(DeviceState *dev, Error **errp)
>          error_propagate(errp, err);
>          return;
>      }
> +
> +    object_property_set_uint(OBJECT(&s->intc), 0x10, "intc-intr-size",
> +                             &error_abort);
> +    object_property_set_uint(OBJECT(&s->intc), 0x0, "intc-level-edge",
> +                             &error_abort);
> +    object_property_set_uint(OBJECT(&s->intc), 0xffff, "intc-positive",
> +                             &error_abort);
> +    object_property_set_bool(OBJECT(&s->intc), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->intc), 0, XLNX_ZYNQMP_PMU_INTC_ADDR);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->intc), 0,
> +                       qdev_get_gpio_in(DEVICE(&s->cpu), MB_CPU_IRQ));
>  }
>  
>  static void xlnx_zynqmp_pmu_soc_class_init(ObjectClass *oc, void *data)
> 
