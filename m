Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2415161wrt;
        Thu, 29 Nov 2018 06:37:32 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UcyU6Fwxw2V5r2+EwJxGh7Uw35xYQRYEMu0ZeptZwCxlGB14wL7Oe4oMXy1Ki6wG0wYA5A
X-Received: by 2002:a25:9342:: with SMTP id g2-v6mr1546243ybo.248.1543502252447;
        Thu, 29 Nov 2018 06:37:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543502252; cv=none;
        d=google.com; s=arc-20160816;
        b=fjqNdf7n3gMhCQfLSyGnr2sy9brDyBIVgonmIrQ83rh6JOuciPgbB4WKqVuvCfRK8s
         iFci+5QwEuymGTYqyTZ/5hx61oLPw7gIjl1J/t7VCRkL7WIaZXM5H6KH+80jEESc+tIK
         08Mr/13qQgQSMwXp+EuyjCPgeW+ONNF1/iIHiHbNQDL+y3bZ0B1opmO/YAmff44lMBca
         pNCOYSN8L1/6s1r0641jZ56sL4QjU73KS89QH2mzj4/blHDEb6dfsAf/Iwn59d7K6Edm
         C41I7jkdVSrPpsqfnho8rc2eYOekzt/QX6b0IgDT3IbW2vOKf90CzWGc16SzRP6eVtp8
         7EzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=c1gwKVMGPL9Oc23IN7Wk9tNVrBNElKDuBcn2V5CEptI=;
        b=p8kEASupBktbQH590Lm5ShV040ybrUDbrOWSGg93GxZjSpzxv6IWvd/XxRhyPtKmid
         J/UG/yjRDrP917xKJpz5jLTA2eR1bZX3dt2IGUUvJfcG8dAhAKlZZxDvlIMy0YrXwLE2
         HlPJL1EBD8QSk25lwy3oiTPYaystQNbxvtFQYYxQidirNQh8UgGiwcWz46cxyzbVbN32
         AEzwGgpWm6z7KzKC2Qb4kHalj5ZCPRK6CMNmzHLM1wohBF9EvYNwSWu+mi4AZhyMRYYS
         JkK2YJLbHRSq7iMWKjPPY820Or7v13aN7BjmyS1YvwClC2HOLTAwosqc2BZfpxLFTDHy
         kF5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w199si1309484ywd.45.2018.11.29.06.37.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Nov 2018 06:37:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54499 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSNRb-00048v-Nr
	for alex.bennee@linaro.org; Thu, 29 Nov 2018 09:37:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53144)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gSNJT-0004zf-A5
	for qemu-arm@nongnu.org; Thu, 29 Nov 2018 09:29:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gSNJP-0006lJ-9j
	for qemu-arm@nongnu.org; Thu, 29 Nov 2018 09:29:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47991)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1gSNJP-0006i5-1M; Thu, 29 Nov 2018 09:29:03 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0A6D558E27;
	Thu, 29 Nov 2018 14:29:02 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89E69ABB9D;
	Thu, 29 Nov 2018 14:28:59 +0000 (UTC)
Date: Thu, 29 Nov 2018 15:28:57 +0100
From: Andrew Jones <drjones@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181129142857.f6k343h2zys2zkor@kamzik.brq.redhat.com>
References: <20181129132428.333-1-sameo@linux.intel.com>
	<20181129132428.333-6-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181129132428.333-6-sameo@linux.intel.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 29 Nov 2018 14:29:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 5/8] hw: arm: Convert the
 RSDP build to the buid_append_foo() API
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MLe0NvGSqHby

On Thu, Nov 29, 2018 at 02:24:25PM +0100, Samuel Ortiz wrote:
> Instead of filling a mapped and packed C structure field in random order
> and being careful about endianness and sizes, build_rsdp() now uses
> build_append_int_noprefix() to compose RSDP table.
> 
> This makes for an easier to review and maintain code that is almost
> matching 1:1 the ACPI spec itself.
> 
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> ---
>  hw/arm/virt-acpi-build.c | 42 +++++++++++++++++++++-------------------
>  1 file changed, 22 insertions(+), 20 deletions(-)


Reviewed-by: Andrew Jones <drjones@redhat.com>
