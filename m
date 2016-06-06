Received: by 10.25.27.66 with SMTP id b63csp1570228lfb;
        Mon, 6 Jun 2016 09:11:28 -0700 (PDT)
X-Received: by 10.140.251.195 with SMTP id w186mr16895497qhc.57.1465229488589;
        Mon, 06 Jun 2016 09:11:28 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p35si12486401qtd.123.2016.06.06.09.11.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Jun 2016 09:11:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43408 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b9x7f-0006U7-S0
	for alex.bennee@linaro.org; Mon, 06 Jun 2016 12:11:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35578)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b9wwU-0005Id-Kf
	for qemu-devel@nongnu.org; Mon, 06 Jun 2016 11:59:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b9wwS-0002ev-4H
	for qemu-devel@nongnu.org; Mon, 06 Jun 2016 11:59:53 -0400
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:32854)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b9wwR-0002ei-Vl
	for qemu-devel@nongnu.org; Mon, 06 Jun 2016 11:59:52 -0400
Received: by mail-vk0-x236.google.com with SMTP id d64so81692810vkb.0
	for <qemu-devel@nongnu.org>; Mon, 06 Jun 2016 08:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UknkrDjnNI+2aCYbSl4Q/a9JXbX6jzrUVocWSuVr614=;
	b=Ij3MeJGsOmQSqVSr9s0/cZVdfrJRw/WQgdzjo+MLpIyOI2crW6LUaXu4Ubx8nCRzJx
	nH/lrwNfLAahhs97K2tJ3ysx7fA6wRDEV40Yq9tNPVO4HmiAZxQzRWkkshT+HxnwT45/
	pvRFHS2Skoz+neKetnV2NlfshLouFFg1jlyTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UknkrDjnNI+2aCYbSl4Q/a9JXbX6jzrUVocWSuVr614=;
	b=dfjhHSEgkyKK+07E2HuMTsIvtd3B8cJtc/YjkrA1rVPGiepdofVcqZ/rhff9O3O7BQ
	bbMWY6+G8dbzjZduM8kuutmc/mMXmfNxk6dx0RJYtO4CyO125v2+E6Piko7mS6+3NBxA
	zXAG8PPCZqjuYcg2EEPWvL2+ohkEtQyCeCaZRNDfQk4vwx/mQSxN2QjEcpPafJy/c6e/
	Kztvo0xzvk+AdVkwS5wWWMUeOgDszaFSFXYGR+yZyeh4SdMf/C7WUdfC9E+H10fbw0iW
	w5M9xMBmAq6gvO7M5bMMTZWQPWd5H4nmY/cUdWwKUH80jrl8gmBJCWqeOjh8+DPleNq6
	fAVw==
X-Gm-Message-State: ALyK8tLL0pU+UB+RKmo3mslcGb2JAFEuy8hc0QOaP8Ys+ieOUNOcCj1RSkUTM95vlZ+5gsLIuEHBJURxoWQLIP9B
X-Received: by 10.176.5.227 with SMTP id e90mr6269337uae.4.1465228791277; Mon,
	06 Jun 2016 08:59:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.67.65 with HTTP; Mon, 6 Jun 2016 08:59:31 -0700 (PDT)
In-Reply-To: <1461670846-13196-3-git-send-email-zhaoshenglong@huawei.com>
References: <1461670846-13196-1-git-send-email-zhaoshenglong@huawei.com>
	<1461670846-13196-3-git-send-email-zhaoshenglong@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2016 16:59:31 +0100
Message-ID: <CAFEAcA_jUC92Y3Ne4k+9vo2iQuFiJqgE_Cfth_GZCzeBAyMcJw@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Subject: Re: [Qemu-devel] [PATCH v4 2/3] hw/arm/virt: Add PMU node for virt
 machine
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uGBU40pIZl6W

On 26 April 2016 at 12:40, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
>
> Add a virtual PMU device for virt machine while use PPI 7 for PMU
> overflow interrupt number.
>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>

> diff --git a/stubs/kvm.c b/stubs/kvm.c
> index ddd6204..667e269 100644
> --- a/stubs/kvm.c
> +++ b/stubs/kvm.c
> @@ -6,3 +6,8 @@ int kvm_arch_irqchip_create(MachineState *ms, KVMState *s)
>  {
>      return 0;
>  }
> +
> +int kvm_arm_pmu_create(CPUState *cs, int irq)
> +{
> +    return 0;
> +}

Hi. I'm afraid this breaks compilation on 32-bit ARM hosts:
for 32-bit ARM we don't have a real kvm_arm_pmu_create() so we
end up pulling in the stubs/kvm.o object file from the stub
library. Unfortunately that then means we have two versions of
kvm_arch_irqchip_create() and the linker refuses to link.

You need to split this stub function into its own .c file --
you can only share a .c file with another stub function if
it's always the case that a build either needs all the stubs
or none of them.

I've dropped the PMU series from target-arm.next.

thanks
-- PMM
