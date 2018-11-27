Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1323311wrt;
        Tue, 27 Nov 2018 06:12:55 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XkPCf/rW/k8qvyQ3sefd/qyO2e1j6VrgJF6LKp3PER192xnuB3ry1wrlDGPtwF5cJAbd0q
X-Received: by 2002:a81:5153:: with SMTP id f80mr28806638ywb.90.1543327975127;
        Tue, 27 Nov 2018 06:12:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543327975; cv=none;
        d=google.com; s=arc-20160816;
        b=wKQUdllSAnznCz4PI0F+US8xKsA2aaoLtivYGTSVwZE71ydh9JzbyK5VtLmKaLgFk5
         GyvRlGkfcJSMPmyyQ8bh422crs2gXKTJkKWgavjkkwdq3919S00Rm1JUZ5G6En7cBwKy
         eAcVodgBn2mO1lA3gubN2lspAqKPiJMBxvNMQlMJbLiqP3Ec9uywtDElhAZgUnkSgTC7
         qD6bB1gBFBxIkoUXTu9XW+4soj4JGirm6ZqvwX1dSLra4d6R5lc0x+pZtRTPCYKjoLMh
         FGY0Y/Z3Ufc7YL0CJBkmP4SjxLndQyr6M3BFN09WRAO2RF7mBcRUauVJyzVrK3ye4HE/
         YrhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=K9iyqG+dkrCdpxj9ROkA8ZcB5ooB077Em0B2oUzfUYE=;
        b=OAe4RK7s+4xpHvWUaeer1mpuVl2lMPrm75iENzXZOgtiaSBdmZnQI/60nBoJHGFvnY
         2oDaooIPijPF6UTBgFQp6DW0qOTeeD+UBRVNbo0ZefN2rP8wxP+cPPe6a253DEMfjKvc
         RDtkyxREvhMTO8EgO1BbADsihGYrtxUlFEbynjFu+BiVUfLshlOLLgBYVjwuG5YbwY3Z
         FR9OEPrxnrUPBGk4/jClvuL+1kjfT3zeHmwgQ75pD/IWllxKzr/tXHQkJbbPmJoTxiOu
         eTT/4yOnKRjwgryI4C1F78mkbtXQ8cHhlskYxYKreqfMfPSYaGJfpVai51EofKSC+mW2
         cj3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n204-v6si2846701ybg.13.2018.11.27.06.12.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 06:12:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42650 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRe6g-0003oP-Hc
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 09:12:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gRe2M-0000bN-KX
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 09:08:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gRe2I-0008Gz-T3
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 09:08:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47344)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gRe2G-0007Ky-Pq; Tue, 27 Nov 2018 09:08:22 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2A6A0D780E;
	Tue, 27 Nov 2018 14:08:15 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1A63260C4C;
	Tue, 27 Nov 2018 14:08:09 +0000 (UTC)
Date: Tue, 27 Nov 2018 15:08:08 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181127150808.1c719882@redhat.com>
In-Reply-To: <20181121235721.GE4450@caravaggio>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-21-sameo@linux.intel.com>
	<20181116170226.35385388@redhat.com>
	<20181121235721.GE4450@caravaggio>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 27 Nov 2018 14:08:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 20/24] hw: acpi: Define ACPI
 tables builder interface
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>, "Michael
	S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AStPNweTNF3k

On Thu, 22 Nov 2018 00:57:21 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> On Fri, Nov 16, 2018 at 05:02:26PM +0100, Igor Mammedov wrote:
> > On Mon,  5 Nov 2018 02:40:43 +0100
> > Samuel Ortiz <sameo@linux.intel.com> wrote:
> >   
> > > In order to decouple ACPI APIs from specific machine types, we are
> > > creating an ACPI builder interface that each ACPI platform can choose to
> > > implement.
> > > This way, a new machine type can re-use the high level ACPI APIs and
> > > define some custom table build methods, without having to duplicate most
> > > of the existing implementation only to add small variations to it.  
> > I'm not sure about motivation behind so high APIs,
> > what obvious here is an extra level of indirection for not clear gain.
> > 
> > Yep using table callbacks, one can attempt to generalize
> > acpi_setup() and help boards to decide which tables do not build
> > (MCFG comes to the mind). But I'm not convinced that acpi_setup()
> > could be cleanly generalized as a whole (probably some parts but
> > not everything)  
> It's more about generalizing acpi_build(), and then having one
> acpi_setup for non hardware-reduced ACPI and a acpi_reduced_setup() for
> hardware-reduced.
> 
> Right now there's no generalization at all but with this patch we could
> already use the same acpi_reduced_setup() implementation for both arm
> and i386/virt.
> 
> > so it's minor benefit for extra headache of
> > figuring out what callback will be actually called when reading code.  
> This is the same complexity that already exists for essentially all
> current interfaces.
in case of callback vs plain function call, I'd choose the later
if it does the job and resort to the former when I have to.
 
> > However if board needs a slightly different table, it will have to
> > duplicate an exiting one and then modify to suit its needs.
> > 
> > to me it pretty much looks the same as calling build_foo()
> > we use now but with an extra indirection level and then
> > duplicating the later for usage in another board in slightly
> > different manner.  
> I believe what you're trying to say is that this abstraction may be
> useful but you're arguing the granularity is not properly defined? Am I
> getting this right?
yep, something along those lines. So far it's not useful much if at all.
So I'll not introduce it for now and try to get by with plain functions
calls. Later we might add fine-grained callbacks on case by case basis
(like 'adevc->madt_cpu') where it's possible to generalize.
 
> Cheers,
> Samuel.

