Received: by 10.25.21.96 with SMTP id l93csp464550lfi;
        Thu, 23 Jun 2016 04:17:22 -0700 (PDT)
X-Received: by 10.55.140.69 with SMTP id o66mr45018409qkd.143.1466680642797;
        Thu, 23 Jun 2016 04:17:22 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n74si5280962qka.255.2016.06.23.04.17.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 04:17:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35907 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bG2dO-00036F-8V
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 07:17:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60523)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG2cQ-0002oH-3j
	for qemu-devel@nongnu.org; Thu, 23 Jun 2016 07:16:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG2cO-00074c-1z
	for qemu-devel@nongnu.org; Thu, 23 Jun 2016 07:16:20 -0400
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:36716)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG2cN-00074U-Hr
	for qemu-devel@nongnu.org; Thu, 23 Jun 2016 07:16:19 -0400
Received: by mail-vk0-x233.google.com with SMTP id u64so100852617vkf.3
	for <qemu-devel@nongnu.org>; Thu, 23 Jun 2016 04:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cgO7VY0KAAMGvkwp/GNUaXCepm7a9oojpoC16eo5t9c=;
	b=XbJuK0cbMNzCg3j6oecEWg8wMsIjuHG2emliKmW3NYvQ3jZQgSIhK8gsopPFA4CRo/
	a8gZs/6zh4sXpeQjYoHlWe3GxsGvu3QlgP4ehTwj+0+eqy+z/GQDwVuceqe5hksdZV3P
	g5fECs+N7YpluDBN0JLLo1itsHIDiY9k9yJQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cgO7VY0KAAMGvkwp/GNUaXCepm7a9oojpoC16eo5t9c=;
	b=h2cBXY6B8lQ8u8RY8QSPC07hE/dQClU3E+gFtPTYxE1VNk0XtXw0JY3z9XbzZbuYcC
	uCvM/yMLfuHSDEK/LvOB2D0wku5yxW1u3lFbGEY3tUrJYnmaQ/Gu8s68iuJy7VM5Tlsk
	8gz8hEHKjbvDGh3vL4yUSAuP2Rzc7HdmkKfGBYsDBSdftDuzlpVS2ETMZsM3JaDitsv8
	frXfW9+88TcjMZ0FU86SZUBOklW9XZx7Nyfh0P4Bh6CucwaP1/v+eeQnbJNJ67CjdVEW
	qkQlifXdd+6udIkwlmnVc+UT3Y8J17I7tOurTUKUUiOiNMGHfFdk39B3Od6ZBzxMIWkP
	jCdQ==
X-Gm-Message-State: ALyK8tLgHG+1iuBbmjaStwM3/PN9ZxzCTeWcwUaa2LHTzJQgsrfKXx8J7U3FRC/sgRZSBudpIM9W4fJbxR6BPWQT
X-Received: by 10.159.37.175 with SMTP id 44mr15435279uaf.66.1466680579112;
	Thu, 23 Jun 2016 04:16:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Thu, 23 Jun 2016 04:15:59 -0700 (PDT)
In-Reply-To: <1466535515-18092-1-git-send-email-drjones@redhat.com>
References: <1466535515-18092-1-git-send-email-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2016 12:15:59 +0100
Message-ID: <CAFEAcA-56LUe_jYK=V-H890WVL12YuDeRSZn9FK3yReiJ4p2Hw@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Subject: Re: [Qemu-devel] [PATCH] hw/arm/virt: gicv3: use all target-list
 bits
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VtcF40zsGRtQ

On 21 June 2016 at 19:58, Andrew Jones <drjones@redhat.com> wrote:
> Signed-off-by: Andrew Jones <drjones@redhat.com>

I think this commit message could be improved...it's both
very short and a bit off the mark.

> ---
>  hw/arm/virt.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index c5c125e9204a0..53f545921003c 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1271,6 +1271,16 @@ static void machvirt_init(MachineState *machine)
>          }
>          cpuobj = object_new(object_class_get_name(oc));
>
> +        /* Adjust MPIDR per the GIC's target-list size. */
> +        if (gic_version == 3) {
> +            CPUState *cs = CPU(cpuobj);
> +            uint8_t Aff1 = cs->cpu_index / 16;
> +            uint8_t Aff0 = cs->cpu_index % 16;
> +
> +            object_property_set_int(cpuobj, (Aff1 << ARM_AFF1_SHIFT) | Aff0,
> +                                    "mp-affinity", NULL);
> +        }

We still don't have support in KVM for telling the CPU what
affinity to use, so these may get overridden later if KVM's
idea of affinity and ours differ. I guess that's no different
to what we have today, though.

I think it would be better to:
 * use the loop index 'n' rather than fishing the cpu_index
   out of the CPUState.
 * do this regardless of GIC version (if it's GICv2 we only
   have 8 CPUs max anyway)
 * comment it as "Create our CPUs in clusters of 16; this suits
   the GICv3's target list limitations, and matches how KVM
   assigns them"
 * for 32-bit, set the mp-affinity in the same arrangement the
   kernel does for KVM, which is clusters of 4 CPUs
 * note also in the comment that for KVM these will be overridden
   by the hard-coded topology in the kernel when the CPU is
   realized

[is changing mp-affinity a migration compat break?]

thanks
-- PMM
