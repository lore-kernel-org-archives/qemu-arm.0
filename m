Received: by 2002:a17:907:a184:b0:a52:4db9:938b with SMTP id om4csp1103797ejc;
        Thu, 9 May 2024 02:39:52 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVXl3PlQd4PR/VQPA+3EOl8grHS4Odph+fyjI/cs4cGQIArrEYjNoWYT2b5QmcLqfdzRoOx1/mx8aLVmguVv0s3X+u/TLkw
X-Google-Smtp-Source: AGHT+IF9mTsYrsQfwYkdXtA+8Gj7f8zuy5NcKPzwP8xMVBwzDNDfLYq0sr+OmegwE4yvzv9GX7oo
X-Received: by 2002:a05:6a20:7355:b0:1af:9369:9a3 with SMTP id adf61e73a8af0-1afc8d96dcdmr5853211637.44.1715247592607;
        Thu, 09 May 2024 02:39:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1715247592; cv=pass;
        d=google.com; s=arc-20160816;
        b=hcCszYPJ0D8g7r7rz9Z/y8Um0zw6ftaQ8JViILlHRFDQx2YyXBeBFSg99UMTIeSC+U
         hMIKJ3ynUS8RnC0KTR5iKHYL2vQjN6PPJ8sQiXpfWq7zaGaxCmPc2LnJYl29JdYk3lpe
         lNgleiXtor2aJ3sj890CWLTNHVSqgXxAc9h4Cj6XqgBpq+pWcioQjeN2quoBuKjSnFFD
         7NI6PLnT5tXkQMC4AcFYeudwZv2En30PItZ8PKjEdDI5NxLeg1D4PP33TXEmXMaTiESt
         vSUaQ0O5Bn1tNrSghwpcT/AjcBFK+bwoosEf54/xukeRd22TxVBlmIBmSV5VrycB+Xok
         H5OA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:list-unsubscribe:list-subscribe
         :list-id:precedence:references:reply-to:message-id:subject:cc:to
         :from:date:dkim-signature;
        bh=tWMEfH1X7j3akQx2P26p8Gh6oEBN+jSji0IPEB1N58I=;
        fh=gbj3IL3gSre3K14K9WtWel/zIRuF/biEz8l+yzAE7V8=;
        b=HJAI9YFeRKeWJp8BxXhmVFNmT78sUepursCtI4KS9H+2Jv14000HbExbvTzvIu0yJc
         6YO3G8aI+WqSQk1ps5ufEL+gETB1tpBmVKTylj1+ZSUpdnza7HS4zpFmd4+ttwVyT2/X
         fcXPqDWwsYAYraRLBfV504aY9P0h50W1JngQ4HzcGm4YkdGB7XFAjte+3xE63ZCaVPrs
         wbnvjRdaBOMyYn4gee+KCKkHPD2AC6vdf3+eGItyhKgH9lc6CgU7Mp+6GvCy77k3tV7m
         00WmAK4fH+Omygi1Pp15YJkrpQAkUPL7GvnCK/A71UVap0qWNNH+FIYm0nu7Fw0FqRZq
         kbbg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D8aUc3rd;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-17112-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-17112-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-17112-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2b671589acasi1099310a91.126.2024.05.09.02.39.51
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 02:39:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-17112-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D8aUc3rd;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-17112-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-17112-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 311A4B215B7
	for <alex.bennee@linaro.org>; Thu,  9 May 2024 09:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D4E014A4EF;
	Thu,  9 May 2024 09:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D8aUc3rd"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82623101E3
	for <kvm@vger.kernel.org>; Thu,  9 May 2024 09:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715247585; cv=none; b=ITiuyOmLdzZTx0ZmbwIwI9qwhhpBMcV5acP6Z6OxArAbL17k+JM7TSnhmFrlgMly7ijrumozkT5/eSqGrzUj5XP/ZOkY/MWwK+e60QVxL0LBdB43qjOI85NhvQ8/dW8rxnV3pLJG/wzpcnLIV25nB4r3tOXSrfyRGNcbzZuwiw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715247585; c=relaxed/simple;
	bh=Lcadpx34Y7H9m+FBmBMRGrgztZ5z/dVMxE2W9URQYXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pCiZ/1CzxzVZ6V0iGrgWDcYTrbfuy2DEONbP/o8V3IJk/3yED8IbHuDk0RcvLX66mm5T7di3uPN+MdP78dK1vvB/kjJNFFXeiNV48W3LhZJ6/61+6BZ0DJpVdaSpBXCTbm8X/80I7Y7ECf5a0ZhpRj4rLhREHjyUNHm/hdSvcZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D8aUc3rd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715247582;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tWMEfH1X7j3akQx2P26p8Gh6oEBN+jSji0IPEB1N58I=;
	b=D8aUc3rd+XuFzkQHWz7mEx9MozjYMgpO3WDEWEtNk3yX1snYNdJ1IT2UzYWs9jn0PiIFyP
	l6MqP6XXGFGOHnzEBmwLdivym8mgAlVClyq5ixsiJYnE594UpLrTFwJLqPrFR7ISH4EJOZ
	YGpv27hg6LvGVlHcH2do0Cycn70RqhQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-447-2eHFyz4kP56sIUOQky0lJw-1; Thu,
 09 May 2024 05:39:38 -0400
X-MC-Unique: 2eHFyz4kP56sIUOQky0lJw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 699103C0C101;
	Thu,  9 May 2024 09:39:38 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.142])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 03605C15BB9;
	Thu,  9 May 2024 09:39:35 +0000 (UTC)
Date: Thu, 9 May 2024 10:39:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Shaoqin Huang <shahuang@redhat.com>, qemu-arm@nongnu.org,
	Eric Auger <eauger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@intel.com>
Subject: Re: [PATCH v9] arm/kvm: Enable support for KVM_ARM_VCPU_PMU_V3_FILTER
Message-ID: <ZjyZ1ZV7BGME_bY9@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240409024940.180107-1-shahuang@redhat.com>
 <Zh1j9b92UGPzr1-a@redhat.com>
 <Zjyb43JqMZA+bO4r@intel.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zjyb43JqMZA+bO4r@intel.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-TUID: wLRIyCJNOkux

On Thu, May 09, 2024 at 05:48:19PM +0800, Zhao Liu wrote:
> Hi Daniel & Shaoqin,
> 
> Since x86 also needs to implement PMU filter feature, though it uses
> the different KVM ioctl, we can still make the QEMU API as general as
> possible.
> 
> To move forward with both ARM and x86, I'd like to discuss my API
> thinking with you. ;-)
> 
> On Mon, Apr 15, 2024 at 06:29:25PM +0100, Daniel P. Berrangé wrote:
> > Date: Mon, 15 Apr 2024 18:29:25 +0100
> > From: "Daniel P. Berrangé" <berrange@redhat.com>
> > Subject: Re: [PATCH v9] arm/kvm: Enable support for
> >  KVM_ARM_VCPU_PMU_V3_FILTER
> > 
> > On Mon, Apr 08, 2024 at 10:49:40PM -0400, Shaoqin Huang wrote:
> > > The KVM_ARM_VCPU_PMU_V3_FILTER provides the ability to let the VMM decide
> > > which PMU events are provided to the guest. Add a new option
> > > `kvm-pmu-filter` as -cpu sub-option to set the PMU Event Filtering.
> > > Without the filter, all PMU events are exposed from host to guest by
> > > default. The usage of the new sub-option can be found from the updated
> > > document (docs/system/arm/cpu-features.rst).
> > > 
> > > Here is an example which shows how to use the PMU Event Filtering, when
> > > we launch a guest by use kvm, add such command line:
> > > 
> > >   # qemu-system-aarch64 \
> > >         -accel kvm \
> > >         -cpu host,kvm-pmu-filter="D:0x11-0x11"
> > 
> > I'm still against implementing this one-off custom parsed syntax
> > for kvm-pmu-filter values. Once this syntax exists, we're locked
> > into back-compatibility for multiple releases, and it will make
> > a conversion to QAPI/JSON harder.
> 
> Daniel, I understand you mean the new specific string format makes
> external API support more complicated, right?
> 
> What about the following options:
> 
> 1. Firstly, add a feature flag option in "-cpu" to enable kvm_filter
> feature for CPU:
> 
> -cpu host,kvm-pmu-filter
> 
> 2. Then use "-object kvm-pmu-event" to configure PMU event properties.
> Since x86's PMU filter has very complex encoding rules, we need the
> following three variants (one for general case, the other two are x86
> specific):
> 
> - General format:
>   -object kvm-pmu-event,action=[allowed|denied],events=[event-list]
> 
>   e.g, as Shaoqin's example,
>   -object kvm-pmu-event,action=allowed,events=0x11-0x11,0x23-0x23
>   -object kvm-pmu-event,action=denied,events=0x23-0x3a
> 
> - x86 raw_event encoding format (for single raw format event encoding):
>   -object kvm-pmu-event,action=[allowed|denied],mode=0,select="0x01",
>           umask="0x3c",fixed-bitmap="0xffffffff"
> 
> - x86 masked_event encoding format (for mutiple masked event encoding):
>   -object kvm-pmu-event,action=[allowed|denied],mode=masked,select="0x01",
>           mask="0x3c",match="0x11",exclude=true|false
> 
> The whole API architecture looks more complex, but has the advantage of
> being as general as possible and avoiding the introduction of new string
> format parsing.
> 
> What do you think? Because the most important thing about this feature
> is the API design, welcome your comments!

Please describe it in terms of a QAPI definition, as that's what we're
striving for with all QEMU public interfaces. Once the QAPI design is
agreed, then the -object mapping is trivial, as -object's JSON format
supports arbitrary QAPI structures.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

