Received: by 2002:a17:906:c945:b0:a38:6d10:c5dd with SMTP id fw5csp236083ejb;
        Thu, 8 Feb 2024 08:56:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGsgdAEaqOOQH3+XGsgHqBFr794HIa5N4m2tWj+yyDuDZAHJGCnHbBwTYnpJrHBHMu+8kYI
X-Received: by 2002:a05:6214:260f:b0:686:7256:c9f4 with SMTP id gu15-20020a056214260f00b006867256c9f4mr13752996qvb.9.1707411364487;
        Thu, 08 Feb 2024 08:56:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707411364; cv=none;
        d=google.com; s=arc-20160816;
        b=0VEJXCM0nZZVDSdL5nD8157a8u4QXSAJIp01WrmS0XNhi2g8g9NyFqqxqxSl3tvwT/
         OtBHX8/SKH705ZuyyQIbpjvDcMSLb5tk9dfZF4Yk4hl0jmuQFsk5CvocuC94h2jh7886
         ZIdZGuHrMB1ct1zc++D13NyuFDZHC0L3lVusgu7xLw/Olqd3VUSGbGIe56ehxXw+3pPX
         ewJbWddrgNPHaLEjWOkG41ImV3WeG8C/tA+14KcDA26UIO20YXb9ioBS6axfsxKl0MJ8
         TOb803nO6ZXohknoy3RZU2MgkYwMNT6Y/SCmfQQ0oFhWW4E2Sv/fcxIa+/aKsoyYFdXM
         1Ztw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=pMoXHXY4+qZJUeESHsnlS6as99TdnkReAv8/2YwmyFc=;
        fh=0fIH2GokTlsF9SBfgWnmQKy0IYQutnkLn0VD/Lvea/Q=;
        b=l7ddZ70HiTAL+DDiprAPhfQxxQ8NIkARBHJfYMdZ2Ulnyn7zEBEWtsrg+ZFL3Rng2J
         n+2ObeMxoSZWhHdF8W5yepUzzsaroXG6uQse9vLJi/sQ+omC9o6sYOVgqYHukl8ReVoM
         vrtJRDn0RJOqKlZFk6fdoNMpuFFi+TBuDL2j+L85slQZYo1L8vvFnHTd3ajOErzajOL8
         mvkMaFU8nPvv9XACwMAiFGzzZ+tgGhtvfbcHbQesbxkUow/Fj1VeiLCnOYXb3Vk+yuPO
         wGAypm2EbVCN82+Rwelj9QRW3mD5zsgNzmiqEIWmmvM0oj6ojYqqiOfVi/VHDEMxkCs+
         2jQQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LFqLGFD+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=1; AJvYcCVZn1c2qS1xGuW2OBDD0pUL8nnAvgsMk7pTWoHmsDgKlZOeEtJhzDXLHSBpirpkP7YDEnbz/bewJmNoaCEoyFg78TDHbxm/
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j20-20020a05620a411400b007853f72dd4fsi428351qko.286.2024.02.08.08.56.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Feb 2024 08:56:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LFqLGFD+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rY7gT-0001qE-Ge; Thu, 08 Feb 2024 11:55:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1rY7gS-0001q5-GB
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 11:55:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1rY7gQ-0001Ma-Sa
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 11:55:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707411329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pMoXHXY4+qZJUeESHsnlS6as99TdnkReAv8/2YwmyFc=;
 b=LFqLGFD+xqNtf1eaP78561ZAmBi5L999MMlyBITl6LgIJ5d4D+ldKLLbtx3we++4aitWHo
 2JEaaQuP3ybzMGR0ajSuS/GBPZoKbO1q/wX+7/OvQiGS2pdab9+b6uhkfey6zXYvQznVY0
 aM31sfFuN/6Rj6BDuj/KboiREipriBk=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-7auRZxGRPS6E_RRKeiWeaQ-1; Thu, 08 Feb 2024 11:55:28 -0500
X-MC-Unique: 7auRZxGRPS6E_RRKeiWeaQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-42c33d3601cso230521cf.1
 for <qemu-arm@nongnu.org>; Thu, 08 Feb 2024 08:55:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707411328; x=1708016128;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pMoXHXY4+qZJUeESHsnlS6as99TdnkReAv8/2YwmyFc=;
 b=dNCQy6J1I8KiMO7yRYwoKeIZT7rzZA6H4TL4prjDnQEs0RuwnqFCahS9YLvGmCTWj1
 Xn2jC805Z9zvidRZ82gPi6G/K2+cvpOzl7ra48avZy8X8YAlJ9nwMIC9kqGfnuBCXdnZ
 C22tZ+eUan2kQIyPvvgHoMpk3Q/94CTJtWfn6E8qadtIwxt9lLiwfM7wPMlQ+7Kf0ECA
 m8TdFHB+a3PjrfniYKRQYcp7RxYymF3Vz9KbIUb1AByt3XUR/l11/HzT77gM2GdoqVsF
 IAv14vAU2Ny3SrG3lKkXIfMZHfrsw4cNmrn9uqe+gEhPMOHyPmJmVgyRmFo16qOkUqWr
 VmnQ==
X-Gm-Message-State: AOJu0YytgjccIlf2Aw5jvBp8fSV7L6F2II2DXXnTpnxBW2mq5f+XcakC
 DAZWgq81uIZTWcNF69qWZFqg8zKkGZLYNOAbo+Ib15FqGmdxzyoWtbsDu6gxnC/pXm1GkY5FV4h
 bReoimgSBCsnSxzndXnKSAtcy1d3xmx0pKlo5XG8GTiBAb6OMVQ==
X-Received: by 2002:ac8:48c2:0:b0:42c:35e4:3cc6 with SMTP id
 l2-20020ac848c2000000b0042c35e43cc6mr8166346qtr.3.1707411327953; 
 Thu, 08 Feb 2024 08:55:27 -0800 (PST)
X-Received: by 2002:ac8:48c2:0:b0:42c:35e4:3cc6 with SMTP id
 l2-20020ac848c2000000b0042c35e43cc6mr8166327qtr.3.1707411327686; 
 Thu, 08 Feb 2024 08:55:27 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV0MsbI4sXkZ9EFzkklzZHbdlraq6P1pZFfv11g5LJ0Ac6oud/PoQh/z0Jr7I953hvqsvKrFejLdLpFPkcMTZl8pH7LzX6u1nIfkpefR2hGtT/abz+9scooBMx2EVJulbAYZYh06hD0boFsRH3XXqxzFK5dQOW06WnvfKrh6imAvFMiqIs26SGwhPNiIdTlTDTJlqy2qZo01TjL0nsVCBEMeSveqI1KCGMN+3+19GbMKSeFj9bOZhe3t98r7SDM5XQdeHLCXR/+EtahhAuypFcRQGcr5TkryosL1b1gQI74sCMa7/J2
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 gx11-20020a05622a27cb00b0042bf5ec20f0sm148876qtb.30.2024.02.08.08.55.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 08:55:26 -0800 (PST)
Message-ID: <5ede0197-4587-43e8-976f-d3001f42b8b9@redhat.com>
Date: Thu, 8 Feb 2024 17:55:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] QEMU v7.2.0 aarch64 Nested Virtualization Support
To: Miguel Luis <miguel.luis@oracle.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>,
 Andrew Jones <drjones@redhat.com>, Marc Zyngier <maz@kernel.org>
References: <20230227163718.62003-1-miguel.luis@oracle.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20230227163718.62003-1-miguel.luis@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.213,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: tG/juzVqi5H3

Hi Miguel,

On 2/27/23 17:37, Miguel Luis wrote:
> This series adds ARMv8.3/8.4 nested virtualization support in KVM mode.
>     
> To enable nested virtualization for a guest, the host must expose EL2
> support via QEMU command line switches:
> 
> -machine virt,accel=kvm,virtualization=on
> 
> Inspired on Haibo Xu's previous work [0][1], Marc Zyngier's kvmtool branch [2]
> and kernel patches [3] on nested virtualization for aarch64, this has been
> tested on an Ampere implementation.
> 
> This series adapts previous work on top of v7.2.0, it considers comments given
> at the time and preserves authorship of the original patches.
> 
> [0]: https://lore.kernel.org/qemu-devel/cover.1616052889.git.haibo.xu@linaro.org/
> [1]: https://lore.kernel.org/qemu-devel/cover.1617281290.git.haibo.xu@linaro.org/
> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/maz/kvmtool.git/log/?h=arm64/nv-5.16
> [3]: https://lore.kernel.org/linux-arm-kernel/20230131092504.2880505-1-maz@kernel.org/

I rebased the series on top of v8.2. I was able to boot some L2 guests
with it, although it still does not work with guests featuring edk2.

Do you plan to send a respin or may I do?

Thanks

Eric
> 
> Miguel Luis (5):
>   linux-headers: [kvm,arm64] add the necessary definitions to match host
>     kernel
>   hw/intc/gicv3: add support for setting KVM vGIC maintenance IRQ
>   target/arm/kvm: add helper to detect EL2 when using KVM
>   target/arm: enable feature ARM_FEATURE_EL2 if EL2 is supported
>   arm/virt: provide virtualization extensions to the guest
> 
>  hw/arm/virt.c                      |  8 +++++++-
>  hw/intc/arm_gicv3_common.c         |  1 +
>  hw/intc/arm_gicv3_kvm.c            | 25 +++++++++++++++++++++++++
>  include/hw/intc/arm_gicv3_common.h |  1 +
>  linux-headers/asm-arm64/kvm.h      |  2 ++
>  linux-headers/linux/kvm.h          |  1 +
>  target/arm/cpu.h                   |  2 +-
>  target/arm/kvm64.c                 | 21 +++++++++++++++++++++
>  target/arm/kvm_arm.h               | 12 ++++++++++++
>  9 files changed, 71 insertions(+), 2 deletions(-)
> 

