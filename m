Received: by 10.25.44.15 with SMTP id s15csp2462617lfs;
        Thu, 13 Jul 2017 10:35:26 -0700 (PDT)
X-Received: by 10.237.56.73 with SMTP id j67mr6491014qte.51.1499967325891;
        Thu, 13 Jul 2017 10:35:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499967325; cv=none;
        d=google.com; s=arc-20160816;
        b=ToNvpSSzry5aIPtFjpcRbaqJrNXXsSbnMn04SK7x0LvQir+EjDtA0jT567p2Y6B4LV
         Fs7LSFRayaVGbHiHMlPO/Q9fnBsw9OUaMrFnwPwnboqPqVRnpXz2VF0iRHw3bSvAtsjy
         O2SR8afyuSUZhhVhBqphXSgjiHywssoGUc3Ct+nZ1yHrGd15rw6P3wkh1bVPxRWu2nDj
         lAPg2LJjENWmihHqjQ2LPn35d6p8WHmsrvMUj61N/qj7l8eKnEXC/1i1nI7mqzLGO8Zd
         3YVA2uVl6FZLCFjXvZFc3PEtXWG2YYIClv007LG8DxoRGpZWLLR8HZ+X8f+y/4jGMESp
         otiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=6EwcpQzd1vRNRawATQxD1rWVQn5f9KYJgCgwp8M2Oo0=;
        b=lPXOWxRdY8VtTO9W08LmulqVp4HiI68slzBxjoQ9imFpdCACG9t4GRnf3QP9iI7A3r
         Qk8EMcGnOjlWsYdGdehT6ASAq28ktgrqGKdw0IK43gtZNf01ViTnwgu924zPrGC8XBQf
         BygT3SccG+opRfTSJFfIqtyW8fC92d+HZA6S4CvSstKP6bSLjgIi9zWri/i1TiDKn/Jf
         OPNw58cjCkUFXx/89MutjaMrCD3dnII7Z+kOt/CP7rdFhlDP53+xocym1kRLh5/ZG4M7
         sJT7FEtB2rIPDJNL5GgX1Uqb7iP5J3knOgCUO9Cts+5QIjUG70i8KktWlkVhv909EDTp
         GEHg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w21si5748505qtw.345.2017.07.13.10.35.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Jul 2017 10:35:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33270 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVi1L-0007y9-89
	for alex.bennee@linaro.org; Thu, 13 Jul 2017 13:35:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33886)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1dVi1F-0007xL-BH
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 13:35:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1dVi1A-0005fi-GG
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 13:35:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45864)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1dVi1A-0005fT-Ao; Thu, 13 Jul 2017 13:35:12 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 75EB780480;
	Thu, 13 Jul 2017 17:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 75EB780480
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=mst@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 75EB780480
Received: from redhat.com (ovpn-121-70.rdu2.redhat.com [10.10.121.70])
	by smtp.corp.redhat.com (Postfix) with SMTP id 2E0BB5DC1A;
	Thu, 13 Jul 2017 17:35:06 +0000 (UTC)
Date: Thu, 13 Jul 2017 20:35:05 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <20170713203308-mutt-send-email-mst@kernel.org>
References: <1499825297-20335-1-git-send-email-gengdongjiu@huawei.com>
	<1499825297-20335-2-git-send-email-gengdongjiu@huawei.com>
	<74ac9b79-0225-0cab-559f-6204754de5f0@redhat.com>
	<47cc803a-d1d9-da3b-43f9-31a54ce290e2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47cc803a-d1d9-da3b-43f9-31a54ce290e2@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 13 Jul 2017 17:35:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 1/3] ACPI: Add new ACPI
 structures and macros
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
Cc: peter.maydell@linaro.org, wuquanming@huawei.com, famz@redhat.com,
	zhengqiang10@huawei.com, qemu-devel@nongnu.org,
	Gaozhihui <zhihui.gao@huawei.com>, qemu-arm@nongnu.org,
	james.morse@arm.com, huangshaoyu@huawei.com,
	zhaoshenglong@huawei.com, imammedo@redhat.com,
	Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IkPMPJ2hFWRg

On Thu, Jul 13, 2017 at 08:00:26PM +0800, gengdongjiu wrote:
>    Laszlo, I pasted Michael's comments here, as shown below. Michael said the definition
> should use build_append_int_noprefix to add data. but I think it may not good, becuase
> the section "UEFI_CPER_SEC_PLATFORM_MEM" is runtime recorded as CPER,

One thing I wanted to understand is how are races avoided. E.g. what if
you are in the process of writing out CPER and guest reads it.
I tried to find where is this function writing CPER called and couldn't.
Can you clarify pls?

> not a ACPI/HEST
> table member, so it is not generated when system boot up. On the other hand,UEFI_CPER_SEC_PLATFORM_MEM
> definition is from UEFI spec 2.6, N.2.2 Section Descriptor: {0xA5BC1114, 0x6F64, 0x4EDE, {0xB8, 0x63, 0x3E, 0x83, 0xED, 0x7C, 0x83, 0xB1}}.
> if use  build_append_int_noprefix to add, may confuse others.

Right but ACPI/HEST generation could use cleanup, and build_append_int_noprefix
would be a nice way to do it.

-- 
MST
