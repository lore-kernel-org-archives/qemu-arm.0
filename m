Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1222936lff;
        Fri, 13 Dec 2019 10:59:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqy4EjF93SjdilAu2/lFFwKCaOUS+FdKWgLJJawgmWAy3BZc9Da8vnFm1FKQycVFuuWkN/BA
X-Received: by 2002:a9d:6e15:: with SMTP id e21mr15952264otr.125.1576263580348;
        Fri, 13 Dec 2019 10:59:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576263580; cv=none;
        d=google.com; s=arc-20160816;
        b=rn6yKZZuNnOnqUJhlhPZqedZgmWFjBepH5x4cquat8GHy4uuiHoHrhWeUPUTM2/SWd
         /ibrX9nZySYEUI/CmRJ5s26HbZVux8A586LYIoODzZqpsQIHoA52KuT5zeU5SzGafH0M
         drcjaRMOCnXG8LzQ3qegDf++KAfjb3jGxFXhgT2yktLgIdN09W5h7zKh7mU++ofrhd3t
         DW84PcgQ3l+sMOyNHK0im+eaZ+u8iCEr+WIggt/uC0EZpb+4oOeSxMjyc27MJUJU/fsC
         lflEvbA9GAreLy8shCCpKMoSzvmo5bLDh36NwVHUhXEXr1m1Caqn673BLgVgJXcvfBxR
         axXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=BTVCt4lo2+JVoxNzS8jAAe82HqlgpftwzzDCvcWKC0o=;
        b=QWrbSi1+P0T7Ue2oSdrIZxLxT+tM1GooSUvonRJNku9st4SNpahn4biKLSIuRjUBd3
         vjrJzGdAw/Vv6/nuQW2WSXqmjFMfA2FdM+Qxh9zOHvc8E87ID6Gaeo5wkmaUkWLLC5pG
         7BWDrouwghVv5fL/kd767W+4NKivai5MwperB9aI8fn2NhaYs8lKtilf1H0hN6tPIjnS
         wWZQzGniXsxUrcMCM3222v1W5EYriV2xme3b0cAJ13/N0q3jPSMyHtlxIDjfJVIpEWz5
         ywL1BLfVjnULYny/qG9mc1WlCf7d6Y1vlzCjlN3hwF0JgOBnBOpGLT3J/RYDof8VbEQW
         xong==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C0i1ltvF;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id c7si2973330otf.34.2019.12.13.10.59.40;
        Fri, 13 Dec 2019 10:59:40 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C0i1ltvF;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728878AbfLMS7j (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Fri, 13 Dec 2019 13:59:39 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45702 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728591AbfLMS7j (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 13 Dec 2019 13:59:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576263577;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=BTVCt4lo2+JVoxNzS8jAAe82HqlgpftwzzDCvcWKC0o=;
        b=C0i1ltvFqwe4zeI7v6E/GFBRKbO6Uy4u0Y2gvP4Ib/JW99SpfBOOD35qBfUk8XZjT3+7z5
        5YyILYHVT2VUhBzNRJhZRtsXVFN/PWBDgTY2wjwV56CNrfN4UyX5aBLA7EzWW9Qf+abQzP
        jI3wMJfrNU/fQIif6jKYSk0iZYEmNq0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-nejDi4YpNM-3UQq70rGOwA-1; Fri, 13 Dec 2019 13:59:33 -0500
X-MC-Unique: nejDi4YpNM-3UQq70rGOwA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D53785B6FD;
        Fri, 13 Dec 2019 18:59:31 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-204-115.brq.redhat.com [10.40.204.115])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 63C8466851;
        Fri, 13 Dec 2019 18:59:18 +0000 (UTC)
Date:   Fri, 13 Dec 2019 19:59:15 +0100
From:   Andrew Jones <drjones@redhat.com>
To:     Eric Auger <eric.auger@redhat.com>
Cc:     eric.auger.pro@gmail.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, andrew.murray@arm.com,
        andre.przywara@arm.com, peter.maydell@linaro.org
Subject: Re: [kvm-unit-tests RFC 03/10] pmu: Add a pmu struct
Message-ID: <20191213185915.7txbnxybupszis7r@kamzik.brq.redhat.com>
References: <20191206172724.947-1-eric.auger@redhat.com>
 <20191206172724.947-4-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191206172724.947-4-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: fyxdFWOIJdsS

On Fri, Dec 06, 2019 at 06:27:17PM +0100, Eric Auger wrote:
> This struct aims at storing information potentially used by
> all tests such as the pmu version, the read-only part of the
> PMCR, the number of implemented event counters, ...
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  arm/pmu.c | 29 ++++++++++++++++++++++++-----
>  1 file changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/arm/pmu.c b/arm/pmu.c
> index 2ad6469..8e95251 100644
> --- a/arm/pmu.c
> +++ b/arm/pmu.c
> @@ -33,7 +33,15 @@
>  
>  #define NR_SAMPLES 10
>  
> -static unsigned int pmu_version;
> +struct pmu {
> +	unsigned int version;
> +	unsigned int nb_implemented_counters;
> +	uint32_t pmcr_ro;
> +};
> +
> +static struct pmu pmu;
> +
> +
>  #if defined(__arm__)
>  #define ID_DFR0_PERFMON_SHIFT 24
>  #define ID_DFR0_PERFMON_MASK  0xf
> @@ -265,7 +273,7 @@ static bool check_cpi(int cpi)
>  static void pmccntr64_test(void)
>  {
>  #ifdef __arm__
> -	if (pmu_version == 0x3) {
> +	if (pmu.version == 0x3) {
>  		if (ERRATA(9e3f7a296940)) {
>  			write_sysreg(0xdead, PMCCNTR64);
>  			report("pmccntr64", read_sysreg(PMCCNTR64) == 0xdead);
> @@ -278,9 +286,20 @@ static void pmccntr64_test(void)
>  /* Return FALSE if no PMU found, otherwise return TRUE */
>  static bool pmu_probe(void)
>  {
> -	pmu_version = get_pmu_version();
> -	report_info("PMU version: %d", pmu_version);
> -	return pmu_version != 0 && pmu_version != 0xf;
> +	uint32_t pmcr;
> +
> +	pmu.version = get_pmu_version();
> +	report_info("PMU version: %d", pmu.version);
> +
> +	if (pmu.version == 0 || pmu.version  == 0xF)
                                            ^ stray space

> +		return false;
> +
> +	pmcr = get_pmcr();
> +	pmu.pmcr_ro = pmcr & 0xFFFFFF80;
> +	pmu.nb_implemented_counters = (pmcr >> PMU_PMCR_N_SHIFT) & PMU_PMCR_N_MASK;
> +	report_info("Implements %d event counters", pmu.nb_implemented_counters);
> +
> +	return true;
>  }
>  
>  int main(int argc, char *argv[])
> -- 
> 2.20.1
> 
