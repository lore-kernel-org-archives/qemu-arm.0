Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4EDCA9EC5
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 13:04:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGFhE-0005su-Mz; Mon, 12 Oct 2026 09:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGFhC-0005rn-BS
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 09:04:02 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGFhA-0005GA-Qs
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 09:04:02 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-8ac8a2ac52bso16932517b3.0
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 06:04:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791810239; cv=none;
 d=google.com; s=arc-20260327;
 b=kVTjfLBKd2G25AgdOp/xEEGXwlximZ539eS+paloGe2VmFjxxqepURyWv2bVY0mRnn
 O7HOi87YSY/xsSxP53QboxSUZs8AKGJjG0T2vliw3jslGEU67b8hxU4jfV5X1SzwCnqm
 4MEyzloxaFqfK2Nc5mJx2/++JLJp/n2eG5xhAFq5kbsr2G8IrxtG9+1biByDOUBBeVvr
 t6O+Mq8SJr1N6Ry5pAVb2CLsxjIDzNrIvSv1p8lykl3IugJaMXJvXr3U/hoV3Cm6KiJa
 elvARvNJTNU9DLGdWjod8HYrcRshPD3rn1FMcz00Y2XinzKmOpmoM5p3VFhDYamSS3H7
 khTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=M1Ceg4BNxPx3Lp7b7T2/b14QKQtr9LAb4SftbUi0Pa0=;
 fh=YMUepzGprEfePr/tg3nRV/N6m4GbH/ARXhlcW8R5My0=;
 b=gvtfwK8G4qFZgisq/2myK9C5OAVkKLAhd6sIX1L8bfrTe8FtoPiFLlVq4RgGWIaVQt
 HRnrlgT407K8S5vlejH5OvS/zQqT2eFFZZO02IYPnKb0hmnX9AjMlGE23rnMlF4YW5HJ
 hZjsEmkciR+5otmh5MIZKgo1PI0MWngbRo78nE8rEFaXGOAAfx7TyhQ3gyepWHkpzbGn
 i8MBs0Da0mvJncRKx6xoumOQReSh12fVe0+35rSHXMGUj8HepsuWUZiHzii2wIOPGsz3
 B8qhDksxxcvbdCeSy4zXpO5FEdmTeK3XJ+mEHrNYcuy6o88j8FTHqd265DwD7Rc7j96Z
 26Vg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791810239; x=1792415039; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=M1Ceg4BNxPx3Lp7b7T2/b14QKQtr9LAb4SftbUi0Pa0=;
 b=Ds6xThXBMKgAV3kFQaEScYP9SWAgzepMWf/JrU2yF3Wpxq3vo9iMS6FWGhbAbK4eHL
 JGOtFQngWkdoNtFJiq5b/4Pa+jxgnZ3zA8MWXcFrgRpfF9L3zD5InJ2li8LgE+LUpust
 2DB8CTfOYRvMQHwBjuKydBFTRa4bhG5k7zhz4anEExOLWq1m6kuRR55qJPTKQprEzGUS
 MM/5brIJJjonDKhO6ZVeUv7bQjdvv8nfQpCAa7a7INnt+Zy1ebQ7FYNlykXchedCMNPG
 RQC7dVi7x6IPq4G83IuE/7aGs3uJVzs2ZhOB25E2Vl/7MoEmOPXAIkYfudcoRXBuf01X
 pu6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791810239; x=1792415039;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=M1Ceg4BNxPx3Lp7b7T2/b14QKQtr9LAb4SftbUi0Pa0=;
 b=zw48Ou7KpKntorjnl1jPDqst+ybJ18CkTjVsPxKAUA3lcErxSCfWl/9AdNPtRW5YOD
 Z626OnGIqKBYruAfy0BGCcCdtLkpBVvwB/p2v3qktk7B2ZXGUrl8ZkxIyjl9Cgn0xd0g
 3epZaZpDq5vn9F/IG7bYqhy+32fT308do40MIH9qs5quVGKcG/yjMfazbWwqonWFiR82
 FRZ9xKBWAXE8rpVgkm9s1k6Dvel0B0WOjVDusWly+qsrZQ+MjY6c0kRi8N626uxvMzfw
 Fxu5Rj+T/sOdEnO2FDbYfiGLwkNjYRcgBklTMUhgZRKOG15dDTi5fhLtLjrdFV7p7tiC
 sCFA==
X-Forwarded-Encrypted: i=1;
 AKwUvByW7RGJXp+UUXt1wL1qonyiIRTd7LLWqDSEFb9Q9POr0iclfqA4JTXw/07ZTBUyVOHxZuCurrE7GQ==@nongnu.org
X-Gm-Message-State: AFq9FYJ5kkw1YCiWrtRMmbYJPa58X4EhVGrBkwOF1P4UtPpjDvqBWKbB
 V+8l5ehIgSRx+RH5h9j6g8GapjUqPmkc74q4Sz2zPTpPeR69GatOo6CfQE1KvJR1bgycboH4iPU
 XspaWXSbE7z43QankBLiJTxNS3i4AcV8c0SDb2kKpfw==
X-Gm-Gg: AYBFou0BFHhwxlL7ik7e7glLCZ3lDciF/mxiT4lHU1Dgqr+u3t7hBuumfiv6HiWAxS3
 NXGCf6nWJCrwS7/Rg39NwN9DZ0qiZtsmxvY7zF+UUDyFlCFW2hHd+BOnNllDkD/uM7qJa3RfSEV
 Aj9I+bIePlo1MLqmERumputvcNZ3VxeFl8dpYy+AQu3OJOl9OcnpeqUcs6WvtWRA1euj6QHnLoW
 MgFuGuNbE1NB3EcBybFGZveBjYHrc0Z+qW3Z9Xzitg9dgZDgt9Q39lqln+K2CgxzLDLWkCzuI0X
 BD8oc2ZBHvsRxqk4FwriElGUEiJgOlSpW4X0rFDkKQbj0amwT4UqeHS/Sjnbav4Qbl613HYrwsG
 nxQVcVisQ/txWmZFzNXsEkfHuJT8ce2fz6hnS8yA=
X-Received: by 2002:a05:690c:9e:b0:8a9:a1e9:2665 with SMTP id
 00721157ae682-8b07d3c4195mr32928067b3.6.1791810239141; Mon, 12 Oct 2026
 06:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <20261009-allwinner-gpio-eint-v1-0-c55d2958ae0b@gmail.com>
In-Reply-To: <20261009-allwinner-gpio-eint-v1-0-c55d2958ae0b@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Oct 2026 14:03:47 +0100
X-Gm-Features: AclHuK-Yhq9VknjquIDZElJveRyqvDNiTmgEqsgz-0iIk-SIKj9yfErrpsvrh-Q
Message-ID: <CAFEAcA9PfDvtOgXnUeWkB+h8bGTRzZLbsUeoLeORf-o1gF6jkQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] fix: Allwinner GPIO interrupt handling
To: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 9 Oct 2026 at 17:26, Strahinja Jankovic
<strahinja.p.jankovic@gmail.com> wrote:
>
> The original patches assumed that pin had to be configured as input in
> order to be able to receive interrupt. However, after additional testing
> with libgpiod and gpiomon, the pin is actually supposed to be configured
> as EINT (0x06). In the following example with PH1
>
> root@cubieboard-ng:~# gpioget -c 0 224
> allwinner_gpio_read [PH:CFG0] -> 0x1061061
> allwinner_gpio_write [PH:CFG0] <- 0x1061060
> allwinner_gpio_read [PH:DAT] -> 0x49
> "224"=active
> root@cubieboard-ng:~# gpiomon -c 0 224
> allwinner_gpio_read [PH:CFG0] -> 0x1061060
> allwinner_gpio_write [PH:CFG0] <- 0x1061066
> ...
>
> The CFG0 value on the lowest nibble changes from 0 to 6.
>
> This patch set fixes that behavior to expect that pin is configured as
> EINT in order to allow interrupt-related functionality.
>
> Tests are also updated to reflect this change, and a new test for pins
> configured as input is added.
>
> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> ---
> Strahinja Jankovic (2):
>       hw/gpio: Add EINT CFG to Allwinner GPIO, fix interrupt handling
>       tests/qtest: Update Allwinner GPIO test

This series fails "make check" when patch 1 is applied but not 2.
We need to retain "builds and passes tests" at every point in a
multiple-commit series, so that "git bisect" works.

I would suggest moving the minimal changes to update the test
to match the new behaviour into patch 1, and adding the new
get_input_pins patch in patch 2.

thanks
-- PMM

