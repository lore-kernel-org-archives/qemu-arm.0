Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3566747njn;
        Wed, 15 Jan 2025 22:52:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUzCRF0bv8Z58WDnWRSRZUw1ADwZrDx9fbK2IRL1DY8X7pnyZ7r6vcIMHMbJAySfqXvqA16JWWiqqKgEQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGS7EJUNmWeHq9A3yDjWeG2GCnxynTc9tZUbsi2DODXBTyw5xdpBCQTZUzc798rlez3e/YQ
X-Received: by 2002:ac8:7d16:0:b0:46c:77eb:42d4 with SMTP id d75a77b69052e-46c77eb44cemr476383281cf.22.1737010360240;
        Wed, 15 Jan 2025 22:52:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737010360; cv=none;
        d=google.com; s=arc-20240605;
        b=EtaVZv9Yy1p1KoqPcPCSeJBSpWob8d6kjY0T7nTqPW8wh1ekKgA8NvYqbyVTkdGkLJ
         GLN+PLTzaJO6z6bRj9FzJR2TcgnHEz93pTFQB0wVN1lA6hlIbtx8shl+Lk7gh89lhiw4
         dJozjLBc+ytMeB0d+7mqdrBDeE2COCJ1HEKZFA4arSZgCdPXYHdAZKS8CFDBnvqE1fzB
         AiOvDFQa48ga0SfFAmn10eLrB5xWDPcS+kypLq/BiWM8mtrI3r4IfPOu7bQKA0xusMjH
         6JV6nJUOUhJmwe9BTVDjJ3AeXDGxcNsnZEVx42r30db0CSTXazKt0LaRmWtr2+6Je68Y
         unMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=lKEwV/sdKWrppjVdXOPc4zyU0Q24V4j4YXXoN26YHJg=;
        fh=ZYGnVIcQnRHcP/mKry1E1TPpJ8hYKiR/b3z3fkH/k0A=;
        b=hLrJTiR/6iuKJTW4s3ATahtaPhfzpe+Ymasuk5lKi/DwMnzD1OJ1HUELKA8vMkbP4U
         rqQhOh1I5k4AJbMOcnPf4T9WDainJ9kfNhBuGSrh3A8pF0qp2d0OmKx/eFLJXp+bVnYn
         HyzFpFR1TwWyqlwyQvwZ/5QlGLbl8m/3Hv89IoNf9UjcigPNZPmKeOUkWClMPSxl+Z2F
         kBU5OpO/UU1+optVsFfF6RFOpst6x9P6qTfKMQ1SCc+ltj/LZhUZ0QQ75Yl5tq7s9qyB
         yp6z6Eap5toqEfNXlNjPdEwAh+XZd9XOoiO2SXkJBv29mdGCscIOQ8fEz4T1Ji1c63DO
         gYhg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Sh4n/bmi";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46c874164e9si155114951cf.590.2025.01.15.22.52.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2025 22:52:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Sh4n/bmi";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tYJjj-0001jb-KG; Thu, 16 Jan 2025 01:52:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tYJjh-0001j6-Lm
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 01:52:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tYJjf-0003n7-FO
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 01:52:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737010330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lKEwV/sdKWrppjVdXOPc4zyU0Q24V4j4YXXoN26YHJg=;
 b=Sh4n/bmivHYOACsn0KELoFeymdg9wOnspUwuyUen2116vGvv9l+FNn/TOVMbx/rl4RGejZ
 HlYo+XZxNUMOn+0z7PYAkVtancofA4i5IxheAgiN0lqH3nmrij11STK9SLNuBmlAxbtZDr
 zQ82WpSrgCIVzojPFHNUT4DIhNhtZaY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-eLwiQmLoOJSqj0MZse8u_A-1; Thu, 16 Jan 2025 01:52:08 -0500
X-MC-Unique: eLwiQmLoOJSqj0MZse8u_A-1
X-Mimecast-MFC-AGG-ID: eLwiQmLoOJSqj0MZse8u_A
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43624b08181so2737875e9.0
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2025 22:52:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737010327; x=1737615127;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lKEwV/sdKWrppjVdXOPc4zyU0Q24V4j4YXXoN26YHJg=;
 b=L0gHGJVHtJvmcLhKv6IdKa5DEkUiWLN2l5nu2YQyEOAWt4ZbjbTZeDcadiaRL4QWqS
 HNTSsC35sHLmhYTvELsR6/5sxeIzTRZs/qnmFcAdYfgtOwfkWlJAS0SK5eWjIg+QkwA5
 pb4vvZrug47QOuMnQP1pGfXK9FMt/inL/CTcDvaQbYI+AZmQ0FNm1lFykzGgJZU4c0lc
 7MEQ3RZNCs3THNPDY0oD0aaSImOocv/5A97s1DBZsghIZOgIlTZ5YHvlvS1onod+dJrL
 CS+sk++FX6BWG61ttG3kkyUIMu5M12g/SL7ab65nxHxNS0XRF/gAhHSnPV5gClWST9Dp
 G8EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSPJGEYngd03/MEJ712FoKzYM9lzwQrNUrvOhPzwKxpkpc5jA8Gn5NDsgg1qDWjV7Vf+a6yan2QQ==@nongnu.org
X-Gm-Message-State: AOJu0YwXh3LUjIyNiSVxM7KTbSe7D4zvKAbVsz5+yILoXJx80aYtE1ko
 nSKQeEajMFgnb/VXWTPImCXfWVLlCB/uK3LOFQNjZJr+H40FyOls5CWTAmvfsoQRaSDInGROyY4
 RC3ubwYl8jjuG7uVED0XkI68M/08hm4iRLslRt8YfT+QMnEMjXg==
X-Gm-Gg: ASbGncv5NtHlE7t38OSW48vxhQx3Au7N7rw5IalCJYBncfzdn4jiiLLvtulbuuVPNmY
 Wk5yVsuFcCptLP1TuwZI3230eBcXGsbeY3LU49tPYAIc0GyZSqCekJNfWWQOeTdWd+YrY61SvsA
 JpltkGnr0it5Mx0N61UACUDtW6lHQ4Hu7N3SdBAS+FMeksrvxqOi3lOx5BLTgzJ8pH6JuHpkbML
 6Jc5/gpexdOEnZTp7vnrC8eTkxc8ES3HMpt7G9LI+6yQG4d7tLnBFvVC/S4rKQrmuWZfos53tU7
 8lTUcIOAqJKK
X-Received: by 2002:a05:600c:8712:b0:434:ff08:202e with SMTP id
 5b1f17b1804b1-437c6b1c468mr46702005e9.8.1737010326952; 
 Wed, 15 Jan 2025 22:52:06 -0800 (PST)
X-Received: by 2002:a05:600c:8712:b0:434:ff08:202e with SMTP id
 5b1f17b1804b1-437c6b1c468mr46701825e9.8.1737010326595; 
 Wed, 15 Jan 2025 22:52:06 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-119.web.vodafone.de.
 [109.42.51.119]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c74ab449sm48141245e9.10.2025.01.15.22.52.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 22:52:05 -0800 (PST)
Message-ID: <82e6d8c3-3b5e-4c67-a1a8-8485e618d23e@redhat.com>
Date: Thu, 16 Jan 2025 07:52:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] hw/arm/virt: Remove deprecated virt-2.6 machine
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Ani Sinha <anisinha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jones <ajones@ventanamicro.com>, qemu-arm@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>
References: <20250115171009.19302-1-philmd@linaro.org>
 <20250115171009.19302-2-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250115171009.19302-2-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Nt2vKfdOtaAa8o9yqcKfqhAt75f6Urlh_DYcklSrGgE_1737010327
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LlyAlfBTmaDg

On 15/01/2025 18.09, Philippe Mathieu-Daudé wrote:
> This machines has been supported for a period of more than 6 years.
> According to our versioned machine support policy (see commit
> ce80c4fa6ff "docs: document special exception for machine type
> deprecation & removal") it can now be removed.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   docs/about/removed-features.rst |  4 ++++
>   hw/arm/virt.c                   | 12 ------------
>   2 files changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
> index c6616ce05e5..813988fad4a 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -1065,6 +1065,10 @@ for all machine types using the PXA2xx and OMAP2 SoCs. We are also
>   dropping the ``cheetah`` OMAP1 board, because we don't have any
>   test images for it and don't know of anybody who does.
>   
> +Arm ``virt-2.6`` (removed in 10.0)
> +''''''''''''''''''''''''''''''''''
> +This versioned machine has been supported for a period of more than 6 years.

I'd like to suggest that we rather add a generic statement to this file instead:

  https://lore.kernel.org/qemu-devel/20250116064644.65670-1-thuth@redhat.com/

>   linux-user mode CPUs
>   --------------------
>   
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 99e0a68b6c5..3bb8a9c7bd6 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -3606,15 +3606,3 @@ static void virt_machine_2_7_options(MachineClass *mc)
>       mc->minimum_page_bits = 0;
>   }
>   DEFINE_VIRT_MACHINE(2, 7)
> -
> -static void virt_machine_2_6_options(MachineClass *mc)
> -{
> -    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> -
> -    virt_machine_2_7_options(mc);
> -    compat_props_add(mc->compat_props, hw_compat_2_6, hw_compat_2_6_len);
> -    vmc->disallow_affinity_adjustment = true;
> -    /* Disable PMU for 2.6 as PMU support was first introduced in 2.7 */
> -    vmc->no_pmu = true;
> -}
> -DEFINE_VIRT_MACHINE(2, 6)

Reviewed-by: Thomas Huth <thuth@redhat.com>

