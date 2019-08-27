Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp5671359wrs;
        Tue, 27 Aug 2019 12:35:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxi7Y9xfGyQm7uIY/5qUH/jK6udPq6tsNeDeBqLlu+QN12DNxw8H/fzpODxeBKhyDaKSC0W
X-Received: by 2002:a50:ef04:: with SMTP id m4mr357783eds.155.1566934539178;
        Tue, 27 Aug 2019 12:35:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566934539; cv=none;
        d=google.com; s=arc-20160816;
        b=lLOGFjypBmvJDGtkr0YTR7jz1PgubWtb2KADTAhH6yC+/aKxInTuBTN+ge7tvDz9WA
         cg9h/Ye4q5qpYZQIDudLtfZxuVaDHeM7M1YZ5/ibKwsYTwvUQjXU9nn1BeWMu3jsV38D
         Ttxy5xTKUkLJVVtdomKScjJp6s1ubZD7XViJFCpaDd8d3CmCuTBgGveQUsQFzp5hm309
         /yb7zAUAaixij3SxM5SA/WDO2QMU8DO3/vWKRHf+gVoXZv1TUcchzFn6AjgCs5+we1pw
         stscdWN89/ajJtHqzZ+PptJNsFzVnV65evWvvpuBuhON4UgD2xnACB9iHA9/ZplUW3AS
         DpLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=LgmYJGuKyvRITK3AxYduGqwnzcFbhxsbLaPWl/PUSW4=;
        b=cxuChtWTNqCmL+FtpQ/HYrKh18eXA3Wl+WHw835zwvdd+tAw4Iy0G7cqclP5x/Q5tI
         2ouq99XQLZUkE89I6K0X32tgvsO+EdZbesQZpj/MOHGD/nk7/WUrLL/u5OK1jegkb+FZ
         yzitEV8RCCHbX/3mDhC2iBpiKeYbLT3kRAmOpHCVu/MJGf3c3XWeiCsCi0FUtqnXNXAw
         Yb3MQdZiy8O6HgJwuFWcjlSc1qNS4KXTj2ik7uUfD9O1j/kuDrXApniILAi9FP39DJ6L
         Q8xkydSIDyHHxeVKBN8R8wuqrNWGUhcz9e2IGlEoEwzqhNkNT8jDMVvUyWaI/cP4ztAu
         Xfuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gi21hO0U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u1si9187976edm.198.2019.08.27.12.35.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 12:35:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gi21hO0U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2hFi-0002Dx-7p
	for alex.bennee@linaro.org; Tue, 27 Aug 2019 15:35:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38258)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i2hFX-0002Da-QU
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 15:35:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i2hFW-0001ya-O5
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 15:35:27 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:46561)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i2hFW-0001yB-GH
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 15:35:26 -0400
Received: by mail-pf1-x442.google.com with SMTP id q139so37501pfc.13
 for <qemu-arm@nongnu.org>; Tue, 27 Aug 2019 12:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LgmYJGuKyvRITK3AxYduGqwnzcFbhxsbLaPWl/PUSW4=;
 b=gi21hO0UQEl7J1/BrDbJ2nIZLidrZnWBGhWJz+SGsNC2KsNt0wWCewtsKu+2x/QQKk
 ylzJZ/B68WeKa6GQZRMPAMDSIEFjVJPHuj5aky4e/+/FCLxUeYqo+4BjxGYZ4FMrI/xH
 M0TAETPc0tyjnBd2czsnjRTJ/UtiXA47mh6EIgIqbBcQaheOVV7Iokdc+j55zCA2WGUg
 XAd2RSD4m9aPXal08zCv21Gj4P/p91DnGW2YnOIFEn73ma6elLJQH+5340hYbHKNL4jV
 7O85BtyofJG3eAWelxvYT8mfpvp7FlUHGidyP7JDVZTRRBraapkpfGKKlAMo470TeeQP
 2qAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LgmYJGuKyvRITK3AxYduGqwnzcFbhxsbLaPWl/PUSW4=;
 b=tVelup/XJRoHC0cAMl8lNy13p99IsUFhgyABulr44wpW0SGScYOGMfO/XFLDO0PmB5
 0ttYfB/vy+hsG4XKWC+EBN4pHa5HcuwQrmZoe5x0OsHRzOTx9XJSLZUppMHEagwGMbAn
 9aFw9PBPv+01S/Db9QNrmDf+ILG5GCrdPTJCPT6FjVq03KT+CkrN0o0EGV5IEh3WdTXB
 TQ4aTkFi/3SQIiT/KC7VakgaXIR1jsQETbyRu3JrwlcieBXrW9X8RkhCCg0Ba54n4llA
 ssUI8LYxCcj3p/QUDmLIwf35VPUNP3hY0yxPpy2xwQ5dy2nPILJkxdTymq5j4r5S+jxA
 PW4Q==
X-Gm-Message-State: APjAAAUGfit8Q/4GP4Vb221n+NwDoAiMAX5GedUQNF8VLknvCw/PWBBn
 UksKhidGyDzDepbvoC+okw5oNVk7vag=
X-Received: by 2002:a17:90a:c70e:: with SMTP id
 o14mr374918pjt.56.1566934525055; 
 Tue, 27 Aug 2019 12:35:25 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id p8sm92295pfq.129.2019.08.27.12.35.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Aug 2019 12:35:24 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-22-richard.henderson@linaro.org>
 <CAFEAcA8saD6zkOA7-6nF5jQBMgKPLv0L3WXV2m0Y4WtHwVqWgw@mail.gmail.com>
 <CAFEAcA-PG1Jd2F-DLp7yKQest3aWqb3pv4FjUB9movDf4VgWgA@mail.gmail.com>
 <CAFEAcA82Y7xNbGB4BioUJ4G7kx5MT5TorF3HoRmKTqaE1eC2Qg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <82cd77dc-02b8-879f-8f33-37cc3fa9a19f@linaro.org>
Date: Tue, 27 Aug 2019 12:35:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA82Y7xNbGB4BioUJ4G7kx5MT5TorF3HoRmKTqaE1eC2Qg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-arm] [PATCH v2 21/68] target/arm: Convert Synchronization
 primitives
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
X-TUID: V/gL0y1qt4NC

On 8/27/19 4:10 AM, Peter Maydell wrote:
> On Tue, 27 Aug 2019 at 11:46, Peter Maydell <peter.maydell@linaro.org> wrote:
>> ...OK, not this specific function, as I just noticed it's the _a32
>> one, but trans_STREXB(), trans_STREXH(), etc are wrong.
> 
> I did a quick grep through for places checking the 6K condition,
> and I think these are the only ones that need changing:
> 
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index b4d53f3d37f..58e50f2d808 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -8874,7 +8874,7 @@ static bool trans_STREXD_t32(DisasContext *s,
> arg_STREX *a)
> 
>  static bool trans_STREXB(DisasContext *s, arg_STREX *a)
>  {
> -    if (!ENABLE_ARCH_6K) {
> +    if (!ENABLE_ARCH_6K && !arm_dc_feature(s, ARM_FEATURE_M)) {

Looking again, I think the correct test is

    if (s->thumb ? !ENABLE_ARCH_7 : !ENABLE_ARCH_6K)

for all of these.


r~
