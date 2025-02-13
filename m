Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp740316njc;
        Thu, 13 Feb 2025 09:13:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCULF3tdQ7D888zvqFaPXsOeKqhq/TVyDxGGWbg5IIkmwsy50VshCuC9fZ5MovP5ZK7hdfgGfG2kWKxNWQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHdqr53Wxi1LlZ+rC3tZiBC6oISlY/hs7XyEgmhorxLVLkM1ezVSWnqbqQuWgf5XboWAnCo
X-Received: by 2002:a05:6214:19c3:b0:6e4:4085:9f72 with SMTP id 6a1803df08f44-6e46ed75dbemr149757566d6.7.1739466820166;
        Thu, 13 Feb 2025 09:13:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739466820; cv=none;
        d=google.com; s=arc-20240605;
        b=F5M2QpMD8SDFV8ptNsxAZO1KmIFDBh7TyHTWUGgzzC5axANgC5/wrZtaQRXVAYlCw5
         oO/yCXSejI78glcz5qHuq4j+8yhZKXf+Wz+n4ecbtFTlbWQXopfScuqiITpe9x1rFmUn
         v1yjrn+IsQdiExfGcu5X4l+X2Q683z3ygnjC6X8OvKlUyHmFlX1ehRLVIc3aNz1OppCg
         wBjsYc8HWeJxMTY+1HUui2t9zKnMFpOYahElE/2ZXztL8NFFqnWzdBxHQgKDI8Rx2JMG
         HNdr13kL2LQBAfWIqzZ+k4tXmwvszVmMct2LHTkKUf4Mu1tdlQxWc5nZ/GJG6YPjaB74
         meug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=zxQypIxJ4HK/TSyQYMIsRDfvv4b0zIaiSvT1oa7a3ys=;
        fh=g9DLg7Bdzso0AI4wTrjnZrCOfzl+aCUlpUeVpGIX3cY=;
        b=dWr6UTtxetBoJLAMd9D/vRKQD0kDV3tBRUdrmfNIj4U8f+6kNmYNmAYLLSzkebhLlz
         6nj/eZ7AIS2F5vLi68dii0xlCDPev8AAaJLDxyBM2Y6Pu+p12bszZrZpE3FCXy00habK
         opLV5UutQin80ujHSb35ktiHog/EnFnLFyVCjieYWCvLJnHk9U8pxoN+wHTREn9FydOC
         vR4Sgmj+hmuFKg2U5Cp64mLf4NmVtHt2NMqC/I1d1oZDzRA4ih5EL8XyP2RcbEQAuB3g
         EPJ/JseHRMEFhga1qb56JIcj5pnvZUDHrBjhGmPR8HuD85SYt453RB1UsavgrS9NYcvr
         1m+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F7Sh7aP6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d9c5b0bsi16525726d6.399.2025.02.13.09.13.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2025 09:13:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F7Sh7aP6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ticm1-0007fr-Kr; Thu, 13 Feb 2025 12:13:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ticln-0007d2-57
 for qemu-arm@nongnu.org; Thu, 13 Feb 2025 12:12:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ticlk-0008Li-T0
 for qemu-arm@nongnu.org; Thu, 13 Feb 2025 12:12:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739466774;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zxQypIxJ4HK/TSyQYMIsRDfvv4b0zIaiSvT1oa7a3ys=;
 b=F7Sh7aP6bzmm3fyfVkHF0t46Y9v8+a48/4e1xJP3oz5KNxwLgNcQjtDCupGJKvAkUek3jT
 pXpZLC9JYOiXLsOct5vrOGrRsjeCxq6wKw2tnTqyh9wMQ6q7dgzF2wqnSDSpbl8cyHaWer
 KmT9GUjDuXLsFXmPeKDRfiCfs2MccCE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-54JnfKBUMGOWQapa1R1sVQ-1; Thu, 13 Feb 2025 12:12:53 -0500
X-MC-Unique: 54JnfKBUMGOWQapa1R1sVQ-1
X-Mimecast-MFC-AGG-ID: 54JnfKBUMGOWQapa1R1sVQ_1739466772
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-38dc709f938so1298815f8f.0
 for <qemu-arm@nongnu.org>; Thu, 13 Feb 2025 09:12:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739466772; x=1740071572;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zxQypIxJ4HK/TSyQYMIsRDfvv4b0zIaiSvT1oa7a3ys=;
 b=AxWtIo6n3CJUGtuqQF9KOKFrCaxFgeU+kzCm2XcYoX99Acrdfa4ELlQLKML571Dmnf
 o8Ip9Bs9KTOel094JXWSxKFLtTH8gxQUax2XOWo7/HTcubt4kKTikO0w7nDNakcK4LQr
 daLMUYhVB9qBZrAEmZz/af5Q+nFPUCuBSdijF5BB7PatCM7KMsHF9QdOEYBCjsvcfJJq
 iGfN7aS/QorVkkTVuNF26sgmkn4Y+iFsSzaZ1PFVohiEzvkFbOXrSKR0kBschMUB8/NX
 OfLcHNonMed2uA2o22bXTty44uagOMKtil35MHQslGmHs9BAIPm4+/7Nt2ikYZrjOqp6
 PGwg==
X-Gm-Message-State: AOJu0Yz9GkZT1bP6ptuBv9AEuFI80GyFx361sLK61f2hyi8VPj/jUOMu
 qvpfIS7y2YrV+BuJjenF0b7AIGmy/Trn6ZEKFRgFIUIq+RBttluEaJ/W+UXhQhEWRSCKPHbXukb
 kOaPGagehcufYFP/Hb6XDcEtxvH4NQTOsEp6EWhxK4b/4T78PMg==
X-Gm-Gg: ASbGnctbrlPWag+58j4lOqKGDYChWQhjFytOYI30zDTT0cSgdIV3404Gpq+ECEHIs1X
 xR+fW7sAjnWoWsgJw0/luv59oxFCTNhr3Qec0UvwQqMaP3+bLrEjYoxDms04xrw1JGyYVH2v3gN
 NBBpZRU7iMI7RRBgx2wpCcJqnXjzR5v1MaSKwDhokH4XFvvnP3nim5j3Et4SU4B8Ey+LFuVaZ6e
 TTd44sb4MBCiooNgrswL7Yor6OzbKheGsKSrmRl+q2BTUk1+hW+Gx5vQSks2JVAvY8W2zH7zPIU
 vsGogvtAlheRFOdAr9bRnlyQ+ZH/q+c6eSmdQL0ov0C0+H7pnSNo
X-Received: by 2002:a05:6000:1fa7:b0:388:c61d:4415 with SMTP id
 ffacd0b85a97d-38f24f7236bmr4417929f8f.18.1739466772424; 
 Thu, 13 Feb 2025 09:12:52 -0800 (PST)
X-Received: by 2002:a05:6000:1fa7:b0:388:c61d:4415 with SMTP id
 ffacd0b85a97d-38f24f7236bmr4417879f8f.18.1739466771964; 
 Thu, 13 Feb 2025 09:12:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f8115sm2394404f8f.92.2025.02.13.09.12.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 09:12:51 -0800 (PST)
Message-ID: <191589e7-69ff-41db-94cd-988c83f623e4@redhat.com>
Date: Thu, 13 Feb 2025 18:12:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] hw/arm/virt: Support larger highmem MMIO regions
To: "Matthew R. Ochs" <mochs@nvidia.com>, qemu-devel@nongnu.org,
 shameerali.kolothum.thodi@huawei.com, nathanc@nvidia.com
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, ddutile@redhat.com,
 nicolinc@nvidia.com, ankita@nvidia.com, philmd@linaro.org, gshan@redhat.com
References: <20250212145457.1899954-1-mochs@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250212145457.1899954-1-mochs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cMtadQLPVCxnqmqKIHNt5bU_G0G8nqu4IWVN4n08Opw_1739466772
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3WoJcPbyOBCf




On 2/12/25 3:54 PM, Matthew R. Ochs wrote:
> The MMIO region size required to support virtualized environments with
> large PCI BAR regions can exceed the hardcoded limit configured in QEMU.
> For example, a VM with multiple NVIDIA Grace-Hopper GPUs passed through
> requires more MMIO memory than the amount provided by VIRT_HIGH_PCIE_MMIO
> (currently 512GB). Instead of updating VIRT_HIGH_PCIE_MMIO, introduce a
> new parameter, highmem-mmio-size, that specifies the MMIO size required
> to support the VM configuration.
>
> Example usage with 1TB MMIO region size:
> 	-machine virt,gic-version=3,highmem-mmio-size=1T
>
> Signed-off-by: Matthew R. Ochs <mochs@nvidia.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
> v4: - Added default size to highmem-mmio-size description
> v3: - Updated highmem-mmio-size description
> v2: - Add unit suffix to example in commit message
>     - Use existing "high memory region" terminology
>     - Resolve minor braces nit
>
>  docs/system/arm/virt.rst |  4 ++++
>  hw/arm/virt.c            | 38 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 42 insertions(+)
>
> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> index e67e7f0f7c50..6ff1de1ecbba 100644
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -138,6 +138,10 @@ highmem-mmio
>    Set ``on``/``off`` to enable/disable the high memory region for PCI MMIO.
>    The default is ``on``.
>  
> +highmem-mmio-size
> +  Set the high memory region size for PCI MMIO. Must be a power-of-2 and
> +  greater than or equal to the default size (512G).
> +
>  gic-version
>    Specify the version of the Generic Interrupt Controller (GIC) to provide.
>    Valid values are:
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 49eb0355ef0c..d8d62df43f04 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2773,6 +2773,36 @@ static void virt_set_highmem_mmio(Object *obj, bool value, Error **errp)
>      vms->highmem_mmio = value;
>  }
>  
> +static void virt_get_highmem_mmio_size(Object *obj, Visitor *v, const char *name,
> +                          void *opaque, Error **errp)
> +{
> +    uint64_t size = extended_memmap[VIRT_HIGH_PCIE_MMIO].size;
> +
> +    visit_type_size(v, name, &size, errp);
> +}
> +
> +static void virt_set_highmem_mmio_size(Object *obj, Visitor *v, const char *name,
> +                          void *opaque, Error **errp)
> +{
> +    uint64_t size;
> +
> +    if (!visit_type_size(v, name, &size, errp)) {
> +        return;
> +    }
> +
> +    if (!is_power_of_2(size)) {
> +        error_setg(errp, "highmem_mmio_size is not a power-of-2");
> +        return;
> +    }
> +
> +    if (size < extended_memmap[VIRT_HIGH_PCIE_MMIO].size) {
> +        error_setg(errp, "highmem_mmio_size is less than the default (%lu)",
> +                   extended_memmap[VIRT_HIGH_PCIE_MMIO].size);
> +        return;
> +    }
> +
> +    extended_memmap[VIRT_HIGH_PCIE_MMIO].size = size;
> +}
>  
>  static bool virt_get_its(Object *obj, Error **errp)
>  {
> @@ -3446,6 +3476,14 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>                                            "Set on/off to enable/disable high "
>                                            "memory region for PCI MMIO");
>  
> +    object_class_property_add(oc, "highmem-mmio-size", "size",
> +                                   virt_get_highmem_mmio_size,
> +                                   virt_set_highmem_mmio_size,
> +                                   NULL, NULL);
> +    object_class_property_set_description(oc, "highmem-mmio-size",
> +                                          "Set the high memory region size "
> +                                          "for PCI MMIO");
> +
>      object_class_property_add_str(oc, "gic-version", virt_get_gic_version,
>                                    virt_set_gic_version);
>      object_class_property_set_description(oc, "gic-version",
Reviewed-by: Eric Auger <eric.auger@redhat.com>

The only nitpick I have is that if you read

static MemMapEntry extended_memmap[] = {
    /* Additional 64 MB redist region (can contain up to 512
redistributors) */
    [VIRT_HIGH_GIC_REDIST2] =   { 0x0, 64 * MiB },
    [VIRT_HIGH_PCIE_ECAM] =     { 0x0, 256 * MiB },
    /* Second PCIe window */
    [VIRT_HIGH_PCIE_MMIO] =     { 0x0, 512 * GiB },
};
and the above comment, it is not obvious that the HIGH_PCI_MMIO can be
extended by an option. A distracted reader may not get it.

But I don't know if it is worth respinning.

Eric


