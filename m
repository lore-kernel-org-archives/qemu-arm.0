Received: by 10.182.158.201 with SMTP id ww9csp876977obb;
        Tue, 17 Nov 2015 09:59:18 -0800 (PST)
X-Received: by 10.13.226.132 with SMTP id l126mr26619365ywe.164.1447783158688;
        Tue, 17 Nov 2015 09:59:18 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y85si18585725ywa.342.2015.11.17.09.59.18
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Tue, 17 Nov 2015 09:59:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:60059 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZykXG-0003fu-9q
	for alex.bennee@linaro.org; Tue, 17 Nov 2015 12:59:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54119)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZykXB-0003fZ-Kk
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 12:59:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZykXA-0001xo-K6
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 12:59:13 -0500
Received: from mail-yk0-x22b.google.com ([2607:f8b0:4002:c07::22b]:32939)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZykXA-0001xg-Ej
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 12:59:12 -0500
Received: by ykdv3 with SMTP id v3so19601451ykd.0
	for <qemu-arm@nongnu.org>; Tue, 17 Nov 2015 09:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=bK9bErzY3kX4tAxWyoU8VpG0VCq5zwbSCmctbmuqEUg=;
	b=T+gKKfISPO7dYtLUNXA44Dl56T0FsZcsLeEvKy1p8iExkEHLSuCDtaEOTjnCzZ29CO
	aqCeCvLzZuGsCuyrhz4I/eQe8DU7NvnaFRmSkssyAvrkLTUGsWvOjoWv/DM6uZp9svJb
	RoIV9seMLAOcKfE38q0qQ5VTiGzAe9aZ9on8KgIOhIXiWB8pAiZjHhCkmSh2sT7b34Qb
	u1hg+Qe9W9Hg73szutgADH8OtANVWbi4SUlsdsQGCNkO9zWZv1Z1nglAnSRCW64bf1TJ
	CCbrKZWSFjAAM4HGqTUf/g+2C1cMMJ357RgH+oH16RcnGbdicVSJ1WTGVz9nOOHMS7a3
	Pz7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=bK9bErzY3kX4tAxWyoU8VpG0VCq5zwbSCmctbmuqEUg=;
	b=D544uGlpD8L0JJwoUNDwyrH7lg8nSWeS1mTPYDM9Q4lMLujF74e3Pej1b/1tN/3yX7
	j4RVI3UXg6143x6+cxl7Kl+aMnydKL9WdMmzXMf41dNTho+5PrF6x+ESyF5pJHrshR7K
	r9FmhHnbF5dQpKoxmHTKDGFnKGcZRYA+/RqZmYf/qIuTWLhohMcQKdOFAl0B7HC1jLVK
	fFHn1y/SbRyQI+50nTQGNqcmlojpCeUUsGFcjEpIZ5VQssZGlkY7MwczU2imGC6K6qiv
	A+0oY2n+uK4W8lakpXfpYjGWqqrnoVO7n4gpfez3HPDtBtPUFce28t29nneS6RvehdtH
	4yEg==
X-Gm-Message-State: ALoCoQlyJqFq0ug533HwWMHAY064vB0wjWfXGpQvM7my+ZE+SvOhLLCVQ/bwtsZJU5dQn2GBDYHT
X-Received: by 10.129.99.195 with SMTP id x186mr40326630ywb.345.1447783151022; 
	Tue, 17 Nov 2015 09:59:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 17 Nov 2015 09:58:51 -0800 (PST)
In-Reply-To: <1447031505-12477-10-git-send-email-mdavidsaver@gmail.com>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
	<1447031505-12477-10-git-send-email-mdavidsaver@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Nov 2015 17:58:51 +0000
Message-ID: <CAFEAcA8j68GOjXMpw86MEcCLxqtvenhJq85ZoWUSnOggTgYs9Q@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c07::22b
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 09/18] armv7m: NVIC update vmstate
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
X-TUID: /w9aLgqoxsUp

On 9 November 2015 at 01:11, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
> ---
>  hw/intc/armv7m_nvic.c | 64 +++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 62 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 3b10dee..c860b36 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -810,15 +810,75 @@ static const MemoryRegionOps nvic_sysreg_ops = {
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>
> +static
> +int nvic_post_load(void *opaque, int version_id)
> +{
> +    nvic_state *s = opaque;
> +    unsigned i;
> +
> +    /* evil hack to get ARMCPU* ahead of time */
> +    assert(cpus.tqh_first);
> +    assert(!CPU_NEXT(cpus.tqh_first));
> +    s->cpu = ARM_CPU(cpus.tqh_first);
> +    assert(s->cpu);

Why do we need to do this? By the time we get to loading
state into the system, s->cpu should already have been set.

> +
> +    /* recalculate priorities */
> +    for (i = 4; i < s->num_irq; i++) {
> +        set_prio(s, i, s->vectors[i].raw_prio);
> +    }
> +
> +    nvic_irq_update(s, highest_runnable_prio(s->cpu));
> +
> +    return 0;
> +}
> +
> +static
> +int vec_info_get(QEMUFile *f, void *pv, size_t size)
> +{
> +    vec_info *I = pv;
> +    I->prio_sub = qemu_get_be16(f);
> +    I->prio_group = qemu_get_byte(f);
> +    I->raw_prio = qemu_get_ubyte(f);
> +    I->enabled = qemu_get_ubyte(f);
> +    I->pending = qemu_get_ubyte(f);
> +    I->active = qemu_get_ubyte(f);
> +    I->level = qemu_get_ubyte(f);
> +    return 0;
> +}
> +
> +static
> +void vec_info_put(QEMUFile *f, void *pv, size_t size)
> +{
> +    vec_info *I = pv;
> +    qemu_put_be16(f, I->prio_sub);
> +    qemu_put_byte(f, I->prio_group);
> +    qemu_put_ubyte(f, I->raw_prio);
> +    qemu_put_ubyte(f, I->enabled);
> +    qemu_put_ubyte(f, I->pending);
> +    qemu_put_ubyte(f, I->active);
> +    qemu_put_ubyte(f, I->level);
> +}
> +
> +static const VMStateInfo vmstate_info = {
> +    .name = "armv7m_nvic_info",
> +    .get = vec_info_get,
> +    .put = vec_info_put,
> +};

I don't think there's any need to use get and put functions here:
better to define a VMStateDescripton for the struct vec_info,
and then you can just refer to that from the main vmstate_nvic
description. (hw/audio/pl041.c has some examples of this.)

> +
>  static const VMStateDescription vmstate_nvic = {
>      .name = "armv7m_nvic",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> +    .version_id = 2,
> +    .minimum_version_id = 2,
> +    .post_load = &nvic_post_load,
>      .fields = (VMStateField[]) {
> +        VMSTATE_ARRAY(vectors, nvic_state, NVIC_MAX_VECTORS, 0,
> +                      vmstate_info, vec_info),
> +        VMSTATE_UINT8(prigroup, nvic_state),
>          VMSTATE_UINT32(systick.control, nvic_state),
>          VMSTATE_UINT32(systick.reload, nvic_state),
>          VMSTATE_INT64(systick.tick, nvic_state),
>          VMSTATE_TIMER_PTR(systick.timer, nvic_state),
> +        VMSTATE_UINT32(num_irq, nvic_state),
>          VMSTATE_END_OF_LIST()
>      }
>  };

Ideally the VMState should be added in the same patches that
add new fields or structures, rather than in its own patch
at the end.

thanks
-- PMM
