Received: by 10.80.166.35 with SMTP id d32csp284111edc;
        Fri, 14 Oct 2016 06:34:48 -0700 (PDT)
X-Received: by 10.55.97.198 with SMTP id v189mr11468195qkb.51.1476452088528;
        Fri, 14 Oct 2016 06:34:48 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n127si9690193qkc.273.2016.10.14.06.34.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Oct 2016 06:34:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47353 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bv2dM-0001wn-00
	for alex.bennee@linaro.org; Fri, 14 Oct 2016 09:34:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bv2bV-0000tF-G7
	for qemu-devel@nongnu.org; Fri, 14 Oct 2016 09:32:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bv2bU-0006PM-Fd
	for qemu-devel@nongnu.org; Fri, 14 Oct 2016 09:32:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35460)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bv2bO-0006MB-Nu; Fri, 14 Oct 2016 09:32:46 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 18F3181138;
	Fri, 14 Oct 2016 13:32:45 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-76.brq.redhat.com [10.40.204.76])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9EDWeKq021669
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 14 Oct 2016 09:32:42 -0400
Date: Fri, 14 Oct 2016 15:32:40 +0200
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20161014133239.p7czyawvp45b33li@hawk.localdomain>
References: <1476435295-21885-1-git-send-email-eric.auger@redhat.com>
	<1476435295-21885-2-git-send-email-eric.auger@redhat.com>
	<20161014144218.10d072b5@nial.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161014144218.10d072b5@nial.brq.redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 14 Oct 2016 13:32:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 1/2] ACPI: Add IORT Structure definition
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
Cc: peter.maydell@linaro.org, tn@semihalf.com, qemu-devel@nongnu.org,
	Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
	shannon.zhao@linaro.org, prem.mallappa@broadcom.com,
	christoffer.dall@linaro.org, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PXCfUypnPljz

On Fri, Oct 14, 2016 at 02:42:18PM +0200, Igor Mammedov wrote:
> On Fri, 14 Oct 2016 10:54:54 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
> 
> > From: Prem Mallappa <prem.mallappa@broadcom.com>
> > 
> > ACPI Spec 6.0 introduces IO Remapping Table Structure. This patch
> > introduces the definitions required to describe the IO relationship
> > between the PCIe root complex and the ITS.
> > 
> > This conforms to:
> > "IO Remapping Table System Software on ARM Platforms",
> > Document number: ARM DEN 0049B, October 2015.
> > 
> > Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> Preferred way to build/pack ACPI tables info is to use
> build_append_foo() functions.

We've raised this before with Shannon, but it was already too late
for most tables. Now all tables in hw/arm/virt-acpi-build.c are
done in the style of this series, and I'd prefer we keep the style
consistent. If I ever get some free time to experiment then I might
try rewriting all of them in the build_append_ style to see how it
looks though.

Thanks,
drew
