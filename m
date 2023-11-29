Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp2602861ejt;
        Wed, 29 Nov 2023 05:01:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEG8osXsjMqQN1BbtoZmZyuyrBsOZfXNw4NbI0FfrrYxIQhBhj3G1FXJnH9UJUv0+i605aA
X-Received: by 2002:a25:a306:0:b0:d99:d1b8:672f with SMTP id d6-20020a25a306000000b00d99d1b8672fmr16481771ybi.33.1701262914161;
        Wed, 29 Nov 2023 05:01:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701262914; cv=none;
        d=google.com; s=arc-20160816;
        b=WqSjVK1ZeYb5gK+TGASvRjm34RQViEdJrjzs+P/P+1CDa7ZhRFrbgYkz7ULuXRm7Pz
         0N205TD2Cr+EeERRLVLaaDZYM/9cTYGwzc4LEFg7NTiFV1flFv+LZt8/ZiUIIGrz9J8t
         S6W275mZ/43I/GnY5YAq0fAuV2FFnwMGzEotppM5NZ8HOlU/OnIP8bh3MZF9lrM0kPE2
         r4fpx3Vg1UAKNuBjV6BLZMaDeQ42+1yMC1cS0g6PpIQazAyv7faKm2bhlcpeIIy7iw7f
         tMPLgwHJa+xHhvuIDDNRVzNPWNqbl1Bsw0YaY6ohC/DqfGQ32Nmah7BQ4U/Zw+R090sU
         Ni+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id;
        bh=VVsxHS68cBTOy0nY9DTR82aylZif2WTRC281nwYW/TY=;
        fh=ZKwtjLedALAsyUCvQ81dAS/TNXOv3tNCxPltbxlZpMM=;
        b=DF3M5eZeResreFSQcBk+oz0WbOdGPuhbYC8hoSC+vHI3XTv4lHmZ7lbTzd4EQzcjwQ
         nQYaHxSq4qnwvc3Hm1GR2xxshnX5Rdiz+1FJZAJxdxtK6kt/sxVxEueqockdP2lK/gx1
         Hieim+0wHBD4CI3FLaaYGIONuh4hUHJXErT0U/wamyCm4f0yYQo/3FyAn8aBsR4Jz7cg
         cDfZPrkJvbUIdWAZXoCpouUm56IDONUsn4is6U46CrbDiBOB8C7gkW0LUkjGg76kKkpW
         oqOFV97Ny/KTKIizlNViHrTYQDySi7/4CKfhlEqMQEv6tcuZv3SjsZxwwGYHXOgDC9b0
         65aA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c5-20020a25c005000000b00d851099a291si8687836ybf.197.2023.11.29.05.01.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Nov 2023 05:01:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r8KBc-0008KT-91; Wed, 29 Nov 2023 08:01:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1r8KBa-0008Jk-Tu; Wed, 29 Nov 2023 08:01:02 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1r8KBZ-0008Q4-31; Wed, 29 Nov 2023 08:01:02 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id ADBAD37663;
 Wed, 29 Nov 2023 16:01:19 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id C835F386C2;
 Wed, 29 Nov 2023 16:00:55 +0300 (MSK)
Message-ID: <107a2390-2af1-4b8b-8149-5c97fc1f2668@tls.msk.ru>
Date: Wed, 29 Nov 2023 16:00:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-8.2? 1/6] hw/virtio: Add
 VirtioPCIDeviceTypeInfo::instance_finalize field
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eric Auger <eric.auger@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20231121174051.63038-1-philmd@linaro.org>
 <20231121174051.63038-2-philmd@linaro.org>
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
In-Reply-To: <20231121174051.63038-2-philmd@linaro.org>
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
X-TUID: RCSd+jA7Vp77

21.11.2023 20:40, Philippe Mathieu-Daudé:
> The VirtioPCIDeviceTypeInfo structure, added in commit a4ee4c8baa
> ("virtio: Helper for registering virtio device types") got extended
> in commit 8ea90ee690 ("virtio: add class_size") with the @class_size
> field. Do similarly with the @instance_finalize field.

Since other patches in this series are Cc'ed to qemu-stable, and all
uses this new field, it smells like this patch should also be picked
up for -stable (doing that now).

/mjt

> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/virtio/virtio-pci.h | 1 +
>   hw/virtio/virtio-pci.c         | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/include/hw/virtio/virtio-pci.h b/include/hw/virtio/virtio-pci.h
> index 5a3f182f99..59d88018c1 100644
> --- a/include/hw/virtio/virtio-pci.h
> +++ b/include/hw/virtio/virtio-pci.h
> @@ -246,6 +246,7 @@ typedef struct VirtioPCIDeviceTypeInfo {
>       size_t instance_size;
>       size_t class_size;
>       void (*instance_init)(Object *obj);
> +    void (*instance_finalize)(Object *obj);
>       void (*class_init)(ObjectClass *klass, void *data);
>       InterfaceInfo *interfaces;
>   } VirtioPCIDeviceTypeInfo;
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 205dbf24fb..e433879542 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -2391,6 +2391,7 @@ void virtio_pci_types_register(const VirtioPCIDeviceTypeInfo *t)
>           .parent        = t->parent ? t->parent : TYPE_VIRTIO_PCI,
>           .instance_size = t->instance_size,
>           .instance_init = t->instance_init,
> +        .instance_finalize = t->instance_finalize,
>           .class_size    = t->class_size,
>           .abstract      = true,
>           .interfaces    = t->interfaces,

