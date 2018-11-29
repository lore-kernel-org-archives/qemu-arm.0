Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2371919wrt;
        Thu, 29 Nov 2018 06:03:00 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UO81FrRBiJNfd/2mpxT66EFZU8EzFMuHpwWKgv+b8JQtKYDuD+tMNpUTZyF+6WBV2xAEMz
X-Received: by 2002:a25:b104:: with SMTP id g4-v6mr1357335ybj.112.1543500179794;
        Thu, 29 Nov 2018 06:02:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543500179; cv=none;
        d=google.com; s=arc-20160816;
        b=VTkZ7Yx2kD+By2FpMxf/hL2vwS9tM5w5YUpsYH0UPnNSICdjxzansZIwQ8JXz6dFVU
         Foh+ZjNiTo6VzA/l1w5GoPHmawAm2mfquhFa8zJetmGMfkOJ5fM1vLBueKu/t0hQ4Elo
         6y3gRJVh5hbjAVl7+8zM4ZOUmSu+p5dGO9eMo5EoH5PsCpYhTz1qejKrmvhIYsNZkOpi
         t+HROqkCyZgU331+e9JP4ywafINexga00GUjafIvZx6ZUCQY79tzysKFPJYQVQG3+qjp
         6BBhr0prEw/4BcfYMP3P6SNdEk88HQwh8bxN2C7pIYy0bin4RDMfu3xzEVprij6MM1kp
         a+Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=NOwfC/Pn8vMJikMhPzNhSjENrIpMnlGHjltf+rLGkao=;
        b=qc0nJ6zVJdj09letsTkx1qOW5GvxJHiAyekZ7aV1lLWSWQMgTMJ44dh11Q70ZH4Zz8
         DFhV5fb+ZkZp1laycvp5whdZoZUSoGEf1aypPvwRbrY9TuTl1Js0d7F2F8FuMHgoyynG
         Gz/eDBqEYSmF9XZIaIwQ0oe0JdwN0UesWI7UWu1dDH9wxtFUeKVl+8I66cn/44urqrj9
         Pv7AEImFktt50pgnLptiPSuN86Ohfs6WocPw/yaYg1GjNmxCEhvC8DAUkVKftnTbMZXE
         zOS59IJq7rQDiL4/UdSWDY7xBz1l49TjNTANxAuu2tWlI8eBv+SWsumgYVYi7ZXZBe+f
         Egaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u127-v6si1189835yba.107.2018.11.29.06.02.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Nov 2018 06:02:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54346 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSMuB-0002wT-5H
	for alex.bennee@linaro.org; Thu, 29 Nov 2018 09:02:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42046)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gSMts-0002qe-5W
	for qemu-arm@nongnu.org; Thu, 29 Nov 2018 09:02:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gSMtm-0004qO-Oo
	for qemu-arm@nongnu.org; Thu, 29 Nov 2018 09:02:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60576)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1gSMtm-0004pc-HX; Thu, 29 Nov 2018 09:02:34 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E069AA990;
	Thu, 29 Nov 2018 14:02:31 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 297B4183EB;
	Thu, 29 Nov 2018 14:02:19 +0000 (UTC)
Date: Thu, 29 Nov 2018 15:02:16 +0100
From: Andrew Jones <drjones@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181129135853.prrfozwknvmmvqg4@kamzik.brq.redhat.com>
References: <20181129132428.333-1-sameo@linux.intel.com>
	<20181129132428.333-2-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20181129132428.333-2-sameo@linux.intel.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 29 Nov 2018 14:02:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 1/8] hw: acpi: The RSDP build
 API can return void
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
X-TUID: fCXl4+WHV0Zm

On Thu, Nov 29, 2018 at 02:24:21PM +0100, Samuel Ortiz wrote:
> For both x86 and ARM architectures, the internal RSDP build API can
> return void as the current return value is unused.
>=20
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c | 4 +---
>  hw/i386/acpi-build.c     | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
>

Reviewed-by: Andrew Jones <drjones@redhat.com>
