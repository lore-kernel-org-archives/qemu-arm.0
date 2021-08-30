Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3879417lfb;
        Mon, 30 Aug 2021 01:41:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1IMjxuWeJ6yO8YjabiyYCY7LZqM4jQBJK6su5nYS68Ym+hwiPVlZA+MatbDTH+kSDNUyD
X-Received: by 2002:a25:b7d3:: with SMTP id u19mr22158679ybj.158.1630312891058;
        Mon, 30 Aug 2021 01:41:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630312891; cv=none;
        d=google.com; s=arc-20160816;
        b=oH8phDiprhQpNkHVtQi2Ei0fbmIeXMvQw/jQVTJBEJWCPwrwK9CS3HQZvrvE+oU19B
         wRPjFobdcODPMjfsM3dpNrqYLmgN376dM2+qriAn+HSTR0mnkBZsJ+CL4oyvjIecaKp5
         RqXIQb06XjPWoH1mNrAucZs/lDl2WjFgBHh8Z9ay8ouYXNC+dZ1rHCTsWPl5WUBdMrCx
         FiC60YCXT/EVLDZ6ZzuIZIFbXBNsFG5G+m9o4jDmgp8vaOl4x01hFguGv0MKvHJb2W8D
         xyO5ImRCIskZ8bbLmYnN8fsWWfRLStsHrP6eDLQRkyggZExRIWGwU2scFKJNcwrWUMf6
         9c2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=IbGQ/0E+rwcz2d9e4UMrUxbrBCbSpVycHY+HYpA6hW0=;
        b=0XMMlTsBiI1jjvsijdWMv7+afUkYoyrPqdhiqlRFBYjjuPQgMuOmqS47ij6+CH0mdS
         QiPnsHWm1uKMAYbMZjGgjf8pzXN1hITpG9yBLuZPH4IjLF6+yYi2xkaIWOM/5Z32pZgC
         wedV/mw/jbJ+LMgZ53Gc5lXZrXQaZbTNU7zdOOKBmPxnC3dfV0RlyxipYHIa85UzDS1D
         tgqgw7WSTy8tWdGRIOYHuWNLa0LxW9pvlY9FPeA8fUOedxffIcs+X5u1LjhG+4n+DTmG
         ILruNfCDczTISN9sOzv8afI7mzFevexX30hv/zleG48r/X9d+D2cImZst3jMzFXy8IJj
         2P0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OodEq96h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2si5039104yba.335.2021.08.30.01.41.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Aug 2021 01:41:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OodEq96h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mKcrC-0007QL-Ez
	for alex.bennee@linaro.org; Mon, 30 Aug 2021 04:41:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mKcpu-0006DP-No
 for qemu-arm@nongnu.org; Mon, 30 Aug 2021 04:40:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mKcpq-0002BZ-Ew
 for qemu-arm@nongnu.org; Mon, 30 Aug 2021 04:40:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630312805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IbGQ/0E+rwcz2d9e4UMrUxbrBCbSpVycHY+HYpA6hW0=;
 b=OodEq96h8gM/9Seg1SAmRWuMO31pE8m13t04CnmI/xpIwqDtRRzhznz/EE0EgF8Cl0TpNs
 MMAwS81J+7pTS0QKzyNkPWorUdeKbxfR/QcxDJtIseABYJ3HptdGJnvLvgXIQ9G+3i4mI/
 d4gn+4g+G+sLozLISzWk2uVpnwFtPQQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-2ZZvt_zGMdqm3ldKKAfrMA-1; Mon, 30 Aug 2021 04:40:04 -0400
X-MC-Unique: 2ZZvt_zGMdqm3ldKKAfrMA-1
Received: by mail-ej1-f71.google.com with SMTP id
 s11-20020a170906060b00b005be824f15daso5337669ejb.2
 for <qemu-arm@nongnu.org>; Mon, 30 Aug 2021 01:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IbGQ/0E+rwcz2d9e4UMrUxbrBCbSpVycHY+HYpA6hW0=;
 b=AjUc5W/cEuiX9gHBORaPoN7qyWeMJu/CrESe5liN4nvx2+CjuGwnXZ0aDQLLMBeC5N
 N5biMgEHsvPAFofdizRlYUTqk4gyiVBGuqH5vY/f3mc5LArmLutDWaFxyaufJ/YdkDt/
 s3gr/mmRUR78gRqi5jOeW+SXihrdSm2bH+imXjDBqrGk3/RGubaoSF63q7lj7jN0/CPw
 Ztrm4aJmDTkdYu2dD1Lp8V+JsXybBPrUzvCmhtgaBKqpLGr6bL/1AuwJ8zzXq2xngVsP
 TChCRauy0Xr/TSa6UFmTst+bMsWJ5MPXLSDRaQC383WU5QcpyvJ6iM77nESqZ7DgYv6u
 AojA==
X-Gm-Message-State: AOAM532rEmm18dGr5ll1LRrZtvl3/HHjRwkO01LU7uYA1Z5QxG6taBTX
 sXN9ezYR4PV3MwbX5UojO8KLSFfbFkkn1nB0E5WAccNXjWrMMBcb7yeb6UDxXaN0S7fRsKwqkL9
 sdf2giHUXCFzX
X-Received: by 2002:a17:906:3e1b:: with SMTP id
 k27mr23991387eji.284.1630312803256; 
 Mon, 30 Aug 2021 01:40:03 -0700 (PDT)
X-Received: by 2002:a17:906:3e1b:: with SMTP id
 k27mr23991370eji.284.1630312803037; 
 Mon, 30 Aug 2021 01:40:03 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id dy7sm2448829edb.38.2021.08.30.01.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 01:40:02 -0700 (PDT)
Date: Mon, 30 Aug 2021 10:40:01 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Subject: Re: [PATCH v5 2/3] hw/arm/virt: target-arm: Add A64FX processor
 support to virt machine
Message-ID: <20210830084001.pvsds2ycv6acriit@gator.home>
References: <20210830082820.2690275-1-ishii.shuuichir@fujitsu.com>
 <20210830082820.2690275-3-ishii.shuuichir@fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20210830082820.2690275-3-ishii.shuuichir@fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g+RbnoNlG4P8

On Mon, Aug 30, 2021 at 05:28:19PM +0900, Shuuichirou Ishii wrote:
> Add -cpu a64fx to use A64FX processor when -machine virt option is specified.
> In addition, add a64fx to the Supported guest CPU types in the virt.rst document.
> 
> Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> ---
>  docs/system/arm/virt.rst | 1 +
>  hw/arm/virt.c            | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> index 59acf0eeaf..850787495b 100644
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -55,6 +55,7 @@ Supported guest CPU types:
>  - ``cortex-a53`` (64-bit)
>  - ``cortex-a57`` (64-bit)
>  - ``cortex-a72`` (64-bit)
> +- ``a64fx`` (64-bit)
>  - ``host`` (with KVM only)
>  - ``max`` (same as ``host`` for KVM; best possible emulation with TCG)
>  
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 86c8a4ca3d..3fa4295a78 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -200,6 +200,7 @@ static const char *valid_cpus[] = {
>      ARM_CPU_TYPE_NAME("cortex-a53"),
>      ARM_CPU_TYPE_NAME("cortex-a57"),
>      ARM_CPU_TYPE_NAME("cortex-a72"),
> +    ARM_CPU_TYPE_NAME("a64fx"),
>      ARM_CPU_TYPE_NAME("host"),
>      ARM_CPU_TYPE_NAME("max"),
>  };
> -- 
> 2.27.0
>

Reviewed-by: Andrew Jones <drjones@redhat.com>

