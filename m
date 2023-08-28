Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp2857305ejc;
        Mon, 28 Aug 2023 01:50:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJovi0usWrWlmsCXn2NIKyGeY0+7oAdIhnh8z/QoAHOIi+vzD5/t9gViog8ImdhmXrq4wp
X-Received: by 2002:a05:620a:103a:b0:76c:af3e:3c14 with SMTP id a26-20020a05620a103a00b0076caf3e3c14mr22144101qkk.71.1693212645779;
        Mon, 28 Aug 2023 01:50:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693212645; cv=none;
        d=google.com; s=arc-20160816;
        b=LV3AguEXI/7TFrKZPTZNH1qy+WswqAR5IlJtvcZ1kimvRAfX9BPoM6tbZqJAA8EyIG
         FfCMLZEn5ZfeDTqj4aRQHrG+MBdinfoMecyPsK/MKcxesnx97mDEOJd5A4IthxD3cnuE
         jOUozQHngGxOggy2AlkMMDDVMdMXaut0Sj4meUGdI6gYroN/8+51VCIlaGMheIm/hZmm
         WCTWFa/E62Y7C9o7JfUQASa8jG93zTzaI3ujc/7juscDoSIzasyTEmC32b3jNkmPpxmL
         Qinr4nXsdVTFrr9fkTiM55Yz6w2OU5BMJ40y5Egsj1M5Yb4TBP7NxChypcrOvClGeQw+
         7sIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=e2dQ0vwNgqhgKIAWSGDoU9F5Kwe1SmrAhKZRbiYbZeA=;
        fh=THmizU0cEXPV0Zv8aVTr5yJMH8Jn9b7paAGGAD4MGl4=;
        b=hGyIPLbujCcDQ3YKvzAqxd7PLXcpQNTbZ4BVT2lu6KVVeA2zrTHXbPYqtSNtlVeLCi
         Pq7im0+3C5zzhHp+AUCItWPDswNChQ/87eZtMsQru3mm6BcxkFqAWlD7h4J03onrRUcn
         E9ZKO0fGAVbX8Q/D3LaalNWXhP2rkDB4FerWPePlRr1Hcv+kDLOyowh/er7oicGWKjYp
         BJUNitxAB2aUb80sisOO1o7GiNg5cQfxrOJABevl9UQD6KQis0fT03UkEGNmqUf28wJA
         5uf2Whzv752ghUQ5fteO+/C+1SdwhHqLg9FhlIpaXTBryF+WKzMKrozDCQHjIUBW0V6K
         sN5g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id sn5-20020a05620a948500b0076d9bb748a2si1743909qkn.216.2023.08.28.01.50.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Aug 2023 01:50:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qaXx3-00047v-Qj; Mon, 28 Aug 2023 04:50:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=DaUQ=EN=kaod.org=clg@ozlabs.org>)
 id 1qaXx1-00047N-3R; Mon, 28 Aug 2023 04:50:23 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=DaUQ=EN=kaod.org=clg@ozlabs.org>)
 id 1qaXwy-0000lf-7V; Mon, 28 Aug 2023 04:50:22 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4RZ44t45D1z4wy0;
 Mon, 28 Aug 2023 18:50:06 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RZ44q0pC2z4wZJ;
 Mon, 28 Aug 2023 18:50:02 +1000 (AEST)
Message-ID: <587b23ee-4247-c142-9ced-6abd92922b2d@kaod.org>
Date: Mon, 28 Aug 2023 10:49:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 0/7] Introduce model for IBM's FSP
Content-Language: en-US
To: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org
Cc: qemu-arm@nongnu.org
References: <20230825203046.3692467-1-ninad@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230825203046.3692467-1-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=DaUQ=EN=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.414, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: V3qPwhmKpKFI

Hello Ninad,

On 8/25/23 22:30, Ninad Palsule wrote:
> Hello,
> 
> Please review the patch-set.
> 
> This is a first step towards introducing model for IBM's Flexible
> Service Interface. The full functionality will be implemented over the
> time.
> 
> Ninad Palsule (7):
>    hw/fsi: Introduce IBM's Local bus
>    hw/fsi: Introduce IBM's scratchpad
>    hw/fsi: Introduce IBM's cfam,fsi-slave
>    hw/fsi: Introduce IBM's FSI
>    hw/fsi: IBM's On-chip Peripheral Bus
>    hw/fsi: Aspeed APB2OPB interface
>    hw/arm: Hook up FSI module in AST2600
> 
>   hw/Kconfig                         |   1 +
>   hw/arm/Kconfig                     |   1 +
>   hw/arm/aspeed_ast2600.c            |  15 ++
>   hw/fsi/Kconfig                     |  23 ++
>   hw/fsi/aspeed-apb2opb.c            | 346 +++++++++++++++++++++++++++++
>   hw/fsi/cfam.c                      | 236 ++++++++++++++++++++
>   hw/fsi/engine-scratchpad.c         | 100 +++++++++
>   hw/fsi/fsi-master.c                | 202 +++++++++++++++++
>   hw/fsi/fsi-slave.c                 | 109 +++++++++
>   hw/fsi/fsi.c                       |  54 +++++
>   hw/fsi/lbus.c                      |  94 ++++++++
>   hw/fsi/meson.build                 |   6 +
>   hw/fsi/opb.c                       | 194 ++++++++++++++++
>   hw/fsi/trace-events                |   2 +
>   hw/fsi/trace.h                     |   1 +
>   hw/meson.build                     |   1 +
>   include/hw/arm/aspeed_soc.h        |   4 +
>   include/hw/fsi/aspeed-apb2opb.h    |  32 +++
>   include/hw/fsi/bits.h              |  15 ++
>   include/hw/fsi/cfam.h              |  59 +++++
>   include/hw/fsi/engine-scratchpad.h |  32 +++
>   include/hw/fsi/fsi-master.h        |  30 +++
>   include/hw/fsi/fsi-slave.h         |  29 +++
>   include/hw/fsi/fsi.h               |  35 +++
>   include/hw/fsi/lbus.h              |  57 +++++
>   include/hw/fsi/opb.h               |  45 ++++
>   meson.build                        |   1 +

Thanks for creating a series for these models.

I think the commit logs have a lot of useful information which would
be good for some docs/specs/ file. Please add a need a entry in
MAINTAINERS for this new bus model.
  
Tests are *very* much welcome also. Ideally we should have a couple
in qtest. A minimum would be an avocado test running pdbg.

Thanks,

C.



>   27 files changed, 1724 insertions(+)
>   create mode 100644 hw/fsi/Kconfig
>   create mode 100644 hw/fsi/aspeed-apb2opb.c
>   create mode 100644 hw/fsi/cfam.c
>   create mode 100644 hw/fsi/engine-scratchpad.c
>   create mode 100644 hw/fsi/fsi-master.c
>   create mode 100644 hw/fsi/fsi-slave.c
>   create mode 100644 hw/fsi/fsi.c
>   create mode 100644 hw/fsi/lbus.c
>   create mode 100644 hw/fsi/meson.build
>   create mode 100644 hw/fsi/opb.c
>   create mode 100644 hw/fsi/trace-events
>   create mode 100644 hw/fsi/trace.h
>   create mode 100644 include/hw/fsi/aspeed-apb2opb.h
>   create mode 100644 include/hw/fsi/bits.h
>   create mode 100644 include/hw/fsi/cfam.h
>   create mode 100644 include/hw/fsi/engine-scratchpad.h
>   create mode 100644 include/hw/fsi/fsi-master.h
>   create mode 100644 include/hw/fsi/fsi-slave.h
>   create mode 100644 include/hw/fsi/fsi.h
>   create mode 100644 include/hw/fsi/lbus.h
>   create mode 100644 include/hw/fsi/opb.h
> 

