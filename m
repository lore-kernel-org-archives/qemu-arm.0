Received: by 10.223.172.38 with SMTP id v35csp3718530wrc;
        Tue, 26 Sep 2017 08:37:30 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAzyoV/M+uIA9if6pQaD5KO/+ZOZuLP/MT2zGvHgLLnEVuuA9wCbkBTukhZzi9nd3AwXqcX
X-Received: by 10.237.37.103 with SMTP id w36mr16656431qtc.325.1506440249978;
        Tue, 26 Sep 2017 08:37:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506440249; cv=none;
        d=google.com; s=arc-20160816;
        b=eGe69uepJPIDhbeeos1c0Zv7s4FPsJmDyXbHbVNcXU5P/zbtB/GlnXogWz17Qa3Lnp
         a9/arqwkCoZlzCPUxkubHEavwWr58o+z++2jDAkeTkOjh1eSyoItYpPAjNdd/IB9EZE9
         Tl00aUvubnqV5MnOI312UmS7WygIBpIt1Fn7lMT7rQ8PFKUgZwx/0spGaomhFIru3wSP
         sFmdGrEYYqap16PC1yQp9I+UhgSUMi94RwY6ajGPnm4csprn5dUIiDOXXs30ygBJpbBS
         /2Fm8r7klvLb9ZOOfqBXS0P9WzOiIGP07SCo0I637mo9fQ7Uilox4k7jAhxHBOJT8Agn
         I6aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=AbFuL3t/3yuJRv+hS91Y1YfkTczI5f7TlLPrglOg0P4=;
        b=ZiN87IYvUuelxgbgq6NI4H78sDpRbJ8K+WniJn0LJCWKdeXmYcrvBHF1TwOwBqal/K
         7RmW5sETr4Q0v+yXHvN71OgFS8VjY7HmOGL9IgZamCckQ2vCQN1Bj8HH0jijVHMtCt1S
         74FldLudmAea9nH80UfMn6VPEUcOwLHmV7AuGBTJiYlDHok5qofvEBdtpEzOJ1YUXgO5
         GDcWmsduq1kJts+bd0X0s2Gls/XUJ23UmsFnBrEAsgHZo8D63wUX2TUPVvjXvJW+qc/Q
         MTNR13WfTX0ebLKx5mmW1ClNpMMMnNeGYYLbj/jWY590/9MrRsshV5/Z5aWerwpViO+I
         atjg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id z35si2474301qtc.288.2017.09.26.08.37.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Sep 2017 08:37:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48130 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dwrvL-0002VU-R2
	for alex.bennee@linaro.org; Tue, 26 Sep 2017 11:37:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56304)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dwrv9-0002UR-CY
	for qemu-arm@nongnu.org; Tue, 26 Sep 2017 11:37:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dwrv6-0006Rf-6O
	for qemu-arm@nongnu.org; Tue, 26 Sep 2017 11:37:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55066)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1dwrv6-0006RD-0S; Tue, 26 Sep 2017 11:37:12 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C038080465;
	Tue, 26 Sep 2017 15:37:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C038080465
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=drjones@redhat.com
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E93E69AD1;
	Tue, 26 Sep 2017 15:37:08 +0000 (UTC)
Date: Tue, 26 Sep 2017 17:37:05 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170926153705.365mvhaf6rj65rvl@kamzik.brq.redhat.com>
References: <1506088275-31734-1-git-send-email-wei@redhat.com>
	<20170926105422.vfaalzzmhufvrk34@kamzik.brq.redhat.com>
	<CAFEAcA_Wk5U89QAUHx0tsJR57LLASgnKwtMQk9-PY7sBZAm+hg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_Wk5U89QAUHx0tsJR57LLASgnKwtMQk9-PY7sBZAm+hg@mail.gmail.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 26 Sep 2017 15:37:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/1] mach-virt: Set VM's SMBIOS
 system version to mc->name
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
Cc: eric.auger@redhat.com, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C+a1YwUbv8P0

On Tue, Sep 26, 2017 at 04:28:03PM +0100, Peter Maydell wrote:
> On 26 September 2017 at 11:54, Andrew Jones <drjones@redhat.com> wrote:
> > On Fri, Sep 22, 2017 at 08:51:15AM -0500, Wei Huang wrote:
> >> Instead of using "1.0" as the system version of SMBIOS, we should use
> >> mc->name for mach-virt machine type. This matches with x86 code and
> >> prevents the smbios_table.machine_type test of Avocado from failing.
> >>
> >> Signed-off-by: Wei Huang <wei@redhat.com>
> >> ---
> >>  hw/arm/virt.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >> index 9e18b41..8d0c6a9 100644
> >> --- a/hw/arm/virt.c
> >> +++ b/hw/arm/virt.c
> >> @@ -1189,6 +1189,7 @@ static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
> >>
> >>  static void virt_build_smbios(VirtMachineState *vms)
> >>  {
> >> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
> >>      uint8_t *smbios_tables, *smbios_anchor;
> >>      size_t smbios_tables_len, smbios_anchor_len;
> >>      const char *product = "QEMU Virtual Machine";
> >> @@ -1202,7 +1203,7 @@ static void virt_build_smbios(VirtMachineState *vms)
> >>      }
> >>
> >>      smbios_set_defaults("QEMU", product,
> >> -                        "1.0", false, true, SMBIOS_ENTRY_POINT_30);
> >> +                        mc->name, false, true, SMBIOS_ENTRY_POINT_30);
> >>
> >>      smbios_get_tables(NULL, 0, &smbios_tables, &smbios_tables_len,
> >>                        &smbios_anchor, &smbios_anchor_len);
> >> --
> >> 2.7.5
> >>
> >>
> >
> > Reviewed-by: Andrew Jones <drjones@redhat.com>
> 
> Are we OK to change this without having to tie it to the machine
> version number?

Let's tie it to be safe. Eric has a 2.11 machine version patch in his
virtio-iommu series, but, like for 2.10, he or Wei should probably just
post that independently to make sure it gets in.

Wei, will you post the 2.11 version patch?

Thanks,
drew
