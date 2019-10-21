Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4822040wrm;
        Mon, 21 Oct 2019 09:49:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqypI1HUar+hEOPDK572K7WDr11Re2QW+7DoBc66gIqvqaTiIyUg1P8MheLjoIuFmaAL1hdu
X-Received: by 2002:a37:6210:: with SMTP id w16mr21545748qkb.13.1571676595929;
        Mon, 21 Oct 2019 09:49:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571676595; cv=none;
        d=google.com; s=arc-20160816;
        b=FhZFJ2ghk+6PJolmbYVtxkd8NGI72P0DL4fwIjH+EYEA/4x1l621pnK+me8oNjy+7y
         W6ufzAcl9ETlD7GikQojD6edzNTqCXrfAb+v1x3b68aqoz70o+c54+9jYhILD5l/t81r
         pXP4E48Th58fvZ/Y2B5uVGWIAN7DO2c21NhDeNymj60vj3MZFmVcP+hU/v4EdPWLiyG+
         hC1P54TQafTPF6ZXnYEyIvWaGQ2e1t5DNw/4RQjXg4CW4+4e1yumjCVmZ8ucoWQ1Xww5
         pdOnps23xnPADCKEfUbbuj+yC9kHEJ0f7l5pqbUGegGRb/DkW/b5++rG4YDBj0JcFS7+
         HjUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=/iRyJKfvIZUCUKpEt4I8a3yw43BHIcxJnELB9yQR39M=;
        b=OcbBxSdh8BjDw+IicDhpE3CCGv5ytZlRjy+V482eaMpMICLWINiE60LoJQ3EY7LOlE
         SSNSlI2FSNPrx5QeSJM+5vqnqU6AqorlPVzVNAo7kCCuC3KmNU8TgSlRP/AsqwxRa6gr
         P3L2UtDY4Vu871U+a6cvXKDPzsOWm9NpdmEi0976WbWaGCOqvH79PU1LnkiIDTWCgHS2
         xFLHrKta3yc13Mj2UZC+GjYh9pgrYIYD8J2uVxQnEeaTvD+sutO00D7YZKgw+J23oLk9
         kYBGm3wxjmdho3r3FgbD68sHwdY6NnCAsMTEujvlxZgfMopwZ1DnBo+9Kg497kxIFTHz
         nQqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oxKc1+ak;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l3si6901659qvn.81.2019.10.21.09.49.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 09:49:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oxKc1+ak;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMasV-000782-DO
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 12:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40282)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iMasN-00075p-Rz
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 12:49:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iMasM-0007XU-Tv
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 12:49:47 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:40003)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iMasM-0007X8-Nd
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 12:49:46 -0400
Received: by mail-pf1-x442.google.com with SMTP id x127so8774737pfb.7
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2019 09:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/iRyJKfvIZUCUKpEt4I8a3yw43BHIcxJnELB9yQR39M=;
 b=oxKc1+akw1KDrlwFJFHgCf1+1i/B2yFJSzpb1ARrBHT/aV3CvM+Rnieac1UEqhFZUS
 3CP87tUz/4tPg4J72Ccavzh5FLe80OB8gfyTt4zZAUgFSRd5emq7S/VV/pbyCoQMXKBV
 3jz+YMIKPB3BoGN2mQ9a8TprK6dmqTzkNTinacJm9yjazmbV4u30v5qlNYd9onicPgGj
 0A8RJp5PsmcMKlvaBRFmd9HmFz6mS27/WnaRkcciD1QzL4zNU+4Flfjuk04GehuaD82g
 OuO/8mDuGQqxk1qFiMc8RICBdkx19UKUniG+nhoWnkxN+KO7fLWdSG1zTcvjxIz4LkRw
 +HEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/iRyJKfvIZUCUKpEt4I8a3yw43BHIcxJnELB9yQR39M=;
 b=WpzJZIkhAk5F/31iFEdk+HLJs6y1jdmkZJSjA1fcw2wmXPY9xIQRjO7jzHNbIQnSJC
 oFsYs/QWXyl2p8ttDoSxjWlwiJ1urrBKg+GNNqD4ncSJxokJTErfaZ94fsyvJgePlPRF
 0MYtsbZGcgAw55JNfDzTxdN+NToSM69qBOy+lM6QMw8ZkWyK5Qt7cAXem1qtlVf4Wj/v
 ThVvdZ79TgP1ErgmH8GssGIUT24oy9GO0h0vkdU9+Y7N2pgY0J1SV2E3T2P1G964sHAu
 qMHQs4Kyr17a+HFI3aN208ceDfljr7gYML9yUUm0Aq+ASEOoZTOm8JMngU6fDDVEBcu9
 J0bA==
X-Gm-Message-State: APjAAAUWJPW0+dNfz6ugyBwJI/w2Qem/NFCmEkDNCv/4non3+nzkma4J
 xXUgoNJyl90ZH8OL4vIrfGpmkw==
X-Received: by 2002:aa7:8ad0:: with SMTP id b16mr24564153pfd.255.1571676585557; 
 Mon, 21 Oct 2019 09:49:45 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id k23sm15205671pgi.49.2019.10.21.09.49.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Oct 2019 09:49:44 -0700 (PDT)
Subject: Re: [PATCH 01/21] hw/arm/xilinx_zynq: Use the IEC binary prefix
 definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-2-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d744fa54-cd7d-fae7-74e3-63b862634ecb@linaro.org>
Date: Mon, 21 Oct 2019 09:49:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191020225650.3671-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
X-TUID: azzJOtwJPMbA

On 10/20/19 3:56 PM, Philippe Mathieu-Daudé wrote:
> IEC binary prefixes ease code review: the unit is explicit.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/arm/xilinx_zynq.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

