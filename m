Received: by 2002:ac2:5bdb:0:0:0:0:0 with SMTP id u27csp1296373lfn;
        Tue, 26 Oct 2021 03:43:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvsIXzaSUoVC7ywJQnMRJzInEM5EVwud/om52xTnbhVAVnIm7QJ5SSKzl6Mw0CAobrvHNf
X-Received: by 2002:a05:6830:240e:: with SMTP id j14mr18086375ots.354.1635244981652;
        Tue, 26 Oct 2021 03:43:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635244981; cv=none;
        d=google.com; s=arc-20160816;
        b=QctWiz2HLt545Eh9+LlcT6TA2EhREdDpwt336Qc5B61qrDEit14TlEnjVezq7VH11k
         15J0Mml7LLDKAzIlvvEQ+ncD0oJPebK+OJ9wM1YpGrqFMn7mlXOppzJW6Fd6dRp0xTaG
         LH0zT2+PYQm2SnWxQeV+XgXORWPEKb8btdjIWMld9/f5QlbXV9dyquHumAsVncruV/9y
         InZLSnjaXvVULIfGuVtnmK2cN8vErtWw+wQF/NZPh32+Pr+nhmjJ+EZBSx9vrsRgZm8L
         Wcx6al3XbPS/a6qBbslut3pZkgrx9l+avgvIxCRxUffLYYiItlWIJr0IQasVcds+weJg
         AurQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=TpqPQkhd+ArBORs2KZDqdXyKr8UCY+zKb+A/SAc4ums=;
        b=Naa9W8jkDTrZPH1dZB/DsjZSNToZjVTZ0R1BJuoYW/8FA5VWhkb+09T+aG6ohrO5w3
         c/YvfGdHjv9onLIXxH1l+TNjjTlbA/BHg5LE8XSdfA1I8VQDYsnZZWfyv8gTAocA4Cim
         Nml6xxAPPEYAdlhtL0TLtfLIxuic1ypmbenYzBW02M32zykFw4NE/4MOlI5Yzn7cp/rU
         tuHa4QVooNp1AOMyT9/9HcMlDNp9wK3P7WqCN3kpgLbIFf/BaghT/5DEoJ3q3Q1iFBIA
         7JeU0XacWJvUet/Njp5Gz/YAgWvp1qTTAeCzfNoBItZDipSUI7nO26I0MTTq913LrJKu
         sJig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BIb8fjPN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j6si34415459otu.343.2021.10.26.03.43.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Oct 2021 03:43:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BIb8fjPN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mfJv2-0002Tz-PM
	for alex.bennee@linaro.org; Tue, 26 Oct 2021 06:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfJkr-0000A5-M0
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:32:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfJkp-0005DN-LH
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:32:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635244347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TpqPQkhd+ArBORs2KZDqdXyKr8UCY+zKb+A/SAc4ums=;
 b=BIb8fjPNnUbNgoJOmrFG7dF/TaGKaC/bQyGX/0aEi+xIfmvGEaf2mdV10h/Zdz2hPf3TjH
 ndSpKdLhi2IN03fOzm2mfY8zf25/etiiAg29+8NUyuXAY8MvczFjjl7CIlyozkB23jEir5
 WWL88xZEBUaEN1ZvDWE3mnCBtfG/3j0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367--tCVh3ZDPXCI67Kkiy8_3A-1; Tue, 26 Oct 2021 06:32:25 -0400
X-MC-Unique: -tCVh3ZDPXCI67Kkiy8_3A-1
Received: by mail-wm1-f71.google.com with SMTP id
 z17-20020a7bc7d1000000b0032cafafaf79so745207wmk.5
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TpqPQkhd+ArBORs2KZDqdXyKr8UCY+zKb+A/SAc4ums=;
 b=aYlhbANzdM94dPpGoquUtDQlSR+wZzsTB16a5J93V3fWTLBvJuIN+TP6PDf+y/PT/z
 uMDg7iQZQ23LbYgL9hlQlJ+H5SslDi00G4OvggvTioYvygSiBEzJGRzu7KwG6yBHnNNT
 ugGqKNFii7HkKL//4qugclZi0W8AGOyjsLb8wnawkAn5ozDDsmY5IKmOo3J62CsjXKUc
 4PFTbMXxj0bkYBINbTyewi3pGX3WYE7M/88wp9I7So9C3ig3vpSJpRsZY0vdLAhCLjb7
 6p3VCbMl3uHRIrz6Rvj3WK2p7ONqo6F7ZNxKogC31GSh5e5fTKEnuElSsRryM3pE2v5V
 MJQg==
X-Gm-Message-State: AOAM530DwrsXB2rLRn+98NAy/VT1RMupSgOB+oKdarsW/hDswsow2dnD
 rBETazlE5R7W91IAL6b1ZJmgQmH5tvyKLgbN4GCxU/T1BAj0I+r8LvhvsKxz0UN+xv5UxJLtIU3
 gLuBmOxQIiFQvNQw=
X-Received: by 2002:a1c:7c0e:: with SMTP id x14mr26471488wmc.128.1635244344599; 
 Tue, 26 Oct 2021 03:32:24 -0700 (PDT)
X-Received: by 2002:a1c:7c0e:: with SMTP id x14mr26471464wmc.128.1635244344417; 
 Tue, 26 Oct 2021 03:32:24 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id p21sm221427wmc.11.2021.10.26.03.32.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 03:32:24 -0700 (PDT)
Message-ID: <eca5afd7-cd1b-2877-494f-6b0c441f5ac5@redhat.com>
Date: Tue, 26 Oct 2021 12:32:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] hw/arm/virt: Rename default_bus_bypass_iommu
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
References: <20211026093733.2144161-1-jean-philippe@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211026093733.2144161-1-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.215, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mEiczmwxYvOw

On 10/26/21 11:37, Jean-Philippe Brucker wrote:
> Since commit d8fb7d0969d5 ("vl: switch -M parsing to keyval"), machine
> parameter definitions cannot use underscores, because keyval_dashify()
> transforms them to dashes and the parser doesn't find the parameter.
> 
> This affects option default_bus_bypass_iommu which was introduced in the
> same release:
> 
> $ qemu-system-aarch64 -M virt,default_bus_bypass_iommu=on
> qemu-system-aarch64: Property 'virt-6.1-machine.default-bus-bypass-iommu' not found
> 
> Rename the parameter to "default-bus-bypass-iommu". Passing
> "default_bus_bypass_iommu" is still valid since the underscore are
> transformed automatically.
> 

Cc: qemu-stable@nongnu.org

> Fixes: 6d7a85483a06 ("hw/arm/virt: Add default_bus_bypass_iommu machine option")
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Tested-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
> v2: Resending to be merged separately from the equivalent x86 fix,
>     already queued by Paolo [2]. No change other than added review tag.
> v1: https://lore.kernel.org/qemu-devel/20211013160607.649990-2-jean-philippe@linaro.org/
> 
> [2] https://lore.kernel.org/qemu-devel/55e7387a-4bc0-1743-1013-19c38a6ceb77@redhat.com/
> ---
>  hw/arm/virt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ca433adb5b..369552ad45 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2737,10 +2737,10 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>                                            "Set the IOMMU type. "
>                                            "Valid values are none and smmuv3");
>  
> -    object_class_property_add_bool(oc, "default_bus_bypass_iommu",
> +    object_class_property_add_bool(oc, "default-bus-bypass-iommu",
>                                     virt_get_default_bus_bypass_iommu,
>                                     virt_set_default_bus_bypass_iommu);
> -    object_class_property_set_description(oc, "default_bus_bypass_iommu",
> +    object_class_property_set_description(oc, "default-bus-bypass-iommu",
>                                            "Set on/off to enable/disable "
>                                            "bypass_iommu for default root bus");
>  
> 

