Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3211941lfg;
        Sun, 28 Feb 2021 19:14:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYCQYBgqlkwepQvgNOQcQIxxJi736Rxoo5JUs9+xv4NEfEyp6Ocr6iqqgBhOC3ziQEmxgU
X-Received: by 2002:a92:b70a:: with SMTP id k10mr11321756ili.23.1614568490847;
        Sun, 28 Feb 2021 19:14:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614568490; cv=none;
        d=google.com; s=arc-20160816;
        b=pNWHZirNC2G9o612yYrgdt8V0P8leWKDINGL7sI1AGBHQWDqD/Kk02xFJsV/FL2a4L
         XgdcLsIKl/uc8YbE6uewFEgmOju+vzhkBZ+p7wIzHNRBEwL2jRqL/BfeaJiMdd9h1Sqj
         ek5Dzbg5PQ2XaEenbApWOL+DL6K0huYU4aLJXmujZke9QZUjUBxw06q9H2MvG+ag5FYp
         f5DpaNI6h8k3DeqVvV7n49IBwtStQ+hekR869YAyox4gDZMGge07lb9EVsKi377s7nRV
         TNuavFXjQmw6bhQQtw+5Xesbr1SibUvrgQ+kT3fgB225lB55aoVaZUiaB2w8hkvTyJke
         WDKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=5sXuT9U0OZtBJIA+BNIFxAaQwnORxOI+ahqWUDy3kZM=;
        b=0/TDeY42E/kNHewK+MDO9VC6+CEuTS4ngJRSkMTwEhGDkiVC5vG9Bu+hsSyJsM/L/j
         sKAWiR/Mhu55sB893jDS3gEQ/zlEucrSUAdiWdmS+h/qsWkBUtOFYVIs4sAzt4ah45jt
         JaRkm+RShURHAm+9nDIIgcqyHGeZ1LcOXTZSOWBvzkt5aLr7FzrqzuK0egjnDW9eGDwO
         cuCIKrV5BU66ZCpETSusrDwLyGMl0dB5wMcjtdIdA46FdF/vXbbU7Ege/JoQ5jbYVek9
         zeA9/SupErDKjdFN2pDAPx2+7ZDBPGHZJQYOwgSvVLHHZwUbwY7KEZHo77y3NjeMZ6pK
         3x6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OPQJPCpR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7si15014204iom.30.2021.02.28.19.14.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Feb 2021 19:14:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OPQJPCpR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGZ1G-0004Op-5G
	for alex.bennee@linaro.org; Sun, 28 Feb 2021 22:14:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGZ17-0004Nb-Q8
 for qemu-arm@nongnu.org; Sun, 28 Feb 2021 22:14:41 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:46857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGZ16-0007fe-Bc
 for qemu-arm@nongnu.org; Sun, 28 Feb 2021 22:14:41 -0500
Received: by mail-pf1-x42e.google.com with SMTP id r5so10503241pfh.13
 for <qemu-arm@nongnu.org>; Sun, 28 Feb 2021 19:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5sXuT9U0OZtBJIA+BNIFxAaQwnORxOI+ahqWUDy3kZM=;
 b=OPQJPCpRUQRj20gyBJnD0uZQeoBUDoRDFS350W1AX9N7+uzwZCQzZXutJymTpjvrgN
 qEzsFz/rI5t4od+kztaayt1xsxqqDDVrdhzPYTmi9zxfIEFabLro76RfpduHPgABBkHL
 23uMTGwKHHjJP48L7jfPov1Y9HHuhDNgSb++1DDI/LcEk1mkesg+OfkMoZ5R4XDeU/Rq
 +W21uJkGdXlckNcnewFUHvhozwtjd1ExXw330plnSlKQ74IL+t1QJv/PKZkJzzrOOWyG
 IH142iA0VdtjGFBY6D0VB2tEin6JkVskEh+FQsA22/NA4wGJI7WN/EPJN02zXnDSzBy6
 gW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5sXuT9U0OZtBJIA+BNIFxAaQwnORxOI+ahqWUDy3kZM=;
 b=K8hydrhyZ7Rg+yMnwZFbJ1HgcEDndF2ilUuh0ikYUQk7lj415MVLUrGkjWsV9yDLlB
 FYoLdkuBs6jspLeyCrR9nbzfYnA4314hGN7fYTQMyV3sUj5UChBzJKkK7J054QBjVjCe
 e3yRMGqWPrnENym1U+8Qda+Ms707KgJmad8jUDswY/l6DyqcvgRUFdaBJvwX7FiWS8Mm
 1UQ90eCBUKdrYy45msksezEp6oAe0rziX9MfRqZizriUCILwQOirHbUCBClpOLAkEeuN
 JY4t/7uLF2YaMZcRBnlW5ZZmNIwwtglf+APcPi1TnjPc36AkFU/WDHGguTe6vJpmweBa
 6oNw==
X-Gm-Message-State: AOAM531hSR7tdNLy2RMNshwrXIlXxBxH2AiqYLjfsq0t5wLTthnmDU+b
 Kid6YNRxXbnlC1x2Xr3/dYOIjw==
X-Received: by 2002:a65:6207:: with SMTP id d7mr12458379pgv.92.1614568478851; 
 Sun, 28 Feb 2021 19:14:38 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id 184sm14210100pgj.93.2021.02.28.19.14.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 19:14:38 -0800 (PST)
Subject: Re: [PATCH v2 07/24] hw/arm/mps2-tz: Make FPGAIO switch and LED
 config per-board
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <08ae148d-4ce8-f763-84f0-68b351418955@linaro.org>
Date: Sun, 28 Feb 2021 19:14:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bi6wInQNaZH4

On 2/15/21 3:51 AM, Peter Maydell wrote:
> Set the FPGAIO num-leds and have-switches properties explicitly
> per-board, rather than relying on the defaults.  The AN505 and AN521
> both have the same settings as the default values, but the AN524 will
> be different.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/arm/mps2-tz.c | 9 +++++++++
>   1 file changed, 9 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

