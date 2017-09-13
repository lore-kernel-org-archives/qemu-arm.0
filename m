Received: by 10.223.172.38 with SMTP id v35csp1040242wrc;
        Wed, 13 Sep 2017 06:20:08 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDMLQOYtpSfPWSi01xQPnnhBDinE58KYg5surQ1543dymZVVYCEbx4on61lAH1zUxHDipxR
X-Received: by 10.200.22.188 with SMTP id r57mr13185136qtj.230.1505308808466;
        Wed, 13 Sep 2017 06:20:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505308808; cv=none;
        d=google.com; s=arc-20160816;
        b=z0vxKobrpK00KhWzIGFWRhZl3/+P7qp5cIZSAYBp0nQ0D2Zq3jCTbpWeRodgtWNDik
         KKGnRCalrCn+hO/yxr7lG/OayFP9SPh7O2Fo4hQXy41T0YOYX2oj/3lfmG4h6D0NJjLp
         cLonZYiWDNP8ye//MEduWdeF8+EvKzskXRmOep97TkxbYmpi32rU4R1i7ltWWb3qefO8
         /wgBiZhUsR92e6Q6JUsaBOu68jyxlmPbHD0AfIRDWQqLLZSHl5iRMzV0I1UppOQg12W+
         I/K9zIPC2rS9cccV0iKgm8ofVxR12Irr9xN9lqdGieavaIuZ4NRnjfpcheTXGdE/0hn4
         plkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=ZWVO4UPr1L95ARLmRYHBfPBknW9FxwKLXMhKwvp3Xeg=;
        b=U2Ney2b6vAKrprCP8yJnHwUMMH8c4J9x/im/iX1zvBFcRBSSD4oZaWr2+9j0JunBoC
         4asC/E0s+UtYSkSxzmqClFAeBZO4QtKVIAhYHmmv8sQ9kf0jKQxCSP4TWJSaaynl5vM1
         FJgZv+K+B+4fHKgvyyteN+zsp6eMKe7Yx+1kiz3gQ00k5EzRnaNTXgDSkgFnJ24jPNjb
         +Fmm19qqpXTTj8TPDO6IBQCNPyQc9jjHG0rZHRTnWjbwOrM8JWaZKe79PKfoukKOBJXF
         HZtCRhQU6vuxDCRVR3HMcGJE/slwzuIAuHEzZlcKLrD19ww2rbEjM/q6KHuWnY1M4psj
         OFIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y92si12239100qtd.550.2017.09.13.06.20.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 06:20:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42491 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ds7aI-00018R-9f
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 09:20:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37212)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1ds7aA-000169-0M
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 09:19:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1ds7a7-00078k-76
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 09:19:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59408)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1ds7a6-000784-VL; Wed, 13 Sep 2017 09:19:55 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B1C4E356F3;
	Wed, 13 Sep 2017 13:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B1C4E356F3
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=dgilbert@redhat.com
Received: from work-vm (ovpn-117-158.ams2.redhat.com [10.36.117.158])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 800265D966;
	Wed, 13 Sep 2017 13:19:50 +0000 (UTC)
Date: Wed, 13 Sep 2017 14:19:48 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20170913131948.GD2096@work-vm>
References: <20170912140149.7692-1-lvivier@redhat.com>
	<20170912140149.7692-2-lvivier@redhat.com>
	<20170913053533.GF7550@umbus.fritz.box>
	<20170913124456.GB2096@work-vm>
	<770fc286-a566-920a-9aba-16c3b5264806@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <770fc286-a566-920a-9aba-16c3b5264806@redhat.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 13 Sep 2017 13:19:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 1/3] hmp: fix "dump-quest-memory" segfault
 (ppc)
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zw2k4UcKTsdU

* Laurent Vivier (lvivier@redhat.com) wrote:
> On 13/09/2017 14:44, Dr. David Alan Gilbert wrote:
> > * David Gibson (david@gibson.dropbear.id.au) wrote:
> >> On Tue, Sep 12, 2017 at 04:01:47PM +0200, Laurent Vivier wrote:
> >>> Running QEMU with
> >>>     qemu-system-ppc64 -M none -nographic -m 256
> >>> and executing
> >>>     dump-guest-memory /dev/null 0 8192
> >>> results in segfault
> >>>
> >>> Fix by checking if we have CPU, and exit with
> >>> error if there is no CPU:
> >>>
> >>>     (qemu) dump-guest-memory /dev/null
> >>>     this feature or command is not currently supported
> >>>
> >>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> >>
> >> Applied to ppc-for-2.11.  I'm not really sure what to do with the rest
> >> of the series though.
> > 
> > I can take the whole set through HMP.
> 
> Could you update the comment in last patch as asked by Cornelia?
> (PATCH v3 3/3] tests/hmp: test "none" machine with memory)

Sure, do we understand what the error that patchew caught was?

Dave

> Thanks,
> Laurent
> 
> > 
> > Dave
> > 
> >>> ---
> >>>  target/ppc/arch_dump.c | 11 +++++++++--
> >>>  1 file changed, 9 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
> >>> index 8e9397aa58..95b9ab6f29 100644
> >>> --- a/target/ppc/arch_dump.c
> >>> +++ b/target/ppc/arch_dump.c
> >>> @@ -224,8 +224,15 @@ typedef struct NoteFuncDescStruct NoteFuncDesc;
> >>>  int cpu_get_dump_info(ArchDumpInfo *info,
> >>>                        const struct GuestPhysBlockList *guest_phys_blocks)
> >>>  {
> >>> -    PowerPCCPU *cpu = POWERPC_CPU(first_cpu);
> >>> -    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
> >>> +    PowerPCCPU *cpu;
> >>> +    PowerPCCPUClass *pcc;
> >>> +
> >>> +    if (first_cpu == NULL) {
> >>> +        return -1;
> >>> +    }
> >>> +
> >>> +    cpu = POWERPC_CPU(first_cpu);
> >>> +    pcc = POWERPC_CPU_GET_CLASS(cpu);
> >>>  
> >>>      info->d_machine = PPC_ELF_MACHINE;
> >>>      info->d_class = ELFCLASS;
> >>
> >> -- 
> >> David Gibson			| I'll have my music baroque, and my code
> >> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
> >> 				| _way_ _around_!
> >> http://www.ozlabs.org/~dgibson
> > 
> > 
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
