Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1832354wrs;
        Wed, 13 Mar 2019 09:18:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy93IsZoKTQTnTDppdam3E+j8I0xbbywa6TO/4XSTJ9NNuDZ2Qp2ob1sZ7WVtYfv2sGmjYf
X-Received: by 2002:a25:8b01:: with SMTP id i1mr24845169ybl.456.1552493880639;
        Wed, 13 Mar 2019 09:18:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552493880; cv=none;
        d=google.com; s=arc-20160816;
        b=os5Aa7LWHhyQdKzlBIvLBKi3dNBLXbMoqLCDNFInDIsSz+nSnwqbqE/EN5E59O3dK3
         4YqZYQy3xvaVBbQGMSWyVfVg9gF7fPkP/tFlXehuyvlWshDKovQTb2wX1meXw682aZsX
         zJabOPM4qKut7uOs/Z4DvUVV1s8yLpGCu6Pgt/KvJUhwDHzDJLEJQ6wzjwCJlomXoNtH
         aR5kTwiTW92wqRixnOs0WfH874IJULHXQb2yD0Nu4ul9ClATD8W610B2diBLZ+7OuGuw
         eypHpPdtpjH7fYZNPfd3DBFWRdEcum0jonjqSoBBG2tX0PQHx2CoRzxn+6zTogTkEETS
         Ke0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=e4sUoOdi+7bsFgAp/eeEAdYNN5w5uLfRFjEwtIObhog=;
        b=r+6Odx7WGTCbd7Ij3MEb0yUlmb0tpekwlGU11hzQvHVtIKzAnIga6izJQO/5D1kztI
         jscvURleK8vPTVrlgwIyiO3D7Gw1H+bj+J9za4zCB8su6CS5ATMUCNPx32WOrQH2ka8t
         gGFK29x08Ac+pqpv8lh5sRvnxTLcgsBAveJBnUov/65KkRPicqnymqAXx+sr3MHCLdY6
         iGkd7XLoc5nj9TRsI5fXkTqxMjJr6RMq6iV4GOA2ypsjX/hIfhlbEXcRf77fosUouwA5
         kSF5AQK7tGV8OYHk9QzN+iF8qykrpeMo2udy0N3JKJi6Ur7/ZVrwgCjidqgIV1kee+SY
         PDkA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i202si6810265ywa.238.2019.03.13.09.18.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Mar 2019 09:18:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:47475 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h46Zs-0004BL-4y
	for alex.bennee@linaro.org; Wed, 13 Mar 2019 12:18:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54647)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h46Zl-0004BD-7T
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 12:17:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h46Zh-0000wb-Cf
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 12:17:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53024)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h46Zg-0000vo-L3; Wed, 13 Mar 2019 12:17:49 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2FB78308CF92;
	Wed, 13 Mar 2019 16:17:46 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E3BAC19C65;
	Wed, 13 Mar 2019 16:17:41 +0000 (UTC)
Date: Wed, 13 Mar 2019 17:17:40 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Wei Yang <richard.weiyang@gmail.com>
Message-ID: <20190313171740.338b43b8@redhat.com>
In-Reply-To: <20190313132448.4ui2hpxovh76wtgk@master>
References: <20190313044253.31988-1-richardw.yang@linux.intel.com>
	<20190313133039.516f3a60@redhat.com>
	<20190313132448.4ui2hpxovh76wtgk@master>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Wed, 13 Mar 2019 16:17:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH 0/3] Extract build_mcfg
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
Cc: peter.maydell@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
	shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
	Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pr9ub+au0iUE

On Wed, 13 Mar 2019 13:24:48 +0000
Wei Yang <richard.weiyang@gmail.com> wrote:

> On Wed, Mar 13, 2019 at 01:30:39PM +0100, Igor Mammedov wrote:
> >On Wed, 13 Mar 2019 12:42:50 +0800
> >Wei Yang <richardw.yang@linux.intel.com> wrote:
> >  
> >> This patch set tries to generalize MCFG table build process.
> >> 
> >> [1]: use acpi_get_mcfg() to get necessary information to build MCFG
> >> [2]: remove an unnecessary variable mcfg_start
> >> [3]: Extract build_mcfg to aml-build.c
> >> 
> >> Wei Yang (3):
> >>   hw/arm/virt-acpi-build: use acpi_get_mcfg() to calculate bus number
> >>   hw/arm/virt-acpi-build: remove unnecessary variable mcfg_start
> >>   hw/acpi: Extract build_mcfg  
> >
> >I'd add ano more patch on top
> >which converts from packed structure to build_append_int_noprefix() API
> >  
> 
> You mean get rid of type AcpiTableMcfg, and write raw data to blob with
> build_append_int_noprefix()?
yes,

> 
> I don't get the benefits of doing so.
see commit 5d7a334f7

 
> >> 
> >>  hw/acpi/aml-build.c         | 30 ++++++++++++++++++++++++++++++
> >>  hw/arm/virt-acpi-build.c    | 27 ++++++++++-----------------
> >>  hw/i386/acpi-build.c        | 36 +-----------------------------------
> >>  include/hw/acpi/aml-build.h |  6 ++++++
> >>  4 files changed, 47 insertions(+), 52 deletions(-)
> >>   
> >  
> 

