Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1519167lfp;
        Thu, 6 Feb 2020 06:35:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqwLunypp1ZbIT8okgmFcBoHvxLBuITv1Ur3Nk6boTd1VIN0k3CkNb9zYV0W66fYfKdaByL/
X-Received: by 2002:a05:6808:ab1:: with SMTP id r17mr6775075oij.141.1580999716780;
        Thu, 06 Feb 2020 06:35:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580999716; cv=none;
        d=google.com; s=arc-20160816;
        b=dOddzlMVIDr7zsyPymm/chC5ioY9xgz6d92Xzvde1a1j9Q2XDtj2WMU3j4p+qGa04y
         C7wag5rNvJv9i0LzGxtnG6LwDYMA3mcyCzGJqnq/z3AISh2cfIczyf/x3bfDsjBPNXzK
         d83gMiP1SVePK3YqN66r6uUtbYIipkpanjios6f7alJnrsB6qqkYtLQvjk/nutuegjW1
         zXMAyyUym9PCMbBUS8fXQGx5n1hiUwtb8io2qKy0j3fA+erHMBkxc32IZ/WOZQPYZPNO
         NVRLbOLe1e0nUXXp0JBgbFsoGTA6/0xtBMJE2jqOniQoytPEEBqwfKNFyIcspRgvHv/D
         NMxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=5lgtOrsJtB09GOVZA5JAU+gTTDGa21dQgSNCPlp1NsU=;
        b=j4ayGQKAsoeQbBSPRVjmccUKgW7JgRI6mV5C/QYJThpXGuH7SU9FwAzJDAaakfPt37
         oGIMaBpoD5uZZR/dOdIiVJHjpX0L/meOvHwfZVb5MXtvvudqMK+fLL0dX8XUUawFFxD+
         tTxnf4kZv38X/yxiDCNpndSdKl15yR8lZtAMLpOs1wVmSpYYEh31iGfIkskZTal2D0sh
         cyDhvlLfZMmHxN9NvtsiBhsBjVMXXn60gvuI7rPw0r4OB6EiYhRrNkjX60lOIflOVWXz
         HLAjAKao7zSkaiybGMaYnlMnzvmlFba1I44Ib+R9ZvUw6TNiMmrojUVQN32dHO5spK3b
         ZZYw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id l6si2172640otk.134.2020.02.06.06.35.16;
        Thu, 06 Feb 2020 06:35:16 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727901AbgBFOfP (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 6 Feb 2020 09:35:15 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:10163 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726765AbgBFOfP (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 6 Feb 2020 09:35:15 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id D4F307895B7640D4A8E2;
        Thu,  6 Feb 2020 22:35:08 +0800 (CST)
Received: from [127.0.0.1] (10.173.222.27) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Thu, 6 Feb 2020
 22:35:02 +0800
Subject: Re: [kvm-unit-tests PATCH v3 04/14] arm/arm64: gicv3: Add some
 re-distributor defines
To:     Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
        <maz@kernel.org>, <kvmarm@lists.cs.columbia.edu>,
        <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>
CC:     <drjones@redhat.com>, <andre.przywara@arm.com>,
        <peter.maydell@linaro.org>, <alexandru.elisei@arm.com>,
        <thuth@redhat.com>
References: <20200128103459.19413-1-eric.auger@redhat.com>
 <20200128103459.19413-5-eric.auger@redhat.com>
From:   Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <22a3b0f5-febd-f9e0-4404-7b01643e57b1@huawei.com>
Date:   Thu, 6 Feb 2020 22:35:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20200128103459.19413-5-eric.auger@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.222.27]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: oc9XZjQ2mZf5

Hi Eric,

On 2020/1/28 18:34, Eric Auger wrote:
> PROPBASER, PENDBASE and GICR_CTRL will be used for LPI management.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   lib/arm/asm/gic-v3.h | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/lib/arm/asm/gic-v3.h b/lib/arm/asm/gic-v3.h
> index 6beeab6..ffb2e26 100644
> --- a/lib/arm/asm/gic-v3.h
> +++ b/lib/arm/asm/gic-v3.h
> @@ -18,6 +18,7 @@
>    * We expect to be run in Non-secure mode, thus we define the
>    * group1 enable bits with respect to that view.
>    */
> +#define GICD_CTLR			0x0000
>   #define GICD_CTLR_RWP			(1U << 31)
>   #define GICD_CTLR_ARE_NS		(1U << 4)
>   #define GICD_CTLR_ENABLE_G1A		(1U << 1)
> @@ -36,6 +37,11 @@
>   #define GICR_ICENABLER0			GICD_ICENABLER
>   #define GICR_IPRIORITYR0		GICD_IPRIORITYR
>   
> +#define GICR_PROPBASER                  0x0070
> +#define GICR_PENDBASER                  0x0078

nit: we'd better use tab instead of space.

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>

> +#define GICR_CTLR			GICD_CTLR
> +#define GICR_CTLR_ENABLE_LPIS		(1UL << 0)
> +
>   #define ICC_SGI1R_AFFINITY_1_SHIFT	16
>   #define ICC_SGI1R_AFFINITY_2_SHIFT	32
>   #define ICC_SGI1R_AFFINITY_3_SHIFT	48
> 
