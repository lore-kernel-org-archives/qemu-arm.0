Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp3415202lfh;
        Tue, 31 May 2022 05:26:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZFgZ1/lqgl+XPYVrXBChigzDpxJrFb1NrE6Yn9jglSRpgJHNWGygq+hxtlhrsDLpRkA/x
X-Received: by 2002:ac8:5cd3:0:b0:2ff:5954:9a91 with SMTP id s19-20020ac85cd3000000b002ff59549a91mr12264424qta.433.1654000003326;
        Tue, 31 May 2022 05:26:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654000003; cv=none;
        d=google.com; s=arc-20160816;
        b=f6iUILEivv4RvqxuOzShGyCJ3lfCZcb/zKFjIF0J/7CjLYNTIo3/2TYMnlO+z0b2Bx
         0tuccHdMT1lu0cRikWZDBiMo1Z6Vs6SncHUy4dYyRlsgqMJ1Cv/wKBQxrCbSrqRLGgDj
         3JVurxC3ETcpX598ohTsWcRtxsaQytCJlgwr2lKlCus+9zBqypupNRWfpvYZfpmNr5KO
         6eRojwVMKlKwtTBJ5WeeyhmUgkpoXDOiSIetCMKEi6WFW/G51Y1rovNDtJTgCdLZIQAd
         EeoHXWOuxiJAdz24p8OzCamDCd9T3DxQuhi0FQx8z53/TYJhGQ9Fx2PEiQRpYo0Bt89s
         MAEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=sMRE1LqK6hee/OzjFIAzX/6IJlyx7Uf6WTogUtG9Ips=;
        b=dRRlMzbc9291oxJYwnFjTs/MYVuolco4qwDkcsaB6WL6nzfXUf/WKXwWf3ZWUqUM8O
         y3TKfi+RNljngcV/+qW9kNyPEY1lVr8fpSQyFWFaiZw0OI1sGdRy0DbXiIUHh6CKtPRs
         kuyCNqg+SMIpDK4V2qXwrWcnFG6efhRQ3UVA/gm9nqVjgxr9M2mUexeL948YEP0yvBNi
         W2Lpm79Fc5LBtMGSNIqqyEaBy/xWfvTn6eFXQqQTLVcEcvWv+2zOedtlkz6udX0b8/IZ
         JVS4Pei2vICbl10dMJUfmXq/B5Pl4YASVijfnHAJgITIXCGSiB7itGVhU4UiHZyRnXih
         o6RA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V6Iv8UDV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jl7-20020ad45e87000000b0045b05c81b76si9268422qvb.485.2022.05.31.05.26.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 May 2022 05:26:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V6Iv8UDV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nw0xO-0006De-PF
	for alex.bennee@linaro.org; Tue, 31 May 2022 08:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0qa-0001p9-Ps
 for qemu-arm@nongnu.org; Tue, 31 May 2022 08:19:40 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:46625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0qZ-0004TB-9a
 for qemu-arm@nongnu.org; Tue, 31 May 2022 08:19:40 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-30c1c9b9b6cso72833777b3.13
 for <qemu-arm@nongnu.org>; Tue, 31 May 2022 05:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sMRE1LqK6hee/OzjFIAzX/6IJlyx7Uf6WTogUtG9Ips=;
 b=V6Iv8UDVLGSFjIU2+XPE0nPfVQ5lYALsf+Hqq8H7VRYc6ZPz075jU1hSUa4J/uf0oZ
 J38D1NxBmpPUtlQJWKEZbEqLDyBy5ve4bPDT+H8Aj+/WrbfOGYlMdSCNIKq/D7pNCeLW
 NhCDVjU/8UO0sy14Sx0nbm6t5ZkwU5EWAQKcvtbdo/OfAnbPz62UPhpt62YrYyM8Rxqw
 BZHA4V8fF8yvCh9DASqWcTQQQ/VwPVa1NYgv9HHS3FJbeDs0FxGOiOgzbiuLjkDnoA3B
 h2QlserR/6pBY/4+OMoRB3Se+foB+ys50fgoQTmAu/7pgukU6HmUYcIA9i1zl8xx6+Qv
 ObHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sMRE1LqK6hee/OzjFIAzX/6IJlyx7Uf6WTogUtG9Ips=;
 b=zBdBjoRxvJePzDjUPVOY/rpTItO/CgJ3ArprEM+CIImIcRPGfGYA19FNk9s5TZIfxG
 OKOXEpX4up2sme0sgdhZBegsoK59grIJcCvu9Bp4S/p7SKsz3J+EjJU+llIzj2w/DtMu
 yJvOS5/edPqin7keJtWNDqRSL7xFLid//uKQuofnqcFWf2CgoqqrvFuA8jLBujsArISQ
 fSAnwcHDiIt2DTeZB0Wu8ILoqBTuiN5I3fVvCd5hSM7tgw+iSWfLKGgvMtKtgL7HjT8Q
 6w50O7L2OR3Kji5VL8XU2zBzp/vbNip2Dx2gRePWbTgsekzbsmCMzqf8YyAiKWN+z1x9
 3KMA==
X-Gm-Message-State: AOAM531hWaThQJnRebcBrARSuPjSMKnr7xtrI5+cnUrDRllrB8Fy/9vo
 HGQPvZh2TAG6SM+SC7ehIL5W4kiLW0kUdVrw7REZZQ==
X-Received: by 2002:a81:1a4c:0:b0:30c:8363:e170 with SMTP id
 a73-20020a811a4c000000b0030c8363e170mr7113356ywa.455.1653999578303; Tue, 31
 May 2022 05:19:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220527180623.185261-1-richard.henderson@linaro.org>
 <20220527180623.185261-7-richard.henderson@linaro.org>
In-Reply-To: <20220527180623.185261-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2022 13:19:27 +0100
Message-ID: <CAFEAcA-wg8u+P8-LPqpcZuXoZBiWRFvbNg8vhCXKjCgvu+bCRg@mail.gmail.com>
Subject: Re: [PATCH v3 06/15] target/arm: Rename sve_zcr_len_for_el to
 sve_vqm1_for_el
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BMmrjBhPY5HK

On Fri, 27 May 2022 at 19:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This will be used for both Normal and Streaming SVE, and the value
> does not necessarily come from ZCR_ELx.  While we're at it, emphasize
> the units in which the value is returned.
>
> Patch produced by
>     git grep -l sve_zcr_len_for_el | \
>     xargs -n1 sed -i 's/sve_zcr_len_for_el/sve_vqm1_for_el/g'
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Can we have a comment that says what a vqm1 is (and/or pick a less
obscure function name) ? That string
doesn't turn up anywhere in the Arm ARM...

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
