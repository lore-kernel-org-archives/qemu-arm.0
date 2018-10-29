Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4502852wro;
        Mon, 29 Oct 2018 10:29:17 -0700 (PDT)
X-Google-Smtp-Source: AJdET5eCTVOfDt7ppvhK7LvlaGWNKd+GUscQogKLwoJVxe7De6zwAQGoMvbtCT/tKehcdY78Hb68
X-Received: by 2002:ac8:458e:: with SMTP id l14-v6mr14008701qtn.124.1540834157142;
        Mon, 29 Oct 2018 10:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540834157; cv=none;
        d=google.com; s=arc-20160816;
        b=XoTEQCbQpUh4qdqB2HoQnqLeDwMKq41ZCGQEOauIKi6jzMTviZA80T9XyJAlK8HD6o
         brPsIREm/1XkOukRAEcSVwdEhqp/zEbFuZ0aE6NuVLotx+Bno2iIZ/Q0ZwcKp522gF78
         uX5Lzeh36PjpkUKwRWKq104F3hyU9mLmtTx8C77NDNpkidFQdEVj4l+Cgkj9UjGkQVvg
         H3JhNx911AZKOyY1Uvnui8V3PPAywCLffX7aesEq4cIsfAIOuhanebESaBII68UT2Svz
         K5nU5RQaG7ZMAiwW31gNqtJpx7aMA+b9Pq5GHyZiM0YDgK4mSTIHWfKEZUQB8R2PW7lC
         tJTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from;
        bh=l0p+W0wdU+F8viAhpBPq6QMMid6ZM8JpKE7wvkLMVyk=;
        b=Dy1omIRkSSytXb7fFmYeslC5v5YJPJbtrtJ9BDbX21CbMSusCDbLDAmDQRbZqMteYf
         2Yno9WwoUUTNaUgcPOIsdfdObtSInU6sZpD7aSGfhllG+I4Y/VpMrA3i8PUqAbOGNdik
         sGQdecHDh+pgcnNEIVD7vsyEdqAVQhF8IA4Qv5pdmTqVxps/tSnMIGvNGVAysLKlVSmP
         9b9gK0LGdYWzXhEhMtgOm9k627010iLC4qy2VOnV58A4ANKUubfPrM9V+Y7btz7qmIdO
         rxsxwHHSXxqHuRP2a9hrwbgSDwH7ftMjCFRQFo5z3WuLg+FMe9HK0Gy038Yo3xIc80uZ
         pRlA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m58-v6si58316qtm.216.2018.10.29.10.29.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 10:29:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47550 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHBLo-0006VW-K7
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 13:29:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59630)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gHBLZ-0006O3-Gs
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 13:29:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gHBLU-0004iw-9j
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 13:29:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35828)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1gHBLR-0004fy-8a; Mon, 29 Oct 2018 13:28:53 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 845CC7DF79;
	Mon, 29 Oct 2018 17:28:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-34.ams2.redhat.com
	[10.36.117.34])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DBE4282F8;
	Mon, 29 Oct 2018 17:28:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 7884311385F2; Mon, 29 Oct 2018 18:28:48 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
References: <20181029162441.31631-1-sameo@linux.intel.com>
Date: Mon, 29 Oct 2018 18:28:48 +0100
In-Reply-To: <20181029162441.31631-1-sameo@linux.intel.com> (Samuel Ortiz's
	message of "Mon, 29 Oct 2018 17:24:22 +0100")
Message-ID: <874ld4mzlb.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 29 Oct 2018 17:28:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 00/19] ACPI reorganization
 for hardware-reduced support
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
Cc: Igor Mammedov <imammedo@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kaXfwDY7tn93

You neglected to cc: maintainers.  I'm doing that for you now.
scripts/get_maintainer.pl can help you finding maintainers.

Samuel Ortiz <sameo@linux.intel.com> writes:

> This patch set provides an ACPI code reorganization in preparation for
> adding hardware-reduced support to QEMU.
>
> The changes are coming from the NEMU [1] project where we're defining
> a new x86 machine type: i386/virt. This is an EFI only, ACPI
> hardware-reduced platform and as such we had to implement support
> for the latter.
>
> As a preliminary for adding hardware-reduced support to QEMU, we did
> some ACPI code reorganization with the following goals:
>
> * Share as much as possible of the current ACPI build APIs between
>   legacy and hardware-reduced ACPI.
> * Share the ACPI build code across machine types and architectures and
>   remove the typical PC machine type dependency.
>   Eventually we hope to see arm/virt also re-use much of that code.
>
> The patches are also available in their own git branch [2].
>
> [1] https://github.com/intel/nemu
> [2] https://github.com/intel/nemu/tree/topic/upstream/acpi
>
> v1 -> v2:
>    * Drop the hardware-reduced implementation for now. Our next patch set
>      will add hardware-reduced and convert arm/virt to it.
>    * Implement the ACPI build methods as a QOM Interface Class and convert
>      the PC machine type to it.
[...]
