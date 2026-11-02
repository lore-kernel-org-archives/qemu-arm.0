Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8607F606A324
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Nov 2026 10:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Hs+5AJ86
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNpS4-0006bo-Sq; Mon, 02 Nov 2026 05:39:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xNpRl-0006a4-9W
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 05:39:25 -0500
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xNpRj-0007jX-RN
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 05:39:25 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-8b09e07e149so21512377b3.1
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2026 02:39:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793615962; cv=none;
 d=google.com; s=arc-20260327;
 b=etstMjuMQ4IRkGVEGv3Gf73yL8Na87EA2afTt4V9lN0GafJ2M2w72UiybkZzXd5iJB
 CkM4s6pfdCP3tB4LW8Dw4PZZFecw4Y3Py0sD/Wwf/aOvx3YKsL+1Z5uxkX80oTZGTwrx
 rh1IoPYGurdTWr0aU0RVbf1fxhcwCe9V8KUjKnl3J6atEU4sFqZRKEHhQQRrxZWxsbtN
 8SZ24hjNwo/2db67YsqMfNtpegGAKIb4ZtiK20/QzAtpOsdyrl9H+jQWzozBtbRW8d80
 +QrH/6V+Gj7QCUmY7fzLuL27i6kZi/6jFNBY+9s5s1Np5HAkN/AcDn9h9YZzcs1jh3dl
 QKvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Lhsubxg6k7hazRlFI0CwA7rq6OJj8CB4c1RI2yEn2Vo=;
 fh=p+fWdnKR90x3jVUF1qq6AxxIIflzkKnRmPMWa9WGEGo=;
 b=OPRad+MYecxJsZrgib1VIyi+NTgdcXHFmcu9CZ1MfSRLWi2CFgnFcPOFMlKcg6pqK7
 IV8RU7QK4DRHGMjey4XY2/sndyMS+E6UvGTl/WLWEtwLaJwAaePhlazUNG5kvrwkAH3z
 7TzDKI4RMJL7BXeapX9BzuGpr5FtVBiHV0vQLfaBJOutMTFG37LUH3oJH6FJmvuo3ZZX
 wnJteo1Q53Q4P4Z/+qbECO/cY9qNiSqhl9dmgoqCQWwiZ5fZMy95f7hQaEaM51gIOAjy
 73kY0Fek1FTH2Uuf28v6mKXshCDPCOugA3HanqjdGMjiusgJMBPavJiFeZEV5a1nAPZ9
 u+GQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793615962; x=1794220762; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Lhsubxg6k7hazRlFI0CwA7rq6OJj8CB4c1RI2yEn2Vo=;
 b=Hs+5AJ86m/mwsAOh2oflbeq4Ezo0dNstcUkaYQezoLDWo/KTIsSiZNKpsPEsS++pcs
 UmY3KueqRGDSZTXR1X8cGvQWmmE2VochySZSfL9A4DbJbFUkdsErxHpipk2sbczUcDgF
 rDUXxmJfv4LaffMOAX2aJdPnyZ/f93OcwgIz93EYrLaE/ADfujbERGo5ClXKl/jdXmyf
 Mh7A1Lr/TPSDOcc+kPd7DFKACmBg+CpWrHIFhnqbrvEduUTjxP3WJgqnnqID/CpkIhay
 jv9J9UH0G6nPeYNinVC9lo1T/SkZzYoasQdfubdqjXlrCQroOP7J8zYTpOKMMaxQ+WyI
 It8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793615962; x=1794220762;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Lhsubxg6k7hazRlFI0CwA7rq6OJj8CB4c1RI2yEn2Vo=;
 b=MAmrTYfOM3ToxDtlHdYzJKTg9cIFS4UOk3cHiXQJylWxzCPqmqJjw7EM34b0//vgPG
 Yg4LJLBYzGV5nh5/pSkElSCzkA+p5mtDbzJFO+24XGYmvFF/+54vS6o784gqRLs6Hx+D
 1Lqt6CSMHiiF4aAo5DLWyzkGU9sSmOPQalFCNaWvkHeDvJuhbDjFUN+HPGYFm5Cugqbq
 Om9MsEoj3LY/sY/Msu53pSSQP2SGetlMXWmzTQe5Z7CWndO8SKECbMXGvbhCgBwd+8c+
 +2qQxXSvWd3PXApvyqw8essjyYH7vUmQrgIxbuINtjeRNomCTFZiUiwLkOqWkmPKsyzy
 pl8A==
X-Forwarded-Encrypted: i=1;
 AKwUvBw6kc9GsHDpS0VhzokvpPJ+s6Y74gqWA1N5o1BfkdxwU9RbwMD4+aJx4XUe6DrUztz5h7v0ef0JVQ==@nongnu.org
X-Gm-Message-State: APuU4Z/OBwpUXyWmOMfR0hqE1TlGCf6hl6P5WSeoNWhZIfjBL6sfb9hK
 48pyV76fIrQQOcSe+1weWem11IgIrxOq7AV3z4KCXxbc2efiWExLubOMXDF2bXnRp/bDlOYrNhQ
 lNsar2XsvxxTSM+lTz5LHZjbZfbUGqFlDYxkiue7cQw==
X-Gm-Gg: AYBFou39HFAEDz2xPJrjSV2cmCBgHEMPWxHwL9RaDRVD7Ldqw0lzHmSy9BCEmRGb7Bn
 wXYxQTSsRRn30Wjisa7avhpbcXU6X6MhqIaK7WGHoM6zfGHlLKID8PTaQdcsQlbs73GCsfRYHYO
 9kDOFTaqFx4lKHh6bn6FpCKV/8e1Vh1Y9gtH4VvJqFBC5owR7O5AznIlYQvD89wlsFq04ER05de
 3NIMgA/pzkBjBGPalodUgBKkbsINHNENRxFpqFVtM44W6igKcAbaBLPOW+lCywRCEXwh5Warn84
 VVp7pYwMtrmQw/KE0FxtnRk66Wd30kxZ7ZidhryLStw8IxOB3JLyX29WzbtNReeQEbyYhc1a4dF
 m/nES5HgNv8qlr1qvWJKDSlClsFHkieCODqvheud8NEbuWKnnXzdGOqWJuDzWJ2Hm7pVuArM5Te
 tVzF3DEu9b0zabNKPXS5J8
X-Received: by 2002:a05:690c:74c5:b0:89a:63da:faa6 with SMTP id
 00721157ae682-8b2b67abe20mr59077857b3.97.1793615962259; Mon, 02 Nov 2026
 02:39:22 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1793613972.bcm2835-fixes-v1.git.lorandmarton.dev@gmail.com>
 <6262fa90e0dcbb87c33ed61c53ef55e83335a45f.1793613972.git.lorandmarton.dev@gmail.com>
In-Reply-To: <6262fa90e0dcbb87c33ed61c53ef55e83335a45f.1793613972.git.lorandmarton.dev@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Nov 2026 10:39:08 +0000
X-Gm-Features: AclHuK_tZq1EnjsojruP6sV6gJ3fWTFSzvgRDF1C_9UPK9gKStirdUWl2NLw8FI
Message-ID: <CAFEAcA9NmpX2gRdP29xnxpOzj_67Pazsybi7BgM7K_206skSdw@mail.gmail.com>
Subject: Re: [PATCH 5/5] hw/misc/bcm2835_cprman: a PLL channel divider of 0
 divides by 256
To: Lorand Marton <lorandmarton.dev@gmail.com>
Cc: qemu-devel@nongnu.org, philmd@oss.qualcomm.com, qemu-arm@nongnu.org, 
 farosas@suse.de, lvivier@redhat.com, pbonzini@redhat.com, 
 alistair@alistair23.me
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2 Nov 2026 at 10:33, Lorand Marton <lorandmarton.dev@gmail.com> wrote:
>
> The 8-bit DIV field of an A2W PLL channel divides by 256 when it is 0,
> as Linux clk-bcm2835 describes it (CLK_DIVIDER_MAX_AT_ZERO on the PLL
> dividers: 2^width at 0). pll_channel_update() took 0 as 255, so the
> channel and every clock fed from it ran 0.4% fast, and QEMU and the
> guest disagreed on its rate.
>
> Test the rate of PLLD_PER against PLLD with the divider at 0.
>
> Fixes: 957458111280 ("hw/misc/bcm2835_cprman: implement PLL channels behaviour")
> Signed-off-by: Lorand Marton <lorandmarton.dev@gmail.com>
> ---
>  hw/misc/bcm2835_cprman.c          |  6 ++--
>  tests/qtest/bcm2835-cprman-test.c | 49 +++++++++++++++++++++++++++++++
>  tests/qtest/meson.build           |  3 +-
>  3 files changed, 54 insertions(+), 4 deletions(-)
>  create mode 100644 tests/qtest/bcm2835-cprman-test.c
>
> diff --git a/hw/misc/bcm2835_cprman.c b/hw/misc/bcm2835_cprman.c
> index 10cad07623..144e553432 100644
> --- a/hw/misc/bcm2835_cprman.c
> +++ b/hw/misc/bcm2835_cprman.c
> @@ -184,10 +184,10 @@ static void pll_channel_update(CprmanPllChannelState *channel)
>
>      if (!div) {
>          /*
> -         * It seems that when the divider value is 0, it is considered as
> -         * being maximum by the hardware (see the Linux driver).
> +         * A divider of 0 divides by 256, one more than the largest value
> +         * the field holds (Linux clk-bcm2835 uses CLK_DIVIDER_MAX_AT_ZERO).
>           */
> -        div = R_A2W_PLLx_CHANNELy_DIV_MASK;
> +        div = 1 << R_A2W_PLLx_CHANNELy_DIV_LENGTH;

This kind of change should reference the hardware documentation, not
the Linux kernel behaviour. What does the actual hardware do?

thanks
-- PMM

