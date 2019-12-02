Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp326646lfc;
        Mon, 2 Dec 2019 10:22:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqzui6RU7FvCHybN9zhQwnFA17iyV18yoRF+WhM2ZCvsVdqCy22GOKo1ePsBazE8tnzLcwjY
X-Received: by 2002:a17:906:4c8c:: with SMTP id q12mr575156eju.256.1575310941495;
        Mon, 02 Dec 2019 10:22:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575310941; cv=none;
        d=google.com; s=arc-20160816;
        b=rXySv93j8GCQmx4s0xmxwwSap8HhToWwNRyJIucKNI/+OmyoRzbXtq80wAY2uheMeC
         geWYZFKm8DRMRod+ucq7zwqnQssT5xYMh6f4u6H2T24jDX+HlWhtsdTLnq34lrPAXHtt
         BnmNXT5uqpebdqK/zICmGeyYrvtPGPhdLLfv4vr/X+6Fmn3dyzO0bkyBPumrbAuRRyEf
         DTgjptlpg1KfAFGWhb+X8HX1QA9f4Tmc4BZw4geLzjbR06SXrPaKMR+I+NRgkWIER4fI
         nVwt3Dzjm9b4C/moau6gBRpiHUJhUliTEKLReg+8kev7yLyo0MMvJ0h/G/TkLEaZbY7t
         cgDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mt0ebUCDlDgmkudTT+9hpvbvHuHkrX1tE7sw2iHLAt8=;
        b=vFhS7EwxTMTk8//Xi2H+KfGjyvkDseL1SBrBbn+otCizo5oYDlGEp5jJ9XagPLFCdU
         9ZnnK8D2VNjYpsSRc9kZU2IWoWOu9bcY4+27binNOFvKrXRsj1oXtvVv0CsZdw6aWkPq
         b4w/Si+20saFoOvmbc/OVMxwZvZgzG3Wq+QQ24l1f/iWChOZSmUQctyLf0C+UCYuRpeC
         H43OdLCuvR5G3eNh95N/tHwUsnbB0g1pLxa2RG4BWTrlSgSOOkdjolgwQyBViuhJRkRw
         /6LZ7fc1cDioGDqnZ1L26/a/3RcvvUwwIL+2CoL8y0tjgb1ltJMeVgVy0T5J9nlFhMCb
         x6Uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gX4AoLyX;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id c11si157152eds.65.2019.12.02.10.22.21;
        Mon, 02 Dec 2019 10:22:21 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gX4AoLyX;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727979AbfLBSWU (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Mon, 2 Dec 2019 13:22:20 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:37146 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727969AbfLBSWT (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 2 Dec 2019 13:22:19 -0500
Received: by mail-oi1-f193.google.com with SMTP id x195so573064oix.4
        for <kvm@vger.kernel.org>; Mon, 02 Dec 2019 10:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mt0ebUCDlDgmkudTT+9hpvbvHuHkrX1tE7sw2iHLAt8=;
        b=gX4AoLyXiyO1zwgoVhMLAVZUSrYejSWLpTUCSkiBTM8KIGfGghefVqaLWftqvuy6Pj
         4cuuh7ZuMbET9+Psx6/a854XuTdb/FIimeOv+hyIlMgKru2Z+gmys48h3M6bpd7qoo9S
         ofXdaDOv6K9Q7aqJGX5dIVqwOB1BkpeOLnfajgNaAq1lWHNwWHsbeX+qxUNwQrkaw7IV
         l0OBLF0KkTk+meKSgsBIoP0zg7mpiUegHM17p6gMhQsXdFTLCF/wxtN3J6eKS2ec8jk2
         4TBtpVV9N/go9/UjgELqSmmQAQ9rNqyRMUgByISLZIzK99yXgFdKnM4GqV1aZa/UWhH4
         j7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mt0ebUCDlDgmkudTT+9hpvbvHuHkrX1tE7sw2iHLAt8=;
        b=EWeQXRlaUMtNADlZY3WbDgYsoel7Pm8ky+bSSmnBUX7px2KxNB1l81sNp8lHaIRjga
         1lq79d2w3rCjSi4qnqNoOBYAUeNHnu4i4OKxHzekz40lhpVFaq+Jr0d+XzYanuCzdhkk
         StqDsIKM9mdzxhsOLHhNW0E1EdmBtbAbA8tkAGD2afUeEm34cN///wRzrz564WkZDaBt
         7nXVXe0wME8oPMtw7B6cDrLNJkl6QfgSXDr8hUfd9HKWY21ld9YfR5LP/rmZ7wL42E8u
         T4cIOE97nu+rnWlveDTsT0ZYplaOCj4IXgx4qB7h/b8u5gfV9kiR7zKJiecW8pet++jj
         WAsQ==
X-Gm-Message-State: APjAAAWo/iaI2FoCZN8/ffVhhO8LtBkOxXcwKaWWdjTwe+9PeaU73blY
        1sATEk64G05V0GgX6cTdszhOKFl8dZq6IiP8uzzuBA==
X-Received: by 2002:aca:1a0a:: with SMTP id a10mr315133oia.146.1575310938470;
 Mon, 02 Dec 2019 10:22:18 -0800 (PST)
MIME-Version: 1.0
References: <20191111014048.21296-1-zhengxiang9@huawei.com> <20191111014048.21296-2-zhengxiang9@huawei.com>
In-Reply-To: <20191111014048.21296-2-zhengxiang9@huawei.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Mon, 2 Dec 2019 18:22:07 +0000
Message-ID: <CAFEAcA8fkc+0RhOH7780sREPUOaCvE-rpUkwFN0-hwsVD7RiMg@mail.gmail.com>
Subject: Re: [RESEND PATCH v21 1/6] hw/arm/virt: Introduce a RAS machine option
To:     Xiang Zheng <zhengxiang9@huawei.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        Laszlo Ersek <lersek@redhat.com>,
        James Morse <james.morse@arm.com>,
        gengdongjiu <gengdongjiu@huawei.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        "xuwei (O)" <xuwei5@huawei.com>, kvm-devel <kvm@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>, Linuxarm <linuxarm@huawei.com>,
        wanghaibin.wang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 8iPmaf1KiuTE

On Mon, 11 Nov 2019 at 01:44, Xiang Zheng <zhengxiang9@huawei.com> wrote:
>
> From: Dongjiu Geng <gengdongjiu@huawei.com>
>
> RAS Virtualization feature is not supported now, so add a RAS machine
> option and disable it by default.
>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
> ---
>  hw/arm/virt.c         | 23 +++++++++++++++++++++++
>  include/hw/arm/virt.h |  1 +
>  2 files changed, 24 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index d4bedc2607..ea0fbf82be 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1819,6 +1819,20 @@ static void virt_set_its(Object *obj, bool value, Error **errp)
>      vms->its = value;
>  }
>
> +static bool virt_get_ras(Object *obj, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    return vms->ras;
> +}
> +
> +static void virt_set_ras(Object *obj, bool value, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    vms->ras = value;
> +}
> +
>  static char *virt_get_gic_version(Object *obj, Error **errp)
>  {
>      VirtMachineState *vms = VIRT_MACHINE(obj);
> @@ -2122,6 +2136,15 @@ static void virt_instance_init(Object *obj)
>                                      "Valid values are none and smmuv3",
>                                      NULL);
>
> +    /* Default disallows RAS instantiation */
> +    vms->ras = false;
> +    object_property_add_bool(obj, "ras", virt_get_ras,
> +                             virt_set_ras, NULL);
> +    object_property_set_description(obj, "ras",
> +                                    "Set on/off to enable/disable "
> +                                    "RAS instantiation",
> +                                    NULL);

I think we could make the user-facing description of
the option a little clearer: something like
"Set on/off to enable/disable reporting host memory errors
to a KVM guest using ACPI and guest external abort exceptions"

?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
