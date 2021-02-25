Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp214595lfg;
        Thu, 25 Feb 2021 02:09:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfgBgyVDhLCxJfkMr/k/G2hmHI747ReBJw5puaNQnLzxXNDU+SKPsA1Q9vDsNA+rNCAlvP
X-Received: by 2002:a6b:6016:: with SMTP id r22mr2018034iog.93.1614247755625;
        Thu, 25 Feb 2021 02:09:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614247755; cv=none;
        d=google.com; s=arc-20160816;
        b=yrqYTrZZ817eL1ieEou2SOr73yQi84enccFPJFJ+tMcrDSzhTjzndzk1BP2H4rYD8V
         /ew9qM5NOwiaVg7ZHBAntnx8R88t/psMTQgDXSxfCbCsy+gzJycx1z+ouR2AMeRV5DZF
         Ks/P+TIs+c/39wZzCckOeUtCyz/VkEQmn+pGShVgxpmvQVSXGoZhc28gd/j7XBHPze/N
         MQQiJlc31VCXRfdqmhE6gkAxC8Bc3Yi+DnfuqfXSBD75XiJ9oWS3sILJfrJJji52a6Ws
         zozMJJXFqO8RCYrfa/hVIt/xRJxDjvLa3wiLAd2+F+Z8VU3gEBv9BF++4s8EB+6Y9/i4
         CgFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=xhgvzkmtyIkBwb1U+rc5dxvErTPV0TNESIpIzbyCh6Y=;
        b=VQi9Yn3lsUdXHHPkAxGRk++0iOEZ377ttNgo6910dj/6QJF0Dt/v9ThtANQcpLAC3Z
         hmiC/mOz+OWXQUrWNbC3nUuijpvc20/mo52+7DbWjzkVydqTdC55NQXqW0GXEw89iRRZ
         Xv1pwdYFGKEw+HFl0RUA0fXXczTIy8CKMOVKRXg/Nn3nBgGw9rXPrQda3cT2C+w/EqBl
         a5RcYdZ1+ZOVb6z9CmznqsjREvLCX8eI6gcMbNAYbRM5Di0I41DZB5hPpWmqgH1D+3Z3
         92MFEugoosNs/nqMC6UaVhX3wnnXkE5YjIZPSvKgI+Nx2nkzLnctSuV1DaVOw5t3Nhkt
         BKhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W9UjyAGf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13si3805030ior.92.2021.02.25.02.09.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Feb 2021 02:09:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W9UjyAGf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFDa7-0004Ci-05
	for alex.bennee@linaro.org; Thu, 25 Feb 2021 05:09:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFDZq-0004CJ-GT
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 05:08:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFDZo-0005GP-GB
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 05:08:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614247735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xhgvzkmtyIkBwb1U+rc5dxvErTPV0TNESIpIzbyCh6Y=;
 b=W9UjyAGf96CEUCb1IgF8zWeZROzjIe2W6xYjqRRgBjcEyV/klnlNAdNZgG4IL3eMl+oqCt
 CLZbwexDnUvizrIi19BAKV5rX6lLTLKC/j2QWIRGWDrBk6Xr89A0d8kJ3LQjCR3nD9UzHj
 Pr1pRzpzfsT6EOfYow2THSbj1MccBLI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-NimZUSUkNqar8uTvTpMw_w-1; Thu, 25 Feb 2021 05:08:53 -0500
X-MC-Unique: NimZUSUkNqar8uTvTpMw_w-1
Received: by mail-wm1-f70.google.com with SMTP id o18so604249wmq.2
 for <qemu-arm@nongnu.org>; Thu, 25 Feb 2021 02:08:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xhgvzkmtyIkBwb1U+rc5dxvErTPV0TNESIpIzbyCh6Y=;
 b=HTxaYqqgvigZg0MeFaJCY82ZklSJXlaMJGurpz3BqCsCK94ohHDKXDmJYux8CNGqIk
 6Me+nlre7GairAxYqCwkBixjBgFHV4+ySXio2tOstANEkvzY8MbTvNO+7ow35pJTqX72
 c2+3TSPm8jtREvsKSnMUzhz5FFlIP6I2vYxEhoRYGBenmxORo+OupZt2KkcBmC0W3JMV
 73wfWMaujz3+AMksutTbtJbsJYWGW/bAv3Qu/LJg/mDjElkKHURo1yoL0KCJ2TZkn+l0
 flKTJFkfZCRVZjjkb1KktcCrnm2MFDVfwJZRPZQUsk6+yyo1FC5kSzNePDc4NA7+txp9
 yrxA==
X-Gm-Message-State: AOAM533wqPe+HVa8zjzQx/jVYzwcDMOTeA1sCIGkX3r2Y/YOkbE4+nda
 1/vosxvwx+2PiEkCRC6qaeyMN2KybdLvwkQkXgjuUhCg3rT+Ltn1d+bAAQVqZA8CEnicDec6fhD
 RwCQ52emE4nJ7
X-Received: by 2002:a1c:66c4:: with SMTP id a187mr2069242wmc.164.1614247732780; 
 Thu, 25 Feb 2021 02:08:52 -0800 (PST)
X-Received: by 2002:a1c:66c4:: with SMTP id a187mr2069212wmc.164.1614247732471; 
 Thu, 25 Feb 2021 02:08:52 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o14sm7239828wri.48.2021.02.25.02.08.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 02:08:51 -0800 (PST)
Subject: Re: [PATCH v2 1/7] intel_iommu: Fix mask may be uninitialized in
 vtd_context_device_invalidate
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 jean-philippe@linaro.org, peterx@redhat.com, jasowang@redhat.com,
 pbonzini@redhat.com
References: <20210225091435.644762-1-eric.auger@redhat.com>
 <20210225091435.644762-2-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2e75abf8-55e4-b5db-7ca2-6e0408bf81e6@redhat.com>
Date: Thu, 25 Feb 2021 11:08:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210225091435.644762-2-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: vivek.gautam@arm.com, shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jyf3IQvbZoXL

On 2/25/21 10:14 AM, Eric Auger wrote:
> With -Werror=maybe-uninitialized configuration we get
> ../hw/i386/intel_iommu.c: In function ‘vtd_context_device_invalidate’:
> ../hw/i386/intel_iommu.c:1888:10: error: ‘mask’ may be used
> uninitialized in this function [-Werror=maybe-uninitialized]
>  1888 |     mask = ~mask;
>       |     ~~~~~^~~~~~~
> 
> Add a g_assert_not_reached() to avoid the error.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/i386/intel_iommu.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index b4f5094259..3206f379f8 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -1884,6 +1884,8 @@ static void vtd_context_device_invalidate(IntelIOMMUState *s,
>      case 3:
>          mask = 7;   /* Mask bit 2:0 in the SID field */
>          break;
> +    default:
> +        g_assert_not_reached();
>      }
>      mask = ~mask;

Unrelated to this patch, but I wonder why we don't directly assign the
correct value of the mask in the switch cases...

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

set the mask
diuse the
>  
> 

