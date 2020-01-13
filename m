Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4399898lff;
        Mon, 13 Jan 2020 09:21:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqyxcFoHuhNin+loiMcLPZ+FF0Z42clUPQMYIIVkUh9NaFOlovb1sFVjY66Es2B1ftMC3gTg
X-Received: by 2002:a9d:5f13:: with SMTP id f19mr14238852oti.180.1578936086382;
        Mon, 13 Jan 2020 09:21:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578936086; cv=none;
        d=google.com; s=arc-20160816;
        b=UhaCBspBHpIxG35idsb24n/C+ULkusg6xCvr0fm+wdpX7cJXYofBzg1saJlvORe4YP
         5rCRGlHjdLfeVp2XAc1DwH3v5mx1ugDmT4bapZuZ/2qwjyAC+c9IAEl5UM8chximbBKF
         naBm8IUiABJk+xOtLzv7AXAY9FHVMLsYsaao/AL+Dl9TSysvR7hge+Z/j3C9Ry530IVc
         Wsu0PnobwWRAa7zVVbiuicS9q9KMporlLluQXE3PgUyiuIs+Pv3dyO0OJjVXjVWsJDw/
         R5MZDUDKEipdoFVVZ6cAZR5HbeHUbM3m+PD3L8X9CRez/8Z91tVjaN08oQiwdRthMNZb
         4bnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=0XkcfwbLbTxexmf9zve6b529lGv2sL04AzlNOtnKRyc=;
        b=X/BZHBo2e13XlHluUXDqhG5ZAmwMb4p2JRvN16yYZa782a/14qTkhbAxQQ3rShodnQ
         wtgqa5LorRYMxTp2e2mwS/J7wKW7Ldtz0ahKegYiMMeIOxYqyD2QmTOQwgex/P2KSe3t
         Us+LvvaZ0PaC0p0u2k/4UQZXD+ze7Jxa5lFZ2+FjKe9/N+8ZTeOq4o6l1857IombUmzJ
         rzf3hqwKgNoH0IRIMxK5PCGjIF6zsLzrIzIvxmRNBusjwsHH3aasYwSIWuh9gdfE4xpN
         0fBGpZ4kNKEvsCitxx2/B1Qj0FRy8vEZeuzgiWAMUOqiapCchxo/y3YvoIsmfjdbYc/D
         UnOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ieuvtBxJ;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id j24si6989067otn.110.2020.01.13.09.21.26;
        Mon, 13 Jan 2020 09:21:26 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ieuvtBxJ;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728668AbgAMRVZ (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Mon, 13 Jan 2020 12:21:25 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27707 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727331AbgAMRVY (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 13 Jan 2020 12:21:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578936083;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0XkcfwbLbTxexmf9zve6b529lGv2sL04AzlNOtnKRyc=;
        b=ieuvtBxJ1WIRzz4G3h/oc9skPax8P+dWqM17hiMfWMDjZuK6rpn/nGgWkstuyKGT8UrceZ
        8LqA2IF7Xhi2xC8aeS+zN4uf8bUT7pyOXTUoYRtorDwKn5738iVPLJResTayniUglA4Kby
        P7ZwZVsMUrCxfZ5m4LqVeGoTK2JfiDI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-Z6U0HnzSMdiwh647B2R61w-1; Mon, 13 Jan 2020 12:21:20 -0500
X-MC-Unique: Z6U0HnzSMdiwh647B2R61w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E923D10054E3;
        Mon, 13 Jan 2020 17:21:17 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F92B60BF1;
        Mon, 13 Jan 2020 17:21:12 +0000 (UTC)
Date:   Mon, 13 Jan 2020 18:21:10 +0100
From:   Andrew Jones <drjones@redhat.com>
To:     Eric Auger <eric.auger@redhat.com>
Cc:     eric.auger.pro@gmail.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: Re: [kvm-unit-tests PATCH v2 06/16] arm/arm64: ITS: Test BASER
Message-ID: <20200113172110.27p3bgozit6djf7k@kamzik.brq.redhat.com>
References: <20200110145412.14937-1-eric.auger@redhat.com>
 <20200110145412.14937-7-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200110145412.14937-7-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: LQ97/GX5m7ZM

On Fri, Jan 10, 2020 at 03:54:02PM +0100, Eric Auger wrote:
> Add helper routines to parse and set up BASER registers.
> Add a new test dedicated to BASER<n> accesses.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v2 -> v3:
> - remove everything related to memory attributes
> - s/dev_baser/coll_baser/ in report_info
> - add extra line
> - removed index filed in its_baser
> ---
>  arm/gic.c                | 21 ++++++++++-
>  arm/unittests.cfg        |  6 +++
>  lib/arm/asm/gic-v3-its.h | 14 +++++++
>  lib/arm/gic-v3-its.c     | 80 ++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 120 insertions(+), 1 deletion(-)
> 
> diff --git a/arm/gic.c b/arm/gic.c
> index adeb981..3597ac3 100644
> --- a/arm/gic.c
> +++ b/arm/gic.c
> @@ -531,11 +531,26 @@ static void test_its_introspection(void)
>  		    typer->collid_bits);
>  	report(typer->eventid_bits && typer->deviceid_bits &&
>  	       typer->collid_bits, "ID spaces");
> -	report(!typer->hw_collections, "collections only in ext memory");
>  	report_info("Target address format %s",
>  			typer->pta ? "Redist basse address" : "PE #");
>  }
>  
> +static void test_its_baser(void)
> +{
> +	struct its_baser *dev_baser, *coll_baser;
> +
> +	if (!gicv3_its_base()) {
> +		report_skip("No ITS, skip ...");
> +		return;
> +	}
> +
> +	dev_baser = its_lookup_baser(GITS_BASER_TYPE_DEVICE);
> +	coll_baser = its_lookup_baser(GITS_BASER_TYPE_COLLECTION);
> +	report(dev_baser && coll_baser, "detect device and collection BASER");
> +	report_info("device baser entry_size = 0x%x", dev_baser->esz);
> +	report_info("collection baser entry_size = 0x%x", coll_baser->esz);
> +}
> +
>  int main(int argc, char **argv)
>  {
>  	if (!gic_init()) {
> @@ -571,6 +586,10 @@ int main(int argc, char **argv)
>  		report_prefix_push(argv[1]);
>  		test_its_introspection();
>  		report_prefix_pop();
> +	} else if (strcmp(argv[1], "its-baser") == 0) {
> +		report_prefix_push(argv[1]);
> +		test_its_baser();
> +		report_prefix_pop();
>  	} else {
>  		report_abort("Unknown subtest '%s'", argv[1]);
>  	}
> diff --git a/arm/unittests.cfg b/arm/unittests.cfg
> index bd20460..2234a0f 100644
> --- a/arm/unittests.cfg
> +++ b/arm/unittests.cfg
> @@ -128,6 +128,12 @@ smp = $MAX_SMP
>  extra_params = -machine gic-version=3 -append 'its-introspection'
>  groups = its
>  
> +[its-baser]
> +file = gic.flat
> +smp = $MAX_SMP
> +extra_params = -machine gic-version=3 -append 'its-baser'
> +groups = its

Do these tests need to be run separately from the its-introspection tests
for some reason? If not, then I'd combine them.

Thanks,
drew
