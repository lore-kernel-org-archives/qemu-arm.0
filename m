Received: by 2002:a5d:4d11:0:0:0:0:0 with SMTP id z17csp569738wrt;
        Wed, 20 Mar 2019 03:53:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxW89rGxxHzsW6uxxXV84bSWbZ30OwZVW69yA4tqJsYwzAXRJFqSd3mHk0EBymk5GiadhVk
X-Received: by 2002:a1c:6309:: with SMTP id x9mr8101977wmb.101.1553079221577;
        Wed, 20 Mar 2019 03:53:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553079221; cv=none;
        d=google.com; s=arc-20160816;
        b=Wf/bGm6BXkmjOAs9ps5YtZgnm0xYwxiinjtLUqDmR/JszR4SBGpSXX/SKPly36RUgw
         CYQRyaLnxC4YRepM5WrT37ESSyk4AyNgDDEAIl7TN4NHvUqI3vsDmccmt6SMGB1G6W+i
         I7ivuAaGCtZk/DHYNfN758DQHAHeBi43xA5Okwki8/TF+ZSDQakqiRb1fvCJMWJA6v1D
         yym433v5uXKB+5LlkIXL3T8H/Zki8vmINe3q8U/Ty8HzljZoJsEiMzEsdRAP2CsQcTDK
         Ii0epK4abT/OdVO7MjgZYq44POtPsZsT/tggqmTJM9/2xqO4tM1BjpKjY9vR13bcALfO
         MYeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=0NhJC+p507ssT23bw3oAZgCnKE+A1MebQLinQU0r+Hc=;
        b=SHAGXRKUHG5BKWKSYDeQuuWE9PDBzB+jxH8ysqYdRpMpJwojCRH9UksfEMd0fysSnX
         6NL38bPotD9Omk5fyAixZmfNIfKfGhViYWmL93vy8yUqvKz0EeuPkVJ/zih8muTigQtn
         0Xc6wqEOxpmunaJSlhJc9+I8t4Ziod3AuWrRyovcIyy50VGMN7e04XE50fg2Szjh9rsw
         Vl8b+DHaXTy4I1ZKZ2xEetUa8a0uFZBuBerUO7bOynmhD62Pu3IrM5gKndtUXMWkliuS
         bDal3PVVELfy0GRIpm+8rigEwQYmxe233K/CdwdmWEPYy662w6altMqhutQaA6kF5di5
         YKYg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10si1073076wrn.163.2019.03.20.03.53.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Mar 2019 03:53:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:46015 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h6Yqj-0000ej-Tl
	for alex.bennee@linaro.org; Wed, 20 Mar 2019 06:53:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42988)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h6Yqb-0000eX-4R
	for qemu-arm@nongnu.org; Wed, 20 Mar 2019 06:53:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h6YqZ-0008KD-Jx
	for qemu-arm@nongnu.org; Wed, 20 Mar 2019 06:53:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44812)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h6YqZ-0008JO-68; Wed, 20 Mar 2019 06:53:23 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9BEB3F74AF;
	Wed, 20 Mar 2019 10:53:21 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F24E310021B1;
	Wed, 20 Mar 2019 10:53:17 +0000 (UTC)
Date: Wed, 20 Mar 2019 11:53:16 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190320115316.01fd5f29@redhat.com>
In-Reply-To: <20190320003714.GA11913@richard>
References: <20190315004432.3445-1-richardw.yang@linux.intel.com>
	<20190318133912.1c67a304@redhat.com>
	<20190319004523.GA5032@richard>
	<20190319100038.6263905f@redhat.com>
	<20190320003714.GA11913@richard>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 20 Mar 2019 10:53:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3] hw/acpi: extract acpi_add_rom_blob()
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, mst@redhat.com,
	qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ofOylMoUn0nk

On Wed, 20 Mar 2019 08:37:14 +0800
Wei Yang <richardw.yang@linux.intel.com> wrote:

> On Tue, Mar 19, 2019 at 10:00:38AM +0100, Igor Mammedov wrote:
> >On Tue, 19 Mar 2019 08:45:23 +0800
> >Wei Yang <richardw.yang@linux.intel.com> wrote:
> >  
> >> On Mon, Mar 18, 2019 at 01:39:12PM +0100, Igor Mammedov wrote:  
> >> >On Fri, 15 Mar 2019 08:44:32 +0800
> >> >Wei Yang <richardw.yang@linux.intel.com> wrote:
> >> >
> >> >in subject: s/extract/generalize/
> >> >    
> >> >> arm and i386 has almost the same function acpi_add_rom_blob(), except
> >> >> giving different FWCfgCallback function.
> >> >> 
> >> >> This patch extract acpi_add_rom_blob() to utils.c by passing    
> >> >             s/extract/moves/
> >> >    
> >> >> FWCfgCallback to it.
> >> >> 
> >> >> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>    
> >> >
> >> >otherwise patch looks fine to me,
> >> >but checkpatch complains about comment style so that needs to be fixed as well
> >> >    
> >> 
> >> BTW, the checkpatch also says
> >> 
> >>     WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> >> 
> >> Do I need to fix this?  
> >yep, add me and Michael as maintainers for these new files.
> >  
> 
> It looks current statement already includes those files.
> 
> ACPI/SMBIOS
> M: Michael S. Tsirkin <mst@redhat.com>
> M: Igor Mammedov <imammedo@redhat.com>
> S: Supported
> F: include/hw/acpi/*
> F: hw/acpi/*

Agreed, checkpatch warning look like false positive, pls ignore it

