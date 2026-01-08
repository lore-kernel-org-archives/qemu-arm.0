Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD29CD14882
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Jan 2026 00:58:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vdeMF-0004YV-K1; Wed, 07 Jan 2026 19:58:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vdeMA-0004FQ-7Q
 for qemu-arm@nongnu.org; Wed, 07 Jan 2026 19:58:31 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vdeM7-0002b6-F0
 for qemu-arm@nongnu.org; Wed, 07 Jan 2026 19:58:29 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2a12ebe4b74so28227545ad.0
 for <qemu-arm@nongnu.org>; Wed, 07 Jan 2026 16:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767833906; x=1768438706; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QlPSSgauNlrXNjIGEFV++/r4mAtNMTFDarcGers0OOA=;
 b=qzIxgbpKY6tdu642JM3jQ+jUVlWW4+uvvMsuTWmD26//mmq6GkjMgIa09CVUmP7z+j
 Fg2klp264zLBYPDUJ34p2wL+k0fIIpDGTLSm7OWw7balyUgY1EF7OBEnc2plv4bmHbUq
 oSmflTlIZ3ko1DMstD54ygL1kyMOmK70PuWBfEswoZ1chbfMDT7IsvLgUVaUNMu0pKxi
 K4BC3Vkq0d/L7bJozBlI81XwkBA83Ap+y1ukSMzykHRrQpnmShRpHFOaqBlin3jsB56c
 rjO970dZUuWmDo5t4hkrJWMSWAceiat9fL+G82qFwWX13NB89UXJyPWwk/eYKY2na6NS
 gpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767833906; x=1768438706;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QlPSSgauNlrXNjIGEFV++/r4mAtNMTFDarcGers0OOA=;
 b=CK3baYmM2hr5BirWq/YFwqEycCVgR2UGlr4+UHVQMjBEgW4XYjBir0acJXCxqIjTZ8
 V1G2XIeDW3cyNwtO6DG2oQXQtXKJe1JQYNmfJt+cZSTUTKaRQUqv2KezYjzWRUn/xmen
 maDdKOSlW1AshwGrm0EJcCz0TwxROh9PBdxFj0krbMq9HgBEqsXCiOKmefYPVgcnbtSZ
 PBUpOKqamtRfS+LHHWcIWDPiwEpQjfH5r8ifXHP7BI4TMmjEgEA72S1WPG7179zxxhCk
 cLYBQktEd7sxEkbVLWJd+xLddIoz8IjKWeAxUKvLnCwhVdN8rMN3tBmql593xM/JpPzN
 lEIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgvSrbTwtjoOTGzCGivUdfCrLJ/dl4gTl38U7XNAUqWKfwnFKucxN24Py+DbDExs5MswINw7/Dcg==@nongnu.org
X-Gm-Message-State: AOJu0Ywg/5m5ebDh9nIrPIVGI6NmRElahZL/Ydf9pKXOHSvNirsuNOLK
 AOGOPZuE1FJTtD9acbqhCLj0ptqHuqhxZEEUjh6iBPzjsBClu34x+sjsNIco9W+Wt+o=
X-Gm-Gg: AY/fxX5WsBUeOnLKZoXxN05Ji3u5s0+sl5H8aikTpAZxN+XWOR2+R5h7qIVq7NdSjAL
 zDF1aGV1CQcpIqBKKlgluTAnRHQSDO4tT55deALG9OOlB16AAW/K4Yx1MRH3jPHPGaRI3wDd6cs
 ak2CGkvUpfY158ekCwTML9dw4X0RTMRYuCsSkWZI7e/rEOJKDuQ2Eo2fKHeB0A1rkgxy4yBC0vx
 dO6RggFgYKNwPxnfg0SATXviFiBh9CnDzdduNr/gYDALDhQUr8Zb0b+bdBc7X6mUHm6JWv48UMg
 U7BhoOjW2McIprUwrvVIj57+tSvbQjr+yHorQXhA1Y+1CWz86d/nPlOKc//RBNsC1CtOhWzHvTJ
 WjKCIKoSPQHbeGHHXUiyhBiEkYwnbe8G/TtGuZqOEyYz/g30HO6C1FnAszTVRh4eTJTQXfE1Z2R
 epB4h7I3GVcC2NTMJWQ4FLsH6EbJgIRnq/TGlwQ+LTx5BvTRAg+zRMG9E8
X-Google-Smtp-Source: AGHT+IHLSpoEyKSoxz3EE89zMEqcLjvEkhQNGwRfRB3tTdUBz1Ryoo4Gp2Hu59gpJSlRNb18MSH2Ag==
X-Received: by 2002:a17:902:f70e:b0:2a0:a0cc:9997 with SMTP id
 d9443c01a7336-2a3ee4b4c12mr38861615ad.50.1767833905764; 
 Wed, 07 Jan 2026 16:58:25 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3cc88c2sm60519245ad.79.2026.01.07.16.58.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jan 2026 16:58:25 -0800 (PST)
Message-ID: <bc12abcc-8140-4321-8f3a-d15b569b5544@linaro.org>
Date: Wed, 7 Jan 2026 16:58:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] accel/tcg: Unify watchpoint API
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Riku Voipio <riku.voipio@iki.fi>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>, Nicholas Piggin
 <npiggin@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@kernel.org>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>
References: <20260106231908.16756-1-philmd@linaro.org>
 <20260106231908.16756-6-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20260106231908.16756-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/6/26 3:19 PM, Philippe Mathieu-Daudé wrote:
> Currently "exec/breakpoint.h" contains both BreakPoint *and*
> WatchPoint APIs, however very few files requires the former,
> and more the latter:
> 
>    $ git grep -l CPUBreakpoint | wc -l
>          12
>    $ git grep -l CPUWatchpoint | wc -l
>          25
> 
> So extracting the WatchPoint API to its own header will reduce
> compilation pressure.
> 
> But more importantly, the API is scattered in two distinct headers.
> Unify them ("accel/tcg/cpu-ops.h" and "exec/watchpoint.h") to the
> new "accel/tcg/watchpoint.h" header, making the emphasis the API is
> specific to TCG.
> 
> Have accel/tcg/watchpoint.c absorb system/watchpoint.c code.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   MAINTAINERS                         |   1 -
>   include/accel/tcg/cpu-ops.h         |  28 +-------
>   include/accel/tcg/watchpoint.h      |  57 ++++++++++++++++
>   include/exec/breakpoint.h           |  10 ---
>   include/exec/watchpoint.h           |  18 -----
>   include/hw/core/cpu.h               |   3 +-
>   target/arm/internals.h              |   2 +-
>   target/ppc/internal.h               |   2 +-
>   target/riscv/debug.h                |   2 +-
>   accel/tcg/cputlb.c                  |   1 +
>   accel/tcg/tcg-accel-ops.c           |   2 +-
>   accel/tcg/user-exec-stub.c          |   3 +-
>   accel/tcg/watchpoint.c              |  83 +++++++++++++++++++++-
>   system/watchpoint.c                 | 102 ----------------------------
>   target/arm/debug_helper.c           |   2 +-
>   target/arm/tcg/mte_helper.c         |   2 +-
>   target/arm/tcg/sve_helper.c         |   2 +-
>   target/i386/cpu.c                   |   2 +-
>   target/i386/machine.c               |   2 +-
>   target/i386/tcg/system/bpt_helper.c |   2 +-
>   target/ppc/cpu.c                    |   2 +-
>   target/ppc/cpu_init.c               |   2 +-
>   target/riscv/cpu_helper.c           |   2 +-
>   target/riscv/debug.c                |   2 +-
>   target/s390x/helper.c               |   2 +-
>   target/s390x/tcg/debug.c            |   2 +-
>   target/s390x/tcg/excp_helper.c      |   2 +-
>   target/s390x/tcg/mem_helper.c       |   1 +
>   target/xtensa/dbg_helper.c          |   2 +-
>   system/meson.build                  |   1 -
>   30 files changed, 162 insertions(+), 182 deletions(-)
>   create mode 100644 include/accel/tcg/watchpoint.h
>   delete mode 100644 include/exec/watchpoint.h
>   delete mode 100644 system/watchpoint.c
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

