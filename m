Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp940959wrq;
        Wed, 20 Jun 2018 09:08:21 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJlmAyynDzQge3iE60QeFRfyi4oNS0pk+xX6Ey4jdbu2IT9tqCo0QEfdnI3rGBKsqSC1eZU
X-Received: by 2002:a0c:d2ee:: with SMTP id x43-v6mr18812176qvh.237.1529510901888;
        Wed, 20 Jun 2018 09:08:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529510901; cv=none;
        d=google.com; s=arc-20160816;
        b=xDIZMIkkXos8iHzHSTCyfAqgGkWXTWlWIBNOq5IN9KC4qes9HszLwkLUx+NCuG5VSg
         daoO6IdmuOvFZuvrll+e/mTCJjtF08HZi9yojcvyy6aNiRyIdZ2Ezwxsq4Z0Kq0I88OO
         0IiH0DcBNnmiUrHikq3koJuKUrYGbJ8erLs/dpJoi98vrKfG/35RqPYf/UEkdhjz7HAc
         clzw/n+xX7GLNlY1FAPsk2TlRx1KnKzDfSWuzdzKsFeQ6l6EF0C/373GAIoTz1SEDNM9
         01FI1sqThyDhZ3hXB9nSPIe9u+A7O8L6kRa94y4q1guURD8JWgApZkTIM1+QIAMdAR0o
         eiEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=x9PBhsqARSOFOjCCPtICk/Z48mkVBaRgwPP+K/PWF7E=;
        b=I7jQVhA0romOP6ZICpaPgsAz9avjNy0mqGNJqVIgMwKx7BDlLrXL2Lq01wsb/9GUOm
         h0QDu2PV73PyCACKtXBRFt5wFhygT4/xcKBUQAnY+vCTcUhXw+Sz+JSdoLTSckhQiUWn
         EDipdXDHvn3uj5Cit0eHEx8b1Pow2GVLo9AXk319R6SLZaF9TraNmD5XNnqp2soGHoIF
         dHSMV+3RQjXenfoKFclfai9y2SblfKENIdU9ROqwb/JQxGWMjvXeIhYS8WDIyj2Cg9Fg
         T+MF9lqJZ+6QJ+p5nby4LgDB+EungXHtE7chASMQ20MALc75Mo+2VjNIPZqmZn8a0BJ3
         TpRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UAYrySq9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s11-v6si2394179qvn.166.2018.06.20.09.08.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jun 2018 09:08:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UAYrySq9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50690 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVfef-0003vc-D1
	for alex.bennee@linaro.org; Wed, 20 Jun 2018 12:08:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49636)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVfeQ-0003ph-Vb
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 12:08:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVfeM-0000lb-Sf
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 12:08:06 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:32930)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fVfeM-0000lI-Lo
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 12:08:02 -0400
Received: by mail-ot0-x244.google.com with SMTP id h6-v6so128822otj.0
	for <qemu-arm@nongnu.org>; Wed, 20 Jun 2018 09:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=x9PBhsqARSOFOjCCPtICk/Z48mkVBaRgwPP+K/PWF7E=;
	b=UAYrySq9lO/YHBeqxru2AV0FiQOVBCXq5ugCstskEOu49srZ7eOs9MdlbneZopLKNo
	7jrFXhkIwIr77j+Hun9PHUy8arGVH/us5bm6yHfX5T+/9NIqS4WE39gp4Ea3j+81vzM+
	vY53Xp4TTZx93zE9wOPf1BHoKFdnMB2MNwpEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=x9PBhsqARSOFOjCCPtICk/Z48mkVBaRgwPP+K/PWF7E=;
	b=k0qav3E3cC6vpxaUMmHkDuW5BAhd0VOIan9hHjliS2sbPLZPW/9CYSfrDSPrHQKEfr
	QwJtFXN7xymrMqYGIg/D0AlyqznFiOtCOtg6j2kjODcKbyAVozO1HLUCK4rot4knaSIz
	ajp2bMyxmT370PtC6UFneZUyhnrPv0RlPecsuYHcC2gZh5+tFri7XxFssH9Mjee++oDx
	TyFX6UcstBr13WZcY8wqR+A2e2N9h2oJxeYjKluS8hjeQU5WeccDk+7E6wl5PjdG61dU
	8KeCDTjtgR+AecMM9zNAEGOMyGeFsGBQeCIFoCnu7Qx/uW9fPFidiD5DGKxDE1t25z+H
	JD2Q==
X-Gm-Message-State: APt69E301Xw8aCEl/YF1sGBaDOkJlJO3sMr8VTI25IcdJODFWMseu8bV
	qRm+mUdl7ozh6fO/fWzOqIeBgesJtY2fv8HVJyhTpQ==
X-Received: by 2002:a9d:2371:: with SMTP id
	k46-v6mr14316790otd.210.1529510881895; 
	Wed, 20 Jun 2018 09:08:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Wed, 20 Jun 2018 09:07:41
	-0700 (PDT)
In-Reply-To: <1528790908-23441-4-git-send-email-eric.auger@redhat.com>
References: <1528790908-23441-1-git-send-email-eric.auger@redhat.com>
	<1528790908-23441-4-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jun 2018 17:07:41 +0100
Message-ID: <CAFEAcA-EpZ6uzLmjr_1w9nno6C5-tyvqU9MfWR8XZwup4hKKDA@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH v2 3/4] hw/arm/smmuv3: IOTLB emulation
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
Cc: jia.he@hxt-semitech.com, Jia He <hejianet@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AFBPWajyY/Yo

On 12 June 2018 at 09:08, Eric Auger <eric.auger@redhat.com> wrote:
> We emulate a TLB cache of size SMMU_IOTLB_MAX_SIZE=256.
> It is implemented as a hash table whose key is a combination
> of the 16b asid and 48b IOVA (Jenkins hash).
>
> Entries are invalidated on TLB invalidation commands, either
> globally, or per asid, or per asid/iova.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
>
> v1 -> v2:
> - add comment about Jenkins Hash
> - remove init of iotlb_hits, misses
>
> v1:
> - Add new trace point when smmu is bypassed
> - s/iotlb_miss/iotlb_misses, s/iotlb_hit/iotlb_hits
> - use SMMUIOTLBKey as a key
>
> Credit to Tomasz Nowicki who did the first implementation of
> this IOTLB implementation, inspired of intel_iommu implementation.
> ---
>  hw/arm/smmu-common.c         | 60 +++++++++++++++++++++++++++
>  hw/arm/smmuv3.c              | 98 ++++++++++++++++++++++++++++++++++++++++++--
>  hw/arm/trace-events          |  9 ++++
>  include/hw/arm/smmu-common.h | 13 ++++++
>  4 files changed, 176 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 264e096..16cd33a 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -24,11 +24,43 @@
>  #include "qom/cpu.h"
>  #include "hw/qdev-properties.h"
>  #include "qapi/error.h"
> +#include "qemu/jhash.h"
>
>  #include "qemu/error-report.h"
>  #include "hw/arm/smmu-common.h"
>  #include "smmu-internal.h"
>
> +/* IOTLB Management */
> +
> +inline void smmu_iotlb_inv_all(SMMUState *s)
> +{
> +    trace_smmu_iotlb_inv_all();
> +    g_hash_table_remove_all(s->iotlb);
> +}
> +
> +static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
> +                                         gpointer user_data)
> +{
> +    uint16_t asid = *(uint16_t *)user_data;
> +    SMMUIOTLBKey *iotlb_key = (SMMUIOTLBKey *)key;
> +
> +    return iotlb_key->asid == asid;
> +}
> +
> +inline void smmu_iotlb_inv_iova(SMMUState *s, uint16_t asid, dma_addr_t iova)
> +{
> +    SMMUIOTLBKey key = {.asid = asid, .iova = iova};
> +
> +    trace_smmu_iotlb_inv_iova(asid, iova);
> +    g_hash_table_remove(s->iotlb, &key);
> +}
> +
> +inline void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid)
> +{
> +    trace_smmu_iotlb_inv_asid(asid);
> +    g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid, &asid);
> +}
> +
>  /* VMSAv8-64 Translation */
>
>  /**
> @@ -328,6 +360,31 @@ IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid)
>      return NULL;
>  }
>
> +static guint smmu_iotlb_key_hash(gconstpointer v)
> +{
> +    SMMUIOTLBKey *key = (SMMUIOTLBKey *)v;
> +    uint32_t a, b, c;
> +
> +    /* Henkins hash */

"Jenkins"

> +    a = b = c = JHASH_INITVAL + sizeof(*key);

Why do we add the sizeof(SMMUIOTLBKey) here ?

> +    a += key->asid;
> +    b += extract64(key->iova, 0, 32);
> +    c += extract64(key->iova, 32, 32);
> +
> +    __jhash_mix(a, b, c);
> +    __jhash_final(a, b, c);
> +
> +    return c;
> +}


> +static gboolean smmu_iotlb_key_equal(gconstpointer v1, gconstpointer v2)
> +{
> +    SMMUIOTLBKey *k1 = (SMMUIOTLBKey *)v1;
> +    SMMUIOTLBKey *k2 = (SMMUIOTLBKey *)v2;

These should have a 'const', at which point I think you'll
find that you don't need the explicit casts.

Otherwise looks OK I think.

thanks
-- PMM
