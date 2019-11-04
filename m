Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp4541287wri;
        Mon, 4 Nov 2019 14:02:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqzJn8gQWM236jc8TBr5na4gcjUl9/tzY7TmHM3mVVE911VrfxDTR58t8jH+yTWGkOD0ZfdT
X-Received: by 2002:a05:6402:88c:: with SMTP id e12mr31409204edy.170.1572904959454;
        Mon, 04 Nov 2019 14:02:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572904959; cv=none;
        d=google.com; s=arc-20160816;
        b=aparybS9QZ+2xbFoYJANZfhj62AndqlcIfdPC5bTdfgsYtOHfUGzQDrXknsrVEC88a
         1QovoOAL3jbwwvsUkak2a5K8WcyMRTsJof0aHdBYnlY1NvEDfDCy8SZ1Jf06JoLlNnui
         Nlnyc8jAMQOVD+N0HS5a+0g/mruiPfKEpuU8P0LODogICw1cwF6wViYLookXuuJBfHtn
         p9pWZhlFP7PWuUY8JtsROqsNWzO6DW+59g4891AACVSbGMcqZh+RvfhykToeXoXUxq5n
         3KZD4pma9IDT5V2Ws3bgLb8RKmnracBj0xFaQKqJ3KAYxC4jBxRHuWlJ4x7OxGcf3R/i
         esnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=P8PibeiupuNi15dHm5+jUR5CChJ9w0TTLJd6WN7BGpg=;
        b=01d99PFSLc/CW7hZYiqIssAg9RcKlpOXYZQoGQhj6C+9Zubmhtc5W6kfSo4lbSiQht
         ozT5V6FBjXMiYObqGBe7ERox6TwXjlFT0u/NU2ACfmH0ey9Vg0SwpDSXMit5J6021DrU
         zH9tuI8SWWrqsFiGS2tPI8qzjp2uMJbt7XfDRCVbWSmOITlMN0RGVP9v0fmZ9DG6byy4
         AOd5xcR9d6iMNA890tqOASloum7aRZhmXlPcxG6fR7hL4h9QKoO5a+JDflMC8UTmlTNM
         xFSUGlTlqofK1QK/4bCwJniBiIzn8Cnsp6s1Ee3jil2RE5Lyrz1exEP2u1c7zNMFPH61
         X4Vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zKPvNnFT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w3si6730856edu.189.2019.11.04.14.02.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2019 14:02:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zKPvNnFT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iRkQo-0003oA-GB
	for alex.bennee@linaro.org; Mon, 04 Nov 2019 17:02:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44026)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jean-philippe@linaro.org>) id 1iRh8k-00064r-7F
 for qemu-arm@nongnu.org; Mon, 04 Nov 2019 13:31:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jean-philippe@linaro.org>) id 1iRh8h-000498-TL
 for qemu-arm@nongnu.org; Mon, 04 Nov 2019 13:31:45 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:55951)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jean-philippe@linaro.org>)
 id 1iRh8d-00047v-Dx
 for qemu-arm@nongnu.org; Mon, 04 Nov 2019 13:31:41 -0500
Received: by mail-wm1-x343.google.com with SMTP id m17so8556386wmi.5
 for <qemu-arm@nongnu.org>; Mon, 04 Nov 2019 10:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=P8PibeiupuNi15dHm5+jUR5CChJ9w0TTLJd6WN7BGpg=;
 b=zKPvNnFTHPGsmJ+HlfIRPewnCGM9caXmxt4I3/bpQ+JkqrtLbBlQmkfB75j94yvcbD
 i9whR6nKmUCxfQv7QRCdMPTfeB5XQdYtN1TWDeXCjSp6ZB7zKLEEcwU0TUvx/bRNywMP
 EgwogmRw+ESqVLaFS+1Yap2YQeRc1u8Jd0tBOdmpvx/POKm++nh4LsWyQKxGS8Wxp5Zf
 FsBN4T+PI382Zwy9wdyISDUz7ptKMpmQp0HI9/PvY2r10d/iTYopOjKKnX/HeFIci703
 N8/5jCoRUPEUSd1cBtF7i53WUYZFOPyZwehnDHliWdut+Vq6j2Kx7j9iE26Dd7Uowl82
 Xu1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=P8PibeiupuNi15dHm5+jUR5CChJ9w0TTLJd6WN7BGpg=;
 b=gdqfteX6NCd2cBQ5iloKXSWp8DHhVnjPootNvub7oi9BlDXCpLVj6erAAWLS4KQeEE
 C5mLd2K3U381MTuftcT3FZJHwyW4V8PWJ3SX1mrmA9qu1ZCADEQpO3qgNgReXpl113K8
 sa7ZkOu6dwxLvw2JmnTp+ATplT3il/AmC6J2WDr8DLjLTEcjKZuExB3SIowe/TK7l3gX
 NFXwx/vqril2VpBHq57mCP3kMr2dGH5nom4t/Wn7NAOfxV2ro+XatE1ydMVK4LYD3Dil
 1oNZpWzAW75AA1M2SG0aDRWc+mv82FXxBk8wd4n8YCXdd/YVin4pXpZXf85HCCCL50H8
 tCAw==
X-Gm-Message-State: APjAAAX4cNOQk9sPHt8rpQqAfEDP/C5V5r3AXPCMk/UwYpmjBKbRq26+
 ZPt58EvvFftabyEkKcF8tfBEWQ==
X-Received: by 2002:a05:600c:1002:: with SMTP id
 c2mr417364wmc.79.1572892294020; 
 Mon, 04 Nov 2019 10:31:34 -0800 (PST)
Received: from lophozonia ([85.195.192.192])
 by smtp.gmail.com with ESMTPSA id g14sm18776667wro.33.2019.11.04.10.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 10:31:33 -0800 (PST)
Date: Mon, 4 Nov 2019 19:31:31 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH for-4.2 v10 06/15] virtio-iommu: Endpoint and domains
 structs and helpers
Message-ID: <20191104183131.GA3540585@lophozonia>
References: <20190730172137.23114-1-eric.auger@redhat.com>
 <20190730172137.23114-7-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190730172137.23114-7-eric.auger@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
X-Mailman-Approved-At: Mon, 04 Nov 2019 17:02:06 -0500
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, mst@redhat.com,
 tn@semihalf.com, qemu-devel@nongnu.org, peterx@redhat.com,
 alex.williamson@redhat.com, qemu-arm@nongnu.org, bharat.bhushan@nxp.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QMc5RzNynRCx

Hi Eric,

On Tue, Jul 30, 2019 at 07:21:28PM +0200, Eric Auger wrote:
>  static void virtio_iommu_device_unrealize(DeviceState *dev, Error **errp)
>  {
>      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> +    VirtIOIOMMU *s = VIRTIO_IOMMU(dev);
> +
> +    g_tree_destroy(s->domains);
> +    g_tree_destroy(s->endpoints);

virtio_iommu_device_reset() must completely clear the internal state as
well (noticed while testing modprobe/rmmod).

Thanks,
Jean
