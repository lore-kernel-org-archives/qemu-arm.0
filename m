Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1657351lfu;
        Thu, 28 Apr 2022 04:33:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz20jYycuqX8fVWFnoCAyv7QfWcdDRt4F4wpHzcj7fdDbYzaCHEEinCtFKdz2HDArx1lzIq
X-Received: by 2002:a05:6214:e4b:b0:456:5325:5b06 with SMTP id o11-20020a0562140e4b00b0045653255b06mr4730356qvc.77.1651145601341;
        Thu, 28 Apr 2022 04:33:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651145601; cv=none;
        d=google.com; s=arc-20160816;
        b=hiWJhMHYy3Dt9zSnsg6jFqd0QRSWSgdOEH3uXRrpneLU4zsQOmC/gi9CR+OQi0R6Jx
         wmNLkKIHaxBA/oZzgCDemHjibyDMb1Coo0+w/e31V8X6lyxKuGteDOls7QyAnZI5pVZj
         xtR5avC68rXdf6hDL+yMmU/jz5KlB5rbAdhvRN4XxMtT8SpB++NP6tJ/BfJ4TGzA6KW6
         UMz8W61x8R6ZxTuy5o/kSPu1YM+gLRHHQrs4bM6rlwRY4CB7aCrkY3NxCug19okHDl2H
         U62FN0sd4uNVAJnStxBjg/e2L8L8o0oXhYqotNalpK0w0JbuLT/1v/7E0v1gJPvAGMzw
         MQ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MZNFHOGf5hUSZB77p5SjqAlvbcou9dQwvV6CosDCZ2k=;
        b=kOoPN9JFul7U24uq7xyB8zHo+iOEovLSBdLZUqj6wX/hZRDGsXsmBpWrsvZ44h3pdn
         0NpJCUrNSovirEPOQ0+dgdxlI8BNtdv62s3eVej/mMn5O84nLexjajvw68hSbUh/MpWE
         NWNIwhbN6uclEChbf++zG1PlNyz5m2zbB1K+/A7Hfc/zRtW6HEhTFFNxLwSWrvFL2Id2
         IuOFETmLVnbWFKSHeydJ4KSoNglzmGgfPPyhkSgDDhZ0/C4/KWK7RNoqzseoCjUn7Zi7
         Iu2HmU8NcYuwAXTN/yNExLYetIPR7wd+IEu9k+wI8bT6UU46iN9V60qlXamohDR4MnOT
         PWRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gv9IwORW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 95-20020a0c80e8000000b004564637ef2fsi1554522qvb.209.2022.04.28.04.33.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 04:33:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gv9IwORW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk2Oe-0006O7-Rs
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 07:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1hc-0006ho-9o
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:48:52 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:38156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1hU-00023w-0c
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:48:45 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2f7d7e3b5bfso48285947b3.5
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 03:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MZNFHOGf5hUSZB77p5SjqAlvbcou9dQwvV6CosDCZ2k=;
 b=gv9IwORWn41jSrF8ZM0A6AF5S8ZUBuWLGK4uBjUkZasBGy6zw/GjhxRH7uV/qKzr43
 pqqcf/raGHVplIJGOJsdh7l6S7yCw9MvUUM5yIWzjnLhP0RJYkbMG0QwILw51jv3pwnC
 j2DnOZ/DX+2x/IvCK1zzh+XcM90sATDzArt15Rh+A8LKmweZs+f38Gw8iRn27WmmKNbX
 34WU9TQldVP8Afr4kFyQyKkYSDxaF2pGs1mV2rFAOC+m1D85ALgGkPi2SJp6u0CohIF8
 8kdh5UGDvoDQgeWdJ7+o45KehZRpON27BchwuNSdXwDmZojm2NrPK2cq6WDQB8EESDfY
 U92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MZNFHOGf5hUSZB77p5SjqAlvbcou9dQwvV6CosDCZ2k=;
 b=o3E4mghh/BaQljVfhUDpzNAFOv8XzOWm8wEotl1whNftnu6Vi6y+9yCPz/M+7tRVQK
 MUayX7yr86bgDiKbb9zJkfW+Nh+Q69ZXEv3mfNF1myPs+p7g2IjYJfgdmK/vN8krNGk8
 dw2TL3VxLupD+GPYvErqHezdcSlZgY3JlCwbF2a4fkLojVqvhaujqaUAPM5gf3OWTFmg
 b642vbmONG+95LaUkLUX94bw2Z6kYuUKjUtdRLVWOIYTyBb24YDTNlzX0fY9aaDOLsNS
 Dxhu1406Vz6dxNNKz3FLipqoUCmhFavHdj/szsYr1KbJYjb2DZuDnMAkOOy3d5T/fsKS
 zz8Q==
X-Gm-Message-State: AOAM533FJDP4c0GPpss8GW4yGA8YtFyeCjfAVqHs3vgDAAct8M5tlah/
 7CsOm61S2UYenHu/Tv7VMD+gIOZt24Gi765BMXhvpg==
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr32588645ywb.257.1651142923153; Thu, 28
 Apr 2022 03:48:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-45-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-45-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:48:32 +0100
Message-ID: <CAFEAcA-FgJi1=gwwhFj1sSusrSTJUtRQ1jO+TKEtc4tKv89gBA@mail.gmail.com>
Subject: Re: [PATCH 44/47] target/arm: Use tcg_constant in do_zzi_{sat, ool},
 do_fp_imm
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sDr7OG3qoDjX

On Tue, 26 Apr 2022 at 18:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM
