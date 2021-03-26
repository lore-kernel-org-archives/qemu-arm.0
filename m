Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1379143lfg;
        Fri, 26 Mar 2021 06:53:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuc7YB360fwB686iQykzvPPD+7QRsiJDMKUZUnH6guU9Y3FUDWJxJkIxYLvmBvarzAdkvp
X-Received: by 2002:a05:6e02:18ca:: with SMTP id s10mr10751736ilu.254.1616766820833;
        Fri, 26 Mar 2021 06:53:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616766820; cv=none;
        d=google.com; s=arc-20160816;
        b=pChkWrjmI2BaEIruDwyVvZWTw+f5ZViab1RLDW/p9BoYtcknq6hMGlu5QhjUyrUrnI
         KPij4Ivt9ooMgINOohQSajyCWZ5gNyJb+lhzTEbOxdhcgB1kNMsax1uBIJ0FsNUbMM+S
         jiAbB+LLVnUNk5OyhgK0VxB3AreoWHaHbxL4prrtQxzzWwE1F4l8UCy65cHJJprSHOkt
         IF+7ybXMFmfoEoGo8TWke66YTTDwUQSqjckiduhMD3ffXzYFCT8IjP5qvB3vl+0r4aYI
         Uj+nOb3Es62Rhvl+eYfeGnmMQInN+SyTpiOTd4e1LFP7rSU8uFfZ0p/dTkAqklY99e72
         D+aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0/r300invH1PxVN8CzcSV7i0rK0ckr+0Jw88XFtPxus=;
        b=IDeA12Jt7lrChFGDAS4L4fOpnE30Zo6BRofLZT3eibZWenY+2yaMI+5VrETL4W5NB9
         WbRjqpNYN9m5kHoM8/x0Y1Y4lDpj0yK97fUYxhU5KqbM26mZrFYDxP+5rUX7m8q5cEp5
         fw8V6w8Iiwwz3RIeIb5DuXlQ7E93z23mCzIiap2FlEEVBlP9JP9sihrnRpL4BvK6Y5Uh
         b6mx41bWmH+v92CsD600yP5+74n+NkfStDWFJWw10qRKBbMmaKvW/utMs79OXtoi7A7w
         tjsrh8NEXyahzPmcRtWk7c4c2e9l+h6dK6PMeAvi6C2Gm92gaa0kqU+XoEYhhDjFqG3G
         mdwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F+8uJDOP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l14si6700984ilv.92.2021.03.26.06.53.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Mar 2021 06:53:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F+8uJDOP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPmuC-0001HU-2r
	for alex.bennee@linaro.org; Fri, 26 Mar 2021 09:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPmu0-0001G0-HC
 for qemu-arm@nongnu.org; Fri, 26 Mar 2021 09:53:28 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:35716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPmtx-0007Ae-Km
 for qemu-arm@nongnu.org; Fri, 26 Mar 2021 09:53:28 -0400
Received: by mail-ej1-x632.google.com with SMTP id jy13so8548282ejc.2
 for <qemu-arm@nongnu.org>; Fri, 26 Mar 2021 06:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0/r300invH1PxVN8CzcSV7i0rK0ckr+0Jw88XFtPxus=;
 b=F+8uJDOPupUnRt9/VZOne9JIiNxtck51oz/MNYILNmqkKnwWqf3vnIASnFo9AnIhQu
 old1xxZfojLBdDUpE+7ydhF3vKQD0DjHhikGJQZxm30qPfeTQoFieafDHGTdqotgTWAm
 kKzDn7oW34O0YhefoPKoYfraJS4HM+bHF5SafpTH3SQT3m6i+eRTrMU1EI7r3uu0+Nj+
 eQ3N+wnIF5c4wk3vQTMcW64tEK83cdM1DuMTuU1m9iIlVgXxxkiteLw22vVeMsEsThUU
 /DdLIp9PyEmGBzbSCcfmjLQ5gQ5lm6vAdFQhbobu9E76YwA5XY6kNvOJSuaSor63oXS5
 GOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0/r300invH1PxVN8CzcSV7i0rK0ckr+0Jw88XFtPxus=;
 b=bjSNv+JYnagCbsHKA11F/hCzOJ6+o6KC30nn+pFtNA7cjyO1mHs+41EzOqu3i6j62t
 +es1jYVor8M9jH0Lnta6ts9DeqGAaTuXvjrOYlX3O6mB4dWl91tA3IqDCb/p+3ddwu6a
 i95BGWFvTEtn6kRJmHKHX22WUPRjC8Hhect6cQpH0RM7qO9pMnxaeoJiJ5mtNWv6KcxO
 cb7DWGeK926Ypr+UW7LhJ8yzzERFB02THryRULy5M7yn9Ic+UGpLjJ15C6zrV9UPQIT3
 YzU3vdphJf1j7VjkEReYdd+N8mTJkB3sny81dEE/NX2WIHJmdHJWFRW//kGiGfLHg9Kt
 UwJA==
X-Gm-Message-State: AOAM532pYs5ugn0IekBhKSf4SYimHHcIP6DspzNCizx1UuDqSV5G5WBD
 qtT4qvBfJi/Cd+Jv9h9QiZW0kdBGKtVH/qd4Eh1UMg==
X-Received: by 2002:a17:907:10ce:: with SMTP id
 rv14mr15809177ejb.56.1616766803962; 
 Fri, 26 Mar 2021 06:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210319195044.741821-1-dje@google.com>
In-Reply-To: <20210319195044.741821-1-dje@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Mar 2021 13:52:55 +0000
Message-ID: <CAFEAcA-qEQ37qN_apNAFK_iKAYY2xMKCpMvU7DpxdcYSY6vNLg@mail.gmail.com>
Subject: Re: [PATCH] net/npcm7xx_emc.c: Fix handling of receiving packets when
 RSDR not set
To: Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: Tyrone Ting <kfting@nuvoton.com>, Jason Wang <jasowang@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s884BiOF4Q0k

On Fri, 19 Mar 2021 at 19:51, Doug Evans <dje@google.com> wrote:
>
> Turning REG_MCMDR_RXON is enough to start receiving packets.
>
> Signed-off-by: Doug Evans <dje@google.com>
> ---
>  hw/net/npcm7xx_emc.c           |  4 +++-
>  tests/qtest/npcm7xx_emc-test.c | 30 +++++++++++++++++++++---------
>  2 files changed, 24 insertions(+), 10 deletions(-)



Applied to target-arm.next, thanks.

-- PMM
