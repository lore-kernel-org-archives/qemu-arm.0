Received: by 10.25.85.209 with SMTP id j200csp1107122lfb;
        Mon, 13 Jun 2016 02:47:07 -0700 (PDT)
X-Received: by 10.140.176.21 with SMTP id w21mr10176627qhw.101.1465811227585;
        Mon, 13 Jun 2016 02:47:07 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k131si14680143qke.96.2016.06.13.02.47.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 02:47:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54806 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCOSZ-0001QJ-1M
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 05:47:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48602)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCOPY-0007cH-OS
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 05:44:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCOPU-0002VI-PX
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 05:44:00 -0400
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:34715)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCOPU-0002V7-LK
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 05:43:56 -0400
Received: by mail-vk0-x22f.google.com with SMTP id t129so43670238vka.1
	for <qemu-arm@nongnu.org>; Mon, 13 Jun 2016 02:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+ksxkAakp4Hb9hASkPMNEAxvNlw/RmPTc8hCtYozBSc=;
	b=er4yFJvfrAxRPTboftDisgGxmxwPDaiLCZ2O1b9Vk2efjH5fk9KkWWp1awGWqFqLyw
	2fPkyqbkDQzg79MberYb3Yx8DeCEu0sa0ZIf9K/9zzZhYipeQrldZOLwQIBzWhaQGHuE
	LGOdT+tUPFL4V8CQI/TWlSwPsWKZn7QMjCNI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+ksxkAakp4Hb9hASkPMNEAxvNlw/RmPTc8hCtYozBSc=;
	b=dspumWDrsm9pm1SJR6Uzp37gXhcwBtv4/vqiEOQ6iH5+rMe9bw+z2NUTAgvKjFJank
	zWqvDkW6BqVU009zMwgFWrMRjPHPPKHvQbrnHoG+pb7EZskmEgDHGQL/rW82hFiXYhwU
	lpl50ucRxIhGsnXwWs4PnjilXQhM1XAJMMerk0tm7Dk/TUiXIjwZCI1GxT9b8dlOKqWJ
	ldRS8bJhy3Pqgqs84k1aWdvrWQKUTKdRiakZiEbTvXOJJDnV5FzL6SSw/aDW8Gko8xE5
	V6GQznimgTo9TpF2XbNKIYRjJCMleHbN2bsRv0p7E3cU2cZvwf5CExnMznZoK4v06sJC
	zGkA==
X-Gm-Message-State: ALyK8tJeOEX7GFj2PMgdm5ZX+MaxYaZZpbB3oXbsVrArt9ZMMVuUJE9wbGIf7D5J+bLO6H5oKkepJqZwLFQsycqs
X-Received: by 10.176.0.146 with SMTP id 18mr5697181uaj.17.1465811035931; Mon,
	13 Jun 2016 02:43:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Mon, 13 Jun 2016 02:43:36 -0700 (PDT)
In-Reply-To: <1465808915-4887-5-git-send-email-vijayak@caviumnetworks.com>
References: <1465808915-4887-1-git-send-email-vijayak@caviumnetworks.com>
	<1465808915-4887-5-git-send-email-vijayak@caviumnetworks.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Jun 2016 10:43:36 +0100
Message-ID: <CAFEAcA8+qWep8E3+k30n1gTUexoTrqipg=bnxS5yYPNvfFpTYw@mail.gmail.com>
To: Vijaya Kumar K <vijayak@caviumnetworks.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
Subject: Re: [Qemu-arm] [RFC PATCH v1 4/4] target-arm: Compute page size
 based on ARM target cpu type
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
Cc: Vijay Kilari <vijay.kilari@gmail.com>, Juan Quintela <quintela@redhat.com>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Vijaya Kumar K <vijayak@cavium.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JuyVRTRCyzFa

On 13 June 2016 at 10:08,  <vijayak@caviumnetworks.com> wrote:
> From: Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>
>
> Replace TARGET_PAGE_BITS with arm_target_page_size function
> in order to fetch page size at run-time.
>
> Introduced MachineClass callback to compute target page
> size at the early boot before memory initialization.
> This callback is currently implemented for ARM platforms.
> Based on cpu_model, the page size is updated in
> target_page_bits which is defined as TARGET_PAGE_BITS.
>
> Signed-off-by: Vijaya Kumar K <vijayak@cavium.com>
> ---
>  hw/arm/virt.c       |   48 ++++++++++++++++++++++++++++++++++++++++++++++++
>  include/hw/boards.h |    1 +
>  target-arm/cpu.h    |   12 +++++++-----
>  vl.c                |    7 +++++++
>  4 files changed, 63 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 73113cf..37aab33 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -90,6 +90,12 @@ typedef struct {
>      int32_t gic_version;
>  } VirtMachineState;
>
> +/*
> + * Holds TARGET_AARCH_64_PAGE_BITS or TARGET_ARM_PAGE_BITS
> + * based on the the cpu type emulated at runtime.
> + */
> +static uint32_t target_page_bits;

The CPU page size is not specific to the 'virt' board, so this
is the wrong place to do this. You should identify the
page size in arm_cpu_realizefn() based on the set of feature
bits the CPU has: anything with ARM_FEATURE_V7 has a 4K page
table (this includes a lot of 32-bit CPUs).

CPU realize is pretty late in startup so you may need
to rearrange some other stuff to be sure that it will
work OK. If that absolutely can't work then we could do
this in CPU init, but that would be a bit messier.

> --- a/vl.c
> +++ b/vl.c
> @@ -4045,6 +4045,13 @@ int main(int argc, char **argv, char **envp)
>      object_property_add_child(object_get_root(), "machine",
>                                OBJECT(current_machine), &error_abort);
>
> +    /*
> +     * Compute target page size dynamically if arch supports
> +     * multiple page sizes. Ex: ARM
> +     */
> +    if (machine_class->update_target_page_size)
> +        machine_class->update_target_page_size(cpu_model);
> +
>      init_l1_page_table_param();

Page size isn't board specific so you don't need any of these hook
functions in the machine class.

thanks
-- PMM
