Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319F2CD5BD2
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 10:24:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRoxG-0000I5-1m; Tue, 26 May 2026 06:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wRoxF-0000Ht-1Y
 for qemu-arm@nongnu.org; Tue, 26 May 2026 06:24:09 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wRoxD-0005vF-NW
 for qemu-arm@nongnu.org; Tue, 26 May 2026 06:24:08 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-65c7efdb7d8so10750987d50.3
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 03:24:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779791046; cv=none;
 d=google.com; s=arc-20240605;
 b=WsOEjtG5trtu5d052XyGBTKRnZurGo96Y2vX7o2HcZCloeXyjZXv/tOzIiHwTayJDB
 xr/DRfH85N83lYZHfcrLd1esaB2PrTxANvbvXwjQqzI5SbhKFCT6ZKCHvswebhNwde1V
 I8cve7+kBTjT8tKdxX38btmGE+nWBQ3sEErTuJasRrnBjggrToRl14U54DxohCoS6A1M
 bYIENT2lOaMEgGC/XpUaL3vXdF7YmdBB7/1Cdvs50ooMSQ0o6vgr3CkD1JKQVqhcot2X
 jlIJHJg/D1fr7jfrZL8Fj0E8pFRRYubwwAkP61WeeO6nOpajdJAWdmQYc64evfjAb2gf
 eumQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=34Y4pAYFvPs8YZdut3z6fQqp01RDv7dzKitJwtZEozg=;
 fh=sG0APnGDv8h7kWEMwVmf9bgzFfF0US9x56J8iCy+iy8=;
 b=A5YomlOVE0Mjwb1+ni4kmqoD/FDGfXiwVqSIiHHgecWENExE2Jfw2W/yfFbPg6Z/Hi
 ayGLogcenRz/8fHLP0RtB4a3h63LeeRDfMTYxopv+m4k1SHPxQ4c5bDT88vy8oWB6HTg
 XdGPBnR/6NbGLRLOmln2ZKdWFO9sdn4nYhA+oyJyvJQyO/7KOayEPNFw1dN8VKOJUSjq
 2tE6pVN6+PH3xss+LrWUU+5vvn16FoZNT4FO6u75/sgHViHtBkYm2FukvuhqdZaZDIry
 LPKtZ5Wl+P40l07i4jJ4u4es/6FLgNS5LKlcyAH5Ci9SCOOKK/Fr0bswv5piARKbCLD6
 QQ7A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779791046; x=1780395846; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=34Y4pAYFvPs8YZdut3z6fQqp01RDv7dzKitJwtZEozg=;
 b=mdoWuigloGYbkfxkhED2G9M74h/VpFQh8p2PQvgHlLwBbBpQRFdy9KMCx5Dq6ho8de
 87LuDt+0pw7R9lAphP7L/B0IUH5UQUwDs7GZyK7YFOO4Yw3/+qTbF+bpL/AlRNN8mQWf
 CtEeiOdaVfdDb4AX3iurAokDGJ2MKAQYVwGD1rGPUIHkd8aiefgFikeI2RtmyoCcDWdx
 s8jYbBRzq+6qHf3cwvNgQmnQdK2EHTLx6/wSCeN3OwB7IlWXWyXi+dSWyiVOPpiqSMiR
 Ein1dNBRgicu/6SGRRSgJV5dxJ9MdL4Jy3vQM8yBULhSlEpecAJ4dyOb02kU6HIZ22nM
 IgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779791046; x=1780395846;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=34Y4pAYFvPs8YZdut3z6fQqp01RDv7dzKitJwtZEozg=;
 b=BRJNBFAQqVFd7UHZcF8WBLomrIhyrNl1yR7Xuc/VuY3EbQDq3EHEOKIECdJI2FnnQS
 eOY2VWGwRGoF6N5jDVI50irHIY2Zvh+4p8EPi81OtdC/Ug08YlP/e+6Nat09m/Ep7FUc
 UWifcCg54JR7D1K00LZddDZEFLFK29j5nHDpDWuR8PbFVAwupvjvgrJEdU7Na6DUSV3/
 q/qPVnbfMTnfPDohcBafsRChJfuPWY5k7ngBFnr2vNwV2Y88rtV796z0wNnSlRFk3qpD
 0CCiiw9wNDPiNqwX0zRRip4Hk33/qXf1dfDT4NvX7BN+qeUQBDBv7odXaLCsmcgCIPZf
 kCcg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8hsgJ25CJDnZxkZzNHJS65E082J+Buh1nPU2dejgkOCKzdCNi2i0QvmsLkQTaaHRfCMgTcKUhVlg==@nongnu.org
X-Gm-Message-State: AOJu0Yx64oMzUG/Z2FOLL9PTCoJfoC6bCPK64jfMk5FnuUkNf/G2hLg4
 WnYz7uHNjIcftnwSKuSep+Q4GyPt2Al2M2TzRWPowQy7y3eJt5LroN9YUjnPM0qScpZqqg0EJrm
 voUqQIl/5gYi7XwdiVo0RssEkYl5hp5sO2nrutK3ZOA==
X-Gm-Gg: Acq92OECnPBJFKpEEf/iOUr8TGaWY9IOpMyn9f7gGmHG68s1NALjejjqW+o14xAMHLt
 j564VgU7tXqg4tDNPwOOov4byZln+NX5OcbB3ywKiAiRWInRHJA3U/5atkKdIc6hqEypCGrc5Fx
 98VYvmPTKrYt/6LUYCREwR9zzU3fDbkEYt89fld/2E455bML50HI3FOphb75v+YNyvrS96OvhFy
 J5MT+YAppCDMkw9S5v0CTUxTMWgS4z8tuS8VJg39ciJGIVlErC65Vh5z2CiBFTp5LtIfyt287Cj
 JQzACLFtr/2gm7+MbjRQnYsb53qRlWX8D3AZpRQGmgQPTtzoyEOrwjgUhTIjwc9wM1E=
X-Received: by 2002:a53:acd0:0:10b0:65e:b074:c6f5 with SMTP id
 956f58d0204a3-65ec981e217mr14502032d50.29.1779791046580; Tue, 26 May 2026
 03:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260522220306.235200-1-richard.henderson@linaro.org>
 <20260522220306.235200-3-richard.henderson@linaro.org>
In-Reply-To: <20260522220306.235200-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 May 2026 11:23:54 +0100
X-Gm-Features: AVHnY4Ia7EXYE5qS6KcQhHyXzBSUAdY0TysiIstZ_kpHVTwNfqrLKXkw08uKzAQ
Message-ID: <CAFEAcA_8brxiM8tCT4-jU77bfy45e=EL=sggU+jmJ_zL+Bc5aw@mail.gmail.com>
Subject: Re: [PATCH v7 02/64] target/arm: Implement FEAT_FAMINMAX for AdvSIMD
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
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

On Fri, 22 May 2026 at 23:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

