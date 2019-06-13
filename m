Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp221723wrg;
        Thu, 13 Jun 2019 14:44:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwwUXa63eRJ4y0z5RU2+wlVd2Fe7Ek7XhH5hG5ddPByzEjBRJ0fDv5ty+semsMcalRSlAuw
X-Received: by 2002:a0c:b5dd:: with SMTP id o29mr5325463qvf.85.1560462282732;
        Thu, 13 Jun 2019 14:44:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560462282; cv=none;
        d=google.com; s=arc-20160816;
        b=N20Ye13zja4CfGsx1RgGXzTy/184A1K6co0+YWs6Edh4g5YPqOyNyS0DJ0l6NO+ozB
         pG53xwJZ0V7E04R5sdILGH/c9lvmzpWgcghnGWTVMXjpEQLGZciw+YIvMe387M/4Ajeu
         WIL8SgWt8La/HpKvdIriBZ2cCX63GhsJcU3zlrruBt7SUjDzvO7PTIF8KPA07uncqAix
         DeGhbYnVNQeJdi3OkCFzX1TBMZmoFgIfVGpzZ6dHPIBYJxjXoN4sT42U/lJuNKjZXTqQ
         szOUi0EXvdnwu8OMhNn8F6QpWK/8a0KZzaEkPsMP1AOV7ljc/s+AgYeeWtsgdliZpZD+
         ZSQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=p0z7URaZqQCsfktbXRSIL0pThBgVJ1cAPpGi+1vxVDE=;
        b=q9dmD7Ou7rX65GoJ8LBhwLMpzxzhhbWN5mtlRTreHJg50erY5YUM2/2A0CFi0SrXDC
         D4rp2jfDdQlly8+7+JwWgE/wjNMqiBND0vDSGVDdUiz0XyrpHPGl/hFA4griEwy8q3dD
         o05dLMxUr53kT1CBvXOmUTSgrokt9hN2iTMFuPVJHYyyDiJE7kbygI5RaWtQeb/kh/KE
         cXYf+iWcq2X6ZPiNgAjGvdADbZ2WhpaT9h8vRh84RTC+0UnTmtmzXWUi1A4nmnPfujan
         o6VdCHih48K+TOZsVwRWLsS7dksVICBR8A3ZIsQosNYVEUvVJ5hukHPdEGpeRf42UaO/
         HLog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rHWQEELo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w47si480534qth.314.2019.06.13.14.44.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 14:44:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rHWQEELo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45896 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hbXWU-00011X-9O
	for alex.bennee@linaro.org; Thu, 13 Jun 2019 17:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51715)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hbXMn-0000Qg-QQ
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 17:34:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hbXMl-0003Gc-Vu
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 17:34:41 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:43681)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hbXMl-0003Em-AG
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 17:34:39 -0400
Received: by mail-pg1-x544.google.com with SMTP id f25so228767pgv.10
 for <qemu-arm@nongnu.org>; Thu, 13 Jun 2019 14:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p0z7URaZqQCsfktbXRSIL0pThBgVJ1cAPpGi+1vxVDE=;
 b=rHWQEELoHAUZ4Tl2RIVroKspc3W5nkysrcIEKoO+Rn3q3wlwGfs33s3Dvzx4tAgtPD
 YUKGtMr5gJWbOTRJSpeZq4ONKWPMp2c1E0rscM0+qpQCEBO6H1BT8bb8tc0JOCFVahTv
 PMgz0SILzVnfR7yQt9iRoYjAwWmn+f+1CqIPUHyS5Upuq1Ft7J9kIPpXslZLvbtTw2HC
 ycBTR4IYAgN/CQIgVnxL6u8i65AulQxaBc5gJDPPOIfK3roBYcT0AgYfcZ2lLsfqcO50
 HGKmYbYEHfvgnk9H8STGPq4txx/45UC0GhL5S5hfgoj3ONsnVpkUZaAWCDs8Gui+0St4
 3jWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p0z7URaZqQCsfktbXRSIL0pThBgVJ1cAPpGi+1vxVDE=;
 b=muzf4ko1HuEfv42J2v3X5MxsYdCkscWzT/FaR/0utZbH7uGeD625qAx2WOuqByNNnH
 OqG6EaIocptkLhsBdayTHwYgIl23PLLR/Mz49buDz1UWXJoDyJKRmZzDP2WuQoR+xtqH
 9b8XTZTaIuGX1N6ehW6YN24y+TOT1BM6ItslA8J6nameNcE52fzN2pf3KIWqo489y3m+
 rBRT6ZXEG9N2hJVhk9BlvMlnH01knkW0OTd29Dm7VOb9Cl0CEVsrHan5c7ed9HQVIuDL
 INRWKGiwNWVd7VOkauCAd49nMkSLAeP5wepj/VLRKiMyKwHK7NhuUNZnG7yVhdt0EJ8n
 TD3w==
X-Gm-Message-State: APjAAAU81dsK5/x4o76DbKWTVydXyR2j8txFH4AxdHwtiVzbPj6XOs8j
 HbWSwk0dobm27n6a+b1gvmsVmA==
X-Received: by 2002:a17:90a:dd45:: with SMTP id
 u5mr7328659pjv.109.1560461677806; 
 Thu, 13 Jun 2019 14:34:37 -0700 (PDT)
Received: from [10.10.150.239] ([149.199.65.200])
 by smtp.gmail.com with ESMTPSA id y12sm699112pgi.10.2019.06.13.14.34.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 14:34:37 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190613163917.28589-1-peter.maydell@linaro.org>
 <20190613163917.28589-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <bdcc8e54-7eea-9100-9c7b-b114fb159b1f@linaro.org>
Date: Thu, 13 Jun 2019 14:34:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613163917.28589-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-arm] [PATCH 11/12] target/arm: Stop using deprecated
 functions in NEON_2RM_VCVT_F32_F16
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ydvzK9a0CU95

On 6/13/19 9:39 AM, Peter Maydell wrote:
> Remove some old constructns from NEON_2RM_VCVT_F16_F32 code:
>  * don't use CPU_F0s
>  * don't use tcg_gen_st_f32
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 26 +++++++++++---------------
>  1 file changed, 11 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

