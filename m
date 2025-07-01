Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2954924dye;
        Mon, 30 Jun 2025 23:51:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVKBVCHKDr2lNjmKoz75+9puaO0tMeELEuD4XpyyK1JvtR6f3IdyhuyDNk5ixkT5zdDIgp090wff7FuZg==@linaro.org
X-Google-Smtp-Source: AGHT+IE68dJRrtu6GjfnaLhxr1z2ad2ZREdyayWBmlKuchxgroUzn2fTXoPUqyb6m2Siuboeyr4C
X-Received: by 2002:a05:6214:518b:b0:6fa:cdc9:8aef with SMTP id 6a1803df08f44-6fffdcff7e5mr245082006d6.17.1751352687193;
        Mon, 30 Jun 2025 23:51:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751352687; cv=none;
        d=google.com; s=arc-20240605;
        b=XQI3PDS5VuRQ9Gq4VxhW4XbrYcAI7naiVsQmNKeNS/PEhe6QEziGd9q2j4O9XIFDyh
         CYAQ0AlevmnDkTgAQ3b6x5YX+ej7lqMhP7XOVru6+9zSFYTWGMK72iTb4tlQEb0LVK8k
         EW6Nb1wVFPwySW9GwjN0D/YLdMerUFE1Q0gbsK7jNlKhCwK+QNtKiHAPUYiMYAuL7PZG
         t+hoP/jJVzi3QhRPJtWkcRgC1urYlFWOV3nyK/6okMnS8PbFghBjevppneZKruTRRgoP
         1aTqa858yPY1/q8tFyll/fjr5czETptUM49LH3z+qVbbFNfB2IwtMfpRgdW6gVp6CLq1
         oSBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Gf4lggQswakfca9ShW+YSv63cYv0Ld0SFqUv8ep8JCQ=;
        fh=SwO7O1Ch6bqrzF/r4XJPbrCxR+73K6mkLfhDN58uczk=;
        b=L5UIiHjxgAzgoAlig5ZqSJFDOYTqINRBdEilH/lv9Bi5jGzzJg7AqM+5p6end0z8BO
         BmgrnqeQ6iR0yfnweh9q6Rbrf45p1bUXdXayxs4ZeB/973IrE4RsL8HNV7xab5KBGCh3
         wQF0eS6oCncGN3jkCNvtwxPezNK2vDMuIuL1KkqWTjH9TvxXzGSmDrdVyJmDtdKNQI4w
         48q5Cgjqxf5gg/0tLlFiVy9wCWS+i43PZjhhd08SiG/JmxvOnslOSHgyGR8JC1aNR/jW
         cFtavetlIfnFlzesHKfPzoBGitcKNQcJWuh1TmbiEMAc/5LkjUjlWq76GEyKpkOxHnZU
         3s7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RJFyNmja;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd7728744fsi115842956d6.11.2025.06.30.23.51.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jun 2025 23:51:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RJFyNmja;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWUpk-0001LB-75; Tue, 01 Jul 2025 02:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uWUpi-0001Kp-Et
 for qemu-arm@nongnu.org; Tue, 01 Jul 2025 02:51:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uWUpb-0006rw-0U
 for qemu-arm@nongnu.org; Tue, 01 Jul 2025 02:51:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751352656;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gf4lggQswakfca9ShW+YSv63cYv0Ld0SFqUv8ep8JCQ=;
 b=RJFyNmjaDyxfYls3ugxZ60hPL1/qscz3JpPezGpojiV7V4BmdtdE4hHVXJaXHNvFVqSi3I
 LxADsp1HQ8WKZYk3u9A8IIgqdtlL8QPZSRlkaS6KK5ixyUBR7eL9h3ZNf5PWEUv0noXWu7
 KTpO8p7Vhk9tB8beo2nxTEi3MXKBZP4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-vGSFWOmQMx-FX3sklpciCg-1; Tue, 01 Jul 2025 02:50:55 -0400
X-MC-Unique: vGSFWOmQMx-FX3sklpciCg-1
X-Mimecast-MFC-AGG-ID: vGSFWOmQMx-FX3sklpciCg_1751352654
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-451d2037f1eso16925895e9.0
 for <qemu-arm@nongnu.org>; Mon, 30 Jun 2025 23:50:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751352654; x=1751957454;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gf4lggQswakfca9ShW+YSv63cYv0Ld0SFqUv8ep8JCQ=;
 b=pd9pv/4T6VRRcoCoiISshoEIk3JYYyNgAIE04GmT+XY45K2BDiadnc2PNS+FuKzlgw
 9d3/HeJa11oVXG45oJr6HvLmXeoKvuFvW7MHUh4SOelG+V9G6I4mFFNJ6lT26vauAWiJ
 H13Sd1TvRIC3MriXwgDejiWSpMnpe2Wnsh5sdc25HJ64ONrR8MlWX6PZc6604NSuk8Fs
 iwiQr913yho1iadrUK8aVVbMTKtqHc3IZpzMylTdaA+jPrDYQspjKwU5ZhqFgec7Z0cQ
 ZxFASms+dZ/Lck0FeK/PGCe0/kkOhKIYGrJyxZ0RyU9/+kz3PcwW1TUcgEDhs2+fK37P
 6IcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdwW9GgABZrGt5mLs/tNIFuWYZv87BEunzITDg7kBR6pXe3djTXsdQW3NMRHIFx4VTfHIfr+x/zw==@nongnu.org
X-Gm-Message-State: AOJu0YwElzy55l5k82KIiQSsnS31xMGdzBaWHcmuyp+K3VbOqaeVR5+c
 ggY3mQFW3OCCvJiY31ejlMbjaNU3C7M3U6TmEOC5ELrFz3UN9HYzQ5cH171QbDU8VcKMsMG14FL
 x/GUcVFkqSZ5tyqPGrCE36+D3DvWdF9tZEDfm6BgKiHQnNX202d/X+g==
X-Gm-Gg: ASbGnctxkkAc7en8hL7nS/PmbdK2xWHTCQuxim8a+V2lYYiGidBiTgMtP99wsdJlkcD
 b24iHXkay37LtUPKd5LyasSs3ggr2JMaEju8zNuka0McJ9CEbr310Ibq/dlwyvDBGLwjB2mWzgR
 Q4B55b/DVI2GkmrtpQMZGoIzXiBDZK2lY6Cg86WzYWeRuTk627XjsKxMxY9snq3Cc+aPpN+uF3g
 ZLJOPt4rYK92/LF1WTeqwc6fBCppUvBCnTp9fblEjSbhXnUKcOaov7HxEbVZQ8zvSiLu/9INpte
 cx34SuZSOdx4oY+HSRsokhffvvWU+bUxsukaPLPlgYLtfkOlVB4IXArpwSRBvZEX/w6jmQ==
X-Received: by 2002:a05:600c:4fc5:b0:43e:bdf7:7975 with SMTP id
 5b1f17b1804b1-4538f88349amr142832445e9.32.1751352654127; 
 Mon, 30 Jun 2025 23:50:54 -0700 (PDT)
X-Received: by 2002:a05:600c:4fc5:b0:43e:bdf7:7975 with SMTP id
 5b1f17b1804b1-4538f88349amr142832255e9.32.1751352653687; 
 Mon, 30 Jun 2025 23:50:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453b3542838sm7454985e9.1.2025.06.30.23.50.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 23:50:52 -0700 (PDT)
Message-ID: <531385a3-0117-420b-a401-a9ddbff6d5f9@redhat.com>
Date: Tue, 1 Jul 2025 08:50:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] ARM Nested Virt Support
To: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 miguel.luis@oracle.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, maz@kernel.org, gkulkarni@amperecomputing.com,
 gankulkarni@os.amperecomputing.com
Cc: hi@alyssa.is
References: <20250619145047.1669471-1-eric.auger@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250619145047.1669471-1-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IPVlzpxOXPrxKE9-zd7TBQrTPdZ0kR9wQbkQ7wZg8RU_1751352654
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.237, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KA9rGQWH4+id

Hi,
On 6/19/25 4:49 PM, Eric Auger wrote:
> The only change compared to v5 is the linux header update against
> kvm main branch. As discussed on the mailing list, KVM_ARM_VCPU_EL2_E2H0
> (non VHE version of the NV support) will be dealt with in a separate
> add-on series. Also the fallback to TCG does not apply if the host
> does not support nested and virtualization=on (which is aligned
> with the behavior along with other arm virt machine properties such as
> secure, mte, ...).
>
> For gaining virt functionality in KVM accelerated L1, The host needs to
> be booted with "kvm-arm.mode=nested" option and qemu needs to be invoked
> with: -machine virt,virtualization=on.
Gentle ping on this series. Any other comment? Missing R-b's/A-b's on
the 2 first patches.

Thanks

Eric
>
> This series can be found at:
> https://github.com/eauger/qemu/tree/v10.0.0-nv-v6
>
> Original version from Miguel:
> [1] https://lore.kernel.org/all/20230227163718.62003-1-miguel.luis@oracle.com/
> version from Haibo:
> [2] https://lore.kernel.org/qemu-devel/cover.1617281290.git.haibo.xu@linaro.org/
>
> History:
> v5 -> v6:
> - linux header update against v6.16-rc2
>
> v4 -> v5:
> - rebase on top of v10.0.0
>
> v3 -> v4:
> - fix: only set maint_irq if vms->virt
>
> v2 -> v3:
> - KVM EL2 only is set if virtualization option is set
> - fixes regression with virtualization=off
> - Add checks against unsupported GIC configs until the kernel does
>
>
> Eric Auger (1):
>   linux-headers: Update against  v6.16-rc2
>
> Haibo Xu (4):
>   hw/arm: Allow setting KVM vGIC maintenance IRQ
>   target/arm/kvm: Add helper to detect EL2 when using KVM
>   target/arm: Enable feature ARM_FEATURE_EL2 if EL2 is supported
>   hw/arm/virt: Allow virt extensions with KVM
>
>  include/hw/intc/arm_gicv3_common.h            |   1 +
>  include/standard-headers/asm-x86/setup_data.h |  13 +-
>  include/standard-headers/drm/drm_fourcc.h     |  45 +++++++
>  include/standard-headers/linux/ethtool.h      | 124 +++++++++---------
>  include/standard-headers/linux/fuse.h         |   6 +-
>  .../linux/input-event-codes.h                 |   3 +-
>  include/standard-headers/linux/pci_regs.h     |  12 +-
>  include/standard-headers/linux/virtio_gpu.h   |   3 +-
>  include/standard-headers/linux/virtio_pci.h   |   1 +
>  linux-headers/asm-arm64/kvm.h                 |   9 +-
>  linux-headers/asm-x86/kvm.h                   |   1 +
>  linux-headers/linux/bits.h                    |   4 +-
>  linux-headers/linux/kvm.h                     |   3 +
>  linux-headers/linux/vhost.h                   |   4 +-
>  target/arm/kvm_arm.h                          |   7 +
>  hw/arm/virt.c                                 |  13 +-
>  hw/intc/arm_gicv3_common.c                    |   1 +
>  hw/intc/arm_gicv3_kvm.c                       |  21 +++
>  target/arm/kvm-stub.c                         |   5 +
>  target/arm/kvm.c                              |  21 +++
>  20 files changed, 223 insertions(+), 74 deletions(-)
>

