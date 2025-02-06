Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1684840njb;
        Thu, 6 Feb 2025 09:14:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVXi0Uk5/NV1cdwIPB4cl74lpDh0vqhSes0iiQva+dSmuBKikkMDwuMq8mTqPydccE3/kvMVw/PmcoZJw==@linaro.org
X-Google-Smtp-Source: AGHT+IEEQAgs3lXrpyakYd0gUdRPXSGZkqJgyb4vblp368z5MzS0NGB/QHDVKxbnlQ85+Rlk6kWp
X-Received: by 2002:a05:6102:4b86:b0:4b2:adca:c13a with SMTP id ada2fe7eead31-4ba85e5536fmr20701137.12.1738862074935;
        Thu, 06 Feb 2025 09:14:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738862074; cv=none;
        d=google.com; s=arc-20240605;
        b=iD8qXBcVEX7q7/dxSov7p0KKHaTKIE9uWAH1P4+zlJfNPuNdxpzqNQohkbhNwRwTFZ
         TboWmJyBSf252a3KeFKbg9jMhtAIfEdG0gOoIM509wnfHK3MrGHE7q6j597Fm/MHYWL9
         sL8m6ELOBTByFAKgkxQgt4X2ytbGbVPBiGNG3u8SlE4xlbKRHoyGED5w3HrJoRa52EL0
         wTaE+jpoGK0GWjaJ5Kq6jWU3C5XdrWi90v1soi/tAH2c3VPOKnlQCiQXCCxMuTSA45OC
         ML0xykZSz/9xoelKPmblfvNSwgWlY1EOOK8XSTm208kFhFJ5RhtlLdG6YeHH2oy0H2oH
         E+NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:content-language:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=5UXVlKoJC0TaVRGPDBhXNQT+xB0fThhs8UGHJ4HWzLU=;
        fh=Zxzxxwo9pt0oO1natY//PM42Fl6UqDbd0LeJDAYVIy0=;
        b=gARRK2tQm6qQbG4h1K0YDXfeScz0i3AuaZ4QI8G9YowEXmVyBmeetVypFIBQN56ryQ
         +6+Xx6cOk2ie6D93N7ENR/6NA4UjZCwGoh1b/zghld1Q272jf1ORiN4YHlhcxMdo4k7Y
         1a9El8ozKqIyHYx6nr1WfV/ZFMDmqT8aOL8qgKCcBG8M/rLVMG9xFs5a79aWIXqnGNr6
         s44UTwNB581WpbXtGt8Jm0jD3l0TMq/q/CMuKFUBNJqDZa9cHCldjsFGcAsSq7yZaFnw
         7sAvKDRr/vvFHCbgtS57h8FjdEtyCChkT3mXMWkH3jbEWE1QFzqxQbbiAGy9vYwvqziJ
         eR0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YRyDtSeg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-866f97e3de4si287615241.133.2025.02.06.09.14.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 09:14:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YRyDtSeg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tg5SE-0000kP-RR; Thu, 06 Feb 2025 12:14:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tg5SB-0000jT-3T
 for qemu-devel@nongnu.org; Thu, 06 Feb 2025 12:14:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tg5S9-00053G-3J
 for qemu-devel@nongnu.org; Thu, 06 Feb 2025 12:14:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738862051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5UXVlKoJC0TaVRGPDBhXNQT+xB0fThhs8UGHJ4HWzLU=;
 b=YRyDtSegJaWqqFlmpFapmFE559jl6dkuKJssPXfKV2K2UF01Oambci4jKsTC1TNxo4lVHK
 YGHfMt6K7h6PCuVYgT199wZr5tW1KX4edUCMCIUEAdZTifzmcZic83xwoiVoHH+E0DDyzP
 QQ3VFcm6FBf69uF1z64M4cvOvzigTjs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-uv8uHyyxNwmGq70QIRBSgQ-1; Thu, 06 Feb 2025 12:14:09 -0500
X-MC-Unique: uv8uHyyxNwmGq70QIRBSgQ-1
X-Mimecast-MFC-AGG-ID: uv8uHyyxNwmGq70QIRBSgQ
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-38dab928a84so452469f8f.0
 for <qemu-devel@nongnu.org>; Thu, 06 Feb 2025 09:14:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738862048; x=1739466848;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5UXVlKoJC0TaVRGPDBhXNQT+xB0fThhs8UGHJ4HWzLU=;
 b=jC0mIfXD08svbyx/FHvv5ziaKEUVqX4nd/Qr81inPq9dOUrRVR9wfY8wiUiI0FDX/v
 O8BSTqsAo591ZzwMeFLpC7Cuioryq3wwyyCTRtsD6JWxkd4q9mVY+dGMfleeifZ2ibzw
 jA33ZOrDPdzWRJMtfdDIuK0I4uQpCAAv8zleHyAxeA71SRBj2ssHQvUGyxXAFPmC57Ws
 eaP0VbIcL1Nu97OoOhi+VAgF7EHMF1o9Eeb5a3akGjIJ13EE4g/UrZn3Bvr35IclrlKG
 CwnG8DqobZxajLqQnKpYSLM3A2zcY+9nsWPUSRF8ocMUaadf4Xv1mJ46RAWwTEZEcSI/
 RBDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7lIGSKNzwPOzQjTGIXJ1qnyToDB3hEisMMtyCodMU2468zLxSyi6fhjKggp0iq8DEYpeifGkHjc5u@nongnu.org
X-Gm-Message-State: AOJu0YzTXopvp8sKslRuqjiQRtV1x5l3m3DWxYaxqT4CO6PewOFWVbYE
 piFk7TSao9TiTOJ3VSvIj21fMD+6oP/32v+bLisEibSGThXDY0a8X2VMYEIzmlfBWtFsKGF1TlA
 GmKSW7QHH1Bjw5TM8ZKa0E7GRwbTYBY479cbdOL8KflqGGDv32DFdlP+ZXSsN
X-Gm-Gg: ASbGnculi4SReQ+MZRARaIbTkE5ZF1a96ExwSAhpJMVxIpNSy4V6MiOurBrso24SkjO
 FwAGeP8GhkLaAmJ56ai0JLuSPBdja0DDLiDOXi418bPuP3wwNTZUttoNVpwV0ftYnHXO1RwlFwI
 hAInoDjiBJdfMieeVnje94NZdgyCPslnp+B+r+PVijufDkoCJTwlEi1nES/agmKkRTzt6H9+9ZF
 Ft/CJ3ptgQlaISiLOrHR/bx0yka3doEjyFlG8+upbvMhY18apmm0N+vIcDeVsVzhY0XiFRC63vK
 rmHPNsFa3EbQQ8yC0ZJcMwcYcrypnEYuHsCz
X-Received: by 2002:a05:6000:1882:b0:38d:adc2:110a with SMTP id
 ffacd0b85a97d-38db48caa46mr6659529f8f.43.1738862048478; 
 Thu, 06 Feb 2025 09:14:08 -0800 (PST)
X-Received: by 2002:a05:6000:1882:b0:38d:adc2:110a with SMTP id
 ffacd0b85a97d-38db48caa46mr6659506f8f.43.1738862048132; 
 Thu, 06 Feb 2025 09:14:08 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-48-132.web.vodafone.de.
 [109.42.48.132]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbdd35bd6sm2191175f8f.22.2025.02.06.09.14.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 09:14:07 -0800 (PST)
Message-ID: <9761d9fd-4b1d-469d-afd3-484c52db97d3@redhat.com>
Date: Thu, 6 Feb 2025 18:14:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/16] hw/net/xilinx_ethlite: Make device endianness
 configurable
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20250206131052.30207-1-philmd@linaro.org>
 <20250206131052.30207-3-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Content-Language: en-US
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250206131052.30207-3-philmd@linaro.org>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ilxvN4oCdQC/

On 06/02/2025 14.10, Philippe Mathieu-Daudé wrote:
> Replace the DEVICE_NATIVE_ENDIAN MemoryRegionOps by a pair
> of DEVICE_LITTLE_ENDIAN / DEVICE_BIG_ENDIAN.
> Add the "little-endian" property to select the device
> endianness, defaulting to little endian.
> Set the proper endianness on the single machine using the
> device.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/microblaze/petalogix_s3adsp1800_mmu.c |  1 +
>   hw/net/xilinx_ethlite.c                  | 20 ++++++++++++++------
>   2 files changed, 15 insertions(+), 6 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

