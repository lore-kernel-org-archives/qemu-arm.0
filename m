Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D6FC44508
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Jul 2026 15:27:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjf24-00063Q-6Q; Tue, 14 Jul 2026 11:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wjf22-000636-KF
 for qemu-arm@nongnu.org; Tue, 14 Jul 2026 11:26:50 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wjf20-0005lS-WB
 for qemu-arm@nongnu.org; Tue, 14 Jul 2026 11:26:50 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-81e97f3b3efso9076677b3.3
 for <qemu-arm@nongnu.org>; Tue, 14 Jul 2026 08:26:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784042807; cv=none;
 d=google.com; s=arc-20260327;
 b=FaBzNcJTbYLVnTvXcwqbk2z/moqgqqOgfloFn+lRS7VUgrEmYRApLMg7e/XU6x3sZ5
 /dj698GwrI501oRataQGM6yHfCmFeuhrzAcxZPN/n5uI7wlhZ3TX7L2v1jzeeXGFT+z6
 0pGVHc3hONoS0aVt7JH4lyRNtQJ3+Q0D/AxJGHwNn9FIxq3i+tbFVDC0I22lxy4bzaVN
 j/timav4gcICg0JWzKYusROlryPf9rv4yfdyZHurIcKb4apm6uT1FSDtghrgNXPZwuiB
 JBFQduBP0fAt6w3rqEe5TMZDLJeZDjtB0/nOmakqGWKf0w3+y5Og2PdRTlrKASpY3xz1
 NBMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=z1kAMXC9Fsrzsu3wy6G45NcKTFRzU/dYRQXjW306SC4=;
 fh=S7D/fwbv9GEUVH3fhDIdxGOzYrAwqRDUGZl2OEDJvTg=;
 b=RsivccrE92biU/SUDAFJS/Q21XWstxpD8uk8dB4kmJRKB7+OIffPxZ7wnhXRBABLDJ
 JxucFWg8SCizev3LBazIqZQ+vzu2Kc9TiHxiVkrVCyrEU9r1ykNxjGpz9s399AyM1BiJ
 tdAcQujriFvJ68pjZ0v+QEgBxGkSvwM005GYbO6db9FvrCcpGIY8bNKq6QnPOCUdBtSE
 RnyllaaO3E3JIRXCwrcTND+ZbTlP77yl9iI8GyQw/a7By7TCvsMNea8Cnf4SyVvfyPCc
 TgMZSH+pqIGV86AA+X+u8S664fZQgm81tBVcyGoyMuJRvliMoyYJPQyGkFXFRbzWIwUk
 RFjw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784042807; x=1784647607; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=z1kAMXC9Fsrzsu3wy6G45NcKTFRzU/dYRQXjW306SC4=;
 b=DL5az2F4CeXTlHitqaoGMoo1MEzD7J8mcuCK3Btc0CfxsgypRBHGwFyoQYPmcAEsNc
 CeMgmZ+ybQBXjrNq9MTiqmmSUGPrIXzO6RYY9kIGO1VUqxKKlvAwFUGgfBSNtc/02i00
 87CZfs2kXdD1R3QK+A5sb8bPMD1dvYwr0u13meliHoQmNHb5BWABLlD08UzoZhHFiNU7
 W/3Zlu+0865oqtph1J3IFYcKKkiutshis6iWlHqZ3ALFbbhWLO5LrP+zwer+2D9kXQpm
 SCCGgI+11sP0RvawlmvfPad7btdWCEIc1vXjqy1TZ+1jjEJ+vMpqDjaPJh8OxxEWucHR
 cavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784042807; x=1784647607;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=z1kAMXC9Fsrzsu3wy6G45NcKTFRzU/dYRQXjW306SC4=;
 b=fqocdvyd1ZUIoyW1TAJsU+0kt56gVBiL60C0SCEOsSZ5onlq6BvT6AQTImyCuT05lZ
 4Ot4TmKdlcPoP7lDO6m2N6wv7IWC6Yanm8+1O4TVxyy5z8W1+Igt1jh1HNexJtHTiZGb
 FhctB8fw2zdB/RBF7OPGZtM6SrX0Szp+Wwv6XIYUu1HlmaCxP5gGaUuoC5eurzLzzIYX
 X6o3fX2zwMmXB1QL8c90VbtkH1m83uop1H2pRd4Eqc1p2LYjtMxuLUroVeo0zXevgh0y
 noGWjqRsHCA6PdhEkomLvXV+cbb76z7pELVqZSMxgFYfDWClBEisMTagikjVHucGw78P
 zdkw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqSMdJmsQZyDAkg8MkGKhVyUCDdxQdTvzg+uMxIBr+cCQT9lGsPOxu3NoLlvzLo3FH9AQ1QoeKrfA==@nongnu.org
X-Gm-Message-State: AOJu0YwpFKWR/KE702defObH8w4l7kTO70FRnaMzo6JEvq0b2j6k31H8
 zsNXQFr/8AbzKvEgu34Ai60qnErpNhPEOHsWQoOww0nNgFAUVQKUQpiqo8LuMCcbYc4ckkPv7kD
 jJXpwoztYluSOx71RXD9PbVa8/zUG3AU=
X-Gm-Gg: AfdE7ckTChYH7Wq8AHS2ZrKnoIO5eJBQRw5QeuRjdB3vLm2PTJ9SbE0w/8XeLiFQ2bg
 mpVgKMvsfBcwToB8RLlcElcgYS6VW23y3i6cspnVmxzUFaq5W+H9OI5YSi66jLRlbkj2+6c850A
 OJEJCS52401+6NNYlR9y1tayo7spbfEEK+rQ/maRfjrcCY0ns8csauPW+e76/mMNBUCiXKRnO5l
 gRzdnvXOCB6jMvDa4BrqkgLDOSPY0lj7hEX4TM9EEQCGuzDfYPLAAHdG0iQ/P32cnMJlxEN
X-Received: by 2002:a05:690c:3746:b0:81e:4aa9:d02a with SMTP id
 00721157ae682-81e8ffee750mr101117027b3.6.1784042807533; Tue, 14 Jul 2026
 08:26:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260714124621.522948-1-clg@redhat.com>
 <20260714124621.522948-3-clg@redhat.com>
In-Reply-To: <20260714124621.522948-3-clg@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 14 Jul 2026 23:26:35 +0800
X-Gm-Features: AUfX_mxvqEgfqLFCJSor1aV2Ajst-Sde8_xQ3mDERUwuxYV0Kld9Qgo1Qr_KCHo
Message-ID: <CAEUhbmUmRVkhJ_fa7astC=5dVCcHS4N=B5MgZ3c1R3iVrdxRCA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] tests/qtest: aspeed_smc: Add fast-read test
 coverage
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Bin Meng <bin.meng@processmission.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Tue, Jul 14, 2026 at 8:47=E2=80=AFPM C=C3=A9dric Le Goater <clg@redhat.c=
om> wrote:
>
> Introduce a spi_ctrl_set_fast_read() helper and add
> read_page_mem_fast_read (CTRL_FREADMODE with dummy byte) and
> write_page_fast_read (user-mode FAST_READ) tests.
>
> While at it, replace the license boilerplate with SPDX identifier.
>
> Link: https://lore.kernel.org/qemu-devel/20260708111544.1440761-3-clg@red=
hat.com
> Signed-off-by: C=C3=A9dric Le Goater <clg@redhat.com>
> ---
>  tests/qtest/aspeed-smc-utils.h | 23 +++--------
>  tests/qtest/aspeed-smc-utils.c | 75 ++++++++++++++++++++++++++--------
>  tests/qtest/aspeed_smc-test.c  | 39 ++++++++++--------
>  tests/qtest/ast2700-smc-test.c |  4 ++
>  4 files changed, 90 insertions(+), 51 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>

