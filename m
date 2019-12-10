Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6065713lff;
        Tue, 10 Dec 2019 08:47:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqz2k7c7uRWV4FxuQFIBkLL1FSfUoBK+d1B4jJZzopxQxQRhwspIXC8bs/NuNpYHrh+gMAsC
X-Received: by 2002:a0c:9d82:: with SMTP id s2mr29252468qvd.38.1575996440468;
        Tue, 10 Dec 2019 08:47:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575996440; cv=none;
        d=google.com; s=arc-20160816;
        b=cHpDTrqhFD/jAzfSfPwE8zVZFNsbqqcJqYJsJOwRsaIEkyMxPehsRPq6v3yG4s4cNZ
         sO2CsdLdO5Qa9wlWFwlG0aPgNW4ti+yboFaQrzdHB7uPaWL0zApfmx/3XzxKyldxWFAc
         /qrhbMwQoJTGEuhRCfvC6zRbNKQufEKLyWitnwBR0AFn0h0SxDUDgVfERax9tEOFK+wx
         NvVZERDv/4yv/T5qOV8YamA506h9QCc9n7rIo0ZeVAiXJZlLctO4n3cvF1lcF9meYj6E
         30YL5Z+IqjkZCZHwesiNNYvdeLuz3/wM0LwoLs1UBzKUj8z0qINtjasGFK3h04L7QUFo
         hlAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=t6xiBm4AewZPGvWuP/C57U7CBdnlU6ctV7vonpSTcNY=;
        b=mIpmg9+fblQ+mFRDTkTSaMYfXS4dGPpbATUEk5/+esk1XGOKepOaQRCQnh86sj3NO5
         /9+cTQlJPQf43pgDYD1/Vi/iQDOzLHmdVTtPzTyfGZ5WIQagt8aixKGcR7HTuQznQDEX
         cAXVuJcqrRtJSMYgEF8PyP6xuLWtvZvM0Nj7gpf/vfuuIoOlGgF3OKRWTaA7tUV/vWc7
         RjCjHxUsTia548oqzW0sUNc0lNACw0wvgScaXA2DBjhCQZvHUvyNcpwwXtSlI4v1meGB
         NYlKWy1UIJdpniZf5qpdzEOWUXHpjAJcAiI9gU3DGjgqimRdpnEZa3Bsv0pWdrG+ECRY
         JbTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QfoZ5P48;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p44si2120785qta.193.2019.12.10.08.47.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 08:47:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QfoZ5P48;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ieifP-0005RJ-7E
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 11:47:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59419)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jean-philippe@linaro.org>) id 1ieif4-0005M7-RH
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:46:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jean-philippe@linaro.org>) id 1ieif3-0005FW-Qd
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:46:58 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:45887)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jean-philippe@linaro.org>)
 id 1ieif3-0005Ew-Kg
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:46:57 -0500
Received: by mail-wr1-x441.google.com with SMTP id j42so20841244wrj.12
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2019 08:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=t6xiBm4AewZPGvWuP/C57U7CBdnlU6ctV7vonpSTcNY=;
 b=QfoZ5P48W8GsomtBZLloAwVJKXIiOVSv8BYnO1KEc4cVmUvX8ODXUpoKPaJ0DNLX5v
 hIoItecgjGlxfqsTlIhq89JGVyTjbsdMgfgfoXyYLtfzMlgZfEqbVCSxumBZU5daq7jF
 uxknZNGmVEn5uYE+yVkB8BHyqanWi7ObXl1EH+m0EBm9lHsGilGYnVCnxoY16hWRkaFh
 9Ej/s0+ctL2JG8l5uuWj8u01+EyzvkH5MFI8hlOQJHaPn/zVlByD/96egQwVRkWRhCOP
 mTdMSWhlpkIUwP8O5H9Sav+mnYD3lANb0gMzx3pSUvxRLRTRR3o5dRW0ZtmAdZeyr7Gc
 +QYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t6xiBm4AewZPGvWuP/C57U7CBdnlU6ctV7vonpSTcNY=;
 b=OR5MhYxaKZz5F76lvNnpACfhnC+Z47mqtcmJ/4cfCc98jXVl0u4KgdGB2YlgUtALav
 6+D5jX+Z4qv+YC64Ys8WsHQDFVcXr2ZerEtKxdMy86yx/MIBNavcbwCck+xIzBm0VoIg
 h6Qc2H3uoH7q4tNwWWpFLM393vtmlfaHp/KDsFMyPIYH3IwzfAyoxKNaHz6BfE1YMo+R
 SXLq+ieQCi/fF29mQJ6lem4aX7QpL3UAfjTGIwnnV3qNepd5U/kSv3/gpQmpTyBWXAyu
 bO5vMNH5rjrhCYqnMbDkoMBVnFS7sTAb4OIbtTaqIe6DBjLP9q73kUSRu/cC51OISbB9
 Lcwg==
X-Gm-Message-State: APjAAAVr6EVwVLxA/NKm7pTHIanGGKnIfe05tW5AF399Of1pPOjRngbZ
 YiHyVAnApAWEfd82cc1ZQUFFtA==
X-Received: by 2002:adf:ea05:: with SMTP id q5mr4398038wrm.48.1575996416685;
 Tue, 10 Dec 2019 08:46:56 -0800 (PST)
Received: from myrica (adsl-84-227-176-239.adslplus.ch. [84.227.176.239])
 by smtp.gmail.com with ESMTPSA id q6sm3927503wrx.72.2019.12.10.08.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 08:46:56 -0800 (PST)
Date: Tue, 10 Dec 2019 17:46:51 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH for-5.0 v11 14/20] virtio-iommu: Handle reserved regions
 in the translation process
Message-ID: <20191210164651.GL277340@myrica>
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-15-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191122182943.4656-15-eric.auger@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
X-TUID: //+DajuR0omb

On Fri, Nov 22, 2019 at 07:29:37PM +0100, Eric Auger wrote:
> +    for (i = 0; i < s->nb_reserved_regions; i++) {
> +        if (interval.low >= s->reserved_regions[i].low &&
> +            interval.low <= s->reserved_regions[i].high) {
> +            switch (s->reserved_regions[i].type) {
> +            case VIRTIO_IOMMU_RESV_MEM_T_MSI:
> +                entry.perm = flag;
> +                goto unlock;
> +            case VIRTIO_IOMMU_RESV_MEM_T_RESERVED:
> +            default:
> +                virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_MAPPING,
> +                                          0, sid, addr);

Needs the VIRTIO_IOMMU_FAULT_F_ADDRESS flag.

Thanks,
Jean

