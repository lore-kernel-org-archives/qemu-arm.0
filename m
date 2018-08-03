Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp298008wru;
        Fri, 3 Aug 2018 10:08:25 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdFCE2MVAVsoTEjAViadntHNh6qjcw7SSNvBK0AxzK2UW/Y1U7Pjbbo7nc1YmcPxAkSXh4O
X-Received: by 2002:a37:d401:: with SMTP id l1-v6mr4371958qki.221.1533316105220;
        Fri, 03 Aug 2018 10:08:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533316105; cv=none;
        d=google.com; s=arc-20160816;
        b=b+9Cmk/CjLfrufljTraGG8TNxK1g7bNioGjUnb8Hoz0Y6T019jliZ4ztPKinr2X2Jc
         N7tgjBVsPM9OICg/plBAJVq4BKnrhfBPHn4S0i7aLzzNc7pQWIWAzZL8teQd22hQTyOD
         Ktzl4vWcwQEu3lOtUErZKN2/42ZP7ARYjt3BqH7DAj0W2faH2si9BvaRZOdbRUs7Up7z
         XtFizO9ZtjxNaw79rKGBeUxelCVVaVqksnBqhMQRlEK6yyHHO1Y38HUiDqDAvPoGOZfi
         fhQQ/ZpVwHY6V82Lw2auLPYX/YuRLn7Pt/1bFEInNTmayaMHQMmR1qT6y8iT6IR5pFU0
         caaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=7pwPhPouBFvrMk24K2J8KBS7ia+d7z2iOL0//lS90rw=;
        b=O1ftDrdggEZYwK4g8voObM3ihXzZJSkD27I61h+h/1oj8hv4gnF4ZiaZ/gwZ5EZDCx
         Jd7ZqLnx6+JTSK8fk/cb3Gk8l0xzkSkxjsqtbpusZeo99IXLTOb6cqXAjsxgxjUGMot2
         ontXpTILyi7asdPhwC0kgpLvQtvA4nc8eVdWVzAfwJ5JhiJ8R5rZMC08oAL7A2gT3EJl
         12b5NbDeILGIGO881hpgu27iitJsFGJ/Zzr2rU7LX4Ua0jwkXs5tKLqcArNnKyJGlPj6
         DGnmwV3FGEw54+wTlT1iie1oDZ0SxsdK7p0ch5yERE0o26Z4VGoskXE3ss7kV0m4DV4B
         1Z4g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s58-v6si577572qtc.107.2018.08.03.10.08.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Aug 2018 10:08:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52329 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fldYu-0005GK-N2
	for alex.bennee@linaro.org; Fri, 03 Aug 2018 13:08:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1fldYi-0005G3-Hk
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 13:08:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1fldYe-0006ZW-Il
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 13:08:12 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40880 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1fldYe-0006Z4-DE; Fri, 03 Aug 2018 13:08:08 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C7FFD7A7EF;
	Fri,  3 Aug 2018 17:08:07 +0000 (UTC)
Received: from work-vm (ovpn-117-171.ams2.redhat.com [10.36.117.171])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF7C01D08A;
	Fri,  3 Aug 2018 17:08:06 +0000 (UTC)
Date: Fri, 3 Aug 2018 18:08:04 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180803170804.GE2802@work-vm>
References: <20180803163646.31068-1-peter.maydell@linaro.org>
	<20180803163646.31068-3-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180803163646.31068-3-peter.maydell@linaro.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Fri, 03 Aug 2018 17:08:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Fri, 03 Aug 2018 17:08:07 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'dgilbert@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH 2/3] hw/intc/arm_gicv3_common: Combine
 duplicate .subsections in vmstate_gicv3_cpu
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
X-TUID: n0uZg+/KDgc2

* Peter Maydell (peter.maydell@linaro.org) wrote:
> Commit 6692aac411199064 accidentally introduced a second initialization
> of the .subsections field of vmstate_gicv3_cpu, instead of adding
> the new subsection to the existing list. The effect of this was
> probably that migration of GICv3 with virtualization enabled was
> broken (or alternatively that migration of ICC_SRE_EL1 was broken,
> depending on which of the two initializers the compiler used).
> Combine the two into a single list.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
> Not strictly a 2.12 regression.
> ---
>  hw/intc/arm_gicv3_common.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index e58bc8b8105..e1a8999cf5b 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -134,9 +134,6 @@ static const VMStateDescription vmstate_gicv3_cpu = {
>      },
>      .subsections = (const VMStateDescription * []) {
>          &vmstate_gicv3_cpu_virt,
> -        NULL
> -    },
> -    .subsections = (const VMStateDescription * []) {
>          &vmstate_gicv3_cpu_sre_el1,
>          NULL
>      }
> -- 
> 2.17.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
