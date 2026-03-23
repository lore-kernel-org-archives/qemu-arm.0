Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92209EC01CC
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Mar 2026 11:33:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w4dXD-00012X-4m; Mon, 23 Mar 2026 07:33:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1w4dX7-00011F-RB
 for qemu-arm@nongnu.org; Mon, 23 Mar 2026 07:33:23 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1w4dX2-0008C0-7O
 for qemu-arm@nongnu.org; Mon, 23 Mar 2026 07:33:19 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-79495b1aaa7so32784197b3.1
 for <qemu-arm@nongnu.org>; Mon, 23 Mar 2026 04:33:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774265594; cv=none;
 d=google.com; s=arc-20240605;
 b=TW0JeM5JugQJEb7mSMf+Fwb1vN+86wjjIQh7lOfWEoEL/Xx+3v8qApBlRgWRWQTK7c
 WIuZFsAZllhXmzV88O0wu4TI7c/RsHPqg+PZvR1gBZqvs7d7jDQkKkzwqUYZDobuzHGm
 W7TWSm1Ayt55wW8ekMRySCkncuOiqkDUhx3hOkGPlmvecB7+GksmUQ948wsdPa3yuj96
 w58p03NkjUfL0rmc/ay3zFqSC4d3VlXW17Bj301urljguQQJrSOItCkKF6jwdCJy/03Y
 nO3JIqotoqky6NYlERKw9BxZLI/3pZQyoU3dKBN0RYHKYxCj/ywmIWb1qHpUD+r80yXE
 z/0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=FhM62Tt4VB7nZIE5qlF0vGKxBb8fB58ACt30oAn51J0=;
 fh=bg7MK+zLsHktLIIhDAD+G2myrku9vBz1ZYgAQ2UwgvU=;
 b=D4bkMrmG1Uo/5ofoilEMVeMPZbCURbqOfOwpjxBc0Wl+JJb8Et80nxvL3V/GDZxW9Y
 OGVlwhDSVqnJwMf0XLvjJtm/6un6IpHxwsXtT/1xITphFDFHWcickWgT8NvPJlMzVQgl
 /NwotdMNH8lSCPs9rgA5493yCEIgswyTw8JzW+1WXwyst81vspUyHEtkqIZjVHwBx1fe
 RyepYgpbiuFWjqx67FsV1K+hstulq6dwOtmPL5axDuZAekU4FeuIpPbKNEWHlOZXul2m
 Ecqzabw6NhOOScc3mSvcquIJ34CqP1vfI1S8kr3ANnhgXNNNzEHaUfdxHsGvn8Irlcd0
 Yc8w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774265594; x=1774870394; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FhM62Tt4VB7nZIE5qlF0vGKxBb8fB58ACt30oAn51J0=;
 b=UIozqCDFKfXQbmXNo/x0cwrmI7Q0m+Di0EOYsrxx5h1W8jjeQvdzzHE0PlfjYtdgfq
 ElKClrxRsiN2bJDivNjkCk6adNE67WApP+zNGIZR8QnqXinc6FSsj/+hQRZGSrgnOTf3
 jhYKoilnXOxUaFncfWakSoLhSBKkoQ++/PXC/my2hgj2mPkdwjQvqUdRVN6PvnXf5tug
 X6VXcPTPTgzbG3kjY82hP0e8XnuN6A/srqI6xRtryHLEiAesUWR1dwNT8itYCxaGSNGr
 c06JsQopKaQ4NUyEKNkL//OEoJG1tfH6kogZlDXCyFJFktJ5tFoXR40XIw085lW9ope7
 kgqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774265594; x=1774870394;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FhM62Tt4VB7nZIE5qlF0vGKxBb8fB58ACt30oAn51J0=;
 b=gauLIzfeV4VdLJW+OVNKsRoQiSdWzgClVd/ljFY5nKpw4AOvCo3Uyyec39JPbjhCmm
 a8WIV8E91ZOuZcnK3cgtG+UQyPpdRIGQ37jahDt23P7f46LRv3ykXS4GMB5mIUg6zOsz
 er1eH3EHAlCzblZ5UO6mSP9bagHXHeQB90S+F2Vfh9ggbsYLrIk3DhyLKBdjt9UdK2YR
 s3o8P5bvvWwZSPvAm2/Fd8FKEKE1WuoFdRknz1ZulCNETCWz2cZslj6kN5TmYkLvKPUm
 3eXE+FGo7ohXhgu8O+P9twLmFwLtlTwsXrvUDDadX0uXrKEUlnGJFxlTUtELjrTwU+FR
 g3bw==
X-Gm-Message-State: AOJu0Yx5IeVZE0WSrAc6/TfXYo2cWsUi4mmEjD7vsyn96BoaoA7ifQed
 FTecvoFaw0nYpUVYkA8ztXE8Z89aXgUHLCTyWGbp4MKb8h6yb2Ud/gdgmN2zijZBgLdrt4Doxtg
 WA1iISEqdLisH3I5nx3zZJVTa07TOw6A=
X-Gm-Gg: ATEYQzySrGh3iTOG+hO920To/+LPEvx2LQfad34T4gL556Py3/RGM7szlzgHQwl5Kuc
 nB4BpKf4v3VBD0UNisypQpHUJmTUvjquvD02rjt52Ke/uG2gCbR1iSJd/gREYYSR4F1InK2HD3C
 SGe8YyXrjkjTOqBm562VlOMDBKHqi/5JLMJaKUtIPwegjxr6w/tiY4CjV2Ms3ztpW6R05YdePYi
 IwKO3UEPQvCxPc88PIpItjJjeUrBht6gqO6SHgKmJBT4xTNte8+r3e/uZlfVEzP1OuMCWkBppEG
 +Ir0dS4bbBZKfO1WNjw=
X-Received: by 2002:a05:690c:6e83:b0:79a:7cff:7b81 with SMTP id
 00721157ae682-79a90b0de31mr122129717b3.27.1774265589657; Mon, 23 Mar 2026
 04:33:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260321231916.2852653-1-josemartins90@gmail.com>
 <CAFEAcA8N4kMYW1zNmSpiMPXG-MUjh2awiZbZuFtOnqzRW+ir=w@mail.gmail.com>
In-Reply-To: <CAFEAcA8N4kMYW1zNmSpiMPXG-MUjh2awiZbZuFtOnqzRW+ir=w@mail.gmail.com>
From: Jose Martins <josemartins90@gmail.com>
Date: Mon, 23 Mar 2026 11:32:58 +0000
X-Gm-Features: AaiRm527RYpJdtz7zSltK3zpo_1iyvXFpQonttQfXX6d5LjRDX4pAf3qLiLwxKs
Message-ID: <CAC41xo14hePcRU_=FMug5tCfJjygo052EZc88MzBEukfcMxUyA@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/arm: fix s2prot not set for two-stage PMSA
 translations
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, richard.henderson@linaro.org, 
 qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=josemartins90@gmail.com; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

> Hmm? That commit doesn't add the s2prot field or touch the
> get_phys_addr_twostage() function. I guess you mean
> a811c5dafb7 ("target/arm: Implement get_S2prot_indirect") ?

Yes, sorry about the confusion.

> The code change looks correct:

Perfect. Any other actions points on my side?

Also, to clarify, to reproduce the issue, the bao-tests repository
branch to be used is at [2].

[2] https://github.com/bao-project/bao-demos/tree/feat/mps3-an536

Thanks

