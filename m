Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4868000wrm;
        Mon, 21 Oct 2019 10:30:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwCJhYAJvMZmhDa033CwELU/XzKxMw5Qz1TopzRBBFw2emMUeokbzl3/HP0GL/MX/mT3wV3
X-Received: by 2002:aa7:dd0a:: with SMTP id i10mr26122587edv.189.1571679005807;
        Mon, 21 Oct 2019 10:30:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571679005; cv=none;
        d=google.com; s=arc-20160816;
        b=m7NDvueWnv1ass4C3DITu5h22k9c/zfBDql93RoIgVU3y6BoqiUu3MU4cJrVFBhimd
         3H1vLQt2DG/lsLecKkK3dxkNMLxBv7Gng9V+5MewW445lQj93Nd/A/xy2JPBTk+Zt88h
         awIwHCHoq7KVsCze/L0WWnhI33xQiK+FtU+Mvjj6DCYoLZaJM7YogyndiXrqxH8sokmC
         tncHVghnrFE0/XxHe3I9GwnBJVk+nsSBcntsusx4KamUVJQ1JJWgckgnggd+IMkZsRzJ
         CHxc2WOVeYTz3pjdraAmk/wNt9NHTkwkzWhGt8+a21Q4Nzvun9GdUnb9Srvv9tuoXKbL
         6OJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=4HT2FTM99opCdahoYoapwn01zwMDww99ofomCXHkGa8=;
        b=B9U+eN/F2yalKtVwwryqTUyq625h5+JOQmekgDri0zjK36wSSQit8JsQd8/zW1wMoi
         VwEcmTQtJMHX/xmsh5Sldx+4yK+1jYox+0u3WFb4vXPJ1PlFVXXj9PVxxWomBCh2ZcgS
         UmsTMV9/YyIDyujl9EMlHubhYKIIP07/Wu/HgQ6RBgvVJp8bwZuEXqcoIkZPY3bARReW
         gz1KMeVqHlP7JOsffvaVX3c4TNxaMhsY/Gai8vESwothpYvzss50DTR3p95+HZziWmAP
         jsyzx+wIi8b1SytMWbWZUJde0XaA+tN/MIYO+t+qtZmWuw+ZxlQ3KLGT9sbAI8mcD8Yx
         GNuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Mu4NmwZh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r9si9014894eju.10.2019.10.21.10.30.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 10:30:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Mu4NmwZh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMbVM-0007Sr-4Q
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 13:30:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45895)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iMbUo-000797-Nh
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 13:29:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iMbUn-0005tD-PV
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 13:29:30 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:42534)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iMbUn-0005su-KG
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 13:29:29 -0400
Received: by mail-pg1-x541.google.com with SMTP id f14so8199045pgi.9
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2019 10:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4HT2FTM99opCdahoYoapwn01zwMDww99ofomCXHkGa8=;
 b=Mu4NmwZhUjM3S172FnUtIzSOKdSB7DOfuxHDuVhn8LfKOYtf88ugmYULTTcGQWL/Lh
 2RfkYVmAsvPVrlEJYCJEo5NXe3xOpvnz+yvl6o93Ne7r0NGCzqqnjUrP8Fvi/mOsotxu
 bnapEsDAMytCfGisqIiyrftNz/vnYMCoEvEVyxWTd9GOfRw44FWgOnTq4cG3IgcXJHX+
 G4pn6b88VqViHy/FW3cYT+kdsNJ1eHFlHObp1Csc0ouZKlNJHpwpR2uzoZXIBM/8AUaY
 7GGIAzIKiA4l1swlaXASYKdwSxFoLpzxfo9VygYwY4fY9QBGOzJTk46ehvOT8DZ11I/v
 2E8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4HT2FTM99opCdahoYoapwn01zwMDww99ofomCXHkGa8=;
 b=chzaWjllxJQnUhorC3tBtWgOXDqES4NNppUTecMrlYHHUD4Aurd9wUu78BznQxARHX
 yjiZUkJGSlmYZeemKl7Yqna/T1ixdcHOItwppOLn69rhLw4d0t/snyYH4TkBUy9ecGpA
 ACSIJxohJhaTRSYZczwQjixEVwZpYRVt2f0AUm7znI/OgjcSIVQTMjzw4kVZQ0p83kHO
 pApbSW+TI05M1ttUxUWuj4ohr8uxoKAIt1zDK6CZcvZjxcIhXFfwiNBMz6G4BbVKIqZ/
 Dhv2acjmUU4xLuTlFlGxQv8vCJOIMO4ivfftQ7orj1m9U/FdR2IvIPv2XGRZplzdwiZB
 ciFw==
X-Gm-Message-State: APjAAAWtNx7rdbncYQwrBAIifomRHzynXGMTz6OFfVIkaBNnv75chVGB
 N2VCEqSx9usU+q+Sw7+CI/sGTw==
X-Received: by 2002:a17:90a:e987:: with SMTP id
 v7mr30561807pjy.86.1571678968649; 
 Mon, 21 Oct 2019 10:29:28 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id r18sm18954811pfc.3.2019.10.21.10.29.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Oct 2019 10:29:27 -0700 (PDT)
Subject: Re: [PATCH 14/21] hw/hppa: Let the machine be the owner of the system
 memory
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-15-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <55975ef4-2865-743a-a096-e4ede09fcb3b@linaro.org>
Date: Mon, 21 Oct 2019 10:29:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191020225650.3671-15-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
X-TUID: c/xysPhfFisJ

On 10/20/19 3:56 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/hppa/machine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
