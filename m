Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6053251lff;
        Tue, 10 Dec 2019 08:37:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqxI2fWZP1sTfk+439idiRAzmtXteiFOB7v1V1W1bwZ0yCGUbFhAOC2Tgj9ArMm5+7c3fhDk
X-Received: by 2002:aca:dd43:: with SMTP id u64mr4612781oig.101.1575995853808;
        Tue, 10 Dec 2019 08:37:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575995853; cv=none;
        d=google.com; s=arc-20160816;
        b=a4so1mOhmYmpo3HakVRlcXMw1spKLDz7d3h2QXIdp+rG580cB70drU7weCbw30Hnie
         3fQdjKZX9VtqLzOqB+iDkRzs/4oTD6a1uT0ey04BJUKwTeZn1fpSVwBm2tStUIWY1kPb
         odL6pO3yj53fv25Lpz8FeVaYwkHjRioKXexxFGoYDa/kWO6NRsOYw0+jXJhawaBmN9uj
         69ijC8voM+H3fKuT38SJSn8fLqVEj5q4d01NQPQZ1gbOKDETcJoOMWdIK8Bb8IZ+WM2E
         /gOQw1mV57pElPEBirFhYLVa1ukQK1DJNfskj9TWAkU2BDC6W+LQ6Kdxw6tlDQ6JMD1L
         7KgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=TS8bXKSl6jHU0cVwDFmZM85QEliVGmGHepmEnSkPSts=;
        b=gWYa+qtyzPDdwEfvsVq0Qy2BYNPcPPoj203TYbhuUX8M9Ht9b4kr+g8gw0g6erdEzX
         CpEil8fIbAqCGc9Qbn50HVxV8vQFjzIVUn2OU18+Ijd7zZU0N3qwQa23R6ZtJ8PPmZd/
         alHqvmqAADo/oqFph8X+ODSv1FuOJxj7olrVQK9TTbaq51bC7BEZemiA82CFDH7dFNbZ
         XyQE30fg9XGXDOdE0WeDl0UP/U2U1xhJORhIZ1LYEX5+iEUKs/f8bkcshDS278zRVmdD
         O2/KcCy78EBKhEd6xVbc6n0Q45JVWTWiFieKeqUVcZGwZiooQJUX3aJEDXuPrAmnCBFh
         KG6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W8rMi0Ac;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j24si2230083oie.176.2019.12.10.08.37.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 08:37:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W8rMi0Ac;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ieiVw-0005Jh-UB
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 11:37:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57314)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jean-philippe@linaro.org>) id 1ieiVo-0005HK-9Q
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:37:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jean-philippe@linaro.org>) id 1ieiVm-00028n-RH
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:37:24 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:35025)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jean-philippe@linaro.org>)
 id 1ieiVm-00028R-Kh
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:37:22 -0500
Received: by mail-wr1-x444.google.com with SMTP id g17so20869257wro.2
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2019 08:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TS8bXKSl6jHU0cVwDFmZM85QEliVGmGHepmEnSkPSts=;
 b=W8rMi0AcwZDJ7di99vHnVlD8Z27RaZmDdQYYYvq7WANbmGIqPMGraHnrAGzOVCr2bo
 pvo4D0xqVMrF2JedG0nvR9BjT+1tX5FYi+89cCSYjfBBrmi1D//M/ymGN0cLCdIeuytW
 TpU0G/4Irrhzcirtznobbdf2mfhF9Ty6//ItnmrtUvFJMYYISK8z2WxuEH5Rz3OBEVQM
 JL7tjrr0ttDDYd+jC1mk8SuGsmxJk5LWXS9KO7yBTBsXQofUH8UAcx0wHcNYS5RAwiKt
 zO6xx46yPIV17dQAXw5jBajLZo9VnNy8l4hPTTdhHyWfsy34oR2vmbvEcWIsaaR+PqWl
 Zusg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TS8bXKSl6jHU0cVwDFmZM85QEliVGmGHepmEnSkPSts=;
 b=tNqxHE26mBng3OVTJ5dl2cVQ8iynu1bquHtumELnQnjij27RLH1vP4y7KxFTZhLGep
 upscDvZ+ng3X/4l7TOWVmKQv5+KBnyFCCpn27wopcfS+0hE45+2nevNdBqOg8EluhIbg
 c/705EPb89xsh5JzMerQ5RQHyaYJkqHlSLynyV4TRtoQDn76GknL8LakaZfWcrih0Jdi
 kECNLmDQGGvHarZHWkXo0H8YSKI/Bf2ZgukTeB1p5bjJnlVrwfzwKk8mhAN5ogbSYp8/
 dfdPbuhEQazxmUkwAEhLR9cJjtX4uBs70epBZrR5JVV6OuYFvcWpS8XrnXZxrEfN1HkH
 fEcw==
X-Gm-Message-State: APjAAAUxzxwrWvMEzJ12vId9mOoCUhN01I170/R5pDCQIEdvoIqevAO/
 A00VJ6Br9WQubQulTAs6y7Z/hQ==
X-Received: by 2002:adf:e3c7:: with SMTP id k7mr4554644wrm.80.1575995841218;
 Tue, 10 Dec 2019 08:37:21 -0800 (PST)
Received: from myrica (adsl-84-227-176-239.adslplus.ch. [84.227.176.239])
 by smtp.gmail.com with ESMTPSA id s1sm3687632wmc.23.2019.12.10.08.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 08:37:20 -0800 (PST)
Date: Tue, 10 Dec 2019 17:37:16 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH for-5.0 v11 05/20] virtio-iommu: Endpoint and domains
 structs and helpers
Message-ID: <20191210163716.GD277340@myrica>
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-6-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191122182943.4656-6-eric.auger@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
X-TUID: O9rcD+jOPvpP

On Fri, Nov 22, 2019 at 07:29:28PM +0100, Eric Auger wrote:
> +typedef struct viommu_domain {
> +    uint32_t id;
> +    GTree *mappings;
> +    QLIST_HEAD(, viommu_endpoint) endpoint_list;
> +} viommu_domain;
> +
> +typedef struct viommu_endpoint {
> +    uint32_t id;
> +    viommu_domain *domain;
> +    QLIST_ENTRY(viommu_endpoint) next;
> +} viommu_endpoint;

There might be a way to merge viommu_endpoint and the IOMMUDevice
structure introduced in patch 4, since they both represent one endpoint.
Maybe virtio_iommu_find_add_pci_as() could add the IOMMUDevice to
s->endpoints, and IOMMUDevice could store the endpoint ID rather than bus
and devfn.

> +typedef struct viommu_interval {
> +    uint64_t low;
> +    uint64_t high;
> +} viommu_interval;

I guess these should be named in CamelCase? Although if we're allowed to
choose my vote goes to underscores :)

Thanks,
Jean
