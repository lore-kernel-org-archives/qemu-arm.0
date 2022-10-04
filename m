Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp78023ocb;
        Tue, 4 Oct 2022 03:41:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7eXXAl7tQNnhhgyVbzgR0lUV7Z4QO7m7h6GT7+hnDXvIgYNAOgOt305CtmirY8ylDa8lKS
X-Received: by 2002:ad4:5c62:0:b0:4b1:b643:1f33 with SMTP id i2-20020ad45c62000000b004b1b6431f33mr901775qvh.57.1664880108362;
        Tue, 04 Oct 2022 03:41:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664880108; cv=none;
        d=google.com; s=arc-20160816;
        b=c+yGnQJ+eMZfSkEUTdXLYpzdoN3+bwxbfQmq8CAGtRqZZjfiPxOWrgIZYJ3OK7aM1/
         sPbrAhRc/uEOPcxINqCHNphB5BvrpkAqE1jl29DuRtnDLNanwtPJ0W901k8OS3yTXYQ3
         c9CaRjB5hGU2T/GYWw4mvEUHLiTsa7pALY5E6nfplV3MhSAYd+dHjh/Vs6JqA0ZNaW+5
         2BpJv/rS2VXc1Bib1S6Ozp1Ew9lgB25n3gUQsx+fk21eO74QaVl1KnMejIoGSZ0ti0Pg
         4pDeqCVfdzvXMfZHvcGP0db6dg0SRw8EWvy+OG9f3kF+dMVZ3rdAtQ2qds4tgaq7IrVC
         BK3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=1M+NgUM5GZ5+imRVNWwYLnc6H57LmwBusuOnXas8ihg=;
        b=g22jHB9VKPSMpv2MLVf3rrC5i5yvgL18g+nsHmJ0JR/aCre84fQQOYyxrM41nb6ZDR
         JmKNdnD73BuEbBLuqXd+ziGXdctXnCxhPkc0fzQPwe7QTSUSFPwYLOxEn3Nfn6AsxThs
         cllF2VflnvNawNDXDWKMeZR8ThpO7/OZm1gathxGUrOAsVyktzwdyEE/NruDvuYFloQl
         JAIEA6q7vBr/fnKmi2YPxz/30gbOacSuLhde6hxJOJkOpI1YGjb98EqxDd3LVyOu7OvM
         BU22r1pVinVKRGtSsOlR/fQnGwrpZCzrlG6teJVYe10OefT7DF2H7bYRMGect8xLzqij
         pTjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SYpCuDEG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q19-20020a05620a0d9300b006cf912df7f0si5011940qkl.74.2022.10.04.03.41.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Oct 2022 03:41:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SYpCuDEG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1offMx-0000Z7-Uu
	for alex.bennee@linaro.org; Tue, 04 Oct 2022 06:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1offMf-0000WA-Fj
 for qemu-arm@nongnu.org; Tue, 04 Oct 2022 06:41:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1offMZ-0002S2-Ex
 for qemu-arm@nongnu.org; Tue, 04 Oct 2022 06:41:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664880082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1M+NgUM5GZ5+imRVNWwYLnc6H57LmwBusuOnXas8ihg=;
 b=SYpCuDEGL+el3yDrPhQ7m+luR8EKvwq1+yK7genSsbTfC01+YE954iarcLX3YXHdd/sPMk
 Et9m5/IHoVZpvl+J31DHiIoI6TYgAsPSHqz7eASrtvJkoKrXPUPTzzK0EgU3qrX/to5MkU
 X99U4kofQh63Kkw/XMopA8K7L86Q7vE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-0V2BPLTPOwOKy122kn9yRA-1; Tue, 04 Oct 2022 06:41:18 -0400
X-MC-Unique: 0V2BPLTPOwOKy122kn9yRA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FDAA857F8F;
 Tue,  4 Oct 2022 10:41:18 +0000 (UTC)
Received: from localhost (unknown [10.39.193.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F9AA2027061;
 Tue,  4 Oct 2022 10:41:17 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: Re: [PATCH v4 4/6] hw/arm/virt: Introduce
 virt_get_high_memmap_enabled() helper
In-Reply-To: <20221004002627.59172-5-gshan@redhat.com>
Organization: Red Hat GmbH
References: <20221004002627.59172-1-gshan@redhat.com>
 <20221004002627.59172-5-gshan@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Tue, 04 Oct 2022 12:41:16 +0200
Message-ID: <87edvnooqb.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
X-TUID: Y5eBruXZBHpR

On Tue, Oct 04 2022, Gavin Shan <gshan@redhat.com> wrote:

> This introduces virt_get_high_memmap_enabled() helper, which returns
> the pointer to vms->highmem_{redists, ecam, mmio}. The pointer will
> be used in the subsequent patches.
>
> No functional change intended.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/arm/virt.c | 30 +++++++++++++++++-------------
>  1 file changed, 17 insertions(+), 13 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b0b679d1f4..59de7b78b5 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1689,14 +1689,29 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>      return arm_cpu_mp_affinity(idx, clustersz);
>  }
>  
> +static inline bool *virt_get_high_memmap_enabled(VirtMachineState *vms,
> +                                                 int index)
> +{
> +    bool *enabled_array[] = {
> +        &vms->highmem_redists,
> +        &vms->highmem_ecam,
> +        &vms->highmem_mmio,
> +    };
> +
> +    assert(index - VIRT_LOWMEMMAP_LAST < ARRAY_SIZE(enabled_array));

I wonder whether we want an assert(ARRAY_SIZE(extended_memmap) ==
ARRAY_SIZE(enabled_array))? IIUC, we never want those two to get out of
sync?

> +
> +    return enabled_array[index - VIRT_LOWMEMMAP_LAST];
> +}
> +

