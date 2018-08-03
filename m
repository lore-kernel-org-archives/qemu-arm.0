Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp317831wru;
        Fri, 3 Aug 2018 10:29:56 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfDN2yowh388c+c1LpDRrP4vbEvJztC2xPyYxR9m4xEkOSlmmthwt4oe3Cc8MCs+09IKSR2
X-Received: by 2002:a37:641:: with SMTP id 62-v6mr4535709qkg.227.1533317396532;
        Fri, 03 Aug 2018 10:29:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533317396; cv=none;
        d=google.com; s=arc-20160816;
        b=ol6YDMxLCkXUcao+GvPLMoJK+ezqgTAs0J2oEa9rkWGedhGaZHXlXKlRIyvAk1e7fU
         t6wI8M7yf9+8Umhu6CwDoNQVFrXU5gaHGqjkYdFDb+H+p0LCZ6mN4DmESZ/26s2M3hJs
         8wNiUqX6/uu7p0ZPDC7Axomu7i5IIB5mkPQ5uvpGNfD0KTD6t0aQwzqsw0E8p5KjzqJf
         YnnraKAgwKJD8RrXUn6gI7U8G+DjZikjE+PB+2S5vHVKrWa+4XHMwt50olfxC8gGc6ha
         EsQQ4o1h5/6aIa4ZveGvhaAk2IGxrt9G8hkyMebJS2o1v5A0xgr7+/Ktsr9ZRDOga+BL
         NA2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=GLIGIadRNW9yMDSgArxOQLcv5uRboRE/SYgnD0Vr9zY=;
        b=vpJEKEohNiy8eGomFrZKGXdPB+o1GYdLDSavaF1c1p7gNLGJJcn6DS4do9PwQnBZgj
         n81oUt8PvKT0qdbOEY7OmCMmQ5U1gOnt0JvQHDSGs7styEkjg837CzHKOA8sWqly6TkI
         AYft+dZYmPd9UYIndUQLhEelBWIMsWlFcksba3H1ymKP2XK5eQdw9ytYg4xWTPufY7G6
         Z4TVkehtTBJ58zuLnmnDt+jHkahAbIVL8/7f1RG4PGHVl1D4nygiCoDxRXbzRfymdV/O
         FtSq1CkNeMLrfnHJVEjG0qFYz4FEflsYDK/weQCUJipjPsq+SefU795pk9aozmIr6j7S
         mMuw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n36-v6si796358qvd.235.2018.08.03.10.29.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Aug 2018 10:29:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52372 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fldtj-0003EZ-S9
	for alex.bennee@linaro.org; Fri, 03 Aug 2018 13:29:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1fldtX-00038h-Ul
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 13:29:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1fldtU-0005mp-Ph
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 13:29:43 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44648 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1fldtU-0005mL-Ks; Fri, 03 Aug 2018 13:29:40 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EE695401B3A8;
	Fri,  3 Aug 2018 17:29:39 +0000 (UTC)
Received: from work-vm (ovpn-117-171.ams2.redhat.com [10.36.117.171])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01A0C21565E1;
	Fri,  3 Aug 2018 17:29:38 +0000 (UTC)
Date: Fri, 3 Aug 2018 18:29:36 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180803172936.GF2802@work-vm>
References: <20180803163646.31068-1-peter.maydell@linaro.org>
	<20180803163646.31068-2-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180803163646.31068-2-peter.maydell@linaro.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 03 Aug 2018 17:29:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 03 Aug 2018 17:29:40 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'dgilbert@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH 1/3] hw/intc/arm_gicv3_common: Give
 no-migration-shift-bug subsection a needed function
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VmB0Um8PImnw

* Peter Maydell (peter.maydell@linaro.org) wrote:
> Currently the migration code incorrectly treats a subsection with
> no .needed function pointer as if it was the subsection list
> terminator -- it is ignored and so is everything after it.
> Work around this by giving vmstate_gicv3_gicd_no_migration_shift_bug
> a 'needed' function that always returns true.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
> This should go into 3.0 to avoid awkward migration compat problems:
> the no-migration-shift-bug subsection is new in 3.0.
> ---
>  hw/intc/arm_gicv3_common.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index ff326b374ad..e58bc8b8105 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -203,10 +203,16 @@ static int gicv3_gicd_no_migration_shift_bug_post_load(void *opaque,
>      return 0;
>  }
>  
> +static bool needed_always(void *opaque)
> +{
> +    return true;
> +}
> +
>  const VMStateDescription vmstate_gicv3_gicd_no_migration_shift_bug = {
>      .name = "arm_gicv3/gicd_no_migration_shift_bug",
>      .version_id = 1,
>      .minimum_version_id = 1,
> +    .needed = needed_always,
>      .pre_load = gicv3_gicd_no_migration_shift_bug_pre_load,
>      .post_load = gicv3_gicd_no_migration_shift_bug_post_load,
>      .fields = (VMStateField[]) {
> -- 
> 2.17.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
