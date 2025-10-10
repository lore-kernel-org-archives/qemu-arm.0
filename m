Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062CACCD185
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Oct 2025 13:52:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v7DXO-0003zg-SP; Fri, 10 Oct 2025 09:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v7DXN-0003yy-79
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 09:52:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v7DXF-0001zM-2c
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 09:52:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760104307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+ezLzMZUEvQY/Da7NbSajglqdxE0IFn3y1EU1TDDLW8=;
 b=Je1K3n4ffGkelO/0VggGiR+0h9fn3uBeHLc45y5Q4ejeCuUZZZSmeyijdykR9j1iyNaSSy
 SualUrasVY7iaxOlBAPxNQkv1JZgI/rUz75wq1Ch2jLm7mXRW0rLto+TQgKAQRUXcmLJEf
 dbxKMVB5iRCdmNoNee9BVdk87eJnJ3E=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-YceRe85gOwu0YqGt3YccCA-1; Fri, 10 Oct 2025 09:51:45 -0400
X-MC-Unique: YceRe85gOwu0YqGt3YccCA-1
X-Mimecast-MFC-AGG-ID: YceRe85gOwu0YqGt3YccCA_1760104303
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-b2f989de76eso379264266b.1
 for <qemu-arm@nongnu.org>; Fri, 10 Oct 2025 06:51:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760104303; x=1760709103;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+ezLzMZUEvQY/Da7NbSajglqdxE0IFn3y1EU1TDDLW8=;
 b=EXUSx79giYEQujBargsCQTim/93/fo0QBSMcQLsIHi/ZcjQ2NN53KTCmS3X+VAMWfC
 ZYmuZfTMJwGrHHlZk1O8vlVqHluacVMRTrbYE2WJSelf95VKPTPKr+ou+t9Ib0dYc4j1
 ewjefnz/y+wzTi+sxtEf8vAKSWgBLne4A9XYltXsrj92oy5RNAPRrzLHmL57jD5g+JzS
 oenrfYXW2O5WquZiPTkYLO3eM1Plr7R1oJW/k0QwDAQj2FfZSYOvYTsuioqMdovaHCRv
 pY86+sLMLPZQzJp7r0/TKhPUKs5u3yhWIzuzszV1N6HYkcc1E0KFFIw8sfoxnMYwCBI0
 3Nxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1vQ+lStP2q1wkD0PeSo/Ti/3v6kfcbmGvf1WcbT/RYaSI5doPqCTdAgDaCkQoWLmju34ah7y2xQ==@nongnu.org
X-Gm-Message-State: AOJu0YwLB87v2US1F8RD1MQ7TrFeh7wfoPlgYn7HrU28PPFXCfQq/eae
 Q1qkfUkB8fCNTsky4srzJaxV0aho0iqTLshxJjAdFk8cq1Dxk2El3KWc3MMOHLePt6+mJtSYN4p
 oUoinvFKfqdAbaj8KSSYsrmf5smxzThgWNA9trujwes2vClZrO3Ypew==
X-Gm-Gg: ASbGncst5i3nT5b3BAzHil3mpikjjSB38eVuVJVNRTZ/ayDZ4ZvJnpbo7pBovmfYqXs
 af7UljmDck55aq9YHXGWF/2thEW0o60msevYKhgsQAH905gVQRtLr1TslTXdExS/RkeEeIF5wMA
 9N7p1ar1PgKSABsWpwqovp35gmg8Ket9YOXehnV1QycQzsdoxqVTXIIQC6VHxvao5yY7W9sAP15
 feUnqJcIrLSrfFh2amKZuukiMui/kNtCWfe1ez3WwIfqp73jxCR/2XL7p9NzRhFDSc4YkwqgvCV
 W7plfS0CwUlE5mr+Fhi2YJR7lE4P6YlKHuYG4V5NijJMbOPh3bG0FcbroOeXuUUOEFbiwW55Bzr
 uyz6O7/9rtRUGIYCJr/Dhxg/BriXIzeMitLFxI3HAdwtk
X-Received: by 2002:a17:906:d554:b0:aff:1586:14c2 with SMTP id
 a640c23a62f3a-b50bcbe2790mr1563166366b.4.1760104303228; 
 Fri, 10 Oct 2025 06:51:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBsPYpHVvNwPaVC9ygVyhlaUiXRZP5CQvimnBAVx38VfokcnHFD3k1No6BBIA6hhtmuuLaiA==
X-Received: by 2002:a17:906:d554:b0:aff:1586:14c2 with SMTP id
 a640c23a62f3a-b50bcbe2790mr1563162466b.4.1760104302835; 
 Fri, 10 Oct 2025 06:51:42 -0700 (PDT)
Received: from [192.168.10.81] ([151.49.231.162])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b55d69dbd99sm238450166b.40.2025.10.10.06.51.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Oct 2025 06:51:42 -0700 (PDT)
Message-ID: <5e4d3a1a-ee13-40c3-b470-d68f5b6b4ad1@redhat.com>
Date: Fri, 10 Oct 2025 15:51:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/16] overall: Replace HOST_BIG_ENDIAN #ifdef with
 runtime if() check
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20251010134226.72221-1-philmd@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20251010134226.72221-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZyP6qBXT8nqs8xzhVZi2TsUGlger0UU0ZXC6EIR70kc_1760104303
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SUSPICIOUS_RECIPS=2.51,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 10/10/25 15:42, Philippe Mathieu-Daudé wrote:
> Replace compile-time #ifdef with a runtime check to ensure all code
> paths are built and tested. This reduces build-time configuration
> complexity and improves maintainability.
> 
> No functional change intended.

No need to repost (and I didn't review), but please change throughout 
the commit message to mention a *compile-time* if() check.  The code for 
the wrong endianness will not make it past compilation, and mentioning 
runtime checks left me wondering if you had mistaken HOST for TARGET.

Thanks,

Paolo

> Philippe Mathieu-Daudé (16):
>    linux-user/arm: Checkpatch style cleanups
>    linux-user/arm: Replace HOST_BIG_ENDIAN #ifdef with runtime if() check
>    ui: Replace HOST_BIG_ENDIAN #ifdef with runtime if() check
>    net: Replace HOST_BIG_ENDIAN #ifdef with runtime if() check
>    disas: Replace HOST_BIG_ENDIAN #ifdef with runtime if() check
>    hw/core/loader: Replace HOST_BIG_ENDIAN #ifdef with runtime if() check
>    hw/display: Replace HOST_BIG_ENDIAN #ifdef with runtime if() check
>    hw/virtio: Replace HOST_BIG_ENDIAN #ifdef with runtime if() check
>    target/alpha: Replace HOST_BIG_ENDIAN #ifdef with runtime if() check
>    target/arm: Replace HOST_BIG_ENDIAN #ifdef with runtime if() check
>    target/mips: Replace HOST_BIG_ENDIAN #ifdef with runtime if() check
>    target/ppc: Replace HOST_BIG_ENDIAN #ifdef with runtime if() check
>    target/riscv: Replace HOST_BIG_ENDIAN #ifdef with runtime if() check
>    target/s390x: Replace HOST_BIG_ENDIAN #ifdef with runtime if() check
>    target/sparc: Replace HOST_BIG_ENDIAN #ifdef with runtime if() check
>    util/bitmap: Replace HOST_BIG_ENDIAN #ifdef with runtime if() check
> 
>   include/hw/virtio/virtio-access.h       |   6 +-
>   include/hw/virtio/virtio-gpu-bswap.h    |   6 +-
>   target/arm/cpu.h                        |   8 +-
>   target/arm/tcg/translate-a64.h          |   5 +-
>   disas/disas-host.c                      |   6 +-
>   hw/core/loader.c                        |   5 +-
>   hw/display/artist.c                     |  12 +-
>   hw/display/vga.c                        |  20 +-
>   hw/display/virtio-gpu-gl.c              |   8 +-
>   hw/display/virtio-gpu-rutabaga.c        |   8 +-
>   hw/virtio/vhost.c                       |   7 +-
>   linux-user/arm/nwfpe/double_cpdo.c      |  12 +-
>   linux-user/arm/nwfpe/fpa11_cpdt.c       |  77 +-
>   net/net.c                               |  14 +-
>   target/alpha/translate.c                |  11 +-
>   target/arm/tcg/sve_helper.c             |  10 +-
>   target/arm/tcg/translate-sve.c          |  22 +-
>   target/arm/tcg/translate-vfp.c          |   8 +-
>   target/arm/tcg/translate.c              |   6 +-
>   target/mips/tcg/msa_helper.c            | 889 ++++++++++++------------
>   target/ppc/arch_dump.c                  |   9 +-
>   target/ppc/int_helper.c                 |  28 +-
>   target/ppc/kvm.c                        |  25 +-
>   target/riscv/vector_helper.c            |  32 +-
>   target/s390x/tcg/translate.c            |   6 +-
>   target/sparc/vis_helper.c               |  18 +-
>   ui/vdagent.c                            |  16 +-
>   ui/vnc.c                                |   6 +-
>   util/bitmap.c                           |  19 +-
>   target/ppc/translate/vmx-impl.c.inc     |  14 +-
>   target/ppc/translate/vsx-impl.c.inc     |   6 +-
>   target/riscv/insn_trans/trans_rvv.c.inc |  16 +-
>   target/s390x/tcg/translate_vx.c.inc     |   6 +-
>   tcg/ppc/tcg-target.c.inc                |  24 +-
>   34 files changed, 656 insertions(+), 709 deletions(-)
> 


