Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3755472wrt;
        Fri, 30 Nov 2018 08:15:42 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Vsga+MGm9HY4wkg1R2Lf69zhjjdK8uiMctif2UFYTX7JOljgH6Q9Ngqs9rc/tqzqfWOzUW
X-Received: by 2002:a81:ad27:: with SMTP id l39mr6277958ywh.301.1543594542265;
        Fri, 30 Nov 2018 08:15:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543594542; cv=none;
        d=google.com; s=arc-20160816;
        b=QXbQcyeg6t0FJKGQbjyIMMYq094ipH1t+GnuEg7X+L8x0imHI0M3NjubU9VWC0OVd8
         Cy8fv66RNuhdfYIhB2JZzTNMKG18gfsFm2iN0muLxdBs1+QMYyZlJS3074wISSVZKbN/
         brdm8Eq6ljPZfRaEoo+LmdhMXFBERZDAYncwhVrhUubeTx9+gb9jitrTKyINMLG6drSX
         HWkgnS13E4QCONPXYxrwgBS1Wx7WlnbrQYNDZm+NS/K6KEdTuklMKPSX+G+j3rvEhNMb
         P4q5fjdHh4MACVK40+QBOHKcn6Pk5eFbF/atubjzU8BI0Ky8LgYcl8a2Z6XnMJkdz+m1
         CV1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=+WDu3HiXUbVbmBz6aXP2ATL26lG4LWS8obTy8FdscUQ=;
        b=dr0BLK9M9z4bKNhddVPShPIc5C/YOnQcaqEZliwPn7K/haO7ajaeuGByhI1mEE/9qH
         ituyhTmOm8dwAzZ922Nt/+UKFqfH9ndDWFadSUd9Omh6y9d5MOTpP2kIUlZDBs5CI2b0
         HuyAOLtEL0FaQzCae/V87H7UBqyHZMv4KGjg49HoNqzJLE/3PjL/HvxFv187dacGYS3K
         zLmhETCF44SssYlT1Bt87sU7PfR56FP2NcksRYaCKnBrzmdrMq0tr3I1pR7suNYEsmII
         /+DEHJjTm7YgeqFbhXUlGZ6bZfRHSaMkSi1FN61Nnd+TrcEs7im6g/T92OaTyEBdy5kW
         2ZCA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 188-v6si3180800ybi.16.2018.11.30.08.15.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 08:15:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33615 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSlS9-0004ey-ML
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 11:15:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45513)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gSlRd-0004LL-Gr
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 11:15:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gSlRO-0007xZ-Rw
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 11:15:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43170)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1gSlRN-0007wX-Kd; Fri, 30 Nov 2018 11:14:53 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DDE1C3164682;
	Fri, 30 Nov 2018 16:14:52 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A955B67644;
	Fri, 30 Nov 2018 16:14:51 +0000 (UTC)
Date: Fri, 30 Nov 2018 17:14:49 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181130161449.dg2yxiac5lnk7mbb@kamzik.brq.redhat.com>
References: <1543407172-16175-1-git-send-email-peng.hao2@zte.com.cn>
	<1543407172-16175-8-git-send-email-peng.hao2@zte.com.cn>
	<CAFEAcA83C_Eic3K4yY5bGeEKJpY2uf26diFtDJ5r+W71jcX2DQ@mail.gmail.com>
	<CAFEAcA8nfp0ueLMJHhgRyf+mqG1QbakjKJiqSnLF-MFkjkDhZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8nfp0ueLMJHhgRyf+mqG1QbakjKJiqSnLF-MFkjkDhZA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Fri, 30 Nov 2018 16:14:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V10 7/9] hw/misc/pvpanic:
 preparing for adding configure interface
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
Cc: Peng Hao <peng.hao2@zte.com.cn>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uH7MQphv/kS6

On Fri, Nov 30, 2018 at 03:57:13PM +0000, Peter Maydell wrote:
> On Fri, 30 Nov 2018 at 15:56, Peter Maydell <peter.maydell@linaro.org> wrote:
> > I suspect the reason you've done this is that you're
> > trying to get "-device pvpanic" to work on the command
> > line. I recommend not trying to get that to work.
> > MMIO devices are not pluggable devices, and -device
> > is not expected to work with them.
> 
> If you do want a pluggable pvpanic device for the virt
> board then you should implement it as a PCI device,
> incidentally.
>

We'd have to allocate it a PCI device ID, but I guess that's OK as
there are plenty of IDs left for 1b36. I'm not sure it's worth it
though. Phil asked that this device by user creatable, but maybe
that's not necessary. Maybe we just need a mach-virt compat boolean
and then to always provide this device for 4.0 and later machines?

Thanks,
drew
