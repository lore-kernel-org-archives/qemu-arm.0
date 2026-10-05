Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165C6CA5FF0
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 15:05:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDkFj-0007FW-21; Mon, 05 Oct 2026 11:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDkFh-00078I-6G
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 11:05:17 -0400
Received: from mail-yx2-x2b.google.com ([2607:f8b0:4864:41::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDkFe-0005gS-O1
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 11:05:16 -0400
Received: by mail-yx2-x2b.google.com with SMTP id
 00721157ae682-8accbaa1c11so12035467b3.3
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 08:05:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791212713; cv=none;
 d=google.com; s=arc-20260327;
 b=ojqxBQ4yuD8xyQvoTp2HhJf5vRm9Iwl/fv3IumHBkE7gmEsW6KnE4rdKY3sp+un9vH
 qCA7Ug2WGqXI/uDUEmgw9vF9ZpFlxXs0UDhRfMm4Zv0Fnkq8vL0sq4JIhKGWqN96UZt1
 9NN7fgBOulfl4aNNANUbgF8ZrsTXKG5AAqEFP2vixvsTdl1Gi2v+TboEmoEBfRTNbq+p
 oNEnFgbk4y++2vpTQw08piui91btk3wmyqJ5jntYK29tWyoSzSnfcykRi+ahRRZ19PdO
 LOlxOEyTMO2N6kCcMJeGtO67CS0hl0qZ4uwquO39Tq/GKyjwKFCPXP4YOwp3ZdQyiWby
 NO8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=8ro3ouLpcMepwU7npi+EYrB9mABhvxcqlWiph0s+VYU=;
 fh=CWTh7C48i8v9Uc5TeFc/knQhKTnRAMumsoWZxNaAu5g=;
 b=J2PAWClBtB5l+sKlaY4Ds2g0qpmn68Gy+mPBone6cTXOnnKcaL2w20DpCG6fYZNsey
 AZwqiA1QeUYGdpcWF0gEdFlCERSwi2sL709TBfXzpMfohL3Y53bO8GSny0jbi7id9WNZ
 1UBnyu2rdGbC9X7oYUkFQMCssh/xiBlvI8fKQXfjrDZestHZ+/NimVICv+HiQfITtV9M
 2EeWvThdDBg748JfaJLw5k5+j+CQq/YzeOQd5mT4nvpgVa1P35sZNlq38IOEw0wgeZ4E
 gE88O+r8A7mUJPmsg4UxmbfbE6Flcn5+KFt22tDqY0ct+JWENMTWMUC/jrEj6LLi5bvH
 H+ug==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791212713; x=1791817513; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=8ro3ouLpcMepwU7npi+EYrB9mABhvxcqlWiph0s+VYU=;
 b=sg7f7h2+w5Q2sujV6xBFJjMtJcHALuW/j8m9PSEssi9b3k25dR+kjIvuaIpm/XDVY3
 ZGbW7SPD5d46n2bHg+to6EFdpizldoo2uCQcb5k0HGkds8ReQ65GfCgCd2cnDtC2zVAP
 dVAiXsSPysQnwTdbZMiX8s4jmK12vT0Wk8ITmD1dwqjdKm+UEoLZ4AWIIMZrbkgEP1nB
 plKvEoHzqtwio3jVt4BMloaMQWqrlsHF7xMV+r4X94uzSk+vp4iyUt/y9AXv+RwWBRih
 W5WErGT1Ed1odGEPjGEbj8V5SKurmQjIl/l1ZbhDsHBy20eLDs8MH3tD7UalS82UvCOI
 aC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791212713; x=1791817513;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=8ro3ouLpcMepwU7npi+EYrB9mABhvxcqlWiph0s+VYU=;
 b=PCzTAcqJhJru+J2GOZF95BDNee5uvCLeZ1yhUiVn70J9Fd0XdKzTW2IbPJEzPHEBpo
 iE2TbKn1QEF7VI83Xy/x7/rtKutrxMzTuYWRbduo6y0zTublifUZezD4/RK18NVkQN1w
 YjjyeyQP/GxknKQThuQXi2/oRkACVZYg3h4j2lh+gSNojIDDiaMVSIXP3AyHCInMor/k
 F9DWleA9T6Kh/xoHOEfyO8zwFC9KIOwsWBs2K5SR3sAPeP2j28r/weY5lg67IocTZh2H
 puQz3+NzEdlsqVese5bE58lLUWyzOpg95N6Tsm9axMrtfZ411zOqza677zu25rcbkLwN
 MHXA==
X-Forwarded-Encrypted: i=1;
 AKwUvBz6DqcYf4jSxK2SA/q6K6SJLMDH7UKLTQMiKqEqlpTmRnJuNS9Q3JRK2wdkSrSgdFCcB0uc1aJwVg==@nongnu.org
X-Gm-Message-State: AFq9FYL9MYupGUC+/ZFQUrA5/MWe8BKhbidA6p7EZKk5s3NjBy3R1RTT
 iHhv15RXPULzaPxpHU+WN4QTrpvdS5+AawcgljGhFVd7NvB4yXptWSbPzoloab4/TIM3BgGOCZ8
 vA4aCO1L/513KlLV3AkRipas6l0J+oRc=
X-Gm-Gg: AYBFou2nbplowzKUBqNgG2FBVxGyRc/9vog/rDCcCPvXnWqyXy2URGhSWbFER4h3AVq
 V6OPQOCvwFTmTG793Rp4ZFsTUvFa1++xlk0sPmJ2CYxuwd0lAnojj9Yg0JSlOFIrhZ1HiED70Gk
 wL3GGXcVFAFV9LSxhLKTNp3w4CrPRyuXZ9SDDh8GFZp3vb9UHryuQ4FIcWakIZYLIvesFnleyjJ
 LzyYtyDm9fG+dQHUSXRaSXGh5CML1t16gEoZQyhwBfoNml7PFCOFPxM9+mwJDSIOIcqnFsNFick
 7c9sp1dWD2xaIwGvQzkW4H565lNIWZYfXcDrRK4/VlFl7u/4RQXRn2tajQN+YoyZS5d0hbllkAM
 /B1zTCd6HkWzVWEc=
X-Received: by 2002:a05:690c:c3c1:b0:891:faab:ff1e with SMTP id
 00721157ae682-8ae3690ccf9mr36088087b3.4.1791212713531; Mon, 05 Oct 2026
 08:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <20261005101800.10821-1-shentey@gmail.com>
 <20261005101800.10821-9-shentey@gmail.com>
In-Reply-To: <20261005101800.10821-9-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Oct 2026 23:05:01 +0800
X-Gm-Features: AclHuK-yqs1FD5anwNhAanO0PQX9KeMjF3ZhrgqC-Wk-swzSZ_3G_5Fw2s9kigQ
Message-ID: <CAEUhbmXu2fhLKD_-LUp-xdQ85LB_A80mW7nNGPNNGARem1seAw@mail.gmail.com>
Subject: Re: [PATCH v3 08/31] tests/functional/arm: Add console test for
 `sabrelite` machine
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Gaurav Sharma <gaurav.sharma_7@nxp.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org, Bin Meng <bin.meng@processmission.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx2-x2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Oct 5, 2026 at 6:23=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:
>
> The test currently exercises the Linux kernel and waits for the first
> daemons to be started. At this point, basic hardware is initialized and
> if the log message is reached, no driver ended up in an endless loop,
> thus the system should be usable.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  MAINTAINERS                            |  1 +
>  tests/functional/arm/meson.build       |  2 ++
>  tests/functional/arm/test_sabrelite.py | 46 ++++++++++++++++++++++++++
>  3 files changed, 49 insertions(+)
>  create mode 100755 tests/functional/arm/test_sabrelite.py
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>

