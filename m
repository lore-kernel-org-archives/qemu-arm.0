Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2440352wrt;
        Thu, 29 Nov 2018 07:01:09 -0800 (PST)
X-Google-Smtp-Source: AFSGD/W4mEENu/Q+v3CRPpSWjA7N0gNCRb5a3+FZ42jv5olB8ESITmtnaio2CtLTLZBxX3SPx9aA
X-Received: by 2002:a25:910f:: with SMTP id v15-v6mr1612843ybl.121.1543503669430;
        Thu, 29 Nov 2018 07:01:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543503669; cv=none;
        d=google.com; s=arc-20160816;
        b=Z8KZDe3hCgWhiDXe3VjPq8QFSapvWIKJuHEZ7uJmfgKL3bdsQWNpoxJwDtcqCFoh4y
         RV5oZ2jO8ul6E7hmtZIxFiABSxUu0rNPUpyTXeNGsNJVLxfAGFV7u4+xXF1EAu+bbrPh
         yX8Xwis1+LIYl2x6mNPrIF0OL8dHoqp633UXruFxLLpw5kvQvIenahLOUnUpZf5+2R0I
         UMb83bzIaK33uco47uL761Rb6SnvST3mevrjl8VOMVQ+fAf2aPQi70qKBBZOx2C1KZ48
         5qkNb/gTZfMr0itWiiIiAzxQ4OuvIyPOlx7+iGDQ4IyouyByn2XM0WhDej4JeNGM9lmL
         IAmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=rWGyKR6RH5viZhv52eq9kmOKEIIyVFpkdNzWWzDYet4=;
        b=INj27zg079MFrCM8hGzdLgeF18o0wYb3WD0UnQtGQydLwyma1IAabO88Xm5Lweji8l
         BOxUb3/ZAovoLwwoyAogIT1GrqTB0pzfuZug9RUqqNrgD93dZ6JQm2fz7PyCaAfU60cS
         AJQTLs/Xd6gryW0uVIKl5w15fbO1ZuHfdKLqzlzfurEk1hVbEC+SiMC7tth/GTRG+g3c
         w/Fy2baLlFiK+dA1wgZLbXruaXsRWoJ0OiPX5EkPtGbFEMCjBvOZb+tdzuPx9/sf8uqd
         NTJQF5E43tCW7r+gd9GaRmO8qkPzzHTChpDeN1KfJp285rDm0lDP978UbZ74+AaqZGJ/
         wjZg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g76-v6si1283230ybf.292.2018.11.29.07.01.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Nov 2018 07:01:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54645 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSNoS-0002wP-RK
	for alex.bennee@linaro.org; Thu, 29 Nov 2018 10:01:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gSNlt-0000Zc-Tz
	for qemu-arm@nongnu.org; Thu, 29 Nov 2018 09:58:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gSNfI-0007v4-39
	for qemu-arm@nongnu.org; Thu, 29 Nov 2018 09:51:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43112)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1gSNf6-0007p2-0U; Thu, 29 Nov 2018 09:51:39 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2E5925F72B;
	Thu, 29 Nov 2018 14:51:27 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 256DC61084;
	Thu, 29 Nov 2018 14:51:21 +0000 (UTC)
Date: Thu, 29 Nov 2018 15:51:19 +0100
From: Andrew Jones <drjones@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181129145119.vuotfa4vogzentv4@kamzik.brq.redhat.com>
References: <20181129132428.333-1-sameo@linux.intel.com>
	<20181129132428.333-8-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20181129132428.333-8-sameo@linux.intel.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 29 Nov 2018 14:51:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 7/8] hw: acpi: Export and
 share the ARM RSDP build
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
X-TUID: YyrP0D2Gg7+j

On Thu, Nov 29, 2018 at 02:24:27PM +0100, Samuel Ortiz wrote:
> Now that build_rsdp() supports building both legacy and current RSDP
> tables, we can move it to a generic folder (hw/acpi) and have the i386
> ACPI code reuse it in order to reduce code duplication.
>=20
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  include/hw/acpi/aml-build.h |  2 ++
>  hw/acpi/aml-build.c         | 50 +++++++++++++++++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c    | 50 -------------------------------------
>  hw/i386/acpi-build.c        | 39 +++++++----------------------
>  4 files changed, 61 insertions(+), 80 deletions(-)
>

Reviewed-by: Andrew Jones <drjones@redhat.com>
