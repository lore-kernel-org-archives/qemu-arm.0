Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp3935002ejv;
        Tue, 2 Apr 2024 06:02:11 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCV0KjujqNhD6I02nrcM+eWjDn4sfMiEiblE6dC1OvbVrovUtwdL9SBRbU+Ss+pvosvb3IcyZnLW/KoKzhtrCtiZS8TYDzZK
X-Google-Smtp-Source: AGHT+IGCeNb2istQ2rxyN0GHvR7j73pDu3IW3rAQR0x0Csnrc3hPWrf9tX7/a12DTiHzd87cQgW8
X-Received: by 2002:a05:6a00:18a6:b0:6e7:294:9775 with SMTP id x38-20020a056a0018a600b006e702949775mr13381770pfh.8.1712062930820;
        Tue, 02 Apr 2024 06:02:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1712062930; cv=pass;
        d=google.com; s=arc-20160816;
        b=f+UfR0vqGT3CfDc+Do72Fa8830F7H1OWfEinoXQUvM3nw/NSptOb+PiZl35ZDaPrL5
         WlXVHCWPIDC3cnXl1ap7fmOOs6OOy8xvREey2cxqW2IaWoIyd2EE+B6toTNyW1+pZKdp
         x1zmhPU9csB4VAGsUxYimBHT081CinLB0ABfzY0KHQoe849xU9zI9NhcKqrd4uDMXDS9
         YT9D+jHD2tuNZK7a5gH2Dd3uliLd+UkC/t5KKFDGLOLiR5Qey54A19w0kyfjNKJfap7k
         xT6ZzGHVok2qguC3AfO0fDBsiE7VE6VF/9qeh9rRxBuFgkzelUvbLWkkymGERhLMIeCE
         V1uQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=RbJu5JhscfzLmMEVZM2sY/pfYvXjDWrFhs3X6SyDklc=;
        fh=dFSsVdSFYgrB1kufoUkeL9dKrbXlULsdtHSR9wM0hVc=;
        b=HFbWNSMLonMcqwqn5GCbzgNQ3ucEJbmb/NcyiAEuOOizRDgU5O7cRE0w7m0ouSryJ8
         RsOjT9cF7DF60Ntn4riwB/4aWO8F/fk8s88fHGIdb4t57l7wlNLOuJ0/9M6tim7fuR7U
         ue03Cy1tjpn7qzVDwcrJKgOy0b2+7HSgMlKxj7HxdistpxWyygkHX5Iergx5belAh9Ff
         Sm/6rEe/CD3k8dzuqAevHw7pKfagVhu2aRFjzncWt2QsvlE3PPv7fHPG49UNMrCexr7r
         lG7pGI6+tQA/6vWg49OI/nZhZANv6V0rT/j+02T225T/QCRt+y3NHPqLeZDqQs6vOJZU
         Fsyw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZE+C49+9;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-13368-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-13368-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-13368-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id a2-20020aa78642000000b006eadff158dasi10100895pfo.382.2024.04.02.06.02.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 06:02:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-13368-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZE+C49+9;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-13368-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-13368-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D42228219E
	for <alex.bennee@linaro.org>; Tue,  2 Apr 2024 13:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 068BD7F46B;
	Tue,  2 Apr 2024 13:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZE+C49+9"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393267E58A
	for <kvm@vger.kernel.org>; Tue,  2 Apr 2024 13:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712062925; cv=none; b=K5WtKOKiEYoJz5RNS7ixhEnKwp3v8we9TTLcWxU4xLBag/GZpgp8eiapbBx2l+hFc8at3xmWv1LJCnp0FqbsTXYx8gI+bBruBLd7gIfw3tX/Acd5bk1c9bssWOFNHGI1wo9I8Es7ZtrQQj5O0NC8ADQKIiyO/ODaWETUYeoSxIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712062925; c=relaxed/simple;
	bh=dJTK7uaprHRPxPOi8xoFEcOM7mbvRu1zU8fNqA3tZUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J1NjJgme/fQMhOTwK9iYlHGTdfGKh25VP7K4ZSHtNLOpJBMGPqxiUdtIl8t24NCN0MkP6/HEYwZHPGmRQPl8cnGnJdtq0nbkchR91m3RQiBGsYGsyfNWwifWeBgtFYXOAM/x8L6tcJereRtk7r2lB23ZpMoALwbnYNsxe37ESeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZE+C49+9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712062923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RbJu5JhscfzLmMEVZM2sY/pfYvXjDWrFhs3X6SyDklc=;
	b=ZE+C49+9vWgpen0wkJ0SELBiI8m7n0nBpdWG+rOO1kXgSMDZ/6PQkioehF6G/nngPUG619
	Pnpazv5gvakfM2lro6cjAZeE/JeBEwYTNMPrVmvpkNNahIe04ifvUgKjAxwtjHNBqhmTqZ
	hp9dXXWNVoyi3FywaKLBlXiazOhXCWI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-yHf5CL1qOzqgAT7RUWhSVQ-1; Tue, 02 Apr 2024 09:01:57 -0400
X-MC-Unique: yHf5CL1qOzqgAT7RUWhSVQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FC6D80C764;
	Tue,  2 Apr 2024 13:01:57 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.153])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8893C04220;
	Tue,  2 Apr 2024 13:01:55 +0000 (UTC)
Date: Tue, 2 Apr 2024 15:01:50 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Shaoqin Huang <shahuang@redhat.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org, Eric Auger <eauger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, armbru@redhat.com
Subject: Re: [PATCH v8] arm/kvm: Enable support for KVM_ARM_VCPU_PMU_V3_FILTER
Message-ID: <ZgwBvuCrTwKmA0IK@redhat.com>
References: <20240312074849.71475-1-shahuang@redhat.com>
 <Zf2bbcpWYMWKZpNy@redhat.com>
 <1881554f-9183-4e01-8cda-0934f7829abf@redhat.com>
 <ZgE71v8uGDNihQ5H@redhat.com>
 <46f0c5ab-dee7-4cd4-844d-c418818e187c@redhat.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46f0c5ab-dee7-4cd4-844d-c418818e187c@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-TUID: cV+5BBnxdIM/

Am 29.03.2024 um 04:45 hat Shaoqin Huang geschrieben:
> Hi Daniel,
> 
> On 3/25/24 16:55, Daniel P. Berrangé wrote:
> > On Mon, Mar 25, 2024 at 01:35:58PM +0800, Shaoqin Huang wrote:
> > > Hi Daniel,
> > > 
> > > Thanks for your reviewing. I see your comments in the v7.
> > > 
> > > I have some doubts about what you said about the QAPI. Do you want me to
> > > convert the current design into the QAPI parsing like the
> > > IOThreadVirtQueueMapping? And we need to add new json definition in the
> > > qapi/ directory?
> 
> I have defined the QAPI for kvm-pmu-filter like below:
> 
> +##
> +# @FilterAction:
> +#
> +# The Filter Action
> +#
> +# @a: Allow
> +#
> +# @d: Disallow
> +#
> +# Since: 9.0
> +##
> +{ 'enum': 'FilterAction',
> +  'data': [ 'a', 'd' ] }
> +
> +##
> +# @SingleFilter:
> +#
> +# Lazy
> +#
> +# @action: the action
> +#
> +# @start: the start
> +#
> +# @end: the end
> +#
> +# Since: 9.0
> +##
> +
> +{ 'struct': 'SingleFilter',
> + 'data': { 'action': 'FilterAction', 'start': 'int', 'end': 'int' } }
> +
> +##
> +# @KVMPMUFilter:
> +#
> +# Lazy
> +#
> +# @filter: the filter
> +#
> +# Since: 9.0
> +##
> +
> +{ 'struct': 'KVMPMUFilter',
> +  'data': { 'filter': ['SingleFilter'] }}
> 
> And I guess I can use it by adding code like below:
> 
> --- a/hw/core/qdev-properties-system.c
> +++ b/hw/core/qdev-properties-system.c
> @@ -1206,3 +1206,35 @@ const PropertyInfo qdev_prop_iothread_vq_mapping_list
> = {
>      .set = set_iothread_vq_mapping_list,
>      .release = release_iothread_vq_mapping_list,
>  };
> +
> +/* --- kvm-pmu-filter ---*/
> +
> +static void get_kvm_pmu_filter(Object *obj, Visitor *v,
> +        const char *name, void *opaque, Error **errp)
> +{
> +    KVMPMUFilter **prop_ptr = object_field_prop_ptr(obj, opaque);
> +
> +    visit_type_KVMPMUFilter(v, name, prop_ptr, errp);
> +}
> +
> +static void set_kvm_pmu_filter(Object *obj, Visitor *v,
> +        const char *name, void *opaque, Error **errp)
> +{
> +    KVMPMUFilter **prop_ptr = object_field_prop_ptr(obj, opaque);
> +    KVMPMUFilter *list;
> +
> +    printf("running the %s\n", __func__);
> +    if (!visit_type_KVMPMUFilter(v, name, &list, errp)) {
> +        return;
> +    }
> +
> +    printf("The name is %s\n", name);
> +    *prop_ptr = list;
> +}
> +
> +const PropertyInfo qdev_prop_kvm_pmu_filter = {
> +    .name = "KVMPMUFilter",
> +    .description = "der der",
> +    .get = get_kvm_pmu_filter,
> +    .set = set_kvm_pmu_filter,
> +};
> 
> +#define DEFINE_PROP_KVM_PMU_FILTER(_name, _state, _field) \
> +    DEFINE_PROP(_name, _state, _field, qdev_prop_kvm_pmu_filter, \
> +                KVMPMUFilter *)
> 
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2439,6 +2441,7 @@ static Property arm_cpu_properties[] = {
>                          mp_affinity, ARM64_AFFINITY_INVALID),
>      DEFINE_PROP_INT32("node-id", ARMCPU, node_id, CPU_UNSET_NUMA_NODE_ID),
>      DEFINE_PROP_INT32("core-count", ARMCPU, core_count, -1),
> +    DEFINE_PROP_KVM_PMU_FILTER("kvm-pmu-filter", ARMCPU, kvm_pmu_filter),
>      DEFINE_PROP_END_OF_LIST()
>  };
> 
> And I guess I can use the new json format input like below:
> 
> qemu-system-aarch64 \
> 	-cpu host, '{"filter": [{"action": "a", "start": 0x10, "end": "0x11"}]}'
> 
> But it doesn't work. It seems like because the -cpu option doesn't
> support json format parameter.
> 
> Maybe I'm wrong. So I want to double check with if the -cpu option
> support json format nowadays?

As far as I can see, -cpu doesn't support JSON yet. But even if it did,
your command line would be invalid because the 'host,' part isn't JSON.

> If the -cpu option doesn't support json format, how I can use the QAPI
> for kvm-pmu-filter property?

This would probably mean QAPIfying all CPUs first, which sounds like a
major effort.

Kevin

