Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8039CD8C9F
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Jun 2026 12:56:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWZWv-0001OU-CK; Mon, 08 Jun 2026 08:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWZWt-0001O4-3Q
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 08:56:35 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWZWr-0001nB-G2
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 08:56:34 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-7dd3f176f84so49369607b3.0
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2026 05:56:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780923392; cv=none;
 d=google.com; s=arc-20240605;
 b=H7eaS0Uo13XhyK2eAj0kXutbshx96Gkn8BLa+B8b3P9t4bcnJZKT7yRj54u4Jx/1yD
 C1buZp0fGAAW9FHScy9WxFfrEcMV/tqXR+fug+H6cMGDZs6i+CRTfkvmy5W597+mQr79
 7L2x4L3jaqQ1wnhQM5VFlMlwl7VWNUrgz/ZfyhgdoOKO3yvEipeXIEAR2Ew/2lptWvNK
 KAs567zgZOZwYQdkofnwO4W+uxJvMmJg0D6fNcr7Tv4s+miPyGppBjK5LUomowtMz2aO
 zdUR8lrfBIJOhb9DO9L/kRilR+hZkmt+Rb2WlDBKGVu4/k2JvfuDpy4w3oHZbfimeBjc
 rarQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=1vhrGzGthU5Lx6YRYT4B5rIyCbSWWkxMyl9+Cf6n308=;
 fh=ohJ+yvATv3t2rbZvaPDYoFWqH1gARyyH+J+GNEMQzC8=;
 b=Oc+Ok66wyTb3fVVQnJ03Vstn87G88R9ZbtqjeXsZ9CpK9W4W79IPg1Lim3R/HaCiQc
 RQwGhnIoM8FWPYJ+6nwvT19YYx2E9WTyBNf3+ammbvHyCNYcHOAhhBJ890OcBAUqXRzr
 cUHkIvHYzgKIjyy7BGuesLxPXJixkmZPuhUHhp64AHrUaPm9/grBO125mZJ03eUls6xt
 ZgNBd2z/1SdyXGmpP+g/IWvz5XnK1b8tSSevKkAV92yBAs13MGqbbsiQCA4K+nM4Vcx9
 DuAK6pyYkdBeGezc6ihDkCxrgPrLB4y1fA3gytLIWh23hW3cpJt+spjtgUsvwhVk9gy0
 9Hvg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780923392; x=1781528192; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1vhrGzGthU5Lx6YRYT4B5rIyCbSWWkxMyl9+Cf6n308=;
 b=HFOwcIdk1osylyJIpykXGQeqaZzh04LTCCVZQnw1T2J6Ry8UkA2USWVRwZaAxZfKSj
 esTS+PRz80vUlBoCPbTuXLj7QU8fxvSHZAgDZCxfVgqco4DnGODSqKnyQ6EqW0G1IHCj
 oHKf6AGp62aHUH4rVrJ4xoBYcxoPdeBJhBvwPGB3crfBIC5u8cS5Qv3L1vOeY4doaV8b
 WMDUuzCXcHw2UlLASPZqJm6+Jc//cKMLOJi0xQXtW6AE+TNmeFb4GMMy7poT9YjEDw3w
 FA3iG2SgeNxW8qLpeammh9WMN1aNkiAKoyx8+lYOhZEVfTbt3vSqUhyxiN/zgQxfJENh
 pimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780923392; x=1781528192;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1vhrGzGthU5Lx6YRYT4B5rIyCbSWWkxMyl9+Cf6n308=;
 b=X7m+Ss/Ts4A8KB1y/ktkdE2/XPH5yb81mNdVerLUJoXUHdLFuo8lnwkcwI8/FkAvMX
 qoEsQ4zT68T7bHZwRkoqOkSP2JLns1cIvS77VxNm01kiexvaM6pbGa9x0NRKYXvjvgrB
 Df4Ztz/x2Sopevg1m7GdCsIgjBv5bJRhYB6pz42vaKoFgP2eLJB8bbu04nAjy8KI9yRx
 BAJeZDnph2VPxipzHl2yk7TJV4bS917liJY3aMut8ocXWvrIwScA5Qvj5tmL0gmRLPkT
 LbQebzkF19Wg4Cm3tQfivChywSuBlQeno4vKN8TD3VngQ5p2B6ky6OwXqlnqMTG0ItRJ
 F0bw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+x21cDXLvrge3tyfvnG9VwuMpFMS//+WJirrW3GkxoFiKZihZ9phChU4K9HY3kXdgr0YvBVgJwJw==@nongnu.org
X-Gm-Message-State: AOJu0Yy5W19rQC75DC01QGkV7HCTbxAX1JMY08SostsHZ/aHnZklqtlX
 MW7s8c3z0yCC00gJ2ClelgyJyfc246xGmwh8rvbJ8pOaV6ljuYLqAT6xNQnUiLyvIw8Xy3FLT/0
 Njz3SucPpOfNbDWETGGX6HurO/NgSTncERXU3ShCFKA==
X-Gm-Gg: Acq92OG3usKmBc44FWGuz87gRzRiMjmUXGhkKFsjhS5n1l4TDEsaGgYOT7j6EOtiPOR
 wqAxpKn0StBB5tPt/iAruBQv3qnriRqYBP4qezSjLG6w3yV78vvCtEH7FGSGw5vxtVM1NgEYGhw
 S4oN41d2k92DZLZHDfkX+ghL2T9Yecr7XjBwNHxRaQB6dvz8nmX08Uw8A1HNUAeQV5GtPrGfdZQ
 CsNFfgqf/D+lMyrF92gLCSgo36wzQQ/wDvIC5kx3nOZJ8tyPodQUrXjqBNEtdAcgYYuLYiphqmW
 B8f+IQJgpUmKPgt8cnll36omGp4Hla4YSgd6AjNvAJ0E9JPEOleIBMBV138AgO3inbcvOfgkBWT
 gAQ==
X-Received: by 2002:a05:690e:1242:b0:660:74f5:7e19 with SMTP id
 956f58d0204a3-66106942890mr12396289d50.0.1780923392126; Mon, 08 Jun 2026
 05:56:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260529-feat-mte4-v7-0-ccbd3c14eb3c@gmail.com>
 <CA+1f7BA1Xbmb5atHKfFpd5K5VoXKo1zCmf4M6cH+PkQPifPXug@mail.gmail.com>
In-Reply-To: <CA+1f7BA1Xbmb5atHKfFpd5K5VoXKo1zCmf4M6cH+PkQPifPXug@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jun 2026 13:56:20 +0100
X-Gm-Features: AVVi8CeBYvBKB9VZHrRfLfdZelVZKRuYZh99KN4ozy3VDz6vNq6ZdcVdhwqeS8c
Message-ID: <CAFEAcA814k29Gf2Zm=exmPfO_2cdAmKGKvUOUJmnLe8JYdy04A@mail.gmail.com>
Subject: Re: [PATCH v7 00/15] target/arm: add support for MTE4
To: Gabriel Brookman <brookmangabriel@gmail.com>
Cc: qemu-devel@nongnu.org, Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 4 Jun 2026 at 08:28, Gabriel Brookman <brookmangabriel@gmail.com> wrote:
>
> Hello all,
>
> Friendly ping: I have an external deadline this Sunday, so if anything
> needs to be addressed on my end I'd want to know soon.
>
> (Re Peter's mte-10 segfault: like Richard, I can't reproduce it, but I
> am happy to dig in if Peter can share a way to reproduce it.)

I can't reproduce it now either -- I suspect something went wrong with
my local rebase of your v6 patchset.

Applied to target-arm.next, thanks.

-- PMM

