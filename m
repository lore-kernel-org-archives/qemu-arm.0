Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp2610814ejt;
        Wed, 29 Nov 2023 05:12:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgVP13U4qGZc/ZuQNX0ptkhGLuwopBFvj2gDFiW2arHF2EaqQm/PZT7JC67ImL482bS79H
X-Received: by 2002:a81:6285:0:b0:5c9:12ec:5203 with SMTP id w127-20020a816285000000b005c912ec5203mr17057810ywb.32.1701263527192;
        Wed, 29 Nov 2023 05:12:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701263527; cv=none;
        d=google.com; s=arc-20160816;
        b=CeoTdBK01p9TlJvL+rqSZ8uihDYeBRgTvR0x8fAs4tiHKV2bbGkIyk34LezHUsQ7Pz
         shldHJYHrinLN8NdloQ5M71QurvFldsu1nGDrB2n8R+8QXQCYId3kb50dJ/WUzXkHBJ8
         AFBXeoTlP9EZnqdem2M5I8aYK91jujTYjqywO/tDIb66XXAu7jILc+lHyOtZ24LWSXpL
         zx3Xay+KHLR/q92L2ORwtFszit/M/T7cGkzaPlndH7CtUqavWUY5479xeJhT2yPWKQvR
         wvO/OC+jkFsOSqtN1y25YflqDY1DljKHMMMLzLbObBLj9rfozlovtaiywCF5td6qkJkI
         1T1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id;
        bh=53s/Wc+SUdhYU09dQ4ZePuTObTa5zVA+6B3oR4F1aHo=;
        fh=PIt7Ga1iXhT86ZM9MPlWRq+/+rYNkZ+jZod3xrWh7fg=;
        b=Qa9XjSGh2v8Mk/OJLerEwNWs0BqbacSkmtUyfqKSLzvweNLD0iWX8IoPkThgGyp7aI
         w83eKmj6tDbdEvGMLGtSkSTpyePeBgPDBtHk5X0H2s2Gwy9Qtj8kWMSaewzvwdczDgfm
         bCWGIkTqXt0opVdzfSy/7RGLDr0Xhg1CLnpnGG9LZdEM0T9XUe4/LrgISrW12Xro5hJb
         /RtmVuV/uqc7LAbnZNk/lm4l2kEkN7JF/EFcx1ckDIOlB03jcRHIPuSr1P6MF2OTqn2R
         w+npRICZnnbXGVNJ7PQjWQQnxJKFZeVtx0SHf3DpWbYe7wJhSFiWkmnG8ekoZb3InMpC
         HK4g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y21-20020a67e8d5000000b00462e283f49asi103541vsn.685.2023.11.29.05.12.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Nov 2023 05:12:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r8KM8-0003LO-Ik; Wed, 29 Nov 2023 08:11:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1r8KM6-0003Kl-1h; Wed, 29 Nov 2023 08:11:55 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1r8KM4-0002Yy-3D; Wed, 29 Nov 2023 08:11:53 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id AF3B837671;
 Wed, 29 Nov 2023 16:12:11 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id C244D386E3;
 Wed, 29 Nov 2023 16:11:47 +0300 (MSK)
Message-ID: <eb792ad0-7199-4dde-95db-4b8eb7731c2e@tls.msk.ru>
Date: Wed, 29 Nov 2023 16:11:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-8.2? 2/6] hw/virtio: Free
 VirtIOIOMMUPCI::vdev.reserved_regions[] on finalize()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eric Auger <eric.auger@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-stable@nongnu.org
References: <20231121174051.63038-1-philmd@linaro.org>
 <20231121174051.63038-3-philmd@linaro.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Autocrypt: addr=mjt@tls.msk.ru; keydata=
 xsBLBETIiwkBCADh3cFB56BQYPjtMZCfK6PSLR8lw8EB20rsrPeJtd91IoNZlnCjSoxd9Th1
 bLUR8YlpRJ2rjc6O1Bc04VghqUOHgS/tYt8vLjcGWixzdhSLJgPDK3QQZPAvBjMbCt1B6euC
 WuD87Pv5Udlpnzf4aMwxkgfTusx+ynae/o+T5r7tXD+isccbC3SiGhmAPxFyY3zGcFk4+Rxc
 0tP8YY2FWE/baHu+lBDTUN79efWAkHhex1XzVZsV7ZD16rzDbXFK5m6ApvGJWlr5YDEEydTF
 WwmvwBfr4OINVxzEG/ujNiG4fpMf2NsnFGyB9aSbFjXZevB4qWkduYYW+xpK1EryszHtAAYp
 zSBNaWNoYWVsIFRva2FyZXYgPG1qdEB0bHMubXNrLnJ1PsLAlgQTAQoAQAIbAwYLCQgHAwIE
 FQIIAwQWAgMBAh4BAheAAhkBFiEEbuGV0Yhuj/uBDUMkRXzgoIBEZcUFAmBbcjwFCS5e6jMA
 CgkQRXzgoIBEZcUTIQgA1hPsOF82pXxbcJXBMc4zB9OQu4AlnZvERoGyw7I2222QzaN3RFuj
 Fia//mapXzpIQNF08l/AA6cx+CKPeGnXwyZfF9fLa4RfifmdNKME8C00XlqnoJDZBGzq8yMy
 LAKDxl9OQWFcDwDxV+irg5U3fbtNVhvV0kLbS2TyQ0aU5w60ERS2NcyDWplOo7AOzZWChcA4
 UFf78oVdZdCW8YDtU0uQFhA9moNnrePy1HSFqduxnlFHEI+fDj/TiOm2ci48b8SBBJOIJFjl
 SBgH8+SfT9ZqkzhN9vh3YJ49831NwASVm0x1rDHcIwWD32VFZViZ3NjehogRNH9br0PSUYOC
 3s7ATQRX2BjLAQgAnak3m0imYOkv2tO/olULFa686tlwuvl5kL0NWCdGQeXv2uMxy36szcrh
 K1uYhpiQv4r2qNd8BJtYlnYIK16N8GBdkplaDIHcBMbU4t+6bQzEIJIaWoq1hzakmHHngE2a
 pNMnUf/01GFvCRPlv3imkujE/5ILbagjtdyJaHF0wGOSlTnNT4W8j+zPJ/XK0I5EVQwtbmoc
 GY62LKxxz2pID6sPZV4zQVY4JdUQaFvOz1emnBxakkt0cq3Qnnqso1tjiy7vyH9CAwPR/48W
 fpK6dew4Fk+STYtBeixOTfSUS8qRS/wfpUeNa5RnEdTtFQ9IcjpQ/nPrvJJsu9FqwlpjMwAR
 AQABwsBlBBgBCAAPBQJX2BjLAhsMBQkSzAMAAAoJEEV84KCARGXFUKcH/jqKETECkbyPktdP
 cWVqw2ZIsmGxMkIdnZTbPwhORseGXMHadQODayhU9GWfCDdSPkWDWzMamD+qStfl9MhlVT60
 HTbo6wu1W/ogUS70qQPTY9IfsvAj6f8TlSlK0eLMa3s2UxL2oe5FkNs2CnVeRlr4Yqvp/ZQV
 6LXtew4GPRrmplUT/Cre9QIUqR4pxYCQaMoOXQQw3Y0csBwoDYUQujn3slbDJRIweHoppBzT
 rM6ZG5ldWQN3n3d71pVuv80guylX8+TSB8Mvkqwb5I36/NAFKl0CbGbTuQli7SmNiTAKilXc
 Y5Uh9PIrmixt0JrmGVRzke6+11mTjVlio/J5dCM=
In-Reply-To: <20231121174051.63038-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: nieEvkKBKvUR

21.11.2023 20:40, Philippe Mathieu-Daudé пишет:
> Commit 0be6bfac62 ("qdev: Implement variable length array properties")
> added the DEFINE_PROP_ARRAY() macro with the following comment:
> 
>    * It is the responsibility of the device deinit code to free the
>    * @_arrayfield memory.
> 
> Commit 8077b8e549 added:
> 
>    DEFINE_PROP_ARRAY("reserved-regions", VirtIOIOMMUPCI,
>                      vdev.nb_reserved_regions, vdev.reserved_regions,
>                      qdev_prop_reserved_region, ReservedRegion),
> 
> but forgot to free the 'vdev.reserved_regions' array. Do it in the
> instance_finalize() handler.

It is interesting that the actual code frees prop_resv_regions, not
reserved_regions as the Subject says.  This is because of commit
v8.1.0-2552-g41cc70cdf5, ""virtio-iommu: Rename reserved_regions
into prop_resv_regions".

:)

/mjt

> Cc: qemu-stable@nongnu.org
> Fixes: 8077b8e549 ("virtio-iommu-pci: Add array of Interval properties") # v5.1.0+
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/virtio/virtio-iommu-pci.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
> index 9459fbf6ed..cbdfe4c591 100644
> --- a/hw/virtio/virtio-iommu-pci.c
> +++ b/hw/virtio/virtio-iommu-pci.c
> @@ -95,10 +95,18 @@ static void virtio_iommu_pci_instance_init(Object *obj)
>                                   TYPE_VIRTIO_IOMMU);
>   }
>   
> +static void virtio_iommu_pci_instance_finalize(Object *obj)
> +{
> +    VirtIOIOMMUPCI *dev = VIRTIO_IOMMU_PCI(obj);
> +
> +    g_free(dev->vdev.prop_resv_regions);
> +}
> +
>   static const VirtioPCIDeviceTypeInfo virtio_iommu_pci_info = {
>       .generic_name  = TYPE_VIRTIO_IOMMU_PCI,
>       .instance_size = sizeof(VirtIOIOMMUPCI),
>       .instance_init = virtio_iommu_pci_instance_init,
> +    .instance_finalize = virtio_iommu_pci_instance_finalize,
>       .class_init    = virtio_iommu_pci_class_init,
>   };
>   

