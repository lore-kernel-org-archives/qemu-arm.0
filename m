Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3867528lfb;
        Mon, 6 Sep 2021 07:57:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzebDoZyEixkhkSSW+cDiJI2akX0PZ9OGF7vWtnk0XNZp3nRAlIq3EenEg3eSwkBIt9LLIE
X-Received: by 2002:a05:6808:1892:: with SMTP id bi18mr8406883oib.105.1630940277232;
        Mon, 06 Sep 2021 07:57:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630940277; cv=none;
        d=google.com; s=arc-20160816;
        b=wzy0n5QxUcOUlzB4iAZVWAkXTCFz0fr0HAKwzAZlxzNHwhEQ1FR8T1jyB/qY6i0FvA
         /JcR2AeW2k0IBk7ESxp4PC8JpdxvtElikZPKGwB/uUECgf4z/TOa9x+LL5HbRljmw58E
         HBlW6NdipszBxF6UV0Sy95ZHAODRtB5qWyyaZ7QHcmTg7C6bwHfsQJ7LN6bkuGu/PtFc
         fHWu5sHn0+MRDdIk+hIRkqyEZ4GtxttUdKnoaIaAQGiEA052CxXFyaoF0K07m985Kmp6
         P5TV7w7dldFw8Qk4tB+YdO3QIZK0IHwXqK78bIAREXU4qq5X6phS5g68a0wSkwQvppvj
         PzHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=4FOle7Y5/PRsEiSmiJ2pYqhRPjpazpNJhb/GT9RMwnM=;
        b=Q/1O5Aey2YbtNh8A1mQhSRgQzrP+jl2cGuDh78e2hy+zHSmoiexLLBDnk+icSPzoVA
         e5st6taqVGrTDtrdvLAb91kc0XsgSSXLrw9nIxFeNn2sMdDZrxhpyuTt65ldJDZ6pWDQ
         fbydnc1zaoysw6IlqGIBuT3odvoeTdnN+p1w8UtDWIfybheF9hPYIDBYeHOn4+jSDg9v
         DZK2jLn2owbXXjm09r8YjNbx8pC9rYwoG68jmgsjvt/7FKPes506zAIQ0Xm1ljfMpLym
         rRFkNkjyBUnR6O6onuqjIJouinZGm/x+odJJ8Qqi6pIBI/N3bBHtQMm58oC5PIGxUDEM
         /L5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gc+8N5QD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c23si6408116otp.44.2021.09.06.07.57.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Sep 2021 07:57:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gc+8N5QD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNG4K-0000xm-H6
	for alex.bennee@linaro.org; Mon, 06 Sep 2021 10:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNG4B-0000xU-GD
 for qemu-arm@nongnu.org; Mon, 06 Sep 2021 10:57:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNG49-0006JH-8W
 for qemu-arm@nongnu.org; Mon, 06 Sep 2021 10:57:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630940264;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4FOle7Y5/PRsEiSmiJ2pYqhRPjpazpNJhb/GT9RMwnM=;
 b=gc+8N5QDpphD6+XKs8JbKDCEnw5IwkDzdvilqcrLaXwwraslgpHuzMny+luuzN1jDRi0bU
 OSJVvYhNtULrC74yK/WXQaPa5okkMox6rObtuUmbgc/zf3mXAarERJ+44wyryhti1bBK59
 AOPnscaTXMhsYxrrJbca8oMZRzWqiQA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-3guc9bbJNrK3LVgq6WTCZQ-1; Mon, 06 Sep 2021 10:57:43 -0400
X-MC-Unique: 3guc9bbJNrK3LVgq6WTCZQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 p10-20020a5d68ca000000b001552bf8b9daso1260329wrw.22
 for <qemu-arm@nongnu.org>; Mon, 06 Sep 2021 07:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=4FOle7Y5/PRsEiSmiJ2pYqhRPjpazpNJhb/GT9RMwnM=;
 b=KEIsjWzpVF9ZVO7C2kSwSPGDp10bz6ByTCMtfDPmosDdw5T5KohREb7p0x00JJWWCy
 iAnKls07NWJMGGgXkdQdE10cIrbLUE+3SGDq4GRK8IFcsGRzLr1pj6JMVbL46cePQFgx
 p5aD63gwKFWEKTZ3QcE2pxWz5nCcYImgOIKeDPqacydpfIvtQTaQzUh4v9UcHmCB0+xx
 HxFRx7N8cgAFcngzjCMPZ/x+jYiNcVkqGlZnkRXlsHUmTekGj6C6FmWLDG/hwV63r4KA
 GW56aCQzeUnq9JNsRKIPdNV7N2Y0JXHivqvtMOrhLxkosqrtrltgV2n57xacfzh7EzzC
 el8g==
X-Gm-Message-State: AOAM530u5rmj8tSiHcawIhqzP5QJlFogk87JCGFIOyMfowqh7aGYecML
 NzDnt2EQbF2xLe8VingeJcEdLzh05xZFpRIREzRMNm1V1mo1CwNToS2T9xkr3LP1t9c0eKpwG5T
 0h1Wu3i1fJKSRDrdwlECCh1NGLmKZirBcOZ83UXgeIOtWytnYcwj15z5cYhbVGHUlKC0=
X-Received: by 2002:adf:c411:: with SMTP id v17mr14162755wrf.160.1630940261837; 
 Mon, 06 Sep 2021 07:57:41 -0700 (PDT)
X-Received: by 2002:adf:c411:: with SMTP id v17mr14162724wrf.160.1630940261515; 
 Mon, 06 Sep 2021 07:57:41 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id g5sm8039625wrq.80.2021.09.06.07.57.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 07:57:40 -0700 (PDT)
Subject: Re: [PATCH v2 7/8] pc: Allow instantiating a virtio-iommu device
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
 <20210903143208.2434284-8-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <9e656d29-9ead-c095-15b6-3038ac60127a@redhat.com>
Date: Mon, 6 Sep 2021 16:57:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210903143208.2434284-8-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rdY6q9vfB5GU

Hi Jean,

On 9/3/21 4:32 PM, Jean-Philippe Brucker wrote:
> From: Eric Auger <eric.auger@redhat.com>
>
> Add a hotplug handler for virtio-iommu on x86 and set the necessary
> reserved region property. On x86, the [0xfee00000, 0xfeefffff] DMA
> region is reserved for MSIs. DMA transactions to this range either
> trigger IRQ remapping in the IOMMU or bypasses IOMMU translation.
s/bypasses/bypass.
> Although virtio-iommu does not support IRQ remapping it must be informed
> of the reserved region so that it can forward DMA transactions targeting
> this region.

>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
Feel free to remove my SoB. I have done much here.
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  hw/i386/pc.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 694fc9ce07..c1e1cffe16 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -797,6 +797,11 @@ void pc_machine_done(Notifier *notifier, void *data)
>                       "irqchip support.");
>          exit(EXIT_FAILURE);
>      }
> +
> +    if (pcms->virtio_iommu && x86_iommu_get_default()) {
> +        error_report("QEMU does not support multiple vIOMMUs for x86 yet.");
> +        exit(EXIT_FAILURE);
> +    }
>  }

I think you shall detect the case of dual instantiation of intel_iommu
and virtio-iommu. Maybe pc_hotplug_allowed() can be used for that. Note
that both devices can be refered to in either order.
>  
>  void pc_guest_info_init(PCMachineState *pcms)
> @@ -1376,6 +1381,14 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
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
> @@ -1393,6 +1406,11 @@ static void pc_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>          PCMachineState *pcms = PC_MACHINE(hotplug_dev);
>          PCIDevice *pdev = PCI_DEVICE(dev);
>  
> +        if (pcms->virtio_iommu) {
> +            error_setg(errp,
> +                       "QEMU does not support multiple vIOMMUs for x86 yet.");
> +            return;
> +        }
>          pcms->virtio_iommu = true;
>          pcms->virtio_iommu_bdf = pci_get_bdf(pdev);
>      }
> @@ -1436,7 +1454,8 @@ static HotplugHandler *pc_get_hotplug_handler(MachineState *machine,
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
>          object_dynamic_cast(OBJECT(dev), TYPE_CPU) ||
>          object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
> -        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
> +        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI) ||
> +        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
>          return HOTPLUG_HANDLER(machine);
>      }
>  
Thanks

Eric

