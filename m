Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4838587wrm;
        Mon, 21 Oct 2019 10:04:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwXi0OytrTQu393142ZAZWwwnfFan66C+3Zw1zboqOp1UVCirSNVNhw+saViKxBsJMi/rI/
X-Received: by 2002:a05:620a:200f:: with SMTP id c15mr22235775qka.172.1571677496827;
        Mon, 21 Oct 2019 10:04:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571677496; cv=none;
        d=google.com; s=arc-20160816;
        b=QXWpoYu7nRMuCuqfXDg1L5nUzcU4cPEBau5/gBHVSxt3G6pXwgr4VPbUCvlOUC8EG5
         YkjD1KKVt/tDRRRnSjAPMJWfiDQ9MsKAuAlYeBSw0lz0iuNnbtF0O1VWSe2f3ndiAH8S
         lqW7OPF7kWziVq53NG3gJZiHKkE9d3+e2V89ziG1Ok9yV85yUoV+BiFqLjYVMkT+CWFN
         9Tvmo0br6yMxTJetDLOi9dlFcAkiKufFVOAE6kDvThumT7m8qowoPeHZTbGkOPNTyPEA
         JhXNRzcxV18KE15bZQDOHtlOh38C/9Ko+WlbvhL5PfIaT5PvmsQzbyXeUpB5NlIDoY8v
         vsbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=sk2t83DjkVWnrtVbQf47uSIW5xeeBnZ573CRkaV10g0=;
        b=b/zBr5+hvevOXRAHNAS9n3ksxJgODE522YvvIjoQ1K2P1NDJxGayIjz1s4C+xWlnsp
         76tif4O/d7z+Ps+wqQRNcetBgkMfpPNm1aCbJ5cYIappf99XOdBopMcKnNfQTbMCWG6L
         ZoqP/EJ6eYZpdY63UnXdhuoX2pNpKL/HXt2S1jcBqPulXOOwTYDuzkaHMX1209uBImyW
         jZDUCEeqepm0FjXgnzMpixGho4XmGWtXrIY7DoWuIHjKNdTTv2zE4wgRTmxXOMpgqSba
         dbihSSemHtIeH2zUrydO4yPkH6EwskH82pssg6vT2tiSUI4rRbqXXQWJY12J770lQBDS
         ihOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=S0Ku+pq5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14si14257454qti.308.2019.10.21.10.04.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 10:04:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=S0Ku+pq5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMb71-0001Kf-IT
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 13:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42149)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iMb6l-0001GL-CI
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 13:04:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iMb6k-0004H5-EY
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 13:04:39 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:40122)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iMb6k-0004Ge-6M
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 13:04:38 -0400
Received: by mail-pf1-x441.google.com with SMTP id x127so8800135pfb.7
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2019 10:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sk2t83DjkVWnrtVbQf47uSIW5xeeBnZ573CRkaV10g0=;
 b=S0Ku+pq5NlWbBoNo2FojBvVxjVFT8KjyO0EzQ1JMqCjGJBiaOxtCYVKfj00/CDGtCL
 Ze536vX9i8Ub9XXWEcQIStEfnOAgC6GmHACwstfl94FhSkUENCiYSjH/fDgJmsTLsvYC
 lbWu/haXJqQFsa7zvliY4LI58lPWjuTsYCi/6IHSL6sb2E/C4pPXj2KSmp41tm6caG68
 WHAYktSXFRhcEb5G3SqlH7bpFFXb7EBkHeaCfVDfKwrJq+JS1XKKvaKMpV0+Y39zLnk1
 Z6RHNsjiBMNijSlizPwu9pUQXwL1qpO2ZFcuQTw+oc4TN6lJkVK+CNEg0uiuQg26qYw7
 9GCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sk2t83DjkVWnrtVbQf47uSIW5xeeBnZ573CRkaV10g0=;
 b=rUnSPFQXzkQWU/qINqOiq5nooidJ9T74RJlB7FLgrNLXc5uVT4qK9JguBVDgtGphWN
 6rJxTHD8Mj/Tg2Hp965IxsrJRpBIPvorts96LXEGkxwhEfVbly+nudNqZsrNd6KbHpXh
 MTbrNM6kMNIZRUiDFTerkraeX4hvEF8H8aGSfA+iru2mckKjaKROlApTh2on8hSPXrM2
 pC6BMfcKu0P7Nm7LB9GoAd5/ZJpB1iObtLpJGdSZFV9GdsyioLomkUh2RqbwRpRgxNG1
 F2OUihcn4ESqDL13qq+8LymGJJL80Xnfq0zm+lEKK0zhbwq/bbXug5n+2YGWQkuPyo14
 CICA==
X-Gm-Message-State: APjAAAUuJWj9lAQ0aZqALUy9BgShZPhqOGd4k6EhAVq8gVIOfD4quJ/f
 x5QsNydWNnlxsi+pXgmPaZkrDA==
X-Received: by 2002:a65:64da:: with SMTP id t26mr26521521pgv.180.1571677476828; 
 Mon, 21 Oct 2019 10:04:36 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id s3sm14619998pjq.32.2019.10.21.10.04.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Oct 2019 10:04:36 -0700 (PDT)
Subject: Re: [PATCH 06/21] hw/arm/digic4: Inline digic4_board_setup_ram()
 function
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-7-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <2c557278-8696-3e6b-31ef-00850f48a224@linaro.org>
Date: Mon, 21 Oct 2019 10:04:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191020225650.3671-7-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Paul Burton <pburton@wavecomp.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Leif Lindholm <leif.lindholm@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>, Rob Herring <robh@kernel.org>,
 Peter Maydell <peter.maydell@linaro.org>, Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 52vBH+iDUKyD

On 10/20/19 3:56 PM, Philippe Mathieu-Daudé wrote:
> Having the RAM creation code in a separate function is not
> very helpful. Move this code directly inside the board_init()
> function, this will later allow the board to have the QOM
> ownership of the RAM.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/arm/digic_boards.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
