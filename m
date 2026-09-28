Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7FEC9833F
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 13:32:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBBSv-0004yj-RH; Mon, 28 Sep 2026 09:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBBSs-0004yN-MV
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 09:32:18 -0400
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBBSq-00089h-PB
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 09:32:18 -0400
Received: by mail-yx2-x10.google.com with SMTP id
 956f58d0204a3-66f7f72a284so2812472d50.2
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 06:32:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790602335; cv=none;
 d=google.com; s=arc-20260327;
 b=UlBe0LnC3dMVcQ0AAO/WEtxuswSejqOivxL4d4AKMEF13f7kJAbEYCzqU/qySIgmj7
 lOrNNgh98P0ioXO5zqTPLaSmKpMlHjrF4xJHj5twC7CO3HoG0wKFSuPwNSKZaF86Fj/1
 h3GzPrkteKQU01rAUD8dPk6hGs8B3bH7OalF+Y3mvvrya1r77+VuBTgryRiaD6RklSA3
 qWtCpU405JTxZ57SLrqQpg+acymdjZzuZH5fa/Seb1JHzo6vRtXFyRwTxZ4HsKgJ4Srp
 HrynhUry+fYu2O/sS8DtGy9Vjdza5NLz7hiEovyOGmYPJ6FKGjni1rnNPIGyRDIRgYvK
 z0cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=S2x4BjPysJO/R7Swhc9yotr0VmBgmUO5DB5in0JygH4=;
 fh=oeKfNlVrJq79hD+yTQCycx4RS4j55JOdJIPMJbXEpzU=;
 b=oYjzZ6mfkVaK8Paf/7ibMMZe59E8mcKCqFmG42Dm38vffL2r+UDLI/lxwlq2ViIj0R
 by6ZgRkYsDb5uc5hWLR230AzYHXQOJXAlFxjHcX1Tio3989y/dZGIXY2hzd3V8qjZjh3
 y5mzk6vT/CMRJwJ/1PBDpXeppIAqgmbnViDi3lxnDFG3h1IU9/6y2+r9tSDxsm29t9z0
 0cXFt8I+AFSQif6TeRiLxniaVt/A0QUVro2vFmh/eGVbTUqKTW3GGNBdpNOW5CRUvvV5
 CWx1yN4Oad0MKFFAz+TBZK00IrQTP+Kac26QuBQQTwaknPnEjVm8cXbNhcUf9SwCd1Kp
 9Uew==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790602335; x=1791207135; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=S2x4BjPysJO/R7Swhc9yotr0VmBgmUO5DB5in0JygH4=;
 b=y/4uh0lxRy0Vl4GqpHvzIVQAZUcMSNaJtfdVd9MBX8roKIiAR0C2vPV7gVQb9Lsqog
 hqMUWUtDLzww0WOElN641jZgpf4w879r0YQuQTnvWyBHB29YVoFZtATl2PnUcg7/JPvS
 oi/nVsnFaKxHzr9Rb0tWQ/1ZB+67T6C6+YOvgDVGYpt5wucKrf8QtADyr/T5koQHQji7
 ri4+RcMnEXgBxjeWrM8TdDZkpogm8E0k5HSJ/pS4A9b1KUzZuwEtOdtKsTUFXqXjOBhs
 1Z0oKNQnVJS+NJEgNl+QUWkY/6AMFxI/kfqV45SFmjdiiTIMCLWuwy61RU1ypFG7n8q6
 koRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790602335; x=1791207135;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=S2x4BjPysJO/R7Swhc9yotr0VmBgmUO5DB5in0JygH4=;
 b=oh+2YEbRcAsVLufrGPNpTRuZL9Jq6rmKKTv4s4dTx7CdT9APD39pXNfC/fw3I6EJGf
 lHfa+BOIVw4GW8sddVQMtQA2lcKfLksuUcjIQXI6f7OQm4eF7rwsHPtIIm0blsWUVIxO
 R1iKP80Tv/NWxpRLk6Xpzjr+foKts7OTgh6lCXBctUW5Yl0hF6swAvzdJmSMFutJK0hs
 BYqKLeO325yQlaw329FX0Q95CT/0gjvn2ahlIbDnFMHU34xBM0OttpxfGSjtytXr5mUf
 hnJmXRQ5kPoc4pNPZvQyvCBHVDxwTbIUA95IUZF7VEikKER4DLf7uSdMW6MZlTLx2t11
 qFYw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzPTmshDzzBac+FQiBjFnHUJmPH+E/hljK0NMJb7D8ZzPu4DXhHzS0bHPhgNYGyqSRJPIvjoqq/Qw==@nongnu.org
X-Gm-Message-State: AFq9FYIN9I97t516rIUFTGboE9xI6qO5jQAGnAfIYqL53zniy1zXiQ5o
 hMM5dse+Ne+oHeFPFixJdkqWUv6FQdk9Wgt1wFRUvC702EDTiAQ9fmfUFla8qR1VnO6j3WiUmPT
 d9UHomKPxUDz+/2xVpYZNQE5dbrUsuUMoxJy1m7RfTz+MEU1L3KiQ
X-Gm-Gg: AYBFou017L9YupZh0At6g1LRFqYD8AWZQxKi6Rvr0QTFvcIeEewIpih/4e6oUkQZEJV
 JTjm+MLsTSVA9d8DmhWX0n79vtIVtbbechPfs/cB7L14jkfg+PxCv43K+oeJF/tWFvyT4mxnF5s
 ckX+g2vDm+mlOpuyfQ5HPeSlNmOSTjD9MIBRBuz7RRJReZEHcadfvzTRld5ys3b6AsVyxJ35MM3
 4DVtZnUwvtRz7rFuyUt+L9SWLH9uCjPbP/olxVRQBn+KEjwh5BLJoYu8cPZnzB2V9glNvgIikzT
 jfDkjF/JPV3Fa3BZT9AXra/gDl8IAB8xIbZbIDKXYjDLsH7sFpM8VESjf1zcz4+ciwPdVuQiJM7
 Qdsh5ty6SIRTayThlRTGBnKgenTxdYEwvoQByLQPo
X-Received: by 2002:a05:690e:dcc:b0:674:167d:4c8c with SMTP id
 956f58d0204a3-674167e32ccmr3144554d50.103.1790602335414; Mon, 28 Sep 2026
 06:32:15 -0700 (PDT)
MIME-Version: 1.0
References: <178983644340.22135.11298603231632238119-0@git.sr.ht>
In-Reply-To: <178983644340.22135.11298603231632238119-0@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Sep 2026 14:32:03 +0100
X-Gm-Features: AclHuK8spmh6a98nThSv0xBzDsOthcC0wyCC-u-fF7cOvOXEZhmdXem798Yn2K0
Message-ID: <CAFEAcA_+BKABAFeTLgacVd0Q0TMxyD=2qyZn_+ia_6u232icag@mail.gmail.com>
Subject: Re: [PATCH qemu 0/2] hw/char/exynos4210_uart: fix overflow in fifo
 implementation
To: "~jprx" <jravi@mit.edu>
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::10;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x10.google.com
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

On Sat, 19 Sept 2026 at 17:47, ~jprx <jprx@git.sr.ht> wrote:
>
> The Exynos 4210 UART FIFO implementation suffers from an overflow that
> can occur when large buffers are sent into it. Specifically, this
> overflow is caused by the underlying circular buffer implementation
> making use of a store and retrieve pointer. When implemented this way, a
> circular buffer's capacity is 1 less than the size of the buffer, but
> the code as written assumes the entire buffer is available for storing
> data.
>
> If a large amount of data is sent into the UART when FIFO mode is
> enabled, the FIFO may overflow before the guest has time to receive the
> data, resulting in the first part of the message being lost.
>
> This patch series includes a qtest that demonstrates the current
> implementation suffers from an overflow that results in data truncation,
> and a fix that switches the Exynos UART FIFO implementation for fifo8,
> which does not suffer from this problem. After applying the suggested
> fix, the test passes.
>
> jprx (2):
>   tests/qtest: add test for exynos4210 uart fifo overflow bug
>   hw/char/exynos4210_uart: fix fifo overflow

Applied to target-arm.next, thanks (with the tweak noted in my
reply to the second patch). I have reversed the order of the two
patches, so that we fix the bug before adding the test case.
Otherwise in the git history there would be a point where "make check"
fails, which is awkward for "git bisect" and similar operations.

thanks
-- PMM

