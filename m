Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1988882lfg;
        Mon, 23 Aug 2021 08:53:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7Po8r2UeH4YRxzZPBz5kqlCjGkrg4IOZDELzCBhMFFFFKN9xQC1lqNHFqhVLAdEOvoO8u
X-Received: by 2002:a05:6e02:1906:: with SMTP id w6mr24863203ilu.295.1629734016111;
        Mon, 23 Aug 2021 08:53:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629734016; cv=none;
        d=google.com; s=arc-20160816;
        b=lMkb061Kv8/hzhG6WZWg4frm08erUE8vk73cQAB6DLxvH+6Q+UgjkywZXU+F30q5pv
         DVB1NDahrZbHERUzD3zm2QSjJ6UO/fTDuUguTVpMlXt0VRTb8VEtK8VgXU4D99OqXjcO
         hvB2hQerRYV75DfYWikTTw6D5vQon9hGsBIGt/VChwCuhFIFIVy2Y5md8NtEIvwEajB7
         y2aVxDU5h3CRzfLTB0TjERaBSGIS5j/rISRrznjT2VFesBY37CgrCQkGjhVOiMMX530D
         BxJS45GLnO+/XKTu6Yz4nYFJeK+/Q8O9MGGnOW94Wga2RONzXTyWcTGPpAV3VNMuh5GQ
         9G5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=hXnCLG9H71lVP40TV9sgoIc+jcNtRZ32L0RgRK0BSZI=;
        b=kff062xuph8rBkHn0aleoSpuxU3whp8QIHYi0znA4Pjj8sfqhQWoNeJVzRP7mIS4aZ
         E10QMA/ZFJ6fEsCgf0D9ulpa0GXS4pFTBfcrACgqnjWNrgev5JDREnwOeCVRSimH85Pa
         088dnniqg8/YFUfhQ+DoOOJ6MdVK9AdXz8JVyPxbPBXNzhz5hqxBEfowF8WJDlyF5GLX
         LLF1tmFu289jW6ZQnf/kWYliKSn3lhpaCqwnJYT49BspExJlyk5bDbeYeQ/P2NZG749K
         ugW8MiBtaL270k1D9xhNI6fTsmeOvyhHVONdBaChGGXWpQuwm0TnS+mIxjGI6Pkut8RS
         QLZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=At59z8fv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11si8144083jau.60.2021.08.23.08.53.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 08:53:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=At59z8fv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mICGV-00043D-EA
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 11:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mICGM-00041e-Pd
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 11:53:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mICGL-00086W-97
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 11:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629734004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hXnCLG9H71lVP40TV9sgoIc+jcNtRZ32L0RgRK0BSZI=;
 b=At59z8fvR5JFW5WxR7JzMuHG0ZnaXORAgOMxecwCPSMTiqrHfGTPZ4UwyVXVm2qFuFWa/O
 Zq+QxHr6QLnJdCy7dM5PDW+ujjhrNCN/KRR83ClaWS9u2SiM/ciNXmQHXYKEaCTqaU6v9N
 nBBf71kj6pJU4iFvNxp2HiIjculZOCw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-isove-pJPt2n3K1dDHvy-A-1; Mon, 23 Aug 2021 11:53:23 -0400
X-MC-Unique: isove-pJPt2n3K1dDHvy-A-1
Received: by mail-ed1-f70.google.com with SMTP id
 x4-20020a50d9c4000000b003bed5199871so8943563edj.14
 for <qemu-arm@nongnu.org>; Mon, 23 Aug 2021 08:53:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hXnCLG9H71lVP40TV9sgoIc+jcNtRZ32L0RgRK0BSZI=;
 b=YbgOkJluJ0Lcw/xiqUGmx4b7PMv+MFEgki6+EmpLCouDh//9LiS972mLEvfoOIPemm
 oHD9gOteD+rULpp2J64HyTFv0lrfBW+9J5EZU3Wu5UltF5biV1phF4mPkDNb44NTsJqo
 0bplpghLnaYP/C1fQIw+c6GgfYWZyTBFmizS1c5OgWTu+EChLzVGFBX5YXId7Q/I0M2D
 jZwrzv+u34XRinIBPOOkx1bteQO0lrL0ja+uv22wDEj3xOJU3PMxDlh95nCLbKLZVvJR
 JbXL70GFSmVrWjEBpom90BRoVNxlbHczyLznMfAa339ovHGLWJltxKPhDujyFaro7NCc
 KOog==
X-Gm-Message-State: AOAM533MPV+EKeNLmClDMmmXk6BwOWDDBUBkG4d7wdOrDKX9OnAqBYIc
 U6AcbjqFlU3nRwLxp7qHnYfLSwofg7riGHzmpC73EsJritnowRKxbHhAK5PfIFrzEWYnGYPHcrC
 FL+rVBESmbkPt
X-Received: by 2002:a05:6402:34d5:: with SMTP id
 w21mr38872175edc.210.1629734002251; 
 Mon, 23 Aug 2021 08:53:22 -0700 (PDT)
X-Received: by 2002:a05:6402:34d5:: with SMTP id
 w21mr38872160edc.210.1629734002057; 
 Mon, 23 Aug 2021 08:53:22 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id n23sm9755721eds.41.2021.08.23.08.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 08:53:21 -0700 (PDT)
Date: Mon, 23 Aug 2021 17:53:20 +0200
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 0/4] target/arm/cpu: Introduce sve_vq_supported bitmap
Message-ID: <20210823155320.6pr3432lzoihn32a@gator.home>
References: <20210819193758.149660-1-drjones@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210819193758.149660-1-drjones@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 ishii.shuuichir@fujitsu.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n8w1Jgx+OoFn

On Thu, Aug 19, 2021 at 09:37:54PM +0200, Andrew Jones wrote:
> While reviewing the new A64FX CPU type it became clear that CPU
> types should be able to specify which SVE vector lengths are
> supported. This series adds a new bitmap member to ARMCPU and
> modifies arm_cpu_sve_finalize() to validate inputs against it.
> So far we only need to set the bitmap for the 'max' CPU type
> though and, since it supports all vector lengths, we just fill
> the whole thing.
> 
> This series was inspired by Richard Henderson's suggestion to
> replace arm_cpu_sve_finalize's kvm_supported bitmap with something
> that could be shared with TCG.
> 
> So far I've only lightly tested this. I'll do more testing and
> report back later. I'd also be happy to get test results from
> others.

I did more testing and it looks good to me except for the extra
space in an error message that I reported in patch 4.

Thanks,
drew

> 
> Thanks,
> drew
> 
> Andrew Jones (4):
>   target/arm/cpu: Introduce sve_vq_supported bitmap
>   target/arm/kvm64: Ensure sve vls map is completely clear
>   target/arm/cpu64: Replace kvm_supported with sve_vq_supported
>   target/arm/cpu64: Validate sve vector lengths are supported
> 
>  target/arm/cpu.h   |   4 ++
>  target/arm/cpu64.c | 118 +++++++++++++++++++++------------------------
>  target/arm/kvm64.c |   2 +-
>  3 files changed, 61 insertions(+), 63 deletions(-)
> 
> -- 
> 2.31.1
> 

