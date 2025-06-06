Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp669700njc;
        Thu, 5 Jun 2025 20:21:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVRtkqQC/VLZ8EMXLSWw3NK3P4GLSzzMkN08ODCBLdrzxwGDyWj5q2hKmxso33OG4GfIwTy1S1wtvxflA==@linaro.org
X-Google-Smtp-Source: AGHT+IGYbt8AmTcbmltbd7CjJTn2iJk9eUgoPLwwcyBcmeW9N0L+91cOEXS4rGLwgCRIuN228VTc
X-Received: by 2002:ad4:5de6:0:b0:6f8:f1a5:e6a4 with SMTP id 6a1803df08f44-6fb08f6e965mr29661136d6.22.1749180069230;
        Thu, 05 Jun 2025 20:21:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749180069; cv=none;
        d=google.com; s=arc-20240605;
        b=AiBDxtsWmn6bCqnEYb73Bx/PiJHs29fR4tA8dM5fSdCo7Jt4oiVeiXYX9KTbBi28Ui
         Iw6ezL6wcj7nYCTAGRFP0lJFEX/tKh5BaC8R3zrPzRekX8b+PTouBC99gYtoQUJZQWvf
         cqdIb3dJrBV8bAaOabEG/Kx6lYzounnnoXxsa6lqzVbm5o5BCO9z3wUh/t0Nu4vmrEvE
         skrMWW22LussNUArLSJ2mtIQ0vOedKy/yV6BRdBqoTb9ZOHwqa7EPDqXIzPJni8Jq8ND
         TeFkZl9M4K6yoeKQ8ylnYK7i+N9Rpd3NnOCfZlN0G9Q7kT/F4d4h0KNSgVxL97Vn2T/4
         Uymw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=PjQhcxCbIw4eqaqIgYdffwaji/bLqp74RCiYxt5Trjs=;
        fh=Fyrl1uNFTy86iThb2NV2Sv3OH6i+Q4rpUGgBuC0i/mA=;
        b=WyerupMXLkq+lRhemWc8zxIMJCHs0UbnAyLjapXhOc7Ot3eiF5XOUvggY0wDPe3e+D
         UX6h7iSUpfsCb+IckqQ3qiwdfNT23UGqFPlSU5A9PmQLzUOYREdU+YFl2hkJn6nlRbC/
         WUTP9NMQ/MfmFh69kH5pI3cPt+2AbO0jyS/edQCgZpioZV7e//BAHZJ3KfviwavIZMyG
         4lMcxoSwdwLwpSBCuKh6BPQkHJrJFjnbSNgfcosj/aGnOqrqaOgJ1/Gzz9i9BSgF82SU
         gI3WRJVKe36cGHbt74gJ30riSynYxwXVxG/0jc1b1Nd5v3pU7B4r1juaxAiI7pk0+Ccl
         6SXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hoKHqGRQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb09b24dc6si7078136d6.246.2025.06.05.20.21.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 20:21:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hoKHqGRQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uNNdN-0006Vs-3D; Thu, 05 Jun 2025 23:20:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uNNdD-0006V8-N8
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 23:20:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uNNdB-00060b-5g
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 23:20:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749180029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PjQhcxCbIw4eqaqIgYdffwaji/bLqp74RCiYxt5Trjs=;
 b=hoKHqGRQtkAHqGD0z6EobKjzuPSSfbTov6fO9O/CpuOl8/GRO4Xr8ROJcxnlmPPBTSKtqQ
 Co8S2ASZUV3Id/9zns3vUuLrb81Vo2EeY90V0Nynlw/5D6h6159NQiFcc+ZmVm4/i0zZGq
 kCJXNqb2Gb4ZTE3lMtnm6tFkGJl0Vi8=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-mgGSmVDiP6aJ8A7fLIhhBQ-1; Thu, 05 Jun 2025 23:20:28 -0400
X-MC-Unique: mgGSmVDiP6aJ8A7fLIhhBQ-1
X-Mimecast-MFC-AGG-ID: mgGSmVDiP6aJ8A7fLIhhBQ_1749180027
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b115fb801bcso1854043a12.3
 for <qemu-arm@nongnu.org>; Thu, 05 Jun 2025 20:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749180027; x=1749784827;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PjQhcxCbIw4eqaqIgYdffwaji/bLqp74RCiYxt5Trjs=;
 b=YCG1BkoobkF6FLNDMdpXVfDIqvznFcn6wsnl3I7OGFusG72Szq8llEn21n2srpF/G3
 fr1tMjPHEU+AzpS0mZI3rkrJb+cocqXVS8LklObx2sFT/kqPC9NjEN8U26QOESej6mUJ
 esBphk4g++B9gygL3fv1aPLzwQo6LF2+G5W8b9B32h1ea8Pp1w+flBlZWkWok3ISekqr
 V0wFZB/jsbSH1n3p1VGFoTxMPTHKMETPoYUPdSM5xSXYv2PWrpyvMMHFX32eM8zfD5Cw
 57gOue0ZaMtd+c65HkGQAF8kmAuWPUT9vcMHAnxvFc5k5dkBsc57nknnZM/kmclXgtGQ
 4gfQ==
X-Gm-Message-State: AOJu0YwlQXRFIbtte0nKsSf4lIxc410DswxDJXF9JQWTCf1H0xZHp/aY
 ipDpKlMPA5Ecpc54yHAbg53dGiGDWJMuA4m4XVX0I49ww5DeJX93lwFj5OeD34uPp9zuL23c0hI
 fXiFFbRZrrRFoIRjZD/ctIen0hCssmWlcjBEdE+ytS1t0o40Vt+ZVtQ==
X-Gm-Gg: ASbGnctrbe0QV1U+m/wa6aVGLFwtfQzW6Zw277eZkVlIr7G7ViaZUB5+acrgJ6Jvj+1
 HbcddSRDuJ8p5PBlpaRx9RlClnrW2kUWY16fbgsm/w3bydeHHYeIzJ/IwOfnochcZZiVC487SmT
 /vqw6EbSLDoZbiroNC+yfooysTI8RK6N/YKpdzPYP/QhW+V90pyss2yjsoRDR4m8lHQoW2Y8rhA
 +J7C2YmxzkaG4Yxt9gAIiSLfARXvJ173ATEdL0SAoc77/tDaEqHPdS19T/OWY5GF+UExQfR2xty
 +wltc7TzzFaePvo=
X-Received: by 2002:a17:903:192:b0:234:ed31:fc99 with SMTP id
 d9443c01a7336-23601d00625mr23978275ad.21.1749180026901; 
 Thu, 05 Jun 2025 20:20:26 -0700 (PDT)
X-Received: by 2002:a17:903:192:b0:234:ed31:fc99 with SMTP id
 d9443c01a7336-23601d00625mr23977985ad.21.1749180026595; 
 Thu, 05 Jun 2025 20:20:26 -0700 (PDT)
Received: from [10.72.116.52] ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2360307802fsm3169295ad.20.2025.06.05.20.20.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 20:20:25 -0700 (PDT)
Message-ID: <27ea9c1e-61eb-4ea4-b3e4-e9d06b4b4ce5@redhat.com>
Date: Fri, 6 Jun 2025 11:20:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ramfb: Add property to control if load the romfile
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-arm@nongnu.org, Eric Auger <eauger@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
References: <20250605030351.2056571-1-shahuang@redhat.com>
 <746b078e-bd06-4361-aec7-2301412abb18@linaro.org>
 <kep5frpl24d74evoyf367pqkyoj6xez2pirk7xlzcoompyzq4c@ouxab77sdm55>
 <68f4f244-db07-4f65-9ca5-3cb9b70c9e61@linaro.org>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <68f4f244-db07-4f65-9ca5-3cb9b70c9e61@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kDYPFDqS42hlS0y_V6ssFYihknguX3l_V_8KlFf5rNQ_1749180027
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=shahuang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.132,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: kSX5leul82Y6

Hi, guys

Thanks for all of your suggestions.

On 6/5/25 11:11 PM, Philippe Mathieu-Daudé wrote:
> On 5/6/25 14:21, Gerd Hoffmann wrote:
>>    Hi,
>>
>>>> Now the ramfb will load the vgabios-ramfb.bin unconditionally, but only
>>>> the x86 need the vgabios-ramfb.bin, this can cause that when use the
>>>> release package on arm64 it can't find the vgabios-ramfb.bin.
>>
>>> Simpler to directly pass the ROM path instead of using a boolean,
>>> so board (or CLI) could pass path to non-x86 rom.
>>
>> The rom is loaded into a fw_cfg file which only seabios will look at.
>> So this rom logic is x86-specific.
>>
>> edk2 ships an EFI driver for ramfb, that is how ramfb is used on !x86
>> platforms today, and I don't expect that to change.
>>
>> IMHO a bool is perfectly fine here, I don't think we will ever need the
>> flexibility to specify some other rom here.
> 
> Understood, better then! Maybe name the boolean "use_legacy_x86_rom" and
> add a comment explaining EFI driver is expected on !x86?

I think the "use_legacy_x86_rom" is good, I will change the name to it. 
And I will add a comment to explain it.

Thanks,
Shaoqin

> 
> Regards,
> 
> Phil.
> 

-- 
Shaoqin

