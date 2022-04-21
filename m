Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp515921lfk;
        Thu, 21 Apr 2022 10:23:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJya2z5mkmTDoDf6FgBSZKkGMtN/JS9I41un2vawMZ6YCxjLDyc6AcsYtL+6ZftFbIEzV/Et
X-Received: by 2002:a25:2fcc:0:b0:645:7356:dd09 with SMTP id v195-20020a252fcc000000b006457356dd09mr722767ybv.187.1650561833971;
        Thu, 21 Apr 2022 10:23:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650561833; cv=none;
        d=google.com; s=arc-20160816;
        b=rwKg+wHUR7iDN4NLKXec6BQXaAZsJtZ0L3rbqR09X5nUg8an0XmHKczt5+gKM9spY4
         OkjxiUtL86LvbXNgAp4nj0Yi1uZgvAv976GA6JXoLQi3Rv96RD7fU2f1C9xfD2v0+qNp
         nl711nw3piqQUGy5E9T03/1WPyghZyHYmhysKAmWoRzGDyHxbABv6cgIL1aydnz+rDJD
         gOXvn15OAFe41x9m7fLY3y58tf9ZfmoBB20ehblFGrtnoRJr2/hl5yaQXQpC0479Rbmz
         zCicP1mFpl8Gje5ACVXt3T6uqEafBt40991tf4GVh7yFyNcXBhWchrskV2yJ32dfOJno
         UZ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V9+KP37AU6BS5k2Huv4vBXpz9/t4ZU20cM5NiIP8TA4=;
        b=WHlPA9jnCRT0DuLyR59G7xgzw91OcBufH3Rl4BupQ+8UeBan4X9gIxpuepuXFS1UlI
         I6l0yClkMwXCErfqB68yyzBPWJ1RaoanDU6FP02stTrRkPZ8F5b2H1JDvipIX2UWNYeV
         FcGvmJxkyUPVlhGOdcYsUgNHXh120/PE8uhEQJU0dwr3Ppp2MikGaw5VO1zCwkLRT1fr
         0dAKvx7aqKgAYbuNheMatP6PDXalk3tLEKzPVUqQ1m7e01WP2Gg8pR2WVe09PJ0rEGhn
         Hh4tE5C8AI5azi/xETOXPwoyrpdC1Pbpr/LreWpomO7WolT5xVcDXF35cIPdAJeBVOB+
         dZCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zHT+P+tU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z64-20020a256543000000b006428b724c9fsi2506693ybb.298.2022.04.21.10.23.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 10:23:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zHT+P+tU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhaX3-00016q-Dm
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 13:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhZsx-0001Wq-Se
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 12:42:28 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:43664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhZsw-0003Ke-4u
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 12:42:27 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id f17so9738447ybj.10
 for <qemu-arm@nongnu.org>; Thu, 21 Apr 2022 09:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V9+KP37AU6BS5k2Huv4vBXpz9/t4ZU20cM5NiIP8TA4=;
 b=zHT+P+tUs1lduXnSN5k7BE23qJ1U2hIpAgD/eg6sLYIC4n7hqu6Mipy0uOI8pJDn3w
 YQkZ/kWS6/06VdrNXB1GiG4MLZJxw40wSFqkqDyJfrYtoFPnLo1tZt6jbfd2WpSR4uWh
 qreivUHr2cEwTUdElDq6opTwL9V5GFAyKBkopqnMEX7MWEkcH1sf9dVqg+PZG1VL45t7
 u9tuSPkDF21eD1uypai80it/7ZPb1rir/01lIFXPgcaurxQsFHwv/d0MgRh3NyvKLodD
 3jp4t9swfcqJ5d/T4kaecDfnH32X3VkVBBVW5EjKqqRc9OHe1v0gp47SIZ/Alrv8IIo5
 VJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V9+KP37AU6BS5k2Huv4vBXpz9/t4ZU20cM5NiIP8TA4=;
 b=yqFnJXHoURS3d1xokzC9eF7SIIapO7cbl1HLfpws+PkcRSTEBscm7iKbBWvh61WDHA
 nOMw5YBVJHPKTAtZod/s2FiSqtqxIEaFssXWlmiiDH8SrmwlNRSrvt90IffYSPXAVF06
 pbSj7D4aR1EnOat5+odWhXo5YcnQ2q/gv1BD4mr01Zi0XUjU3fyuIuWUGhr+s4Xl5pxd
 d8W0OX/bngDNC5Dl/ClaeMdufsxlwN21nWTMefmwNDDhIfQnxH6G6iBveeCnoZVLHQAP
 BAC4dlvPB4jqABp5LP35jIcdmkJas+W84lm5UfOpE2IQKPEqfIvmsAZl2u3FoPb/zLc/
 zP+w==
X-Gm-Message-State: AOAM5323nldLkmHaEewxa2HFmxpbX4jBOQDCeOUdGKix6WXB2OGuTf6A
 wt3Ne6eNSq1eQl+Fni8D9+7bTeCb208NuO9gPnTTaw==
X-Received: by 2002:a05:6902:34f:b0:645:463a:b824 with SMTP id
 e15-20020a056902034f00b00645463ab824mr550477ybs.39.1650559345027; Thu, 21 Apr
 2022 09:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220405223640.2595730-1-wuhaotsh@google.com>
 <CAFEAcA9PCoVH_1EWTPWP_rqsOEhQZSvDZcEgw01=5W-cuyeJoA@mail.gmail.com>
 <CAGcCb12ouKaqwT5JAdysiVVmOQfz_MAYH+uukPfrz_3FqC7QdQ@mail.gmail.com>
In-Reply-To: <CAGcCb12ouKaqwT5JAdysiVVmOQfz_MAYH+uukPfrz_3FqC7QdQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 17:42:13 +0100
Message-ID: <CAFEAcA9P9aYrOgo08h1qS4mWt3+GmxgDYbxC-BTrG8_e67w18w@mail.gmail.com>
Subject: Re: [PATCH for-7.1 00/11] hw/arm: Add NPCM8XX support
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: IV00 Uri Trichter <Uri.Trichter@nuvoton.com>,
 Titus Rwantare <titusr@google.com>, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Vishal.Soni@microsoft.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z8jQ7yklNBLl

On Thu, 21 Apr 2022 at 17:29, Hao Wu <wuhaotsh@google.com> wrote:
>
> Thanks for all the comments you gave! I'll go over and address them recently.
>
> For this question, The actual CPU should be cortex A35. However, I don't see
> them supported in QEMU. If I inserted CPU with "cortex-a35" QEMU will complain:
> qemu-system-aarch64: missing object type 'cortex-a35-arm-cpu'
>
> What should I do here?

You need to implement the new CPU type first... This means adding
something to target/arm/cpu64.c which will look similar to the
existing CPU handling. You need to watch out for:
 * getting all the ID register values right (check the TRM for the CPU)
 * implementing whatever the right impdef system registers are
 * checking whether QEMU is still missing support for any of the
   architectural features that the A35 implements (what QEMU
   supports is listed in docs/system/arm/emulation.rst)

It's typically not much code but quite a lot of cross-checking
against the TRM for the CPU that we're not missing pieces...
Since you can add the A35 as a supported CPU type for the 'virt'
board you can do A35 support as a separate patchset that doesn't
depend on the npmc8xx work.

https://patchew.org/QEMU/20220417174426.711829-1-richard.henderson@linaro.org/20220417174426.711829-60-richard.henderson@linaro.org/
is an example of how to add a new CPU (in that case the A76), at
the end of a large patchset from RTH that's still going through
code review.

-- PMM
