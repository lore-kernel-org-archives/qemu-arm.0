Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp352497ejb;
        Thu, 19 Oct 2023 01:17:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE7fwrWtBIHJJX3D4rfDZxoLN9CBRMhvHWDtShdc+jU3Oiz2CQnenlLEFS+9+5wxgvgAzU
X-Received: by 2002:a0c:e80d:0:b0:65b:134:ed27 with SMTP id y13-20020a0ce80d000000b0065b0134ed27mr1875596qvn.4.1697703447492;
        Thu, 19 Oct 2023 01:17:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697703447; cv=none;
        d=google.com; s=arc-20160816;
        b=idhsb6s/RdT66kJ5YjQKFWj5payoLonJo4tYqgnG23m53RpuNdfh50QDLdNlW6j9s2
         KyODj2rf36yDmJvAHEH5DV7EH7absaGDpz1EXdj56k8s4GLJacjAb3PJb+MND8e8yQ+v
         7/SJJJ600vLvLrAANLLP7aGjaVkUxaJXLWqONluyHdZvK3STbB3Tr4Olb0DC7/SO1dze
         rWtxSlUKeH9QIBcn6CzkMaqchSqWWsaqzj70OIXQbKCZFc7WydjZSHc9XlWAVhHNhE0F
         /ZI7ISEkMJYiVZ3khbS00mDctaDnJ5gm5HM4J2vIZLVI2BzRzK8paZChLyZt9ZQBFMaG
         I9cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=NUv68ihkajytvLp247RPV7FfK0My/UAHczk9Aennr+M=;
        fh=mIJGsCCezl/E0qHOjEsRVAduFTIo6OTQPvroE0vb+p0=;
        b=yqbcaGVHFYnGF6T2NA9uqVo4njUc0cdN6n6Rl4Yk/sCFZcoynKys5ib80XU2pp4z+e
         IFPCk+a3APgR7O4duF5sh0IppYrwBk20GK2ANdzQSFGcHEhfMpti7k1AMRFhfN1k9YyA
         bqlhqwvuADug+s56lRdquBgKBziq+LSFoC0Ks8c4W/70/EUD/5FTCM/0UrNqpoan46NW
         MoX9VMOlqG4OU/RSAVPruWyLmScM/sN4v7/+gxfeyJc5QFwS6sXJuo2LDa8LSmX356CN
         wgVt1DSgQZgEHhGF3+RkjTcA33i6DGZcaKTOx8K7OlPXfP6BPAJRBvx/BjbEFItKGCcR
         zftA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qq3-20020a0562142c0300b00656467cfef8si1210220qvb.254.2023.10.19.01.17.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 01:17:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtODC-0003ow-6B; Thu, 19 Oct 2023 04:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=PA0m=GB=kaod.org=clg@ozlabs.org>)
 id 1qtODB-0003id-9b; Thu, 19 Oct 2023 04:16:57 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=PA0m=GB=kaod.org=clg@ozlabs.org>)
 id 1qtOD7-0003rc-AP; Thu, 19 Oct 2023 04:16:55 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4SB0tR5XKkz4xcL;
 Thu, 19 Oct 2023 19:16:47 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SB0tN0MPgz4xc1;
 Thu, 19 Oct 2023 19:16:43 +1100 (AEDT)
Message-ID: <cd99c52d-8232-4598-83cf-088a715a7a34@kaod.org>
Date: Thu, 19 Oct 2023 10:16:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/10] Introduce model for IBM's FSI
Content-Language: en-US
To: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org
References: <20231011151339.2782132-1-ninad@linux.ibm.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231011151339.2782132-1-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=PA0m=GB=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: ickVDibt+cDu

Hello Ninad,


On 10/11/23 17:13, Ninad Palsule wrote:
> Hello,
> 
> Please review the patch-set version 5.
> I have incorporated review comments from Cedric.
> 
> Ninad Palsule (10):
>    hw/fsi: Introduce IBM's Local bus
>    hw/fsi: Introduce IBM's scratchpad
>    hw/fsi: Introduce IBM's cfam,fsi-slave
>    hw/fsi: Introduce IBM's FSI
>    hw/fsi: IBM's On-chip Peripheral Bus
>    hw/fsi: Aspeed APB2OPB interface
>    hw/arm: Hook up FSI module in AST2600
>    hw/fsi: Added qtest
>    hw/fsi: Added FSI documentation
>    hw/fsi: Update MAINTAINER list

I made some comments, mostly on the bus models which need to be reworked.
This is code reshuffling and it should simplify the models. Please consider
reducing the amount of files.

Also, could please remove my Sob ?  I didn't write any of this, only did
quick fixes over the years because I kept the series in my aspeed tree.
And this would help me to add a Rb :)

I expect one or two respins before merge. 8.2 freeze window is in less
than 3 weeks. It could make it, else the next. No big issue since I think
we have been dragging these models for at least 5/6 years.

Thanks,

C.


> 
>   MAINTAINERS                        |   8 +
>   docs/specs/fsi.rst                 | 141 ++++++++++++
>   meson.build                        |   1 +
>   hw/fsi/trace.h                     |   1 +
>   include/hw/arm/aspeed_soc.h        |   4 +
>   include/hw/fsi/aspeed-apb2opb.h    |  33 +++
>   include/hw/fsi/cfam.h              |  58 +++++
>   include/hw/fsi/engine-scratchpad.h |  33 +++
>   include/hw/fsi/fsi-master.h        |  30 +++
>   include/hw/fsi/fsi-slave.h         |  29 +++
>   include/hw/fsi/fsi.h               |  37 +++
>   include/hw/fsi/lbus.h              |  51 +++++
>   include/hw/fsi/opb.h               |  43 ++++
>   include/qemu/bitops.h              |   6 +
>   hw/arm/aspeed_ast2600.c            |  19 ++
>   hw/fsi/aspeed-apb2opb.c            | 350 +++++++++++++++++++++++++++++
>   hw/fsi/cfam.c                      | 220 ++++++++++++++++++
>   hw/fsi/engine-scratchpad.c         |  99 ++++++++
>   hw/fsi/fsi-master.c                | 198 ++++++++++++++++
>   hw/fsi/fsi-slave.c                 |  96 ++++++++
>   hw/fsi/fsi.c                       |  54 +++++
>   hw/fsi/lbus.c                      |  87 +++++++
>   hw/fsi/opb.c                       | 185 +++++++++++++++
>   tests/qtest/fsi-test.c             | 210 +++++++++++++++++
>   hw/Kconfig                         |   1 +
>   hw/arm/Kconfig                     |   1 +
>   hw/fsi/Kconfig                     |  23 ++
>   hw/fsi/meson.build                 |   6 +
>   hw/fsi/trace-events                |  15 ++
>   hw/meson.build                     |   1 +
>   tests/qtest/meson.build            |   2 +
>   31 files changed, 2042 insertions(+)
>   create mode 100644 docs/specs/fsi.rst
>   create mode 100644 hw/fsi/trace.h
>   create mode 100644 include/hw/fsi/aspeed-apb2opb.h
>   create mode 100644 include/hw/fsi/cfam.h
>   create mode 100644 include/hw/fsi/engine-scratchpad.h
>   create mode 100644 include/hw/fsi/fsi-master.h
>   create mode 100644 include/hw/fsi/fsi-slave.h
>   create mode 100644 include/hw/fsi/fsi.h
>   create mode 100644 include/hw/fsi/lbus.h
>   create mode 100644 include/hw/fsi/opb.h
>   create mode 100644 hw/fsi/aspeed-apb2opb.c
>   create mode 100644 hw/fsi/cfam.c
>   create mode 100644 hw/fsi/engine-scratchpad.c
>   create mode 100644 hw/fsi/fsi-master.c
>   create mode 100644 hw/fsi/fsi-slave.c
>   create mode 100644 hw/fsi/fsi.c
>   create mode 100644 hw/fsi/lbus.c
>   create mode 100644 hw/fsi/opb.c
>   create mode 100644 tests/qtest/fsi-test.c
>   create mode 100644 hw/fsi/Kconfig
>   create mode 100644 hw/fsi/meson.build
>   create mode 100644 hw/fsi/trace-events
> 

