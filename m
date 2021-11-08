Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp5605532lfv;
        Sun, 7 Nov 2021 23:53:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxiEVZTCrMmuws9UKx/MBBaXpGuYrXmgU/1KUBIkwR1RhtVJZ6UROnnrbxBzMg8vltZM4fq
X-Received: by 2002:a5d:9492:: with SMTP id v18mr11711592ioj.158.1636357987891;
        Sun, 07 Nov 2021 23:53:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636357987; cv=none;
        d=google.com; s=arc-20160816;
        b=cSCdFlmildbxGZR9v02N4m7r3mDcTNp3LAHsskwlC3yO0UMwFqk52xIY+EWYNfDOS0
         Lqh424Ya+BTzYJQjTcdXfIyEwOXF+PFt47P8/TjkBZxgjCvE9kJQXQ6RfupEZOYkWbZ9
         MMnkIGl27Tu5HclOo9b9LyGQDt0EDQlZGNUQtf5AXUojwQfuvhjWAd1wOyY7p2nRd5/d
         X3oRdfKhW9OM1nqjESvK4WDNcRzfaoB9/fhx61hjCU6qGbGKAf367HdDB3R4MRhkzuMu
         cw6+glj78UVfdnn2Lszgd5M1eq1RGkmItSOgQcxMcgkWR2S0pepAoZdCz284fEZ7e2pj
         IpLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=udnO+0cnuwdu983EbbQxyXXnZ0VVu5MXVf1aaDCHrMw=;
        b=Y1V+ZfddhxLVI78eageycnEopTEhJ+mNsKQAcMcSo84oU2hofAlOuOQNttg9vRcuYL
         +z2RgwEsoYLtVRqrybcZ3Rk+gzKISWWnUOYEoX2WD6VHFgnctmFDwPWYS4xMm0Q/WNao
         KO0L57ex6x+YCxAs3JMs99/B/TaAdHSm+b1YzPCnDkC9FXj5lr39c1xnPGJAJB2aNb+A
         /vr+NS6TXSxulrr49/XCuKiJEudWirSLkVjyBtNSZtuXExhVK5UJceJl81MDmPDu56nC
         kb7OyhESw9YGWpQnHNqAHQCoI04pciXFclY1/cP/FgUUuJZy2st5p9Fzx1R1vIy7kiFl
         XuaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=QG35dXnZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y5si31971361ill.62.2021.11.07.23.53.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Nov 2021 23:53:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=QG35dXnZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mjzSl-0002KF-9d
	for alex.bennee@linaro.org; Mon, 08 Nov 2021 02:53:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mjzRI-0001LF-W6
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 02:51:37 -0500
Received: from [2a00:1450:4864:20::429] (port=42959
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mjzRH-0003Wp-4K
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 02:51:36 -0500
Received: by mail-wr1-x429.google.com with SMTP id c4so25246177wrd.9;
 Sun, 07 Nov 2021 23:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=udnO+0cnuwdu983EbbQxyXXnZ0VVu5MXVf1aaDCHrMw=;
 b=QG35dXnZr39eK2eyeWyhQzJ0OJrYI4QXwpIUsXBi/jH0AD/Zjmlekt765C/dZ+YTim
 0KnRrAHcMPEc8NOmhleIV3CkyJG5cPjLQz5P3NRucJGX5S0qkYlzpOnBYP55UZobmzCS
 PLdze1YIV701rFIW/pJk9TASMxSeF9MUi1BxpP0rcAJGMRrTW32pSu0TIQ/TBS0vC2DO
 P7PI9xxGrFxcEaj/qBVXfmGmomGMKMUf6oXg7JpO7C4rQ2TFpyIaOli1SEUSqVY8Y37Y
 AIbERFJJsf1SlJST/bWcXMEixeqsLbgXK7ParF32SX1vB6SaBfZq0/sHo0I+CX8nqLwB
 240g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=udnO+0cnuwdu983EbbQxyXXnZ0VVu5MXVf1aaDCHrMw=;
 b=6OV3+RjpyPkgpd3R6xjML42qn3kqEA4vLc8w6NrWYC5Qc1Qn+0vnNb5gLNkRB4Ocgu
 lV/XLd98NQrSJIHQRWV5IuH8wy4FXoPqB+JunJJbF3rTUBKoZv0+63KV+610qcFnUFRu
 2wd4FV8d5RqbTtFlhjZefLVVKijwvfJV3RP58cHkUJarc+dJdkrqLGxv8QH76/ZY873H
 NxAJ5jKlmo7hN0tHAT810pIFP5AytV1Ktrka+RGRdmDSi7jWKY+RMgu7xx5mgplXOXV3
 0EcoeMPFC+oUp74b+Ybyp5WN2mEGFLmgDRWBnkT0sFG1zqTyTcuY9J2FsvtA151+0w2U
 KxaQ==
X-Gm-Message-State: AOAM53193aHbXYlm1sValEarzdV5nE4Ve1CUly6CxQTjZqhzJbn80yJY
 cSd7fCNIXbqmKlDadk7IErg=
X-Received: by 2002:a5d:6d88:: with SMTP id l8mr61417526wrs.270.1636357893578; 
 Sun, 07 Nov 2021 23:51:33 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id p2sm16752596wmq.23.2021.11.07.23.51.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Nov 2021 23:51:32 -0800 (PST)
Message-ID: <daa4049b-c6c2-1c0c-c1bd-404008c137dd@amsat.org>
Date: Mon, 8 Nov 2021 08:51:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Emulation of solo key
Content-Language: en-US
To: Niraj Sorathiya <nirajsorathiya101@gmail.com>, qemu-devel@nongnu.org
References: <CAFT0Dp1FKeLFNbKSXtgjt9FHF3awu+4ic32cAXQrrmd7Dstwbw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAFT0Dp1FKeLFNbKSXtgjt9FHF3awu+4ic32cAXQrrmd7Dstwbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.06,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alexandre Iooss <erdnaxe@crans.org>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pa+h/71X9GTK

Hi Niraj,

On 11/6/21 11:17, Niraj Sorathiya wrote:
> Hello Team,
> 
> I really need your suggestions on how I should proceed to build a
> Solo key emulator ?  Since I am new to QEMU  , I would like to know how
> I should do planing before getting into technical of QEMU
> 
> Please find all information about solo key below:
> 
> Docs: https://docs.solokeys.io/solo/building/
> <https://docs.solokeys.io/solo/building/>
> Firmware: https://github.com/solokeys/solo/
> <https://github.com/solokeys/solo/>
> Hardware: https://github.com/solokeys/solo-hw
> <https://github.com/solokeys/solo-hw>

Solo is based on the STM32L432 microcontroller.

Currently QEMU only models the STM32F family:
https://qemu-project.gitlab.io/qemu/system/arm/stm32.html

Presumably some core components could be reused for the
STM32L family.

Regards,

Phil.
