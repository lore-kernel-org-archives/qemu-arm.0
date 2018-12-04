Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8437893wrt;
        Tue, 4 Dec 2018 11:06:07 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XrFXR3/Bi5XBvoT7mUN92DlDV/zBGngUDbbvorZfPriYW6EBKEOMmo+NTrA4wTTzI1wQD+
X-Received: by 2002:a0c:8b64:: with SMTP id d36mr20544738qvc.233.1543950367881;
        Tue, 04 Dec 2018 11:06:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543950367; cv=none;
        d=google.com; s=arc-20160816;
        b=viZZfzm4jNKX+vWI3yiVVO9NUOlG4ZWCZyPPcQP/XRprHq0mDeP1r7amRrxEZd4hHh
         OPh57IDgsBwN8RbNOh+hY4ZyPn101TVyT1MRxok4o8728NFBUWK5T7eL6O12ocjFLyKS
         HJCy2suZ0Aj8CafrFagFE2W+J+u+56fNZNZbB15aV8nFIpwbh4NPLyoE5BcHQcXO1ovF
         /7z+YkPsNbwbZFkKq/NQiyg67ygctgLGksaAxMAVOcZmXXljfB2pvzhdrn32IfQGahB9
         ZwvxPwyZ4aIK6CfgVtcpmaHijjMu7liytVRohM7pYgkviao62qSt5qtylVhc5Jh1yTC8
         8QMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=9A5EUF5/KFkhsFyDMqbZtTrdfO2ejiGUvPNVAye0hzg=;
        b=ZLBEvlIZCdWm2vcaMd2uNcBm6fz2x97HYLTK88VjJeenhC82fDldzSSxdM5aJDCS8t
         274dS51ApaAXfaIH3vdjrjCYV8k+gdwsKKKTa/O8hKC1yMgMiOkBnFJGZvyC4vcDsGzj
         2YiqRqXrk4OzZS4tbH5tDPXtSHyn2ybpWyMqehd5Czvp44m4Szw0mRPnDA+GmW4WQWfZ
         cPoPLiyegQpBsu+JEaZIBWArgUKtkH+yLaxKb7wzDMCgGvi6SB3ZPa9w0rFMRaYevyuC
         pFaU5FmlmXJEs2v4avaE/3H2cpGLMEA45iobLXg9PfTfBUatHdxhi0AJcTizg1swuV/B
         Ro7A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r32si923360qvj.117.2018.12.04.11.06.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 11:06:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58592 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUG1H-0000cw-EG
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 14:06:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gUG16-0000aI-8I
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 14:05:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gUG15-0001Sf-Fj
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 14:05:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45254)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gUG15-0001Rz-9d; Tue, 04 Dec 2018 14:05:55 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 26C4C87637;
	Tue,  4 Dec 2018 19:05:54 +0000 (UTC)
Received: from localhost (ovpn-116-33.gru2.redhat.com [10.97.116.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 68E9217AB7;
	Tue,  4 Dec 2018 19:05:50 +0000 (UTC)
Date: Tue, 4 Dec 2018 17:05:48 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181204190548.GH18284@habkost.net>
References: <20181123091729.29921-2-luc.michel@greensocs.com>
	<20181123181059.GN18284@habkost.net>
	<65d3a572-9a80-f332-1f88-69e43e8a3663@redhat.com>
	<20181126132731.GJ18284@habkost.net>
	<CAFEAcA8D7ZjO059Sgrx-4i0iT+V3gxT4f=DvdmUAJS7KomtyOg@mail.gmail.com>
	<b8e20686-e5d1-a844-48f7-a4ae471e3fd5@greensocs.com>
	<CAFEAcA8j4xTiS3_ktiA0hm2N4cu5RvxAtYqUHgvY-bUXgcwbjQ@mail.gmail.com>
	<50645862-a638-ad2a-bafe-1b46be42aec4@greensocs.com>
	<20181204180607.GB18284@habkost.net>
	<CAFEAcA9JXeRGfKzouYJQKxgXuw_Z-up0a1ijZX9hZvXbdkwiuA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9JXeRGfKzouYJQKxgXuw_Z-up0a1ijZX9hZvXbdkwiuA@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 04 Dec 2018 19:05:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 01/16] hw/cpu: introduce CPU
 clusters
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
Cc: Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7i2vDOZrTwnE

On Tue, Dec 04, 2018 at 06:24:19PM +0000, Peter Maydell wrote:
> On Tue, 4 Dec 2018 at 18:06, Eduardo Habkost <ehabkost@redhat.com> wrote:
> > In either case, I'm still missing a clear description of what a
> > cluster is supposed to represent, exactly (see my previous reply
> > on this thread).
> 
> Here's my attempt:
> 
> A cluster is a group of CPUs which are all identical and have
> the same view of the rest of the system.
> If CPUs are not identical (for example, Cortex-A53 and
> Cortex-A57 CPUs in an Arm big.LITTLE system) they should be
> in different clusters.
> If the CPUs do not have the same view of memory (for example
> the main CPU and a management controller processor) they should
> be in different clusters.
> 
> I agree that this is slightly confusing, because the concept
> is on the boundary between something that's real in hardware
> (eg in a big.LITTLE setup the CPUs are in separate hardware
> clusters, and of coures a BMC processor and the main CPU
> are definitely different things) and something that we're
> defining for its effects on the GDB UI and so we can make
> sure we don't share TCG translated code where we shouldn't.
> 

Thanks!

With that definition in mind, why can't QEMU cluster CPUs
automatically by looking at CPU models and address space objects?

-- 
Eduardo
