Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp5064217lfr;
        Tue, 13 Apr 2021 10:11:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsRT2jpuEmIha58O1oUf7Gle/yrnMG6zuKuwjVbLJ0w4X1jgjH0KRlisEMs/zEeD05wneA
X-Received: by 2002:a5e:8718:: with SMTP id y24mr27795152ioj.85.1618333909393;
        Tue, 13 Apr 2021 10:11:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618333909; cv=none;
        d=google.com; s=arc-20160816;
        b=ILa6xao1xzqfQ2aYtl7HVFSLTlbPVHmsBzTpa2onb+T/PgmWlmvwGnZgfx9vwcG6x1
         G5XjEZ002o2WXaLIFZV4ayIM/V9H9E0CsrD49Xa1EOe41GXSTSAOgsDMdoFn+EGYW4J8
         PhPTeNwD2PZFko3TBvEhsNTGPxHM7nzaBt1jKvI0ak7msDnCTA/rWNW3Zy9ZyNPkPSPN
         XtTliCmjE3yRvJmtU2etR8m3KK4fng4mwzwmihLTTBE3axprSbOynuGeWXY0cC+avC6s
         xSAe7n6eOLc7ouqs546b1KD1Xm0kZO7ALmmNun7aO6NjYjMeVJdLBxCaADgPn1KKLn8D
         +adQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=5srUk3qIIvcebuytWZ9xypNA7snM56pd7PVsHy2DEsE=;
        b=bWqqrM3MzQ9mHVwjSo+CcXSXdSvANmURT5vHicZyCWbZOzf/0xKjSDmgrR/lLika5h
         Ac96gp+FOdYTIL4GHfqLG7jpbkiRK4CBr9PZWIZxV1rmtodPyjtT9YtKMb1Ehbixp/x0
         aukBNY25TwpYYBoW+5g7Kb19YK1WGbVhTu2Gn+P1L1QbFTek770MObbKvG/FNPnndOQU
         0PdVgbdvKzAzzZp7U+jMyRFXnl4x+DBZuCE6R49tB6arg0c/lnhqLCsSswVmNIdmywoY
         r+iRaObDzcBiAUNojDlGJNDnVsIZExtAzB5PZt6ZDD8lttBIMpGqFrUuqyRBukPTJnDD
         97qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OAUtGvH2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h9si15727583ilh.140.2021.04.13.10.11.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Apr 2021 10:11:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OAUtGvH2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:42894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWMZo-0007P6-Ju
	for alex.bennee@linaro.org; Tue, 13 Apr 2021 13:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWMRy-00015X-5k; Tue, 13 Apr 2021 13:03:42 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:40738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWMRw-0007ND-NG; Tue, 13 Apr 2021 13:03:41 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so11116602wmy.5; 
 Tue, 13 Apr 2021 10:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5srUk3qIIvcebuytWZ9xypNA7snM56pd7PVsHy2DEsE=;
 b=OAUtGvH254YjGIxouCqpu0mRWyHtl4gobdRHICz7CJzzR4IzgFxdGGvq/c+cDZg/Xc
 mC2CIdg83yw6qnmFSTa9EMhr624/Up5rfCQJ/i7pS9ibni4rlZi/Rz4fjZ1FsUJF0GWX
 ilOzja/Ejn7Miz73Z4AFR+cVJsnwAZRjB30XOpRkd1qpHoPfVIHMiVVCvv31F1MP8mll
 QFjN3NC/K5y7+lYoOqo0y5sHjRqS8D7clTqAo+A5yCP2ddR8vSQ+0mzLJmh2/EMd/KW5
 gLBBj3qVrbycFYyULJJ0Zi8xJnE4AN5Kh0hkkyyQqcj5pMIIjntNh9HBmPzR8M+4aVxb
 PHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5srUk3qIIvcebuytWZ9xypNA7snM56pd7PVsHy2DEsE=;
 b=YCEifxVEuzXSnZN41WYxjUZcfapHAOZIIMgONPFieBjERZdnbuQNuJmKBlVRMvi1ox
 KKlq3xoANZrJ0GAhLKpkw8akc8MMItbg37twjB+5hhhBVtblPEuA6JdpvN8K9K56o12I
 0BI0ZbgCRiuAvopbIREqgxvshFLVs1Re8dOSY59W6v1aB4Q4/p32uJk5DcCEkyw3lK41
 iBfGYBeeqAOKVz9aWPS0h84gA0SrCgQgRWdzW4wTA5DEW2C7Fsqq7UAnXfdvvXkXCKyz
 HMFF10gq5PrB3ao8pjoyXFS9M8CmOAa+/AeNphIMVOR4fYtLxSIEWdBkq4XExUqcM+6Q
 5bxQ==
X-Gm-Message-State: AOAM532AL2D8d6EtUDJsm/fFGlwh6e91B3vuS9fGUstNEUfZUf+Dz2Df
 TE3iK2r3A59bgfu4pVJ0A2jUu1fB28E=
X-Received: by 2002:a7b:c454:: with SMTP id l20mr948114wmi.65.1618333378551;
 Tue, 13 Apr 2021 10:02:58 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id y15sm3990183wrh.8.2021.04.13.10.02.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 10:02:58 -0700 (PDT)
Subject: Re: [PATCH 09/13] target/arm: Move vfp_reg_ptr() to
 translate-neon.c.inc
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210413160759.5917-1-peter.maydell@linaro.org>
 <20210413160759.5917-10-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d2bea7a6-019b-1115-094f-d5c63c562191@amsat.org>
Date: Tue, 13 Apr 2021 19:02:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413160759.5917-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D0V+QWlXzgR8

On 4/13/21 6:07 PM, Peter Maydell wrote:
> The function vfp_reg_ptr() is used only in translate-neon.c.inc;
> move it there.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c          | 7 -------
>  target/arm/translate-neon.c.inc | 7 +++++++
>  2 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
