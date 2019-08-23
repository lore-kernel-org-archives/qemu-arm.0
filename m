Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp847645wrs;
        Fri, 23 Aug 2019 10:27:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy99BOKDX5gvu5Poov7Kc4V3OlxALylTtm88+lAwvYkFX3FLVytnJrg2I9j6WxoOwpFQomW
X-Received: by 2002:ac8:6688:: with SMTP id d8mr5715574qtp.141.1566581232049;
        Fri, 23 Aug 2019 10:27:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566581232; cv=none;
        d=google.com; s=arc-20160816;
        b=WbuzITazrZOii9N1MNWzcEONzk2VYWoY+5Xgm17fqe1ncQ/864FRJJlHdpOPHDhyUA
         vqJEqD94CcjF877a9B5GHOxqARiLkxfCchwiY8Iu/INvF5YMD4yoI9HvyEXz6yDdET4x
         di8Jh2NnujYoSGkBMbtFT4U7YxWiSuAgOK85oRx1y3D60WBmLhvDhFMQW0FBCY93aCbw
         UkxPpRMNjUj148aHMpQIoKCABV0RCwTEVG/MQgjNYWVjn4w1Pt0VVNcHQkQFNH49Kozx
         cME49AKF8lZT50gC1rupaRecC+G5M97j5FoMXdQ0tiLU6tonxnb/EzXD3usTj91i4U+j
         6DKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=ewZHl98JDZzEIGY2vftjUzR4hyNDpSWY/+z3/L+Ka9w=;
        b=nKAfBXunSpFFGK21rp6u71Y3HTpwa5x5LPTyQp6gbyhvpfu9odiaHIJzgIqXcukfb+
         jHorMbNhMu7Uy+B6q/SbIznNsByELNRld1z5BTJoqWBCMJAtqUlguP/FaI45NAE0zlCU
         /N1FgJ+4Kp/MXJ4wKs96DGXzntkrsHBULUctkXAvKGgiTt5B7Ei3YymamCT2sb0yXLWu
         6DoF5MT2U7kHi+VzR7g5ILiHr1p8Qp0evLuL9oEEgwjEpmbWm2KQvo2jAY53/no9rU0g
         Y1IF1aQWD56vQ8tOuN9imD0I/45CQ5g0/uNuUMelPbYFrv4htJUL2o+XeHRU4BiOODrm
         Fglg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=J6A85DVH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3si2358582qtc.272.2019.08.23.10.27.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 10:27:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=J6A85DVH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1DLD-0002Uu-GX
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 13:27:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57986)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i1DL1-0002U0-MO
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:27:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i1DL0-00045k-If
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:26:59 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:35176)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i1DL0-00045D-Ag
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:26:58 -0400
Received: by mail-pl1-x641.google.com with SMTP id gn20so5927797plb.2
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 10:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ewZHl98JDZzEIGY2vftjUzR4hyNDpSWY/+z3/L+Ka9w=;
 b=J6A85DVHuRwKAAiijhsSQq/A6NI2V5LUm1p0GFUM19BkTb/85H/D7z2jKslERHEtzj
 /NIEFUhxh46HM41eQIjtbUdu+uN4QW3FssDRAW2Xly2mDQUEkSlaGvs/+z3TZreFp0r8
 0Pt2yuhKIhyeR+CQRkMbbSj8OZuMsvegnMAw0pNYOSVhnCKtKH8R2bZVAwfhrgvAJIMm
 Ih3fUUMVt9qL694JCAfjXJxw27hcdYavJjHlP6cC1wYtjTKq5PjnQUYJzf0hNJh3ozvD
 q23tQy3qzDvOeWCfzCn1tbwAGBUWeSicDaZvmvkJ+pebrTG1txZ7iKim3A553ucJeaa0
 crrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ewZHl98JDZzEIGY2vftjUzR4hyNDpSWY/+z3/L+Ka9w=;
 b=tMrSHb1jGZqll+q4h7rieeQ+3xhvHSbMvCKDdmrrj6N1Xx32jvS8Nlzhny6awdW/aw
 lXJHFvfvMTtq65OQYICCL9xOv+EeKE9EGonmo7PaMlsV+lM+8alXuwJfylXSLJGAprOY
 IfHay7qo/8Ni6/kdjobOSthFDhLYtFQI73ueXBzYkLI/94G1SjKmgeH5Nbklm6+MSulO
 ysr3ms7GrjiDU/cvCwLXQb2Gohqbd0uFQVDNgPtRkCMKB1cpRUlmvvnVMmKC2FhVGc89
 efV62tYyvIwhg7X3x0TGPgFtaMeYQD2f9uMgrYG7JG/Lj4whqydJmXNCnl3T+X/phoIZ
 u1gg==
X-Gm-Message-State: APjAAAWYJGvEXU/Pvs64GMJEfcJpvnPLrFSgP92Q1Ax82CrRYNvYOM71
 l/D73MpFQT9VfwCiR6isWF4vlw==
X-Received: by 2002:a17:902:5c3:: with SMTP id
 f61mr5648394plf.98.1566581217473; 
 Fri, 23 Aug 2019 10:26:57 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id l123sm6688874pfl.9.2019.08.23.10.26.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Aug 2019 10:26:56 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20190823143249.8096-1-philmd@redhat.com>
 <20190823143249.8096-5-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <218d4102-32cf-6f31-6d4f-103f89edc323@linaro.org>
Date: Fri, 23 Aug 2019 10:26:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823143249.8096-5-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 4/6] hw/arm/fsl-imx: Add the
 cpu as child of the SoC object
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ptUp81hxP5j9

On 8/23/19 7:32 AM, Philippe Mathieu-Daudé wrote:
> Child properties form the composition tree. All objects need to be
> a child of another object. Objects can only be a child of one object.
> 
> Respect this with the i.MX SoC, to get a cleaner composition tree.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v2: reworded commit description with Markus suggestions
> ---
>  hw/arm/fsl-imx25.c | 4 +++-
>  hw/arm/fsl-imx31.c | 4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

