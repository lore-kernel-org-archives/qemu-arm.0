Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp749958ejc;
        Fri, 26 Jan 2024 01:01:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExE1gIfbzM1dmPoAihM8ZbfWyrYT4c+V6nvJSdn3dNJupUvDtStLdcmTNL8nCfVEldIgbX
X-Received: by 2002:a05:6214:5c9:b0:686:9ea4:ad91 with SMTP id t9-20020a05621405c900b006869ea4ad91mr881868qvz.23.1706259682435;
        Fri, 26 Jan 2024 01:01:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706259682; cv=none;
        d=google.com; s=arc-20160816;
        b=lKNbKVxwdMz0+P+XT4YzXKJoZP90of2B2xpDpIy2cEddFkllEzs+PJHuMYC1BK5x4d
         l2REA+qv/95T086WWZ4W+1xkqWvxw53GcibVhUPgS1xjaXIyKTorNEF/63uNXQLtw+py
         HSg/ti6TeMtLzuXHIOcUzTnWI2H0WUwNqS/hVG3i2qVu0Fh17VmqCAIxcDNByZ97fKm7
         m43TKIlAF7Dsdbaxmjsfo6LEN6sIAU/sNBByXwGqnQKkOlX7atEmbovf/SdHl09L6Zit
         egxeKlsjmwhuDlGmh/0PcCmKMTeAmltUuaRDQvQrkNbAXQrA/rvTFRhCMP1vDzPNtaTP
         qe+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=/7feK0h8tnpeWV9NC+WV0SUuBO0mnLTRxuWh8AiVhTs=;
        fh=JKTnjfgLebdI6Uppdd2zUuo3nA3KHnzgaaV6K84+8TY=;
        b=epLLhDDGW0ND5IIWNVMUVe2g4kOn4q+diThjVLKnJsihttcN82vjwcN8Z+2HOH0ndh
         ZdOYnjK+Osh0gubJR1kjP//WgktREd81QA3vy759XGAKRlc3uP/J44Cg2AB586CWnJ15
         Cgqd+wQk1ML4t6runKN7XkPEGfjJeXl9j5UQH0pjHjQgbk/L1h/BWUfNzz87b+vrt+oe
         wed++DWsSi57KhsEaPOMYJX/sgAg1lUahpFuuxbcMCXi/XdcCFbJI9GELKlyxFvsptyS
         Z25Up0I/BTmCqJXWbOW8sRit8UUhF/7UjD+11DNVYjNU5TL17OyEA1EzgHQlQs6qOLai
         R6fw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r1-20020a0562140c8100b006817002c68esi828626qvr.574.2024.01.26.01.01.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 01:01:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rTI5H-00008V-Vh; Fri, 26 Jan 2024 04:01:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5gEp=JE=kaod.org=clg@ozlabs.org>)
 id 1rTI5F-00007i-S4; Fri, 26 Jan 2024 04:01:09 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5gEp=JE=kaod.org=clg@ozlabs.org>)
 id 1rTI5D-0000ab-SD; Fri, 26 Jan 2024 04:01:09 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TLs9s1JYBz4x5K;
 Fri, 26 Jan 2024 20:01:05 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TLs9m03Cnz4wx5;
 Fri, 26 Jan 2024 20:00:59 +1100 (AEDT)
Message-ID: <6a7c98da-c0de-4c59-9476-5b5fe17232c7@kaod.org>
Date: Fri, 26 Jan 2024 10:00:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/11] Introduce model for IBM's FSI
Content-Language: en-US
To: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@codeconstruct.com.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org
References: <20240126034026.31068-1-ninad@linux.ibm.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240126034026.31068-1-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=5gEp=JE=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ZVXvwvjt8+Gt

Hello Ninad,

On 1/26/24 04:40, Ninad Palsule wrote:
> Hello,
>   
> Please review the patch-set version 11.
> I have incorporated review comments from Cedric.
> v10:
>    - Moved aspeed-apb2opb to hw/fsi directory
>    - Split some patches.
>    - Fixed crash.
>    - make check
>      Ok:                 319
>      Expected Fail:      0
>      Fail:               0
>      Unexpected Pass:    0
>      Skipped:            9
>      Timeout:            0

I did some minor comments. v12 should be queued for upstream. I will
reorder the Signed-off (mine) trailers.

Thanks,

C.

> 
> 
> Ninad Palsule (11):
>    hw/fsi: Introduce IBM's Local bus
>    hw/fsi: Introduce IBM's scratchpad device
>    hw/fsi: Introduce IBM's FSI Bus
>    hw/fsi: Introduce IBM's fsi-slave model
>    hw/fsi: Introduce IBM's cfam
>    hw/fsi: Introduce IBM's FSI master
>    hw/fsi: Aspeed APB2OPB & On-chip peripheral bus
>    hw/arm: Hook up FSI module in AST2600
>    hw/fsi: Added qtest
>    hw/fsi: Added FSI documentation
>    hw/fsi: Update MAINTAINER list
> 
>   MAINTAINERS                     |   9 +
>   docs/specs/fsi.rst              | 138 ++++++++++++++
>   docs/specs/index.rst            |   1 +
>   meson.build                     |   1 +
>   hw/fsi/trace.h                  |   1 +
>   include/hw/arm/aspeed_soc.h     |   4 +
>   include/hw/fsi/aspeed_apb2opb.h |  46 +++++
>   include/hw/fsi/cfam.h           |  34 ++++
>   include/hw/fsi/fsi-master.h     |  32 ++++
>   include/hw/fsi/fsi.h            |  38 ++++
>   include/hw/fsi/lbus.h           |  43 +++++
>   hw/arm/aspeed_ast2600.c         |  19 ++
>   hw/fsi/aspeed_apb2opb.c         | 322 ++++++++++++++++++++++++++++++++
>   hw/fsi/cfam.c                   | 168 +++++++++++++++++
>   hw/fsi/fsi-master.c             | 170 +++++++++++++++++
>   hw/fsi/fsi.c                    | 105 +++++++++++
>   hw/fsi/lbus.c                   | 112 +++++++++++
>   tests/qtest/aspeed-fsi-test.c   | 205 ++++++++++++++++++++
>   hw/Kconfig                      |   1 +
>   hw/arm/Kconfig                  |   1 +
>   hw/fsi/Kconfig                  |   7 +
>   hw/fsi/meson.build              |   2 +
>   hw/fsi/trace-events             |  13 ++
>   hw/meson.build                  |   1 +
>   tests/qtest/meson.build         |   1 +
>   25 files changed, 1474 insertions(+)
>   create mode 100644 docs/specs/fsi.rst
>   create mode 100644 hw/fsi/trace.h
>   create mode 100644 include/hw/fsi/aspeed_apb2opb.h
>   create mode 100644 include/hw/fsi/cfam.h
>   create mode 100644 include/hw/fsi/fsi-master.h
>   create mode 100644 include/hw/fsi/fsi.h
>   create mode 100644 include/hw/fsi/lbus.h
>   create mode 100644 hw/fsi/aspeed_apb2opb.c
>   create mode 100644 hw/fsi/cfam.c
>   create mode 100644 hw/fsi/fsi-master.c
>   create mode 100644 hw/fsi/fsi.c
>   create mode 100644 hw/fsi/lbus.c
>   create mode 100644 tests/qtest/aspeed-fsi-test.c
>   create mode 100644 hw/fsi/Kconfig
>   create mode 100644 hw/fsi/meson.build
>   create mode 100644 hw/fsi/trace-events
> 

