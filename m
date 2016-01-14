Received: by 10.25.159.19 with SMTP id i19csp1935261lfe;
        Thu, 14 Jan 2016 10:09:15 -0800 (PST)
X-Received: by 10.140.138.145 with SMTP id 139mr8314586qhk.18.1452794955601;
        Thu, 14 Jan 2016 10:09:15 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z66si8475879qgd.22.2016.01.14.10.09.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 10:09:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:44074 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJmKg-0004pY-Rg
	for alex.bennee@linaro.org; Thu, 14 Jan 2016 13:09:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aJmKe-0004p3-EK
	for qemu-arm@nongnu.org; Thu, 14 Jan 2016 13:09:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aJmKd-0008UT-GK
	for qemu-arm@nongnu.org; Thu, 14 Jan 2016 13:09:12 -0500
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:33769)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aJmKd-0008UK-Ay
	for qemu-arm@nongnu.org; Thu, 14 Jan 2016 13:09:11 -0500
Received: by mail-vk0-x22d.google.com with SMTP id i129so146910224vkb.0
	for <qemu-arm@nongnu.org>; Thu, 14 Jan 2016 10:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=qomBSkhLDHBfFsct31O4upWmEzGn3sBVWlvP5hRjC24=;
	b=WctX2jap2eoe1TTHSGMraz17BURTGn6hhL96lhw3mZ1CSmooS4YVUqo3p5yHMw0NQz
	c6E4oZa8kbA1WLXDvDT4mmEve5KU0S4OAEFQQX2o+d/coLQjQJsSSjTzeDAqL6lGMHFr
	+Fv1GF/0KZAzz53cehid5lzKlOlQMgKMugNoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qomBSkhLDHBfFsct31O4upWmEzGn3sBVWlvP5hRjC24=;
	b=UiPNky0fZtvLU5dhkC43dvQA1mPuX2Z77DK5g5PwTWQ4BfHok0jzHazKpQYeA+fyBR
	R8dcbZDLJISBoXvDTItVXMqmeFK+vH4dmuauuE6YZpnpEX2cqDzU14gKdRFHOg999RDH
	l3+l2asdSiI+jn1tWIqZ60PxswpUtsv3Nj7W1fweErJzjOCz0564zv10iDuTow7JXeSC
	NIy3Bz+285Icyx0YaFDqMDYIdKukPY9D7ECW+XGXdMLRn+XvifrydrfZDkYMWorm9Mlg
	mo1YflQRYaF1oUqZrk0KKDWZLiqmuFFN6dtNPi032fO9wYvpiGYrV1EgZGm57k5qDr6x
	0iAQ==
X-Gm-Message-State: ALoCoQnH6KFikM8z5yREgyERUp23kxDt6bepKSjGhDSosOD4a9H0MYvxrCjezUqnhZnT9HsIFCis6krBtUrebXGm007J7e9wOQDlY3I3rOhNAZoU8j24/QA=
X-Received: by 10.31.0.136 with SMTP id 130mr4158074vka.139.1452794950965;
	Thu, 14 Jan 2016 10:09:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 14 Jan 2016 10:08:51 -0800 (PST)
In-Reply-To: <CAH47eN1oHgoVPR0f2+1Npi1z_4sHbeL1cFQT3R+9VeZCm0t+Yg@mail.gmail.com>
References: <1449167808-5656-1-git-send-email-Andrew.Baumann@microsoft.com>
	<CAH47eN1oHgoVPR0f2+1Npi1z_4sHbeL1cFQT3R+9VeZCm0t+Yg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jan 2016 18:08:51 +0000
Message-ID: <CAFEAcA8=6tNPAQB-AX4URhEgAg71nLektNuD9A+pYi6n5vtxwg@mail.gmail.com>
To: alvise rigo <a.rigo@virtualopensystems.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] target-arm: raise exception
 on misaligned LDREX operands
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
X-TUID: QFDN+r1rBTY7

On 14 January 2016 at 18:00, alvise rigo <a.rigo@virtualopensystems.com> wrote:
> Forcing an unaligned LDREX access in aarch32, QEMU fails the following assert:
> target-arm/helper.c:5921:regime_el: code should not be reached
>
> Running this snippet both baremetal and on top of Linux will trigger
> the problem:
>
> static inline int cmpxchg(volatile void *ptr, unsigned int old,
>                           unsigned int new)
> {
>     unsigned int oldval, res;
>
>     do {
>         asm volatile("@ __cmpxchg4\n"
>                 "    ldrex    %1, [%2]\n"
>                 "    mov    %0, #0\n"
>                 "    teq    %1, %3\n"
>                 "    strexeq %0, %4, [%2]\n"
>                 : "=&r" (res), "=&r" (oldval)
>                 : "r" (ptr), "Ir" (old), "r" (new)
>                 : "memory", "cc");
>     } while (res);
>
>     return oldval;
> }
>
> void main(void)
> {
>     int arr[2] = {0, 0};
>     int *ptr = (int *)(((void *)&arr) + 1);
>
>     cmpxchg(ptr, 0, 0xbeef);
> }
>
> The following code seems to solve the problem, but I'm not really sure
> this is the proper way to fix it.

> -    if (arm_regime_using_lpae_format(env, cpu_mmu_index(env, false))) {
> +    int mmu_idx = cpu_mmu_index(env, false);
> +    if (!arm_feature(env, ARM_FEATURE_EL2)) {
> +        mmu_idx += ARMMMUIdx_S1NSE0;
> +    }
> +    if (arm_regime_using_lpae_format(env, mmu_idx)) {

This won't work for (a) CPUs with EL2 (b) translation regimes
other than the basic EL0/EL1. I think you want

    int mmu_idx = cpu_mmu_index(env, false);
    if (mmu_idx == ARMMMUIdx_S12NSE0 || mmu_idx == ARMMMUIdx_S12NSE1) {
        mmu_idx += ARMMMUIdx_S1NSE0;
    }
    if (arm_regime_using_lpae_format(env, mmu_idx)) {

Perhaps we should also change the function name to
    arm_s1_regime_using_lpae_format()
to indicate that it is specifically checking the stage 1 translation
regime.

thanks
-- PMM
