Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp3798117lfc;
        Thu, 14 Oct 2021 01:26:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0Hh+9hqz2inZE0f4eKCrOGXztJVU32RMaRzFGXWlFaUHRpYNwe/oJMJCn0HxIjCJZd6DY
X-Received: by 2002:a25:bd93:: with SMTP id f19mr4709362ybh.23.1634199965856;
        Thu, 14 Oct 2021 01:26:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634199965; cv=none;
        d=google.com; s=arc-20160816;
        b=StJNq8B3ePKZk1IDp/j9Wn1PZV1APfwTZvkEPMCq1Wzw3SsxudhxfL/nyYO8oH8ns/
         sLE683eXE9YhdpANNHh5sZna5yjCMnIrJHJxAcOQbkpKOUuktiKr5Yplrljh5K/TlfdL
         6W1Ikt2XWxonFtFeWPKQQ3gmkJ57Bzy/3sXJqWif8UrGvL8skzO7+XS95LfuksRzICK2
         Tcf6tU1VSrPxa8xxmWlLMk0t/kiEmikGKtXSRx3qShxLjvwlXEFxHNmgTh3C6E8VUXou
         UD5Xg0zqE5pyPFzPwfqJO+pEIG02WUN+j7/wUtJX3s6yO9aCrqWUJ+2vh4AHJUfrDuXL
         UmiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=wahtm+TVyZHddXYn4SVl2PatCE0EZV81pDWY97EuUhw=;
        b=W0SahkrC0yCnuoRKi5H7ocNUOQnYU3FW8dFvCN9k0XKzlYbhQy8gcp4yDR71c9cyI8
         WKwGx/iUYwkPoWEWcXplToVsRbJXk6kVknZEhLrYromibyxdMw1M2nwmQngxdGc/5874
         MgP5RLYoMcsLh3oYZlnO0dVVJGfjSIkG/+/JhOUf4u/UtbWeLkB940s48dgzPFMrV1Aj
         jXXxXS4TwhLccEn15cSnhm+B2viCaN9iFG0n9f7bDL1pssrIAN7f+pNtNFNRG8W2rfXB
         syxYcy6bUKnrLwlZZ/uPCG896TT16oTVmRz91AIudKYo7ZA9DHCykjw9LuVQ6h66/1tf
         n9SQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eIf3cG0+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 125si2257457ybb.257.2021.10.14.01.26.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Oct 2021 01:26:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eIf3cG0+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1maw3x-0001Pa-35
	for alex.bennee@linaro.org; Thu, 14 Oct 2021 04:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1maw2q-0008BD-1J
 for qemu-arm@nongnu.org; Thu, 14 Oct 2021 04:24:57 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1maw2n-0000GZ-N8
 for qemu-arm@nongnu.org; Thu, 14 Oct 2021 04:24:55 -0400
Received: by mail-wr1-x42e.google.com with SMTP id t2so16821106wrb.8
 for <qemu-arm@nongnu.org>; Thu, 14 Oct 2021 01:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wahtm+TVyZHddXYn4SVl2PatCE0EZV81pDWY97EuUhw=;
 b=eIf3cG0+pBLVIG1BepdqM4n8luWd/57DYRe/5AW6WqRMuVuq1Z7QmyHWmPADbXEtkm
 qNZho8TSspdupwncnU5UDKRtSQu/uWzPt/9EeTj1sSkTi6d7KLQudfDlRHEbHsWuc3tM
 3Pbd6qRp96Y4Mc9VmAOuYYBWM5XGxf+tDrj0fVaGtcQlgmlSkYv1wDoCm8EDrAAWojWN
 ao7nZsPnqbv7PbNl8GEOuEdTo+CrgUmiJqGRVWtrGRlf1pBD4qrNme04ngMRJgUE/qew
 FUHzPQ4UK7XQIC/0I7xEk61ZSsumWzTNjk7eVmKdVABMDFussRlXR8UK5DmQQqYi1Iaf
 sEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wahtm+TVyZHddXYn4SVl2PatCE0EZV81pDWY97EuUhw=;
 b=gr5CXTFCnUZzwxUjeICYEf/FXnH22gQWgNklqTjGrQk0gHm2AFnGczG/oA/wuZO3L3
 dkX9YUhwBzr/ChVowKKUdkA7aLlbzPt0Ek4YazBeC8CCR4NgjgXdByjDlAhPegvb3T0z
 yEjJ6W5FMfjgb3F2MWC6EbiXW67yRhwyAwLzt1YawnXoTMQ994z9xCTAINh7ey+TvsiF
 e0SEJ+HWkpbKoC/DjFbSRymq7pPRAxiVHGdJlTPv5VYlvA82Xr63Nhm3a47tWAXkddIv
 jwXWYcLa81sHIAy5r08bYK/FwpM0+YWbi/F8eMjNllGLAEX/+pxD3C3AQj5rIGz0IlFu
 Kfgw==
X-Gm-Message-State: AOAM531el1OugWXPLNUdF8STfmvLcdeLVF5GpDbVRyqob90iQ+Ek+FC9
 uAiCrJ0MfdSE/IYtUHHK7ycu1g==
X-Received: by 2002:a05:600c:ac2:: with SMTP id
 c2mr18000859wmr.194.1634199888764; 
 Thu, 14 Oct 2021 01:24:48 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id b10sm1710722wrf.68.2021.10.14.01.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 01:24:48 -0700 (PDT)
Date: Thu, 14 Oct 2021 09:24:26 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v3 1/2] virtio-iommu: Remove the non transitional name
Message-ID: <YWfpOulVNiS5EV7G@myrica>
References: <20211013191755.767468-1-eric.auger@redhat.com>
 <20211013191755.767468-2-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013191755.767468-2-eric.auger@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: peter.maydell@linaro.org, mst@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, abologna@redhat.com, qemu-arm@nongnu.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QQsraI9dVSfh

On Wed, Oct 13, 2021 at 03:17:54PM -0400, Eric Auger wrote:
> Remove the non transitional name for virtio iommu. Like other
> devices introduced after 1.0 spec, the virtio-iommu does
> not need it.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Andrea Bolognani <abologna@redhat.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  hw/virtio/virtio-iommu-pci.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
> index 770c286be7..86fa4e6c28 100644
> --- a/hw/virtio/virtio-iommu-pci.c
> +++ b/hw/virtio/virtio-iommu-pci.c
> @@ -100,7 +100,6 @@ static void virtio_iommu_pci_instance_init(Object *obj)
>  static const VirtioPCIDeviceTypeInfo virtio_iommu_pci_info = {
>      .base_name             = TYPE_VIRTIO_IOMMU_PCI,
>      .generic_name          = "virtio-iommu-pci",
> -    .non_transitional_name = "virtio-iommu-pci-non-transitional",
>      .instance_size = sizeof(VirtIOIOMMUPCI),
>      .instance_init = virtio_iommu_pci_instance_init,
>      .class_init    = virtio_iommu_pci_class_init,
> -- 
> 2.27.0
> 
