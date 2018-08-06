Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3199515wru;
        Mon, 6 Aug 2018 08:39:43 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdrI6DWCp983aC1MFXcLrQvexsEZh+Lq3koIQBWDcCxzH3+p2dFSKyXu05MkPz7B/g56Nvi
X-Received: by 2002:a0c:8a1b:: with SMTP id 27-v6mr13382046qvt.159.1533569983821;
        Mon, 06 Aug 2018 08:39:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533569983; cv=none;
        d=google.com; s=arc-20160816;
        b=XpdRsK/SOMfHrs6l1WGtfWxGriC5vlpFqHXSsMV24XiJmNfI2wRSYjUw8BA0cmFZN6
         SnPFj7gLmvo2gJd/EhQEpFB/PFHL3pHKGlFtGFCBiMgxnU/bRAy4Bby3Qa0zfceoHr3r
         Ek4T7rx5Rriy9vNLfyFlOwLKcufX90IrC204QYDkD9xJ/20dlF7mbZaQDjT2lVsnY927
         +3+89VCITkt1SypTIzUu/+EE12f75wA6zBbLBkhz0MApA1bd6MZn8Z7tTmZgxLypvsY3
         alXsm0yhFOqpu/XpDJIe8jEpe1j5x8ejlgcS7s4mqUyBmnFcvgH68aqJ3KK3/L7Vdd7Z
         J8ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=s5r2ogpEwLPqoTc8A/0ON/IcbIRLiIo5Qhgwb0hJ6J0=;
        b=vlMg2XXHerqwmV01OnIIhB0F3r+iwGBKjHq572+UK++O/NSHlYBmoRePWpUOpyp9dK
         ia3Gz7tHVW5IlcpMrQRfnTYt/bZ+7s7TJ5zFS3/viiu3pTRAWtTxjv4NPf1e9TLtm2KL
         buJOSqZwVVW9f7F0z/WqPFApOzDUueG1MM6gpy08+o44hRdkMWZd5fWe25xpw35u1NO+
         lXPF1jLIPsNzUGJajh4vFZU+CSPigLjnJYtEKyYPSBFeNdhFYMp9Gd2jroGUWkse1GlP
         xj7sAhk2PA7Mpbk8hela1+wqxjv3J4zoUDQGakw4ULnxDkBuiSFdfDS268VXXw9ECzOR
         0e8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u15-v6si418102qta.385.2018.08.06.08.39.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Aug 2018 08:39:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34739 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmhbj-0006uF-BJ
	for alex.bennee@linaro.org; Mon, 06 Aug 2018 11:39:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1fmhba-0006u9-NV
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 11:39:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1fmhbV-0003sE-Ss
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 11:39:34 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:60314 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1fmhbV-0003rh-MC; Mon, 06 Aug 2018 11:39:29 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ECD38406E1D6;
	Mon,  6 Aug 2018 15:39:28 +0000 (UTC)
Received: from work-vm (ovpn-117-156.ams2.redhat.com [10.36.117.156])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B544C2026D76;
	Mon,  6 Aug 2018 15:39:27 +0000 (UTC)
Date: Mon, 6 Aug 2018 16:39:25 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180806153925.GF2473@work-vm>
References: <20180806123445.1459-1-peter.maydell@linaro.org>
	<20180806123445.1459-6-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180806123445.1459-6-peter.maydell@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 06 Aug 2018 15:39:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 06 Aug 2018 15:39:29 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'dgilbert@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH for-3.0 v2 5/5] hw/intc/arm_gicv3_common:
 Move gicd shift bug handling to gicv3_post_load
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
Cc: Juan Quintela <quintela@redhat.com>, patches@linaro.org,
	qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
	qemu-arm@nongnu.org, Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y1r7dmok0IFY

* Peter Maydell (peter.maydell@linaro.org) wrote:
> The code currently in gicv3_gicd_no_migration_shift_bug_post_load()
> that handles migration from older QEMU versions with a particular
> bug is misplaced. We need to run this after migration in all cases,
> not just the cases where the "arm_gicv3/gicd_no_migration_shift_bug"
> subsection is present, so it must go in a post_load hook for the
> top level VMSD, not for the subsection. Move it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  hw/intc/arm_gicv3_common.c | 77 ++++++++++++++++++--------------------
>  1 file changed, 37 insertions(+), 40 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index 8175889f1e7..52480c3b4cf 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -29,6 +29,41 @@
>  #include "hw/arm/linux-boot-if.h"
>  #include "sysemu/kvm.h"
>  
> +
> +static void gicv3_gicd_no_migration_shift_bug_post_load(GICv3State *cs)
> +{
> +    if (cs->gicd_no_migration_shift_bug) {
> +        return;
> +    }
> +
> +    /* Older versions of QEMU had a bug in the handling of state save/restore
> +     * to the KVM GICv3: they got the offset in the bitmap arrays wrong,
> +     * so that instead of the data for external interrupts 32 and up
> +     * starting at bit position 32 in the bitmap, it started at bit
> +     * position 64. If we're receiving data from a QEMU with that bug,
> +     * we must move the data down into the right place.
> +     */
> +    memmove(cs->group, (uint8_t *)cs->group + GIC_INTERNAL / 8,
> +            sizeof(cs->group) - GIC_INTERNAL / 8);
> +    memmove(cs->grpmod, (uint8_t *)cs->grpmod + GIC_INTERNAL / 8,
> +            sizeof(cs->grpmod) - GIC_INTERNAL / 8);
> +    memmove(cs->enabled, (uint8_t *)cs->enabled + GIC_INTERNAL / 8,
> +            sizeof(cs->enabled) - GIC_INTERNAL / 8);
> +    memmove(cs->pending, (uint8_t *)cs->pending + GIC_INTERNAL / 8,
> +            sizeof(cs->pending) - GIC_INTERNAL / 8);
> +    memmove(cs->active, (uint8_t *)cs->active + GIC_INTERNAL / 8,
> +            sizeof(cs->active) - GIC_INTERNAL / 8);
> +    memmove(cs->edge_trigger, (uint8_t *)cs->edge_trigger + GIC_INTERNAL / 8,
> +            sizeof(cs->edge_trigger) - GIC_INTERNAL / 8);
> +
> +    /*
> +     * While this new version QEMU doesn't have this kind of bug as we fix it,
> +     * so it needs to set the flag to true to indicate that and it's necessary
> +     * for next migration to work from this new version QEMU.
> +     */
> +    cs->gicd_no_migration_shift_bug = true;
> +}
> +
>  static int gicv3_pre_save(void *opaque)
>  {
>      GICv3State *s = (GICv3State *)opaque;
> @@ -46,6 +81,8 @@ static int gicv3_post_load(void *opaque, int version_id)
>      GICv3State *s = (GICv3State *)opaque;
>      ARMGICv3CommonClass *c = ARM_GICV3_COMMON_GET_CLASS(s);
>  
> +    gicv3_gicd_no_migration_shift_bug_post_load(s);
> +
>      if (c->post_load) {
>          c->post_load(s);
>      }
> @@ -161,45 +198,6 @@ static int gicv3_pre_load(void *opaque)
>      return 0;
>  }
>  
> -static int gicv3_gicd_no_migration_shift_bug_post_load(void *opaque,
> -                                                       int version_id)
> -{
> -    GICv3State *cs = opaque;
> -
> -    if (cs->gicd_no_migration_shift_bug) {
> -        return 0;
> -    }
> -
> -    /* Older versions of QEMU had a bug in the handling of state save/restore
> -     * to the KVM GICv3: they got the offset in the bitmap arrays wrong,
> -     * so that instead of the data for external interrupts 32 and up
> -     * starting at bit position 32 in the bitmap, it started at bit
> -     * position 64. If we're receiving data from a QEMU with that bug,
> -     * we must move the data down into the right place.
> -     */
> -    memmove(cs->group, (uint8_t *)cs->group + GIC_INTERNAL / 8,
> -            sizeof(cs->group) - GIC_INTERNAL / 8);
> -    memmove(cs->grpmod, (uint8_t *)cs->grpmod + GIC_INTERNAL / 8,
> -            sizeof(cs->grpmod) - GIC_INTERNAL / 8);
> -    memmove(cs->enabled, (uint8_t *)cs->enabled + GIC_INTERNAL / 8,
> -            sizeof(cs->enabled) - GIC_INTERNAL / 8);
> -    memmove(cs->pending, (uint8_t *)cs->pending + GIC_INTERNAL / 8,
> -            sizeof(cs->pending) - GIC_INTERNAL / 8);
> -    memmove(cs->active, (uint8_t *)cs->active + GIC_INTERNAL / 8,
> -            sizeof(cs->active) - GIC_INTERNAL / 8);
> -    memmove(cs->edge_trigger, (uint8_t *)cs->edge_trigger + GIC_INTERNAL / 8,
> -            sizeof(cs->edge_trigger) - GIC_INTERNAL / 8);
> -
> -    /*
> -     * While this new version QEMU doesn't have this kind of bug as we fix it,
> -     * so it needs to set the flag to true to indicate that and it's necessary
> -     * for next migration to work from this new version QEMU.
> -     */
> -    cs->gicd_no_migration_shift_bug = true;
> -
> -    return 0;
> -}
> -
>  static bool needed_always(void *opaque)
>  {
>      return true;
> @@ -210,7 +208,6 @@ const VMStateDescription vmstate_gicv3_gicd_no_migration_shift_bug = {
>      .version_id = 1,
>      .minimum_version_id = 1,
>      .needed = needed_always,
> -    .post_load = gicv3_gicd_no_migration_shift_bug_post_load,
>      .fields = (VMStateField[]) {
>          VMSTATE_BOOL(gicd_no_migration_shift_bug, GICv3State),
>          VMSTATE_END_OF_LIST()
> -- 
> 2.17.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
