Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp560460lfg;
        Tue, 17 Aug 2021 07:12:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEzma6nsYp/ewhDHpmGh254MwAmM/ZvJCoa8uQk3r9KRDD0e5TC16xpRAZ9VF1C+0SVDjA
X-Received: by 2002:a67:800b:: with SMTP id b11mr2995778vsd.57.1629209575092;
        Tue, 17 Aug 2021 07:12:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629209575; cv=none;
        d=google.com; s=arc-20160816;
        b=B/kp1at5BvBPnWjneBdCLUBG8DbI59bFVtEXeITlXnj7uudo66x7G7U+hhVDSCGXT1
         Nab3cgMtNmzN6XfM2BPYd7kAv1j/w9N2uG9N0mtlAAU2I9go22mQKWYkkyz0rQDhMzMq
         36vEu1EV1KGZtAzba4dh1d1AkbIdRijo3j8I0Uqt3c6TtpRwtkZSJtNwyuPrUuxjkKqo
         0d9apF7dGxWH8GHCRDGudi40oieT3wK476CuY1qVEsSWFbb4P6ztthQAbnIuCSIVWk6b
         L5Iy9yJTFuGQxw1PhvB73/8CzAG2s5NahPa3w/mzl3cyFVxr1uOTS60a3aYT1Me91Ups
         f56w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=IO03zsCykHm+6KSXqCl8jypwY68VcgHf9Oa3RQAjU/M=;
        b=X+3aHRyfOFV/aomppvvhSyqYzUn4ZkfF9lGMiL7NA9s6YZx+4Q6A8aWZkiD6Z7hgLd
         nN8rNp+8wfzCMbM2ouCenJH7/1NKAXckVLpdxl2XapgbimQAEH8Y2vL6/04K30jocNaB
         A6GR/NDBDGcZ1Q6KkLQZCx7uT85tqloKhCwJ5EYNyrwtq7b+aJ78fFCT9wiD6JMt4D+i
         fZk+5Np3qFc5Lfk+t8UWtAXKWl5c2shBlIRRQBi/1DGjAJNQfmyhg5rIM3LMKjR/x3uS
         uVow2pA5XKVkLhEmS/JfJ22/WKK5pgMIHGaHwlmm/QPzYqc/RdBDN1fLtYjouhB5QTwW
         tbfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PJxrXnZE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m17si1260339vsj.370.2021.08.17.07.12.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Aug 2021 07:12:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PJxrXnZE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mFzpm-0000wd-Dj
	for alex.bennee@linaro.org; Tue, 17 Aug 2021 10:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mFzoq-0000Fq-JH
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 10:11:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mFzop-0002zi-23
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 10:11:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629209514;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IO03zsCykHm+6KSXqCl8jypwY68VcgHf9Oa3RQAjU/M=;
 b=PJxrXnZEe2qHEtk5iKRBMIRqPcm63CiCsKmaOoAC794lAHnYrIULb8qeB5nhSB8oEF0swb
 filcIlqAwvR0hLmhtwL5DPtxZ0b4t64d3n0IhVrtPKBI1o4rEhs5soCn28aAshUmBJlCE+
 P1r+N3Om31nrxG52SFdM0YNefcrAS/8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-tWcYvrfiMU6ECYInU7aRlQ-1; Tue, 17 Aug 2021 10:11:53 -0400
X-MC-Unique: tWcYvrfiMU6ECYInU7aRlQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 h17-20020a1709070b11b02905b5ced62193so6073898ejl.1
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 07:11:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=IO03zsCykHm+6KSXqCl8jypwY68VcgHf9Oa3RQAjU/M=;
 b=YFmOPZzesM4EA2aJ1NWg0YJnai4OsgckEbvu8hjDnvulW/QcLVmhPGWyy1csbFXTAS
 lJhN1/ynGDtMKXwXNLVcejTrlPn4+hmTv0akE7BXNva8KHfJ9g3efIZaUR1Ap3HXegF7
 dAlGx21M+ZTBr6E9V2yqRmPh2NrA/5jsQbP41VkmNMHwFRgPAey2iEqxiBq0B1R0Z8/A
 xUrq1se9/rmWTKaL16ZbkxmdoTPHP+oSGbaBnZ3yLqbAeyhXqla2iVT3gSwL2Qremr+y
 VIG3phQQtdhAZOdwEoaIXKZrPV3wIK7YnY7UUwIIaV9g0sEHU0OtOpyKSnN6HJafEdhZ
 ggsg==
X-Gm-Message-State: AOAM531unzXH61RFeI1qvRbyjScXJigC0xkFDBzuTEf+dMWNZYHGh1id
 CLxdqXr+B6yMNoxWkZIzRvQZfUt2e6aEm58QMnSUq0PDzcwgk17lyqG9/zNKDatH9wGuwLzXXSj
 j6g8t3Bj5B0rD+y8=
X-Received: by 2002:aa7:d2cd:: with SMTP id k13mr4355060edr.0.1629209512282;
 Tue, 17 Aug 2021 07:11:52 -0700 (PDT)
X-Received: by 2002:aa7:d2cd:: with SMTP id k13mr4355034edr.0.1629209512055;
 Tue, 17 Aug 2021 07:11:52 -0700 (PDT)
Received: from [192.168.43.95] ([37.173.36.144])
 by smtp.gmail.com with ESMTPSA id bf15sm1115809edb.83.2021.08.17.07.11.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 07:11:51 -0700 (PDT)
Subject: Re: [PATCH 6/6] pc: Allow instantiating a virtio-iommu device
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20210810084505.2257983-1-jean-philippe@linaro.org>
 <20210810084505.2257983-7-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <41720de5-ce29-dd79-2911-d974408af544@redhat.com>
Date: Tue, 17 Aug 2021 16:11:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210810084505.2257983-7-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.961, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8sRIpLlGN/xO

Hi Jean,

On 8/10/21 10:45 AM, Jean-Philippe Brucker wrote:
> From: Eric Auger <eric.auger@redhat.com>
>
> Add a hotplug handler for virtio-iommu on x86 and set the necessary
> reserved region property. On x86, the [0xfee00000, 0xfeefffff] DMA
> region is reserved for MSIs. DMA transactions to this range either
> trigger IRQ remapping in the IOMMU or bypasses IOMMU translation.
>
> Although virtio-iommu does not support IRQ remapping it must be informed
> of the reserved region so that it can forward DMA transactions targeting
> this region.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

I think we need to handle the case where the end-user gets lost with
iommu options and use an invalid combination such as

-M q35,iommu=on,int_remap=on,kernel_irqchip=off -device -device virtio-iommu-pci

We may also document somewhere that the virtio-iommu-pci
does not support irq remapping as this may be an important limitation on x86.

Thanks

Eric

> ---
>  hw/i386/pc.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 694fc9ce07..fb24f000e7 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1376,6 +1376,14 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
>                 object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
>          pc_virtio_md_pci_pre_plug(hotplug_dev, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
> +        /* Declare the reserved MSI region */
> +        char *resv_prop_str = g_strdup_printf("0xfee00000:0xfeefffff:%d",
> +                                              VIRTIO_IOMMU_RESV_MEM_T_MSI);
> +
> +        qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
> +        qdev_prop_set_string(dev, "reserved-regions[0]", resv_prop_str);
> +        g_free(resv_prop_str);
>      }
>  }
>  
> @@ -1436,7 +1444,8 @@ static HotplugHandler *pc_get_hotplug_handler(MachineState *machine,
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
>          object_dynamic_cast(OBJECT(dev), TYPE_CPU) ||
>          object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
> -        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
> +        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI) ||
> +        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
>          return HOTPLUG_HANDLER(machine);
>      }
>  

