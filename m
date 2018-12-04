Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8160231wrt;
        Tue, 4 Dec 2018 06:54:09 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UOofuOd6SSFYdZeILv3WWsp6ye3/IxM1DjiNHO9EV98jqTNNgJG0fmrzooQgkQJ7JW1zNR
X-Received: by 2002:a37:2704:: with SMTP id n4mr18668535qkn.349.1543935249614;
        Tue, 04 Dec 2018 06:54:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543935249; cv=none;
        d=google.com; s=arc-20160816;
        b=c2h0JJc+Ux4802sdred79LzaFiefiMHY6YgaUL/kw4bTRutN2iFQFgRhipmMDZTL6N
         TjWKfmT3n+yXOPc28tzpuayMVw/mshxaV1d+vfNdr4Qn+8wJbg5W18Lu3NDZZFUsfZ7d
         lHUUsODCLiEVLyrbQ4DqezBQu4UuLSO3PkQa+8tjqbTQX8MmQkWA27bExHHuk/sH3JGp
         hyG4k9sZxfAJYVFvnjlT7ZKuJADi7/aNQtev92ZzUD3M/uP+OaD8syvmoDvSfWOON3ax
         R/g43bjGL6hFmXRD33PS2gdy7C0u6S17lQQrK1pnu9cMpHewVA40/0uIl3t7+itrM3i6
         1cWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=h9fkVArQpt6jI5ZodwvhK2j9pVD907R2ZV0PDzImeoo=;
        b=y7G1qjkoac1Gj1g3e5uv38gBv1pTomd9ftZxYbgYUFPYMf/ynijxtVMRta/zgy9xzm
         mXu2HY+0HdsCMSs2kKSQhMf5hSbBaUXHpDk59BDm1ZnH1prty4387wgJ3FHmJNCMPhCD
         ozLx9Gny3HPq4l39hmfQY/90ODL4sXsQdDcd28b/5x4rD6oTgL278yjoFVCBv3GYTs69
         Wlsgng3iF/vuSPgHkPOkkerITY+n+D3bveNaVjUNIaP2gzXDH8FayWSvIs39uul8dk8S
         etIoTng7xJebSlkLI8AYEOKDRWJwV2ROjPWyniD2LmMmItEobUsaQGNijUXh3UeAEvDR
         za3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d2si7167527qtl.198.2018.12.04.06.54.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 06:54:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57274 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUC5Q-0003z6-U0
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 09:54:08 -0500
Received: from eggs.gnu.org ([208.118.235.92]:41385)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gUC5H-0003yy-Gi
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 09:54:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gUC5D-00024j-HQ
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 09:53:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39626)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1gUC5D-00024R-C7; Tue, 04 Dec 2018 09:53:55 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F7AC30832E8;
	Tue,  4 Dec 2018 14:53:54 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 052C427C3B;
	Tue,  4 Dec 2018 14:53:43 +0000 (UTC)
Date: Tue, 4 Dec 2018 15:53:41 +0100
From: Andrew Jones <drjones@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181204145341.ii67fzma5l5j443y@kamzik.brq.redhat.com>
References: <20181130130032.11835-1-sameo@linux.intel.com>
	<20181130130032.11835-7-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181130130032.11835-7-sameo@linux.intel.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Tue, 04 Dec 2018 14:53:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 6/8] hw: arm: Support both
 legacy and current RSDP build
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
X-TUID: QmsjidnwXTYB

On Fri, Nov 30, 2018 at 02:00:30PM +0100, Samuel Ortiz wrote:
> We add the ability to build legacy or current RSDP tables, based on the
> AcpiRsdpData revision field passed to build_rsdp().
> Although arm/virt only uses RSDP v2, adding that capability to
> build_rsdp will allow us to share the RSDP build code between ARM and x86.
> 
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c | 39 ++++++++++++++++++++++++++++++++++-----
>  1 file changed, 34 insertions(+), 5 deletions(-)
>

Reviewed-by: Andrew Jones <drjones@redhat.com>
