Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp261570lfg;
        Thu, 8 Jul 2021 05:09:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5PjAadVWVL+CgdO64QTFU9U425YlW2VxIhN0hhplhAmCDPQ/C4Fd76mSchPiShh8pMaTj
X-Received: by 2002:a19:fc04:: with SMTP id a4mr16507855lfi.493.1625746177181;
        Thu, 08 Jul 2021 05:09:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625746177; cv=none;
        d=google.com; s=arc-20160816;
        b=mBP+pwEtdxbbNqh90HnyOk+C1uH4Vfq1y2OXOGmQQxjPcgo4tOpXXNImjgQ64vkWQd
         oLXGQuqPbmSeXZUW9S7RasA9oOd5Y7DLBdP7dbCryCL++8sqoWn6HHUIvji2N/eWdSHC
         gbycdSqCUBY2hcXj5HplAtYwKItcm9TAyyHXHSjYl/YGevSSLYAs4tyLlQ3tt4OMYtHu
         RkCGxlO1Qj5lWsrH7hphxLRFDQu3UhkJ8JY9c0NaD7gQngMxUvS290CiUS/9JGxWsuoZ
         jUJsVfH2r4oGzdjHrVVlhNUWV3u9f96HBYZ74Oht+2iabw62857mYIiSTXH2Ia2lQTih
         JabA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/scE4EpJkwA9DY5VIkr2TVt/pVpYQKawARHhF1AxUkU=;
        b=X8VVvmv2P9/bG0JkUXFqBEqyjEHMhMJ9SEVBXtHKx2ZOaPrv6HrBxLDFH2wyoQgkW0
         oATNgySpcMEfL1/6/KbfM1LzWTvgxhGWobEXiN+TRb35Btmq0tgVTvWQnwLM2rJIY7H6
         OKR/zX1mv34s/QlNHBr0Yfv7YKZ/aWr5f66oKuPcYDwDVZunGSp5Uj7MiRNjWS2x08oO
         NzIvsirqiJ6GqrSMkwWirTeoQpYhqnWrd5H/Qtpa4HWae0AD+bicqidtgktOyBkmBDA5
         Bnnu8V3XolVjUIr9QEnjBL8yBRE1iVKxUHuKBXxuFvc0jLFssbRVysymOcVzAmcjMax/
         5rag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tlsnQbfz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z24si3696606lfu.351.2021.07.08.05.09.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jul 2021 05:09:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tlsnQbfz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m1SqW-0001Kb-6O
	for alex.bennee@linaro.org; Thu, 08 Jul 2021 08:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1Sq2-0001IY-Q2
 for qemu-arm@nongnu.org; Thu, 08 Jul 2021 08:09:08 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:37820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1Sq0-0005Cs-Nv
 for qemu-arm@nongnu.org; Thu, 08 Jul 2021 08:09:06 -0400
Received: by mail-ed1-x52f.google.com with SMTP id cy23so3183542edb.4
 for <qemu-arm@nongnu.org>; Thu, 08 Jul 2021 05:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/scE4EpJkwA9DY5VIkr2TVt/pVpYQKawARHhF1AxUkU=;
 b=tlsnQbfzPqB0c5tkD39hwDlVX5pnMIhZ4qAz+M5nRAA4TXSTgElBZV9LnjB2SBemgU
 WV6kbUG5xGCTn/Rt+dVLDYHWyeMIPz4m0OG46msE+1uwwLQMhzJcJwCKGWQRJRcouZVa
 Wa50ZatGuy6f8ssl3LcOVFZ6cJ2BDvRW3jUhX07BPpbdX/CKZLOk8Qv0lyIxoWIk0VLB
 ACxUgTGps3mGb3DSTULBLvm0Wz33XW7yCT0ozg281PCCSgWVQAQMFNsD9VQzdZbkPmyQ
 3ggdjCxGYYNnrhz7Y2QUiWfpC3kfoQ1Z8tOae3hDlTxx5DfdEH/RUvbO62AlMC8tzf5Z
 PQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/scE4EpJkwA9DY5VIkr2TVt/pVpYQKawARHhF1AxUkU=;
 b=KmXyIgTJWwo74rZbymhKqU4j1/LAYVv7ZtPnNhF18BlabgSaDkks7b2+TkQVDkSS9m
 tw0lMAY2+NNvTzMFJomkqd6IiMtczhB2DmSOIA70/Wfuh8EX0gSV/YtS8a5mAuMpE4DO
 lZ7m8MEO7YrkKSMd0XBwGdXhlGRp4FbrL92XU2xLlo2iI513/lESNm7CMA6RXeSmdjI7
 Y+84W0uO1TBPtnCENAVtkEM9kUg6YAZeIin0kmcczQHL7Eadi4JoivNPVAhagyc6aDTI
 RyfXC5cVlkxR9ujM5wVetYpr+q+NxEyTTyIDSAsxG47cFpzkw3aFzWmmNSyurBV7lYb5
 4zBg==
X-Gm-Message-State: AOAM530VMPA/xWDUbfUXq/NZ1XdNO/zOH0wfGNLqEqaj5e5Po2lHE/fq
 v3lxbv4wJ6ZvM181dcq4mEhb+x0wCFAinTPQbsxtNQ==
X-Received: by 2002:aa7:c6d4:: with SMTP id b20mr13836735eds.204.1625746139959; 
 Thu, 08 Jul 2021 05:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
 <20210630183226.3290849-7-richard.henderson@linaro.org>
In-Reply-To: <20210630183226.3290849-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 13:08:21 +0100
Message-ID: <CAFEAcA8v7dg3YVF+mN0f8znyFa2nNMcCM9TYLOU7TVR66-rB2w@mail.gmail.com>
Subject: Re: [PATCH v2 06/28] target/arm: Use translator_use_goto_tb for
 aarch64
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EOT7RMMXYBz3

On Wed, 30 Jun 2021 at 19:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We have not needed to end a TB for I/O since ba3e7926691
> ("icount: clean up cpu_can_io at the entry to the block"),
> and gdbstub singlestep is handled by the generic function.
>
> Drop the unused 'n' argument to use_goto_tb.
>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
