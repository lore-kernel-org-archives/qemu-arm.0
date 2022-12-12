Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3472162ejb;
        Mon, 12 Dec 2022 08:24:38 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5E1kLX2UYIK2hjFD2ouGY0LWRSe5F+Uap6zIpKHxj5rE5OHelzYr/g+UjvRi1KeHNeIhSV
X-Received: by 2002:ad4:4511:0:b0:4d8:8f4e:3a47 with SMTP id k17-20020ad44511000000b004d88f4e3a47mr11527705qvu.42.1670862278654;
        Mon, 12 Dec 2022 08:24:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670862278; cv=none;
        d=google.com; s=arc-20160816;
        b=Rsp8Szqr1mL8DmG8H60O9ACERYsmDSf2xHYClkkUMDJotzdjR+irtvzLo4FHlEFVlv
         ZE7nncdHZbbYu+cqbYTQHb1jHcrzuZRnLR9FQeGisArEfDwzegI+4F0c4d9LOXccAimH
         hRP6gWsMMwLIkTuAbLf9xEZeruDoFuEF6iBssBBAMjgbyQIZUUg5CZqOZ5AMgiQokSrt
         O6p4Rw24dVOKliMyb+XhdoFnMs+Y/oAybh3uMwPVeY6bU7PgXSlBrtjIghOSq9fO9QQ9
         qmG9QuQ62efyQceczz3YxNBioqJtC6ltPb6jumr342C9dZdqm7oYhLtq3K241KWqTwzG
         ja6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=LvVfFVK3vKVzAik5xzIQabEKNIzAm0AWEGiR4m5NOEU=;
        b=iE9WPhbeCb+dpGjYROEGa/0P4/a3UyoeNDka3Z+PGqFTAnIwso0/BvE2dJGe3XGaQk
         FrRswuBA+1B4ZGNgcHSNyYpdMXoPtOIM2ifOtOcLD7IpTN6p3SZKbWt9lSTAH7/GS6rf
         0eYGZtckX2WyLPZGNy2aSLIZXCACmblCIpq7u6/+DtRLfkiuNGvaG2AWn0iWeW80QSh8
         jUcZnWbWgRKRnPAL03Sy2GjerSaLD5nK337jytA9Ww7ywbbjgjQ2WwTRlIlFsmvuqyk4
         tT7Dbtz3m78QMGS+zCw079crvw39yeLzlTD49j0r7UNVwAioZ02XpYEOqyEcnbEzW0k3
         4Gng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RHCKVK+D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kd9-20020a056214400900b004afaac2ce65si5110961qvb.383.2022.12.12.08.24.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Dec 2022 08:24:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RHCKVK+D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p4lbC-0007pG-PL; Mon, 12 Dec 2022 11:24:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p4lbA-0007oE-Id
 for qemu-arm@nongnu.org; Mon, 12 Dec 2022 11:24:12 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p4lb8-0001sf-R0
 for qemu-arm@nongnu.org; Mon, 12 Dec 2022 11:24:12 -0500
Received: by mail-pf1-x42b.google.com with SMTP id 130so213335pfu.8
 for <qemu-arm@nongnu.org>; Mon, 12 Dec 2022 08:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LvVfFVK3vKVzAik5xzIQabEKNIzAm0AWEGiR4m5NOEU=;
 b=RHCKVK+DGi7AFPByw6vSAgxf3yHWEC9+Le1THjSD/zkY9GBBLsC+s6eoUaKw9nZz57
 kirQtfs/zmWLz3L8HdyhFCX7ohsxBCeWEK6pQxf9utG3FJy+MLL3FewEbsHc9oj4SIn6
 HbktEcpVgPyThHsG1ZYLU7LBZI572bnAtCsHXxCkt2bB2nTdI9BNqfQAOLQ5s0+G2Gdp
 NX2B45xvTZPI6aScwuN3gYhNVkQ9la1clsTL+Fs8e0wJ7+ZO6I05X+ZICpmyjk3ac7IP
 ywkloPc5e3sfywQ5RtmEjCM1KJKbmLCxBJ9l6csQV+YaCR7svZArzy48GVtdQf0wIkMO
 pl8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LvVfFVK3vKVzAik5xzIQabEKNIzAm0AWEGiR4m5NOEU=;
 b=P2FSr3L9WX6tMNgb420UnF9SB+3HXia4yH4KTl2jXiMwijiaHvjjsSPJArqJ58sO6a
 6nCLj+g9FetYIbJLn0HuKL1R7wzZ+UuRWCzLPSsct+SZJ3o+4rdHgkyz3OWcXitqesHO
 nFnfhqe8c4DLNLI+5X1QYGA44biI7uAB8A4LrmtebUB/ulcjVoX9in+nGSmidHr8DeGk
 WTp+owBkJwvEf3rN8XMISHN0jswGeCLO85qH4USkgAJoGrdpR/46Wpcf8rLJLuxDQJYj
 0xmuRibj76VmiWJQM7vtKtNe+rDDiHOWTytHE6ieCVtkziDoBOfy2S7ggTmu5w+RmIAw
 UKsw==
X-Gm-Message-State: ANoB5pn2YsdI6F5aqvrr+404WAqZlm6nbeQAE8tRvzFwt9DNcgIe9osp
 i8KfXQHRhxfnc4yN0fFTh63x5yQqBY0v/A9w+vIAQw==
X-Received: by 2002:a63:d20d:0:b0:479:18a:8359 with SMTP id
 a13-20020a63d20d000000b00479018a8359mr4932844pgg.105.1670862249363; Mon, 12
 Dec 2022 08:24:09 -0800 (PST)
MIME-Version: 1.0
References: <20221209110823.59495-1-philmd@linaro.org>
In-Reply-To: <20221209110823.59495-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Dec 2022 16:23:57 +0000
Message-ID: <CAFEAcA8sGbS0oJV1afSja13npZR3tFk4VNAKR2o5+0hCsGUN1w@mail.gmail.com>
Subject: Re: [PATCH-for-8.0] target/arm: Restrict arm_cpu_exec_interrupt() to
 TCG accelerator
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@linux.ibm.com>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: OrDJBQI45dWb

On Fri, 9 Dec 2022 at 11:08, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> When building with --disable-tcg on Darwin we get:
>
>   target/arm/cpu.c:725:16: error: incomplete definition of type 'struct T=
CGCPUOps'
>     cc->tcg_ops->do_interrupt(cs);
>     ~~~~~~~~~~~^
>
> Commit 083afd18a9 ("target/arm: Restrict cpu_exec_interrupt()
> handler to sysemu") limited this block to system emulation,
> but neglected to also limit it to TCG.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Applied to target-arm-for-8.0, thanks.

-- PMM
