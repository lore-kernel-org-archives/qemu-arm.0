Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp775254ejc;
        Mon, 22 Aug 2022 01:57:43 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5jzOgSpKccmADdMSJk/PilA+cLubasABKewS2xZvIk+KumrQhqK+jaGd6QH5xQwRhQ/D+R
X-Received: by 2002:a05:6214:20cb:b0:496:ae48:d2e8 with SMTP id 11-20020a05621420cb00b00496ae48d2e8mr14364540qve.113.1661158663106;
        Mon, 22 Aug 2022 01:57:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661158663; cv=none;
        d=google.com; s=arc-20160816;
        b=PiScdH7Oh3JHALwYTT62xpyxP1ln6WUpb9W5pu48vXv8f1m8Rcm8olN7R1EFWxpQl5
         WSXU6MLrK/osEiav5Bg7KuGRdDeftHYKUxP+di84eg0/C0y9QvSp85xjH5GlO7kgYnQc
         SRidZC/Bh2uV4ngTAXh8DqXvr3DtjI49o92mAKCxCvI/hvHx7D3ep329osfWSZd19I4i
         +3Bp+gRP5P1pR+IY7imLKgYD8hDddon/8uCiUl5Bj6PU6a2YcBUsGHaD7lLNpldK1m2R
         MOhTrzkPTvmHbu0jXntH/QoEAWQgtMFqzxBDb6iy7S5jV8cvaHQyWW5C/CoqL7dufzlM
         /jgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=yIlFkqoZEYRQvCewvBv8lODkzfajzQEoizF4+M0fvmA=;
        b=OP6kSk97voNdNBxxHz1SVa+l3a8H3oNFURC8t/VI+MMT6chsqrHb1aa/K0az0ClXHd
         vSD4igZPI+daAAYdqjqXSfRK2vwmojrrbaxkCgW6SqssJOQK2/KOpHq8onLDB6ktZXT2
         mHOUfp3KFxjiLEIIoXx5zCrIL31ZhKUqS/dpwEXQ2XToMEBYXQVRtE1YbS1DqOeS5Xr5
         3C7RCenI3DL27GFlNai3FCJg/Tl9h46ZXicoQZKU8fS6Yc0IOSKHBJflzrMAeKRwti5h
         zH0WFgG1LbGRnsuSiPCoPb5DdTnWJt47RqiVC94dkrymSd7JepTNbZN6zoC9LRTJvvRu
         +XyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b0DyEcyx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t14-20020ac865ce000000b003447e148087si4267713qto.434.2022.08.22.01.57.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 01:57:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b0DyEcyx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQ3Fe-0006hU-Kg
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 04:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ3FF-0006g6-8H
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 04:57:17 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:42865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ3FD-0005OD-Ga
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 04:57:16 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-3378303138bso233995177b3.9
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 01:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=yIlFkqoZEYRQvCewvBv8lODkzfajzQEoizF4+M0fvmA=;
 b=b0DyEcyx59h0QLOSeIaTz0eqUPbhgU8LYAFrVL4d229RLPY5bpPeQLSfjbyLHcGu8q
 tDTtbuHOMYts+llBSPOV80Ha4DdQk+qqfrK5jmBtjuCkp097/p/UW3dKQWB4KqWheusg
 jyGSVHZg7Sofsx5XmCPP4X8hmMxLDypVfRx1iWRrkmFIxzRK/AuYQiuNpjAuJkBDx27T
 eJXI3PlIjRHbYwFjW3oFK1aKKgyl/blh1hGRr1ZQfunR6gxhaQya1zTp98/JipXth5Ej
 qBtYb/ps32b5/wLNG2wrORxTljkUdHs0qgLFMPZ5MHXLTsY+U5jR7aiy20E4ZXQol3N9
 S2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=yIlFkqoZEYRQvCewvBv8lODkzfajzQEoizF4+M0fvmA=;
 b=IOhhIEF1SmO2aTc0pvoemyNcXPKcpYWbX91fWknojRH2M/gCuFfeNEBUyRHqKz5cFa
 n0qACzdWUmIFWR6sJsFhbiNHZErZzlrK+qe7d3qYoP9Vri/W/6HRtfKG4a260ThrJG53
 bBhphW5XMtrqvRpDmkhxaoqpsnazW1wtMUmaUXG8w/KPri/jKVF6aKewELUe4lmBtj8e
 90BicYv8KOLgQmjIfMILFF2RXTkJRwjXoDO5ZtuqY1vcH0hfEZq+dkXLZ3Uh6Es6tzPU
 EopiEuKXV2NhU2Qhs6whtmK5XZBgyxoUDBGJkQzqztIGbUIYtLcykz2YO+anZDWpGAGA
 gIOg==
X-Gm-Message-State: ACgBeo204HkDYBfgJf4jdxp/VsucUWlAI98oMgWqprND0st7E6jatvXv
 QiPGWNYhivhngTuHmsKEs/opXejHcUJ31LvQhBavBg==
X-Received: by 2002:a25:4288:0:b0:692:8c1e:2e7e with SMTP id
 p130-20020a254288000000b006928c1e2e7emr19027963yba.479.1661158634374; Mon, 22
 Aug 2022 01:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
 <20220811171619.1154755-9-peter.maydell@linaro.org>
 <949fb9c0-8e7f-d0bd-dbfa-e76067b867d8@linaro.org>
In-Reply-To: <949fb9c0-8e7f-d0bd-dbfa-e76067b867d8@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Aug 2022 09:56:32 +0100
Message-ID: <CAFEAcA9LeJuTbB7gSNajea_2w5FLZ+2YnMOA_Qg6cuL8t4hZYA@mail.gmail.com>
Subject: Re: [PATCH 08/10] target/arm: Implement FEAT_PMUv3p5 cycle counter
 disable bits
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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
X-TUID: daMmSju6bIz+

On Sat, 20 Aug 2022 at 18:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/11/22 10:16, Peter Maydell wrote:
> > FEAT_PMUv3p5 introduces new bits MDCR_EL2.HCCD and MDCR_EL3.SCCD,
> > which disable the cycle counter from counting at EL2 and EL3.
> > Add the code to support these bits.
>
> While HCCD is v3p5, it seems MCCD (typo above) is v3p7.

DDI0487H.a page D13-6158 says
# SCCD, bit [23]
#    When FEAT_PMUv3p5 is implemented:
#    [...]

MDCR_EL3.MCCD is a different bit, bit 34, which is indeed v3p7.

It looks like I've got confused between the two and implemented
the wrong thing.

MDCR_EL3.SCCD: bit 23: v3p5: don't count in Secure state
MDCR_EL3.MCCD: bit 34: v3p7: don't count in EL3

and for completeness
MDCR_EL2.HCCD: bit 23: v3p5: don't count in EL2

I'll redo the patch to implement HCCD and SCCD. (We can leave
MCCD until we get to the PMUv3p7 feature.)

thanks
-- PMM
