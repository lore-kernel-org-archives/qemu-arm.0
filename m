Received: by 10.28.91.67 with SMTP id p64csp2043767wmb;
        Thu, 1 Mar 2018 08:44:34 -0800 (PST)
X-Google-Smtp-Source: AG47ELueh3sBU+yEKxjDJzARG4ivlPw5EoeVHfMPrsRqPvT7adyrmCLdxF3sN/mWoTJU46a/iwn2
X-Received: by 2002:a25:b441:: with SMTP id c1-v6mr1664221ybg.218.1519922674074;
        Thu, 01 Mar 2018 08:44:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519922674; cv=none;
        d=google.com; s=arc-20160816;
        b=aoPfnr9ZdmJxwijE3QbQEk2t3/jf/6E/Jba83COyz04czYc/0jYHsV0VSw8CmGiwe+
         +5eOabcA3LsrorHrRIlR+wlEiCF+ltoQTm/RYinPZ6SydcTHbFMhgtfIcNiWsCfjM702
         6Pd6GfL+ZhdgD4mS8AzPjG0QxZ7n/5kOwg372EmUPlCtn8geYTHKE5yZqRpLTTkOGyBN
         kXOgZExAZyBSWBFFBU/8pAZe5FJ9z52gPWl++pWo0QhCgPrEX3aE9/Y3cxbs56Dw+5rW
         mNXshFAWHEjxF1KRmt1pTVPhfwIdQuN31I+a3OhxO73hbs2RerhbugmhVf/n91RrO9bY
         tQeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=/ojDaCmdGv+ckUyeZXLsEJCzLQe8nLdGVhAYpbA5R8c=;
        b=zuDzvdqXTL1JGjPKA7JaD1oSpS2rb3BytH57jbjtotTPUwSmNUwb64cDXk1C14XHJ7
         SrqBenpwknA0PB5YAVsEWhEeYY/uVMlNo0NY4PjUUVhEwUPmCAy4cV3vJWLwBRc7w4Op
         l92rYyppVKmD1JHhEZivqpOJSJCzMo2D6HsnmdfPCm0A42MudsErQgMSGXT9altFYRav
         /R/uRJl7DS0qegnj38KHsLR7vAawZwQPxwWA8O8ht6Os2x104DOu0E01WtRUpAxs6tem
         /ktNSM/SWF163WEl1zjjlI1IOYM4/ZRcCDZQ8KpVwYwRMrdtih69Gw3JOJyHC4tMShWI
         lIBg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x126-v6si704848ybx.514.2018.03.01.08.44.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 08:44:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58035 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erRJp-0004f3-GS
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 11:44:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48364)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1erRJW-0004aa-Mj
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 11:44:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1erRJS-0007Mt-Mt
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 11:44:14 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:52380 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1erRJS-0007MS-FP; Thu, 01 Mar 2018 11:44:10 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EA6FB4084FEC;
	Thu,  1 Mar 2018 16:44:05 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E53329C069;
	Thu,  1 Mar 2018 16:43:56 +0000 (UTC)
Date: Thu, 1 Mar 2018 17:43:55 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20180301174355.2d0ef5ae@redhat.com>
In-Reply-To: <ad05c82f-eb31-694d-4688-ae250287cfd6@redhat.com>
References: <1519827835-239519-1-git-send-email-imammedo@redhat.com>
	<1519827835-239519-10-git-send-email-imammedo@redhat.com>
	<986e15d2-47cd-be73-da0f-39874b38a325@redhat.com>
	<20180301102153.0a07f96c@redhat.com>
	<ad05c82f-eb31-694d-4688-ae250287cfd6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Thu, 01 Mar 2018 16:44:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Thu, 01 Mar 2018 16:44:05 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v2 09/10] virt_arm: acpi: reuse common
 build_fadt()
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
Cc: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HaZe0BagCBw0

On Thu, 1 Mar 2018 10:38:52 +0100
Auger Eric <eric.auger@redhat.com> wrote:

[...]
> >>>  {
> >>> @@ -1755,7 +1755,14 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
> >>>  
> >>>      build_append_gas_from_struct(tbl, &f->reset_reg); /* RESET_REG */
> >>>      build_append_int_noprefix(tbl, f->reset_val, 1); /* RESET_VALUE */
> >>> -    build_append_int_noprefix(tbl, 0, 3); /* Reserved, ACPI 3.0 */  
> I meant we could have assert(f->rev < 6) here
> >>> +    /* Since ACPI 5.1 */
> >>> +    if ((f->rev >= 6) || ((f->rev == 5) && f->minor_ver > 0)) {  
> and remove (f->rev >= 6) as in any case rev6 is not supported
> (Hypervisor Vendor Identity field (8 byte) not duly added).
> 
> Or do I miss something?
Nope, you are right.
I've missed 'code above' part and didn't get suggestion the first time.

The reason why I didn't assert here is to keep this part
(in the middle of table) working correctly without need
to touch it when later revisions will add new fields at
the end of table. So all we would have to do is to add
new code at the end and update assert that sets revision limit.

condition here essentially implements specs, i.e. 
from 5.1 onward reserved space should be used for now defined fields.

We might add similar conditions, for other 'Reserved' fields,
in the future if new revisions start to use them.

> Thanks
> 
> Eric
> >>> +        build_append_int_noprefix(tbl, f->arm_boot_arch, 2); /* ARM_BOOT_ARCH */
> >>> +        /* FADT Minor Version */
> >>> +        build_append_int_noprefix(tbl, f->minor_ver, 1);
> >>> +    } else {
> >>> +        build_append_int_noprefix(tbl, 0, 3); /* Reserved upto ACPI 5.0 */
> >>> +    }
> >>>      build_append_int_noprefix(tbl, 0, 8); /* X_FIRMWARE_CTRL */
> >>>  
> >>>      /* XDSDT address to be filled by Guest linker at runtime */
> >>> @@ -1779,6 +1786,18 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
> >>>      build_append_gas_from_struct(tbl, &f->gpe0_blk); /* X_GPE0_BLK */
> >>>      build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0); /* X_GPE1_BLK */
> >>>  
> >>> +    if (f->rev <= 4) {
> >>> +        goto build_hdr;
> >>> +    }
> >>> +
> >>> +    /* SLEEP_CONTROL_REG */
> >>> +    build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0);
> >>> +    /* SLEEP_STATUS_REG */
> >>> +    build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0);
> >>> +
> >>> +    /* TODO: extra fields need to be added to support revisions above rev5 */
> >>> +    assert(f->rev == 5);    
> >> My previous comment about asserting here if f->rev != 5 and previous
> >> (f->rev >= 6) check was skipped but that's not a big deal.  
> > I've thought that I've replied to comment,
> > maybe I just didn't get meaning behind question?
> > So I'll try to explain again.
> > 
> > If we reach this point rev must be 5, so f->rev >= 6 would be confusing
> > at this point. When v6 support is added this assert should be moved after
> > v6 stuff and condition is amended to f->rev == 6.
> > 
> >    
> >> Reviewed-by: Eric Auger <eric.auger@redhat.com>  
> > Thanks!
> >   
> >>
> >> Thanks
> >>
> >> Eric  
[...]
