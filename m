Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6839608wrv;
        Wed, 7 Aug 2019 10:53:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw6wWhgr4tRN8tp+rs6/LcFAqxttD6SiF+2h69nRvl1NQX9nmDVASV/6njv8eIVmiiQDiBB
X-Received: by 2002:a37:9a4a:: with SMTP id c71mr9564453qke.258.1565200397087;
        Wed, 07 Aug 2019 10:53:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565200397; cv=none;
        d=google.com; s=arc-20160816;
        b=waeIPzb+5C1cA2pyztGYwe7HnEh4hrNCBwJesLhnEGMmGx4gumuIgCyM41WsXPTiGL
         kwR5+o+9KGCE3A6CNpSSGS9VxtL13W3MKgqbizSgHRkbYI5F5Fv55Xe5YwadhIRZ1xnH
         kgg9iGCsnL+smc6IN3LxUHybYBbJ3jTOl18ihece5qRpkDiSPDN37Ksy61gGWENNn/YX
         PbzVnkAr82c8bLiuN9t5pV38vNfDIUqmZBnftJ4h/sfNCsbthWBHBI0hSqJSBz20bohG
         m2rvWl5/BiiKx15Zsl/8DIadJu2O8Gg7Ccu+KvYzA1A3CWiK0WvzNpD4cNyXNXqlXnDj
         gqAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TFJ8+QiEz3CZrxJGNn8ZjRZU6uLheuguQ13sLuKkqUI=;
        b=0QKiwSqNDhh+HqEdHt83xHT8Kvyro7EptoQ+9n8A0VE1QfqHh627U9gSyDC0kmalig
         562Ke099Ji5PGzwFjpJoC4ho0ReVl3g5Vvl3fbMxp1FgMqsyved0cqoFRiQMxy88kjyy
         +nEmM64QEryq61+pdMTGfZ09mJjc2p/UQK5c8okDaHiEfF5F8Qiu050ASvSBaCNaB1vy
         nj+ku0oX3/bZIEcyg/OFDHD/89NVEF7XaqwnIkUTg5hxgKIhgsmvo0cycxq3/iNAti0k
         hv17Yo3at6IiXzJi9bZr5bPrm8oEV3DJujKKuwlTzNUlNmnJOKRtbCsLlSXGhJOnyVVs
         aIBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=q4Ds4wOF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3si22825945qkd.376.2019.08.07.10.53.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 10:53:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=q4Ds4wOF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvQ7g-0005lm-Jx
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 13:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59726)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hvQ7Z-0005g6-R8
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 13:53:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hvQ7Y-0007O9-VA
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 13:53:09 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:45557)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hvQ7Y-0007Lv-PK
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 13:53:08 -0400
Received: by mail-ot1-x341.google.com with SMTP id x21so14441392otq.12
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 10:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TFJ8+QiEz3CZrxJGNn8ZjRZU6uLheuguQ13sLuKkqUI=;
 b=q4Ds4wOFOD3Hm9eA0LlREjKzGx9FN+lf9rj7gGOInDJ9476/wJsCxiOgof+mw3XepD
 ETr/w8ZzIpy3Ha3aa5Ip/Sw01+I6pQCqKR9qCX/ujC5bGYG2IFDRGVXgNATrYRO4zRKQ
 okJ1mJmgyKTUnLfNUFHfHlY92VIRQc61VOwU/8e1dyBrxf6AswbHKIw74i0LIt4CVP6b
 6ROLUHuDU2CtflPtUKB4dOBaekXoTzzyEfaQZ4ir66Lr2U5iXPqSQsNYim4VPmKhv9Es
 75ZWD3EjS3wTmA7lJ+Y96IVv5XsbbMD66ziw2BPm6eyOxr1MtfglbKadzbLDeJkFya98
 AE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TFJ8+QiEz3CZrxJGNn8ZjRZU6uLheuguQ13sLuKkqUI=;
 b=sEk/ZFyDnPhu20lr6jEia4ZF8RjMYX529cUVvG5G8wijoliOmfA1E/EL4Cdx4PDWxT
 oFtxALNgijyIHiqvITcxEWP5Z8bHl17OtSNMgKl+ennNDXcRteoueCjvg3GyWBGABmDn
 bfJi9v9t+JPUMbDB6JS7c29caJbH8lyNwE5jv5TqpmzU7Sf6+i12iGIu5YM2uad6l6+B
 IWT4Fs3419fZh6htRV7VwzzVLbmZ1X2BeuTsZlD4HqGvTulzvfoxIoqA1dYBCR86KylZ
 P+cJzLuNvjI2+IIVme0MnRfznckLwX9QkSclE2Ie7ZhyTy7EK8zbPKjn50WNPs1/mdM7
 r1Hw==
X-Gm-Message-State: APjAAAXP79Jr5hAQrgYHIt3guWWcK6CcuxvrlhNtWDuDDLUdkNg0/blg
 RMlSuOtdxcO89WMvXFBubBhSa2rvDxUPGDTNZglEpw==
X-Received: by 2002:aca:ac48:: with SMTP id v69mr751481oie.48.1565200387864;
 Wed, 07 Aug 2019 10:53:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190807045335.1361-1-richard.henderson@linaro.org>
In-Reply-To: <20190807045335.1361-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Aug 2019 18:52:57 +0100
Message-ID: <CAFEAcA-s3DZcW=L0X=Snxj7PwyLQerhQwrYiKj=icJwkHp6pqw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH 00/11] target/arm: decodetree prep patches
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fHNi5dLfrSZG

On Wed, 7 Aug 2019 at 05:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These are split out of my decodetree conversion of the
> aarch32 general instructions.  With one exception, these
> are all related to cleaning up how we refer to "PC".
>
>
> r~
>
>
> Richard Henderson (11):
>   target/arm: Pass in pc to thumb_insn_is_16bit
>   target/arm: Introduce pc_curr
>   target/arm: Introduce read_pc
>   target/arm: Introduce add_reg_for_lit
>   target/arm: Remove redundant s->pc & ~1
>   target/arm: Replace s->pc with s->base.pc_next
>   target/arm: Replace offset with pc in gen_exception_insn
>   target/arm: Replace offset with pc in gen_exception_internal_insn
>   target/arm: Remove offset argument to gen_exception_bkpt_insn
>   target/arm: Use unallocated_encoding for aarch32
>   target/arm: Remove helper_double_saturate

Whole series
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I have one query on 3/11 but the change itself is clearly
correct so it's just a question of if we need to tweak the
commit message. Once we've figured that out I'll apply the
series to target-arm.next.

thanks
-- PMM
