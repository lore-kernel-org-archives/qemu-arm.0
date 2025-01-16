Received: by 2002:a05:7022:510:b0:92:a90b:6588 with SMTP id 16csp3538825dlj;
        Wed, 15 Jan 2025 23:13:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX6qIHMfoW0cpl1llj4VzVrzJRcFk++CzV+gAN+k0E4OvUA6Jb7OTUPmB04UXVdCAplV72H457pXz4jnA==@linaro.org
X-Google-Smtp-Source: AGHT+IHLxaKILvFQ3fBt+7xhN4qVb+prSa6lkGE5OoGJjTB4nWy9Dcd/ltX4k+3JLdYeAQwHRMdm
X-Received: by 2002:ac8:46c3:0:b0:467:4395:2ac9 with SMTP id d75a77b69052e-46c710253e4mr437425431cf.31.1737011624500;
        Wed, 15 Jan 2025 23:13:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737011624; cv=none;
        d=google.com; s=arc-20240605;
        b=LdFm56TMHcn8nOo6fkp7EHlnFGEI7dVL1hwdlNlj65F76IBG9EWLu+zdriR+YAcNGH
         1cdvPbjfRSROTbpspXssG5bYqDnAqDSxhTCPBDMb7l/YgnM391UtS8J4Ck06vtLpxFzY
         0HSZtQOqn+6jL19QGcncAJFuT6/21wrHybZcGKi0/c/ExzTCizpsX9TxJoR+VZsj99kB
         X2pUGqm2uotvVIrLSqob2455GCloyiiRf2Y1W23C5XWC+az6BWjLwAsz/ZZaF26iPLsx
         aLo/3s5ZguEqtdTRY3hFmfczCF2QCKLnekrhzDJvgEsOSgKz0E81W47YmZEl/Vu+QiEE
         stAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=8NaUV2wOJdtcS7/IH9dogfSTFf1Pg1urhueR+kHzYk4=;
        fh=DiA6tEl63ympuKogzocnAxZ+j9aLXmFsDXRa5TkKDDo=;
        b=OSSeFWau0FYnvlAlqW1lPGfknt64gfL45aAE55DF4kMYLSkS2TyHAjJj1rUCpx0NBY
         GPOlzrPNBvyeKJRRBvcI/u1GXitneBnzfW2Kvm3aTPBsxqkPijinYv5mecGt4m4hB88l
         yA5WMgjRJuDXMuXGe3pc+5hvG0X+jqIPA7sAD4mbqTCPH7//IEAssyY437cPj2O59Qwl
         hw1WebJ1SDtoZCuR7e7khIZN/Zvpkg8TpCqkZdX9URdgFj0iiD/cd4KDl32WbxPZ4Wv4
         XMqa6FwHZT20Gj7hilN4vOOkQIbg+KVgO4Qx1csOwSKxqcGw94rFMzxGluKJWTioYPKC
         AY5g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Lq6/Wbi1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46c87413733si170911881cf.488.2025.01.15.23.13.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2025 23:13:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Lq6/Wbi1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tYK4D-0007ye-3P; Thu, 16 Jan 2025 02:13:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tYK4A-0007xt-I1
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 02:13:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tYK48-0007Sn-R1
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 02:13:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737011599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8NaUV2wOJdtcS7/IH9dogfSTFf1Pg1urhueR+kHzYk4=;
 b=Lq6/Wbi1dl49CW/MdnVKLr/eiEKitQtx6tbBQ1396OSXM4s0N4A8D0EK+F97rxm+RLiNQY
 ucHLM0+iNxfR/y109PJO7pe3bcDUck0IRlbZydOI82X1baLf+DU8G+OX8jDc1/OjPdnfT9
 j/be/8N3MdbhQxCAm9Ceq3gWd1rI6FA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-SYiT5JSeOJCkED75sEXWTQ-1; Thu, 16 Jan 2025 02:13:18 -0500
X-MC-Unique: SYiT5JSeOJCkED75sEXWTQ-1
X-Mimecast-MFC-AGG-ID: SYiT5JSeOJCkED75sEXWTQ
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3860bc1d4f1so388434f8f.2
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2025 23:13:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737011597; x=1737616397;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8NaUV2wOJdtcS7/IH9dogfSTFf1Pg1urhueR+kHzYk4=;
 b=Yw0KUXYtW1YkwHYoZIOqmQa+2WAJDTKXxJpDc/ir+/3cNEiCtaJn5x3KTVPiYOtWR2
 1PRbFg4Owd/Huu5lZcRla1v3KVEORsIVQget9YyE4lahl1ijv0LNToOJijz8s/lo9RTH
 HAQnGBOr51zg7bPArPvE/lLHR30pqqgjSLWRdobGUAJJ86y+YSYqR/PbkSIiopIPLZ83
 6OO0xCrl2EkTFos6ZISiaVFb8IS1YpWnnpPT9ycja/nBpasVI0k7GnQFgG/hV6Qj3g1I
 xQS0fmnJCO30MudojVh0kdiPjekpicNZzmkgXzAav9mGMp0m1pyhFSDMZ1lSYbNg4Lr/
 L+NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUA8sl8GmTGl4cmjnuk7PfSDkpM8otipZJh3u3XFSerfl95JdKxxC9f3MTAhul6XKWGLmG/aeN/OQ==@nongnu.org
X-Gm-Message-State: AOJu0Yyc/4Bi4ILdZyCixFks+YArC0mjVLaaUCPpAEwbXBQgPiiuecEq
 BlCzbDBhH8uGHx9tH8ICY1ZB4gDnIuV51g5ejiLcgT7r3Niyw3xl2SKX45Ta0uJuDCOc/9yoV83
 p+bCykzsZjMdEnwSeZ+TRbArvw+x2RZSL7Qb9WwId9TcrvT3PNg==
X-Gm-Gg: ASbGncsJPMROpYDlAzEqo+900xycVU1s1O1R8oIQu/QmiNHCvMsJLaZzH07WFomfq6N
 zU+abE2+eYxGyYhaQFmlqvMr8rarP/WqKG7XRIWwr9rSWTUb3eKWaKchgtbGCl09/lfZ/oXmpjI
 0bevd0YYVWLbiFCNcG5DYpjk98A/VZe0C6OeK3bg2/BjLWGdJ+DO/cl1GkpPTFy5iQLVZV3h2oK
 iAtZCk5c/opU+y+lgA5bhuv+dk8es7JILj3QqinH4QsF8pq9e+Ib4XUX2RjP94/vv+e9A9y8dPp
 BmGMoyoDRZBX
X-Received: by 2002:a5d:64a4:0:b0:38a:8d32:2741 with SMTP id
 ffacd0b85a97d-38a8d322aaemr22189883f8f.19.1737011596977; 
 Wed, 15 Jan 2025 23:13:16 -0800 (PST)
X-Received: by 2002:a5d:64a4:0:b0:38a:8d32:2741 with SMTP id
 ffacd0b85a97d-38a8d322aaemr22189864f8f.19.1737011596687; 
 Wed, 15 Jan 2025 23:13:16 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-119.web.vodafone.de.
 [109.42.51.119]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4c1ce5sm19911579f8f.94.2025.01.15.23.13.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 23:13:15 -0800 (PST)
Message-ID: <9d9a1ae2-99bf-442b-a5e1-73dd70b6cf5c@redhat.com>
Date: Thu, 16 Jan 2025 08:13:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] hw/arm/virt: Remove
 VirtMachineClass::claim_edge_triggered_timers field
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Ani Sinha <anisinha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jones <ajones@ventanamicro.com>, qemu-arm@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>
References: <20250115171009.19302-1-philmd@linaro.org>
 <20250115171009.19302-8-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250115171009.19302-8-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7chpc42hKWtVwu73KbPdI6N5IxMgXj_fK3R1mly6GQ8_1737011597
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.793,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: UT/IsFCa88BG

On 15/01/2025 18.10, Philippe Mathieu-Daudé wrote:
> The VirtMachineClass::claim_edge_triggered_timers field
> was only used by virt-2.8 machine, which got removed.
> Remove it and simplify fdt_add_timer_nodes() and build_gtdt().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/arm/virt.h    | 1 -
>   hw/arm/virt-acpi-build.c | 5 +----
>   hw/arm/virt.c            | 5 -----
>   3 files changed, 1 insertion(+), 10 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

