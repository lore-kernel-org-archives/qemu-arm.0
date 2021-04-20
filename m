Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1977223lfb;
        Tue, 20 Apr 2021 03:28:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXF7g3DEPnP7pu0+mNqCUEIP/FX50ImbmqdvC7EwU9b8Lzm2JQUd/ZfylZwYnhFKGYI5yL
X-Received: by 2002:a05:6122:50c:: with SMTP id x12mr7810525vko.13.1618914507854;
        Tue, 20 Apr 2021 03:28:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618914507; cv=none;
        d=google.com; s=arc-20160816;
        b=Jr9mj6RGFJ99YMt3rzoFx67cwwGpO+HdJhROEiSeb0TzOLBti24EW6BUOyuJx4Nxvs
         ccCMK4Kn6kxVTS1fV5+LpsX20xpdQpkW1H1E/Jhx1JMpkRh11wzKxWoFfuGzfjzQgly7
         MbMro9h0ffMP6MnRo5hdsw7OxmRBBdH1bOiZf4HIRlTR03bqc7G5G1hqB/e0zH6eTSEK
         Fq010/Uz6qPcs8EcJnx7Q+A0oEnBjERVOi/PxSmVVNpiR4dh02bTwiZ8ZF28Oa8e7Vos
         5PvRMXwOG4Wt9B2/aT+rsMcF1LGHFYNDx6gUl53VKblntgrDg8ODbU5czZXOaLcTV8+E
         wVRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+Du8gtK9JZBugw4muWLWn55qMtlPRK/OLVfRoWyxzrk=;
        b=w0pMn0dPU1hB0q2W5CJ1JFJgmWMgS0DShWdQINXULuUCwFGH1ZeLB5IGpr3LsQBU6a
         AzrARTzm99QWE5Pct4QDtDS1sGwlbGKOBv/rJ2hgV03jhqmYB7XRP4UWocFjYXq6uf2T
         riq54SDpIuPpW2sAY0QEgf9ZaWsT+byYLsnaadKyQ3waYrgjRLNchTcqnULcxwYTK23W
         3PGUZrvzuKCgkVgdt+r72T8ES7odCyDBtyun6S/cDvd+O7w0Qte7SOFUv8wvH1N/nN2L
         knLVcu3sVxnaEUyIOUnOz+5m7aPbOTYCMfi5w5Pd880uV4Axf9x0UzF9RsDCKHBGGABD
         9ZpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=z4BzjQ5H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z80si3166722vsz.251.2021.04.20.03.28.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Apr 2021 03:28:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=z4BzjQ5H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYncJ-0008Ue-3L
	for alex.bennee@linaro.org; Tue, 20 Apr 2021 06:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYnbw-0008GJ-9O
 for qemu-arm@nongnu.org; Tue, 20 Apr 2021 06:28:04 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:37383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYnbu-00078s-KT
 for qemu-arm@nongnu.org; Tue, 20 Apr 2021 06:28:03 -0400
Received: by mail-ed1-x52d.google.com with SMTP id s15so44412510edd.4
 for <qemu-arm@nongnu.org>; Tue, 20 Apr 2021 03:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+Du8gtK9JZBugw4muWLWn55qMtlPRK/OLVfRoWyxzrk=;
 b=z4BzjQ5Hp8IBcV6SWXVi+24mTdC+4C3pdW8X9fRTjsvvGTEeDpAhb6XA3K2Fm40a2J
 iYdA0ODcaJ0KrBNpUIdsdQPVX/+XRAgkbo12orTwMjroKI64TZPlfSZZck0mT+A1nuYi
 W2VptyNIEf/cbIj4ttDo/A4a/9UBlbw+DVcg0+rJFhTG3NzG5tS3wJSXyfcj/roHRYzj
 b3h8JXN+7cEJBNV+WzubPtqhfdSN9vT6mhccLy0cogc6sNtzOy57tFNOhhDp4AE0wK8B
 2JeljGyHjdrp5qinkQDjIl8fNxwzjtceE/Y7qzj4ouGGZ1j6WrMeWGdLqAOWQ2Hrq4NT
 1Ztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+Du8gtK9JZBugw4muWLWn55qMtlPRK/OLVfRoWyxzrk=;
 b=Qhu+iI3mIzvvbx2Qhv5vpFrpEcEZrhw8n/yLblWz33PsodT4iEjleBFJVJUfWx0XxK
 vvb2BPGU7r2umNDxG2kKa2ikhX+C9lCMbV0UCAVxBGOUONSLLi/ugW/19wk3aJda2Lhv
 rl20TQ8RfnmqxIcMIJVTkDdOUA7bYyqEe9jK+ok/gmC2k8EJk0yFyG4ipLuzqflIy81K
 hIjBbxTv8DIY/eQrq0UQL+JntV1SwrQGiwvMS9aIw10PwOijHJA2jNCcRzI1a937DIgo
 d65zdqOFlvRMAQXkQvddJRDeWr/TlnqXBh+X85si8eeoVrbAxrTDWBRMmOKxFjMPJycD
 y7tA==
X-Gm-Message-State: AOAM533Xit6QaGWaK3ZTxI+Z1X9KUBwD87x0Cu1Q4g+2gcdfgwnb+uy0
 3oxYsSXUjRAfP2Q7kajpbOK80Yljlzv62gfPLxN+0g==
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr31108240edv.44.1618914480955; 
 Tue, 20 Apr 2021 03:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210419202257.161730-1-richard.henderson@linaro.org>
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Apr 2021 11:27:09 +0100
Message-ID: <CAFEAcA_Q4FNeoS2ru_Q+KiUMahj3hXQ-0msa2SFTZrx8fmo+7A@mail.gmail.com>
Subject: Re: [PATCH v5 00/31] target/arm: enforce alignment
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yl6luoPdsXS+

On Mon, 19 Apr 2021 at 21:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Based-on: 20210416183106.1516563-1-richard.henderson@linaro.org
> ("[PATCH v5 for-6.1 0/9] target/arm mte fixes")
>
> Changes for v5:
>   * Address review issues.
>   * Use cpu_abort in assert_hflags_rebuild_correctly
>
> The only patch lacking review is the new one:
> 07-target-arm-Use-cpu_abort-in-assert_hflags_rebuild.patch

I've applied all except for patch 7 to target-arm.next for 6.1.

thanks
-- PMM
