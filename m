Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4827328wrm;
        Mon, 21 Oct 2019 09:55:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy26VIOwTOW2MD3JI2RpTk7CeGvCUmGodZbcQHLyR0GKHKFClaNuHRMXSLwSJ49wZ5CYq3r
X-Received: by 2002:a05:6214:5cf:: with SMTP id t15mr17361770qvz.196.1571676929129;
        Mon, 21 Oct 2019 09:55:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571676929; cv=none;
        d=google.com; s=arc-20160816;
        b=hc+sGVBlIUwMr8L/0rZOMqAOlHT6O679t3MZ3rHxtP3YjQEP+BbZLnDYQnYee8O/LH
         ga5YOusnIrMP8l78Ekc1LTNc/8L8dK7Qn1t6u+KaWlN22vvBdD28dmM0ojrYz0yIRFMF
         vbCB4BBFPQE1TKcHpMGEomcqB2YWcH9TNiflvi1y7mM5QzEkE040lmimJ3X1hjp+CiIl
         cyl7dMc0Y9jZLeHZQNDtU0ZT77h1ZLnR/4ZQ/7keog43yKdRUFW3Kvy1RdgRqCGkJLRH
         9nCkSMBG9qAixe3x9SMU1dEByFtz3PYWr5vRPCfAdSsEaf5Y4xl/EzS2UKNPy6jkEgvi
         QneQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=9UbSfIMFuKKq3a4pLhCDfWyAOzaZGKUsvANG72m6zuc=;
        b=UMcFU+w6jBEi+R0QAHm39V6cj+RgVNMbdwRUJHMNue87kglhTK7CcgH4fJYTfccllX
         c0dR3n2qgmgy/TaHBYJESaJ0V9KWkCp6lNHeQNb4NRlv1q9R3DpC6mAXEjhAoCMZoYxN
         CGmAZG+MqLq6Jgwb2S7UBSU+P4UrxFsiTpPxY1kh2DUUs0yiI5CIBQZhzm9rUahhvXa5
         +EEetYdzrut6tk+SsoZOpnobI4VEYMTnVJ/UspiitlCPMXrAd4yTa4oV9o6vnNRnqGau
         a88VH+J8jbv79AODSxBPx0Pfvo1//nsg75ltaIMYLTyUAKO+jOvqmta6fpPeQkYel5u4
         zctQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ketX+tAL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q34si2669167qtj.306.2019.10.21.09.55.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 09:55:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ketX+tAL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMaxs-0002Ab-EQ
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 12:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40994)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iMaxi-00026l-1V
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 12:55:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iMaxf-0000hd-Tv
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 12:55:17 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:41600)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iMaxf-0000gi-Ns
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 12:55:15 -0400
Received: by mail-pl1-x642.google.com with SMTP id t10so6893901plr.8
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2019 09:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9UbSfIMFuKKq3a4pLhCDfWyAOzaZGKUsvANG72m6zuc=;
 b=ketX+tAL3vdhBlaXcv4b/4WfFeOZO/BXdSaaZGCOMzY7b7kHmB4C2HxId9EyiF8P2J
 lArRAoy7Wk9GesbLRpoWcWP0qXSaujM4hqWeaSFJdGVOVvTMfm5DR3eL/vCy0FQrjQsb
 pLoPj+go2eXn+bEFrqj457qd95+33/f61LYA90vkQpPqGlZAyd1Y6cC3HJf4H46d7Crw
 SqWxRhqcBmPUojcYnbxtm5JreDKBAnnlVZ2VptPG9dzW5Fzs22kRS2/2ckpW8KlU5r3L
 HETi1mxg9ehamnZ7odLhWmKWswvtgbIqCx7kfxo1LwC5PuMiWpsWsntUsbIP3WrKeAFD
 DpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9UbSfIMFuKKq3a4pLhCDfWyAOzaZGKUsvANG72m6zuc=;
 b=VO22q/pKmTaUqe40tVMpyHo47eExMWnO2QrJ8BshuZdhjoIsHz6kIecbIVi7auxD9D
 3QODiDLBmGQm0MBY5OmWRd4gQdP5fuvOTlFEm2WejmuFR1Lu8lSxAXvoUFypdBwNk1A/
 CbWkI06usfNca1qOcF7mgowN9BU8ESkHXAwBqP22xU2lWIn8MNsR2Cdud1DCiJFHFP+C
 704a3XGT83zuUFn+C5zkjbCr0vUJ2TYjR5w6OeAmETUAKZMaVIMyRx82eOh4EGaNiB7u
 GEEhicPZC8mAKF2P8+8tqW+oH+ABTf1B9If10o4QBP/WVst+KAQ84WFPp9nXPbIK9HYD
 bYcw==
X-Gm-Message-State: APjAAAVjE9zTBzfcDW6eoA6Fy6Q6uvAnWxaZBjGyJKQPp1gpEVJpQRpf
 9/kzSFtCYxQ7wl9FGg7tHSkRpg==
X-Received: by 2002:a17:902:8b81:: with SMTP id
 ay1mr25839552plb.79.1571676913321; 
 Mon, 21 Oct 2019 09:55:13 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id q13sm18761135pfn.150.2019.10.21.09.55.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Oct 2019 09:55:12 -0700 (PDT)
Subject: Re: [PATCH 03/21] hw/arm/collie: Create the RAM in the board
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-4-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <810674dd-6e82-5aa9-c183-f9800f87b559@linaro.org>
Date: Mon, 21 Oct 2019 09:55:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191020225650.3671-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
X-TUID: 2aqB5pxUgoez

On 10/20/19 3:56 PM, Philippe Mathieu-Daudé wrote:
> The SDRAM is incorrectly created in the SA1110 SoC.
> Move its creation in the board code, this will later allow the
> board to have the QOM ownership of the RAM.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/arm/collie.c    | 8 ++++++--
>  hw/arm/strongarm.c | 7 +------
>  hw/arm/strongarm.h | 4 +---
>  3 files changed, 8 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


