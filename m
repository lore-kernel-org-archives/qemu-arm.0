Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp580604wri;
        Tue, 5 Nov 2019 03:20:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqysRlYk8WQOUF2XNigoqwve3HK5ZuiymO/kEX632NGBW18rsqDQFqnt6ODZnqr+KBAeTtyl
X-Received: by 2002:ac8:2d19:: with SMTP id n25mr2478228qta.144.1572952835013;
        Tue, 05 Nov 2019 03:20:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572952835; cv=none;
        d=google.com; s=arc-20160816;
        b=fGZFDeod+hft9Lv3t+JVBX0XVa6KZdqXZX1LpwPI86i1Vv2x0YR3kHwMuUa/iGTzxE
         qwlChywXoB0M8viJbR+ibp2SQc1VMYITxueinYvMVj2LohjNCKbA6zmXuXLAJNMgcvSl
         03TTu4FARtQbwJNGf8CfotYLAXxwAmFEl1EMuXcExlrD4fHZeyKN5gbZd0yyaxe6EWE/
         BdXk6irpja66ONmOUVo8MJsfpntGiGSJz0Y/F9wquni0DqlkkstlAUI7FIDHJrkKCvC9
         dRZEyUc+iW4vOWmZ28sjTwJ/CDBfSNDwktA4E/hwqioX4PR5+wI5eFeqYHRz2PKq4vl8
         jxIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=ilgO7SfmihSmTh5BQJrg1fDf0Z9tdYBptuuIxp/vml0=;
        b=0Eg5RTQ0daiud7F1huG9NW/lTcIafhlrz8zAtXQJz5EpSNfsJDs20QQiwSbagedXqc
         Y6OciOfll/K66/I6BvaL+18xeqYePhtyIFZfKr5juMm1B8F2BV9P9XwIyGRRkdsb5Inu
         8ZuSn3EVHvUEA7aVM4cJY+i0gDM9i6It5fFT8+s0aFXbkwL54nRwkNdbq81qxzY0OVVp
         j2bkk8Qn4CsCRYULomYv/3I470YBOSl3t7tp85wuy4E/yVItY6j1hSo6hPOBu2tICpn6
         Fl4jeeAMEvz3a346/S8NiH4HYzCKgMHrGad/VN4T24vo5qte//HtolM/Kzzvwq/CmavN
         2LPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mmOHbfQ0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e10si16018924qtm.276.2019.11.05.03.20.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2019 03:20:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mmOHbfQ0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iRwt0-0000Dx-HT
	for alex.bennee@linaro.org; Tue, 05 Nov 2019 06:20:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42670)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iRwsj-0000CM-Bw
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 06:20:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iRwsi-0000H2-8F
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 06:20:17 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:33639)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iRwsh-0000Bu-Vz
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 06:20:16 -0500
Received: by mail-wr1-x444.google.com with SMTP id s1so20930378wro.0
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2019 03:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ilgO7SfmihSmTh5BQJrg1fDf0Z9tdYBptuuIxp/vml0=;
 b=mmOHbfQ0tYi/Cxp5cWQ75UuwQKOk/K9YmlBacKYhwlap7L9Xev74XLI7GIJ/GLZkv3
 DhR5qcrfRW0lzFFeVFnnWXlolahuUDi2+nuUKf6O+DJz3BSYV4hH9oX0QBbojm9/N7jg
 KEsk0KyUlk9hMSIiNoPtLbEIha1ETqvl/MNbpP8eLsqZCH7lY4HLPBGrmyWB3MgoZ7qk
 vw0nmA3EURzlDFET5aMMgfkC730QNk5g5pAIxxXLrFMYx3SEnQtIrWnJw8+J3wffasJ/
 z2zVtUyEtC94L7m+LOlWpNTZUGhpFpQESfsVmVulvAjRqmnbL9TsLQIbSJyDctCY255z
 Vr6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ilgO7SfmihSmTh5BQJrg1fDf0Z9tdYBptuuIxp/vml0=;
 b=KbH16ymwhuSwmTmaVFgymjn16dp95iRESXmc78AuY6B5Qz+beo+MO42wbk4vhuOlbR
 R0OGXWqSSI9w4KC7Lg10DXWSe8Oj9RZ8VCCenpO5NKqLmnnxFZTtEkFxjO+C/DZTRvri
 zG1SzpO9EXyy9IyBMQZuuktJEww2W8+65obB6Kyp1lJaGeSlxps94nVmh/RGRhAlDYAe
 PCEcJB+fHMF1pOWcXH/ei+k82O0P40sTAkCm7E9RKj+XrBL0nvFjTPiTsqz29y7tMW9r
 9Ufz9W07cIB+9SC9NvGNdSpzUVtuxwrQXbds44PpizcpM98WLT4akQzOANKSLN2FFgJx
 vbmw==
X-Gm-Message-State: APjAAAVCo95C7ct9T9YC/hLFMbv6kMsXx5zVyvSSBucoDFbjQ5ZS1C/a
 ghgDI0cgiy3wlvoa2aQS8e1agg==
X-Received: by 2002:a5d:6706:: with SMTP id o6mr28212692wru.54.1572952814601; 
 Tue, 05 Nov 2019 03:20:14 -0800 (PST)
Received: from [192.168.8.102] (228.red-2-141-116.dynamicip.rima-tde.net.
 [2.141.116.228])
 by smtp.gmail.com with ESMTPSA id t10sm21683653wrw.23.2019.11.05.03.20.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Nov 2019 03:20:13 -0800 (PST)
Subject: Re: [PATCH] hw/arm/pxa2xx: rebuild hflags cache when modifying CPU
 state
To: Peter Maydell <peter.maydell@linaro.org>,
 Luc Michel <luc.michel@greensocs.com>
References: <20191101103232.3692818-1-luc.michel@greensocs.com>
 <CAFEAcA96tfJNVrnQzKyzooy7sJ__WKWWHXdAy_TNy=hSB_DOQQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <aff8e672-e0c7-a0f5-9c53-403a2e57524d@linaro.org>
Date: Tue, 5 Nov 2019 12:20:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA96tfJNVrnQzKyzooy7sJ__WKWWHXdAy_TNy=hSB_DOQQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IjPNB+ngsn0O

On 11/1/19 11:42 AM, Peter Maydell wrote:
> The other place that might need checking is the PSCI/etc
> code for doing CPU power on/off (and other callers to the
> power up/down functions like the imx6 power control regs).
> Richard, did you look at that code to see if it needed hflags updates?

I had a quick grovel through hw/misc/imx6_src.c and didn't see anything; was
there something more specific you were thinking of?


r~
