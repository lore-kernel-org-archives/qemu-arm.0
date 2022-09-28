Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp391500ocs;
        Wed, 28 Sep 2022 09:00:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7mhs+f4xHLO5mmbZEtIFoSpoxflVoIIYB7RMYhth3RBKTKtinxsu9LCxWLvHynEZI5SZto
X-Received: by 2002:ac8:5f4a:0:b0:35c:ecaf:33d7 with SMTP id y10-20020ac85f4a000000b0035cecaf33d7mr27661945qta.683.1664380817241;
        Wed, 28 Sep 2022 09:00:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664380817; cv=none;
        d=google.com; s=arc-20160816;
        b=LkdyIDqPDRpdn2deKpYcilFb5WISEbEO+rFpcrvXXLsEyYvurks+yyZEu4FZpWu20h
         9/ke8u9TlRQUuyKUPZyi/1Rx5ucVguZ4El24okZR5tN8Wj35ksnuScTnqN3ZXmsxdWX3
         7eLvdp4yba0V5EmWYT6iaeCqZAZ0L9f0j08RgpJvRhzaJ5re0+aq2fEDxDXoDpnqk+k3
         Xh9hHlGES+s5vrANLHWW79LtvU0SM5AOZ9o5bSLsYMXBI6/FJ4b/BL3a+DfkIoV83kNr
         mqgwYFALBrihhjht+CtYfaWzpgeH2BX5SiRu6ToZ2zyW3T8xzEbps0+JwqOgniJny8iY
         b4ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=HVbZi56WWVl+SPbWvCThowte/6idgZ6SqtpR3owqm+g=;
        b=eDG9cIDHcvZj59xRIFMDYWqys2E9cIsV+mhaopW6l5S3uUr+Flj7CoKIoiIylvYY/m
         Ml+uysR016LK5WUAjgDfsOKLkEgb3IS7qS6ilTYIYXVuoPtENAgc0xddpWhlmVkNIXnL
         Ide9OT0LWAvlYp3GRX90bk2RPvK/D7Z8pV9XTYio3JCwYZxHpdEAC6C0QhJ5Njzfm1X9
         sN0YasMSPj6tj8p7NGsEjGA8KkLHDroYmN4hUOcUb7eDHSaddRAUo/MX0TU1XTwcn9HR
         dLMhX7+5xjIs9WsL4LxxGXzPtDGK+S3wMBeEZ4Gsraei0WA7s8nHAr4mgm+nE9xXAaLY
         UcQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cZ8Eaah5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x129-20020a379587000000b006ce5e0fe9b9si2632645qkd.305.2022.09.28.09.00.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Sep 2022 09:00:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cZ8Eaah5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odZTs-0005Jz-96
	for alex.bennee@linaro.org; Wed, 28 Sep 2022 12:00:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1odWXX-0006Uz-DP
 for qemu-arm@nongnu.org; Wed, 28 Sep 2022 08:51:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1odWXT-0001ws-N7
 for qemu-arm@nongnu.org; Wed, 28 Sep 2022 08:51:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664369506;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HVbZi56WWVl+SPbWvCThowte/6idgZ6SqtpR3owqm+g=;
 b=cZ8Eaah5mHqLEMG8uVww2jrLN/I6k44pKxnW6JM47QscHV+1kXea7vp1/U3XoktEy+qTQt
 i30jkzNDEnC8p5Fwdz663/UGeHdErEsqkn3Ukd5ZrFGZieK8SJ8VEDSYVVphzCeZYAD666
 izOFQDLR9LDQ+ru8Mr0ZPC78y25eX0A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-643-X_iyk3j8PYGDWBE458RQWQ-1; Wed, 28 Sep 2022 08:51:45 -0400
X-MC-Unique: X_iyk3j8PYGDWBE458RQWQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 x1-20020adfbb41000000b0022b113add45so2998630wrg.10
 for <qemu-arm@nongnu.org>; Wed, 28 Sep 2022 05:51:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=HVbZi56WWVl+SPbWvCThowte/6idgZ6SqtpR3owqm+g=;
 b=mG08EnQ386Wma5U2oT3M3T1y28Gi6V/h2wZszBL0ir30tATDTpXGhM+kc5dE/xZ6/X
 sMonQgWzv04qnIBpJRxDOW48k9YqGuiVDwvBW/NwMzNKDbXcN86esxGdvpRroxxiL9Ps
 zYWatppPclUAZEnO+pu0gxpFc6WJiBCqW2rfECKnvBPw+zYmK3TMHlclgIogl1sHnW7M
 LSaHk5N3Qt98iSbfu/wMCYq8ye5loWFg9bZjEGy4SizdwuLVnbnC0i/RN4mRnN9Pu5em
 bazGUHUahaklD4pWhSez43joxtZSSjm5vbloiPW7ZcaZaXoBM9KL8YKYlHPU80QDwMqO
 Ivvg==
X-Gm-Message-State: ACrzQf135pO63d5bGaQBjMUTO3o0kJVWiWD2D5XJZEKt/rNKaMwf5qku
 K6ElK/s3byZSNn3IZLDoM8k9Ui84Hmg96BL5X3DtMzroz4la5QDE0FQR4ye/CfNqPIcRNy5F3Fb
 X77kb/940ukk6
X-Received: by 2002:a05:600c:1906:b0:3b4:c979:e686 with SMTP id
 j6-20020a05600c190600b003b4c979e686mr6861387wmq.107.1664369503332; 
 Wed, 28 Sep 2022 05:51:43 -0700 (PDT)
X-Received: by 2002:a05:600c:1906:b0:3b4:c979:e686 with SMTP id
 j6-20020a05600c190600b003b4c979e686mr6861366wmq.107.1664369503073; 
 Wed, 28 Sep 2022 05:51:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a5d63d0000000b00228d8420f57sm4192862wrw.95.2022.09.28.05.51.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 05:51:42 -0700 (PDT)
Message-ID: <6c9a644a-6add-af29-8463-eddb101c1c99@redhat.com>
Date: Wed, 28 Sep 2022 14:51:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 4/5] hw/arm/virt: Improve high memory region address
 assignment
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, cohuck@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 shan.gavin@gmail.com
References: <20220921231349.274049-1-gshan@redhat.com>
 <20220921231349.274049-5-gshan@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20220921231349.274049-5-gshan@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yhQzsiscifnc

Hi Gavin,

On 9/22/22 01:13, Gavin Shan wrote:
> There are three high memory regions, which are VIRT_HIGH_REDIST2,
> VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
> are floating on highest RAM address. However, they can be disabled
> in several cases.
>
> (1) One specific high memory region is disabled by developer by
>     toggling vms->highmem_{redists, ecam, mmio}.
>
> (2) VIRT_HIGH_PCIE_ECAM region is disabled on machine, which is
>     'virt-2.12' or ealier than it.
>
> (3) VIRT_HIGH_PCIE_ECAM region is disabled when firmware is loaded
>     on 32-bits system.
>
> (4) One specific high memory region is disabled when it breaks the
>     PA space limit.
>
> The current implementation of virt_set_memmap() isn't comprehensive
> because the space for one specific high memory region is always
> reserved from the PA space for case (1), (2) and (3). In the code,
> 'base' and 'vms->highest_gpa' are always increased for those three
> cases. It's unnecessary since the assigned space of the disabled
> high memory region won't be used afterwards.
>
> This improves the address assignment for those three high memory
> region by skipping the address assignment for one specific high
> memory region if it has been disabled in case (1), (2) and (3).
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/arm/virt.c | 44 ++++++++++++++++++++++++++------------------
>  1 file changed, 26 insertions(+), 18 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b0b679d1f4..b702f8f2b5 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1693,15 +1693,31 @@ static void virt_set_high_memmap(VirtMachineState *vms,
>                                   hwaddr base, int pa_bits)
>  {
>      hwaddr region_base, region_size;
> -    bool fits;
> +    bool *region_enabled, fits;
IDo you really need a pointer? If the region is unknown this is a bug in
virt code.
>      int i;
>  
>      for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
>          region_base = ROUND_UP(base, extended_memmap[i].size);
>          region_size = extended_memmap[i].size;
>  
> -        vms->memmap[i].base = region_base;
> -        vms->memmap[i].size = region_size;
> +        switch (i) {
> +        case VIRT_HIGH_GIC_REDIST2:
> +            region_enabled = &vms->highmem_redists;
> +            break;
> +        case VIRT_HIGH_PCIE_ECAM:
> +            region_enabled = &vms->highmem_ecam;
> +            break;
> +        case VIRT_HIGH_PCIE_MMIO:
> +            region_enabled = &vms->highmem_mmio;
> +            break;
While we are at it I would change the vms fields dealing with those
highmem regions and turn those fields into an array of bool indexed
using i - VIRT_LOWMEMMAP_LAST (using a macro or something alike). We
would not be obliged to have this switch, now duplicated.
> +        default:
> +            region_enabled = NULL;
> +        }
> +
> +        /* Skip unknown region */
> +        if (!region_enabled) {
> +            continue;
> +        }
>  
>          /*
>           * Check each device to see if they fit in the PA space,
> @@ -1710,23 +1726,15 @@ static void virt_set_high_memmap(VirtMachineState *vms,
>           * For each device that doesn't fit, disable it.
>           */
>          fits = (region_base + region_size) <= BIT_ULL(pa_bits);
> -        if (fits) {
> -            vms->highest_gpa = region_base + region_size - 1;
> -        }
> +        if (*region_enabled && fits) {
> +            vms->memmap[i].base = region_base;
> +            vms->memmap[i].size = region_size;
>  
> -        switch (i) {
> -        case VIRT_HIGH_GIC_REDIST2:
> -            vms->highmem_redists &= fits;
> -            break;
> -        case VIRT_HIGH_PCIE_ECAM:
> -            vms->highmem_ecam &= fits;
> -            break;
> -        case VIRT_HIGH_PCIE_MMIO:
> -            vms->highmem_mmio &= fits;
> -            break;
> +            vms->highest_gpa = region_base + region_size - 1;
> +            base = region_base + region_size;
> +        } else {
> +            *region_enabled = false;
>          }
> -
> -        base = region_base + region_size;
>      }
>  }
>  
Thanks

Eric

