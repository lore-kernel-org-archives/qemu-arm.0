Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4512953ejc;
        Mon, 6 Mar 2023 03:07:19 -0800 (PST)
X-Google-Smtp-Source: AK7set+JQ6sPzwzMz9aq6lBdSQz9nW+XVEIxnUdtgzpYxYqlBWl4JlmY8LaJTiYOHRYFbXnOUzTq
X-Received: by 2002:ac8:5c47:0:b0:3bf:c25c:838 with SMTP id j7-20020ac85c47000000b003bfc25c0838mr17296591qtj.68.1678100839481;
        Mon, 06 Mar 2023 03:07:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678100839; cv=none;
        d=google.com; s=arc-20160816;
        b=s5eqbFsXsXpPHE1e8oqAjEzFk9+sDwmFjPFOJtP/NV6LQCIvaidxH8FsEbzRbBbyGD
         Q9otO2KQ5+tv/cqOL0FczvF6DV+uPDB5C7a5o4aaYmG2HsKFhR0/n7+WFmj6WUPLTYti
         WSuj9voKTLBWrwqwC1Whc4wcm/aqLLMGIRcwoFitk4ZEcwbNJHhv7hSeaMIx/DVWKQC4
         2fALRAqotosS7ATRVklZ/B+Rqoeipj32twbhG75r1Vftf+Q/eu5uIrxaN2KvMrmhfqC+
         JSxbKkIb3mOIYgSUzNgmqFic9KWsqks2/+v3ZkkqwzvjCK/7+q2uZVgerhga5Zv6YSCk
         pKWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Rr4V+jrFwQrumf1QPMJF3igThABONkkyboUK/mCNsDY=;
        b=WKudhEWjLsLbaVsgcDmlB72ZcNNZQ1Bv+z0kELqlcFNNnCQnHX1Lwg9FMWvBhu6WF1
         Y4HslzOiVnumKuB0yAVF0/+EvkKnsxZBmRmTPbuzJSBMakIstiUtST3njZdyzayhc2J9
         dZLIK+wRZHsTukuHlnSfLm8w6hsad8rol4Zn4bleWRY93fkHNiBxiQk3u+MEMAJWDtXe
         VxnMELeecH7EsBckCfPW7Vk2maSFLjej8aeyY3w91f7PqTLNyNoYpEry+uyN8J2SPVcL
         PYZffBINNigSAJ6Cweg7DCf1Y07ZBZelq0S4CRGxOOSc5UW+UgMxV5CHBesvmyQBU4Xj
         8WCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kahk+iGE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 21-20020ac85715000000b003bbd8bdb936si7120955qtw.794.2023.03.06.03.07.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 03:07:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kahk+iGE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ8gT-0000WE-QM; Mon, 06 Mar 2023 06:07:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZ8gS-0000VR-Nx
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 06:07:12 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZ8gR-0003nD-5L
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 06:07:12 -0500
Received: by mail-pl1-x633.google.com with SMTP id p6so9926207plf.0
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 03:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678100829;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Rr4V+jrFwQrumf1QPMJF3igThABONkkyboUK/mCNsDY=;
 b=kahk+iGEqDvcel2IBsIpnhLOm+6bufbLAwYN8KNLSSRN5jGKwSlHauIHiMclk2nov6
 jSx4pgmHaVCzbyVca26xtFNMOrnUG1Kzn1H8f7vQ+DvMKW7JqVU3TVYCzACR/9IEb9zT
 JuT+U37YYUm1LspNwfIm4MMDDr2QT2lilBXyENTRawqXVqxvgpx1lt/QpuVakWsm052A
 bmSNqKp9x+Q62kqbDlbjLqwwgZwhl3HtQKmGvxX5a87f1BeboqSbPh83TKVLDePclRQb
 UHmoV8LPAhVWknJZdSvqvM5L9ihPL9ChGv5LPmDyFm6XoUaLYk3pMs9g3roAFt+jOncP
 bRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678100829;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rr4V+jrFwQrumf1QPMJF3igThABONkkyboUK/mCNsDY=;
 b=WGauJ8rbY4cHXD+kNYHD82Nam6LEs3bQ1FUM3DMzEFkCbzUP/D7PNB21+6sN6fuW+G
 IGXiDpHiPUr6clELyTcYs6LRJaJZA5MFChgRF7fD836CMUpSXWp+y4UPAvUxwSDlnmsw
 aFXyfsDaUYHloJMjsevPfLufhrgFd5cGmtkMrRcLOph2GBWQCJnfNYM0HgJ+D/C21Xb3
 O+miLk4Z5JBOEpIoY/DBaFY3GUuBZCRZZbf2/nbg3B/USTIDOT8IacPIrudmYjU6gkF/
 XqPPQ2aEFZb1/09P0yHB1EdzJOX0z6yPiZZ+vRVu79+OhmBIKrrrUgkCjwC5naIPzH85
 Q4Kw==
X-Gm-Message-State: AO0yUKXO7IXBqLeuNqGSFgTzmU06Iu3TXXtQ8R1fyiQ1g8v9k2OYKXKf
 GQSIY5qukAlZCLLk0lgS2GIDoE697NywrgW1ZFFOdQ==
X-Received: by 2002:a17:90a:9512:b0:237:50b6:9a09 with SMTP id
 t18-20020a17090a951200b0023750b69a09mr3883110pjo.0.1678100829526; Mon, 06 Mar
 2023 03:07:09 -0800 (PST)
MIME-Version: 1.0
References: <20230228003713.861168-1-richard.henderson@linaro.org>
 <20230228003713.861168-4-richard.henderson@linaro.org>
In-Reply-To: <20230228003713.861168-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2023 11:06:58 +0000
Message-ID: <CAFEAcA9RJ0YTPG52tazPBvo7=DnmotgpoXKPyS=SD3d63ifwjg@mail.gmail.com>
Subject: Re: [PATCH 3/3] target/arm: Support reading ZA[] from gdbstub
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9ot3YN6GHmty

On Tue, 28 Feb 2023 at 00:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mirror the existing support for SVE.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


> +    g_string_printf(s, "<?xml version=\"1.0\"?>");
> +    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
> +    g_string_append_printf(s, "<feature name=\"org.gnu.qemu.aarch64.za\">");

Isn't there an upstream-gdb-defined way to access the SME matrix ?

thanks
-- PMM
