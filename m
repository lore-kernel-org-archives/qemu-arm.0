Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp1939910njc;
        Mon, 14 Apr 2025 04:50:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWqvXpxOr47uGfj5+oDNoqXaKalwdsd2lv6bNh8Op08nVBiWXv00V05+Kt0gi7pL80vl+3bH91yiviT1g==@linaro.org
X-Google-Smtp-Source: AGHT+IGaCJEDzY6+soNx6vd2ET4wk+JOAAt5nJKYqQzxw9ViYLekxPw9sxDDiMVh2E5Cr1WdC78z
X-Received: by 2002:a05:620a:46ab:b0:7c5:fa85:1ac3 with SMTP id af79cd13be357-7c7af11f96emr2001976385a.45.1744631444163;
        Mon, 14 Apr 2025 04:50:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744631444; cv=none;
        d=google.com; s=arc-20240605;
        b=CkopJ3H9zrYBs8dPEhMBf4moAcbYTY27m97BnrnZtzPGdZyk8sg5z/MRGttNMb9y/U
         i9CHQQuTkbLPjNsirgVTM301HteoMt5DJLXARcTkvuTiCI89T55UPboI1ZmDTPA7wqrY
         fhEA9TvctsUEFtohlcS3AZ9EhTKoGKZAJkA/054sEXZsBtl0oYo8zCixfNFdvkE6sexY
         oyqDYsC83l8wQq8/ZTAmYdsv9wuV5tas5CAxsejO3As5kmr2w+e4ZpyqcUbghUenoHTB
         T3abdbECS3BbPabJCb0u3NUqT6rS7ToTKlrU2H9X2dFsYQ+ONEW6ACRkTS3VbveG+WcC
         8FCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=oCsESHO6e6qFivYw5u4FH/v5jTopojleXNCSOWYadJY=;
        fh=Dla1LuAVner4cobVmoFpa3qbpT7YFy/vzk4kDMS0njE=;
        b=ej9lir/MwsVKLV6u9NJFOm+COlZLnfKZXIznaxhe+Ixy3akMxFPNnOuPZ0zpR+mkab
         xJr3ZodBdU65jhv1yF+1Vo/vVtjLDFi+tSvrqpJ/W3b1YBDdcF7qPW0LT1dxAFtrPlkt
         ePDKXcWSfqSRp4GCtXjJbWSljBZ7ibAT1ToMQYSkE4INuj1UTD2izzIltCzVtr3OXHf1
         LKQ/FBdlEQ87cjKvaZFzt6/yTo7P5Y/hPN6nLeOXB4NWyKZoA1B1dv+01bVjcyVHKPxv
         Y560FNKNBPhsbek0EXGJKc3eH4OvcRlztfphF1/sKEDMxbSj36VlqShrzb1Z2wwrlevd
         jd5w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="bo7/iEXM";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c7a894c85csi793945885a.53.2025.04.14.04.50.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Apr 2025 04:50:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="bo7/iEXM";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u4IKe-0000b1-FC; Mon, 14 Apr 2025 07:50:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1u4IK7-0000Sk-Ck
 for qemu-arm@nongnu.org; Mon, 14 Apr 2025 07:50:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1u4IJx-0006wC-Kt
 for qemu-arm@nongnu.org; Mon, 14 Apr 2025 07:49:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744631381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=oCsESHO6e6qFivYw5u4FH/v5jTopojleXNCSOWYadJY=;
 b=bo7/iEXMTNSgmg/LR6jpnq2+/fxSLps3eRLWgYYlyzLFlJKAGAPXWCBNJ8thyktMT5XAtD
 DwB5eYFPh/1Yq2rt47uXP7zXid8Odu/xJaPodj8CLhcp1Hmsd1Ow/loHXCmEafbe0fuhSH
 rfZIP1Dm4nJrS6usg7sd32rRBid65YY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-ZbDeyeXsMmGFBUK7ZOUtEA-1; Mon, 14 Apr 2025 07:49:39 -0400
X-MC-Unique: ZbDeyeXsMmGFBUK7ZOUtEA-1
X-Mimecast-MFC-AGG-ID: ZbDeyeXsMmGFBUK7ZOUtEA_1744631379
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43d733063cdso35268125e9.0
 for <qemu-arm@nongnu.org>; Mon, 14 Apr 2025 04:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744631379; x=1745236179;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oCsESHO6e6qFivYw5u4FH/v5jTopojleXNCSOWYadJY=;
 b=lcD8dVxuanDvpbpTSns3PXuC5euV05M8+m4xOfgOqplXHVlFxKSgT4XmbYK+bAhoRh
 DekTkTspe1U7z3IYoG6lklLqPAeUQsN4EA7Z4W/1ZzS+AWqI9EoeRfK9XWJEx30WXyO1
 H2nQxjifMSUOqeh9Z80tX+Hlttxj8cbeF+NOSIA59Hj35/7Xcan+bqUNYCFu9+VnR8nZ
 UR0d9Br0WwTo320nfKfvYwdWDKWYe1dFGZ49adTILYZFcS2RrNA105YdvBefNQzErvbt
 i79NX8dc9EMHeEIMz2k1AqIoS9DmGbtUjrXyTeRpZnIP6u1cTT9hafTC6/WQN253VqZS
 P+hg==
X-Gm-Message-State: AOJu0YyZNLiDOoahMLvyZut/+Uyx8ZTiGpeDiVE3Ee0JeseAj+TGd/q6
 XrdSCb/+8dMGiK8lLM8BMA9sx47Z+mwifirgEG16jys/d1U+ZOfzF1AALb7SV5dc9BNonrIdXJ7
 HCEZUAtHPnmdwBcMdADCsGcSI3WOoIqNzJWrKGBTZQnR3woDx7w==
X-Gm-Gg: ASbGncsouMIr9V6LgO6uXNj/5TS7/InOGdh9c/G/KIbvw9kCEhtIpe31b4/m/t7YDdo
 XJceP7q7mtFjyuTQ+LBIr12OIIbQ+JDTelWgkfVS1Js6ek/imbZabTk70pZQaXdijlBiXhh5mIM
 TEDbw4fcCWljVncuL/b1Hy4dusv0D3iN/hKr430V3H3+ec8dravhBArRh3QOCxwE2NQzn9I+LEq
 Ag9HkyXlIkJ70Wb0Q7h7G4lwupsO4fjATQK/5aMAj7qP0jN877jPHVsxTl8PUZ2EcwwFUX3yXCv
 lZCCT0JvgNjW1oCoBtzl10+VBGDK5kN34HIP
X-Received: by 2002:a05:600c:500d:b0:43c:ed61:2c26 with SMTP id
 5b1f17b1804b1-43f3a959599mr122891285e9.17.1744631378722; 
 Mon, 14 Apr 2025 04:49:38 -0700 (PDT)
X-Received: by 2002:a05:600c:500d:b0:43c:ed61:2c26 with SMTP id
 5b1f17b1804b1-43f3a959599mr122890925e9.17.1744631378372; 
 Mon, 14 Apr 2025 04:49:38 -0700 (PDT)
Received: from [10.33.192.219] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae979663sm11038935f8f.51.2025.04.14.04.49.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 04:49:37 -0700 (PDT)
Message-ID: <c988da8c-67ef-461e-ae54-ec2c05570a4f@redhat.com>
Date: Mon, 14 Apr 2025 13:49:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw: add compat machines for 10.1
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org
References: <20250414094543.221241-1-cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250414094543.221241-1-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0FaWp03KYQ_F8L9-Co0OMPY9T3aJBtMHnZOMenDzhuo_1744631379
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: rnlPHv8NqU1a

On 14/04/2025 11.45, Cornelia Huck wrote:
> Add 10.1 machine types for arm/i440fx/m68k/q35/s390x/spapr.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   hw/arm/virt.c              |  9 ++++++++-
>   hw/core/machine.c          |  3 +++
>   hw/i386/pc.c               |  3 +++
>   hw/i386/pc_piix.c          | 13 +++++++++++--
>   hw/i386/pc_q35.c           | 13 +++++++++++--
>   hw/m68k/virt.c             |  9 ++++++++-
>   hw/ppc/spapr.c             | 15 +++++++++++++--
>   hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>   include/hw/boards.h        |  3 +++
>   include/hw/i386/pc.h       |  3 +++
>   10 files changed, 76 insertions(+), 9 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

