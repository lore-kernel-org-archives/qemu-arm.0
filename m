Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4874315wrm;
        Mon, 21 Oct 2019 10:35:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz9fA16HRLMHlLXuLB6lKMbXI7mffy10sRWgMydiFl6yIgcQWopkt6UJtV+B0rn8uh+l42s
X-Received: by 2002:a17:906:2cd4:: with SMTP id r20mr22830795ejr.307.1571679319704;
        Mon, 21 Oct 2019 10:35:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571679319; cv=none;
        d=google.com; s=arc-20160816;
        b=Jbjq7I+/9RJyrHFbkjWPgBgfbHa6sAq1uQ9bkkU/LCmotne6QwLbXh2s/gcvqLDuXV
         U2jjkLHwt8RV51LoFpry95SPnANEB7RxTA6AMwpK80AaOr7j701F8Qhat6p0l4a3ItBs
         4IfBL9NTxDyceigK6+U1Olsr5gz1Q2ExLl9l/MSIEaQoSgxYebAgKvQtmIEbwSvFGchn
         xPIz1QLzM4PZ/r9ErnINNqF+50+wWGzwzCqTnIEj4idZPU508jiZTuONtOuNzzFiQzYw
         4fbtuP4A+xYJ/yirbRQlerEXY/n2LG3g3pfVCkjQfjX+f9Wi9xiwGmEoG0l/8VexIk9P
         /3wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=XQgliv5W/yujWnRU/ia+DZImKA+7XrFz78aqwlCCCLs=;
        b=MhMu2zZdZSvZWvc9JGk8F7ByaCIIb2zZeQZq4Gh2Xe5dYnDNZ2ylfrSeh9kBRgGu6R
         SXrOFF2Fc8IhQlQYJrldVxV/PDSlv+zpHCWgLCoTKSpEfYU7PvjxkyhpPz/W0KYdXn5j
         Axyd553hB42vkI8Ywfou/bBPnldVWL9Ed7l/iqDmUuK1UAjgu2McZng5lF+mOeGduP0C
         QVhD+9LvARTZYWiQKJF5nAzMt+izcxQpTiL47pwozF74QIJiYkzyAO6kHdsA13jxH07E
         ku2/bDsnMjhjZuAokDJYbytj4LJsn8a+VsP3hxrcCnaDiq8XYN1WYT7T03Udnrp46dp4
         Iyow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E2bD0PqQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kt5si9239032ejb.283.2019.10.21.10.35.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 10:35:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E2bD0PqQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMbaO-0003Zx-26
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 13:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46470)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iMbYa-0002YR-Si
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 13:33:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iMbYZ-0007OS-Kp
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 13:33:24 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:37034)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iMbYZ-0007Nb-FO
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 13:33:23 -0400
Received: by mail-pf1-x444.google.com with SMTP id y5so8845733pfo.4
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2019 10:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XQgliv5W/yujWnRU/ia+DZImKA+7XrFz78aqwlCCCLs=;
 b=E2bD0PqQ+lHzfS4tDl6X/R9xw4N3CVG4YmPVvb/jckCPfu5htExHkhTi4X0TTp3icO
 VxqFhlRYwCiDicg67FvY7M7X0xMt+RVHRirA7oTNe1FVifjdxJ2M/qhjsu6XQh5X+UR5
 mRV+bNeYHs5H+uFyFKtSjfzJSJRAphYaRAQNZHYjrt5LcL/FfVPsdTv9GpwoAx2jofF5
 Or89L3hSTxpn+UoIwvaz6sxOO3bIa8N8/a0pCsvrUhwYIPZ6n48P/C/HLOSEDoWQ1UeN
 51xt+encP9BgBNxmMxDylyIyTDmavOLDLx17vT3xJFqboXubn858DbazoqbnZuSf1uPH
 vEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XQgliv5W/yujWnRU/ia+DZImKA+7XrFz78aqwlCCCLs=;
 b=UHDKlwWGktTPjYgR6cu76uO6vLjDF7LnsPIsZhugANPoBtyRlmPf5OjLdo4E/yTXQf
 JsOp70ChCzK0eUoYVAxjlzUkH4XTnOfoAAU84CoEITg7q+rB9Ewa6+aU1sXgk1edcQBK
 U7+O0I3Jt9bSGw4Ng9cGJvTWNM/CvHTrXD+4Im5YO7tj0zRoWYvyBq5Tt+KEd27DYq1i
 vGuCyNMg+hJ3aLLI4qubihmLtf8otBoAFPrPjEx3yJ52t28kTJ0LiJTQyirkmZcQ2ICm
 euaVV/GXTRq52WaFkQsxhTdAk1NQjlBflqec9CMmWIACdysdY1rnX64vdc/yh/rCidXH
 EkWA==
X-Gm-Message-State: APjAAAXTOVpyVFLX0d6AW+klLw9aebMbh2UQ9bDEmwhqmJcJrcn+Xz+q
 D4ANyuXUoZ+Fq2g0aMqh2HrARw==
X-Received: by 2002:a63:1720:: with SMTP id x32mr9104324pgl.278.1571679201316; 
 Mon, 21 Oct 2019 10:33:21 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id p66sm18147940pfg.127.2019.10.21.10.33.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Oct 2019 10:33:20 -0700 (PDT)
Subject: Re: [PATCH 19/21] hw/ppc: Let the machine be the owner of the system
 memory
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-20-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c52898e4-f26a-58be-6765-b708e9d7e879@linaro.org>
Date: Mon, 21 Oct 2019 10:33:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191020225650.3671-20-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
X-TUID: mpSyzWaO/MCd

On 10/20/19 3:56 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/ppc/e500.c          | 3 ++-
>  hw/ppc/mac_newworld.c  | 3 ++-
>  hw/ppc/mac_oldworld.c  | 2 +-
>  hw/ppc/pnv.c           | 2 +-
>  hw/ppc/ppc405_boards.c | 6 +++---
>  hw/ppc/prep.c          | 3 ++-
>  hw/ppc/spapr.c         | 2 +-
>  hw/ppc/virtex_ml507.c  | 2 +-
>  8 files changed, 13 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
