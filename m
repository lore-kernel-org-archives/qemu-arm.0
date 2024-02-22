Received: by 2002:a17:906:2317:b0:a3e:79c1:d636 with SMTP id l23csp133159eja;
        Thu, 22 Feb 2024 01:43:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW+GDKUKbBHwg9iN+PAzycJw3KhbCL0krthHgEQTrMsI2WyPejbNT7zl3lG+bHuvaijh01QBd06vmxZXlzapKZZXmKNEv8B
X-Google-Smtp-Source: AGHT+IELj93d0L67q2M/Q9WTuw947ePW1veRtCskbMsl01DHeNFJs2NLy9NlXCexgFhjikrnDZ6h
X-Received: by 2002:a25:aaac:0:b0:dcc:3a23:8a20 with SMTP id t41-20020a25aaac000000b00dcc3a238a20mr1925379ybi.42.1708595013905;
        Thu, 22 Feb 2024 01:43:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708595013; cv=none;
        d=google.com; s=arc-20160816;
        b=EzT1cqy1VnNL6upJaq0+p/PWTDDbtP8hhQR23oEVPVhuQ0FUN7vywNIhKlVNO4/9QW
         DRdDLygwxuPjTvRrf3xIUi7ftBnUHVJaBirjvmXOBrCb+EMGgGkjub134SQC8pOrhMWT
         UD89RFqwH4ChBsbx0LpTtKGa9ZG8/Q4FWRQTL5VPfpWn/pqn0pFTF5ZC1jipPHlWecoj
         Zts8XnFaPjHsD1IODyF97y/UDy82P5z1TbNML62skEMZVjkvBoCWM0MSLr6ZD+Z7VV1H
         DP+mqMcgVdsvRslIXh7SmxXbC3DB7oULFxatzrSQ8FXikmkTz/WXfHPygk+seRdVEBCN
         HVOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=5hMdJKptxKpq97gQtdEapt4obI5KN0NlBOtR3sErdiw=;
        fh=YncejYJTruau1aTrwkNKZceekwa4rqP+00xPhh7s3zw=;
        b=iK3mAB/Ro69Out5WmqXtHipXYpcoTVKVwHwgiphXyBwtfmQgKSYDmpJrxecClBV446
         EviU3s4x9ml0K7AkjfpHsp8EHL1THCZyHleeYsqhDZ5m+zryd44C0rFYul/dYGbUYT9A
         hq0KNjHZls4/ufSri71cfUfJXpt7pLErSEYcAEQvEq+c8uza3hy22QcUeJK5SldEz2mE
         Ui9l1xqCzXkj6jI9sdUU/ZOA7IWxYa5qPgqjHhzQmPFho1HJeY+8K7iUmLjxs0YvC3qb
         gAySgvr+aCX4JZhGeKQKXFwfHVAfW8aHuIN06YmlVn3HIy7woXYzZpWhPG5OcMdfH6yU
         AJ+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=HvxZ7SSy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f24-20020ac84998000000b0042e2b4fbdccsi4629556qtq.689.2024.02.22.01.43.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 01:43:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=HvxZ7SSy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rd5br-0004fQ-LA; Thu, 22 Feb 2024 04:43:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1rd5bq-0004eC-4i; Thu, 22 Feb 2024 04:43:18 -0500
Received: from mgamail.intel.com ([192.198.163.7])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1rd5bo-0005Aj-M2; Thu, 22 Feb 2024 04:43:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708594997; x=1740130997;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=IBPgxBEpIJj/+jCChNv2u4FJt0jG9vpTC9/aQPVRmx4=;
 b=HvxZ7SSyeph8bpabyZqrCUgC/jjJ1qGIYquPXEwOfjLC17ZrTUHlWY1Q
 F8ZZFSTtzHeqo3bYj/I54au9il9JCX1NvqHeHmOjsehs94o5svEDVuchb
 PfRODSRGBpfa3BnsYbGrz/WEv9C86sOMeQINL4oq7cylY3D65rvQzDyqj
 VPJUufM2AQNroK0ZApzgRIKoe9oD4R+9/JJhDObPetQfAMLAkJ2LNlISF
 6RTv2t4IZo2rYmnVHyOU6Qjs40qJ1eD4tzvxQgnev5m9D64ZdNIMPsrFE
 /5OqP1UiGwsvgKROPRVOjqO7fK8BAD5STpSdFu5I1l9JxpWB00ZnxXUgM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="28250062"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="28250062"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 01:43:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5402604"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.36])
 by fmviesa010.fm.intel.com with ESMTP; 22 Feb 2024 01:43:10 -0800
Date: Thu, 22 Feb 2024 17:56:50 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>
Subject: Re: [PATCH 03/21] hw/ppc/spapr_cpu: Use qdev_is_realized() instead
 of QOM API
Message-ID: <ZdcaYsPpzGp0Rej8@intel.com>
References: <20240216110313.17039-1-philmd@linaro.org>
 <20240216110313.17039-4-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240216110313.17039-4-philmd@linaro.org>
Received-SPF: pass client-ip=192.198.163.7; envelope-from=zhao1.liu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fmh05ljW3Nfv

On Fri, Feb 16, 2024 at 12:02:54PM +0100, Philippe Mathieu-Daudé wrote:
> Date: Fri, 16 Feb 2024 12:02:54 +0100
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH 03/21] hw/ppc/spapr_cpu: Use qdev_is_realized() instead of
>  QOM API
> X-Mailer: git-send-email 2.41.0
> 
> Prefer QDev API for QDev objects, avoid the underlying QOM layer.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/ppc/spapr_cpu_core.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

> 
> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> index 0c0fb3f1b0..40b7c52f7f 100644
> --- a/hw/ppc/spapr_cpu_core.c
> +++ b/hw/ppc/spapr_cpu_core.c
> @@ -245,8 +245,7 @@ static void spapr_cpu_core_unrealize(DeviceState *dev)
>               * spapr_cpu_core_realize(), make sure we only unrealize
>               * vCPUs that have already been realized.
>               */
> -            if (object_property_get_bool(OBJECT(sc->threads[i]), "realized",
> -                                         &error_abort)) {
> +            if (qdev_is_realized(DEVICE(sc->threads[i]))) {
>                  spapr_unrealize_vcpu(sc->threads[i], sc);
>              }
>              spapr_delete_vcpu(sc->threads[i]);
> -- 
> 2.41.0
> 
> 
