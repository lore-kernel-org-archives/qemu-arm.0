Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4875462wrm;
        Mon, 21 Oct 2019 10:36:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzEL4jdOgGMTyXEwGrOujDDSLGPmXP6BLUZCAFUemMyRLNb/ln7jGCgrF0mNZOWJ4tF2BUW
X-Received: by 2002:ae9:e885:: with SMTP id a127mr14276046qkg.427.1571679381304;
        Mon, 21 Oct 2019 10:36:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571679381; cv=none;
        d=google.com; s=arc-20160816;
        b=wr6SBA8W/R8l6aUx7TEGBr53E44Qvn30K7eGoK/px3S1Er2oxY+hqMvYp7rx9HIagw
         JdcZJZ3Dm7138a1K1O6YmmcOq5IWfY2j2O5LI3nx+s4kS88/DFnfkm3SFdozCqpMx85g
         ldU/Aryag0LKRc0ampAUB5DfFuNtYjWw1aw1IXqrhn9OcJsnZgtrCNn0+1V6aJD3ALOb
         YDLrOHyl/P3jBSddgANfu/d1KYsyiIJpmzh00JBBiWe0mrxoQrDxrJ5CLbmF3RlivYxt
         LZDIHbL5NQetaVyinkM0vnGP7kwyY3OO77gu1XFc4ZiuUxvOMI82wqq9qKX0qHF8Z18L
         ZVAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=RfpCMPAfJ5FAZVd1/jCmUc+GumO48EkPyc2dotCRUQ4=;
        b=NK4oBTdnwW9vogZ0wxJBT9zsnXyMUH2ePzIphqhRfkAeRTS10zNqCrWhjKCnH4Fr7x
         pmImlXFCNo6GqDOnrv9sACW3mhnHxRlYFu8uhpoak0mRkawQWVuGggeW5buqQ0Wtaeqs
         Ib98F7qppdlAMtl7wsmtLieR3Q8AddzxBgjGpltXT0Z4d2UMXn0cYierrmbq0jamFOz2
         m+OAVW8ZJEn9dlTofaLM4VH937kX7e+Q9qQgU9mXhlcMnljR2TGg29hsVfKSI5Kh30an
         VFPkdYs2wnvz5xOjjxQxXAXQTfQus4XoG852Dx9JUXg2a2ntuerRUIXJPpCrBqFwkiqk
         Ce7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Dh8ox3l7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q40si12595158qtf.275.2019.10.21.10.36.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 10:36:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Dh8ox3l7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMbbQ-0005E8-LG
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 13:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46544)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iMbYz-0002g6-Eg
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 13:33:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iMbYy-0007Yd-9l
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 13:33:49 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:38057)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iMbYx-0007TM-6z
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 13:33:47 -0400
Received: by mail-pf1-x443.google.com with SMTP id h195so8844865pfe.5
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2019 10:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RfpCMPAfJ5FAZVd1/jCmUc+GumO48EkPyc2dotCRUQ4=;
 b=Dh8ox3l7+13L8v02/fylkP1K686iUgrbvTPFdq9Zb+Ks0OLpFA9k9yr2AItTZxb+kh
 +8zAygPP6HZNzLKZ2SS4/HgQ1FM0FqY59Nav2ue1FLKzsI6BTDidey7B3UwZ5icTc6tl
 Mx7nG9Mp6bRxRhKfdw9DLVLsoTIoP0nx6dxDPeVQu1bxqVeoY5GoK9NduINPqqCrpIW5
 EliSN5Q0c6mTOLYLdIyGTUjYAC+VT5hWkkRq4dWcDBgA6AKqVDGvqXZkcYL3CheVcTUF
 VKrw8TsCJ6JB9ay2roaDQznBtiinAfcKdanyCXSI7/5HiPnuQ6l622LLSgmrw56nbbrn
 E0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RfpCMPAfJ5FAZVd1/jCmUc+GumO48EkPyc2dotCRUQ4=;
 b=g1aeXe5c5bLTqIrxZrGekA5YOmsn7pZfPhMQfp8oUrawf2duUg8ZLAh6B8fA3222/J
 oGRxEU2O4XnIJByzCTra0yiVMSL0Sc851AsRHxCYJBXJoNS3E2H0RpXujV3YEKuTZq05
 Dl9HzxWuS7n8GHAFNx54J2ynTPb2m4bR5E36D07eCfsxgbXnEsALhAIWVIt/Uw0iuUai
 NK1273v3SXPb3V5l7Ph0LrlF1yXPCpQ1P9bjO4hsm5Q6KJe2iuof/6M7DcV2/OKoOTgy
 xVnKhEVu8l4zL+YnOUo8Qjc2HUbxwJz06R9kr1pgQZ7ZaljoybbmdqMy2PBgY6wfS0ou
 rHsA==
X-Gm-Message-State: APjAAAUfXAYQ3aj5dsyTtYGzC5P1seEfvBY30q/10ckaKPcpW4a8XTxS
 VCBuIR+UWJak0eL7RjtLF179Bw==
X-Received: by 2002:a17:90a:f0c5:: with SMTP id
 fa5mr29888785pjb.68.1571679217410; 
 Mon, 21 Oct 2019 10:33:37 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id 196sm18393714pfz.99.2019.10.21.10.33.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Oct 2019 10:33:36 -0700 (PDT)
Subject: Re: [PATCH 20/21] hw/sparc: Let the machine be the owner of the
 system memory
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-21-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b9bb1ef2-c02b-a1a5-f4b1-487101b793d5@linaro.org>
Date: Mon, 21 Oct 2019 10:33:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191020225650.3671-21-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
X-TUID: qhqP/QCiISvo

On 10/20/19 3:56 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/sparc/leon3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
