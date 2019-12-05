Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1735682lff;
        Thu, 5 Dec 2019 00:42:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqxW3B+K13dxJbhHyhf8W8Eej1tQbvk41iHD4C6S2K8/anWLL67yBvqvremTPFmoVJkQDZQG
X-Received: by 2002:ad4:40c7:: with SMTP id x7mr6592873qvp.176.1575535330910;
        Thu, 05 Dec 2019 00:42:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575535330; cv=none;
        d=google.com; s=arc-20160816;
        b=KspTbXruGUnrWdOEc4UzPxbhqm40JFRWa7wsJMl+oklpUFhXVocLbGySbfNJz4SMTq
         u52p4P0AVY8TS9PAJCIDwKGYsF1sQl/lvHphl5xR1r6dYK/tg6kDxhVuEku0U7mv6qbL
         PX8bTMD/UKsTbPBjAWhHGaXaYcGfSSRnMgCz1gbUH5+HtCDNHZUMqj3m0wtTgenGoLfK
         DoZKech8wEePitQX3m+o7TLyvY/CFE1WRHkeI9z0Dn511VU0eVtcc4vTfk2kgtzYaThs
         DbdxSVeVn0dQY8lSpzebyAtnpRmjG+dCQU9Ek/215Lmi5VApb4EiMccdbOVEqKbm2fh7
         dQug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=oWzU1D6brfrqeWW9oo+vPzM9VdKyFyvRG4TgMO+1RUw=;
        b=aZjJs1d8cGlsqgTsUeT7soxlWqwSklcDEEkyse8TAq8DQ6xor9cpN9/KIJxVt+YIqi
         sn3tFzvew5ICFImCJoAmPK9HlIYWnjJtCNJreaZ1KsnUSowYDFnwMb1/LSDDHyjAg+ZT
         HLS2FDPRgJynJat7GNc9zRLhArqXDz9xTmCIg5elFdGHwRJSUqW6q9Il7eySxqnsa4gY
         2O88qgAt0aCiCUq/bDH2kJxSYP5lY38jnlXh8q94SX+SoFFLKmzpTPBb953APiV+8f7V
         B6G/bUSvN4lL/FkQyahyl021oCswCOgdTzdXWGtZciVDxgH8k/lOoEEf3z4x78DsuhS8
         /ngg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cqj0gmhx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k8si6127654qke.360.2019.12.05.00.42.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2019 00:42:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cqj0gmhx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1icmiA-0000hU-8n
	for alex.bennee@linaro.org; Thu, 05 Dec 2019 03:42:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38225)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1icmi1-0000hH-7I
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 03:42:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1icmhz-0002ti-WF
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 03:42:01 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:50358
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1icmhl-0002WI-8P
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 03:41:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575535304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oWzU1D6brfrqeWW9oo+vPzM9VdKyFyvRG4TgMO+1RUw=;
 b=cqj0gmhxSR7iftuFooTxDWPxylJ3zTsZyLjMEv/Hlivj81FwovJownIJiV424NQkYQuQnc
 XkXO3HWuMJOBixu+cWPBsDz+FZ2Na/KDmFgouSMb5ls6MIms2ZTPXDTeIGKd3y1JiQrbSe
 MI8xRsmg3VBYhDqnB/rvQ/kMY6OggEs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-6JD909Y4MhyCz5GoWs41Sg-1; Thu, 05 Dec 2019 03:41:41 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6422964A7D;
 Thu,  5 Dec 2019 08:41:40 +0000 (UTC)
Received: from [10.36.116.117] (ovpn-116-117.ams2.redhat.com [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82FE85C1B5;
 Thu,  5 Dec 2019 08:41:39 +0000 (UTC)
Subject: Re: [PATCH 2/5] hw/arm/smmuv3: Check stream IDs against actual table
 LOG2SIZE
To: Simon Veith <sveith@amazon.de>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <1575467748-28898-1-git-send-email-sveith@amazon.de>
 <1575467748-28898-3-git-send-email-sveith@amazon.de>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <1a0656ce-5da0-2251-1304-1ee0e683b887@redhat.com>
Date: Thu, 5 Dec 2019 09:41:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1575467748-28898-3-git-send-email-sveith@amazon.de>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 6JD909Y4MhyCz5GoWs41Sg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BEybxn9cXtEn

Hi Simon,
On 12/4/19 2:55 PM, Simon Veith wrote:
> When checking whether a stream ID is in range of the stream table, we
> have so far been only checking it against our implementation limit
> (SMMU_IDR1_SIDSIZE). However, the guest can program the
> STRTAB_BASE_CFG.LOG2SIZE field to a size that is smaller than this
> limit.
> 
> Check the stream ID against this limit as well to match the hardware
> behavior of raising C_BAD_STREAMID events in case the limit is exceeded.
> 
> ref. ARM IHI 0070C, section 6.3.24.
> 
> Signed-off-by: Simon Veith <sveith@amazon.de>
> Cc: Eric Auger <eric.auger@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> ---
>  hw/arm/smmuv3.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index eef9a18..aad4639 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -377,11 +377,15 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
>                           SMMUEventInfo *event)
>  {
>      dma_addr_t addr;
> +    uint32_t log2size;
>      int ret;
>  
>      trace_smmuv3_find_ste(sid, s->features, s->sid_split);
> -    /* Check SID range */
> -    if (sid > (1 << SMMU_IDR1_SIDSIZE)) {
> +    log2size = FIELD_EX32(s->strtab_base_cfg, STRTAB_BASE_CFG, LOG2SIZE);
> +    /*
> +     * Check SID range against both guest-configured and implementation limits
> +     */
> +    if (sid > (1 << MIN(log2size, SMMU_IDR1_SIDSIZE))) {I think this should be sid >= (1 << MIN(log2size, SMMU_IDR1_SIDSIZE))

If you agree can you fix it at the same time?
>          event->type = SMMU_EVT_C_BAD_STREAMID;
>          return -EINVAL;
>      }
> 

Thanks

Eric

