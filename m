Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp45828njb;
        Wed, 4 Sep 2024 02:02:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXRs5l619dcb5Cw2SlqedWRHpQ1pXqslljk3inJR1tVMPXiVEjeG0YYsaYC59yE7NxMlqdf6DXhVIovUQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHO0gAf3HmvRZZWD8lwiN/4apOiaq2UWW2KaxnD8p8CST2jb3YHJ0vn8H6Ayv123FoOjYjG
X-Received: by 2002:a05:622a:6090:b0:457:f8b1:a04b with SMTP id d75a77b69052e-457f8b1a1e3mr10276111cf.25.1725440535657;
        Wed, 04 Sep 2024 02:02:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725440535; cv=none;
        d=google.com; s=arc-20160816;
        b=d0PxxBwRNG0hish2qhGGW8VeCB0g2juo1Wz0HWUWGf2MtUK/IYvRoLW0nG0DnWn65r
         Z8iBzxj5JJlICavBpa2sRS72Eh8x+ZtdfbUwfdYhbTPV3oNfkud1xqiuC234f4h4tgRz
         jzYMIwe3mflBbWYELNoSettYrEquqJ/Zh1HuWb81qiykfeXm9NFfxQZ85CRlcCv+fUc6
         Gs3P+m6EOmVQNzJbZgSjf5GHr7DqQUreN2FlZI2o3zFyOV5slZ/cpN9Nzz4zDvZHNqMY
         dcWO8B2+9p9g6sn3wltWtYYxXEG6i1awk7smiaX0a8//tQG2fjej+qS+fSzPthOJSYjP
         TT3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=K2XXaIdhPHjbb6TzR2cGDsawD4ySEfa1b9U51D/iByI=;
        fh=pcs/JLV1RcdHTOGiCfu4/nqtWmyS7z/UV3pog4niurE=;
        b=AmMKb3AHH7x2edZUgOztSXV318TsyAIu9imR/BXgK2/FsgxzfLV8kWiq3Al5Z+nQtu
         fq3fPKnTLMwiRu/OjXFt7+spihYcCR55ChCI+raxLee3xaoE0ZnEJOizZsaDPb9PHAQQ
         kdSs135jc6LvsP9Yo0uyRV2kWPiwvabbbvIuudfg4W5EdUdecr63ZVXeFilrwcrphSJX
         xEKsqqNS8toMoby73A3/RsahYb+EwZIfyaT4LyOLqfCfzM8+UnHZdOTSE3C+Nxj0Tl1o
         8igH3s2z1swWZoo/O70ZEJf1MCaEMkBH/1iPRr9Qn6O4LZ4gtShCM2gpIQ9LCl+8y/IA
         m61Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SPRdxM5e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45682c9ec97si91779081cf.193.2024.09.04.02.02.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2024 02:02:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SPRdxM5e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slltX-00046n-87; Wed, 04 Sep 2024 05:01:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1slltL-0003So-7V
 for qemu-arm@nongnu.org; Wed, 04 Sep 2024 05:01:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1slltE-0005hM-RU
 for qemu-arm@nongnu.org; Wed, 04 Sep 2024 05:01:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725440483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=K2XXaIdhPHjbb6TzR2cGDsawD4ySEfa1b9U51D/iByI=;
 b=SPRdxM5e6QR+dLHBQQo7WpJoDruvK1GX7uKZKvjPMEBYUVHftkYxFZL4T+siV6m552gAf+
 gPll9HEhcijbVPZ/zVNe+fa4oflZ9LUIPIaK6SK2y8DTtohiaC8VmxxQ18rhGa1M3nTyUp
 eWH4MkR1El15TT+OAhPOrnmvZ078DvE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-_Si6rp21O16uO8i7RBfoBQ-1; Wed, 04 Sep 2024 05:01:21 -0400
X-MC-Unique: _Si6rp21O16uO8i7RBfoBQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42bb6d3cd05so57351635e9.0
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2024 02:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725440480; x=1726045280;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K2XXaIdhPHjbb6TzR2cGDsawD4ySEfa1b9U51D/iByI=;
 b=xMegxsNvQAVuQA6ufeRA+E9ENre9Jwn3qAWT+t3+aB6DYdBV91M91/apDO/S7el7k4
 SUZTgQg//ynZ6X1/9UvCsIQR4Rm0p3764ZHm5vVZ3+ahSE6mXPNKyeoQDr84JGBoxcWJ
 K2UsBTzzMMnb7libfcNPipj7Qfz2gI7v/qIPdcHbRjM5/0V0oVmqJ2kNirhIPM3PDGhM
 HGIxIA6MwHR7wKlQMwA2aBP3Ni1K1BvvB+9BgQUh/A5jwWDD92998gUwQs4+UG+XyOHc
 UU8X7UVAA9ovL+dUahfkb3fdmg/ZESBADvX6OQeClR38OleXpFkQpwcrKO+YGvaDtXv7
 GznQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8CO92O1HLKE+pQfE+zV7TrBn1iqgYW27fCT7CaytLWlAm8QsLv0J3//705W+2aERVXbb4DDlBYw==@nongnu.org
X-Gm-Message-State: AOJu0YyHj1hdU5jRZhi2aM6+Vl02lqodo4WSqDPyp7ZOo/SgQDVFhTf9
 15UVErP1WzP1cY7ZKsg+78vxSP8X4lL2TUjzeZFkMBXMmyJXe34ZdPvimc3zLMnct5VHcz5kPeV
 0wifvgpD6fChwpwRmQTjgHQwaUwYTRvelHdMnMY5o1cd60VqT3w==
X-Received: by 2002:a05:600c:4f4a:b0:427:9dad:e6ac with SMTP id
 5b1f17b1804b1-42c88108ad2mr50590055e9.34.1725440480603; 
 Wed, 04 Sep 2024 02:01:20 -0700 (PDT)
X-Received: by 2002:a05:600c:4f4a:b0:427:9dad:e6ac with SMTP id
 5b1f17b1804b1-42c88108ad2mr50589835e9.34.1725440480048; 
 Wed, 04 Sep 2024 02:01:20 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-176-181.web.vodafone.de.
 [109.43.176.181]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374cbbc8281sm7364924f8f.64.2024.09.04.02.01.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 02:01:19 -0700 (PDT)
Message-ID: <5e863c70-0045-4739-bfcd-07832a1a1543@redhat.com>
Date: Wed, 4 Sep 2024 11:01:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 25/53] hw/arm: Remove 'n800' and 'n810' machines
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <20240903160751.4100218-26-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240903160751.4100218-26-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.142,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: keEJj92obJWg

On 03/09/2024 18.07, Peter Maydell wrote:
> Remove the 'n800' and 'n810' machine types, which modelled
> Nokia internet tablets. These were deprecated in 9.0 and
> so we can remove them for 9.2.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   MAINTAINERS                             |    3 -
>   docs/system/arm/nseries.rst             |   33 -
>   docs/system/target-arm.rst              |    1 -
>   configs/devices/arm-softmmu/default.mak |    1 -
>   hw/arm/nseries.c                        | 1473 -----------------------
>   hw/arm/meson.build                      |    1 -
>   tests/avocado/machine_arm_n8x0.py       |   49 -
>   7 files changed, 1561 deletions(-)
>   delete mode 100644 docs/system/arm/nseries.rst
>   delete mode 100644 hw/arm/nseries.c
>   delete mode 100644 tests/avocado/machine_arm_n8x0.py

I think tests/qtest/libqos/arm-n800-machine.c should now get removed, too?

  Thomas


