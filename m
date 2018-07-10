Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp3279621wrq;
        Tue, 10 Jul 2018 01:02:56 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpex9kElGVhN6mlcFjAS/l5bLPdcOEVISjtP2PBCZTOVukm195+aoTkg2OUan5hqS8S42ydj
X-Received: by 2002:a37:3609:: with SMTP id d9-v6mr20117078qka.419.1531209776710;
        Tue, 10 Jul 2018 01:02:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531209776; cv=none;
        d=google.com; s=arc-20160816;
        b=rIeVmlE4cVtyHxJpenDyRYwJmOrLNK89B9eWqLKOKqLzhygYKDB+Mi1uJPVScx2m2V
         f8+h5KHMiM5mW13WM2Ek6x6gB0OnJ0uSqcsZEdsldhzxHpAmTATPkuTutfZhH8SUAS47
         d/db4DQyWk/x0frehtggpjKFe3ftYudUAD4B0MpLvo8f7z39AQO0Wlg1wWThv4MJgCOA
         K22NxqKyAiRflu0DcDjNtMmfuNBPWd0QSQ/HVenlJXQQTcmvxpw/35JUj8bcxo3/EMfh
         JgK39sBayqFn8U6WjIBr5QYa1vYoiGAf0h9YeSC03GjW1k4nuZloFAbMjaw4jjC0tzWy
         2Qkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=RhkHgI5VddkmKwHD6nyAK0ElQ6l7g9ZObhXTDbUsASA=;
        b=CwGGZtBzszqwe75Li1Rb71Urt8x44OHYnBVavZEo9V5cvpS4M4IgecXRBavsQeHYID
         8KWTxWHIBDwdYoT+6arkM9ZouSGAUJ6Oxwxij9lw5RCXv23WUPgWykF2pZZ1JAcQ3WOS
         8kEw70KFVJpn/QnfxVZA2jXiXycfQiXPSSazWUOFneXPMe4ed6xQgsjN9v84hBUUzaXg
         p/LEnWmgDo5l1cnpF190wc+cQmdA0NRuIYZCpJfltlZiE3u8eHxHCrHIwY2hFWG9NFdv
         pBIvINIY6hqpZ02aOtZIMiH7UEqX+7c3CFmlLv/Z/m5f5ZOvAPI2VQsnOsQKjcbuiNtg
         AvWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q87-v6si6842392qkl.301.2018.07.10.01.02.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Jul 2018 01:02:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46399 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fcnbs-0006XS-5w
	for alex.bennee@linaro.org; Tue, 10 Jul 2018 04:02:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39438)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fcnbL-0006UB-Kz
	for qemu-devel@nongnu.org; Tue, 10 Jul 2018 04:02:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fcnbH-0004bd-6T
	for qemu-devel@nongnu.org; Tue, 10 Jul 2018 04:02:23 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49676 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1fcnb2-0004SV-QE; Tue, 10 Jul 2018 04:02:04 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 14119402312B;
	Tue, 10 Jul 2018 08:02:04 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9031E2026D6B;
	Tue, 10 Jul 2018 08:02:02 +0000 (UTC)
Date: Tue, 10 Jul 2018 10:02:01 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20180710100201.794d8702@redhat.com>
In-Reply-To: <20180710022532-mutt-send-email-mst@kernel.org>
References: <20180705235305.124423-1-mst@redhat.com>
	<20180709175232.5e768dfb@redhat.com>
	<20180709200456-mutt-send-email-mst@kernel.org>
	<20180710022532-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 10 Jul 2018 08:02:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 10 Jul 2018 08:02:04 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [PATCH] acpi: generalize aml_package /
 aml_varpackage
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, =?UTF-8?B?TWFy?= =?UTF-8?B?Yy1BbmRyw6k=?= Lureau
	<marcandre.lureau@redhat.com>, Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VRZhCzNZSUog

On Tue, 10 Jul 2018 02:26:35 +0300
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Mon, Jul 09, 2018 at 08:19:17PM +0300, Michael S. Tsirkin wrote:
> > On Mon, Jul 09, 2018 at 05:52:32PM +0200, Igor Mammedov wrote:  
> > > On Fri, 6 Jul 2018 02:53:09 +0300
> > > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > >   
> > > > VarPackage can accept an expression evaluating to int, not just an int.
> > > > Change the API to make it more generic.
> > > > Further, rather than have users call the correct API depending on
> > > > value passed, use either PackageOp or VarPackageOp automatically.
> > > > 
> > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > ---
> > > >  include/hw/acpi/aml-build.h |  4 ++--
> > > >  hw/acpi/aml-build.c         | 18 ++++++++++++++----
> > > >  hw/acpi/cpu_hotplug.c       | 11 ++---------
> > > >  hw/arm/virt-acpi-build.c    |  2 +-
> > > >  4 files changed, 19 insertions(+), 16 deletions(-)
> > > > 
> > > > diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> > > > index 10c7946028..7cf2cf64bf 100644
> > > > --- a/include/hw/acpi/aml-build.h
> > > > +++ b/include/hw/acpi/aml-build.h
> > > > @@ -360,7 +360,7 @@ Aml *aml_method(const char *name, int arg_count, AmlSerializeFlag sflag);
> > > >  Aml *aml_if(Aml *predicate);
> > > >  Aml *aml_else(void);
> > > >  Aml *aml_while(Aml *predicate);
> > > > -Aml *aml_package(uint8_t num_elements);
> > > > +Aml *aml_package(uint64_t num_elements);
> > > >  Aml *aml_buffer(int buffer_size, uint8_t *byte_list);
> > > >  Aml *aml_resource_template(void);
> > > >  Aml *aml_field(const char *name, AmlAccessType type, AmlLockRule lock,
> > > > @@ -373,7 +373,7 @@ Aml *aml_create_field(Aml *srcbuf, Aml *bit_index, Aml *num_bits,
> > > >                        const char *name);
> > > >  Aml *aml_create_dword_field(Aml *srcbuf, Aml *index, const char *name);
> > > >  Aml *aml_create_qword_field(Aml *srcbuf, Aml *index, const char *name);
> > > > -Aml *aml_varpackage(uint32_t num_elements);
> > > > +Aml *aml_varpackage(Aml *num_elements);  
> > > maybe drop it from header and make static so only aml_package() would be
> > > left as public API like in spec?  
> > 
> > There are places in the spec that say VarPackage.
> > E.g. _CST: Return Value: A variable-length Package.
the only thing is that one has only "Package()" ASL to declare it,
compiler probably uses argument type to deduce which one to use.

> > 
> > We probably want to keep aml_varpackage around for these
> > cases.  
> 
> And thinking more about this, if you want a package with
> # of elements that isn't a constant, you want aml_varpackage.
> If it's a constant you have the handy aml_package shortcut.
not sure windows would like it (it seems to have issues with
dynamic packages (according to Marc-Andre tests))
but lets keep it for now we can always remove it later.

with style issue fixed:

Reviewed-by: Igor Mammedov <imammedo@redhat.com>



> 
> > >   
> > > >  Aml *aml_touuid(const char *uuid);
> > > >  Aml *aml_unicode(const char *str);
> > > >  Aml *aml_refof(Aml *arg);
> > > > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> > > > index def62b3112..1996768b40 100644
> > > > --- a/hw/acpi/aml-build.c
> > > > +++ b/hw/acpi/aml-build.c
> > > > @@ -1016,9 +1016,19 @@ Aml *aml_buffer(int buffer_size, uint8_t *byte_list)
> > > >  }
> > > >  
> > > >  /* ACPI 1.0b: 16.2.5.4 Type 2 Opcodes Encoding: DefPackage */
> > > > -Aml *aml_package(uint8_t num_elements)
> > > > +/* Note: The ability to create variable-sized packages was first
> > > > + * introduced in ACPI 2.0. ACPI 1.0 only allowed fixed-size packages
> > > > + * with up to 255 elements. Windows guests up to win2k8 fail when
> > > > + * VarPackageOp is used.
> > > > + */
> > > > +Aml *aml_package(uint64_t num_elements)
> > > >  {
> > > > -    Aml *var = aml_bundle(0x12 /* PackageOp */, AML_PACKAGE);
> > > > +    Aml *var;
> > > > +
> > > > +    if (num_elements > 0xFF)
> > > > +        return aml_varpackage(aml_int(num_elements));
> > > > +
> > > > +    var = aml_bundle(0x12 /* PackageOp */, AML_PACKAGE);
> > > >      build_append_byte(var->buf, num_elements);
> > > >      return var;
> > > >  }
> > > > @@ -1136,10 +1146,10 @@ Aml *aml_local(int num)
> > > >  }
> > > >  
> > > >  /* ACPI 2.0a: 17.2.2 Data Objects Encoding: DefVarPackage */
> > > > -Aml *aml_varpackage(uint32_t num_elements)
> > > > +Aml *aml_varpackage(Aml *num_elements)
> > > >  {
> > > >      Aml *var = aml_bundle(0x13 /* VarPackageOp */, AML_PACKAGE);
> > > > -    build_append_int(var->buf, num_elements);
> > > > +    aml_append(var, num_elements);
> > > >      return var;
> > > >  }
> > > >  
> > > > diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
> > > > index 5243918125..f8246fca6f 100644
> > > > --- a/hw/acpi/cpu_hotplug.c
> > > > +++ b/hw/acpi/cpu_hotplug.c
> > > > @@ -309,15 +309,8 @@ void build_legacy_cpu_hotplug_aml(Aml *ctx, MachineState *machine,
> > > >      }
> > > >      aml_append(sb_scope, method);
> > > >  
> > > > -    /* build "Name(CPON, Package() { One, One, ..., Zero, Zero, ... })"
> > > > -     *
> > > > -     * Note: The ability to create variable-sized packages was first
> > > > -     * introduced in ACPI 2.0. ACPI 1.0 only allowed fixed-size packages
> > > > -     * ith up to 255 elements. Windows guests up to win2k8 fail when
> > > > -     * VarPackageOp is used.
> > > > -     */
> > > > -    pkg = pcms->apic_id_limit <= 255 ? aml_package(pcms->apic_id_limit) :
> > > > -                                       aml_varpackage(pcms->apic_id_limit);
> > > > +    /* build "Name(CPON, Package() { One, One, ..., Zero, Zero, ... })" */
> > > > +    pkg = aml_package(pcms->apic_id_limit);
> > > >  
> > > >      for (i = 0, apic_idx = 0; i < apic_ids->len; i++) {
> > > >          int apic_id = apic_ids->cpus[i].arch_id;
> > > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > > index 6ea47e2588..2adb1de378 100644
> > > > --- a/hw/arm/virt-acpi-build.c
> > > > +++ b/hw/arm/virt-acpi-build.c
> > > > @@ -174,7 +174,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
> > > >      aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> > > >  
> > > >      /* Declare the PCI Routing Table. */
> > > > -    Aml *rt_pkg = aml_varpackage(nr_pcie_buses * PCI_NUM_PINS);
> > > > +    Aml *rt_pkg = aml_package(nr_pcie_buses * PCI_NUM_PINS);
> > > >      for (bus_no = 0; bus_no < nr_pcie_buses; bus_no++) {
> > > >          for (i = 0; i < PCI_NUM_PINS; i++) {
> > > >              int gsi = (i + bus_no) % PCI_NUM_PINS;  

