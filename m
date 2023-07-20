Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp7724602eje;
        Thu, 20 Jul 2023 03:51:47 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGTEz1TUHZqklCkE+R4VehAv/IVsqWJEsghlSg5YS5X32iR0eetA+LjztgTi1JwSXQjjtoY
X-Received: by 2002:ac8:5f85:0:b0:404:a649:879c with SMTP id j5-20020ac85f85000000b00404a649879cmr6381634qta.49.1689850307331;
        Thu, 20 Jul 2023 03:51:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689850307; cv=none;
        d=google.com; s=arc-20160816;
        b=XW7VEdSp8AsEYi2HVV8PoMQCHT4orFK/4FTPPGwqOwEZPnq62lyY9DYKrFs6FH1N9q
         AVDQBwIZQft0Pc72w10XE4f9TzdOKMcYsY7dbhYf9uYNhRRL2rPynX478mVKely2Ddnt
         DBVzxwtPUU/OoB/g3YKs6cy+iTFhPLoos1ePabzbxKwbQ1GO/vmka3iwIZqn1mNNyNM/
         bXyFxlOw3iWARFPNXW4BtdwUFrB758M1dt+rN397BhLcYtBZ+ip5bTJbHhg6gyQjtKrJ
         RhBe1gVrDLYN4kPtAcUCReq60RlIhK0Xl2ME9TM7+W9dskdssi9OYUWWUexBPs+0gOMM
         X4TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=eE30xErk1nLgA4oFLynpssqb3i6CEkxKkfn4xlkSUdg=;
        fh=WPi+X3PwQK82N4GgIZ76d+W9TedIFeXrfeOqxgqqjPs=;
        b=L3RmoeIUyL5amBQg5htl5yxZzieM2/HXD5/YvgimDZ6amzGt6+ClONe/H1tu/e4NuW
         ZzrrfcjXbhJfKi/MyJ+mbUv7TJidmZVECzqKYEIv4ld8jiRy7MzTAh84MtUW2wAgYZqp
         EirCZxivDXvziIiBvURX+pEnavTNTWao5tKz8nzJqgL+YEdbcAsGmbSu1/D9/1E4K7zR
         Xtchf4yzMZVRRpq+pmb1cgoJxf0V2rQE7Jn/Yr368F0kuCb7bNLh6yESdrLzFSuYVKh5
         5qZwYp5yiN/grvjLy6A1z1rsodAsxg9tN4rXwSRDE3w0OT+NyglrJSJFNe0hH8KIWcyb
         Mayw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ukZUiqQZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14-20020ac8570e000000b004039e75fe53si267439qtw.250.2023.07.20.03.51.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jul 2023 03:51:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ukZUiqQZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qMRFt-000852-N1; Thu, 20 Jul 2023 06:51:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qMRFs-00084g-R7
 for qemu-arm@nongnu.org; Thu, 20 Jul 2023 06:51:32 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qMRFr-00061C-9X
 for qemu-arm@nongnu.org; Thu, 20 Jul 2023 06:51:32 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-316f9abf204so583939f8f.1
 for <qemu-arm@nongnu.org>; Thu, 20 Jul 2023 03:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689850289; x=1690455089;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eE30xErk1nLgA4oFLynpssqb3i6CEkxKkfn4xlkSUdg=;
 b=ukZUiqQZT6WJrlvJnr/FtNq0xk8fKhOeJl3g2VZGKl+74YkSpeOB/rhSOiw+E37Swm
 uB9UmXcWTIqcK3imakGrO1F/Qv6hbgl2RKT24KeaAn1ca0n9bi6hMZ2a1i0RWlGeNLVR
 YwWaYVCSbkPYhXqhElxEGJgVj2HT6a8VrYLCqtf58Xpit7l7wAmROrkHfF6ZNVaHJyA+
 3PSxvPrFCdYooCrBDBy/82fO8zrahzyZ31Mo0+rEd/f5HF4sg+lYiCYCzyWYJL53LMDu
 8TTzzUSR4i7nqcri/Pmma1htN9EEeJ1qfcN/WgvDoWIoB+q1dw8oNevCcmODGeTf52Md
 agaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689850289; x=1690455089;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eE30xErk1nLgA4oFLynpssqb3i6CEkxKkfn4xlkSUdg=;
 b=N5WZjAf9c2ATF1h2DgcD79kAsqBNSIBWDwyaLnnJ/D1FpU8xh3aTcShTW3EUdk90tw
 xh2WQeSQO5SzaPcekqKxfMDdD+r+XpQdRi/TO9AJbpEm125tVZm3kXq/dbK/DFTDpsJi
 EAYODGXqm9WETXnyAU0gbvjALNwq8Ff2QQssSjPywEQKmMSoSXdbsVx/7sxnNFckhQxW
 Z5qMZufKCX8uWuz+1d9FjB4VvH7lcam9KjKtsBdWSPmA2bc99nH7wEs9nhX1IqHSRsWo
 mHoBBv8WFJvQWOIqxb1Paa0YPi/gSHcs96zfaU2Vxvj/e8lVvmbjjFxaiyoNvp7mhzXu
 hgpw==
X-Gm-Message-State: ABy/qLYqQ+kqk9iS/sq4SdecEEBex1PRDjcldZvM6PrybFyIVloj1GKK
 ggbiNqlDBMG5VQpvKuazQKQOEg==
X-Received: by 2002:adf:ef4c:0:b0:314:4a15:e557 with SMTP id
 c12-20020adfef4c000000b003144a15e557mr1998802wrp.5.1689850289388; 
 Thu, 20 Jul 2023 03:51:29 -0700 (PDT)
Received: from myrica ([2.219.138.198]) by smtp.gmail.com with ESMTPSA id
 q6-20020adff506000000b003141e629cb6sm972878wro.101.2023.07.20.03.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 03:51:28 -0700 (PDT)
Date: Thu, 20 Jul 2023 11:51:32 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 mst@redhat.com, peter.maydell@linaro.org
Subject: Re: [PATCH for-8.1] virtio-iommu: Standardize granule extraction and
 formatting
Message-ID: <20230720105132.GA59402@myrica>
References: <20230718182136.40096-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718182136.40096-1-eric.auger@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: o0a6ohcHZbA2

On Tue, Jul 18, 2023 at 08:21:36PM +0200, Eric Auger wrote:
> At several locations we compute the granule from the config
> page_size_mask using ctz() and then format it in traces using
> BIT(). As the page_size_mask is 64b we should use ctz64 and
> BIT_ULL() for formatting. We failed to be consistent.
> 
> Note the page_size_mask is garanteed to be non null. The spec
> mandates the device to set at least one bit, so ctz64 cannot
> return 64. This is garanteed by the fact the device
> initializes the page_size_mask to qemu_target_page_mask()
> and then the page_size_mask is further constrained by
> virtio_iommu_set_page_size_mask() callback which can't
> result in a new mask being null. So if Coverity complains
> round those ctz64/BIT_ULL with CID 1517772 this is a false
> positive
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Fixes: 94df5b2180 ("virtio-iommu: Fix 64kB host page size VFIO device assignment")

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  hw/virtio/virtio-iommu.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 201127c488..c6ee4d7a3c 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -852,17 +852,19 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>      VirtIOIOMMUEndpoint *ep;
>      uint32_t sid, flags;
>      bool bypass_allowed;
> +    int granule;
>      bool found;
>      int i;
>  
>      interval.low = addr;
>      interval.high = addr + 1;
> +    granule = ctz64(s->config.page_size_mask);
>  
>      IOMMUTLBEntry entry = {
>          .target_as = &address_space_memory,
>          .iova = addr,
>          .translated_addr = addr,
> -        .addr_mask = (1 << ctz32(s->config.page_size_mask)) - 1,
> +        .addr_mask = BIT_ULL(granule) - 1,
>          .perm = IOMMU_NONE,
>      };
>  
> @@ -1115,7 +1117,7 @@ static int virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
>      if (s->granule_frozen) {
>          int cur_granule = ctz64(cur_mask);
>  
> -        if (!(BIT(cur_granule) & new_mask)) {
> +        if (!(BIT_ULL(cur_granule) & new_mask)) {
>              error_setg(errp, "virtio-iommu %s does not support frozen granule 0x%llx",
>                         mr->parent_obj.name, BIT_ULL(cur_granule));
>              return -1;
> @@ -1161,7 +1163,7 @@ static void virtio_iommu_freeze_granule(Notifier *notifier, void *data)
>      }
>      s->granule_frozen = true;
>      granule = ctz64(s->config.page_size_mask);
> -    trace_virtio_iommu_freeze_granule(BIT(granule));
> +    trace_virtio_iommu_freeze_granule(BIT_ULL(granule));
>  }
>  
>  static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
> -- 
> 2.38.1
> 
