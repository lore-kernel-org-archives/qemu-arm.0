Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3071536lfg;
        Tue, 9 Mar 2021 10:47:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxim1JG1ncwGPcMRfCp6MJ+iCQdwWxecjgeUpyqw5rAbv8/tBYNm7GPCF8gvGh/X1WLoX7n
X-Received: by 2002:a05:6638:1653:: with SMTP id a19mr29660237jat.113.1615315663824;
        Tue, 09 Mar 2021 10:47:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615315663; cv=none;
        d=google.com; s=arc-20160816;
        b=AHK937Qn6l34uKDFX0Arh+8xq0QLx26KCOlbBkDkWHxf7+uI7prupiWq/MLt9s8ESN
         cOBSJ5WQRRWQ3M5l6RBztL7P6COyXJEzAXBuPCnsVHymw1hDZb3RNvzRdr2bLiTmASiy
         hG/PsOHQvE5yJFGwqa9VeLsfwoyxn+p5aDeVrh7t3azzik8JtX6z/EMp4z5/2FVA/FDG
         ZAKsc6/S2Rcut9oVKjP741QiJdBISNCSv+meTzx4UgQ5mG96dlv/kd7P7ZLjfTXXcENI
         w63zEAqYjB4jOLIH+j4KM+1JBjDkXmt2dTzwWLABIEz/c6Ef1wdRIiZo0JbragldYIyl
         dBFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=EEKs5LEaRlIiCJyZrFMOpaM3dTCR4PQ5MGtnoosh7+o=;
        b=Eo4ATGGv8T32pjvgLMHnBuW6NkR+vHfNoSJcQYPbLjImHzKjdZlXRlPWjtr1SIh4du
         3mIzxxwVkFJDumka1pBhhYkwWtd1mwLtZdw9d4L5j0tvd1gYTUb3lmFKIj6sPHADjMty
         qGPyXFDOV8mIQ5gIdcABobEahfTfJRQQhEUm4P+mrRXMQRFe+29pyvgmrFDr3TZK5g4W
         aTv1MO/4X67zfDLevC26InUMtxmzZ40+UWMF6JR5fpixDX3uUeXMWPDJRms48QH9/IFl
         1MkKL1qOPJnKwmU9fdLBTTUJ5hHsDRvpkug/ZPP0mrqpQbEWrC/W8aVbqHgGXlGhXuGv
         crCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GSZsLwjY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b28si13827483jav.105.2021.03.09.10.47.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Mar 2021 10:47:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GSZsLwjY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJhOR-0001Wt-0d
	for alex.bennee@linaro.org; Tue, 09 Mar 2021 13:47:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lJfDm-0006EP-8U
 for qemu-arm@nongnu.org; Tue, 09 Mar 2021 11:28:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lJfDk-0003aj-Tk
 for qemu-arm@nongnu.org; Tue, 09 Mar 2021 11:28:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615307312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EEKs5LEaRlIiCJyZrFMOpaM3dTCR4PQ5MGtnoosh7+o=;
 b=GSZsLwjYjxO3rzsMHlfWhTnHAzdOit4RDXM54InOlQ/z1eK8qkZGfo0pWAMmNnQgs8AW14
 8x9vyNDRNex9ll+UPwVGwwYTgbgk0+avtpaSR/1ygNLybjsgNZ5kK8qzUTR7R0equTGUBD
 hWcTEmPJ+eSZ4BIYWEaeG3K+1Lxs9j4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-cos5fFxGPNOj24rPre9z4w-1; Tue, 09 Mar 2021 11:28:28 -0500
X-MC-Unique: cos5fFxGPNOj24rPre9z4w-1
Received: by mail-qk1-f199.google.com with SMTP id h20so10450702qkj.18
 for <qemu-arm@nongnu.org>; Tue, 09 Mar 2021 08:28:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EEKs5LEaRlIiCJyZrFMOpaM3dTCR4PQ5MGtnoosh7+o=;
 b=BJ8GT8rZUPYa0LJN6z9uSG0qukE1ticuEmyGNTxxJxsdGulv2T1eHhhsat6KhVJemw
 vGpEVgWhdDJq8WxuFNAkf09UOXzzb7T9ss+44tuY9En7SpdJ95x8VuX96NzfkiOKKpZ1
 5yypcDR5vi2WZ+VS0J4RhDPkb2rDQ/Bka4sKn2R3kAM4ah/T84aO8iIPDUtND79eDZe4
 1oCzc98BVXel1Cxh5z+d2LcugN1NcL2H6uj7eZAVkFZ91kLqz2pv9UXTk+imoQ+OBMeP
 1clqVc/HNMDFkURxpGWNyCxslZh/wku1P/QuTtBhcVeGNwmM/wuwdZSqF72Qf3201Nnf
 dbvg==
X-Gm-Message-State: AOAM530TnDuh3zVQfxiEed47kTcIm0ejS1+6tRIduLc/BDoTKMTZw9vx
 yNwvxCBqNCiKXpueJ4B2qTiFihsDDroP0UyQ+w0GNCm03/zij9qobP0FmofD89BX2tWczq+8K2s
 U+7rWWmqN9Z1p
X-Received: by 2002:a05:620a:1369:: with SMTP id
 d9mr26813439qkl.378.1615307308160; 
 Tue, 09 Mar 2021 08:28:28 -0800 (PST)
X-Received: by 2002:a05:620a:1369:: with SMTP id
 d9mr26813421qkl.378.1615307307971; 
 Tue, 09 Mar 2021 08:28:27 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id q30sm2986567qtd.89.2021.03.09.08.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:28:27 -0800 (PST)
Date: Tue, 9 Mar 2021 11:28:26 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v3 2/7] dma: Introduce dma_aligned_pow2_mask()
Message-ID: <20210309162826.GC763132@xz-x1>
References: <20210309102742.30442-1-eric.auger@redhat.com>
 <20210309102742.30442-3-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210309102742.30442-3-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, jean-philippe@linaro.org, jasowang@redhat.com,
 mst@redhat.com, qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
 vivek.gautam@arm.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OtBD7KPW5It0

On Tue, Mar 09, 2021 at 11:27:37AM +0100, Eric Auger wrote:
> Currently get_naturally_aligned_size() is used by the intel iommu
> to compute the maximum invalidation range based on @size which is
> a power of 2 while being aligned with the @start address and less
> than the maximum range defined by @gaw.
> 
> This helper is also useful for other iommu devices (virtio-iommu,
> SMMUv3) to make sure IOMMU UNMAP notifiers only are called with
> power of 2 range sizes.
> 
> Let's move this latter into dma-helpers.c and rename it into
> dma_aligned_pow2_mask(). Also rewrite the helper so that it
> accomodates UINT64_MAX values for the size mask and max mask.
> It now returns a mask instead of a size. Change the caller.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

