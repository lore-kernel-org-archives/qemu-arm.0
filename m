Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp997647wrq;
        Fri, 15 Jun 2018 08:42:33 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJh+klaOgO7ntcRtTVUiAPxZQKv/6ZEH8eaWKnVEbykOdUX4wSzFVLR3z6ekLwiccSYvTQz
X-Received: by 2002:a0c:e642:: with SMTP id c2-v6mr1914386qvn.56.1529077353891;
        Fri, 15 Jun 2018 08:42:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529077353; cv=none;
        d=google.com; s=arc-20160816;
        b=WvpVEWWN3ZhYrtZwEa1d3P9Vo4BwTtqcpRvzhBYx0aKoOBoCvYf+HzUZ0lvtuHfOfo
         VRiIt27TaGIW34DGwwQy+e46FJaOJ+inlDKbKYJJg0XTCZhTch74RJOn9K8ta4p92z7/
         Zy637q+JyZzSZMfQ699qpOzaTvnNL7/xe3QoRHpPmXm/DoDgEXU+op6jKvgcNeXxC7ka
         qgOPik21s3HIsmjhnXjGqqrd9xx+h4EbhRHRy/Q9jiQZyDsNJN4TzP5Kct0RN72Nz0l4
         uwsrC0seC2bVBcyxkFfO/n2u8FF49/cpCbdQwAqcqeqjEwhWwPbLybBKvTEGKBeuGDzq
         gnmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=ap1p+fh5FpR3D1kWYXipVy+3lhFMhXw1mRpYQhtX9Ig=;
        b=Vm8Xbg22NrB2MRuoF8psVnetju3z1Sa+ETveqLuPo6+0+iTO46FGltUwzfWa+IP2SU
         cVzYFe7CMM2+lCjfKfcoGDC2r3XfP09jbXimU71aJmi+pnrEC7UhpqPGW6mRptqLeIjL
         E3siQncJ94PIL9swvtLWSCaJ7uG1j8Y6oTkgAzkkgApnu5MmvALOUCD8Aw9vQT9xmbm8
         selZPSwSTaFXr0MnACQcDAFCl4JwMoO3X49Rf9fBpABaC5WWTTbHCiId06Z6gzZE/O04
         o5AQhRgZCi12lSggKAiL/jsE7THIsQ06TwrJL+dhAz/3qWuvXmc8djsW1k+nkgBQIktX
         Ko8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i44-v6si3742909qte.148.2018.06.15.08.42.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 08:42:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47640 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTqrx-0001A9-Ah
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 11:42:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51087)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fTqdB-0005AJ-TY
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 11:27:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fTqd6-0007iD-VQ
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 11:27:17 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:52612 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1fTqd6-0007hy-RD; Fri, 15 Jun 2018 11:27:12 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 50ED680125D6;
	Fri, 15 Jun 2018 15:27:12 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92464210C6D1;
	Fri, 15 Jun 2018 15:27:10 +0000 (UTC)
Date: Fri, 15 Jun 2018 17:27:08 +0200
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20180615152708.t2aa2p5lzuzexwjy@kamzik.brq.redhat.com>
References: <1529072910-16156-1-git-send-email-eric.auger@redhat.com>
	<1529072910-16156-4-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1529072910-16156-4-git-send-email-eric.auger@redhat.com>
User-Agent: NeoMutt/20180512
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Fri, 15 Jun 2018 15:27:12 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Fri, 15 Jun 2018 15:27:12 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v2 03/11] hw/intc/arm_gicv3: Introduce
 redist-region-count array property
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
Cc: peter.maydell@linaro.org, ard.biesheuvel@linaro.org, marc.zyngier@arm.com,
	qemu-devel@nongnu.org, christoffer.dall@arm.com,
	qemu-arm@nongnu.org, zhaoshenglong@huawei.com, lersek@redhat.com,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KCFCy5GTx6jt

On Fri, Jun 15, 2018 at 04:28:22PM +0200, Eric Auger wrote:
> To prepare for multiple redistributor regions, we introduce
> an array of uint32_t properties that stores the redistributor
> count of each redistributor region.
> 
> Non accelerated VGICv3 only supports a single redistributor region.
> The capacity of all redist regions is checked against the number of
> vcpus.
> 
> Machvirt is updated to set those properties, ie. a single
> redistributor region with count set to the number of vcpus
> capped by 123.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> v2 -> v3:
> - add missing return in arm_gic_realize
> - in gicv3_init_irqs_and_mmio, compute/check rdist_capacity first
> - rdist region 0 size set to MIN(smp_cpus, redist0_capacity)
> - add GICV3_REDIST_SIZE
> ---
>  hw/arm/virt.c                      | 11 ++++++++++-
>  hw/intc/arm_gicv3.c                | 12 +++++++++++-
>  hw/intc/arm_gicv3_common.c         | 38 +++++++++++++++++++++++++++++++++-----
>  hw/intc/arm_gicv3_kvm.c            |  9 +++++++--
>  include/hw/intc/arm_gicv3_common.h |  8 ++++++--
>  5 files changed, 67 insertions(+), 11 deletions(-)
>

Reviewed-by: Andrew Jones <drjones@redhat.com>
