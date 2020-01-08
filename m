Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp240611lff;
        Tue, 7 Jan 2020 19:43:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqx6Q5Frc9YQF9J0XTnwLcxXOZcyRvwMXwKm0x4qOfGSpjvbKPKiiiLq8iYzrO3wvn8sgm+y
X-Received: by 2002:ac8:2c7d:: with SMTP id e58mr1945783qta.196.1578455022177;
        Tue, 07 Jan 2020 19:43:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578455022; cv=none;
        d=google.com; s=arc-20160816;
        b=W/ICDWaZQdBdJU8sYD2clNTtsLM/4pf1rPgfvqrEyUHfD0bmUMk2fALOANIeQBsZf+
         vyXqifFZJL/5nZCIxZUmdhgyskuZaenorCmbpfoV6bJPOjm8VN9J5Y6KutMgeZq19mVb
         tZREz3OG2B4UwP+GDgnuc21P2Ch3krpRcsMGtcEVzdavXnIwH7EE1SgfPqO210oOtAxI
         J8fdL55uSlu9miP4PLfa3qRNJ4URBoNtG0hTHJko0YCEPtXLQkmjAwuaXaU/aLCyZOUt
         mecaZBHqVqAPagn1ZPaWKHo0KE/PpaP4F3cQbMNDdv2ZyUsC61zuqUOc57eh4ZBaUvIi
         to8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=n4KRq0iVYMZ1ZUExiPG20dlEc9tkNUHT9Cu9seAfTfs=;
        b=VsGnT599iwVq0D70+UYA9VxXgYUF8ws1GNXV5VoCPW0EvjcG51Nu2F3QC7FK2lM8/R
         c7xQQcyrjL00Piqs8j/nkuRBsU+AHxVfoZ+hP4ACLe0/baVsFAnhPIzukYoCzeJF+1a7
         qJsj13/MKae/MxLLjoZHeMOK6lKs7I5Iqlokmbln3Jzp86eCuhuQem9BJMyJehUNIHkj
         HhOaT47qFQECYHLa+ffbKozTtbXmFJxwkkSnG+5t/1ePsKJejSNo7KON2jnSqTSh1j78
         10kZznSC7FPvNRSBXAbw4NCmo02TzGJPsqM57/XrNy9F78CfXrveok2mUL9GLn+IAGS9
         byfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Cr2FzRNj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a26si1055272qkn.240.2020.01.07.19.43.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jan 2020 19:43:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Cr2FzRNj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ip2Fx-00012A-IE
	for alex.bennee@linaro.org; Tue, 07 Jan 2020 22:43:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46455)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ip2Fp-0000z7-HX
 for qemu-arm@nongnu.org; Tue, 07 Jan 2020 22:43:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ip2Fo-0000Z4-Fd
 for qemu-arm@nongnu.org; Tue, 07 Jan 2020 22:43:33 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:35565)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ip2Fo-0000Xl-Ad
 for qemu-arm@nongnu.org; Tue, 07 Jan 2020 22:43:32 -0500
Received: by mail-pj1-x1043.google.com with SMTP id s7so475780pjc.0
 for <qemu-arm@nongnu.org>; Tue, 07 Jan 2020 19:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n4KRq0iVYMZ1ZUExiPG20dlEc9tkNUHT9Cu9seAfTfs=;
 b=Cr2FzRNjA/Blb6c0Sinrdtr0wyaZ3cHF+c9aQ5Vq3UM4YXMeDAvUblcxvJcxjf8LeN
 QMSMvfe9rUW9636zMcwqXnS0cmiGxKOwfHBMYFJqNcaLVZx05XnzQN60U1LNio6WsLhx
 CBaSvNM00ttJplnWrqcQtDnesYdy2lpApsUuyNbRSAruLLFlCMTe4rMnTL62PirJ5V/c
 wZYuom9RW1gLGBNDiPqKqXnnfAYiPv7/EIyFJsJcyCbCfXVZc2ZHU6OZstyr5338UPAz
 y+lT//Viu8ODJ7SbEDqM+zfR/ipN2Gc/A+Bt7LJtTRQa3d4Mco+s81T25kZ7WELpcet0
 Ne3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n4KRq0iVYMZ1ZUExiPG20dlEc9tkNUHT9Cu9seAfTfs=;
 b=h805dVk4uKY519/q335dC3k7AaXuq/H4lNWO88+XXrcVu8m8x4Qasn58UczmwC0F3I
 f1EWTJVJ7O9bmurqBtE+mEsRI+4q8ohKCRbh6oBS77mrWikEDIbOxg3dOrosBcvKeHZf
 OVlPU/RZDqEY6pttSiC11zySwir4VA+EgY77FgCH4qoOd7HHaMmpsE9yfN9qHp8I1enP
 Ggx34wwkFMTKgCQ8+lcMCayhVcjnlRwWMhuZBd99UZDakNzCbg6vmVc3ff5odrwLEAyP
 4ejFWx/DWPXAkuVAGNsv5eADfNuVHzpl7/R/XPKQCoh4v/qztwqCV7z7AL8m/IwRUHnV
 B6wg==
X-Gm-Message-State: APjAAAXYqN215bECk50VoI6YwXCakE4dvUs46SNi5QEXPHjnZHcf0ryP
 uqtDaywcAlfc3wKsT3aU3DzTEw==
X-Received: by 2002:a17:90a:20aa:: with SMTP id
 f39mr2134589pjg.35.1578455010013; 
 Tue, 07 Jan 2020 19:43:30 -0800 (PST)
Received: from [192.168.15.12] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id 203sm1101880pfy.185.2020.01.07.19.43.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2020 19:43:29 -0800 (PST)
Subject: Re: [PATCH v2] arm/translate-a64: fix uninitialized variable warning
To: pannengyuan@huawei.com, peter.maydell@linaro.org
References: <20200108023915.52288-1-pannengyuan@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f024c3a8-6685-e37a-c53f-44c6116d3268@linaro.org>
Date: Wed, 8 Jan 2020 13:43:23 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200108023915.52288-1-pannengyuan@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1043
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
Cc: qemu-trivial@nongnu.org, Euler Robot <euler.robot@huawei.com>,
 qemu-arm@nongnu.org, zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OX6T9SVji74F

On 1/8/20 12:39 PM, pannengyuan@huawei.com wrote:
> From: Pan Nengyuan <pannengyuan@huawei.com>
> 
> Fixes:
> target/arm/translate-a64.c: In function 'disas_crypto_three_reg_sha512':
> target/arm/translate-a64.c:13625:9: error: 'genfn' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>     genfn(tcg_rd_ptr, tcg_rn_ptr, tcg_rm_ptr);
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> qemu/target/arm/translate-a64.c:13609:8: error: 'feature' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>     if (!feature) {
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> ---
> Changes v2 to v1:
> - add a default label to fix uninitialized warnings(suggested by Richard Henderson)
> ---
>  target/arm/translate-a64.c | 2 ++
>  1 file changed, 2 insertions(+)
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Given that you are using -O2, this should probably also be reported as a GCC bug.


r~
