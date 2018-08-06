Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3192236wru;
        Mon, 6 Aug 2018 08:32:47 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeuxUlVfbcgP1dHONVpECgkLavTtDGkjQVcMpigRFbBPBIMH+wa3b2dBGYRNl2bKX4RE8wc
X-Received: by 2002:ac8:42b:: with SMTP id v43-v6mr14111924qtg.319.1533569567495;
        Mon, 06 Aug 2018 08:32:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533569567; cv=none;
        d=google.com; s=arc-20160816;
        b=mQHx7EVx7ZewDx/d4WKiD7/bR0FMYisj44NMt9JPJ4FQIp7e4tEOrIXFloelQdscJ8
         enscRY+hWMV5xe8LN0CJLwlyyFtpwDHIdf+tAcs46dnnKToIC0FuArPVtxSjd0/EbX0P
         KG14OZiiFIftdoo5YRItBw91gthubadPi8vRWGDGDkhP/fQhdhVzr4xg9SR7dhgF2moA
         Z68G7xOGSxzOI2Mi7rWIgsMxUqnLlTLvIQ2gIaTXqr7mnLkxhaAie1ibpNATxk43Vdos
         vIAlXtpNEVHdKP1dDjbJAJuW3hbYg/vzCjgho80motZq7POZkGDUEXkgNt4l8q+DfV2E
         kbJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=g4MI0C0jiUWfDpMTDJMpU4x3j7sgU5q49OEzQ+O4GAc=;
        b=fGn7SA2xwPzQTL6vcip5X2+ioiQJwnYURNNGR1zWVoDRNQJ8TUY+ID5fsEtqGzZRHg
         tc2gAbYuR0kf+I8FYpdJe14icS6Ytxfisz6rAQJxO8mhnzUIbs5E9GbolInjadmWOeLE
         xipSFNnU/+sUZ5qBNcYwoCATOXEVsAxmhPPFaDr0XI9fJKa682mCXmTH6+N1JLSdTOJI
         W7MonPmCyintuPKJXW0VioofTA41hfcx75uZU9p/AJT/i5xB4T4NAwcps8HThaaZ+awR
         qeveJZ2a50lqGfMAkcJD3aAOP5tIg6Ncm3Hv06k4M+bm8zXEHYePABUG4p9ztgVESP89
         L5gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r1-v6si2003822qkd.113.2018.08.06.08.32.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Aug 2018 08:32:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34682 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmhV0-0002ol-Vt
	for alex.bennee@linaro.org; Mon, 06 Aug 2018 11:32:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1fmhUl-0002nR-3d
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 11:32:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1fmhUg-0000Sg-9e
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 11:32:31 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:45346 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1fmhUg-0000Qw-2y; Mon, 06 Aug 2018 11:32:26 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2B55940216E3;
	Mon,  6 Aug 2018 15:32:25 +0000 (UTC)
Received: from work-vm (ovpn-117-156.ams2.redhat.com [10.36.117.156])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 968682026D76;
	Mon,  6 Aug 2018 15:32:23 +0000 (UTC)
Date: Mon, 6 Aug 2018 16:32:21 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180806153220.GE2473@work-vm>
References: <20180806123445.1459-1-peter.maydell@linaro.org>
	<20180806123445.1459-5-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180806123445.1459-5-peter.maydell@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Mon, 06 Aug 2018 15:32:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Mon, 06 Aug 2018 15:32:25 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'dgilbert@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH for-3.0 v2 4/5] hw/intc/arm_gicv3_common:
 Move post_load hooks to top-level VMSD
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
X-TUID: 2f4GTVfWEAPu

* Peter Maydell (peter.maydell@linaro.org) wrote:
> Contrary to the the impression given in docs/devel/migration.rst,
> the migration code does not run the pre_load hook for a
> subsection unless the subsection appears on the wire, and so
> this is not a place where you can set the default value for
> state for the "subsection not present" case. Instead this needs
> to be done in a pre_load hook for whatever is the parent VMSD
> of the subsection.
> 
> We got this wrong in two of the subsection definitions in
> the GICv3 migration structs; fix this.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  hw/intc/arm_gicv3_common.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index e1a8999cf5b..8175889f1e7 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -73,7 +73,7 @@ static const VMStateDescription vmstate_gicv3_cpu_virt = {
>      }
>  };
>  
> -static int icc_sre_el1_reg_pre_load(void *opaque)
> +static int vmstate_gicv3_cpu_pre_load(void *opaque)
>  {
>      GICv3CPUState *cs = opaque;
>  
> @@ -97,7 +97,6 @@ const VMStateDescription vmstate_gicv3_cpu_sre_el1 = {
>      .name = "arm_gicv3_cpu/sre_el1",
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .pre_load = icc_sre_el1_reg_pre_load,
>      .needed = icc_sre_el1_reg_needed,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT64(icc_sre_el1, GICv3CPUState),
> @@ -109,6 +108,7 @@ static const VMStateDescription vmstate_gicv3_cpu = {
>      .name = "arm_gicv3_cpu",
>      .version_id = 1,
>      .minimum_version_id = 1,
> +    .pre_load = vmstate_gicv3_cpu_pre_load,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(level, GICv3CPUState),
>          VMSTATE_UINT32(gicr_ctlr, GICv3CPUState),
> @@ -139,7 +139,7 @@ static const VMStateDescription vmstate_gicv3_cpu = {
>      }
>  };
>  
> -static int gicv3_gicd_no_migration_shift_bug_pre_load(void *opaque)
> +static int gicv3_pre_load(void *opaque)
>  {
>      GICv3State *cs = opaque;
>  
> @@ -210,7 +210,6 @@ const VMStateDescription vmstate_gicv3_gicd_no_migration_shift_bug = {
>      .version_id = 1,
>      .minimum_version_id = 1,
>      .needed = needed_always,
> -    .pre_load = gicv3_gicd_no_migration_shift_bug_pre_load,
>      .post_load = gicv3_gicd_no_migration_shift_bug_post_load,
>      .fields = (VMStateField[]) {
>          VMSTATE_BOOL(gicd_no_migration_shift_bug, GICv3State),
> @@ -222,6 +221,7 @@ static const VMStateDescription vmstate_gicv3 = {
>      .name = "arm_gicv3",
>      .version_id = 1,
>      .minimum_version_id = 1,
> +    .pre_load = gicv3_pre_load,
>      .pre_save = gicv3_pre_save,
>      .post_load = gicv3_post_load,
>      .priority = MIG_PRI_GICV3,
> -- 
> 2.17.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
