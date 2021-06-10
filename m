Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp537654lfa;
        Thu, 10 Jun 2021 07:13:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGZBz0q64h7X86vTzMKCFeMvs2/s5yGCvKi2+tMBh0HU22WxzdD5egqNGHUCxa/iRkwzQV
X-Received: by 2002:a17:906:f854:: with SMTP id ks20mr4680249ejb.67.1623334434281;
        Thu, 10 Jun 2021 07:13:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623334434; cv=none;
        d=google.com; s=arc-20160816;
        b=WZAFCizex7zneJHnm2rKGy0ACTcY2h+J/CYh9ooJ13B4eOIk5FdGjRtJGKbqsxOn+e
         NSc5I8Ce+pbbMaeEhhl6qxkEy4rnkgSrYbL14lIWKTdPdRBME4hF/LLCZ6JoKbc/ULUL
         0rteUn6vfEOQtpM7gNdmmqxSWBk+9Vg8ST6KYVv5ozn3oVLiTorgDz14JahHAW5Gf4sG
         jeRerxNbuj/fbgacjN8xgPce0uL0VAguyZx/Hefuer7X0OZ21x5V1OxWictzCZIAtBmw
         6jrUCbdv0rX9rgK6s7Ot/8qnR9jXZtGhB4DOqk+2hnRew2q4GXFEBHjxV1VMfStdq0xS
         Cztg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=TGKY2F8YUqzUdh6K7kHDCawNhVib0r59ys0eKB6lFhY=;
        b=mTTGHY9gbtMuaZsV4BZtbAgbQ229k5Ysox45UwlDuZ09EKbR13v2GgWOdFTP+F4qGg
         YtW1fbd01JZbaqhjhT6TlBe1OhePotfIR92H7fkxh0iBL21Uhw2R6BtCL0ionnrFwtjS
         Bkh1SlxkeptcVfiIr1OnsA7YKaQni7+AtugPxA3HHcQLJUhOsxWHi4DRsobVf1QOlJdG
         Wvfe3tfcTmzy5zF7GAEIz1KEUqfThOKU2M4iDD8hpjFjaYf/WxZi/WnTO2BTc3seZj4c
         34z18cixrXlv8O4MrzeKG551LCzKgA1Cx7sUSUQEk+puBJwGl5xjFfiI2HkJTxA4g/6L
         v0lw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=guTqXFJp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s23si2757861ejq.347.2021.06.10.07.13.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Jun 2021 07:13:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=guTqXFJp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:40436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lrLRR-0006fm-BX
	for alex.bennee@linaro.org; Thu, 10 Jun 2021 10:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lrLRI-0006dW-Bq; Thu, 10 Jun 2021 10:13:44 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lrLRD-0004ba-R2; Thu, 10 Jun 2021 10:13:44 -0400
Received: by mail-wr1-x42d.google.com with SMTP id e11so2525815wrg.3;
 Thu, 10 Jun 2021 07:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TGKY2F8YUqzUdh6K7kHDCawNhVib0r59ys0eKB6lFhY=;
 b=guTqXFJpny9bcLDbDTEv4fEIxCVlxNjdUDPrjII4dOp8jB70HAKY67ujuOhYSOPCNn
 yW5gUiw3gKbO6fV7xbHVGAeVzN/CZ1kb105Ckkh/d3IlLKtcjb9kpRmg6151XvogSFFI
 HFFHRzeiA5rFOYpRo5fIRjJao/DHrQy2KQvc9sjw1fW4/iOthwLNuVmVtQhvvdqUXt1H
 AVHeS+kuH5bDHaoZ0zYTQIO4gKh3UBWP6zuSFskje65tV/P58wvMM1/MLj4dE1oCJrUq
 y4uI53j84Tr1c4y4C2wyPc8wfTAbWIWsCTzN+6jGYZEzmGDufL94FvPCfkkTfoB5nFKj
 hHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TGKY2F8YUqzUdh6K7kHDCawNhVib0r59ys0eKB6lFhY=;
 b=qMH97tELWihNEO55Ng2D4fuuLM1rgp5a4P5pHrzeCY+Rd3qSr82agUbQOWl6UpByG7
 xwuRP7pjedcocmKuPecqNByIp8VcuHtwFsue8K7U+JRjpwFIwlcxHLGFRbCTyHMKRxM2
 TFW6xYL4GpNCGqT95PDckNpfJolV5UF/eDK+HW3/e2zMPuU5M1ItN8dWxLBteTjbnuh1
 UFVrYtECM8m3ZTMURR/DCtyNblBfzmh+rcZy+451S10hzyv0BUqBejlq3icD2XXkWTRe
 jlM4H1FieUfZuk3htSC+lG40vCMuWLtOHbpnUvlhajSee9gF8fdu6O8CBkATpH+Ya2i7
 o2Cw==
X-Gm-Message-State: AOAM530pkgq6JdglEcuwxNflV4do5lJLCEn3kTKEnqcY+DiYFUIjoNKr
 X82hMYEzzMLZr4j/nCeKLpk=
X-Received: by 2002:a5d:54c8:: with SMTP id x8mr5823994wrv.109.1623334416637; 
 Thu, 10 Jun 2021 07:13:36 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id u12sm3780479wrr.40.2021.06.10.07.13.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 07:13:35 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Provide and use H8 and H1_8 macros
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210610132505.5827-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2a2eaa8d-5e34-9c9c-6991-baea86372b34@amsat.org>
Date: Thu, 10 Jun 2021 16:13:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210610132505.5827-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1oPDkan42Cf/

On 6/10/21 3:25 PM, Peter Maydell wrote:
> Currently we provide Hn and H1_n macros for accessing the correct
> data within arrays of vector elements of size 1, 2 and 4, accounting
> for host endianness.  We don't provide any macros for elements of
> size 8 because there the host endianness doesn't matter.  However,
> this does result in awkwardness where we need to pass empty arguments
> to macros, because checkpatch complains about them.  The empty
> argument is a little confusing for humans to read as well.
> 
> Add H8() and H1_8() macros and use them where we were previously
> passing empty arguments to macros.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is a big patch but it was basically search-n-replaced
> (not entirely automatedly, but conveniently most of the SVE
> H1_8 locations were ",     ,").
> 
> SVE ZIP, UZP, TRN also have Int128 forms. I haven't attempted
> to provide macros for that case.
> ---
>  target/arm/vec_internal.h |   8 +-
>  target/arm/sve_helper.c   | 258 +++++++++++++++++++-------------------
>  target/arm/vec_helper.c   |  14 +--
>  3 files changed, 143 insertions(+), 137 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
