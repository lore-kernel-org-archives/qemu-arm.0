Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp3126619njc;
        Wed, 26 Mar 2025 00:10:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUuHk4y5EVGVRXHMZKeIcaeq9AYS6OxY/ax7p6TwAxzjZp+PdsaM/aUFJKDwqbqbBGKipXZg7DEhOkeNA==@linaro.org
X-Google-Smtp-Source: AGHT+IFxr1WCw51f831KTAIgHuTVf2liM4JEZor6BgVKV+jGYWEwdYBQCumfxzNk4EsujG54BGQx
X-Received: by 2002:a05:622a:4009:b0:476:8cad:72d9 with SMTP id d75a77b69052e-4771de3f530mr324895171cf.33.1742973016615;
        Wed, 26 Mar 2025 00:10:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742973016; cv=none;
        d=google.com; s=arc-20240605;
        b=VklDexI6cSG6CzTsw8Z1JuTglsj6KTb9U6PhWUUiX9J/U7Th+6iGIKt/RomomNWdW6
         P/MXgNslELrAtClOeunBGSGvc9OhPoLJ5FmA8Ney6fOGOMhIttlCsToH1pOUKwojy/oJ
         52yqhOeGGZWww/8qbZ1wllBkO2NjHJEi+FH2+tZ0ZkZ9B2VtPEpDrlyEZTISzLWxAyPH
         DLtt13sbtwHJjHzaVFqAvNZ0kK5mOm53j5ONHUxVWMPxgOjRiqWuqoEYN0HqZqGG2e3C
         VOZh98cbE0Nz2Ad3kWvLuvKX0BHXL68dmo9Sg9mUUIIsplWI+aVrDGLuX7hvQnfuoHCr
         UfLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=RTkQpEP0DtawZv/lKaYOBa3LIUrtWDiasRfk/WwVn0U=;
        fh=jHOBPU5n9n59ZBG2VHfw7xDxXVn1Zi5BXdBM0Ojyjvs=;
        b=fnFUi5Z/cAi9bxdJv9UOiLJ3AbhxvlOTr7vrxJrbfwIsL8YfhCRtedABtf+F/pWwr/
         QZu9LcYlW9dwaz5NEkzAqTfOjn4Tw/KhHBX8D/IY9lmU/8ACTT9r9yNjJAMuq5WBFyfK
         9QOdx8d85abwsy/+57UgN+2diIzQnEH7qvNV4TuCo6bp4ZNdtHFeWgaR0hQ0MItJrlSY
         m7Ba21VZ2mRBJtbODMHNfOD61bfWAsYOxTfVKq6qiruF3o9S3cu7hwGPTxatYpoPFH68
         0wv4EvEvNnY41dwY0YnJsGk0rYc+3QVP825LU21z0xhbpKUOpHBcULZQe63ap/RfvE+S
         aBuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="asHu/eBs";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4771d63c110si108006271cf.582.2025.03.26.00.10.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Mar 2025 00:10:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="asHu/eBs";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1txKtf-000503-LJ; Wed, 26 Mar 2025 03:09:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1txKtY-0004eD-GT
 for qemu-arm@nongnu.org; Wed, 26 Mar 2025 03:09:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1txKtV-0000G2-Vq
 for qemu-arm@nongnu.org; Wed, 26 Mar 2025 03:09:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742972985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=RTkQpEP0DtawZv/lKaYOBa3LIUrtWDiasRfk/WwVn0U=;
 b=asHu/eBsWpctdss9kCwEmYXdN/ERK91Vb6Xpf5oBYYwOHbUyDXqLsdsEuVHOVlE8JVy5Kp
 eHS91mTLBvPhv7pP2a8oZsiiWuKH76aCL0rL45t1SwfxJQbFTp4+OBbWL5hxD5jvBPiMjo
 pVtTNQs0XPkt9cCxNjTNFD36AV9YpHc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-pZ5OScjIPd68n6y-1Yfexw-1; Wed, 26 Mar 2025 03:09:43 -0400
X-MC-Unique: pZ5OScjIPd68n6y-1Yfexw-1
X-Mimecast-MFC-AGG-ID: pZ5OScjIPd68n6y-1Yfexw_1742972983
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-5e5dd82d541so6163289a12.2
 for <qemu-arm@nongnu.org>; Wed, 26 Mar 2025 00:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742972982; x=1743577782;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RTkQpEP0DtawZv/lKaYOBa3LIUrtWDiasRfk/WwVn0U=;
 b=YQUOcQo+qpR2Daawv5D0KOA8u6WywJ3FqLCYc6SJzMUGfxJIhPCvYTUDHGNj0m3w4l
 ycu1sgKnTRETGYjWtcYEx3r1fRu/lRqUszNw6nXWFAVH+DZg0eNCFX0NdkVo4SyMDQMo
 WuOgKRy0RtVmGigRv8ZK8x5XL5G8TdMid0Ql6Q3mTs8JG15zyYSrXvfCAsMrSpGVUmsB
 zzed3BQIGPhaJUViJ8/33nTzPxIHgklzJR44fAoCbZCdoqwjF+9chgjyAxIxazzdfgiD
 vvA4aCPw8CNDpSII7j3K/qw8dWPXGdgEoyzocYjC0FeUxa/li41PcSOQzMEb1obSvjkB
 IeJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkCNST0nuELZFcOd5/vyEtVguY7+usge7b9Bd681AUHDz9Uo0hGurX1vWzqakK/0GgXIuB2HoDIA==@nongnu.org
X-Gm-Message-State: AOJu0YwzyB5V88RAGZ2DnkhTdFRRr+Pj9Ol1Xcn53UmjeaFQt+naVAoY
 cVSz9dkg/gh1aCURpFo/3oHQK2KMFw2J8XCPwXCtHcpAXcLKxnzOkNNwmbH1uTE0rbVcG4EuQ02
 WZOhswqUgEXCzIb138ZCcOrTJmf4KIcn2piYI/5UOG7FQxoznwA==
X-Gm-Gg: ASbGncti8TlwaDQXPIuYSThITBwDuce8u8bRcrc5sLgp2K7V2MKWVTenR9MDdQiBkHX
 d3aPgAe5+6SwM71RS6Yn2N3HdkIyMynEkC4rL3Enc/o/0nyzUbBMdNSZ0Q5CZ4pSzBm2jel1ZM+
 g9AmunKmLpJxwiRpe4tz6QyLik7CIsuKZQubHjVRNJ/TzgkbLbBF/AkNk0GkoQgJVrC61KbgElH
 PuOAqFcU/ITi+Aj9vFOOUKQ9gUE7XEdDVNXVKxycgclKc90MFiiiMitE7ve6CPhng8MDJ7tl+Kr
 TToguGYp5fhhCmWVmAvWPD6Ki0s42x4tfXKz9i+/O6Ooe+k=
X-Received: by 2002:a17:907:7295:b0:ac6:dd5c:bdfc with SMTP id
 a640c23a62f3a-ac6dd5cec3cmr340150966b.50.1742972982548; 
 Wed, 26 Mar 2025 00:09:42 -0700 (PDT)
X-Received: by 2002:a17:907:7295:b0:ac6:dd5c:bdfc with SMTP id
 a640c23a62f3a-ac6dd5cec3cmr340146666b.50.1742972982047; 
 Wed, 26 Mar 2025 00:09:42 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-43-49-206.web.vodafone.de.
 [109.43.49.206]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3efbdecedsm983445566b.140.2025.03.26.00.09.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 00:09:41 -0700 (PDT)
Message-ID: <8f522412-8711-48b0-bf85-f9bed7bb94d4@redhat.com>
Date: Wed, 26 Mar 2025 08:09:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 09/12] hw/nvram/xlnx-efuse: Do not expose as
 user-creatable
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, BALATON Zoltan
 <balaton@eik.bme.hu>, =?UTF-8?Q?Herv=C3=A9_Poussineau?=
 <hpoussin@reactos.org>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Glenn Miles <milesg@linux.ibm.com>,
 Samuel Tardieu <sam@rfc1149.net>, qemu-block@nongnu.org,
 Patrick Leis <venture@google.com>, David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, Halil Pasic <pasic@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Bernhard Beschow <shentey@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Hao Wu <wuhaotsh@google.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
References: <20250325224310.8785-1-philmd@linaro.org>
 <20250325224310.8785-10-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250325224310.8785-10-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3VGhfriOM-9UpnRfs_deHCiKwWTEpND1x3Ljb5Ky5zM_1742972983
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 7Pi47pPULHwp

On 25/03/2025 23.43, Philippe Mathieu-Daudé wrote:
> This device is part of SoC components thus can not
> be created manually.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/nvram/xlnx-efuse.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/hw/nvram/xlnx-efuse.c b/hw/nvram/xlnx-efuse.c
> index 29e7dd539ec..176e88fcd17 100644
> --- a/hw/nvram/xlnx-efuse.c
> +++ b/hw/nvram/xlnx-efuse.c
> @@ -280,6 +280,8 @@ static void efuse_class_init(ObjectClass *klass, void *data)
>   
>       dc->realize = efuse_realize;
>       device_class_set_props(dc, efuse_properties);
> +    /* Reason: Part of Xilinx SoC */
> +    dc->user_creatable = false;
>   }
>   
>   static const TypeInfo efuse_info = {

Reviewed-by: Thomas Huth <thuth@redhat.com>

