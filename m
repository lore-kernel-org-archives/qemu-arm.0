Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp513420wrp;
        Fri, 13 Sep 2019 02:21:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzquxAhOV1VE/SS6ZPsiLp7qZ2L9WT7I5eOJm1VugJhS+Z4vMZXbT5HkhXDe8s3AzSG/Rz/
X-Received: by 2002:ac8:3a86:: with SMTP id x6mr1846327qte.316.1568366478723;
        Fri, 13 Sep 2019 02:21:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568366478; cv=none;
        d=google.com; s=arc-20160816;
        b=uuQdkye+CCQCn3yPMzgOkgdeWF23Fr9WGXA1YCHk4y1nlf2HUa6CsaRKK0gBo0hgv8
         8FsNUEIXWvZCwn9rO5I6F8VgQk4abZb6S1prIRBuVwhqeldoAYJ2iAa6+bLs1LMPv68v
         6hAqHcXMFYt5XrX5umsHlikgCNXtxdSCNexg0xFvikw1LrOyrXCTU5NUPkgJ9rX5xoXV
         QLIitnEd59GZDt3T9Y7BS6tK07Wpj16umEbekI/lOepEJPkCIauEvxoqvMpxOEx273oI
         Jx9vDWLuIph5+aVP+lwTPpoxjWGwXpBLonxwmef1HXMv6bLtiuzTBRM9Slnw0yxoBCDl
         N9ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=yWem71EIGuGIPvvoTjEAqNT797zDB1ddsWSP4XSEeyI=;
        b=TWCgD7+VAOjallvb+Q+dldXYrrFoVQpsvWVHMG+l7VEMLgOBt6nX3Y5bT5j/clzHf2
         CAemAXkG1nvusYZt34rgJdWB7GiqJD3xlUM7hTt2fIjWXJ8tzicDs5ETwB8fUgYRSw6t
         qLtAGB/7G4lfXfftjyffuKw/DP9yuUTjJx2+3IsUbqTe/ZWQeOpsib4HHxFWNjq0+UMR
         oUjwrNTsnP4DifJWoAMiNhTFlKVJhwQknEGYcL+AWbYOSEilX57ZOcUJA9jM+bdHDm82
         AIPMIzwrCDHeZ5/t8vFVp8mcK+mj58xMcQ1LBmMgV8QefLef3dVnXX1gk2k5LRACGcX6
         ftPA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r66si19188687qkb.44.2019.09.13.02.21.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Sep 2019 02:21:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i8hlW-0002ss-7G
	for alex.bennee@linaro.org; Fri, 13 Sep 2019 05:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53552)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1i8hlO-0002si-VR
 for qemu-arm@nongnu.org; Fri, 13 Sep 2019 05:21:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1i8hlO-0005IW-4K
 for qemu-arm@nongnu.org; Fri, 13 Sep 2019 05:21:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43664)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1i8hlN-0005IE-VS; Fri, 13 Sep 2019 05:21:10 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 805BE8980FB;
 Fri, 13 Sep 2019 09:21:08 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB22B60600;
 Fri, 13 Sep 2019 09:20:57 +0000 (UTC)
Date: Fri, 13 Sep 2019 11:20:55 +0200
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190913092055.kxvwzzmwp5mra3gh@kamzik.brq.redhat.com>
References: <20190913083615.14719-1-eric.auger@redhat.com>
 <20190913083615.14719-4-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190913083615.14719-4-eric.auger@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Fri, 13 Sep 2019 09:21:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 3/6] exec: assert on
 memory_region_register_iommu_notifier() failure
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com, alex.williamson@redhat.com, qemu-arm@nongnu.org,
 pbonzini@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tEqgeB0nN9qq

On Fri, Sep 13, 2019 at 10:36:12AM +0200, Eric Auger wrote:
> memory_region_register_iommu_notifier now returns an error
> in case of failure. Assert in such a case.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  exec.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/exec.c b/exec.c
> index 235d6bc883..da30251a2b 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -692,7 +692,8 @@ static void tcg_register_iommu_notifier(CPUState *cpu,
>                              0,
>                              HWADDR_MAX,
>                              iommu_idx);
> -        memory_region_register_iommu_notifier(notifier->mr, &notifier->n);
> +        assert(!memory_region_register_iommu_notifier(notifier->mr,
> +                                                      &notifier->n));

 ret = memory_region_register_iommu_notifier(notifier->mr, &notifier->n);
 assert(!ret);

to avoid functions with side effects being called inside assert()'s, as
assert()'s could be compiled as no-ops.

Same comment for next patch.

Thanks,
drew

>      }
>  
>      if (!notifier->active) {
> -- 
> 2.20.1
> 
> 
