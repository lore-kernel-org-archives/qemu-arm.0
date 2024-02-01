Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp94016ejb;
        Thu, 1 Feb 2024 00:59:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETjhVuO36C7VmMe/Ikm/4/9A36eeOCLYUOssyIIAa/mOITYGXpNc7Jq9rMa0lQZ1Pcn0fO
X-Received: by 2002:ac8:7f15:0:b0:42a:8654:dae3 with SMTP id f21-20020ac87f15000000b0042a8654dae3mr4148422qtk.29.1706777980633;
        Thu, 01 Feb 2024 00:59:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706777980; cv=none;
        d=google.com; s=arc-20160816;
        b=uAZGWexo/6BIvcJ5aQG8PiOEbLtgS53wwwTyqxtTrxCbZ2yxq1v5eB3qGLlcD5B5Tx
         KcjpkGjQpDcQshrAQA9wiPogXOCOUy7Y2hQJby8K5AbotdXk03K0cXE13WML3s4nGgnZ
         FscObD2/pSRV8pxl91f+jcCgwxzkEDvKTJVQ5N+bYN67+YfotoFyiksXHM4FzrqdVOnr
         nq+dINvhdnfPAvaRJKS0wT0uqlVb0spQ/Zg/R/Zu8DUQIQVkT8JnDNJ/3Hp6rQJyz/vZ
         bjxXWbV3BQ/eiy075JiiMP4z1fgqpTaFZ4ljO0rTVyXKb/3x69QE/tIrzQdjPYMTBxa6
         KVLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=46aTfHzOBMWuZA5PRKaMztJA+fyye2SIsD0CIZHrpW8=;
        fh=SchOtcipP9/jiPjVfcsiDEccUV3Q7dgDgaJNFjlMKnU=;
        b=BcbRilqmjIegQKgSkfEsU8sz6Py04MhLQn2Oo2I7TA/f1SttWgWKveyZ9pFud7uA3g
         JTRYXZFxfm73GLeXaaLrdtxSy1agne5I9VwIduvoXAt9ZVnu2eT91YErzEXcLJTQ3o9g
         pZ69310lqcLIgtrzjsDr+nW0N89CzLKJvSmZTrr3Ao2wjM8CINp9Gp/liYHP0JxKxaj5
         YLcItOTNrUkXTgrPD78D3rLKLbKDO8wqyN85v7tt8xZ3XW4cLD7CXAPjMsRqy7Am2uLg
         90tU0fczQnqEfZs40qbDYTqmwE9jOsJE6QuMiXj+TO2JPrvKa/8hkqUoZr4RUDAaYZlv
         D7Bw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eh0C5+dA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=0; AJvYcCU+VV/sBllW23P/YRKm3ryT3GXtgxrmGNzzJjwYcn8AWP15+lgBZOGQu+aSIqij0UkZvNiFeJBseR6KQfdZSB8UwWiLk4yW
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g12-20020ac87f4c000000b00429e73b5c44si9729545qtk.184.2024.02.01.00.59.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Feb 2024 00:59:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eh0C5+dA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rVSuo-0004ZJ-7n; Thu, 01 Feb 2024 03:59:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rVSum-0004Y9-DY
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 03:59:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rVSuk-0003Zm-Lk
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 03:59:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706777958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=46aTfHzOBMWuZA5PRKaMztJA+fyye2SIsD0CIZHrpW8=;
 b=eh0C5+dAQMQ6r5yUaS0KMktf2lQXUp8es9r4rHbtUcn23mqIW9RhqqSOzSiuEjVsOGzD9h
 cnkrZCvznCKplh846g025nMGX9EmYHxF6UmtaLPjVTTQrH7REEuWBFwuFiCZKPK692Wm82
 I5anu1W/uP+MNMJhabdeLG6VKnoUh2Q=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-ywvePYr4Ot2Xyi9HxUlTug-1; Thu, 01 Feb 2024 03:59:14 -0500
X-MC-Unique: ywvePYr4Ot2Xyi9HxUlTug-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-51016910099so532794e87.0
 for <qemu-arm@nongnu.org>; Thu, 01 Feb 2024 00:59:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706777953; x=1707382753;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=46aTfHzOBMWuZA5PRKaMztJA+fyye2SIsD0CIZHrpW8=;
 b=IW5U0Q7aO50V/p7IsLgyKPhgBtqW5MnTJSTHg+bBXXzcBwUJjaor3+QMA0hGr+CZvt
 KcXmgqCo8lWhRYaZGRtsUj7SLtDzjMAIrIrJVNDHudgnFTWoWiahwG+NBjanaZUWoJxu
 r6QMp1VQnAd3qGjTL0Zmbcx0CL4kfBR+3qvUUL3KzxpjKmKQgv0CVXhDfbnYRC06m08p
 DZOimU4m+Zi/dGknUy3aP9NHenzWucHgv0+7UHZ+TQaD2AWAOlZ6cV5n9D//oZAz8n1o
 Aqdq1swirzwVH8p9ySRfE4OL/j9uYq02sSzhSDOcB6TJYCzmL9OVWIiZ/w0rWl0piFfL
 3D4g==
X-Gm-Message-State: AOJu0YzfRkH3gogw5XG8RVnLM7h2OMs3nBQv9dJP6hY0FwTwPaWqoNhV
 QaRd9iEFaY8bhKoVNQtfjL8E8KJy1bF5W3PJZ9lTZJ4TTvRlqDUSasKV1+UN6tYKRcmFA6sjBn3
 ELWmEkyR3tNvD/6QLr1kqGMGP4406Bxxl1oI3FL7PIBbt9t9a6Q==
X-Received: by 2002:a19:ad0c:0:b0:511:319f:82eb with SMTP id
 t12-20020a19ad0c000000b00511319f82ebmr152489lfc.43.1706777953351; 
 Thu, 01 Feb 2024 00:59:13 -0800 (PST)
X-Received: by 2002:a19:ad0c:0:b0:511:319f:82eb with SMTP id
 t12-20020a19ad0c000000b00511319f82ebmr152423lfc.43.1706777953003; 
 Thu, 01 Feb 2024 00:59:13 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-177-196.web.vodafone.de.
 [109.43.177.196]) by smtp.gmail.com with ESMTPSA id
 t12-20020a05600c450c00b0040e9f7308f4sm3803420wmo.10.2024.02.01.00.59.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 00:59:12 -0800 (PST)
Message-ID: <e3470bee-a714-4259-9bde-df9595618877@redhat.com>
Date: Thu, 1 Feb 2024 09:59:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 37/47] hw/net/lasi_i82596: Re-enable build
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Rob Herring <robh@kernel.org>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Helge Deller <deller@gmx.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Song Gao
 <gaosong@loongson.cn>, Thomas Huth <huth@tuxfamily.org>,
 Laurent Vivier <laurent@vivier.eu>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
 Jia Liu <proljc@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Bin Meng
 <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
References: <20240126173228.394202-1-dwmw2@infradead.org>
 <20240126173228.394202-38-dwmw2@infradead.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240126173228.394202-38-dwmw2@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.292,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_SBL_CSS=3.335,
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
X-TUID: Qwz3AVXsyKYb

On 26/01/2024 18.25, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> When converting to the shiny build-system-du-jour, a typo prevented the
> last_i82596 driver from being built. Correct the config option name to
> re-enable the build. And include "sysemu/sysemu.h" so it actually builds.
> 
> Fixes: b1419fa66558 ("meson: convert hw/net")
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/net/lasi_i82596.c | 1 +
>   hw/net/meson.build   | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/net/lasi_i82596.c b/hw/net/lasi_i82596.c
> index 6a3147fe2d..09e830ba5f 100644
> --- a/hw/net/lasi_i82596.c
> +++ b/hw/net/lasi_i82596.c
> @@ -14,6 +14,7 @@
>   #include "qapi/error.h"
>   #include "qemu/timer.h"
>   #include "hw/sysbus.h"
> +#include "sysemu/sysemu.h"
>   #include "net/eth.h"
>   #include "hw/net/lasi_82596.h"
>   #include "hw/net/i82596.h"
> diff --git a/hw/net/meson.build b/hw/net/meson.build
> index 9afceb0619..2b426d3d5a 100644
> --- a/hw/net/meson.build
> +++ b/hw/net/meson.build
> @@ -33,7 +33,7 @@ system_ss.add(when: 'CONFIG_MARVELL_88W8618', if_true: files('mv88w8618_eth.c'))
>   system_ss.add(when: 'CONFIG_CADENCE', if_true: files('cadence_gem.c'))
>   system_ss.add(when: 'CONFIG_STELLARIS_ENET', if_true: files('stellaris_enet.c'))
>   system_ss.add(when: 'CONFIG_LANCE', if_true: files('lance.c'))
> -system_ss.add(when: 'CONFIG_LASI_I82596', if_true: files('lasi_i82596.c'))
> +system_ss.add(when: 'CONFIG_LASI_82596', if_true: files('lasi_i82596.c'))
>   system_ss.add(when: 'CONFIG_I82596_COMMON', if_true: files('i82596.c'))
>   system_ss.add(when: 'CONFIG_SUNHME', if_true: files('sunhme.c'))
>   system_ss.add(when: 'CONFIG_FTGMAC100', if_true: files('ftgmac100.c'))

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2144

