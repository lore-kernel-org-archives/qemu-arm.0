Received: by 2002:a17:906:b1d4:b0:98d:b2f5:1316 with SMTP id bv20csp570209ejb;
        Fri, 7 Jul 2023 08:25:49 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEjg+LFZ3rD9FFSiq/AIc8JsfOW8oTy8uscuAfNixvB4ujkcmCVnI1OBSfBc6c/ldNBl9jB
X-Received: by 2002:a05:620a:2884:b0:765:8f07:da2a with SMTP id j4-20020a05620a288400b007658f07da2amr4652143qkp.48.1688743549283;
        Fri, 07 Jul 2023 08:25:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688743549; cv=none;
        d=google.com; s=arc-20160816;
        b=Z4BJK+R7EAlkv2Y6detC7tk5qy947Ddeq+gXJkRQqCryTScqHxjVjOQHdLCer5wiQi
         49Yo+ddaDq+nXjysmu30W2WKQsitIh1g5lWhn28O5Zdxcm7up3sVGhxLjxhitO08fbmZ
         AqPaUymd7m/bANF3beA1xK8Jh0hPdmZ+59ujrw5QYdmIr79GyDVfSorU1oKe+q6vOtl9
         YSE29brtIqMRj8Mi+kAGboy+rBBq22dI1F8HnMvQYT3UPdl7T+0/YntGVgf/p0/BfaS6
         i6YXK8byCvRo1pMnmbj06sZgfuTSTF9qcjxHv+pnfyTscxbn+IXsIZTAcVMLiGfAQzeQ
         AOGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=pq5rOSjo84qNYMYnGvkPqfDjHSVDoIcIKZWcz6gNrYk=;
        fh=/7EjQ5v2xYMT85I+VdVGrkRV05Ll5rz5vDGTt8hbELI=;
        b=d4SAuCZnwGmyeUxugOaUTQkWp6KwujhsLVzTQAmaesnBtd7d1JvPdcL/x2EPRMXFZB
         kP2EB7DTmcffCTqVYKCW2D8Zp8rrQ/PAiTvj22YPLw7AQBECpeZFVBWmBSHaMuIQAmVQ
         yLpZWAlPgcNeT3i/VVFkTtrT6TCD16T0JL+h/d4o5oIAjXFZmCPlflgYO7Z5tIoBDUrq
         Ri00hayM18P63lCX5+Lud9MAkglrDIqnSGbxIl4/F8A4oaEvmOwJjVGrhg5o46pFjTmx
         RbM2QYriAWVydWIQcJBIMmibmr7ikCQLzGpJePJsp81bvfWIotuuImqmNghdo7HqstEv
         PO/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rkXTpIQt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dc33-20020a05620a522100b00765e579f0f3si2783413qkb.694.2023.07.07.08.25.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jul 2023 08:25:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rkXTpIQt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qHnKa-00083M-Bd; Fri, 07 Jul 2023 11:25:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qHnKY-00082s-MC
 for qemu-arm@nongnu.org; Fri, 07 Jul 2023 11:25:10 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qHnKX-0004hl-2T
 for qemu-arm@nongnu.org; Fri, 07 Jul 2023 11:25:10 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-313e742a787so1766230f8f.1
 for <qemu-arm@nongnu.org>; Fri, 07 Jul 2023 08:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688743507; x=1691335507;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pq5rOSjo84qNYMYnGvkPqfDjHSVDoIcIKZWcz6gNrYk=;
 b=rkXTpIQtwSWCQHzdlgyLdKQtEgkmQnNMyMZUxfvxwUjj5R8zx2JjIWeYmzdB3zVJle
 werOUJ5Kpr/p315V/2iYqga4HLt8yd9lhiglq9DZGgp61E4skCQwlxY+a5peHYbqfJLP
 4jbUSSJCjQz9Ouzon4PJZsPRCr056JDdKNd92eAAVskwGBpXorDYqeS/wvaq8Pdat20x
 fO3eepyFV0Axx3rwELB/iCCd6QaYhpKRzKycxwBJfjLNE0G44dePyJbkPrTbPcf7Shvd
 RJwIVUpAhUqcbD+zeh6NN86B5wup5RPGDb1Kc2R/uUAy3IZX5mlgu2NIGTk0WSwPPvGC
 qhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688743507; x=1691335507;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pq5rOSjo84qNYMYnGvkPqfDjHSVDoIcIKZWcz6gNrYk=;
 b=XgBshVS7qqS2KejhUS3zD+jueW6W6eJjS4uwSovys24w4qupx0X3TITwhgFonIo9Lm
 S3mPc+C3kEfHMJw4jhzg5cWN1Al6mEsV+JOyJRzQgkxAEE/q3LvWhJuZ7tuZJrzGak6r
 0Z3hTOu4h/1/MaxEqLDWORloY2ng0Pu4p0NziFfx02hntezTVUh8oap8tpyvtmHoKpod
 o5MpTpfD6RO4BpYcBsWthhB3xuDYLIrc9oL5LIuPAoKKQlf3BvfXIC13f0EL2mNFS2bV
 pkOcm4U29o+B02OrLOwXzfMqPJanJjvE2MLZMSdKSwfMQVBzMjgKzWI/+3NG1vnbI62t
 TbjA==
X-Gm-Message-State: ABy/qLZxBdydtb7Eyum7H38u0ihmBR0UAe9Ll+ZCiT03K0CtmFHo0QpZ
 lIJFzpcjNmHkFVTjhCA+zResbA==
X-Received: by 2002:adf:f08f:0:b0:314:1f0:5846 with SMTP id
 n15-20020adff08f000000b0031401f05846mr7621310wro.19.1688743506817; 
 Fri, 07 Jul 2023 08:25:06 -0700 (PDT)
Received: from myrica ([2.219.138.198]) by smtp.gmail.com with ESMTPSA id
 f19-20020a7bcc13000000b003fa973e6612sm2743921wmh.44.2023.07.07.08.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 08:25:06 -0700 (PDT)
Date: Fri, 7 Jul 2023 16:25:06 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 mst@redhat.com, zhenzhong.duan@intel.com,
 alex.williamson@redhat.com, clg@redhat.com, bharat.bhushan@nxp.com,
 peter.maydell@linaro.org
Subject: Re: [PATCH v2 0/2] VIRTIO-IOMMU/VFIO page size related fixes
Message-ID: <20230707152506.GB4060098@myrica>
References: <20230705165118.28194-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705165118.28194-1-eric.auger@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: EadesFnooEGm

On Wed, Jul 05, 2023 at 06:51:16PM +0200, Eric Auger wrote:
> When assigning a host device and protecting it with the virtio-iommu we may
> end up with qemu crashing with
> 
>     qemu-kvm: virtio-iommu page mask 0xfffffffffffff000 is incompatible
>     with mask 0x20010000
>     qemu: hardware error: vfio: DMA mapping failed, unable to continue
> 
> This happens if the host features a 64kB page size and constraints
> the physical IOMMU to use a 64kB page size. By default 4kB granule is used
> by the qemu virtio-iommu device and this latter becomes aware of the 64kB
> requirement too late, after the machine init, when the vfio device domain is
> attached. virtio_iommu_set_page_size_mask() fails and this causes
> vfio_listener_region_add() to end up with hw_error(). Currently the
> granule is global to all domains.
> 
> To work around this issue, despite the IOMMU MR may be bypassed, we
> transiently enable it on machine init done to get vfio_listener_region_add
> and virtio_iommu_set_page_size_mask called ealier, before the domain
> attach. That way the page size requirement can be taken into account
> before the guest gets started.
> 
> Also get benefit of this series to do some cleanups in some traces
> which may confuse the end user.

For both patches:

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Tested-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

