Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp609586lfm;
        Fri, 19 Jun 2020 06:52:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqANFPNWYbZVSKFUCNw+S/76CM+Io0XpdSDyBfexhUrnwZC+wO7I6Fs28k3aZZRMPT6lUy
X-Received: by 2002:a5b:548:: with SMTP id r8mr6278855ybp.322.1592574752260;
        Fri, 19 Jun 2020 06:52:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592574752; cv=none;
        d=google.com; s=arc-20160816;
        b=KDrMI9g5t0pEpmRsGfpOKKMUdxRL45jgNHno9OU+hwLLKF6VIBaSo1uS9iGZMSlUO5
         vZMna8sXWj71VMyFEHE8NtNgEBiXJw+12rN61GFLeeNuH5HsLIG7lRmjJsKLRjFLHUMd
         Bsbvn+6j4fAlL4Y4NBbEp5eZU7lSgUHii9vrmJQ2LbSBIyi5s2QKHBa5ACwq1dWWZwhE
         xvA3Wy8EqTaHm2tYmcg2WRReHbRVA8Wl0GdEQrvl+E2rwQrFLHEJSnQQ74g2nA9yjLZM
         vXizdoWWTC5fvjE4J6MEYxJxqm/NWQyXFKwfPqqFhWkZ3sjbpJuXO6nErk4hReHYSrE9
         v76w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9q3TKhY7AwymSeQ+ExBiktzoKtLThZ1qOZJ9ez18g5E=;
        b=WdJn/GHcLlGfaSxNrEhDWUHozD6l75/o/dmkq2jXfMn3Y68L3Tv85V8Obyu2tymH4O
         Msq3KdvADTa3m5HvuKUTUdIjKzJNuSQQk47/BXd+O2XPt5nyxyx2Lc2Ri91bCZB/zxrn
         2nRAEtBn7YflEXL+3OkJnLV09JpzwVYu3++2NZHf4xjKpAMQ/b6vysVy8q/9i86Dz+xD
         EIfG5d2NKAAnkyopaU/qIwlabyhVPEPi/4MGlUgurE7h03kAQbF57+rLLmasSg+2cU+v
         1wbCAdIOUNwKczkwIotMV1bf9Q28QkHuY/32Lvy4oDqIACAnm10AAznNYxvBY7WYay8x
         h5IA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pHDpLgxX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p123si5091517ybg.360.2020.06.19.06.52.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 06:52:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pHDpLgxX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmHRX-0006Jy-L9
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 09:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmHRQ-0006Jr-JN
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 09:52:24 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:36571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmHRO-0000w8-F6
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 09:52:24 -0400
Received: by mail-oi1-x243.google.com with SMTP id a137so8509320oii.3
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 06:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9q3TKhY7AwymSeQ+ExBiktzoKtLThZ1qOZJ9ez18g5E=;
 b=pHDpLgxXE0xww+9q7AHQse8/LckvTp9WcC3lL4gAVCL/xxqgcbPG2/AiYCObWI06pN
 MZs3I9SyT34UpTtAr5H+ghH5USNwZHwX5ALmdFmBsxgldIzjYX3/w9kUFpPQg2T5NQX0
 0ZCK4ZVYzwtULH2mS72ItiSRkyvAf+BzrqmEpi4aX+/Mk6gtmirQJgfCiopbmvFPcR0U
 XZ/PET4VtQwaT5qXh/M0sB82OIZqNn//Z6tO73PBjaFOz28HAPiwHsrjMzdEehgc7OcI
 AkXY7bC+N7UkQ5tsJFwnyGR2qdEVIXnv4T2f2QLxREO1nh6KpellR2ck2j0Z4hCx+o4P
 3fjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9q3TKhY7AwymSeQ+ExBiktzoKtLThZ1qOZJ9ez18g5E=;
 b=l4IG3VmZdbKuxQZWXSzmqYSZiYT7wBRu5da3AnAjfmo5OTOJX1P3SPIAB/Boiu0YCn
 sKQ7T8cHiYou1Qk4QJkc0tR+3SW20n3XjlbogVrD6cySJ9i6VHJMJOL8/RywA/zH31oi
 SHIMCfpxSIYAu404vYQwvMuyBKaTX6pmdlfKYgck7o3eLY+Gm4S1uNpnPD8MOOp+mPZg
 U4IRmIoe//ckWtwbxl2UuPIPK7QNnDoy2QwerwXzN2/aRGddvwd7yNol+QiG+ij/PKoC
 lq5qUvRZO8I+CNpCwFWMJ/YzGFz+JmTEXvi8YrO+wi95eNqb/oQe9F9GlGYmwyTWwY5M
 v0PQ==
X-Gm-Message-State: AOAM531dKNw5AW0Ey7qyDF7bILel5RN5Yj/JWk8WLHuz6kTDFXuNr9Op
 kzt5dUoAT9KvWrQKqR63HFIwB15dzdZDI6LFKAiN7g==
X-Received: by 2002:aca:5152:: with SMTP id f79mr3004043oib.146.1592574741067; 
 Fri, 19 Jun 2020 06:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-27-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-27-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2020 14:52:10 +0100
Message-ID: <CAFEAcA8z6H=p9KXEQdDTahXCUFSmf8y2jvE2T92mvebaTdPNOQ@mail.gmail.com>
Subject: Re: [PATCH v7 26/42] target/arm: Implement helper_mte_checkN
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WHHULw4JLXML

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Fill out the stub that was added earlier.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v7: Fix page crossing test (szabolcs nagy).
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
