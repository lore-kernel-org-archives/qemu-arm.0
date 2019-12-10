Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6065483lff;
        Tue, 10 Dec 2019 08:47:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqxYaBbynLzucZtwhS/JJIyBa1h0vlTwOpqJKarFFSmxaONaHEUblQIRB4hAzUVdO8EEkkL5
X-Received: by 2002:ac8:1002:: with SMTP id z2mr10401772qti.280.1575996429342;
        Tue, 10 Dec 2019 08:47:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575996429; cv=none;
        d=google.com; s=arc-20160816;
        b=QTrd1gQcz0Ab++D/oqOSKjlwxKeWCtRAM99WBWgevj/uEkj6ROOaBll6IDuL6I4+LS
         KRzTRlpG/VLkot7Ym87b+MM9yhVQJnlUqfZzNGrE69nzk9/GACSVbZVtPfx8fT7tyF2n
         3zD51edOorp6gG5YiI+OQ1LHFiPbTawllBqJ7t1JEh+vU3JI5/gdjTbG8f8bUNmhNErI
         29aLn4cpS+vqrBl5ipQyinL6IFJFo+/DWvabefwY9ka1zA9noxZfaW7u5lhdea2RlBgV
         VrQtY4OcjMmaWesQUDKPisnuELmX3WVTfaqzbamilvp0js5pW4eQnVzn6+S8hwK2DymK
         Z6Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=J9i3/MkcXXwFrp7MwGhstFhrn0JoZM+nuz8kFsu3TVs=;
        b=NLGz7oXb57OGX7ov+B3+4mKIePoIpjDzlSwImbXU7ZnpLbFBjouir48yfEEMzZ9pp8
         aZetMwpX3r/XDs1LdSDhdqIKUipzUcQyN24KHGKDizXn4KSzHlv4PvXDf7CUmDT09Kqj
         UkyxcOYNrim2akuEqiAZF/9p998ZjZzvhgqLGk1XIRbGQEOJqn3FefGOUfGFq11R1d1z
         D0GRqL6OJEN1mLh8vgRdPlAidHe7i7vxo6AoXcWQ+LdKepJHmabcLt0TiKlDKi9V6bnq
         FFaMS1MXlOwRuajWeBwy74nBUcMXUpfopone9TzCsaW+onyzZerVeDKb9jzpceFfN16T
         bnRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B4Mg2svv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g8si978155qto.158.2019.12.10.08.47.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 08:47:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B4Mg2svv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ieifE-0005EA-8l
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 11:47:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59174)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jean-philippe@linaro.org>) id 1ieidn-0004O1-9n
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:45:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jean-philippe@linaro.org>) id 1ieidm-0004qB-7H
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:45:39 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:38758)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jean-philippe@linaro.org>)
 id 1ieidi-0004m1-M5
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:45:35 -0500
Received: by mail-wr1-x442.google.com with SMTP id y17so20897873wrh.5
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2019 08:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=J9i3/MkcXXwFrp7MwGhstFhrn0JoZM+nuz8kFsu3TVs=;
 b=B4Mg2svv2Enjp6/cLsAW+6qr1toLBoUc624xx9f0y5aI9fYj4m3x66uYs7t2sJAPJa
 hsQq1YhwflwdTMQxuMAX5Jk6dMa5XbQ6UQfi6Gh8XSe09jhYhn8ZhAjnuzm6bkgU1hDR
 Emd8abkwuv12lv+fvHhfvw0mEmlb6yxgjqNnRzn813Y2i8jefUrggZEqacIFpBF+AwG4
 PUUxWRWOgodys1WeeW99iGdXkpxfL++J8YexKTnZ1PusfUg7ya36D+gMTOw7d6EDJ0V0
 DbyrguN/KPM6a+UZq/CPck78Ryz30C6yzzdw08IiAKTdbFCEJKNGlxALIL8SWzvQRPJg
 GGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J9i3/MkcXXwFrp7MwGhstFhrn0JoZM+nuz8kFsu3TVs=;
 b=O2IpO32x8eshNl6vU/IKVlFqlhoS7RPEUMHMNFpTSt3ZRiBQ3c/+Rg21Jep4xvTrIS
 zb9Ig3GGXtx/qvnizsRbMXfL4+IXyLzd7RC4X6/SiZbbQmffdDrGt/E6/ZudwAXyw2Bb
 5bfCAwu+XsBke2kP2yYPkhnjjYt6LbYEV+r3fvkfr2K/IKHFTMAJNCSaH0FzVz1rSZaR
 zv7OYP4WSZvngrW+MCiUIAsYA7hUZizJcKIj0ipLS97XasgRvuzoSap3Vn7+Os8NSlr7
 tQeymExaokIkFtjDRt87OM5D9ClodrVd0zuvpCJwue1xU9POyCa/tkJUxM3az8RPTIo6
 +3Iw==
X-Gm-Message-State: APjAAAWHfLpAep0xLyp37R1tzqOi7r04f0uoUHM9qq5DNRw8rpvkaThn
 KYY1h4P7PKGnXX6WMKbIke5XmQ==
X-Received: by 2002:a05:6000:12ce:: with SMTP id
 l14mr4601426wrx.342.1575996333166; 
 Tue, 10 Dec 2019 08:45:33 -0800 (PST)
Received: from myrica (adsl-84-227-176-239.adslplus.ch. [84.227.176.239])
 by smtp.gmail.com with ESMTPSA id v4sm3484387wml.2.2019.12.10.08.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 08:45:32 -0800 (PST)
Date: Tue, 10 Dec 2019 17:45:28 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH for-5.0 v11 11/20] hw/arm/virt: Add the virtio-iommu
 device tree mappings
Message-ID: <20191210164528.GJ277340@myrica>
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-12-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191122182943.4656-12-eric.auger@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, kevin.tian@intel.com,
 tnowicki@marvell.com, mst@redhat.com, jean-philippe.brucker@arm.com,
 quintela@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com,
 armbru@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 dgilbert@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GLY1bAEuSvOE

On Fri, Nov 22, 2019 at 07:29:34PM +0100, Eric Auger wrote:
> diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
> index 280230b31e..4cfae1f9df 100644
> --- a/hw/virtio/virtio-iommu-pci.c
> +++ b/hw/virtio/virtio-iommu-pci.c
> @@ -31,9 +31,6 @@ struct VirtIOIOMMUPCI {
>  
>  static Property virtio_iommu_pci_properties[] = {
>      DEFINE_PROP_UINT32("class", VirtIOPCIProxy, class_code, 0),
> -    DEFINE_PROP_ARRAY("reserved-regions", VirtIOIOMMUPCI,
> -                      vdev.nb_reserved_regions, vdev.reserved_regions,
> -                      qdev_prop_interval, Interval),

Belongs in patch 10?

Apart from that 
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

