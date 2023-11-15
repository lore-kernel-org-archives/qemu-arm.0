Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2728508ejc;
        Wed, 15 Nov 2023 04:18:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDLnlTHQLLtiZ5t/2F5okw0h+xfsyYWRzoOYU9S5ieTGzn7PKc1nOPnhL6AftUCizyXuaF
X-Received: by 2002:a05:620a:1201:b0:778:9465:7407 with SMTP id u1-20020a05620a120100b0077894657407mr5201199qkj.71.1700050691319;
        Wed, 15 Nov 2023 04:18:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700050691; cv=none;
        d=google.com; s=arc-20160816;
        b=Xr8M8a0Vv3H6lOzj+C8emsJR/5vzdFBdnNEwAqV83pqsF0tVvS99bSrYylRfsNLQxG
         QAQtYm9ghDHqLJAam00bC1WgN3IIlqnt6FexzF3RQCWgdJw9jyMlJ4lofkGAK7HAos9J
         aawUhFz5qepLHCXaQlZxeBN0I8la3tuH/Up0VnhLAXNJpl6Tns9NeVVeId586B90RB0A
         3Tx91fWZIn7pfYyUgST51tNq50y9XpPBowd4GXjglFTysr/WHoyS5YK5dkPA2n7hawRW
         pda6KcKoaeWKNJ0NqQvRTYjhdE1c2gUfMvdBoAI6XAeAd1qT5VUze/SEjgbsAFDKZn0H
         ldOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :references:message-id:in-reply-to:subject:cc:to:from:date
         :dkim-signature;
        bh=uFSmPmJ9qLXHCirLCU1lG0SIBq8FZeGtn+2R0siKIYo=;
        fh=inYpIXM2vdIqXu3DpxKWOV+A9UjgghOfiFOOTibc3Ck=;
        b=ceEmx2rE1RJfnJZ0edzWTZ3ThPlmDwYPFok7Vuj4NmlD4eZp6hzRQVp+ozNBBZYihg
         Yz9h1qiawGcnGX8w4QXDkJtEtOf8qnVdKmCmnzQbSxzMQs9FXlWd+0YUn6b6xrrgiSgO
         nr5fL48DdYUuio/CP6IdKrqYtKYzBqYRTfSyYf1IEersJpN+KzNSKN1BubHNtZjLTBGw
         smUqAM5nLtOch1TGU6wWizGS/OfI1wwV3Ap8EfOXf6Sd8NHYlYkHQmpdmrpALs2Crrxl
         pUh8GUlQkSvPM8rQyT+FALqkHZrivDRD2t0eM23FnexMSzWc7HhYPYuwiKFRHTOYMKfg
         U8uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=APpOpNef;
       spf=pass (google.com: domain of kvm+bounces-1822-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-1822-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-1822-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id c20-20020a05620a0cf400b00779d17610absi8381483qkj.608.2023.11.15.04.18.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 04:18:11 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-1822-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=APpOpNef;
       spf=pass (google.com: domain of kvm+bounces-1822-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-1822-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE0651C208DD
	for <alex.bennee@linaro.org>; Wed, 15 Nov 2023 12:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B1F18041;
	Wed, 15 Nov 2023 12:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="APpOpNef"
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C12179A5
	for <kvm@vger.kernel.org>; Wed, 15 Nov 2023 12:18:05 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 838FBC7
	for <kvm@vger.kernel.org>; Wed, 15 Nov 2023 04:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700050683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uFSmPmJ9qLXHCirLCU1lG0SIBq8FZeGtn+2R0siKIYo=;
	b=APpOpNefzoOstu5thSpn4QVyCcWbEIZroa1e2NCWAmc3zbWGfAPvkTVsDBrEhcuKM8WRZy
	42wgmMkQc+V0uZ6f+dLAZT6H/plnZ/IfP4guGkaegAosevfuYojKwD2FxvO/sC+5iisrTg
	OmgzsbG2jD3N4Rr4R52fD4zKlAltT1Q=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-fpO44AbIPE2v7bjhiffENg-1; Wed, 15 Nov 2023 07:18:02 -0500
X-MC-Unique: fpO44AbIPE2v7bjhiffENg-1
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6d2a5a99311so6180265a34.2
        for <kvm@vger.kernel.org>; Wed, 15 Nov 2023 04:18:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700050681; x=1700655481;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uFSmPmJ9qLXHCirLCU1lG0SIBq8FZeGtn+2R0siKIYo=;
        b=TTUCq0oBxkratu29wo0GPB/HdrBaZ+lBjy4A6UAw11uHpXpX34WG0QgtdRyzlGwl/3
         Re4rracgsCQGe6hV6ISFcs8AKBm2PtC4JmuYy4p1Y92K8Q/gFbskrI1jHANlfhIi+Sfj
         PXufPZjOVZ3WnIsJoSuPEXlZ7hZI2+bJmptskPyajRXunNlQU4WxWTCEDP1Pq6vFLlLi
         h5IipEttL1UjkbNwLqNyswnccpOwA9ROPPgfD65A20jInHM/QvBDXqPWsDmyHrs/WSrH
         CjN8tmCuBZi4tkp40O1M/xR3Sa8Oh2d7FJgrPEvPtDZXC+HWYD28nghRUi8AsN91er/p
         p8lw==
X-Gm-Message-State: AOJu0YxSybNCE5NlXGqrAhcIaWni+22IvspqYufpeqZX/W2c7S9uSb8L
	lw65UOguDt0dN0aqeba8Kg+PioRua1iQH7rwlb5KqKH0OH5rKTPhAGw+jZWJjK7gXflb4zZV0c6
	54GYYB9Pv94jW
X-Received: by 2002:a05:6830:348c:b0:6c6:5053:66dc with SMTP id c12-20020a056830348c00b006c6505366dcmr5271625otu.21.1700050681749;
        Wed, 15 Nov 2023 04:18:01 -0800 (PST)
X-Received: by 2002:a05:6830:348c:b0:6c6:5053:66dc with SMTP id c12-20020a056830348c00b006c6505366dcmr5271611otu.21.1700050681510;
        Wed, 15 Nov 2023 04:18:01 -0800 (PST)
Received: from rh (p200300c93f306f0016d68197cd5f6027.dip0.t-ipconnect.de. [2003:c9:3f30:6f00:16d6:8197:cd5f:6027])
        by smtp.gmail.com with ESMTPSA id dw15-20020a0562140a0f00b0067079ecca05sm489704qvb.108.2023.11.15.04.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 04:18:01 -0800 (PST)
Date: Wed, 15 Nov 2023 13:17:56 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Shaoqin Huang <shahuang@redhat.com>
cc: qemu-arm@nongnu.org, eric.auger@redhat.com, 
    Paolo Bonzini <pbonzini@redhat.com>, 
    Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org, 
    qemu-devel@nongnu.org
Subject: Re: [PATCH v1] arm/kvm: Enable support for
 KVM_ARM_VCPU_PMU_V3_FILTER
In-Reply-To: <20231113081713.153615-1-shahuang@redhat.com>
Message-ID: <3a570842-aaec-6447-b043-d908e83717ec@redhat.com>
References: <20231113081713.153615-1-shahuang@redhat.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-TUID: SNsAsYSWTous

Hi,

On Mon, 13 Nov 2023, Shaoqin Huang wrote:
> +    ``pmu-filter={A,D}:start-end[;...]``
> +        KVM implements pmu event filtering to prevent a guest from being able to
> +	sample certain events. It has the following format:
> +
> +	pmu-filter="{A,D}:start-end[;{A,D}:start-end...]"
> +
> +	The A means "allow" and D means "deny", start if the first event of the
                                                       ^
                                                       is

Also it should be stated that the first filter action defines if the whole
list is an allow or a deny list.

> +static void kvm_arm_pmu_filter_init(CPUState *cs)
> +{
> +    struct kvm_pmu_event_filter filter;
> +    struct kvm_device_attr attr = {
> +        .group      = KVM_ARM_VCPU_PMU_V3_CTRL,
> +        .attr       = KVM_ARM_VCPU_PMU_V3_FILTER,
> +    };
> +    KVMState *kvm_state = cs->kvm_state;
> +    char *tmp;
> +    char *str, act;
> +
> +    if (!kvm_state->kvm_pmu_filter)
> +        return;
> +
> +    tmp = g_strdup(kvm_state->kvm_pmu_filter);
> +
> +    for (str = strtok(tmp, ";"); str != NULL; str = strtok(NULL, ";")) {
> +        unsigned short start = 0, end = 0;
> +
> +        sscanf(str, "%c:%hx-%hx", &act, &start, &end);
> +        if ((act != 'A' && act != 'D') || (!start && !end)) {
> +            error_report("skipping invalid filter %s\n", str);
> +            continue;
> +        }
> +
> +        filter = (struct kvm_pmu_event_filter) {
> +            .base_event     = start,
> +            .nevents        = end - start + 1,
> +            .action         = act == 'A' ? KVM_PMU_EVENT_ALLOW :
> +                                           KVM_PMU_EVENT_DENY,
> +        };
> +
> +        attr.addr = (uint64_t)&filter;

That could move to the initialization of attr (the address of filter
doesn't change).

> +        if (!kvm_arm_set_device_attr(cs, &attr, "PMU Event Filter")) {
> +            error_report("Failed to init PMU Event Filter\n");
> +            abort();
> +        }
> +    }
> +
> +    g_free(tmp);
> +}
> +
> void kvm_arm_pmu_init(CPUState *cs)
> {
>     struct kvm_device_attr attr = {
>         .group = KVM_ARM_VCPU_PMU_V3_CTRL,
>         .attr = KVM_ARM_VCPU_PMU_V3_INIT,
>     };
> +    static bool pmu_filter_init = false;
>
>     if (!ARM_CPU(cs)->has_pmu) {
>         return;
>     }
> +    if (!pmu_filter_init) {
> +        kvm_arm_pmu_filter_init(cs);
> +        pmu_filter_init = true;

pmu_filter_init could move inside kvm_arm_pmu_filter_init() - maybe
together with a comment that this only needs to be called for 1 vcpu.

Thanks,
Sebastian

