Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp2650758lfi;
        Thu, 5 Mar 2020 00:53:59 -0800 (PST)
X-Google-Smtp-Source: ADFU+vuHbwHy3zrj6wvm4g6HZObLNeSXLT8xXTtY3Qh4pDG5tF/lwj7Krhf6mphzO/vgaIpgmoNC
X-Received: by 2002:a05:6830:22ca:: with SMTP id q10mr6224746otc.280.1583398438933;
        Thu, 05 Mar 2020 00:53:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583398438; cv=none;
        d=google.com; s=arc-20160816;
        b=zqAozT7BCRCVySlG4tGLDNxYOqTxAcdeSLLu8ugZYXmTFvwicGzHFlqWVhA6Vwk6YQ
         GRdzAF4jhTu2ejd4dL8sfB+kXoDtiPxng/zyA+wFUGMTnswaUOllvL+DAJvqlOP3ZML2
         bwGoK1UhOTgGxjkReN9jss7iXZWObadHxQslLaOg0zL8lETqkR2QhaBddqwS43Sqk+hF
         ezZ2I0eZujHWqsY8DHxoqlinShw9DzrdwSnr6r6qE1TUaXRqnTFtLFzstXoyI4AjDfDf
         5YQtwpknnwiwz0fiL2/4xfxNhgtk5Zu6gfYDIKzirs/9kP6KDrQj+jx+9uRZSeF0MvkW
         IbbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=REwAfEqoAMNUtUrRyylagH0asZ7fuhCqPFcvT/oML0s=;
        b=RE+41B0wwXCcpdeYEyGWymnDfwB1DUB9ZLXjEzAlluSNKBE2Bo9oQfD2N+ofq1Gzo6
         3gWHX6+/QVpo3x17A2zzMlP0OhC7XK6CLM0BXdPyfs/ETZwSs3nuqfh55wUkkqtW0peN
         eJucBEWt8EtWVTo7UknI00Q972NLl2A82nrxHlg+z+4XjUJ/4UCs88B6At+Ij+I651BI
         KiyUq0D5frhoBSuOB3jTU6md7dfWi5IPsX8jx12oUVamJi3Sc/I7qGfPW5H8+c1eNbK7
         t0WylSc/ufVnuCIR6qc+koDMWDR0CqB8GxItRR8GGRjQq1LbG2xj4h7rlSSDwOO2wl27
         IOPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Bay0Jdqq;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id m7si3142316oie.138.2020.03.05.00.53.58;
        Thu, 05 Mar 2020 00:53:58 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Bay0Jdqq;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726036AbgCEIx6 (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 5 Mar 2020 03:53:58 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26501 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725816AbgCEIx5 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 5 Mar 2020 03:53:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583398436;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=REwAfEqoAMNUtUrRyylagH0asZ7fuhCqPFcvT/oML0s=;
        b=Bay0JdqqcoCnaeufJ7s8jhWSYRVMnmeyrzdBzNiBcBbO6ldEH7NqKYLKX7MJL2RVmPEtJQ
        5KzUTByh8MiYDkCxR93XxfsDAvbdYJHs1m17hSklF1seA4ymlwSkPpgBXVYMdf94HL/Q3D
        JGuhCFiBY1XFKwYeU9l+ippAsgeNJMk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-JRYXs1EUPCq2MT_nKzgVwg-1; Thu, 05 Mar 2020 03:53:54 -0500
X-MC-Unique: JRYXs1EUPCq2MT_nKzgVwg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86DC31093839;
        Thu,  5 Mar 2020 08:53:52 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-204-110.brq.redhat.com [10.40.204.110])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 4683D92D00;
        Thu,  5 Mar 2020 08:53:46 +0000 (UTC)
Date:   Thu, 5 Mar 2020 09:53:43 +0100
From:   Andrew Jones <drjones@redhat.com>
To:     Eric Auger <eric.auger@redhat.com>
Cc:     eric.auger.pro@gmail.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org,
        peter.maydell@linaro.org, andrew.murray@arm.com,
        alexandru.elisei@arm.com, andre.przywara@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 3/9] arm: pmu: Add a pmu struct
Message-ID: <20200305085343.g4li2y2prnlyapx2@kamzik.brq.redhat.com>
References: <20200130112510.15154-1-eric.auger@redhat.com>
 <20200130112510.15154-4-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200130112510.15154-4-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 7aAXCOahxsPI

On Thu, Jan 30, 2020 at 12:25:04PM +0100, Eric Auger wrote:
> This struct aims at storing information potentially used by
> all tests such as the pmu version, the read-only part of the
> PMCR, the number of implemented event counters, ...
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  arm/pmu.c | 30 +++++++++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/arm/pmu.c b/arm/pmu.c
> index e5e012d..d24857e 100644
> --- a/arm/pmu.c
> +++ b/arm/pmu.c
> @@ -33,7 +33,14 @@
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
>  #if defined(__arm__)
>  #define ID_DFR0_PERFMON_SHIFT 24
>  #define ID_DFR0_PERFMON_MASK  0xf
> @@ -265,7 +272,7 @@ static bool check_cpi(int cpi)
>  static void pmccntr64_test(void)
>  {
>  #ifdef __arm__
> -	if (pmu_version == 0x3) {
> +	if (pmu.version == 0x3) {
>  		if (ERRATA(9e3f7a296940)) {
>  			write_sysreg(0xdead, PMCCNTR64);
>  			report(read_sysreg(PMCCNTR64) == 0xdead, "pmccntr64");
> @@ -278,9 +285,22 @@ static void pmccntr64_test(void)
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
> +	if (pmu.version == 0 || pmu.version == 0xF)
> +		return false;
> +
> +	pmcr = get_pmcr();
> +	pmu.pmcr_ro = pmcr & 0xFFFFFF80;

I'd prefer we spell out what fields we consider RO. Also this mask doesn't
seem right to me. BIT[7] isn't RO, is it?

> +	pmu.nb_implemented_counters =
> +		(pmcr >> PMU_PMCR_N_SHIFT) & PMU_PMCR_N_MASK;
> +	report_info("Implements %d event counters",
> +		    pmu.nb_implemented_counters);
> +
> +	return true;
>  }
>  
>  int main(int argc, char *argv[])
> -- 
> 2.20.1
> 
> 
