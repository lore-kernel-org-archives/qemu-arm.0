Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp1229509ejl;
        Thu, 16 May 2024 02:32:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXdtjKRuajFP27ZhXc7fnf2LPY553yk3s69FolRZK5GeMewzT62TAFFfwtdhw1oJetob6wr00AiFMEmxQcyrwl7i8F1j0AK
X-Google-Smtp-Source: AGHT+IGTrArDeRRPEUrj3gNSFAeGhM0kmHv+/Vr2jKuHl4hgAL207G/tZN3eZNRednr2UjOt0Ysn
X-Received: by 2002:a05:6214:5781:b0:69f:ebc3:7d0d with SMTP id 6a1803df08f44-6a168248ed1mr231748976d6.60.1715851931291;
        Thu, 16 May 2024 02:32:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715851931; cv=none;
        d=google.com; s=arc-20160816;
        b=TyBOFuc+HU5UjpWm6a4e8eo6pnfjYIGpEAvTaptEpB56uSlTuKW6mMD5aRIvlWs7iJ
         i0Gsz/JbRlh/HfD55GmAVT4yygKJs62lif4XLOQjnqNNe111noPc6hGGnjCaxTQVnAn3
         tqK4jAA0UcrHt1aGtUK0buykkyEtSdK2Prmu/h2wcfoPR/jxvK+I9nZLfZIS+Q48Sbl5
         5MwPr5IoGslPMItwRRn0ERot2R6lEnuDKGyIGCM02ffrbdmwkhHRWVLe66jSsvX5zgX4
         ju6A2nOtuNWC5rMovFMTAnYTAA4KXXJA/35A+kRJ6PnmhTucxkorkcFFIeVeeIGhQbqK
         eCnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=eWK+EMA+aadS2B/U+NeoGDTbw0mIJ5zzKRQ9K8F6M0Y=;
        fh=bSQ3I30Y9OjjW/QZiVO1Y3BNvYOyulurf4oIFjvkRaY=;
        b=qUXyV0Ka22GtLUJ9vTTFuHsjiA/tGSWeqklW74jM4uW7KyGMW1POUz+j5/h7hdRojD
         eHXc2c2W9ltvpPe3k69dFx43qDdyVRB8nr6nmfQ/k0/izjtICK8PToupWLSFBfHsM/YP
         XpUKuUfq8ebLOIkSuDZfFs0L5jmz7pvgVMycAUYimBgWD731MKtDTSE22/J4lwgfvfN3
         pE5BTNISoIVoGbZ8eOrSM3YDN88oQ3tqapY92x/CItx0/n6/DbA8PQiKSDSecIqCuFlc
         bTgfvKjFOg070/2FBF0awOmi70RH/sFETVklwX40guaZ8Dn4XUHBUr6curRW8l3v1qc5
         /+kQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6a15f29bff3si13563256d6.194.2024.05.16.02.32.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 May 2024 02:32:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s7XSb-0004nl-Fj; Thu, 16 May 2024 05:31:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1s7XSZ-0004mg-Mn; Thu, 16 May 2024 05:31:35 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1s7XSX-0003jX-Vu; Thu, 16 May 2024 05:31:35 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 31DAA41572;
 Thu, 16 May 2024 11:31:23 +0200 (CEST)
Message-ID: <6ef80da5-6dac-4717-b683-b4428a3a9835@proxmox.com>
Date: Thu, 16 May 2024 11:31:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Fix "virtio-gpu: fix scanout migration post-load"
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Yanan Wang <wangyanan55@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Xu <peterx@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20240516084022.1398919-1-marcandre.lureau@redhat.com>
Content-Language: en-US
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <20240516084022.1398919-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
X-TUID: swBg8hFLhjpa

Am 16.05.24 um 10:40 schrieb marcandre.lureau@redhat.com:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Hi,
> 
> The aforementioned patch breaks virtio-gpu device migrations for versions
> pre-9.0/9.0, both forwards and backwards. Versioning of `VMS_STRUCT` is more
> complex than it may initially appear, as evidenced in the problematic commit
> dfcf74fa68c ("virtio-gpu: fix scanout migration post-load").
> 
> v2:
>  - use a manual version field test (instead of the more complex struct variant)
> 
> v3:
>  - introduce machine_check_version()
>  - drop the VMSD version, and use machine version field test
> 
> v4:
>  - drop machine_check_version() approach
>  - property renamed to x-scanout-vmstate-version
> 
> Marc-André Lureau (3):
>   migration: add "exists" info to load-state-field trace
>   migration: fix a typo
>   virtio-gpu: fix v2 migration
> 
>  include/hw/virtio/virtio-gpu.h |  1 +
>  hw/core/machine.c              |  1 +
>  hw/display/virtio-gpu.c        | 24 ++++++++++++++++--------
>  migration/vmstate.c            |  7 ++++---
>  migration/trace-events         |  2 +-
>  5 files changed, 23 insertions(+), 12 deletions(-)
> 

Reviewed-by: Fiona Ebner <f.ebner@proxmox.com>
Tested-by: Fiona Ebner <f.ebner@proxmox.com>

Tested the same things as for v1/v2, with an Ubuntu 23.10 VM:

Machine type pc-i440fx-8.2:
1. create snapshot with 8.2, load with patched 9.0
2. create snapshot with patched 9.0, load with patched 9.0 and with 8.2

Machine type pc-i440fx-9.0:
1. create snapshot with patched 9.0, load with patched 9.0

No crashes/failures and didn't notice any other issues 🙂

Best Regards,
Fiona

