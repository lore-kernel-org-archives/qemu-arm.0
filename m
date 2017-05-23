Received: by 10.25.0.6 with SMTP id 6csp1873004lfa;
        Tue, 23 May 2017 07:52:41 -0700 (PDT)
X-Received: by 10.55.217.70 with SMTP id u67mr25167814qki.17.1495551161743;
        Tue, 23 May 2017 07:52:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495551161; cv=none;
        d=google.com; s=arc-20160816;
        b=QnNCXxhQWAGpXfZh87SoSgrW1Nn0c4q1ctCf5q6fSuj0vzsmgGOvObu/8Lx7LJ5AcU
         EjJpEZrrx7iq+ogDCnOF9eHmcG/YJ4oZS2e/omVtYJvahHIPQe+cZ0xECF78QvqOSybp
         wxFYMUgJXxYqPWLko/gQ2zdS6Bsj/aD7/c89zJMSfj5BMXCA5lcJW9CKHFMoXVha3Jlb
         GqoxLNkYuGzlI9481sA3WvKQmLdPDsRGRZ6itVPPDSrfCKa9zSmZBPKjGskr2Ppz6vZ1
         nJo1t9y2w4EGdVnjUbCOKeaOT53LpGumO9trbG6JbeuggOffiO9uFhh8Sv/Omyg0ue8i
         0Udg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=66ZQN4WSsjcsadBWBDP5nZ/YRztS5rzQQhSzeEHwzaY=;
        b=BZsFLKV0UmGNybvDwd6+k4iBMtklpZj8XmsCFKa53vwILV2XNfFJQcockP8CtApTAB
         2ZIW/r2TTQe7mXXPHxHyYcoqLeHB9v/8Kk3nRpv0CHKwt6pneheRRoYCNr2WH0SmA3yl
         Sv8oE0TgTZzqhoeOBaVCJr4Fz+9v+7CD+r6t1UH0nbhDmQrIliA76polK+WzVcp4ggdW
         GbDSvBbTn23v2wAlb/Anzasz+Mrdp3Rkop90UTZFO1XyddZDi5i/JG8EJqVzD0YMLHtU
         R5MQWTmewG+ptfUcWc2PpPieBbuqTwdhJXYZMUC/wkyE1n8ZME3UUXApAK+6T4kUQb1Y
         qNHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o189si21961949qkc.148.2017.05.23.07.52.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 May 2017 07:52:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49514 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dDBAv-0003Jr-65
	for alex.bennee@linaro.org; Tue, 23 May 2017 10:52:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52292)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dDB7O-0008Tm-Kw
	for qemu-devel@nongnu.org; Tue, 23 May 2017 10:49:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dDB7N-0008Ee-C2
	for qemu-devel@nongnu.org; Tue, 23 May 2017 10:49:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54136)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dDB7I-0008Bd-OH; Tue, 23 May 2017 10:48:56 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A8245C04B935;
	Tue, 23 May 2017 14:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A8245C04B935
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com A8245C04B935
Received: from localhost (ovpn-116-5.gru2.redhat.com [10.97.116.5])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3F3C47DE20;
	Tue, 23 May 2017 14:48:55 +0000 (UTC)
Date: Tue, 23 May 2017 11:48:54 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170523144854.GF32274@thinpad.lan.raisama.net>
References: <1495550330-34087-1-git-send-email-imammedo@redhat.com>
	<1495550330-34087-5-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1495550330-34087-5-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 23 May 2017 14:48:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 4/5] numa: fallback to default NUMA node
 instead of node 0
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mEEXDlKjo2n1

On Tue, May 23, 2017 at 04:38:49PM +0200, Igor Mammedov wrote:
> Do the same as we did in commit
>   (57924bcd8 numa: introduce machine callback for VCPU to node mapping)
> but only for incomplete mapping usecase, falling back to board
> provided default cpu to node mapping if user hasn't provided
> mapping for CPU explicitly.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

This breaks migration compatibility, doesn't it? I understand
this use case is not supported, but if are going to break stuff
for people using incomplete mappings (by rejecting the
configuration on a future release), I would prefer to break it
only once.

> ---
>  hw/core/machine.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 964b75d..b8df15f 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -730,9 +730,6 @@ static void machine_numa_finish_init(MachineState *machine)
>                  g_string_append_printf(s, "%sCPU %d [%s]",
>                                         s->len ? ", " : "", i, cpu_str);
>                  g_free(cpu_str);
> -
> -                /* non mapped cpus used to fallback to node 0 */
> -                props.node_id = 0;
>              }
>  
>              props.has_node_id = true;
> -- 
> 2.7.4
> 

-- 
Eduardo
