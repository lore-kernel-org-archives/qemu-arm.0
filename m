Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2287867dyb;
        Sun, 22 Jun 2025 19:18:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWdGf3+GgPslvR2AtZO9QWxE1L2FIpnmAXqeggM/yoUG8sT7TejLoL3rhknhTIP9oGPZs6H5hJYOUjdlQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFRzrQMJ6T/obXnUmsWPXsPPjN5Wu054GTyd7TvND0GeBn0QlCC3ODgEvbwAKzpfs+nAQIJ
X-Received: by 2002:a05:620a:27c3:b0:7c7:9a85:d395 with SMTP id af79cd13be357-7d3f993868amr1811805885a.44.1750645098575;
        Sun, 22 Jun 2025 19:18:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750645098; cv=none;
        d=google.com; s=arc-20240605;
        b=SYiLufMg70kn24bJ2sIUQ9gNeCu+tun8Ja+761WHt3oC80ckauh8qrDrWEVBH/A5cJ
         sUJ4pufETLkITZf4o3gG5B1ZkTbQz5HVv/+jz3emWPNXiqOgdKbOwJ7j4yCewmIubty2
         ttumBz4+c1vVzx+nEKp7LnfRlPCMCqvknt/YSAu/k/8xQCb62pTJlBeo4D9/KoM/uqnW
         7oMURbYuEVJYZ9v1NWfv2Ktf+WoqBxnMouaFpnNkE5EBak12nl+whM8m98V6dA32xUJ3
         FKcej/oZkMVIJB21roauxHWQCSgcQjGjZQoK/e2qWh+6smMqm/NYu3DVpQqQRFsBygzz
         gMTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=pVQNsnzkR4fy/0MFAc0InlJSrCjdz2VdJOThIkc6lIE=;
        fh=LUHGj8Zf2Ly8FGn0baHQjNeQQYa4AgpBSTs6fF6ujoU=;
        b=JiYsZr8kxshrx9rmTNeyHl6HRIDR7pLkYw4Yz3AoWiPsepc7CqNPQoRhFtWP+0IpIV
         RdvD6Scdw1PWveFU0F44n0cJ8l85sdMcytS3juy6F0cbktZgQRCMQ6LXTUZsA8mLwTIk
         hcACWrCHDwXBPTkmSUW9yoqtUV3eyKaNL24Iyrbb/zbNsulJqbEBxQ1QFO/GaRZdGgi2
         Z28Yp1oHWlRlaXWX16iCXi7Mmux3pcGp82C/hHaYqzt01yUaAYlwELyOYZv6/tgI9uMy
         Lsb9OTudHACBpFRZk2Nd3APNrAtfGMiTEISaDgVq1gW7yyzupB9M8IdAjtEos/GuvBtU
         DJfg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="MuCg2zO/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3f9a2408bsi668081485a.616.2025.06.22.19.18.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Jun 2025 19:18:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="MuCg2zO/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uTWkm-00032k-2T; Sun, 22 Jun 2025 22:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uTWkk-00032Z-Fx
 for qemu-arm@nongnu.org; Sun, 22 Jun 2025 22:17:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uTWki-00088r-9k
 for qemu-arm@nongnu.org; Sun, 22 Jun 2025 22:17:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750645062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pVQNsnzkR4fy/0MFAc0InlJSrCjdz2VdJOThIkc6lIE=;
 b=MuCg2zO/LCmaPS1wEkihMCWK5dywQqhqX82nCU0pdU/kVdSPHiLBlJtvLidKC18cCCQgcs
 v6pYdbFeBFsKH1eQFSF/JgTwHay6GP3wv4L944SDsn2ZR+BoqBCKcL36JFjBMBXoUhTdxs
 OfDPb2N6i5i+NpvV3zb7J3P3oNSt+88=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-zkTvXRb6N2-rKrVOIClPLA-1; Sun, 22 Jun 2025 22:17:40 -0400
X-MC-Unique: zkTvXRb6N2-rKrVOIClPLA-1
X-Mimecast-MFC-AGG-ID: zkTvXRb6N2-rKrVOIClPLA_1750645060
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3138c50d2a0so5309103a91.2
 for <qemu-arm@nongnu.org>; Sun, 22 Jun 2025 19:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750645059; x=1751249859;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pVQNsnzkR4fy/0MFAc0InlJSrCjdz2VdJOThIkc6lIE=;
 b=roXadUL23Mwd0vGhX2MChSpnFWu0R0zGVfFx22hWbFDIdaMU9tHaZEUvzC5HVtN9Bb
 NEzhHxpLJQ8elsVYxhM8kDc+e9eZdxx12H+QCgCNrq081e7lmTjGCo1C4WWl9bHSYnQ7
 UrN/yMrC8wLNLqnOuP21XV6gkTwDctCAo/3tFsjr4CaJcJLO1bzxeNqMCIJiXfGsP5Ru
 UR9X9NOQrsW87++WL4Tyc3e0Ajk/fvE++9jFVuWtAu+SvWfKEjPzFqLgerTZ+XN9N9fS
 3sLo/ZjgU6dzFhH0piN5lbYAk6jCoVDP1igPUHUhdShfbTcd3rfKF5AXK7EqiKi4H4Px
 iJ0w==
X-Gm-Message-State: AOJu0YyfGue7VyHm07t7AD6z8ZFNWx7ZDNDDa/GuJRxB91ddHPkz7Dqi
 r9re2zhDOWR0dwBk54S6gzuSrVdGm9Mm10CW9oFCFcEPqDe/xilFoXBaP6PHYLdzSR8wpb5gENY
 edWsigEX7sW8BuvtH189p92BnX8CcBmZtJO7watb5R9CXRhjXMIOpXkcQtjhvxkfkfMeNgs91JT
 ife6qJ6PgQHSlJ8PMz9Z486JcLXeZfoFExtmBXxg==
X-Gm-Gg: ASbGncsoWKq0CY5HO+PMlu3qOsHVq5gS4908S2V50okgmfgo5w8SK5Xp5PjPSs/0LYh
 oFi/HweGglHHEpyeL7DXje/JodeSB5MFbtNPnkKAlyz9Or83f7lm6EJGI40eWJfxuDeixgUzecM
 gRIqVLWSOJNtIxPe2/N3GK+QKjj9BKSRdW26oUTPvRxhoD94qWp7//tAp4f3qE35B+LGog5M88S
 u9m5+wUBtc7U4BKfTaS5o3b5KhD3QSYjDi1tNvJbb+8Y7QXFx+lbdi/ab9OaucwP8Pe3ly7iipS
 Tp06bAzQ9bEgGBUTveZ+nHpk3tI=
X-Received: by 2002:a17:902:d542:b0:235:ed01:18cd with SMTP id
 d9443c01a7336-237d997a5aemr207642345ad.44.1750645059412; 
 Sun, 22 Jun 2025 19:17:39 -0700 (PDT)
X-Received: by 2002:a17:902:d542:b0:235:ed01:18cd with SMTP id
 d9443c01a7336-237d997a5aemr207641875ad.44.1750645058878; 
 Sun, 22 Jun 2025 19:17:38 -0700 (PDT)
Received: from [10.72.116.103] ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d8695440sm70830085ad.185.2025.06.22.19.17.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Jun 2025 19:17:38 -0700 (PDT)
Message-ID: <61187896-f836-46c2-9f4a-4957b85f33b2@redhat.com>
Date: Mon, 23 Jun 2025 10:17:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] ramfb: Add property to control if load the romfile
To: qemu-arm@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Auger <eauger@redhat.com>, Alex Williamson
 <alex.williamson@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
References: <20250617030521.2109305-1-shahuang@redhat.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20250617030521.2109305-1-shahuang@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: M1ntsBvpIJZ0dsuCyzJgY_WHKHvuCyvm3OiMer4tl18_1750645060
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=shahuang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: 0LKeNUMPO7QI

Hi guys,

Kindly ping for this series.

Thanks,
Shaoqin

On 6/17/25 11:05 AM, Shaoqin Huang wrote:
> Now the ramfb will load the vgabios-ramfb.bin unconditionally, but only
> the x86 need the vgabios-ramfb.bin, this can cause that when use the
> release package on arm64 it can't find the vgabios-ramfb.bin.
> 
> Because only seabios will use the vgabios-ramfb.bin, load the rom logic
> is x86-specific. For other !x86 platforms, the edk2 ships an EFI driver
> for ramfb, so they don't need to load the romfile.
> 
> So add a new property use_legacy_x86_rom in both ramfb and vfio_pci
> device, because the vfio display also use the ramfb_setup() to load
> the vgabios-ramfb.bin file.
> 
> After have this property, the machine type can set the compatibility to
> not load the vgabios-ramfb.bin if the arch doesn't need it.
> 
> Then I set the use_legacy_x86_rom property to false by default, and only set it
> to true on x86 since only x86 will need it.
> 
> Changelog:
> ---------
> v3 -> v4:
>    - Set the new property to false by default, only set it to true on x86.
> v2 -> v3:
>    - Fix the underscore error.
>    - Add a new patch to set the property in arm compatibility.
> v1 -> v2:
>    - Change the property name.
> 
> v3: https://lore.kernel.org/all/20250609073408.2083831-1-shahuang@redhat.com/
> v2: https://lore.kernel.org/all/20250606070234.2063451-1-shahuang@redhat.com/
> v1: https://lore.kernel.org/all/20250605030351.2056571-1-shahuang@redhat.com/
> 
> Shaoqin Huang (2):
>    ramfb: Add property to control if load the romfile
>    hw/i386: Add the ramfb romfile compatatibility
> 
>   hw/display/ramfb-standalone.c | 4 +++-
>   hw/display/ramfb-stubs.c      | 2 +-
>   hw/display/ramfb.c            | 6 ++++--
>   hw/i386/pc_q35.c              | 3 +++
>   hw/vfio/display.c             | 4 ++--
>   hw/vfio/pci.c                 | 1 +
>   hw/vfio/pci.h                 | 1 +
>   include/hw/display/ramfb.h    | 2 +-
>   8 files changed, 16 insertions(+), 7 deletions(-)
> 

-- 
Shaoqin

