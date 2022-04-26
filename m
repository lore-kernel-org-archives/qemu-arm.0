Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp315866lfu;
        Tue, 26 Apr 2022 08:32:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0b/h4/gqYPa8qxMpFjPu5UMCXmqToeLUTnZYcOMAuDhhjVjQ68gK7Bxa8YJ4m9Gq/XEnO
X-Received: by 2002:a0d:f805:0:b0:2f7:b830:280b with SMTP id i5-20020a0df805000000b002f7b830280bmr18411094ywf.262.1650987155431;
        Tue, 26 Apr 2022 08:32:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650987155; cv=none;
        d=google.com; s=arc-20160816;
        b=d5sIIsAnLltoYCa8TT2GQWAN58nUv0sofKm8Qck7KJrV+npR1b6p+3nOwMeXoexs8d
         XzxpBzEvg69VGcmHLtOvtnLmolHlC6DY2lFqb0L9OOCH45gH3n+7uo20Etvx4PiU9Awl
         NwPHtlr9dpt8vCjLTwh7o3JTD19Z+Gh+cwShtKF1xgiP8MLMxTHdElZBQ9AEiolbUkyF
         d1gwOZeJtTTbw5qPuHo2MjZOk75qtBxJoh/dBDMcgy+d9m+InncHX5KnEZVPeCpzywUo
         vq2twIN/StCU2oUeTYPJ6q0G1fnSAFK05Xp2B2quElN5pJYRtId9Iyi7y+wFbppZMUMf
         4jRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gQDxV9rI0+Uz+mlIReO5AmMv5klPYv/zeLKWV5mz5hc=;
        b=ln9lHQEkSIgJy62skR4VLKwqnprB+2OjNKWpjxXXWIO2wJZa9K2oa3U3wMLhSYzvcP
         /V+PVXz+co4Q645JiM9StZMelXoN+g8EGNK/NUgnL7Zb/t9RHWGPfW3HCQXXyvSiiM8U
         SKFCTxnhX5a2bupqOs4hSUVd7+h9+h1rnMx4CNgcPOJvqtQvuxhMLY5ldlsgCkssfcHR
         iqlfEWeTB/p3KW6XldUxhcKFP4WS6yvuU7WjZx30ZfZn/e9kOcmZ2c75gG5RCWDnQNIk
         1ZGf9/ZJQaBH1f2BqZ+NC2EgtmIJ3W1Zf++iXdVAqE2FW3xovBg63n6s6E27t/V1kKyi
         OWjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="iOz3Y/fN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h6-20020a056902008600b006453a7d17c0si14166264ybs.432.2022.04.26.08.32.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 08:32:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="iOz3Y/fN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njNB4-0000T4-RB
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 11:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njNAo-0000Rk-9z
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 11:32:19 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:33964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njNAh-0002Bd-Sm
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 11:32:14 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2f7c424c66cso94718707b3.1
 for <qemu-arm@nongnu.org>; Tue, 26 Apr 2022 08:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gQDxV9rI0+Uz+mlIReO5AmMv5klPYv/zeLKWV5mz5hc=;
 b=iOz3Y/fN97aNRSmrBemTg/kTJL7dszJgF9p3t1mjrDcSO2ogUuYrseBowN164JcG2A
 3bPBBSry2pNNdTd3hyqSM7pqfb4W06VBtUFzMeHA4PNlAOdfcBbuvziBjuovPO5q/rS3
 hdMQyBxJcNEsZSepT8omlLp3psyYlkhmLuNZhcN8CWyL/lMRRoaEiqGmQWTiICJKO6Aa
 rJywIrWDq5hQjwa9DBIDRf4oVXvTVSa8eJCKh9xEC7QoQ4f45ZzzXfPfIasjcYHGy724
 /bQ170/K2mzud57pcdk9zuzZDNbBxK6uLxYVfAYHgTfYYiRTs2ZxfsEID7THeZSLownU
 ynqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gQDxV9rI0+Uz+mlIReO5AmMv5klPYv/zeLKWV5mz5hc=;
 b=m1XFcd+caRAo7XT9y2xFEntcJypDD4Up5alEyfPAWZGs1S4p67CG3183ae05GMWVS3
 Pj5pWWr98kHhCYvLPmcnx74nIuV54c8XkT1SB7OTJmbN6asw7nwzc3Cy/6ua5PwTgSRr
 0s9LxFtGitPG0DliW9b0XHmTefMKVGpmOZN/CLTJHkJgGFcgfMQJUK0iSBNdvKlgb7zh
 C+7Q9nZw7DvkMrOoEX4Q/Kr31yF/UMe0iwUial45YhEesbKX755Jfpnrb5uhpGaFFmcW
 6o+mT4BhD6c7tpdzDXTgFBnEdbE2ecXg62iWgBUQz2OdMNo7cFUO6zTY8ZNJ0LgMypT6
 A/xg==
X-Gm-Message-State: AOAM531uZOGQ8a57psu8xNYAAbthMNmJ4MaUN4grz6ALbuPmepaI5SWq
 X8JtoHqSooN2EmV3e3qy5X9W8ck+oMspmRpWB7TeUmoGJuU=
X-Received: by 2002:a81:13d6:0:b0:2ec:2b3f:28c6 with SMTP id
 205-20020a8113d6000000b002ec2b3f28c6mr22782956ywt.10.1650987127669; Tue, 26
 Apr 2022 08:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-36-richard.henderson@linaro.org>
 <CAFEAcA_SsEXfU9J1+AjWQXb2VMnNkT2XVN5na69N3CvmUGYhhw@mail.gmail.com>
In-Reply-To: <CAFEAcA_SsEXfU9J1+AjWQXb2VMnNkT2XVN5na69N3CvmUGYhhw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Apr 2022 16:31:56 +0100
Message-ID: <CAFEAcA_P9gxqKxVaKUbuHq6M5GQRmyRObnFfeq7CJ11LFkSEdg@mail.gmail.com>
Subject: Re: [PATCH v3 35/60] target/arm: Handle cpreg registration for
 missing EL
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
X-TUID: 1vjpzKSuYTeu

On Fri, 22 Apr 2022 at 11:57, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sun, 17 Apr 2022 at 19:21, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > More gracefully handle cpregs when EL2 and/or EL3 are missing.
> > If the reg is entirely inaccessible, do not register it at all.
> > If the reg is for EL2, and EL3 is present but EL2 is not,
> > squash to ARM_CP_CONST.
>
> I don't think we should do this unconditionally. Just because
> the architecture usually defines that an _EL2 register is
> RES0 if EL2 is not present doesn't mean that it does so for
> every register or that it guarantees that it will continue
> to do so in future. (For instance I found ZCR_EL2 and TFSR_EL2
> don't have that statement in their documentation, which might or
> might not be an oversight.) You could add an ARM_CP_ flag for
> "RES0 if no EL2" or something I guess?

I've just found rule R_RJFFP in section D1.1.3 of DDI0487H.a,
which explicitly documents that if EL2 is not implemented and
EL3 is, then "every accessible register associated with EL2 is
RES0" except for an enumerated list of six registers which are
not. So I'm more open to "default to RES0, with a flag to
suppress that default" than I was when I first reviewed this
patchset.

thanks
-- PMM
