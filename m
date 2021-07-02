Received: by 2002:ac2:593b:0:0:0:0:0 with SMTP id v27csp1232068lfi;
        Fri, 2 Jul 2021 03:54:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFba8rVzHDWtP5I1r0a0B78mVdQS3J2ruHte79Q6pFRbS6RFwtmgVvVhetLTqW7v066Agr
X-Received: by 2002:ac8:6e9c:: with SMTP id c28mr4563606qtv.145.1625223257675;
        Fri, 02 Jul 2021 03:54:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625223257; cv=none;
        d=google.com; s=arc-20160816;
        b=ISApp4S/VHYOfo+pJqvjZkTr1DBtmGXAHXdEPzEyYqfbAAE57QMUeC+KEXiSwY1RQP
         USdtDnrIsLkQBJRR4VfbKtEmGc+CtIQOV+TMct+7xN90vlW0MZAU+2cXYJALaPnWVCeD
         oDKvx/NRSgjFFQawrbZLoIWvYM4YXc5K6+wYSIVWrVizSGLHZm3kBC3WLmcqs+2x852V
         z3APed83aAhp/MlvoPni9hWucan62YmRT76Qa+6P6wx6quki5FDKX6Ifh7rMxuse5GF7
         M0Yg7Zv4OB8Y/lyiDXOb4oIFfj6LMGpTu6wF4kp42CfeC13p0G6RpUo/OS+40Y+ZefjR
         bE1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=76AMih/0CdvT88bh+p2rDyuQw/2AO+hwfxP8GDEeKNs=;
        b=VXRwWTYRCed+0FEhYKn7TdBrQUzFnn+nZmwmlcK24ciRJpiVaO3ebOCHi5y1fd9oiU
         QvtQExuKN7gmteVLRqNVipBltYhskYVVywFNce0vMWzMOymTD8svm5JQonkuXJtL2Yna
         rJCyuV/fKlM7fxzCepl31PIc3+ddW3pBqWdrxyrA7O2Evxv12wG0yKUKd+n1uMeh9l8V
         Fw78boMnIv9ZYivGB0GEr3Af+RuT2WQwF7eo3NjGv0W0gL/8HZlU/tTT4OicmyLFhtE9
         3zYEjP9EssDuLOnwZOmP9ZrVZhvsleWwSARGcsPqYc9oWvI7Bx3gcRBH540aTfvkJQm+
         wTTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LlIZLTUL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y13si2161315qkm.234.2021.07.02.03.54.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jul 2021 03:54:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LlIZLTUL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lzGoK-0003it-VH
	for alex.bennee@linaro.org; Fri, 02 Jul 2021 06:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzGo0-0003Hx-BP; Fri, 02 Jul 2021 06:53:57 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzGnz-0008Hy-1w; Fri, 02 Jul 2021 06:53:56 -0400
Received: by mail-wr1-x429.google.com with SMTP id i8so12009660wrc.0;
 Fri, 02 Jul 2021 03:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=76AMih/0CdvT88bh+p2rDyuQw/2AO+hwfxP8GDEeKNs=;
 b=LlIZLTUL4F/FaTUooBGWKRYw/O+4KhwCgCvNVtYPkREHnQpCEnHRDmZvS75PyuMuEZ
 s9pyvZeLDe5bcC3s74YZy3eTSX9FigwE5xDqHuTZyd2+3SNGdESuB8Db3TPf4Xkwd7o7
 wC0krl7hrMfsaCtKYKiHEWWOPRVtgXCXX1X0nr32f4UuuBakTeaBv/rDA4LcH9lJZk5o
 kL2DBPELV6PRBft73hEA+HqWhgG2IXuhElP4k2JwgVxe9ovVoY3ZFOM9mMJ0ivRHIh57
 NLXVRadBXBvyBaQWDMoAsY/5m3ZRZu3193V3qCthoA9FPJ8YHYy9EwIy43QVLkAtVSt6
 D9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=76AMih/0CdvT88bh+p2rDyuQw/2AO+hwfxP8GDEeKNs=;
 b=pS0zaPsoJFZe3btFXzFEF+cXjaRnD+hVr6Z7dCFKigADMbsZ7+Q2WBah4RSHcCd0oI
 43AzAuRsLnJqU2r5swcBXJE2srQYOOljGZzORlgNK0AMP4CjnNP4pvkxqNCZr8GYFvQY
 8ayqY0yGXzgEWedJ2ojEXS9io2E2SBpm9rwYH2W4uYI22WgFKyy/k4BMXdO5iWHP01SB
 C9vmwhNUl7u7Xd+zeIC9cl76f1iuq1vEtQY4JS9Mzx/qUO9vCcXy88dzZpWZSqy6pRZb
 SE7WTejzkhGIJ1TwKZ/T7i00Uupqjzk6eHRxMDAzQ4hCvJrHBLqrnRpGgeBR7Awb7v3o
 ytPA==
X-Gm-Message-State: AOAM531Azmj24kp0aJVzzGrMekQGOWEgyPwrUdb/cpyKy4PFaEaNj7xK
 YqX6c/LcY6Z73m2I6dIMb0c=
X-Received: by 2002:a5d:534d:: with SMTP id t13mr5104915wrv.171.1625223233309; 
 Fri, 02 Jul 2021 03:53:53 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-94.mobile.abo.orange.fr.
 [92.184.108.94])
 by smtp.gmail.com with ESMTPSA id g1sm1088539wmh.30.2021.07.02.03.53.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jul 2021 03:53:52 -0700 (PDT)
Subject: Re: [PATCH 02/11] hw/gpio/pl061: Convert DPRINTF to tracepoints
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210702104018.19881-1-peter.maydell@linaro.org>
 <20210702104018.19881-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <26e398f8-0e41-8791-f09f-14dcca6195d4@amsat.org>
Date: Fri, 2 Jul 2021 12:53:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702104018.19881-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pKy4fzbPC+gB

On 7/2/21 12:40 PM, Peter Maydell wrote:
> Convert the use of the DPRINTF debug macro in the PL061 model to
> use tracepoints.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/gpio/pl061.c      | 27 +++++++++------------------
>  hw/gpio/trace-events |  6 ++++++
>  2 files changed, 15 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
