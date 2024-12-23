Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp4161840njk;
        Mon, 23 Dec 2024 08:31:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW9P8s4K79d679kolvxkdyh9VrRgOGXR+ZFkDRhhcENIOwusuV9bPXwqUUBOuV71W+R1TbBcHAjTfHzRg==@linaro.org
X-Google-Smtp-Source: AGHT+IFIMBoRZM592vvR2sdxzUnSWWZ/XqkNoerqcCVIK+WxcfMA0LBkukBRRAYanbJPsQcaj0wW
X-Received: by 2002:a05:620a:4711:b0:7b7:106a:1986 with SMTP id af79cd13be357-7b9ba79abfemr2337202885a.27.1734971516299;
        Mon, 23 Dec 2024 08:31:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734971516; cv=none;
        d=google.com; s=arc-20240605;
        b=Ja7TNDgrBbAGlPbomeOZAtB3MFn2ssGTDsehdtRcSKxhYgkOCUP5iro1UgLWNaZliC
         Sw5NNbVYMnhplsD9C7OigBC5fQp89u06Sd7+zqLWcLuBSTAdEArHYfswKsoCxOanjOFp
         Z4N3WB/AcxQmStDwj7zqVpzddJuv9ddq05FoszHAwWrMvQtyo0dn00tAhGMc6pmSbQFa
         H6m32ZYChMpqEL0xquS4iL6kQ1TrWrT1WIdTPEy0C9jnuOtVmT7E4AET7815Z//q88Yj
         dT0sOSLc4j3dKkS408EJ7oJFrCVH/gk2Lw4GQr3/gzOZeI690mZKY0Qtnc2lQsKX0nP1
         pEXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=OshU39fkw/Sq2aeDKqOUJz1CZscFEKzAYLrz4W4krFo=;
        fh=LLXSjLbKdafVMxrExCYCRIlJiesyJQ5UhXlBH28ihAg=;
        b=A6jf/YF43cIMRbJ9arTi83tUpYBRirYSxvVBsGXBrPbCkGM7WlBgoQnUvVh+Knun3Y
         GLCRxntqUHak1o60WbiXZil2f53zlVWN+OVbHvlIFdCufDvrwx/CgbVqq3MRuY4MahW1
         VWpNTI/nv5G0dpMQ4Dokeh5NXIe+jT39rZvXHjkEr+VUsOr/lVTrcIfa+wJHxKYCQOW5
         tZiW7CkPxEiUgmH/oHij/GuR0+4j5NXW9UnMciMzwgtZU8ltIfpu1Ds28iBvTgLSpCGG
         78JJASUc6fFFg8qdr+b9aLsXLx0ntXrw7BWH70LoJrdcc2CfbIJ9VgLnoL9NIgXIvC9s
         80SQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cMcepyjM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac47867fsi1073976885a.333.2024.12.23.08.31.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Dec 2024 08:31:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cMcepyjM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tPlL4-0002VX-Nw; Mon, 23 Dec 2024 11:31:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tPlL3-0002Ux-B3
 for qemu-arm@nongnu.org; Mon, 23 Dec 2024 11:31:25 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tPlL0-0004hx-Jc
 for qemu-arm@nongnu.org; Mon, 23 Dec 2024 11:31:25 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4361dc6322fso29232245e9.3
 for <qemu-arm@nongnu.org>; Mon, 23 Dec 2024 08:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734971481; x=1735576281; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OshU39fkw/Sq2aeDKqOUJz1CZscFEKzAYLrz4W4krFo=;
 b=cMcepyjMhtCFrcdlOArVbKhtpd4eMf9/wgdTuSKhayjy9In3fhjRHia+u9VxKe7yuL
 LCo7q9xP5qI4wcN07FCFy4KxiBe05XPQnlzTwQQZM1K3obN7FOWrVsbkZH7viDeal6tA
 sT8thf4gb6XHQPnj6gVWcT3pskVVycSfQyVOJru52DZ+CZe0+K5luUbe7GyyERpRMPiQ
 rMF9fabqa3i9SQU9avZ00PrSz58vyBV9JsUu88qzhfwwN12xKxiPSsG9VoUqQGgk6v/Z
 2X8Akmwb9EhRJHhhRhe9zA1TzY/r5YOuo8nJjGN47YFV9DR3Tu+/KO4hhXNJ0mDyoEF4
 hoeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734971481; x=1735576281;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OshU39fkw/Sq2aeDKqOUJz1CZscFEKzAYLrz4W4krFo=;
 b=E8L++nNYkkFHidEIgj3J9AuFuw3dd8D1B1P4dmKh5uA1lJUD3oJgDHTDoBSEPforcD
 /eS7OuCAo5hHKDZr6LnjXBdjANJmdHTvBA5sioc+V+gQIYI9eWI7X4h/+NvJTibYCL2P
 tGwmDiA4RVPP8JVYDwWJ/0KBl30U9FkNrXMlpXHbYPWu610K81zKFIbjveKJ5NdC5r77
 FTzVXb2zlRx9QBFUjNXkzkq2HXUhdLbUdreWni142WBoDlkJ9plrOoh1XTp95/fdBKHo
 hSnvZNQeNmdgVNuMxejD8U/7+4B9AD7hipVdU5/1zW3rh6/ERM2Fdtp9mOFl/N3Z5EaZ
 7m7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnbDMEvr1/K6bV1KbggtgV5hAJ3Xk/PUXFZQttdvaeiDuS7ZdseCoWg1KIHGIkfOvrNWrAW55ZGQ==@nongnu.org
X-Gm-Message-State: AOJu0YyWF31QzzIhE/NhCGOpxreVJLbjnPjaRjNljyzKwgEKlT5e/Iyy
 Pt0eetnA3LLOBgAnNVORZnmAclVOmbNbd2ppSQk3m8glJ0E4CKIxbYdy000+jiM=
X-Gm-Gg: ASbGncurC4KjAGtV72cXLhooZcsg12zt0PxR7Egant2eZc1ohF6ZE7Q/9hcilMtZY3b
 DRZhlcgO4zID8qpkML3mUvEc7F8piuTQc+/smv3Blq0+SOtEzZsqjfur4THUrXWf1BxgbQvl1+E
 od2uGXYY0FC44TEES1A3C3OD9G4MxsMpd8+lmk2T9WVHvtdBIX8wKHUPLDmqEXu7ngh+euHcAXz
 DsWJY1cqH2AUMh+nK0ARiLnkX+AMenMsmzF6S6hrwbTPnNPGRNM7AXOnSjcxc2c49Mp1Xck53pV
 DCiwa0LCNAUxsaC6MK0=
X-Received: by 2002:a05:600c:3ca4:b0:434:fe4b:be18 with SMTP id
 5b1f17b1804b1-436686468fcmr121973355e9.18.1734971480838; 
 Mon, 23 Dec 2024 08:31:20 -0800 (PST)
Received: from [10.89.88.213] (51.171.88.92.rev.sfr.net. [92.88.171.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b0145csm175489215e9.15.2024.12.23.08.31.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Dec 2024 08:31:20 -0800 (PST)
Message-ID: <ba0226c1-1680-4f28-b575-c708a6aa82c5@linaro.org>
Date: Mon, 23 Dec 2024 17:31:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 09/15] gpex: Allow more than 4 legacy IRQs
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, stefanha@redhat.com,
 mst@redhat.com, slp@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, gaosong@loongson.cn,
 jiaxun.yang@flygoat.com, chenhuacai@kernel.org, kwolf@redhat.com,
 hreitz@redhat.com, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, akihiko.odaki@daynix.com,
 qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 balaton@eik.bme.hu, Alexander Graf <graf@amazon.com>
References: <20241218202036.80064-1-phil@philjordan.eu>
 <20241218202036.80064-10-phil@philjordan.eu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241218202036.80064-10-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ph3c7/yVT0cJ

On 18/12/24 21:20, Phil Dennis-Jordan wrote:
> From: Alexander Graf <graf@amazon.com>
> 
> Some boards such as vmapple don't do real legacy PCI IRQ swizzling.
> Instead, they just keep allocating more board IRQ lines for each new
> legacy IRQ. Let's support that mode by giving instantiators a new
> "nr_irqs" property they can use to support more than 4 legacy IRQ lines.
> In this mode, GPEX will export more IRQ lines, one for each device.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
> 
> v4:
> 
>   * Turned pair of IRQ arrays into array of structs.
>   * Simplified swizzling logic selection.
> 
> v12:
> 
>   * Fixed uses of deleted GPEX_NUM_IRQS constant that have been
>     added to QEMU since this patch was originally written.
> 
>   hw/arm/sbsa-ref.c          |  2 +-
>   hw/arm/virt.c              |  2 +-
>   hw/i386/microvm.c          |  2 +-
>   hw/loongarch/virt.c        | 12 +++++------
>   hw/mips/loongson3_virt.c   |  2 +-
>   hw/openrisc/virt.c         | 12 +++++------
>   hw/pci-host/gpex.c         | 43 ++++++++++++++++++++++++++++++--------
>   hw/riscv/virt.c            | 12 +++++------
>   hw/xen/xen-pvh-common.c    |  2 +-
>   hw/xtensa/virt.c           |  2 +-
>   include/hw/pci-host/gpex.h |  7 +++----
>   11 files changed, 61 insertions(+), 37 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

