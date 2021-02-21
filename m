Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1009348lfc;
        Sun, 21 Feb 2021 05:33:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbOnioTjWK8WiZ9KSvqEgLliuIFvglUI3wbA6toYcAWvxwn944aJEAeqWtiGnCeQDRvD/o
X-Received: by 2002:a05:6638:2381:: with SMTP id q1mr4094500jat.132.1613914381465;
        Sun, 21 Feb 2021 05:33:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613914381; cv=none;
        d=google.com; s=arc-20160816;
        b=PspXOOKSStAkz5bV+5c0AMonfasOv0Bo4DUUWJjqLY7ShG66CtNCuM9NzZB4Wwkd7A
         1mSVs9us8UIIVje3b+ND7E2ahynhicTCCbC9DIc5ye/cfya2X95WEBTE9wQ51BN0Beim
         7MqJ9iynDSPPhJsx5ZhQcc2r3hYq0D9JZD2S99cvodWHD8xguMJPlzWTM5n8EFkZeaBU
         S9SYg/QsQca/oRkdEVURiXGJnnzV2YHoAOaHdoYmC3Cp4atMVfGoTykIBBjRmoXDJ265
         eK2gvVi5KyC0eT6o0GOTPYt6rGs9Ib5Ynomo27eKeBzLfZmyxC7KuZfzAJH9PSlqYbpa
         JSXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Wclj/zji4w48rTO6WNBPw0DfPt1Rg8n6t44ZMHbxqlE=;
        b=R0eagr/0/dS5TdA4375spFcdVFPDXl5aHkGcSvlk1tXmnKOvQQocgEbWT42XvKFqWa
         SdDr8Wre6RgQSSluwRz0w2+tzu4JWEn+jhiIT/Xdwc77eT0fhkYXOQ97qOZySdZj7EVT
         rrm1VoCWqI0hvAxi7zWFlqr2VzAwKjzP/HshEHAC6tqmoEC5huOJ9jMKVZ/uDcTWiZ3C
         MTtfnZPzrQBHcJsHA6ai93Bh7fx3D3yhuJybIiAyKrLRaso97aHJvT4PF96373Gwbc59
         IZBIqxLCYDv5B2XFpfQOpopKLf0QFZaQOtJXdTUAle2nqXrRtZm9JPZfIPii01mjoq7M
         erpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=P3jrZlj7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p2si979765iln.65.2021.02.21.05.33.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Feb 2021 05:33:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=P3jrZlj7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:39194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lDor6-0000wr-Mt
	for alex.bennee@linaro.org; Sun, 21 Feb 2021 08:33:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDope-0000vk-KE; Sun, 21 Feb 2021 08:31:34 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:40035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDopa-0000Nf-5Y; Sun, 21 Feb 2021 08:31:28 -0500
Received: by mail-wm1-x330.google.com with SMTP id l13so2418368wmg.5;
 Sun, 21 Feb 2021 05:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Wclj/zji4w48rTO6WNBPw0DfPt1Rg8n6t44ZMHbxqlE=;
 b=P3jrZlj7Tfc2mmbSt1hHo9NZaqUr9oMxL9sfDgUBgNs3ePH/Zf0oc5pAZRhJeYrnyz
 s8DMWDlZFyxr1MFc4sFhdx4yX3mwH0AeRNHWrGrYJmVv9NRY+N45kkCkLB3NkXsj4x41
 kflcXXj05UFXVVMK1TSyJXCjNO0JTZO6Mz8yWPCbOCrM1Rxv6exly58lIRnVlI04aCY7
 yTli2c/2enfUJd3QxpUGIPJvvjyW9h5FD4221ppLvUbg5sZGfuhYtN4HBGXIoWyYXGpt
 zIISolE1g2xYzmWfoyscn51E7m17DoZhkzPMa3UuhCoAfW+4ZpTwlUEO6ny8Sl4IswQx
 r1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Wclj/zji4w48rTO6WNBPw0DfPt1Rg8n6t44ZMHbxqlE=;
 b=R6R1yAtOVrR/DyhA0okf1tJqj6l4jlnoXw8fQk2UnVOzqR8Xt6Kfoj+Nntq/gbb3Po
 Kw+0RtUsNKaAr/CPUkXRWdPzxQHeaB7TPn35GXPJS+aQkXMsJEvOUsJeqe5pO0JYL6hq
 Bt4IWo1gzQptWs9y7FTnIy//ZelxKr6WjFnFtP5GtXbqYHk2UdpNiRtrvUqVTjMS9i8c
 L8ZSnV1zUHHyQ7heIy/4oaO8R7Z1XewZovNI48adBOj1BiBUZDMhF5V+4PZjZozQuj/p
 njcVd0MA9QoQo8/+y3//3AEg2/TUmUS6MzT4SjsHfSDokkbRzzNune7qMfYqWWlNp18H
 8mlw==
X-Gm-Message-State: AOAM531DJGLUwIHJ1fMJ3hY8mcskwvIyim/T3UqV1IwON9gPHKcj9Qif
 DhAArrUAvNCDBDGIXnSJRa7QtzYrcec=
X-Received: by 2002:a1c:e142:: with SMTP id y63mr16267605wmg.163.1613914284235; 
 Sun, 21 Feb 2021 05:31:24 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f22sm9388461wmb.31.2021.02.21.05.31.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 05:31:23 -0800 (PST)
Subject: Re: [PATCH 19/44] hw/arm/Kconfig: Move ARMSSE_CPUID and ARMSSE_MHU
 stanzas to hw/misc
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-20-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ca3d4369-79ac-3679-9dbd-421700bc19ae@amsat.org>
Date: Sun, 21 Feb 2021 14:31:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
X-TUID: 6y4bqauO/t3n

On 2/19/21 3:45 PM, Peter Maydell wrote:
> The ARMSSE_CPUID and ARMSSE_MHU Kconfig stanzas are for the devices
> implmemented by hw/misc/cpuid.c and hw/misc/armsse-mhu.c.  Move them
> to hw/misc/Kconfig where they belong.

Typo "implemented", otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/Kconfig  | 6 ------
>  hw/misc/Kconfig | 6 ++++++
>  2 files changed, 6 insertions(+), 6 deletions(-)
