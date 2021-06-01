Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp3622763lfm;
        Tue, 1 Jun 2021 06:23:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCvHUoDWQ3KC96mbGLTdULxnz0blQDSXvGCOaQ3fgDkUjc7vhr1a4CnD3Qw1lpUaeD8FB/
X-Received: by 2002:a17:906:149b:: with SMTP id x27mr10717865ejc.444.1622553792055;
        Tue, 01 Jun 2021 06:23:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622553792; cv=none;
        d=google.com; s=arc-20160816;
        b=m02nJXjNb6buxybx+pn23mMH6vw6fxCyQ9BX67H2OclX8PjPNxyBSeBfJ+QWCd318y
         zEsXO/Z+8lBBuokWzx8YIE8a6EJSSj8PSg+15Ru1yZVePrif89xm0J46t4H5N1djE4as
         9krQEeO0vPbGUfU/EwCZgmW8D+D/SUt+rW+N9aiv22/3gXh3sb59CfznFGDqcEz6i9+W
         SQDBCVexn14H2KAnb0rwlDC2cernWLelXPLeCknrHcMeAtQWZfHCPUlHll3jG4JGpAHP
         /qRiZ3VW4JfA7E10gERgA+ZeLSH3FDQvnRJyN6AujMj/myPpyUS4dDrwnmRmpvBeBV+/
         chcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=J3IodH3/5b4duTPUMi2lNwYDriGX2oiejhw+9uyi1y0=;
        b=JbawcE4Omp1G3PXGUwkCUI1vJl+D1n4Ne6ahzBrQ/nCWPQ5EHf6jxBc23mmcCJzwtH
         2K3KOWbdNrk1GIEgocJ99uYqcOt65y4v90yUIEVcEzXo84qrRkezD3WAORUlP+QXxFAF
         n9poP2LGVauqqRvkcaGcU87GBKCn5MsZ82VI3Ecy8/oqvE9YRpfhNSbcGzqjwIeyFMCo
         iGOVLnYj0TcoepGUwp1AdBUEP4kByLeyhPy/bjQajrsSZeH1PXpYSLrkv0XNOogJRr4h
         /G5zdqFQQpnlFW7/wl3xudjUsQOMB50rLZUVbLwvpSshtfldXJVeH6T9MNf0R+yLEJ0I
         sthQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IJJv3mru;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id p11si11686465edx.117.2021.06.01.06.23.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Jun 2021 06:23:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IJJv3mru;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622553791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J3IodH3/5b4duTPUMi2lNwYDriGX2oiejhw+9uyi1y0=;
	b=IJJv3mruEdmwfYQc2QriEe9sM+d7CN1SCIdwXLJT6xmmI1pnVIOP6XRVMAu+k7LLsQbqlq
	sOCvXxBnx7aSZt7n1wWFAKTvVeyVDc9PkMoy843ecYdSSc7G1FE318PbQ1dxbLoFCkcLlK
	Ghw9Ekk7rBUUBVbm4ZDnPawnHH9hz74=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-zZiJq6tsPBOcjruSWaHkVw-1; Tue, 01 Jun 2021 09:23:09 -0400
X-MC-Unique: zZiJq6tsPBOcjruSWaHkVw-1
Received: by mail-ed1-f70.google.com with SMTP id h23-20020aa7c5d70000b029038fed7b27d5so1511825eds.21
        for <alex.bennee@linaro.org>; Tue, 01 Jun 2021 06:23:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=J3IodH3/5b4duTPUMi2lNwYDriGX2oiejhw+9uyi1y0=;
        b=C3RjKfoHkrgqZcsKxeRouXf/5o1ghURBWvEJdy+pf8nk1d2Gj3Tl47THBiY2e1SS/z
         3ZkbqJM8R+ZdVQPj/6qMiCedyQrPWt9nuzkihYjdhYRFjm2uA/54xFe9pz6vfnmnvtaf
         SCSzjBY8uLloiRo/gC8MzhZHNrSj0Vz77F6h52s0VicGXneXb9IucdZZvCRgeLousOY4
         1XG9IpKx3Jk65HE2UKeLNDgmQbzj6+6MnFfJca0fyosv372xzjO9W/4AAh/T/VKxzHRC
         hQE0MJKUKBY1MN097h83zO/B4ZVczd1BmYU1F0xq+lKGCbO6/x7vzsFHV4h4UId3Gy+u
         wtPQ==
X-Gm-Message-State: AOAM530LtSrbfzE7MzZwGcPpOKxXhCqm5RsdD21FvPU9/2rVDcdb9+vw
	+P82oRn0MS73E+vgpMNWsnvu6ujA12bKGR8NU/yhVYYFwWCR90zc7uto7B6FfVgsJFpF0hq7Vx2
	8ArwQW9mEHyNSk85AXWgx1q23FMwplpJRmfAvPUMTe+00tVW6r1Tbe3yiJAjt/8+P+XA=
X-Received: by 2002:a17:906:dffc:: with SMTP id lc28mr15927688ejc.96.1622553787981;
        Tue, 01 Jun 2021 06:23:07 -0700 (PDT)
X-Received: by 2002:a17:906:dffc:: with SMTP id lc28mr15927655ejc.96.1622553787709;
        Tue, 01 Jun 2021 06:23:07 -0700 (PDT)
Return-Path: <drjones@redhat.com>
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
        by smtp.gmail.com with ESMTPSA id w14sm8639958edj.6.2021.06.01.06.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 06:23:07 -0700 (PDT)
Date: Tue, 1 Jun 2021 15:23:05 +0200
From: Andrew Jones <drjones@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: kvm@vger.kernel.org, maz@kernel.org, shashi.mallela@linaro.org,
	qemu-arm@nongnu.org, kvmarm@lists.cs.columbia.edu,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [kvm-unit-tests PATCH v2 3/4] arm64: enable its-migration tests
 for TCG
Message-ID: <20210601132305.3r5x456icpaa454h@gator.home>
References: <20210525172628.2088-1-alex.bennee@linaro.org>
 <20210525172628.2088-4-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210525172628.2088-4-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: E0Co+iigP75d

On Tue, May 25, 2021 at 06:26:27PM +0100, Alex Bennée wrote:
> With the support for TCG emulated GIC we can also test these now.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  arm/unittests.cfg | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arm/unittests.cfg b/arm/unittests.cfg
> index f776b66..1a39428 100644
> --- a/arm/unittests.cfg
> +++ b/arm/unittests.cfg
> @@ -194,7 +194,6 @@ arch = arm64
>  [its-migration]
>  file = gic.flat
>  smp = $MAX_SMP
> -accel = kvm
>  extra_params = -machine gic-version=3 -append 'its-migration'
>  groups = its migration
>  arch = arm64
> @@ -202,7 +201,6 @@ arch = arm64
>  [its-pending-migration]
>  file = gic.flat
>  smp = $MAX_SMP
> -accel = kvm
>  extra_params = -machine gic-version=3 -append 'its-pending-migration'
>  groups = its migration
>  arch = arm64
> -- 
> 2.20.1
> 
> _______________________________________________
> kvmarm mailing list
> kvmarm@lists.cs.columbia.edu
> https://lists.cs.columbia.edu/mailman/listinfo/kvmarm


Reviewed-by: Andrew Jones <drjones@redhat.com>
