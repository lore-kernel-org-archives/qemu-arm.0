Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8377627wrt;
        Tue, 4 Dec 2018 10:06:39 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Wj0TL8AxPwyXwLZTNJOPDii53/FtxB3X9464+HN58tPEx6FonCBzM3oban/VLivIUFBN/U
X-Received: by 2002:a0c:a90a:: with SMTP id y10mr20197314qva.232.1543946799510;
        Tue, 04 Dec 2018 10:06:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543946799; cv=none;
        d=google.com; s=arc-20160816;
        b=y1bUkUfEXBUGkVWq63hX9J1t2oxJCkUvKaJEceI17BhPDkVOofFdbS6uFYP63o0ido
         blyP+sxC89N9a+YlTCOSs73pQPDCJnCtpWh1hGlUUSjAjnbxTnl65GXedPpDk9TU1Yt3
         gMCq33QbV6nOgeCeooA2FrvIyfFi+p3KEJ08ja7Xv+QQZBixCCd4JPyrVDMbeVo5/6DX
         cGRRH3njjY3/QGgivFO19vENHsqlJY6w/SL0BrZ8DVtaMWnRBgMt1tdc/47zopTVtiXn
         Ln8I2KI9XC2tRNF6juVmTYWk1rd8Lv2Di7FIPLVmMBi/c0ThAD2xlGGetkILw8JtKSMH
         aY5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=0nJTPyM82RA7vv9uyPhXd8i4YRQW4/ZL210AjKnan1Q=;
        b=pX0H+b/PI8DsJT9lGecM8vkNEA1dY4N+CMkKHlmrr3RGbgoEStkVc6r5ddbueY36pT
         fIHHw8kJhXDoWGi5IhV7+5pW/JdXjmYGpiVGNzYB75X/D8av144PMTieklgJCO/Rohb1
         swE3WeRbdylH0Q3QVlnoxY7gVSszZzkq5Xp7Jfh5Agb7uwZcjMHCRMb6hhvZv4BeA020
         DExInXi09/9T8kSc3jsObMA4+6oX9CXCmccE0QhNe5Cc9Mksw+xQuMkrTLxo/TX10n+I
         i7r9ELoC5Veco/XytvBese78Uj1EYpSxuu2l02iBpBzl2WSDZNASBLzM/vQJnCAvwsLB
         11nw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x189si2421105qke.171.2018.12.04.10.06.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 10:06:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58369 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUF5j-0005pq-0f
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 13:06:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gUF5Y-0005pl-96
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 13:06:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gUF5Q-0004NF-Ss
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 13:06:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51062)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gUF5N-0004Lp-44; Tue, 04 Dec 2018 13:06:18 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 81EF6309BFEE;
	Tue,  4 Dec 2018 18:06:13 +0000 (UTC)
Received: from localhost (ovpn-116-33.gru2.redhat.com [10.97.116.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A6AD17EB61;
	Tue,  4 Dec 2018 18:06:09 +0000 (UTC)
Date: Tue, 4 Dec 2018 16:06:07 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Luc Michel <luc.michel@greensocs.com>
Message-ID: <20181204180607.GB18284@habkost.net>
References: <20181123091729.29921-1-luc.michel@greensocs.com>
	<20181123091729.29921-2-luc.michel@greensocs.com>
	<20181123181059.GN18284@habkost.net>
	<65d3a572-9a80-f332-1f88-69e43e8a3663@redhat.com>
	<20181126132731.GJ18284@habkost.net>
	<CAFEAcA8D7ZjO059Sgrx-4i0iT+V3gxT4f=DvdmUAJS7KomtyOg@mail.gmail.com>
	<b8e20686-e5d1-a844-48f7-a4ae471e3fd5@greensocs.com>
	<CAFEAcA8j4xTiS3_ktiA0hm2N4cu5RvxAtYqUHgvY-bUXgcwbjQ@mail.gmail.com>
	<50645862-a638-ad2a-bafe-1b46be42aec4@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50645862-a638-ad2a-bafe-1b46be42aec4@greensocs.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Tue, 04 Dec 2018 18:06:14 +0000 (UTC)
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /6hcwjcbYX4+

On Mon, Dec 03, 2018 at 03:09:14PM +0100, Luc Michel wrote:
> 
> 
> On 12/3/18 12:23 PM, Peter Maydell wrote:
> > On Mon, 3 Dec 2018 at 11:21, Luc Michel <luc.michel@greensocs.com> wrote:
> >>
> >> On 11/30/18 5:52 PM, Peter Maydell wrote:
> >>> Luc: what are the requirements on boards using CPU cluster
> >>> objects? I assume these are both OK:
> >>>  * does not use cluster objects at all
> >>>    (the gdbstub puts all the CPUs in one process?)
> >> Yes, when no clusters are found, a process with PID 1 is created and
> >> used for all CPUs.
> >>>  * all CPUs created are in some CPU cluster
> >>>    (the gdbstub uses one process per CPU cluster)
> >>> but what about
> >>>  * some CPUs are created in a CPU cluster, but some
> >>>    are "loose", not in any cluster at all> ?
> >>> Is that just invalid, or do the "loose" CPUs end up in
> >>> a default cluster (gdbstub process), or do they get
> >>> one cluster each?
> >> Currently this is valid and the "loose" CPUs end up in the first
> >> available process (which will be PID 1 if we are in your first case,
> >> i.e. no clusters in the machine).
> > 
> > So if there are some defined clusters 1 and 2, and some
> > loose CPUs, the clusters get PID 1 and PID 2, and the
> > loose CPUs end up in PID 3? That seems reasonable.
> No sorry I was not clear, the loose CPUs would end up on PID 1 in that case.
> 
> The current behaviour is as follows:
> During gdb stub initialization:
>   - A process is created per cluster.
>   - If no cluster are found, an unique process is created with PID 1
> 
> When trying to find a CPU PID:
>   - If it is attached to a cluster, return the associated process,
>   - If it is loose, return the first available process.

The behavior described by Peter would be more reasonable to me.
Otherwise what was just an accident (getting the CPU assigned to
the first process) will become expected behavior of the API, and
it will be hard to change it later.

In either case, I'm still missing a clear description of what a
cluster is supposed to represent, exactly (see my previous reply
on this thread).

-- 
Eduardo
