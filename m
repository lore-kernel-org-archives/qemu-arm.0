Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C51606A31C
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 16:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=df5mcEIh
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMSxV-0005VT-RV; Thu, 29 Oct 2026 12:26:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMSxT-0005S5-GS
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 12:26:31 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMSxI-00020M-02
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 12:26:22 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-8871ada1a26so19894147b3.1
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 09:26:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793291177; cv=none;
 d=google.com; s=arc-20260327;
 b=hXFnp9Y3BXJSevRfwkVnSoNB1Olu7VoLTjVX1B36bTU9MySz1etlJeLFGuFibw9OF0
 mXBFGiQWZwfN5yOF+4zG8+KON+ZTCGSMSAnfKY+CEp/ttCV49XGWe8C31KbbI00twj/M
 w/g4vwcvKxCXR70dPGfCO0ga4MtdgQAa0ujuA57e7t5JYw+zMeiPgwk9STHvou0DLJ8f
 OWkiyq16mgb7f1eWAojO1KsqE0Vwlezd6gJO/NRDROVgiazLoIh7PMGs8L3E3Z1nAfaX
 KLy28ycyubSRm1m7/fA6G6E/vzs/wuYm67XtpwWpCbAnW2yZa4GSwL4va5HBtypPVfE3
 Z+xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=rboMDpBeuMnweIqqF0da+F+NZQ37KR/cgbPO9n8wc+Q=;
 fh=VRy+WWFKssDFB4L3wDTEafMY5BpDE7wu7ig0ZaXapNI=;
 b=KFEf7egWqBP411N3o19Q6jlHUsq1LgkD9UznYWXN8eqjL3EClZRj1YyB2e3pou9cFq
 iY+pUfDYBWisF9iQQ4eWA6t4AKmkWQ5kvt70N1Czr5ZVw+5fFC+dlN5z3vDvFLbkY/eN
 z81iLNm5wNrt7Nvn9rkmkOG33YKcS7oEgsx3JSEYukezYAYstCJibzOG04zIK6QdhkKV
 AaGH2aR4K8GLT2hSV7bGxZTdHwr3d72W30ShHTt+jl6yWd7joGVLhmRVjIf+QiK3WQhx
 IbuUmiEGCnZt/g07UEAsKxIn0QtkAzmTVdFTNiJzdB+VXFds/SO9QIsfjN1aIfK++Y7N
 PyQA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793291177; x=1793895977; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=rboMDpBeuMnweIqqF0da+F+NZQ37KR/cgbPO9n8wc+Q=;
 b=df5mcEIh3hGyyhQTRh5XN/wLvuaUvMEoxn8RmA2c7DGzjj330KDKLCAAu2bJyMvvei
 Odzn094e7pbiWCe9qOjpRR3zaxtjdKJWGo5URZLDdKJ21SfF3fRALduv9Z44maL4CSLd
 y0p9uUiXAWUyUh8/5DXjva2ARRI52yYa64iVuHN03SAyGHBVibHjfLwUtAkUjtoZdLVn
 5V91hcWhQTGJIdGMfsq+47xlKVgI054n/9G/Qemducgo5+ukDiLhg0evt7tqLNSblmbc
 Br8Qsff+JWKoRwoB634YbrLyIUqB8RAIGoXFendURaZZv3IAxpDB/XiDTvqmveiYUp2v
 zevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793291177; x=1793895977;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=rboMDpBeuMnweIqqF0da+F+NZQ37KR/cgbPO9n8wc+Q=;
 b=Gc0trBBJoWBMenusIjsIAo7yT/44ysxrJsmAJq+uQuNQfoBW3a7iY/iedyIrJpR0EU
 IkbChLwzqS9MYeRGD2uPFLim3JcJkqD0ZWAV7idOWYqpV2zC9bmSXmQIiVSvMJG82SN4
 oZ593wb3I5lAU4JEjvZMGVaGDk4pcmJfIAM0vSE50jrGD02ZXud4wBRY6o9FeKkEn5uH
 lscF0PMJyvI9gWfZOYGPO5cC3sjx0SdPi4xNUGu5ubkHj/wnXdavRnzAxmL10VeoQGmC
 aB8NvbbQRmkVThiHPfD45DNYbRpyT7uK0My7o1X8EeRG0lLJKYEJNu5KGjAkJ7UphATZ
 yzmA==
X-Forwarded-Encrypted: i=1;
 AKwUvBynbnFUDq0s6J/h+ZPsi8w2US8R60UmRwiMLWRAISzA7dQvXmI371PwW3/saeAw9vlhb6MibtprOQ==@nongnu.org
X-Gm-Message-State: AFq9FYIc2r7PzB97umn0vLZnZKo3qmisUChLiARMtwJPfqvpUrpt1tVN
 G/MF3tGpbu4lj/7j48Ot7HNsOQPMA1IXPlhBxtnP1d70+FVMPX171g4XGiq7U5HhG+PvE/esyh5
 F0tA0hPmIy33FZAgRcxpHkd4lJIZILuvvjN0vNwZJtQ==
X-Gm-Gg: AYBFou2vON5jPN2Iln6L8Ix7ZkXfhfZ/OpmXA9kzY2Y0ddEtdHMfAxVm7oSqZhnBPVB
 F8tLanqyvv45BtFnHtgwLS2zYf6iPire3Aw9zpkDENfw9DTEWMO1fIrmuJiY1pBCcIkUqK7lHju
 Eq5kLjt9YzwmfV8iDQ9Q7CZQVDWQALpN2CxWEbhYAUvZ0x1/8paNBJDr9eipOdRtSmBSbzHXiYH
 cxkBFb4gGF2hsLyelk4M2lwukq1wkw1frUPoYzEAdsPurSdFjbfBPfqXY/h6VOJGr8lc4PK1zE9
 oz0jjoaZbdOW0/Iif3pg5xR0V19rP8FMPDPIuE6p+L7EgDOzBDwINK5hv2QgRw/o2BYyW6BmhML
 2ykJU+RdG3tTrN+XINK4ZWpGpb7fTfsIgc8/pFdlIajvdbQXzzw8LUzRnVqB7zFYmbYxTSqfbRm
 Zm4b1BvN6d5ogbN3T5iuSV
X-Received: by 2002:a05:690c:a418:20b0:8b1:691f:ab4d with SMTP id
 00721157ae682-8b1b5ba3a5emr25186867b3.35.1793291176643; Thu, 29 Oct 2026
 09:26:16 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029161310.2065290-1-alex.bennee@linaro.org>
In-Reply-To: <20261029161310.2065290-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Oct 2026 16:26:05 +0000
X-Gm-Features: AclHuK9976iUpOpY-stlbaM0kWQ4mM3eEGmCkDu-jTwWO864DgDQWSG___DuduQ
Message-ID: <CAFEAcA94Fv1v2zZX6LaneTXd5+Zp=EsVRCL4NkCdcyJH6Hkwww@mail.gmail.com>
Subject: Re: [PATCH 0/8] fixes for 11.2 softfreeze (checkpatch, gdbstub, wfxt, 
 bcm fb)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, 
 Chao Liu <chao.liu@processmission.com>, Tyrone Ting <kfting@nuvoton.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Hao Wu <wuhaotsh@google.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 29 Oct 2026 at 16:13, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> A small selection of fixes as we approach softfreeze.
>
> The core changes are tweaks to the WxFT emulation which fixes a
> deadlock when the vCPU goes to sleep. There are some tidy ups in the
> following patches including an import of the test case from one of the
> bugs reported.
>
> The is a quick fix for a gdbstub test regression I inadvertently added
> in my last PR.
>
> While checking the series I also ran into an issue with checkpatch
> which I have a proposed fix for.
>
> Finally there is a random bug fix for the bcm2835 frame buffer.
>
> Alex.
>
> Alex Benn=C3=A9e (8):
>   scripts/checkpatch: validate fixes against origin/master
>   tests/functional: fix call to common_tuxrun_gdb
>   target/arm: hold bql when SEV sets the event_register
>   target/arm: don't pass env to the sev helper
>   target/arm: simplify wfxt_timer_cb to only trigger cpu_interrupt
>   tests/tcg: import arm wfe test cases for #4670
>   tests/functional: remove @skipSlowTest from quanta_gsj test
>   target/arm: fix bcm2835 migration issue

The WFE fixes are target-arm material -- could you post
them as their own series for review, not mixed in with
these other unrelated changes, please?

thanks
-- PMM

