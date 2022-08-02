Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp3053456lfg;
        Tue, 2 Aug 2022 02:51:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uEkCW2XNQzwbSb+cGZx3rP8DyYX4XTuNHN5PtH0VH+3Ir7TKQkQuXHG83JlTWIFHOtFB4r
X-Received: by 2002:a05:622a:1708:b0:31e:ed2e:8224 with SMTP id h8-20020a05622a170800b0031eed2e8224mr17351375qtk.138.1659433903533;
        Tue, 02 Aug 2022 02:51:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659433903; cv=none;
        d=google.com; s=arc-20160816;
        b=sZqnpA3uZo8yysfxmpRBmaKsMbjQOwFfSpzJ/HWwkRnA1fA39al0HJKOUROtkI0wrX
         Yd9mYnqw58t5aSdkU6tt2jyGxYwVClmL4WGoTIt4OiKHzxRM8NsfdUj0bskceIpdj+nG
         w7RUNTgnp0s9Z1x6L/JjHxRmAWcU6g/C+H8JFHR2luVdorU36hsL4jd4d909REYENVoZ
         gxcfwaN1EDyf1oKLtS9do3ftVYzv1icjDfBida6a20H4K1ihHV4lwSk+jZd9NkOtA5p1
         /OCQkZOWQDYxmOegJeDTPNtRW8Gi9e4T5ESd0HVQZ0romXEepsTSIVyZeVdz2qLD9dLi
         cCSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=aN5KDkFEL9Ls6j8Ihx/s3zySoeUAyBsUudqUEVvzbB4=;
        b=XUnI4oK/cd9XJYNK1bRwdpmrXarubEC8leq8G2Hd+0Fuwl4tiLbC69faaO/Ylb6Py1
         5hCytXn1x/WqO09pjHe8t2c52WI24eIpGDfFQWcMOFRFdtC/nJacyDrx9UYsDcXrKxZk
         fOX6uZeVSCVUNSFDhIbJB65nFVtAsWQTGOLA3gV9hgO9kVO4Tzxj51dL9svTkTGc2E0a
         pUg6z2oG3rBVvkjC4AS5KzQmTCypNSX3rEoD+AunLvM2QZY+q11vzM74br1fSUVguvYg
         7+NchcpREkerVGhVCoB7VhbVvz+hZIh9gl8/minoCknZHbmFunH3FwT7uFPndsXyT1Es
         nVlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WXKmcJXP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c5-20020ac81105000000b00325d9c13a3dsi4953314qtj.544.2022.08.02.02.51.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Aug 2022 02:51:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WXKmcJXP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oIoYx-0002tJ-18
	for alex.bennee@linaro.org; Tue, 02 Aug 2022 05:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oIoWj-0008Ph-6i
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:49:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oIoWg-0001RS-Pl
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:49:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659433762;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aN5KDkFEL9Ls6j8Ihx/s3zySoeUAyBsUudqUEVvzbB4=;
 b=WXKmcJXPlcVG2p305GkOOVGcNs6yNHTxpyuR7VjKacUDyyIGQ77Cd9c5ga4Cq/Nc4d+o7E
 um6zdgTBT/+fUDnITgT+Pt6+2g1rm4+O7xUp+bNlBBIwnMLsM1nP6I6FGBxPbmJw5tJIN3
 OqhrMvxv94gfdpbYD691wucVD7/LLB8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-8XKSRaEwMpiclN7nlNCFoQ-1; Tue, 02 Aug 2022 05:49:21 -0400
X-MC-Unique: 8XKSRaEwMpiclN7nlNCFoQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 c17-20020a7bc011000000b003a2bfaf8d3dso6019359wmb.0
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 02:49:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=aN5KDkFEL9Ls6j8Ihx/s3zySoeUAyBsUudqUEVvzbB4=;
 b=ta5o6xJak6Dkn6VIGi8bKpdAYkrC0l7jMLhjccIEUEJ2fVr/dPzoh3Jqh9unNVva28
 4w8b0Ulv2p33avx/bC31u3Xyg3wPFWb86Z1/XpbUW+G1i3BxN5nSZfaJuN5AUKbCnXNj
 R24M4Twwl+V9MJv5+hNGSrNn6hfSgGHOT7N7OfdcbuDAM7E0iDVKhGABsq2UDeDTY7zR
 82YpyGXJOhfK3a0cGS23jzBogE+ntoGSeZ1qh1oCby/dKi8B9r7vivbcUA/1qua4vkxw
 6VhqTjgyqEk67Zk5ZtYUAM2w0Jt1XmiPNA6f6JL5S32ZTAhZoYfR3dI8QiIoNy4bMfkt
 G7Ww==
X-Gm-Message-State: ACgBeo2qo+Wv+vDBeMzfZ2O7TYv+AOefrC4/HMESzzvx1B4xkfPrASIS
 V0Xoxf3gy5qosFeYOgvv40EOOtfzteujzr888lef/9vCBn7/+nZjV4Fc435ztQmlPmLfmgEgRjx
 9gSKAYM2GjLcKUU8=
X-Received: by 2002:adf:f30e:0:b0:21f:afbb:db23 with SMTP id
 i14-20020adff30e000000b0021fafbbdb23mr9285065wro.490.1659433759961; 
 Tue, 02 Aug 2022 02:49:19 -0700 (PDT)
X-Received: by 2002:adf:f30e:0:b0:21f:afbb:db23 with SMTP id
 i14-20020adff30e000000b0021fafbbdb23mr9285046wro.490.1659433759734; 
 Tue, 02 Aug 2022 02:49:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a5d48cd000000b0021e91d5bb1esm14613296wrs.8.2022.08.02.02.49.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 02:49:19 -0700 (PDT)
Message-ID: <d1011a19-0a3d-62f7-20aa-714fd56a6647@redhat.com>
Date: Tue, 2 Aug 2022 11:49:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] hw/arm/virt: Warn when high memory region is disabled
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, cohuck@redhat.com, zhenyzha@redhat.com,
 shan.gavin@gmail.com, Marc Zyngier <maz@kernel.org>
References: <20220802064529.547361-1-gshan@redhat.com>
 <20220802064529.547361-3-gshan@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20220802064529.547361-3-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BXBRGMPwq5hn

Hi Gavin,

On 8/2/22 08:45, Gavin Shan wrote:
> When one specific high memory region is disabled due to the PA
> limit, it'd better to warn user about that. The warning messages
> help to identify the cause in some cases. For example, PCIe device
> that has large MMIO bar, to be covered by PCIE_MMIO high memory
> region, won't work properly if PCIE_MMIO high memory region is
> disabled due to the PA limit.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/arm/virt.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index bc0cd218f9..c91756e33d 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1691,6 +1691,7 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>  static void virt_memmap_fits(VirtMachineState *vms, int index,
>                               bool *enabled, hwaddr *base, int pa_bits)
>  {
> +    const char *region_name;
>      hwaddr size = extended_memmap[index].size;
>  
>      /* The region will be disabled if its size isn't given */
> @@ -1713,6 +1714,23 @@ static void virt_memmap_fits(VirtMachineState *vms, int index,
>          vms->highest_gpa = *base + size - 1;
>  
>  	*base = *base + size;
> +    } else {
> +        switch (index) {
> +        case VIRT_HIGH_GIC_REDIST2:
> +            region_name = "GIC_REDIST2";
> +            break;
> +        case VIRT_HIGH_PCIE_ECAM:
> +            region_name = "PCIE_ECAM";
> +            break;
> +        case VIRT_HIGH_PCIE_MMIO:
> +            region_name = "PCIE_MMIO";
> +            break;
> +        default:
> +            region_name = "unknown";
> +        }
when highmem is turned off I don't think we want those warnings because
it is obvious that highmem regions are not meant to be used.

On the other hand I am afraid some users may complain about warnings
that do not affect them. If you miss high MMIO don't you get a warning
on guest side?

Thanks

Eric
> +
> +        warn_report("Disabled %s high memory region due to PA limit",
> +                    region_name);
>      }
>  }
>  

