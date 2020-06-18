Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1546480lfm;
        Thu, 18 Jun 2020 04:29:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsRDdjauxAqZbKersse61sMBkvOFM7bwkjGGw9G52M8T1wHMZqt9CzfT1ByfgJaDelAym5
X-Received: by 2002:a25:5641:: with SMTP id k62mr5685186ybb.58.1592479798269;
        Thu, 18 Jun 2020 04:29:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592479798; cv=none;
        d=google.com; s=arc-20160816;
        b=SFdSCh7Snao2xDIafmvTzRUU2DWjAykWJLoEzdNmqa9A1FB6MuhVgyDJqy/D02sHwP
         l//eCy9bMcUrhQd7P7D2DZ2vpLBLtekcYvCdKx9AvRdzTfsWonQamo5g8SNnjnZUdUQZ
         CjMQyGJCzqKypXOvNRiwACavabRlz18sK110dZ/kSX//qgcZKy+6j4Dn1Fu+HzepA1un
         XPyg3Bge7ydvF05UygiW6ir7Nd5zrvXzI1vuJa9HHfMQIK3R5X1uQEb3KkEeVST+0NBc
         tckylIxz6r6rE9NZkHSdWOdP8O0ol2lAsyOJr4z45NTsY63qRwq6VuboPobTDG4kusQy
         a1Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zk7CuJDbnYiYd0ZkXIw98BzOuhxD4Zd+aQ4kaAV749k=;
        b=dsNGlKD0CEeCySTe/B0i0LSrThPV/U+Ced74ba2J1xLLTPz0JlZnoZdTymN7oZMvsc
         F5UpugypLKHrdyr6/zxTQbATCsCbfJyEGS8j6Ojzj0gKKpyw+tsj2itMBtig/noKGHch
         fDMEMyubWAk086BZ1UcPHLIOTbvFUCu2IOq8By0De0+VPc4veWnQxWKIBvc5v/OEJFyT
         eDD3wwXNWifNflDw4V7uVkF5gkascHR6zgiO6c09/53xQBJ4CUlu5kzMI5WwYnan5YAh
         hTo7mTb+0FehhyGoGGRQrAdJg4n2bSGUYRO4Zir0op6Efjbn6fJklpbQ1lMAorO1nJ2U
         EvdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="rw/ldGEJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d5si2353282ybi.459.2020.06.18.04.29.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 04:29:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="rw/ldGEJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlsk1-0005ZS-Lm
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 07:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlsju-0005XL-7F
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 07:29:50 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:34870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlsjs-00018T-L3
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 07:29:49 -0400
Received: by mail-ot1-x342.google.com with SMTP id d4so4251875otk.2
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2020 04:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zk7CuJDbnYiYd0ZkXIw98BzOuhxD4Zd+aQ4kaAV749k=;
 b=rw/ldGEJvuLkhvO//5QsKFRWM6T9u8OOQI8U+ZRqmOq3X3eMlKfbcxZhrjLQBvRW19
 IvG5X3rf9ufmUHI30/p/g5fcgTw78sm7cWkXQgAC0uuZnEJ9NnIiDgVlH15zjiiyD3Ux
 kDLlzgIWt29VQHxc64GZcLHeP1DGzMcuo/8y1TFAkkk9NznPpYlVnZ9xd0X15ZHtITfQ
 vAZFcx8VfjF63fe+K50wjhuQZVZs5lUXlslycZsj4dFY/l8Dzfu0qvl6e/DradH2wHUa
 3rsU8JPSVSrRJvtQ8mz6TTtQZxRIwGLYJEVRbujgXy/eCODmq5TP6I5cXpHI5mL8/xWh
 RYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zk7CuJDbnYiYd0ZkXIw98BzOuhxD4Zd+aQ4kaAV749k=;
 b=lbUq5+nZ3Z+9GD7y+OvmbDvNt5qthvdIEzyYi1vSzZLDSPUTCW040oo8yGk8NvVOM2
 cL4ScMSjYsSxvG5kNEwhAdN/eQTLQVodEpUjjd+U+uYn0GVe4H5f7HcNWsFMNrKepNUH
 Cr+7RI7YxSi6Hj/C+89fOxT9WC++m0NFYr1xuhUcbpUoyHjW2XgAB/jjR1fB/nf04LgH
 zm9qyXvWcvYd1C03nriIrNGXVOlWpFYYDrcJZ6lwQYwA3gn7D+hvFoZm8T4VbRoIn6Jx
 l1orwJLd5GqQ4yuRLqG8kV0sQ9IIuyiuoB5zaKJEmSOEVDk8X6tSCt/WGG42Sw8EYpTv
 UehQ==
X-Gm-Message-State: AOAM533IzPDbkWuPkZcp6Z1GCvhs2uvhzpc4ZkBxzrYkJrxpOi3DvWUn
 a48ySSPLkARrf8zrpijeZEgJqFbn8T+o86uBkeRS/A==
X-Received: by 2002:a9d:67d6:: with SMTP id c22mr2853887otn.221.1592479787329; 
 Thu, 18 Jun 2020 04:29:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-8-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 12:29:35 +0100
Message-ID: <CAFEAcA8Nwuapyq2e292P_DM0KWRvZY6nSsGwUZn5yO+K3_jLCw@mail.gmail.com>
Subject: Re: [PATCH v7 07/42] target/arm: Add MTE system registers
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UqgXqQU9oPRr

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is TFSRE0_EL1, TFSR_EL1, TFSR_EL2, TFSR_EL3,
> RGSR_EL1, GCR_EL1, GMID_EL1, and PSTATE.TCO.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
