Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1CCCCA470
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Oct 2025 14:36:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v68n3-0007Gt-Ar; Tue, 07 Oct 2025 10:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v68n1-0007BX-2r
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 10:35:43 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v68ms-0005zc-Pg
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 10:35:42 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-637dc2292cfso6935440d50.3
 for <qemu-arm@nongnu.org>; Tue, 07 Oct 2025 07:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759847730; x=1760452530; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=l817tQ0CAOwMh1yGmq7kpTPFN6crwASh92hQQUobZVc=;
 b=XEFJZ3K0SBA1cd8mgdaPt8jteachicwDWRcs9sI9Knz1TqPT3CW1g+JjjetnW2qZRZ
 iUb2XbkmbwkUPUm80l1FsBKG9miIsLEBrttwoyt0s69/gtefuoUU3YhDsBVSTA5ObSPe
 S2TRGVFicmoSn8Dg5n0+8P8MP7teJQpQ00zI1SQeXWGABSIbr98VhdeI6zDKvBp/7dA6
 X8NLDtw2QZViiaOfV2h4lHPnBPMyP7XlmzXvFD6TVY6nTWsART8QUApUcSXpOY1L/00Y
 3zc8F0XQSv7qPgS3jgMI7Zx4zz7HdnLX/hYeLyKoy+BE8HCOxC5jEnzbw6XezWrmajZW
 MlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759847730; x=1760452530;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l817tQ0CAOwMh1yGmq7kpTPFN6crwASh92hQQUobZVc=;
 b=LVdMDZlWHj8XrBIGjigAAtiUJ7g5I+YjF8B6IMBQDh94XEdTeRPTfjUajV1srnBPvo
 vtNLcG5kH6F2ORkc+18pkPHZ/73sFpiCpl1vw1QfSUUk2ckziLp+dZE7+OnRe0RlGya9
 hvW5gcPmEsfFRbPczJMW/RDF/rC4qJd1wZd2Ag0uBKR7J0/mKKNuqw2cJ7Kl7IhnXOgr
 jSqEB4VJC75fQVbcSJMLZ+Q8k9ClhNru/0Lzx7ACvWiInNrG+94SH8Kot/fxOGyB9M82
 IPJS03EZHevI5YOc39L7IpCUAAnq80CJq4QHYPSr6emfHLTLoIesil1rtJYqWMjupcu6
 Y6zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNr5MglRdgz2QfzTOwlZJ8rsmrcb17YqEKu4y4OouYS+7awitX45W5mZ5EFolYVWHFRQG9PN8gBQ==@nongnu.org
X-Gm-Message-State: AOJu0YzG7+3UosRO3yB4WQeyxZvWEf0YxaUDi3xQRq/d7UJivQ+vSDJC
 7DC3T2twW14Yx6LJVX1VOGXBDmVd4JEjqkZ54WlSFq8qbK0ez6ZB57yfP8V3vTsepmUSxA1d7M4
 coOo38BF7TA4345DO8ktvlWk0Q2sR4GJYcabCCRgYnYj4ovnbhj67
X-Gm-Gg: ASbGnctTm92CJfK8aatq4vxfqKqdsAdB2rPCgF5QB3WNCs5uHmp7GWL/yMESEz2nAFt
 EDGF6q85YkSNAQpZ7CAzm299FQzddpvWobyM3LpSJfO+YMxxpdDDNLlRwj1KNXLaVj0EgBJFoKv
 21nC+10uG9hxKDkf5Xug0jA1wI88Le1b4xQclHfOER+iSrr4ldj40IaZ1Jhp+ZMKTnU69eduY0/
 Lvp2aUHFHnbC82TP0DtegoCpD8n9cKyhXEL
X-Google-Smtp-Source: AGHT+IFUypfGJZrFx9+ilj7+5Wx0ivve6ifNZ6S3vwiCSAx5xYNgofLxnJbLr9wfojC3ciDIpBspEdH5hnjJchecucY=
X-Received: by 2002:a05:690c:3383:b0:72f:d215:60a2 with SMTP id
 00721157ae682-77f94591e37mr265330207b3.7.1759847729743; Tue, 07 Oct 2025
 07:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <20251006001018.219756-1-gustavo.romero@linaro.org>
In-Reply-To: <20251006001018.219756-1-gustavo.romero@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Oct 2025 15:35:17 +0100
X-Gm-Features: AS18NWDTXZhYUUWImV8sYrX00LSfivqjE_Q37Tx5cuqnUwkM9_kG3aUZ3gs0K0w
Message-ID: <CAFEAcA-S-U0nsDcEV9cYyZiyShRLN_yuKkUD9XJ_GrOiGh3=-Q@mail.gmail.com>
Subject: Re: [PATCH v10 0/3] target/arm: Add FEAT_MEC to max cpu
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 6 Oct 2025 at 01:10, Gustavo Romero <gustavo.romero@linaro.org> wrote:
>
> This series adds support for all FEAT_MEC registers and cache
> instructions to the Arm64 max CPU.
>
> It includes the FEAT_MEC registers and cache maintenance instructions,
> but does not modify the translation regimes to support the MECIDs, so no
> encryption is supported yet. However, software stacks that rely on
> FEAT_MEC should work properly at this point.

I only had minor tweaks to suggests to comments in patch 1,
so I can take this via target-arm.next and make those changes
there to save you having to do another respin. (I've just
sent out a pullreq, so this will be for the next one, some
time next week.)

thanks
-- PMM

