Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3333649wrt;
        Mon, 14 Jan 2019 10:35:55 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4PMXKsflp6O7Nrf0s2u/YaEomUu4FzM/Ky9TfPX3D5eXfkuReXmauPo5F+4kGV1sr68k1Z
X-Received: by 2002:a1c:ad43:: with SMTP id w64mr368198wme.32.1547490955086;
        Mon, 14 Jan 2019 10:35:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547490955; cv=none;
        d=google.com; s=arc-20160816;
        b=YhBHs/1J9HoWaZ2IYOn49ht1COJWxRAfstQBEYcbNeXp76p4WdUhsg5y+QZOCb6QT0
         nP25w51Rqn35JKLHXVYyJRmex5jJKRX4l8EthcddUNyd5l7mr8en0/zPqmCTeat91JwH
         E+dsuNxCkXt6vbF29SScMO6jvMwfD1LbivemLbWGlodC3fMU2mLHGt74+V0Pu5EIthtt
         xeFEhFvw2N2+9SPrij806PD0pnk+3itc57N/8YGjIS2/edbadoYKQo8X47WrC5A83sYL
         UQMviMuGSjnOKNe7PBndYUq81p9obQlnanKgmK2KvYDLJnc987XD1S2Y4295CuJerDzV
         lwUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=gotMr8j/g6ZJMHJSh6vI2/ivRgjiQ8uPLRW08MOC8AU=;
        b=OVyZV4eSK2A8vxxnXdHpVMdEO0boEobgPNc/JtpQ0EdldgY8vyCATYQq0nEfVvmVtu
         nu3aNo/SfbSVdEoZgaadYX+NfaI1KQfIYL0ynzfuVB28MSBY3fF5xXVSm7ZzGYGlM8sp
         moROtGR14dOhx5YZjaPZ31L7nJdTUxEjKU87s9x7HEHcIGZ/bYE5s36KTaQ6HVU1DqMo
         s/v1LOhb/phI/7y3y6cppfPkFB+TGt3RC+odOAQMqhysAhZIwAVhF4eKY9B4wNlFfCvX
         fasf0ZnnIdSCkxK3WX9fdKxBEsZw8lgE3VEZDkVWznhswCbHRaIYTgQOtYgJXmee4vxf
         B8DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12si19037292wmd.167.2019.01.14.10.35.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 14 Jan 2019 10:35:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:43851 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gj75W-0007Za-65
	for alex.bennee@linaro.org; Mon, 14 Jan 2019 13:35:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35772)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gj75P-0007ZP-5o
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 13:35:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gj75O-0006Ga-Gh
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 13:35:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50120)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1gj75O-0006FY-AT; Mon, 14 Jan 2019 13:35:46 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB0657F3EC;
	Mon, 14 Jan 2019 18:35:44 +0000 (UTC)
Received: from redhat.com (ovpn-124-229.rdu2.redhat.com [10.10.124.229])
	by smtp.corp.redhat.com (Postfix) with SMTP id C7B695D76A;
	Mon, 14 Jan 2019 18:35:42 +0000 (UTC)
Date: Mon, 14 Jan 2019 13:35:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190114133455-mutt-send-email-mst@kernel.org>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-17-sameo@linux.intel.com>
	<20181108152341.68e5a147@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181108152341.68e5a147@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 14 Jan 2019 18:35:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v5 16/24] hw: acpi: Fix memory hotplug AML
 generation error
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
Cc: Yang Zhong <yang.zhong@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Samuel Ortiz <sameo@linux.intel.com>, qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8cGkgBUV/PKf

On Thu, Nov 08, 2018 at 03:23:41PM +0100, Igor Mammedov wrote:
> On Mon,  5 Nov 2018 02:40:39 +0100
> Samuel Ortiz <sameo@linux.intel.com> wrote:
> 
> > From: Yang Zhong <yang.zhong@intel.com>
> > 
> > When using the generated memory hotplug AML, the iasl
> > compiler would give the following error:
> > 
> > dsdt.dsl 266: Return (MOST (_UID, Arg0, Arg1, Arg2))
> > Error 6080 - Called method returns no value ^
> > 
> > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> 
> I suggest to put this patch at the beginning of the series
> before reference tables in test are updated.

Samuel how about a separate small series with just bugfixes
for starters?


> > ---
> >  hw/acpi/memory_hotplug.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> > index db2c4df961..893fc2bd27 100644
> > --- a/hw/acpi/memory_hotplug.c
> > +++ b/hw/acpi/memory_hotplug.c
> > @@ -686,15 +686,15 @@ void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
> >  
> >              method = aml_method("_OST", 3, AML_NOTSERIALIZED);
> >              s = MEMORY_SLOT_OST_METHOD;
> > -            aml_append(method, aml_return(aml_call4(
> > -                s, aml_name("_UID"), aml_arg(0), aml_arg(1), aml_arg(2)
> > -            )));
> > +            aml_append(method,
> > +                       aml_call4(s, aml_name("_UID"), aml_arg(0),
> > +                                 aml_arg(1), aml_arg(2)));
> >              aml_append(dev, method);
> >  
> >              method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
> >              s = MEMORY_SLOT_EJECT_METHOD;
> > -            aml_append(method, aml_return(aml_call2(
> > -                       s, aml_name("_UID"), aml_arg(0))));
> > +            aml_append(method,
> > +                       aml_call2(s, aml_name("_UID"), aml_arg(0)));
> >              aml_append(dev, method);
> >  
> >              aml_append(dev_container, dev);
