Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3855261lfb;
        Mon, 6 Sep 2021 07:41:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUlSRchxbSSgmgDckLfLyTizoPetRnJ2ZeHHwM2YkdnGk34EhdAjRS/cG/xRJO9AN2ojge
X-Received: by 2002:a02:a78e:: with SMTP id e14mr10902851jaj.50.1630939306270;
        Mon, 06 Sep 2021 07:41:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630939306; cv=none;
        d=google.com; s=arc-20160816;
        b=q+NmfYyVfE5Ca3o3EJLB9GzEMxUPa05PN1nJb0ETRs1l+Qz/74Frg1jRYh7CVvmYpt
         156N0KFHFDFNtzsX4zLWMd5BM5R8q8VPKzr97aLV2oQBynJEeDcH4X/03m+lMkD8lNHu
         yyXsO0vQxPPcnCUTBoBe9y9mosqfD8PWjpvaeROpNT6G/caouWeR0xQliuKfIYPo4Y6N
         8dYhkCdhTC9cnUgkOIsJbeb42iOJBAl+ToaW49cvdtFgl8oMCXNwNrfMO8iqNyF9/W8F
         lvsD1gWGpmfzJfF6Za+Z9beZQ4D36Ed1FbOHQDZ5wdFJ2tA4Gjwj8JE+PHwZz4fGg6cF
         zJGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=bNZmFUxIyYOyp2UU77EfnsRN0bsS1NEmfFfsmjO7RzI=;
        b=jUbhS0SqsNLIScEyu8lSFn9svMWkL5BO1vtFD3h1Se7OJAh9tc57bx/iHEi5ncCUC4
         Aayfa9HY2LS3NxL1lbgUdidywTZdnnz/ndG5HsKiYLDzNGU7xNGQcCBptK9jDMx3ONG7
         Us9bslorFxymFEcbtSestb2OjDikE/zPpl4RfODEu1Z3H9wjQIU9aPJFG0krXe5aDRGA
         jAq8URKYw0VBkB8cEqjIppOFalCp7Fv264tbAzL2BNQlxwaEjqu5/PGRKy8Be7CjFfFi
         UhZOnGtWvD9tOaSIsvbQIKT77UDxSedPuubBhAzP9aII8e6jMSQY1Czi4YuKYTZHj8Me
         dIbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BRpMequb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2si8293310ili.39.2021.09.06.07.41.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Sep 2021 07:41:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BRpMequb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNFof-0006ut-I4
	for alex.bennee@linaro.org; Mon, 06 Sep 2021 10:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNFoR-0006ud-6h
 for qemu-arm@nongnu.org; Mon, 06 Sep 2021 10:41:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNFoP-0000fy-NB
 for qemu-arm@nongnu.org; Mon, 06 Sep 2021 10:41:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630939289;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bNZmFUxIyYOyp2UU77EfnsRN0bsS1NEmfFfsmjO7RzI=;
 b=BRpMequb5g35d+XgTtIreb8ek4nb6G8Jjf/ufp5zXGVe1Y4QHlE7GWvfzSpxgtP7ylp8wf
 ZD3kkmWQSVU/uqq4UoNJ4w+HsmiIq5ur8cagefrROwc+b9ncSeXrsXuEIrX/gMJ6vjKpBA
 pY7+ZjKsogbRg3hFzR7AuojnE6Yy4TQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-DF_UJBhYMminAvkXM2B4BQ-1; Mon, 06 Sep 2021 10:41:27 -0400
X-MC-Unique: DF_UJBhYMminAvkXM2B4BQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 a201-20020a1c7fd2000000b002e748bf0544so4000266wmd.2
 for <qemu-arm@nongnu.org>; Mon, 06 Sep 2021 07:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=bNZmFUxIyYOyp2UU77EfnsRN0bsS1NEmfFfsmjO7RzI=;
 b=HHLVeie+JDkVPWPD9V96hXum5+cN1iPti0amLaUD2hbAYTuO1FbaJYVdYh+D3qBt7W
 OO6uu65RlHQC/lG6rk76EOzWjSU/gs7LdU957M1HXZXvO2mm50FE5e50kHpPN2BUwDj4
 MwWu5h5WOd385+3eNa/Q9IdKKnyobAArVsxhpnZP+LulsQaaW/Na3LS5JUr3odhX0vrK
 4zl4tWqeLYUJV0bdEjBO1F/pNSanl85DZuV9CKONKaxc8m2iN0cmjg0meFujoDsLWi8m
 cc0LaCOBYJ9Q9VT1pwmNXuABawTyML5Ry3GrMgfPONhLlTBDb2NbKABOF4vankOa0fvx
 dAvg==
X-Gm-Message-State: AOAM53035Z8L/+tmIF3cvfQsaVdTogE36bqzLnZ99k9Dn+bryeynhUsn
 hL6SZSQmMAla867cLX/tuZ5TjwEhHdn9Ity890ejIQ0qpnMsSf2/XfEvTtMnhdHOZ1IgaN/gG+e
 K/FFcowAIqPoVgi7hxQm6R6a9Csly85hWuICjfqSo9fWBWS/SCBuKhET4VdTr7lr2LFQ=
X-Received: by 2002:adf:80c8:: with SMTP id 66mr13967711wrl.65.1630939285153; 
 Mon, 06 Sep 2021 07:41:25 -0700 (PDT)
X-Received: by 2002:adf:80c8:: with SMTP id 66mr13967682wrl.65.1630939284887; 
 Mon, 06 Sep 2021 07:41:24 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id u26sm8491916wrd.32.2021.09.06.07.41.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 07:41:24 -0700 (PDT)
Subject: Re: [PATCH v2 8/8] docs: Add '-device virtio-iommu' entry
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
 <20210903143208.2434284-9-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <4aaffa5a-e9cf-9997-aa59-dcb2726ad696@redhat.com>
Date: Mon, 6 Sep 2021 16:41:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210903143208.2434284-9-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.332,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dFGG6zqhj98P

Hi Jean,

On 9/3/21 4:32 PM, Jean-Philippe Brucker wrote:
> Document the virtio-iommu device for qemu-system-x86_64. In particular
Nit: this is not only for qemu-system-x86_6. This also documents the
option usage for aarch64. Only the interrupt remapping note is x86-64
specific.

I think it also would be worth to mention the interaction with the
bypass iommu option as you mention "for all devices".

Thanks

Eric
> note the lack of interrupt remapping, which may be an important
> limitation on x86.
>
> Suggested-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  qemu-options.hx | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 83aa59a920..9a1906a748 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -976,6 +976,9 @@ SRST
>      Please also refer to the wiki page for general scenarios of VT-d
>      emulation in QEMU: https://wiki.qemu.org/Features/VT-d.
>  
> +``-device virtio-iommu``
> +    Enable a paravirtual IOMMU, that manages DMA isolation and remapping
> +    for all PCI devices, but does not support interrupt remapping.
>  ERST
>  
>  DEF("name", HAS_ARG, QEMU_OPTION_name,

