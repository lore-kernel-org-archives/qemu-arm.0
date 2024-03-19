Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1370043ejb;
        Tue, 19 Mar 2024 08:23:15 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWfr2G8CGpIWSmMqpqKVq02AulIfJeRmrrP7KuV8F/AQ7xPgcNY2kbCd32ulNkT0VgZdNhTTbUTCHZkhvP0QSGURJzVj8bZ
X-Google-Smtp-Source: AGHT+IEjp1JAQT4j+yP6oOHeeNEIEgZDaSqzvXykZAvH1IzktFRJGzeOgonJ+X0pT7u1WPiHkLpr
X-Received: by 2002:a17:902:f7cc:b0:1dc:f390:3259 with SMTP id h12-20020a170902f7cc00b001dcf3903259mr3062568plw.57.1710861794744;
        Tue, 19 Mar 2024 08:23:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1710861794; cv=pass;
        d=google.com; s=arc-20160816;
        b=qI4Zvx3t/KGjkJuXmtgrJ5mENlaLjEKTONxqZ652y7rG8zsnUIldQoxFk80ODn7H7U
         +9X4vJE12RJj7jW0Fv3bmAqD8XHHyb0JJd16s56lfrpO6CashKSSsWExT5syXm6LwYNw
         /jAev4xqm/Rp3n8eY8u3YRsLAhXYWkEArIzQCeKgwHDSz1I/Dc3nX9FFk1mbrkIENmPZ
         sqnyV1RzglWPzr5F61I9ZlUv2XpTeymSHaL4N7Soy8zlF1eYR5FMlugeRwkaZ20Ej0Z6
         tUbbnUkEWaviomh/0Ns9zGS0Mzdb6YLNetu2aw8xsr/Qc8N6aLUM0hlTK3oUdIOUC93q
         K2hA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version
         :list-unsubscribe:list-subscribe:list-id:precedence:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=AHYD2aoQDkkw9ORPXg1micmc/tT7gZ08fuyWCxxnQTY=;
        fh=iuarMY80Wj9V9QrSIyXjgMQ/mVzPeH5DXZsyZrMtanE=;
        b=G7WHaIyGB2n69N5IZtZaBXN8vDB3Gnv2NNoqdyysbz3VATgB7ywSHT3wez6V1NQdaV
         RUIi6JemqomedOyhtPopO8K2o8RP5m+AWAz/DhE72/zFHOEDyniXwoyGFrl+ElKLo/Wv
         WQiapeuZKf6woi1Iliohua2wPFrnrYQUKtPpP6KqftkVxW1WpUgWlydEujzTUs4zWFld
         c4JA9RmWC9zMWoIGPKBGZvAHh8yon0axTCxbz9ARpb+cH4b9P1zgdb0m+C7fl056sU83
         BPPe6ySQwFU0odnwgU4OhdOja6eGR8GxJlyoUU3LmVD0Zi68CVObxduscl9mDAKu+ikw
         6dDw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YzrIdz2V;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-12151-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-12151-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-12151-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id jv5-20020a170903058500b001e04ad0ec24si1020716plb.326.2024.03.19.08.23.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 08:23:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-12151-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YzrIdz2V;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-12151-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-12151-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62AA4B207F1
	for <alex.bennee@linaro.org>; Tue, 19 Mar 2024 15:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF1A6651AD;
	Tue, 19 Mar 2024 15:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YzrIdz2V"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32D0651B1
	for <kvm@vger.kernel.org>; Tue, 19 Mar 2024 15:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710861785; cv=none; b=Ge0Kqd3daVqYkL6jL9B46u4uPqcMpE2hr0gDieJyow76zLk9GAbjKeYFiycppDOWf4tSLVNQpWoD8yetTUtVYkYp8ItnLf+E3nNl/P4X12op3LhFWvghAPbL5TOt45yI1XukK3XHsLAuAk9bVk7zn63ue9FEq0m7ZmIuuzI1oR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710861785; c=relaxed/simple;
	bh=fIXv5lmVUH3OejhpeENPuLjKnHthOYMLCbOVkSCAgwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vi7jCeEmwXBPO7ci5vslt5GxOfda9Dge0CiFiVq5btpXVby3xCk2wX/UHlxkKhwHNlzltk/4mwbEWWnKn8Lc/lAVdg0AgCl9L+L24dOowmT72nNLSQXX18PFXuI9PKwmcGpNnoL6KHs+OJOXCoV3ilzQSZ621MSXph7M6hy+EQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YzrIdz2V; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710861780;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=AHYD2aoQDkkw9ORPXg1micmc/tT7gZ08fuyWCxxnQTY=;
	b=YzrIdz2VSFXihHylsaM3Ynf8OeDM/UYib+93VbRSpH4SFIu87z1vgvlbQ53EWTc/3EdVu6
	w/wSQ+53oGjBYzWbvwWMGmALJZiC/ZKYcjynYBuVmnFtVNvyth/YPoIHmBV2DSRBxh+Axb
	XLXb+Q8CmfTTQOvSheImIuok9aG7KMY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-P0s4xJHcMIqCeNA6JBZo5Q-1; Tue, 19 Mar 2024 11:22:56 -0400
X-MC-Unique: P0s4xJHcMIqCeNA6JBZo5Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72C92185A78E;
	Tue, 19 Mar 2024 15:22:56 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.88])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 692F51C060A4;
	Tue, 19 Mar 2024 15:22:54 +0000 (UTC)
Date: Tue, 19 Mar 2024 15:22:47 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Shaoqin Huang <shahuang@redhat.com>
Cc: qemu-arm@nongnu.org, Eric Auger <eauger@redhat.com>,
	Sebastian Ott <sebott@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org
Subject: Re: [PATCH v7] arm/kvm: Enable support for KVM_ARM_VCPU_PMU_V3_FILTER
Message-ID: <ZfmtxxlATpvhK61y@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240221063431.76992-1-shahuang@redhat.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240221063431.76992-1-shahuang@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-TUID: 7VaVsVvYYqfx

On Wed, Feb 21, 2024 at 01:34:31AM -0500, Shaoqin Huang wrote:
> The KVM_ARM_VCPU_PMU_V3_FILTER provides the ability to let the VMM decide
> which PMU events are provided to the guest. Add a new option
> `kvm-pmu-filter` as -cpu sub-option to set the PMU Event Filtering.
> Without the filter, all PMU events are exposed from host to guest by
> default. The usage of the new sub-option can be found from the updated
> document (docs/system/arm/cpu-features.rst).
> 
> Here is an example which shows how to use the PMU Event Filtering, when
> we launch a guest by use kvm, add such command line:
> 
>   # qemu-system-aarch64 \
>         -accel kvm \
>         -cpu host,kvm-pmu-filter="D:0x11-0x11"

snip

> @@ -517,6 +533,12 @@ void kvm_arm_add_vcpu_properties(ARMCPU *cpu)
>                               kvm_steal_time_set);
>      object_property_set_description(obj, "kvm-steal-time",
>                                      "Set off to disable KVM steal time.");
> +
> +    object_property_add_str(obj, "kvm-pmu-filter", kvm_pmu_filter_get,
> +                            kvm_pmu_filter_set);
> +    object_property_set_description(obj, "kvm-pmu-filter",
> +                                    "PMU Event Filtering description for "
> +                                    "guest PMU. (default: NULL, disabled)");
>  }

Passing a string property, but....[1]

>  
>  bool kvm_arm_pmu_supported(void)
> @@ -1706,6 +1728,62 @@ static bool kvm_arm_set_device_attr(ARMCPU *cpu, struct kvm_device_attr *attr,
>      return true;
>  }
>  
> +static void kvm_arm_pmu_filter_init(ARMCPU *cpu)
> +{
> +    static bool pmu_filter_init;
> +    struct kvm_pmu_event_filter filter;
> +    struct kvm_device_attr attr = {
> +        .group      = KVM_ARM_VCPU_PMU_V3_CTRL,
> +        .attr       = KVM_ARM_VCPU_PMU_V3_FILTER,
> +        .addr       = (uint64_t)&filter,
> +    };
> +    int i;
> +    g_auto(GStrv) event_filters;
> +
> +    if (!cpu->kvm_pmu_filter) {
> +        return;
> +    }
> +    if (kvm_vcpu_ioctl(CPU(cpu), KVM_HAS_DEVICE_ATTR, &attr)) {
> +        warn_report("The KVM doesn't support the PMU Event Filter!");

If the user requested a filter and it can't be supported, QEMU
must exit with an error, not ignore the user's request.

> +        return;
> +    }
> +
> +    /*
> +     * The filter only needs to be initialized through one vcpu ioctl and it
> +     * will affect all other vcpu in the vm.
> +     */
> +    if (pmu_filter_init) {
> +        return;
> +    } else {
> +        pmu_filter_init = true;
> +    }
> +
> +    event_filters = g_strsplit(cpu->kvm_pmu_filter, ";", -1);
> +    for (i = 0; event_filters[i]; i++) {
> +        unsigned short start = 0, end = 0;
> +        char act;
> +
> +        if (sscanf(event_filters[i], "%c:%hx-%hx", &act, &start, &end) != 3) {
> +            warn_report("Skipping invalid PMU filter %s", event_filters[i]);
> +            continue;

Warning on user syntax errors is undesirable - it should be a fatal
error of the user gets this wrong.

> +        }
> +
> +        if ((act != 'A' && act != 'D') || start > end) {
> +            warn_report("Skipping invalid PMU filter %s", event_filters[i]);
> +            continue;

Likewise should be fatal.

> +        }
> +
> +        filter.base_event = start;
> +        filter.nevents = end - start + 1;
> +        filter.action = (act == 'A') ? KVM_PMU_EVENT_ALLOW :
> +                                       KVM_PMU_EVENT_DENY;
> +
> +        if (!kvm_arm_set_device_attr(cpu, &attr, "PMU_V3_FILTER")) {
> +            break;
> +        }
> +    }
> +}

..[1] then implementing a custom parser is rather a QEMU design anti-pattern,
especially when the proposed syntax is incapable of being mapped into the
normal QAPI syntax for a list of structs should we want to fully convert
-cpu to QAPI parsing later. I wonder if can we model this property with
QAPI now ?

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

