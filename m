Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp228989lfo;
        Thu, 28 Jan 2021 05:38:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyj0IEyWRyAupO8em33UG16OOiJ9oVMMLsaJa5NuqeJHcagkvWKpn+Drtg9ixHiCRMn5h/C
X-Received: by 2002:a25:ade6:: with SMTP id d38mr13863015ybe.182.1611841126674;
        Thu, 28 Jan 2021 05:38:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611841126; cv=none;
        d=google.com; s=arc-20160816;
        b=XsdqOzLxbtJDr9F5TG/pQ/GadQTmCBuLC/1dlbeipdF+a/VCQr6/sHTgcLUhqbckps
         gpQdAtMWgRBvL+SUlaLSO3yN38hK/6Fbi8HyZMAelRNx7mY9At2NzXzOCVDQTt46CZct
         ECQFQYOgjKw2hR3qgtNK+fqlaT7BlbA5F7idF4/jjr0/nF37ltUbOzn91KySDT9PBhU0
         +nN3jMUM/Zrw+Q1pZ13vra/p7Wl9M58M7RpGdxF8R/qh8L1Fl6KevOnfCnCh1w8KtZmb
         rZ8rintYEbHmr6gt87zB1PcQCsA535Kx76nOWb1XVT44Mw2wZ6Fhn67hW0fo9koYoOb8
         UBCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=wD9ei8SLrfC9L6+WgX/Gd9unIDBxq5+204UBdGveQGQ=;
        b=FFvsTfQJgQKP5vyBaquSK0eHdIg7izmMMTb8Oi1SD+9pfROvQE0mcYXSc90IQs9v6i
         gtZnLcNlXEcOOpCuEbNOqQrC9CuyfhkKmy/pRbkKQI+5iVOwXh8oiNylDNYLKZkmaoHM
         OVvwVM7kodFIppGvsiD4Rj2ujtEGrzWWDAAEihlh4TqULyY8xEqdUt09mlUt8zpyAlFx
         KMuuPVtsMuytgrpF9b+OVJvQFXO11MC4pVSBS/Yo460Q1NXl6E6xRMj38mSOQvr+Ztvt
         0n9IH1xQESvh8/lTeO2W5rE3mnqdMca8JwA7PcLDp4E/6ndyVSlOrofB8YMksWh2ePhf
         5jww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DsXfeJ+R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s127si4918603ybc.335.2021.01.28.05.38.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 05:38:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DsXfeJ+R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:52680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l57VV-0004OK-Vq
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 08:38:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l57VG-0004LR-Ew; Thu, 28 Jan 2021 08:38:31 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:44060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l57VE-0003Gu-Vm; Thu, 28 Jan 2021 08:38:30 -0500
Received: by mail-ej1-x62a.google.com with SMTP id w1so7755833ejf.11;
 Thu, 28 Jan 2021 05:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wD9ei8SLrfC9L6+WgX/Gd9unIDBxq5+204UBdGveQGQ=;
 b=DsXfeJ+RfoyH7TRVnXaykdWJQQeBKIolCBulqWFIhzEc9YipkzNxjWxg9xN0BbivkX
 urtqeHeIgYT8BFeC/Cv7zHKAcj422hbo1qVyECXKYloQNCC54PcoTngnbaQ/RgMRc6UK
 mwvALcX9SwXfxfcDpuBUr//fE4xw98c7fqddXhr61DuhIdlAn7zEWImeYXOivHO00Q1/
 p52nxsGl0ipumbxR92cxHIbj9iKJ/d3n3nWu6jhAZulth4q40t7C85vbufVEM2ikhl2z
 FNVqpuJbytYH/yjFuVZwfLlZTsa3CJ+phHdUJaefgpVm/yPAiX96eAHVb/WNm4i/8chI
 TOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wD9ei8SLrfC9L6+WgX/Gd9unIDBxq5+204UBdGveQGQ=;
 b=RBOlg2Rgxm66DUowKMW88bjuCtBBGWd1dJfHZW+nNIa8CTOVUjQuKK+Rb1RT1dJVvs
 XvsQjttLcaz+5L8YFvNmqxmDUnjZ7umC0ZfH+xlagKNwUjw3qJ96vy03c4gJWp6SwVyW
 9/ZAjg0XV5X8aco8CrwFVigQihvM6A8wbO3wuBy3HifQa/cDmUUeSHP1CT4qkwyjezdr
 io+GjTK0fdQefBjTI2oDHl2hi1/z3bFQYQTRxCTw2Zbz1p/USVQtY31EORVMPSidbLj1
 ohkBNE+bmvoV/2qaw6SOh3g7biVho+btJsV3e1mUiIS05d9LDxJv2SM3AUDLgA5V9ZF4
 rnlQ==
X-Gm-Message-State: AOAM531rH/ByDN/P94+yu1p4CgG/cqsJ64jTLcRBhnfUIhnfFZv6+wJW
 LRb0FIKoKQIfDqAZmXPqNMw=
X-Received: by 2002:a17:906:3ce:: with SMTP id
 c14mr11379722eja.497.1611841107240; 
 Thu, 28 Jan 2021 05:38:27 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id hr31sm2251528ejc.125.2021.01.28.05.38.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 05:38:26 -0800 (PST)
Subject: Re: [PATCH v2 05/25] tests: Add a simple test of the CMSDK APB dual
 timer
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210128114145.20536-1-peter.maydell@linaro.org>
 <20210128114145.20536-6-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ad1db7e7-cc50-b662-6d02-ad50f1029ea1@amsat.org>
Date: Thu, 28 Jan 2021 14:38:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210128114145.20536-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Luc Michel <luc@lmichel.fr>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PWzX15tc9CwF

On 1/28/21 12:41 PM, Peter Maydell wrote:
> Add a simple test of the CMSDK dual timer, since we're about to do
> some refactoring of how it is clocked.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Message-id: 20210121190622.22000-6-peter.maydell@linaro.org
> ---
> v1->v2 changes:
>  - phrase various clock_step() arguments as calculations
>    based on tick counts and the ns-per-tick value rather
>    than just the final numbers
>  - remove set-but-not-used QTestState *s variable
>    that gcc warns about but clang does not
>  - use 40 * 256 in test_prescale() as suggested by Luc
> ---
>  tests/qtest/cmsdk-apb-dualtimer-test.c | 130 +++++++++++++++++++++++++
>  MAINTAINERS                            |   1 +
>  tests/qtest/meson.build                |   1 +
>  3 files changed, 132 insertions(+)
>  create mode 100644 tests/qtest/cmsdk-apb-dualtimer-test.c

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
