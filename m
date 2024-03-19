Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1471960ejb;
        Tue, 19 Mar 2024 11:08:02 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVivVP/pjvhUkSNPRnpuF8MUudTqlJCDSURuyl1iMnErjpUJbCgy519N7gH8wsBntb0sdq4AEqwVB5qdYy7MxmtoZuE7Cg2
X-Google-Smtp-Source: AGHT+IHUHmMBOOHykiZ9vbaTTLCUQf5+pYoTGOlQrJn2C1sDvzJcXhvtDt3l9u8Pzh+2H54KJKYG
X-Received: by 2002:a05:6402:3901:b0:568:b9cf:3a4b with SMTP id fe1-20020a056402390100b00568b9cf3a4bmr7285592edb.35.1710871681895;
        Tue, 19 Mar 2024 11:08:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1710871681; cv=pass;
        d=google.com; s=arc-20160816;
        b=g22U+SKUeYzPTK9SsGAkRsvDOq/GU8CptRDAgxaSue4BGIQOP1nS3gDVacTS4phk8y
         cn5AwuUiSjYDhk89bR+GBInUiXXePLb0BAtMTeIRzhYTR8lJo1ec1KntY1zD9ned6ih0
         ZW+Ow+aw3xjiG8apmEmY7Trjhh/B9tzMyGtAFvwZtkpiv//xP9tGRQv7hZxKzx6M0vqD
         rPvIN1x6QhCliOTdEEyJ2yH9inSyFbBChH8xxuMIHx5CQvmgxUv9YToPlA8nYtNxiWpa
         P+Dwj0jKQqR4p/J0XbxQftx2MUEVGD7e4qCsZDWu/ujH3Rxrsd+gTxSLOIlP9ks+66gD
         ovYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:list-unsubscribe:list-subscribe
         :list-id:precedence:references:reply-to:message-id:subject:cc:to
         :from:date:dkim-signature;
        bh=VWp7xEBQhmkS/WPvgx1mvlXZVR4gYbNBkwlsQq0v4mw=;
        fh=Ei5HHX/zhQ6a9EcvDi5kxJJNwElYLNOTNhnHa88sxdc=;
        b=bp+oG+3P4sgWBIkMxkFD0L72uUNRZcj7F3xYo6vpFzMvobM9PiaMotX4EAtxLkFXSF
         iVCYfhElevbONz2cuFZ2RVa0W/kB5GytvKI6iLrNf5bvoslz5X1gCH0cK9ifSmj4i9Se
         ydGAKlVhmPkIQ9ynibjP3yoFsJE0pfnqHClyQ2qvTPh6L9LiOqkvzI37p4yi+IYTxdPR
         i1wW4J/zNQyNCJpDX3QN2WPWxyAC17fH8tZEVaaBOHE6gtsT23frtIfMMQ2SvLXGXol6
         IotTHVYCdFqx4r5ELbgPaH/YfzUldbjj4OrEhRRAVJi9hd2QCxii+yD76dGg4KZFQZiO
         aHRg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FG1ohEhx;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-12174-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-12174-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-12174-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id b10-20020a056402084a00b0056445f4ade6si5864589edz.234.2024.03.19.11.08.01
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 11:08:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-12174-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FG1ohEhx;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-12174-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-12174-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A17B1F22C33
	for <alex.bennee@linaro.org>; Tue, 19 Mar 2024 18:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4649A2C68C;
	Tue, 19 Mar 2024 18:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FG1ohEhx"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F48286AC
	for <kvm@vger.kernel.org>; Tue, 19 Mar 2024 18:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710871670; cv=none; b=DUl2VvL1RLHYJZuTbjwkw+SD75LHzf74KjJT0fUzBvJepgel4wFxINpie9zO+qcyYTYmwqmUTcYwCsIzGktbO2+rKLzKYdDxoWitq4nd0bc7tW1ODcxDdZtxOZdoG41JJo8/3qGZMsFTP5zDlMbnX6GmnohdVBjhLTZf76/zioQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710871670; c=relaxed/simple;
	bh=xPskS2uWFd/Zf9mOy+x2JDEFwYWF44oUQHx0rmCObUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GPjM6wZtmmZfVb3GRtHTQDkjr+W46cOJcTn2hw1Uy4yrKohEM3HpemAL0gqvur7ENbfRwx86l1QhJqtDw2fs0rnnilQZNcJP15kNJWINu8LkoQ2Mwq/evjQGx2njsvN3m/Hiud0NK1JBHm+JFbenQaS2V2Kq1EwDVW19uOxMxiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FG1ohEhx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710871667;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VWp7xEBQhmkS/WPvgx1mvlXZVR4gYbNBkwlsQq0v4mw=;
	b=FG1ohEhxw5x4EF9dJej1PO84dN5ONE/zk/tiHxhktcWldSdIeBBaITJjlVT/q/VF86U4gb
	HeapjwYAV9G1yrgeUrZL+4NQXXhPkD00H4wG98r5NZxSy6va8yAY8xdkRVQVIuHcBq4l41
	CruNXOOROG10aHMpQCBZJEeyQt18two=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-q2iMwBpROIuABlfBz2jwkQ-1; Tue, 19 Mar 2024 14:07:42 -0400
X-MC-Unique: q2iMwBpROIuABlfBz2jwkQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E72285CE41;
	Tue, 19 Mar 2024 18:07:42 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.88])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D5AA492BD0;
	Tue, 19 Mar 2024 18:07:39 +0000 (UTC)
Date: Tue, 19 Mar 2024 18:07:32 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Auger <eauger@redhat.com>
Cc: Shaoqin Huang <shahuang@redhat.com>, qemu-arm@nongnu.org,
	Sebastian Ott <sebott@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org
Subject: Re: [PATCH v7] arm/kvm: Enable support for KVM_ARM_VCPU_PMU_V3_FILTER
Message-ID: <ZfnUZKf3p8jv2yEM@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240221063431.76992-1-shahuang@redhat.com>
 <ZfmtxxlATpvhK61y@redhat.com>
 <84e01fa8-0de6-4d2b-8696-53cd3c3f42fa@redhat.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84e01fa8-0de6-4d2b-8696-53cd3c3f42fa@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-TUID: MrUST35IAQf4

On Tue, Mar 19, 2024 at 06:58:33PM +0100, Eric Auger wrote:
> Hi Daniel,
> 
> On 3/19/24 16:22, Daniel P. Berrangé wrote:
> > On Wed, Feb 21, 2024 at 01:34:31AM -0500, Shaoqin Huang wrote:
> >> The KVM_ARM_VCPU_PMU_V3_FILTER provides the ability to let the VMM decide
> >> which PMU events are provided to the guest. Add a new option
> >> `kvm-pmu-filter` as -cpu sub-option to set the PMU Event Filtering.
> >> Without the filter, all PMU events are exposed from host to guest by
> >> default. The usage of the new sub-option can be found from the updated
> >> document (docs/system/arm/cpu-features.rst).
> >>
> >> Here is an example which shows how to use the PMU Event Filtering, when
> >> we launch a guest by use kvm, add such command line:
> >>
> >>   # qemu-system-aarch64 \
> >>         -accel kvm \
> >>         -cpu host,kvm-pmu-filter="D:0x11-0x11"
> > 
> > snip
> > 
> >> @@ -517,6 +533,12 @@ void kvm_arm_add_vcpu_properties(ARMCPU *cpu)
> >>                               kvm_steal_time_set);
> >>      object_property_set_description(obj, "kvm-steal-time",
> >>                                      "Set off to disable KVM steal time.");
> >> +
> >> +    object_property_add_str(obj, "kvm-pmu-filter", kvm_pmu_filter_get,
> >> +                            kvm_pmu_filter_set);
> >> +    object_property_set_description(obj, "kvm-pmu-filter",
> >> +                                    "PMU Event Filtering description for "
> >> +                                    "guest PMU. (default: NULL, disabled)");
> >>  }
> > 
> > Passing a string property, but....[1]
> > 
> >>  
> >>  bool kvm_arm_pmu_supported(void)
> >> @@ -1706,6 +1728,62 @@ static bool kvm_arm_set_device_attr(ARMCPU *cpu, struct kvm_device_attr *attr,
> >>      return true;
> >>  }
> >>  
> >> +static void kvm_arm_pmu_filter_init(ARMCPU *cpu)
> >> +{
> >> +    static bool pmu_filter_init;
> >> +    struct kvm_pmu_event_filter filter;
> >> +    struct kvm_device_attr attr = {
> >> +        .group      = KVM_ARM_VCPU_PMU_V3_CTRL,
> >> +        .attr       = KVM_ARM_VCPU_PMU_V3_FILTER,
> >> +        .addr       = (uint64_t)&filter,
> >> +    };
> >> +    int i;
> >> +    g_auto(GStrv) event_filters;
> >> +
> >> +    if (!cpu->kvm_pmu_filter) {
> >> +        return;
> >> +    }
> >> +    if (kvm_vcpu_ioctl(CPU(cpu), KVM_HAS_DEVICE_ATTR, &attr)) {
> >> +        warn_report("The KVM doesn't support the PMU Event Filter!");
> > 
> > If the user requested a filter and it can't be supported, QEMU
> > must exit with an error, not ignore the user's request.
> > 
> >> +        return;
> >> +    }
> >> +
> >> +    /*
> >> +     * The filter only needs to be initialized through one vcpu ioctl and it
> >> +     * will affect all other vcpu in the vm.
> >> +     */
> >> +    if (pmu_filter_init) {
> >> +        return;
> >> +    } else {
> >> +        pmu_filter_init = true;
> >> +    }
> >> +
> >> +    event_filters = g_strsplit(cpu->kvm_pmu_filter, ";", -1);
> >> +    for (i = 0; event_filters[i]; i++) {
> >> +        unsigned short start = 0, end = 0;
> >> +        char act;
> >> +
> >> +        if (sscanf(event_filters[i], "%c:%hx-%hx", &act, &start, &end) != 3) {
> >> +            warn_report("Skipping invalid PMU filter %s", event_filters[i]);
> >> +            continue;
> > 
> > Warning on user syntax errors is undesirable - it should be a fatal
> > error of the user gets this wrong.
> > 
> >> +        }
> >> +
> >> +        if ((act != 'A' && act != 'D') || start > end) {
> >> +            warn_report("Skipping invalid PMU filter %s", event_filters[i]);
> >> +            continue;
> > 
> > Likewise should be fatal.
> > 
> >> +        }
> >> +
> >> +        filter.base_event = start;
> >> +        filter.nevents = end - start + 1;
> >> +        filter.action = (act == 'A') ? KVM_PMU_EVENT_ALLOW :
> >> +                                       KVM_PMU_EVENT_DENY;
> >> +
> >> +        if (!kvm_arm_set_device_attr(cpu, &attr, "PMU_V3_FILTER")) {
> >> +            break;
> >> +        }
> >> +    }
> >> +}
> > 
> > ..[1] then implementing a custom parser is rather a QEMU design anti-pattern,
> > especially when the proposed syntax is incapable of being mapped into the
> > normal QAPI syntax for a list of structs should we want to fully convert
> > -cpu to QAPI parsing later. I wonder if can we model this property with
> > QAPI now ?
> I guess you mean creating a new property like those in
> hw/core/qdev-properties-system.c for instance  and populating an array
> of those at CPU object level?

Yeah, something like the IOThreadVirtQueueMapping data type would
be the more QAPI like code pattern.

> Note there is v8 but most of your comments still apply
> https://lore.kernel.org/all/20240312074849.71475-1-shahuang@redhat.com/

Yes, sorry I just saw Peter's query about libvirt on this v7 and
didn't think to look for a newer version

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

