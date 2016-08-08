Received: by 10.25.21.156 with SMTP id 28csp105221lfv;
        Mon, 8 Aug 2016 09:57:47 -0700 (PDT)
X-Received: by 10.55.195.9 with SMTP id a9mr30864709qkj.237.1470675467142;
        Mon, 08 Aug 2016 09:57:47 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l64si17884840qki.318.2016.08.08.09.57.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Aug 2016 09:57:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58806 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bWns2-00061N-LS
	for alex.bennee@linaro.org; Mon, 08 Aug 2016 12:57:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42296)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bWnry-0005zS-A2
	for qemu-arm@nongnu.org; Mon, 08 Aug 2016 12:57:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bWnrx-0005MA-B4
	for qemu-arm@nongnu.org; Mon, 08 Aug 2016 12:57:42 -0400
Received: from mail-ua0-x22d.google.com ([2607:f8b0:400c:c08::22d]:36439)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bWnrx-0005M2-5G
	for qemu-arm@nongnu.org; Mon, 08 Aug 2016 12:57:41 -0400
Received: by mail-ua0-x22d.google.com with SMTP id 97so27792081uav.3
	for <qemu-arm@nongnu.org>; Mon, 08 Aug 2016 09:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=unooXrRLvihLKNRMkeFiumBq1roS1YBZSBTY7bmGxlo=;
	b=b/mAycn8dDc2TlknxHBlsGsqqtlH60sSFXQ7PTLOCB3jMv/OurKbso0i2D/ePxp4wp
	GfC2ZdmL3vt1zkQk8S8nqO2zW8oYmW8lEbp8d/2m5yHfrzpB8iBxeEeM+1gCI1qpBDjD
	AGcKZ/daWcyPqhr5LK1u1TtdmW32RBMzuH4vM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=unooXrRLvihLKNRMkeFiumBq1roS1YBZSBTY7bmGxlo=;
	b=RgwR/pOEyRsj5Aw+6/Q3HhqVRcNcZRWD6QrBNK6gpOJeTgXi1IIC932dY4CwrRKtrl
	r2wJt1xmAJZsmkF1C1vG+wnIrqRndf3uMj0S6F3pc8TznUzwkfE9kcVmWecIPJH2kZFb
	Ko1f4N7oZp9jOZocMFniqHFiQFGpLZZTcsgFKTezJ91LtGIJYOBDoEmjmGWjYbHEHEso
	VDjJVzg22Y1KS7ubtXCcXKTl9PtyYRDxRRF+ENTqKO05KX+rdkfrPreWslA+5szKd3PR
	Ch8A2pYN+vlxoKdKbU+Rwqd4PJu3FQ7HzGNLM9ipzuUQ+0qsboVl74R33zx8cjWinRVE
	A8Ug==
X-Gm-Message-State: AEkoouugIhgx+scWDxzH3tvRVF2nlz8LUwPkg9mZhtzeKEqJMmjlmly482knlNUKOiL8zc989AcyLe0kVuW4PBHz
X-Received: by 10.159.35.47 with SMTP id 44mr4662654uae.38.1470675460630; Mon,
	08 Aug 2016 09:57:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.150.17 with HTTP; Mon, 8 Aug 2016 09:57:19 -0700 (PDT)
In-Reply-To: <1470675071-23677-3-git-send-email-vijay.kilari@gmail.com>
References: <1470675071-23677-1-git-send-email-vijay.kilari@gmail.com>
	<1470675071-23677-3-git-send-email-vijay.kilari@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Aug 2016 17:57:19 +0100
Message-ID: <CAFEAcA_e=PGkFX3sPn_gMPCM8niZ-zm+S4wXPDEX3gRhMpE=hQ@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22d
Subject: Re: [Qemu-arm] [RFC PATCH v2 2/2] hw/intc/arm_gicv3_kvm: Implement
 get/put functions
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
Cc: "prasun.kapoor" <Prasun.Kapoor@cavium.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1D/YP9+mcilC

On 8 August 2016 at 17:51,  <vijay.kilari@gmail.com> wrote:
> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>
> This actually implements pre_save and post_load methods for in-kernel
> vGICv3.
>
> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> [PMM:
>  * use decimal, not 0bnnn
>  * fixed typo in names of ICC_APR0R_EL1 and ICC_AP1R_EL1
>  * completely rearranged the get and put functions to read and write
>    the state in a natural order, rather than mixing distributor and
>    redistributor state together]
> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
> [Vijay:
>  * Update macro KVM_VGIC_ATTR
>  * Use 32 bit access for gicd and gicr
>  * GICD_IROUTER, GICD_TYPER, GICR_PROPBASER and GICR_PENDBASER reg
>    access  are changed from 64-bit to 32-bit access]
> ---

> +        // TODO: there is no kernel API for reading/writing c->level

We have now defined this API so this code should use it.

> +    // TODO: there is no kernel API for reading/writing s->level

Also here (and similarly in the _get function).

thanks
-- PMM
