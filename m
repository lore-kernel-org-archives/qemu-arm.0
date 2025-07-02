Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3698240dye;
        Wed, 2 Jul 2025 02:58:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUmL1ADagr32TgrdcBi03TLfs4JKjEiIUKfDU5GGUclaNTe5fVSuN+Hi2er44DbdDjXaQYCFdFcxcS6oQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGyxqI0ddb3L1doaiU3/upWOKkU43EYA/492HohuLgmhJFy1XfjJFz8M3o+7uJlvyAkxwL6
X-Received: by 2002:a05:622a:58c8:b0:494:a436:5af6 with SMTP id d75a77b69052e-4a976a970d4mr41827901cf.47.1751450327443;
        Wed, 02 Jul 2025 02:58:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751450327; cv=none;
        d=google.com; s=arc-20240605;
        b=C6vWwpZW8TByZL9kw3SJ9AknxLEaRv+N8G+srFBusj6MgSLoez9Q1T0hyyhCbSlhNJ
         MrU+OoeUMBttgQujiFInBsGTbDfW822MQfMoFF3Dn/wBF2bb+o7Uc2DoXRjCJWP4bYDC
         pNqGm0n5K5II7I+Dav6xvz0cIUkFNGqMYjnwDtV1fwzw/XllRAiobFEVwZmW8n4xxGPS
         3+fbvJuUQlBIp5viykaXwQaiuaBuHl9oSVfVnaNp/nPljxH2evctnE4JisR7bpbKT7AS
         3CbDub3KJnxYd0wT4kos6PgxPqh6ReWOOQ6mf/HtJM0jN1VZpuxv8qWnkPSbdPmApZxr
         fLRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=jlIdRH/kisgVtNYcO4KLq+w4r7Avn7pCszxJlcyTCcY=;
        fh=UcPpGXiNzyzSt62MfcRZTqzkwbJ893BJk00akjHB73A=;
        b=Vibld06ST6HigMbdfwbSJ5gmb9v1M/b02hkvHuGgRhqEl3DnpqMec5zZOEmUoxeVyN
         TYPBbLK6mCHKOiBLANA4WkB1QcLXGN6RQNg7L9dZHXG62aDEM1Fe6OK32zafKUI6NEQC
         DhbBtb3U+DHz8oPQ1UcJ0BrQo6p597VQnkDNl0DW825uicpaIlDmrgKSVqzxRaP8y76/
         QuBUql0tgZ9rugLBrC4uJSTA9y0lIxXc3uvn8aHlo+EY2jsSRwobRvs7FCMTpX3nzB4r
         /TFaB6IL0oT1Jx9x9lxwbbyDdrWrQiDZtxO69O8epxgwqlXdGZyyw7JSZEgOaJvfjUIT
         sddg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Hcv4Q6st;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a80ea93903si83567341cf.38.2025.07.02.02.58.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 02:58:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Hcv4Q6st;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWuEN-0004DA-8Y; Wed, 02 Jul 2025 05:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uWuEL-0004Cm-44
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 05:58:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uWuEF-0000WZ-Do
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 05:58:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751450289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jlIdRH/kisgVtNYcO4KLq+w4r7Avn7pCszxJlcyTCcY=;
 b=Hcv4Q6staRZvyS4qE+lI/ypalQ/7GYhtCZ1YHNPS+cHqbEAQ7HN+FTnF6qRmoc46I1zKzD
 l5U9XtVcyJy14jBXPrGe5J1xCnJRPXZsB7aOMWbHImmJzjLIWWhjPhEBD3WLSA/nRxKTQ5
 UI5sUUejjTRfihmWmzFS/BxfF68zLX4=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-wC_tONnyMpep3Ef2qHuHqQ-1; Wed, 02 Jul 2025 05:58:08 -0400
X-MC-Unique: wC_tONnyMpep3Ef2qHuHqQ-1
X-Mimecast-MFC-AGG-ID: wC_tONnyMpep3Ef2qHuHqQ_1751450288
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-237f8d64263so56797145ad.1
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 02:58:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751450287; x=1752055087;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jlIdRH/kisgVtNYcO4KLq+w4r7Avn7pCszxJlcyTCcY=;
 b=riDikhoGs34EVbh36N3oHC6oKxOt///HQtN4RvcgppHjiL7OZg4iiwKXOhZw3FqtoT
 CPvoMEMAXfaC0a6xq6y4sv+17+Hy2xkA+X4ikvtmokCWn4jM7ADk0YPTJxZ2v7Ls3PKH
 0HiEM9x6A+B5T63PB0JlDpCU/y0qTUaK7MhKMMsoiiQ5ULMJ7dWIs0Ewv+qrh3tUjqEg
 VH39ewYayj3I41VNrl+CvWLlSehdYlL0VBU9RJ8o8KP9i5FuWoZchN8vNP+H41hI/jEZ
 HyzDnULeovAjcKW0KSELHNfx4h+46azFf0HzerVyOuFC+rbYxGLhyLNcdaSFBDXwHls5
 UIfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4CojglShmAdzuH7VMDKVMT7oKbq/+kOBmNaJTLlTiocHk71SFlKztlqGT4OvDR4NOeUNUBsu9Hg==@nongnu.org
X-Gm-Message-State: AOJu0YzYjLY8Qgblaxck9wdiCI4Ts8p82Bt1102EjYYK2HOmtrhIdcTZ
 ct7MaWpBLsIHSSktO7rWyCh7qnRnyUPVGADNFdCCxWOhmz+yIiWhdkYxStE24N898L97fNVN1BP
 Yefmeo2YyCpOA+rof7PT+4nVIEi3SKkjZa8+U2okoy5AWtwneI2qvLA==
X-Gm-Gg: ASbGncsDP3EIPfZjSwgXJYj7VLpfKy2JO36oZMdqA971Qk5K5MEh/sxKBX37Ox0lPaA
 5nO/2REp7W0StmH9XowE2geskKDYjwpaJQue/fJlMHuHSbyivhwMMf8WCQ/0wkBOXII9noPLUfs
 Kj+t73KofORVEzB1uXJ/3nPiwiRgsxff9Q54X6LPw1brFpgMRB/L3IOheF08ujkmWn/QASN4L30
 tPLiLSUY1Eo/v+en6WyB7Qm2Mbz57ATPnf/h13P4zbs9vMA7NOicqHcMvwpixQ3LRNWzvufDPnT
 jplR6y1CiZs+dABZomxFXHeqKg==
X-Received: by 2002:a17:903:1aee:b0:234:cf24:3be8 with SMTP id
 d9443c01a7336-23c6e4ffe2amr38746755ad.28.1751450287636; 
 Wed, 02 Jul 2025 02:58:07 -0700 (PDT)
X-Received: by 2002:a17:903:1aee:b0:234:cf24:3be8 with SMTP id
 d9443c01a7336-23c6e4ffe2amr38746495ad.28.1751450287304; 
 Wed, 02 Jul 2025 02:58:07 -0700 (PDT)
Received: from [10.72.116.77] ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb2f21e0sm126690275ad.74.2025.07.02.02.57.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 02:58:06 -0700 (PDT)
Message-ID: <33f10216-4d04-456e-95d6-23cf5469922c@redhat.com>
Date: Wed, 2 Jul 2025 17:57:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] hw/i386: Add the ramfb romfile compatibility
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Eric Auger <eauger@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
References: <20250702085616.2172722-1-shahuang@redhat.com>
 <20250702085616.2172722-3-shahuang@redhat.com>
 <dec256c0-d0a5-49d7-b5ce-a025eaf27f8c@redhat.com>
 <36d469be-d9fd-48c9-8106-2db885e6fe39@redhat.com>
 <etie67k64lfoaaqhuym5ayse6ejbwmdqrbm6n3ja5raqqsuupm@j5tev5gtzsqx>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <etie67k64lfoaaqhuym5ayse6ejbwmdqrbm6n3ja5raqqsuupm@j5tev5gtzsqx>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GmipYAmqC4eqmnXD9jdqVJ9vXWlwtwTsA5eCemt0yfA_1751450288
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=shahuang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: IOrRO/+e7u7y

Hi Gerd,

On 7/2/25 5:52 PM, Gerd Hoffmann wrote:
> On Wed, Jul 02, 2025 at 05:28:01PM +0800, Shaoqin Huang wrote:
>> Hi Eric,
>>
>> On 7/2/25 5:08 PM, Eric Auger wrote:
>>>
>>>
>>> On 7/2/25 10:56 AM, Shaoqin Huang wrote:
>>>> Set the "use-legacy-x86-rom" property to false by default, and only set
>>>> it to true on x86 since only x86 will need it.
>>>>
>>>> At the same time, set the "use-legacy-x86-rom" property to true on those
>>>> historical versioned machine types in order to avoid the memory layout
>>>> being changed.
>>>>
>>>> Signed-off-by: Shaoqin Huang <shahuang@redhat.com>
>>>> ---
>>>>    hw/core/machine.c             |  2 ++
>>>>    hw/display/ramfb-standalone.c |  2 +-
>>>>    hw/i386/pc_piix.c             | 10 ++++++++++
>>>>    hw/i386/pc_q35.c              |  3 +++
>>> If I understood correctly, Gerd said we needed to set the prop to "true"
>>> on microvm too? I don't see that change.
>>
>> Yes, I try to do that. But I didn't see there are any machine type in the
>> microvm like q35. I'm confuse about it, How should I do that?
> 
> Just add them to microvm_properties[]

Thanks a lot. I currently know how to do that.

Thanks,
Shaoqin

> 
> take care,
>    Gerd
> 

-- 
Shaoqin

