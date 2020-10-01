Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp899707lfq;
        Thu, 1 Oct 2020 13:36:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxOHlW+lkCzC2c9TYLXvn5G9Vq853GZm9etgfZAn5o1k2ublEYErD6HOkjfgQnbdK0iAAT
X-Received: by 2002:a05:6902:c7:: with SMTP id i7mr14386217ybs.17.1601584615087;
        Thu, 01 Oct 2020 13:36:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601584615; cv=none;
        d=google.com; s=arc-20160816;
        b=uj1Oopy3zPzltYp6KKmKx4/RK07boFCKw4jV49xhsJ8+8sCfOwsB2kytfX/j6o5ssT
         kHeXt7SCdfAkitLvSsCw9npT76MAmdJE9q/Sjic/DtjoYCN3XiOUnZLC9CL6TNdlweUk
         F4TN/GCTFfaJIkOdXwE+Nch9zKVBVCmYzo7jhNp/pfWJPkVh8OvLQMZ0fA2t93/Z87mO
         8gwe+IOdRKHbgK+Uoq+oMJW66Dbn7Jix/lEGr1wubdfjmgawNX78QIdBhbEEvbYXHfIG
         AjaeIsLID/IvIb0peB2ROs0UHRwDIfbAJfFTz9lGLU4jjj+RUs42P+0GyF6xcaWhoS9l
         foFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/qFEDAy5XWaUVAAJYlPDbudkq2f3XxslP1UbJ3yTZUo=;
        b=YiIGf+prfdOSmUyqOV2Cci7xoJ6p1g60CjN6kJtimZ4qYuMgn0ama8tNxPpA7ahd9D
         b2e+ta/u/4f4UVB7/J/7mClRYR4M1WRUGVLuYO7HQtgUrrr74evaM0DECX+MNu7EvPGJ
         JwAObKp4aEGtw2j/Th/ryhiIEXELy57niGqzgdeZA6RCIW9NHEEGHD9SiTyXfzNvQCgv
         HfuVqT3DhShimu/e/0ZIdY9kejNK0SBsOOcQSLVrX6+Skr/Gil//8awM7KOgvBt86JYx
         MHT0iNTqPwTuCu/zkCYb8JYOEba6JX1jPNmxRLP4eSZ34kqmHLZuTBt0NPIU3tEYYKO7
         IQXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wL86vLyb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k1si5741288ybf.178.2020.10.01.13.36.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Oct 2020 13:36:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wL86vLyb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kO5Ju-000788-Gn
	for alex.bennee@linaro.org; Thu, 01 Oct 2020 16:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kO5Jl-000778-Sx
 for qemu-arm@nongnu.org; Thu, 01 Oct 2020 16:36:46 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:44589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kO5Jk-0002nH-2O
 for qemu-arm@nongnu.org; Thu, 01 Oct 2020 16:36:45 -0400
Received: by mail-ed1-x543.google.com with SMTP id b12so7021220edz.11
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2020 13:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/qFEDAy5XWaUVAAJYlPDbudkq2f3XxslP1UbJ3yTZUo=;
 b=wL86vLybqSYugxpiEO+BRGCUSdoXFvG+xW1lpQh7RKwVGrnkLwv0xOL1MoPiNZP9ty
 LlTiJezRkN+PB3s2Brn+kPDt3k8fyVaHi2LWEM7a0DIsuD5CL3E9D1a9lTPT7nipwfyS
 bmb0+/wXUpX7mER/qj7ZKZl7iXisLILqOTdv691jtnUpn7tUFO0aOdnmFhLyjms/mAMr
 M4vIyEbbJv0TEppL0jmRE5MPDvUY3CisIWTNE6uUOgE2eZBxPluQgZTwj63uOVDhYeUz
 u6WtsgIGyMDN6VsyNC+8xvlMiYxZaBgUAO7EU4RvvWsIPGqJHzDEz3QLi3UhLe4YSNJd
 Pnxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/qFEDAy5XWaUVAAJYlPDbudkq2f3XxslP1UbJ3yTZUo=;
 b=ctOze2QJSEcwYN0mW4VeZrssH1nnqqHEV6dQcHXIL6qvaQkzezTtDVCQ9xnz34u5pw
 GZt2WhQSXIoRriWGigRNe6ed2/P+B/sfX3vddfEcg3FFjppBwNwZDnDf4LioUFjatKML
 igMccYMcgCxAamrqfRRNWQAlai9i1xjmicdcgV3a59GtUEnyZHhpv0AYl710egTGh2al
 2GBGyseoqGtW6mSMn2Hqt7nqhUasJzKV8hGoTBl0pwT1y8M/0EIQklrS+XowAhlLVXDt
 xjCMLNSQdnjbg7mkdUtMwRfo90djftJG+2+5pqGss6kURx+sbNUvS8K57vI9vBf4q9jx
 Z6pw==
X-Gm-Message-State: AOAM533qI5n7x0+g180CkmOMlxuJPCyJgwQYzWzrIcAMA6hZPitFDlGW
 AbVtlwxQeyOB2UrLcLYA0IyqpscVu8CIFF6SO/jznA==
X-Received: by 2002:a50:f1cf:: with SMTP id y15mr10358484edl.204.1601584601325; 
 Thu, 01 Oct 2020 13:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <20201001193659.21685-1-maxim.uvarov@linaro.org>
In-Reply-To: <20201001193659.21685-1-maxim.uvarov@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Oct 2020 21:36:30 +0100
Message-ID: <CAFEAcA_76y5DoNw3tirFFaC9FfE6NnxwAkdgV5eSv9NUeBxdhw@mail.gmail.com>
Subject: Re: [PATCH] hw: wdt: implement sbsa watchdog
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZKvEK9ie+Qu2

On Thu, 1 Oct 2020 at 20:37, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> Initial virtual driver matching linux kernel sbsa_gwdt
> driver. Driver implements basic functionality and makes
> watchdog works on virtual machine and allows to reboot
> secure OS. I.e. atf->optee->efi/uboot->kernel. More
> information about that device can be found under:
> ARM DEN0029B - Server Base System Architecture (SBSA)
>
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>

Hi; what's the relationship between this SBSA watchdog
device model and the one that Shashi posted recently?
https://patchew.org/QEMU/20200929180410.33058-1-shashi.mallela@linaro.org/

thanks
-- PMM
