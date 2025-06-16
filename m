Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1657110njc;
        Sun, 15 Jun 2025 22:54:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUNNV4ZWHxfiwsqqoDRKljZh6F4jKzEyMErzQ5xbat8vK3UHfcbYEnGmZ8l/L2e8hbGkeMjWsbm68be0w==@linaro.org
X-Google-Smtp-Source: AGHT+IFPWHHyPVeV1YfeP4u25rEpscDeZay6EJ8JU1qd9TRXaxKsZr7HXpAOEyy0C0wgMABjEPAd
X-Received: by 2002:ac8:59cc:0:b0:494:b148:930e with SMTP id d75a77b69052e-4a73c5d1580mr139616731cf.49.1750053283966;
        Sun, 15 Jun 2025 22:54:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750053283; cv=none;
        d=google.com; s=arc-20240605;
        b=dNbpU3/Yf+g5ZvezA7ZpE/vXNPndTuedzC6MP2PqwKmp+D4e/dZoNDR289lIbd8X8b
         5rNuzO0MbLu6wLguuVdNhbQ2UnSRGwYxgg/oA6Ad5qsSU8kOXjU/al4HdFPlCkuKZdF7
         yPffIqAUF9r1GUiAXdHm3Epigh1EvTiBOPAOQdvyvr8/+1fvOsKImrLCyxpImJKw57qA
         toMbgtk15jPOolLIbvSWBl9Sv62RXWbc64SN5Xj8YmGdkWIYijMPIIFYb4seVghBMC58
         eGEQLQk7mRODo19D6+ScQG7drhYJ3ItIq2S3lWPLS4bPJFbfGqJEMBSIvFa4Wn4dkbCD
         C3Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=kMfRDTTd+z5rrx4+j/hPhKppRd2jNHrTWcCtgthdrCg=;
        fh=1u2ZyF1Ze6UKS8kQZ9b6yElmvsXYwW3TEsYs55zKbss=;
        b=O1oP3nAn14Dg1+0Nj+wEObsTlLs6c7+V7pQXMA3uD6tvTKyMQqnJWgWFlcF9SN3Bni
         MCWC6e/NFG/LlR3qjcr0wgcszsDH/MPlC8+JiXlnYobCQFbcIqNuL+p4OnnIppzllBZZ
         mRGz3LuLO2stIk3vPjmxgLBiLQK4Tt1cJEPYTfUoDKZXsTc53gOIoROlsj3FXzWpBnWq
         F3QRAROB9fvurIxhM/5LoPdyr1dl+j8MDyFNVdLEngzg/JPnBTbBfFkgofRYlfk9ZdJK
         Q9Tcs9qEQ8+uVVNuUs8ECjaXQcz44LtNWqV9EcwFH/YhBxeh0CFyk4M0E7pAjRBh3zCH
         TiaQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YD9A2lNa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a47d9c9si91311811cf.192.2025.06.15.22.54.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Jun 2025 22:54:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YD9A2lNa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uR2nX-0004j9-Te; Mon, 16 Jun 2025 01:54:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uR2nI-0004hH-DE
 for qemu-arm@nongnu.org; Mon, 16 Jun 2025 01:54:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uR2nG-0000F7-Q4
 for qemu-arm@nongnu.org; Mon, 16 Jun 2025 01:54:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750053245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kMfRDTTd+z5rrx4+j/hPhKppRd2jNHrTWcCtgthdrCg=;
 b=YD9A2lNacBzROCpTE5X3Y87yLc7FXaXRBvVdXrEo6iLUkOX0/PvvEkiVHQH3aZKtgP/qlX
 cCI+TFw8yfz7c4070od1V8jV6kCRqZ8kV4LCp7Bg6j6sP/lB4xm1DSZ44lTJcic+Dx2qcm
 qC0iW6nY8rqL8mPy6TRQ5QawR8XZWAw=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-Yk3afi80MD6h494B_t1fPA-1; Mon, 16 Jun 2025 01:54:04 -0400
X-MC-Unique: Yk3afi80MD6h494B_t1fPA-1
X-Mimecast-MFC-AGG-ID: Yk3afi80MD6h494B_t1fPA_1750053243
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b2c38df7ed2so2956505a12.3
 for <qemu-arm@nongnu.org>; Sun, 15 Jun 2025 22:54:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750053243; x=1750658043;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kMfRDTTd+z5rrx4+j/hPhKppRd2jNHrTWcCtgthdrCg=;
 b=UGNQJ38ILBWmIqYnQ6YYqSBSZMxxyKqHhZLrNGgcHsuQ0Bc14y7Csk++hnfLCjXKmx
 0Fe7tM7SrcY64RfTpgp3bUwenBpFhbrZ5C2T4TWuBYzMnXF9sTFuQrreDGpw3H8KdgbJ
 ZYYdMgWcafSTpX6qOzLbWB8pWcFxNsvhKiQpbGc7Ab4W4b7eDNcq//MbQTqY70BgViy4
 gbR6tPHwMbVHQJI+M0WnMcF090AP/COwZxe1CPe+aF/rUY0vnTlu6WJSWkYVu6q7651j
 O6QdFCqpKZAlXtX4xCKKNOBdX6Fi7KJaBhTaw10UToUs6FY0Wx+3RATrohCUICblKBk+
 jrsQ==
X-Gm-Message-State: AOJu0YxvwZvJqnK86LlOjAj9ZftW+IJ6CTSb+uOMrQqaPLFRjLSNDLAM
 QqeqDBkX9S0XPjltluTxyM/vju4c9WaCN/CE5rxeJHNNJ70DD4nbpAnM9dvGjk7UiOg6FRnEP3D
 XhpMrPnK/wg3cjSmOufStngq+Npi8m0b65GkRUgVehY2lEyGpiCSdLw==
X-Gm-Gg: ASbGnctLO9OEGuPSFXV6keUxFQ05AK/YnLwMeUrt3NTp03Y/fWeInTO8ttzJBTaW04N
 B5JVq8QFVbZakR5EpbCX1tL1PlF2Oj7m/EynPdb2eWIWVv9SY+HhRNflanp3QbKF3Z8LOB3d3ua
 iErHSAgTkrW1LVdquybaaV0kUJQ2TkpdUe5brH9iI/SWY0Z3ImPfDpYIeE8GD6IHAY5Q04IDQVy
 eQCrF6KeKba5usbtwY6sssxPf+2ezcDVDDUyd828H81hQcA977pQKAreiO4IGKGMlu5aenRKxbX
 W8+v0TbJUCOXqod6TeNXDAgg3A==
X-Received: by 2002:a17:90b:5150:b0:312:1143:cf8c with SMTP id
 98e67ed59e1d1-313f1cafae6mr13251689a91.16.1750053243387; 
 Sun, 15 Jun 2025 22:54:03 -0700 (PDT)
X-Received: by 2002:a17:90b:5150:b0:312:1143:cf8c with SMTP id
 98e67ed59e1d1-313f1cafae6mr13251667a91.16.1750053243010; 
 Sun, 15 Jun 2025 22:54:03 -0700 (PDT)
Received: from [10.72.116.52] ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-313c1bcbb39sm7714920a91.8.2025.06.15.22.54.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Jun 2025 22:54:02 -0700 (PDT)
Message-ID: <2daf32b5-1279-444f-89fe-65633c1ec9f7@redhat.com>
Date: Mon, 16 Jun 2025 13:53:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] hw/arm: Add the romfile compatatibility
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Auger <eauger@redhat.com>, qemu-devel@nongnu.org
References: <20250609073408.2083831-1-shahuang@redhat.com>
 <20250609073408.2083831-3-shahuang@redhat.com>
 <CAFEAcA8eA2wX1oQeNJfNBYq1NhHgoemYJ-ybOYAgBq2-t9ZPzw@mail.gmail.com>
 <aEak8utPPkHepVfR@redhat.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <aEak8utPPkHepVfR@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MrC7U6PospExFnk3eVAqqVfRLC_doB4jk5S_aJt3E1o_1750053243
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=shahuang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: duey3pU1Ex5Z



On 6/9/25 5:10 PM, Daniel P. Berrangé wrote:
> On Mon, Jun 09, 2025 at 09:48:36AM +0100, Peter Maydell wrote:
>> On Mon, 9 Jun 2025 at 08:34, Shaoqin Huang <shahuang@redhat.com> wrote:
>>>
>>> On arm64, it doesn't use the vgabios-ramfb.bin, so set the property
>>> "use-legacy-x86-rom" to false, thus the ramfb won't load the
>>> vgabios-ramfb.bin.
>>>
>>> This can mitigate the problem that on release version the qemu can't
>>> find the vgabios-ramfb.bin if it use the ramfb.
>>>
>>> Signed-off-by: Shaoqin Huang <shahuang@redhat.com>
>>> ---
>>>   hw/arm/virt.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index a96452f17a..5f94f7a2ca 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -38,6 +38,7 @@
>>>   #include "hw/arm/primecell.h"
>>>   #include "hw/arm/virt.h"
>>>   #include "hw/block/flash.h"
>>> +#include "hw/vfio/pci.h"
>>>   #include "hw/vfio/vfio-calxeda-xgmac.h"
>>>   #include "hw/vfio/vfio-amd-xgbe.h"
>>>   #include "hw/display/ramfb.h"
>>> @@ -90,6 +91,8 @@
>>>
>>>   static GlobalProperty arm_virt_compat[] = {
>>>       { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "48" },
>>> +    { TYPE_RAMFB_DEVICE, "use-legacy-x86-rom", "false" },
>>> +    { TYPE_VFIO_PCI, "use-legacy-x86-rom", "false" },
>>
>> I think we should find a way to make this default to "false"
>> and only be set "true" for x86. Otherwise every single non-x86
>> board that ever adds support for ramfb and virtio will have
>> to add these two lines, which is a source of future bugs.
>> (Whereas if you forget to mark a new x86 board as needing
>> the legacy rom you'll find out about it pretty quickly.)
> 
> Yes, going forward we this to default to true only on x86.
> 
> For non-x86, historical versioned machine types will need
> likely it set to true, in order to avoid the memory layout
> being changed IIUC.

Ok, I will set this to be true by default only on x86.

Thanks,
Shaoqin

> 
> 
> With regards,
> Daniel

-- 
Shaoqin

