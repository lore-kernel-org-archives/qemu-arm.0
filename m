Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp46642njb;
        Fri, 6 Sep 2024 04:51:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXxNEJMCbx0TTKwbkw3rIubJnMn0rgQvgKGkLxo6PB+TVEQ4nDbNn2GdOUTr/dr/Asi2N5tmsz6VjOtqw==@linaro.org
X-Google-Smtp-Source: AGHT+IFoEs+bXEFIrNkHDuAMY4Vo6V13LM9NJ96BJ3rRw8YJ+eL3r75Z6kqM6426yfXVw80sv8Xd
X-Received: by 2002:a05:690c:2707:b0:6b1:61e0:5359 with SMTP id 00721157ae682-6db44f1ac20mr21453597b3.21.1725623461941;
        Fri, 06 Sep 2024 04:51:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725623461; cv=none;
        d=google.com; s=arc-20240605;
        b=eXBK8CV0lmLiCID0itJ9misbIa6eWB5xmpEGhMQ7PKQptsbGPz52VOpSqlhUv8K9+y
         MNct3WMO8LyzckkX07QCtS4ZMChD9lRrvcnxk9+vwLrNnArZUwkl1nOXguUiEz0FSrKl
         uP8MV+jiG8CrPJJkIm8D5Kp8FeoRavnT8mPdOIkXuNm4jvYuTkOi48f7e8E2VpPNynTW
         cUhtY9vayi2wNxZs0ANFFQDWneP29QF78tt7UiwVQwqs+zG21kzOUK95qi7Ul1jWf9v7
         WqjJsfdoJM4xgiXJ1Fouvx31XPIFDEt1Q5iHeuIT4lVXmKjt6Rd9A+Hi0ulh8aNIyL7L
         L9iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=yD9ZKDvPHEMBvsnNFGn3/vFLSBz7HgG50uElQpcLwtY=;
        fh=p+pS5pXnUAkaqAYuB2y/UsN9Gheva0qYanZqnzXaJYE=;
        b=GyTYWqc6CVdDxrEk50MBZJLGqq6tVC0YI0QH6pwV3WVsRz/ddlf/gkL994pjJW+OnG
         RLsiG/HrBNQf59Oq5dGR7Z1xvUFGiBbSDqcYNJ/JWdmke1RxVaaAjl+r8WvkjSlvapWU
         wjr09X0dyJbGGN1SYo53qZKsUFfViQxbkuUr4cCk9r+ArHIbs2T4XYPL8EwnJN4B9aKS
         ObZkeE+kEC59bw1CsZwHHSAPffRr3POWwocZaU30eJV0eRnobfmOfyghgcK8P/eWyPp6
         5LolHHjUsHjPAmAxyFPTMfJ2JdndfgdVJvURpD/Pjv6ukNpFhddTfs5djz66Q5bxoQX4
         /5/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=zZLcOW47;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a9a10265cbsi12048485a.164.2024.09.06.04.51.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Sep 2024 04:51:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=zZLcOW47;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1smXUH-0004KW-E0; Fri, 06 Sep 2024 07:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1smXUF-00048y-IW
 for qemu-arm@nongnu.org; Fri, 06 Sep 2024 07:50:47 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1smXUD-0006wx-Av
 for qemu-arm@nongnu.org; Fri, 06 Sep 2024 07:50:47 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42bba6a003bso38375e9.0
 for <qemu-arm@nongnu.org>; Fri, 06 Sep 2024 04:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1725623443; x=1726228243; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yD9ZKDvPHEMBvsnNFGn3/vFLSBz7HgG50uElQpcLwtY=;
 b=zZLcOW47Rpl2StItzg1AxM0bPxAKyJot4NpyB3vXmVfTHrwV5toQdP68TuqIj3iCry
 he/L5PuyBs6DC0W779cMxFjqgchStUi12Hsm/mp+RvZhudELD57m3wxz/A6Jn9PUFS+/
 I1fxRm5wtxw2RowdQ6IdnP5P7y9jFDVvr7HWOrGOnXG8NbJAyFf+IM35pnFY/EZ49qXn
 GoJuVcyHklE2SAwnIuD4Z6axWcNOCB5bt5vY5DVzSKDy0hdUs/FKJITuFKHBD9KijrgP
 4HL6xvGkplTzCu7puTnE9zAX023AtmEO6iXSM88RA6A22jjEKz96r/OWS8q0n1FRlgu3
 FULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725623443; x=1726228243;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yD9ZKDvPHEMBvsnNFGn3/vFLSBz7HgG50uElQpcLwtY=;
 b=VWa/Mq3bVyK5VrTWn7a7JpEeJe+7W+20eTpxJ4EAhAqmlx/mu9r2W0NYr44QtWCzJI
 YeDcZNec6ilIv3CMUklNks+/Ji6pKJId4VulIFQKY4byb7LDTCnBAfGXnstPQ+iyT0Lh
 +V7rv4ghXTysDa+6L/b2H1K3HADpkUE8/K6WgSqc5EOBrYHHfOnF6jaEDksJ8+tn3/lK
 uo+TMksW65Hg+Fya6UgZKIL+1gRXBIDfDvh/bkFP8ouFO0AsExfX6y+czfoqBGro8SZe
 f5gYuzKTZyMPSQHbi38guNchg72bFwlG79vJcWE6oSoVEB3wdekaIBzdd4GDfbfZVeTv
 SXQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfcu+hwSMNmSvimSIPSACUoB0XnqXe/B+BL0AGxiAyXeOD71T2FxMYRM13aVO8IoPT/cn0y9Jaew==@nongnu.org
X-Gm-Message-State: AOJu0YzWOyJXKijqXMe5NsNHK4eq2GkI/qfBp35X1mkHwoqIW/fDyCAC
 6g1i25gAIV3dKNC/trOX9i8FYdI1xwuJ96JceqTzOT9FEoKwjm46oZDvTHOlxA==
X-Received: by 2002:a05:600c:1e10:b0:42b:a04f:6eca with SMTP id
 5b1f17b1804b1-42ca0610155mr757205e9.6.1725623442563; 
 Fri, 06 Sep 2024 04:50:42 -0700 (PDT)
Received: from google.com (109.36.187.35.bc.googleusercontent.com.
 [35.187.36.109]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ca05c6fcesm18230355e9.3.2024.09.06.04.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 04:50:42 -0700 (PDT)
Date: Fri, 6 Sep 2024 11:50:38 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Eric Auger <eric.auger@redhat.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Moritz Fischer <mdf@kernel.org>, Michael Shavit <mshavit@google.com>,
 Andrea Bolognani <abologna@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: Re: nested-smmuv3 topic, Sep 2024
Message-ID: <ZtrsjoCvwZFYFEjS@google.com>
References: <ZtlrLJzZqpnUrZQf@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtlrLJzZqpnUrZQf@Asurada-Nvidia>
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=smostafa@google.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ytrmfZ8Hso8+

Hi Nicolin,

On Thu, Sep 05, 2024 at 01:26:20AM -0700, Nicolin Chen wrote:
> Hi all,
> 
> Hope I didn't miss anybody who is related to the topic. Please,
> feel free to add!
> 
> <--- Background --->
> As some of you know, there is an ongoing effort for nested-smmuv3
> support in QEMU on ARM, working with the kernel IOMMUFD uAPIs:
> [Nesting for vSTE]
> https://lore.kernel.org/linux-iommu/0-v2-621370057090+91fec-smmuv3_nesting_jgg@nvidia.com/
> [Nesting for invalidations]
> https://lore.kernel.org/linux-iommu/cover.1724776335.git.nicolinc@nvidia.com/
> 
> The kernel patches are still under review. Jason and I are hoping
> them to get merged at next cycle for v6.13, which means the QEMU
> patches might start a review process as early as Nov/Dec?
> 
> That being said, I think we are way behind the point that patches
> can get reviewed: most of the QEMU patches on my branches weren't
> touched very often, but merely updated to the latest kernel uAPIs
> for verification. So, I feel this might be a good point to gather
> folks together to discuss about the possible timeline and ask for
> help. I think this would potentially help folks who are going to
> attend the KVM forum (or LPC) to carry out a discussion. (Sorry,
> I won't make it due to some conflict..)
> 
> <-- Task Breakdown --->
> I previously sent a RFCv1 series collecting comments/suggestions,
> for multi-vSMMU instance design in ARM Virt code:
> https://lore.kernel.org/qemu-devel/cover.1719361174.git.nicolinc@nvidia.com/
> (And thanks again for all the inputs!)
> 
> The main takeaway from the discussion is to
> 1) Turn the vSMMU module into a pluggable one, like intel-iommu
> 2) Move the per-SMMU pxb bus and device auto-assign into libvirt
> 
> Apart from the multi-vSMMU thing, there's basic nesting series:
> 0) Keep updating to the latest kernel uAPIs to support nesting
> 
> I was trying to do all these three, but apparently too ambitious.
> The kernel side of work is still taking a lot of my bandwidth. So
> far I had almost-zero progress on task (1) and completely-zero on
> task (2).
> 
> <-- Help Needed --->
> So, I'm wondering if anyone(s) might have some extra bandwidth in
> the following months helping these two tasks, either of which can
> be a standalone project I think.

I don’t have plans to work on qemu in the next months, most of my
upstream focus will be on pKVM SMMUv3 support[1] in Linux which might
overlap with some of the vSMMU work but in the kernel side.

Otherwise, I’d be happy to review patches.

[1] https://lore.kernel.org/kvmarm/20230201125328.2186498-1-jean-philippe@linaro.org/

Thanks,
Mostafa

> 
> For task (0), I think I can keep updating the uAPI part, although
> it'd need some help for reviews, which I was hoping to occur after
> Intel sends the QEMU nesting backend patches. Once we know how big
> the rework is going to be, we may need to borrow some help at that
> point once again..
> 
> Thank you
> Nicolin
