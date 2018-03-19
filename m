Received: by 10.28.91.67 with SMTP id p64csp2804031wmb;
        Mon, 19 Mar 2018 09:31:14 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvKJFmEZP+OixegHLqqjhpqUgf7nYtJXE3J3+wGw65iclwmNhbJND/lWBkL6ANpgWwa48Jn
X-Received: by 10.129.71.9 with SMTP id u9mr1054504ywa.433.1521477074346;
        Mon, 19 Mar 2018 09:31:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521477074; cv=none;
        d=google.com; s=arc-20160816;
        b=mVLDo7bQp79rPrQtbCcsX4hPADWNKK+4monYfOZ+CF+CQG0nUpteviVVyWBAgDGIVS
         n8cDGTXwdcXcSPXEy4R/BGrQWObqFWi6BHRI+pocpukeKpRz4d79RzI0jxB/D3Lgjbcd
         t5ZxRqS2ozX6sTW3V6C6Ofv/HN0GPLWLNTiYhVyzHFvEty1uruyeMP+rwlltBEWR+PKZ
         ZpaZhyn7+fnUrUmLsYxql4tXVBTL5IxJ69EV9gaIsZWRZVyjDcItI7SREZTRrTMJfPav
         p0i4BTBnTNvwIWJvEO4On1mqxlxetjolfDUBq7iwQgEK2PE49jXgK+/7FFN1Zn2MmgBg
         MgOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=w8C/D4atoI2gA3cUG1pqivDlnaGmgibnYIV5DdKWnoc=;
        b=Xa7HjUxpO6xhtMtuKZ7trzzICjP72qVf5+/TM5aiuPpWewp+78jECzrTOanSSL+BWg
         qP8k1behb/sanVRVHvegoM9Y7bIZbkwOxWsC+vyq6N3zhHo7x4eozKWaCrZ6B2eo8BxE
         FF216CYetbuoa2J2gRgeOCq2Rg5ztlJUaoY02BK32dZb3CwhXGNxBFDhvDpodDog3wIN
         tMUzb25vzUXF9tjpX/T7cGWm8+VZd5YUmRTEiab7GXHAsPOaOYmUlGi63wH7SIreNJj6
         sTsw/n5PEz6CpbIBwhyDFjRz0mZVoc5XH96LsR24fsFXCpgP73UeshbEnf+XtWSIafcz
         ANHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GBwm4q6N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z1si385649qkb.293.2018.03.19.09.31.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Mar 2018 09:31:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GBwm4q6N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42932 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1exxgn-0007Jh-Pq
	for alex.bennee@linaro.org; Mon, 19 Mar 2018 12:31:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47839)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1exxga-0007I5-B6
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 12:31:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1exxgZ-0004Kp-6w
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 12:31:00 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:42922)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1exxgZ-0004KF-2E
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 12:30:59 -0400
Received: by mail-ot0-x244.google.com with SMTP id v23-v6so2740834oth.9
	for <qemu-arm@nongnu.org>; Mon, 19 Mar 2018 09:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=w8C/D4atoI2gA3cUG1pqivDlnaGmgibnYIV5DdKWnoc=;
	b=GBwm4q6NT3JAAx7QQOYbS7s3lNBiqoG7sZtouuDqwkDPpqoheCsChOCSLpGrXrdo/5
	Nwv5c8hg5Hn9ujD6WvTot/S6lLCz+u3bD3jvgmmQEPrAw7D6ufikp5kWTY4B6XnWR6Rp
	7bn7b8shb1H5REXv2UlPt29ZxJDm03Kup++ww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=w8C/D4atoI2gA3cUG1pqivDlnaGmgibnYIV5DdKWnoc=;
	b=ZS3dyDmZGyWLA5hyfXXwjiLflYmK+6cXWT7JoJV/9j8VsKLpKnZnfVdAHJG7isWtQZ
	pFUoxAaHhAhqy5ZMy02SP8HQgXin0WSksPsnT/7xYPbog8tDsC+FLX/elWp3HEQRbYP7
	svXhI2vFNd8PU8ac1o35e48f/7JtR7nXdJQ4hPyZ+ykLUYVjbNuCo9kpUH19bzbPi/mG
	8UTnWq52BJfm5L9Kb6Kup81oCbX3W5Ynk+bzxIZb1LXSCEoywiyF1Fnoru3DVVSNYqOZ
	X4OJ2Ul0q9z6MMT/r9QGNl+8DjO069VYMKRIjv4ie4Hp8rL9dNcB9FoyUwEbOsquN/zD
	Rx2Q==
X-Gm-Message-State: AElRT7FcBVLaxA9NxMpVHvjnl19TMboOtdmMge9QZltMtbHbeWgEHxDs
	3QnEX/CjstvyZ7ZhsgnX3w60k6RLkLC0i11JoVYAWA==
X-Received: by 2002:a9d:4598:: with SMTP id
	x24-v6mr7740512ote.126.1521477058117; 
	Mon, 19 Mar 2018 09:30:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Mon, 19 Mar 2018 09:30:37
	-0700 (PDT)
In-Reply-To: <1521470177-14760-3-git-send-email-zhaoshenglong@huawei.com>
References: <1521470177-14760-1-git-send-email-zhaoshenglong@huawei.com>
	<1521470177-14760-3-git-send-email-zhaoshenglong@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Mar 2018 16:30:37 +0000
Message-ID: <CAFEAcA8677=cuetsXuobJDWDEw1HKNZiecXAC8+PCzPQ8jP7TA@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH 2/2] arm_gicv3_kvm: kvm_dist_get/put: skip
 the registers banked by GICR
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g/HqYAkPcXJz

On 19 March 2018 at 14:36, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> It should skip to getting/putting the registers banked by GICR so that
> it could get/put the correct ones.
>
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>

Can you explain what the consequences of the current code are
(ie is there a bug here that we are fixing?), and why the changes
are correct, please?


> ---
>  hw/intc/arm_gicv3_kvm.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index 7000716..e967e4f 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -136,6 +136,8 @@ static void kvm_dist_get_priority(GICv3State *s, uint32_t offset, uint8_t *bmp)
>      int irq;
>
>      field = (uint32_t *)bmp;
> +    /* The first 8 GICD_IPRIORITYR should skip. */

It would be helpful to explain why we can skip the first 8 registers;
similarly below.

(I suspect the answer here is "for the KVM GICv3, affinity routing is always
enabled, and the first 8 GICD_IPRIORITYR<n> registers are always RAZ/WI,
so we don't need to sync them", for instance.)

> +    offset += (8 * sizeof(uint32_t));
>      for_each_dist_irq_reg(irq, s->num_irq, 8) {
>          kvm_gicd_access(s, offset, &reg, false);
>          *field = reg;
> @@ -150,6 +152,8 @@ static void kvm_dist_put_priority(GICv3State *s, uint32_t offset, uint8_t *bmp)
>      int irq;
>
>      field = (uint32_t *)bmp;
> +    /* The first 8 GICD_IPRIORITYR should skip. */
> +    offset += (8 * sizeof(uint32_t));
>      for_each_dist_irq_reg(irq, s->num_irq, 8) {
>          reg = *field;
>          kvm_gicd_access(s, offset, &reg, true);
> @@ -164,6 +168,8 @@ static void kvm_dist_get_edge_trigger(GICv3State *s, uint32_t offset,
>      uint32_t reg;
>      int irq;
>
> +    /* The first 2 GICD_ICFGR should skip. */
> +    offset += (2 * sizeof(uint32_t));
>      for_each_dist_irq_reg(irq, s->num_irq, 2) {
>          kvm_gicd_access(s, offset, &reg, false);
>          reg = half_unshuffle32(reg >> 1);
> @@ -181,6 +187,8 @@ static void kvm_dist_put_edge_trigger(GICv3State *s, uint32_t offset,
>      uint32_t reg;
>      int irq;
>
> +    /* The first 2 GICD_ICFGR should skip. */
> +    offset += (2 * sizeof(uint32_t));
>      for_each_dist_irq_reg(irq, s->num_irq, 2) {
>          reg = *gic_bmp_ptr32(bmp, irq);
>          if (irq % 32 != 0) {
> @@ -222,6 +230,8 @@ static void kvm_dist_getbmp(GICv3State *s, uint32_t offset, uint32_t *bmp)
>      uint32_t reg;
>      int irq;
>
> +    /* The first 1 GICD_XXXX should skip. */
> +    offset += (1 * sizeof(uint32_t));
>      for_each_dist_irq_reg(irq, s->num_irq, 1) {
>          kvm_gicd_access(s, offset, &reg, false);
>          *gic_bmp_ptr32(bmp, irq) = reg;
> @@ -236,6 +246,10 @@ static void kvm_dist_putbmp(GICv3State *s, uint32_t offset,
>      int irq;
>
>      clroffset_index = clroffset;
> +    /* The first 1 GICD_XXXX should skip. */

This looks like placeholder text that hasn't been filled in ?

> +    offset += (1 * sizeof(uint32_t));
> +    if (clroffset != 0)
> +        clroffset_index += (1 * sizeof(uint32_t));
>      for_each_dist_irq_reg(irq, s->num_irq, 1) {
>          /* If this bitmap is a set/clear register pair, first write to the
>           * clear-reg to clear all bits before using the set-reg to write
> --
> 2.0.4

thanks
-- PMM
