Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp3700896lfp;
        Mon, 27 Sep 2021 03:16:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzz5dy+ak3DKlD6CzgAC0mNlS/iAAmy/a+D2NiDV0jDkCxV5hRlIY4D5kl+GLkFzMwlfixN
X-Received: by 2002:a4a:e499:: with SMTP id s25mr19986880oov.46.1632737760991;
        Mon, 27 Sep 2021 03:16:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632737760; cv=none;
        d=google.com; s=arc-20160816;
        b=nVgW/AlMNe2l3WqZos/kjBQCC6KGQldNdjTAVMzejY0xy7ADKRD3VhkbDsSK/Zeip8
         dT9b8hODYak94aiuebSQ8EUULZnExZN4PZnxiewHVyTcwSnkgeHlrFziZQdlGsGueUGq
         EXBg/M+geHIxhpq9G3+pvZjIICufNTlyPxbHy8qC72Kj5Zp+NvZ0CdbMSBE5MauEcUVw
         jj+lxbLfQxbImAcDxIHIguqa2dsaG0b43mGAOWpLnqz38pRDWh13KKixNdF6M6F4C9NV
         F6PA/0LIVG01nxzKKpAH2rFAesdvGDort9VKyuihMDMKgI1hMAcM9tnxWCfRSbuYdTlk
         d5/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BfghJtw5yvTzVUMWrUsk+gH7KRuMJI70dHEi46aSe8I=;
        b=S39aAOI9H8/IbkAfGXNOsITQkPWVmUuL78Z7FVD0NTnPFtVIAohhVbEA+DDuwFznWI
         /63vIBhlZMzi2/x+EgZRt66PJrcieu1Tqa1RgO2qqpgSqGFFohHadmf/PpXJekf3t7kf
         F0WlQmOsM4knwaEUEe58vJ8eStoX5vsYdpm6QPhGfRwWpGEAKeFNGEx8AqefV7LWwHZ9
         fyqYCyTTh16X++FzKVYtNED3ks9pZWgu33D0Ttf1FtGiuJGSJLJNqkeZSDHGwaCogpS5
         IccBfQbso1cii1FkXv+L9HkJfPZ6FD2mDDmihj7tru8TEKXysI3v7F5wPt72cXqMlZCF
         ocnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MTupWbDR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j6si20054623ooj.72.2021.09.27.03.16.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Sep 2021 03:16:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MTupWbDR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mUng0-0000uR-9Q
	for alex.bennee@linaro.org; Mon, 27 Sep 2021 06:16:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUncj-0004kP-11
 for qemu-arm@nongnu.org; Mon, 27 Sep 2021 06:12:37 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:41951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUncg-0003De-Th
 for qemu-arm@nongnu.org; Mon, 27 Sep 2021 06:12:36 -0400
Received: by mail-wr1-x42d.google.com with SMTP id w29so50774143wra.8
 for <qemu-arm@nongnu.org>; Mon, 27 Sep 2021 03:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BfghJtw5yvTzVUMWrUsk+gH7KRuMJI70dHEi46aSe8I=;
 b=MTupWbDRHNedrtYDiFj3ypJWdjuBENRjZITtZ8VviUTLMI8y+5KDBQOz+SgYb8od/o
 +V1QjKkwuHh+IUybJ57jn6ttC37Qf/L80zq9DUpCJ4Otw6dKKir1keoNwVrNEPcLwioR
 abbaJv5iUPSArrzxmA7kEmEBMbUIQ86lGT0xdBZmQ23mWBprRyBpNlDvNJOz0yyHZTcw
 IzmrPIGuT6BD/4sWscT3dAWppatFVKLiNoK32TazGNI8J4yEHnYYQq+4N5B81TkrLjnN
 wFtYDoJ25A0522CcfoSRS5kmt3Lrx/I/mdImTCwMA5FAYufkD5KLvy21s9+gl8sQGR4M
 49RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BfghJtw5yvTzVUMWrUsk+gH7KRuMJI70dHEi46aSe8I=;
 b=ZiB9OswcKGu79dgNyBbASbNZoBTlBu32Ks7H7yzx+WNmEry62VAfVOQ886/5wwHqhz
 MfWVYknwqAbI6+XV/9OAyuN1a7wNNKnsSMj3vcPRrjZzjks6k7XkZ4RUEFJIsISzeBaf
 dvhWlQVpo5Pu9N7dedU+gKLXS2QYTYrWXLcfF2q+5ntbGkQQXs4Zly2bpHB9RnIwbyBH
 SVPBoY5LFbogCybzfpthi1DbFwfa4/5iKzcKqpEI3MmctWqVe/x9NSIbRVfFzTNTmdRt
 3eX1wb7AW3v6AbSnOiTd7xoVzOJNgY4I13+JyHiK3hwn+OrOfFdgJ7TViqQhbKpyCLS6
 i/ow==
X-Gm-Message-State: AOAM530zQUrrgpEftCUe37Stuui3fnZDbrZHpxRQxMRawH6lrB92fvu2
 2pP6vCVg9uGyJGuA4oAcOdyqqJMAKvPfjvaiJBB4Zw==
X-Received: by 2002:a5d:6b07:: with SMTP id v7mr26321618wrw.376.1632737552646; 
 Mon, 27 Sep 2021 03:12:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210920203931.66527-1-agraf@csgraf.de>
 <CAPan3WpYNJgOE9AVpHPegf4Njm=80YXDQYT_jKhKKhUm=r2=hA@mail.gmail.com>
In-Reply-To: <CAPan3WpYNJgOE9AVpHPegf4Njm=80YXDQYT_jKhKKhUm=r2=hA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Sep 2021 11:11:39 +0100
Message-ID: <CAFEAcA8QQcaBzxMXyWhs+4FQnnEvErfjqoj3idJtgrTjEpiXwQ@mail.gmail.com>
Subject: Re: [PATCH] allwinner-h3: Switch to SMC as PSCI conduit
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X1bfblGqZ7GE

On Wed, 22 Sept 2021 at 20:41, Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>
> Hi Alexander,
>
> I've tested your patch on the acceptance tests and they all pass:
>
> ARMBIAN_ARTIFACTS_CACHED=yes AVOCADO_ALLOW_LARGE_STORAGE=yes avocado --show=app,console run -t machine:orangepi-pc tests/acceptance/boot_linux_console.py
> ...
> RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
> JOB TIME   : 116.08 s
>
> Also the latest linux kernel is working OK with all cores booting up fine.
>
> At first I couldn't really figure out why simply changing the conduit there works, without also changing the Linux kernel to match.
> But it turns out we just override the provided DTB for this in fdt_add_psci_node() in hw/arm/boot.c and the Linux kernel then uses that to decide between HVC and SMC.
>
> So looks fine to me:
>   Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
>   Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>

Applied to target-arm.next, thanks.

PS: if you put spaces in front of 'Reviewed-by' type tags, the automated
tooling doesn't recognize them.

-- PMM
