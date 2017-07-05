Received: by 10.25.44.15 with SMTP id s15csp625146lfs;
        Wed, 5 Jul 2017 04:44:53 -0700 (PDT)
X-Received: by 10.237.53.164 with SMTP id c33mr58789299qte.191.1499255093170;
        Wed, 05 Jul 2017 04:44:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499255093; cv=none;
        d=google.com; s=arc-20160816;
        b=qjo48P+PfiECw+1xM7myEWTPvPR2RXBbrPQKyxAsJWE2V0qSkjJaMo6hFXaiHtViQK
         kaCE6+xRZZ8J2zmyEG2jfPP0dcrlAPwOP3kibe+c3XKFHSH25aMCIMduhlOrm1tod2KA
         4Kzd/aY6aTspUHzJT4ORF8LUk1vacFVsBcfR//n1NtQG+oHSXssO8SFfw3e/qgeryC/2
         6SpCcsabv1FXgd3XQOuvFbgRBexK6KFB/t0RvIv65dzvdsLIQ/Ym7qOEBLEDhkTLY3hO
         zMGRZlYoZXDS1Bhf2uNVieI9C32c6pmjEToccH+/RB/z5AkASJQI6YiCr2vgfncvRV1t
         qsSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from:dkim-filter
         :dmarc-filter:arc-authentication-results;
        bh=6q1faRdHHs5A7xGOnq/NQTpCMQFr8x1ZILwJlN6galc=;
        b=ixCqB/boja5RJ4cHfl/Yp/B6C+dQdOihing1BiAMm/N89A2QeTbt3qI9KbJ0MNhIde
         HKKwDv4Tnx+0mbahLrrxGc7haiofwnM5SP1cc7Gcj5dL47ODlU0gc1KmbxuwfQAqpsXP
         xM7TEiUQU1TKQUhuOUuBgc5RgVs1zd+YqZngTG5Ia2XOeeGEf24sJvfrcsU82GWeow0l
         iL1Su102SqFfIDbA83hUwqM+Cjx1da0GM404toZ4JvztxSyw5a7W1TLi4hwPGl3RTLvm
         KSGpy1nezvIInVR6giQv7XY6DNzl67oiJ8xzRlpt7BK47EdBrV503V7htuK7bInRm8so
         f2DA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t41si20557238qtg.226.2017.07.05.04.44.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Jul 2017 04:44:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45551 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dSiji-0001wX-Gy
	for alex.bennee@linaro.org; Wed, 05 Jul 2017 07:44:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dSijc-0001uk-12
	for qemu-arm@nongnu.org; Wed, 05 Jul 2017 07:44:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dSijX-0008IJ-I3
	for qemu-arm@nongnu.org; Wed, 05 Jul 2017 07:44:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60192)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1dSijX-0008FA-6n; Wed, 05 Jul 2017 07:44:39 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8C92161B85;
	Wed,  5 Jul 2017 11:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8C92161B85
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 8C92161B85
Received: from blackfin.pond.sub.org (ovpn-116-60.ams2.redhat.com
	[10.36.116.60])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B72D60A99;
	Wed,  5 Jul 2017 11:44:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 6C3921138619; Wed,  5 Jul 2017 13:44:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20170608133906.12737-1-ehabkost@redhat.com>
	<20170608133906.12737-2-ehabkost@redhat.com>
Date: Wed, 05 Jul 2017 13:44:35 +0200
In-Reply-To: <20170608133906.12737-2-ehabkost@redhat.com> (Eduardo Habkost's
	message of "Thu, 8 Jun 2017 10:39:02 -0300")
Message-ID: <87fuebrtuk.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 05 Jul 2017 11:44:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/5] xilinx: Fix error handling
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zdc+LezyK3Aw

Eduardo Habkost <ehabkost@redhat.com> writes:

> Assigning directly to *errp is not valid, as errp may be NULL,
> &error_fatal, or &error_abort.  Use error_propagate() instead.
>
> error_propagate() handles non-NULL *errp correctly, so the
> "if (!*errp)" check can be removed.
>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Alistair Francis <alistair.francis@xilinx.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  hw/dma/xilinx_axidma.c  | 4 +---
>  hw/net/xilinx_axienet.c | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
> index 6065689ad1..3987b5ff96 100644
> --- a/hw/dma/xilinx_axidma.c
> +++ b/hw/dma/xilinx_axidma.c
> @@ -554,9 +554,7 @@ static void xilinx_axidma_realize(DeviceState *dev, Error **errp)
>      return;
>  
>  xilinx_axidma_realize_fail:
> -    if (!*errp) {
> -        *errp = local_err;
> -    }
> +    error_propagate(errp, local_err);
>  }
>  
>  static void xilinx_axidma_init(Object *obj)
> diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> index b6701844d3..5ffa739f68 100644
> --- a/hw/net/xilinx_axienet.c
> +++ b/hw/net/xilinx_axienet.c
> @@ -981,9 +981,7 @@ static void xilinx_enet_realize(DeviceState *dev, Error **errp)
>      return;
>  
>  xilinx_enet_realize_fail:
> -    if (!*errp) {
> -        *errp = local_err;
> -    }
> +    error_propagate(errp, local_err);
>  }
>  
>  static void xilinx_enet_init(Object *obj)

The qdev core always passes &err.  So this is "merely" a fix for a
latent bug.

If it could pass null, you'd fix a crash bug.

If it could pass pointer to non-null (&error_fatal, &error_abort), you'd
plug a memory leak.

Suggest to rephrase the commit message:

    xilinx: Fix latent error handling bug

    Assigning directly to *errp is not valid, as errp may be null,
    &error_fatal, or &error_abort.  The !*errp conditional protects
    against the latter two, but we then leak @local_err.  Fortunately,
    the qdev core always passes pointer to null, so this is "merely" a
    latent bug.

    Use error_propagate() instead.

What do you think?

With something like that:
Reviewed-by: Markus Armbruster <armbru@redhat.com>
