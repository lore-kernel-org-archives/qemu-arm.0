Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1495121lfm;
        Thu, 25 Jun 2020 10:08:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHfI20QrPlbodQ0PSUz908gol41LGpM7SaX9D1vZ03nfYI+f0DJK7IT/4rkpIOVYc7196u
X-Received: by 2002:a25:a026:: with SMTP id x35mr55280776ybh.114.1593104903359;
        Thu, 25 Jun 2020 10:08:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593104903; cv=none;
        d=google.com; s=arc-20160816;
        b=Sah3AJ23RL81duEmCik2wEdYCXEcGe6bAre1SLbrX5JtBnyhYRuJ+6CSmIRfrvqUXB
         4hzJjeuY77TMZ9SaI3HacFYY+9eXRgKb0PFurRbHHPq/AqUEMgaK18qLl2LUUN9xe1j9
         XZ1ynGXVgzV797XbFKAgJfZO1gewCoUEV8Nd2eKCSmrZx373eL+2Ot3vOUTPzB7GxhE4
         qN9kDP6pgSslansAJCdFTzaz6jIWZ2KTvBagdSpkZEMyYSiIvGwu15gtvQzsGWjAaftD
         BqwWsvP0zkUtRIR9dxLEQiihnBMNeomJbKWAmUcQ+P72yoSITg2z/oZIFBIoy6E5vR1+
         gN5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dCwmRyVnG6xrIjiESn7a0o4CEYbggaskdFoErN4t87g=;
        b=eMsbS5oqnKDasrKGSaayD7DpPY9ZJjayIyna5s6QNQoVZbIMKv8ZNx5ccyiJBzdIZ/
         d/EWX0Crsr/74UFXr2khxX2DVxxYxsWo90NYTffJJdhO25UWMkAWlhdarZoKUGBbSnTx
         Q/QA98mGcilTM2viwDxM1x3IaIRXq/ZHtUYDzQGbedIDNelnYs9CizfgYHG+VredCtrN
         QKBCZ9pm9Y/rCjiCEPP1SPQkiOQJkMBc1yoON/F5m36Du74AJYZFxXV3u2Ourv8/Uc68
         GtmKylnhxUDJmayOA9qZGcK7HQJGo2q5fuojSdBR52XkmaDUERya8cRKHyQVKG9UB3fP
         TRzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="SGuI/aBQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h21si24319977ybj.392.2020.06.25.10.08.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 10:08:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="SGuI/aBQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joVMM-000424-Pb
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 13:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joVME-00041N-UN
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 13:08:14 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:45230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joVMD-0002yw-Bg
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 13:08:14 -0400
Received: by mail-ot1-x344.google.com with SMTP id m2so5915685otr.12
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 10:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dCwmRyVnG6xrIjiESn7a0o4CEYbggaskdFoErN4t87g=;
 b=SGuI/aBQCJSO0CtzizLWFyrzx5oKVF6ITZbx50Ek+nFeiBGQP63Rk+IdbBFeYaSIOF
 saYioGYOgZnZdNsaUBpI6FRpEEEpmzNCZCHJEzo/nOVdfgzFoRPvZ0zN/huWk9xAgnw5
 difZt0UmiS3nnUOcFcS8Kv4WWKJh5sAyOYOrY4+vjctkpyB0bj5J6I+HAcXsQ81JZ3vw
 R8SJpxws3JHF5V1xe/XbPKH8v01QHGjWTXw5WZ0ic0JbJ8Vy0SKjWt80OYFUI6rjqsub
 YfEU+6dM88YcWXtSP9qV0JCPG0dpYJL22WDj7ReAVYl1En+S5cdkpeYFiHxMQNyGwWfr
 0qtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dCwmRyVnG6xrIjiESn7a0o4CEYbggaskdFoErN4t87g=;
 b=pbILWH8FVejGAe2M8mQPGuVAi47qx0cWkf98+R+9apCvl3lR4AfDA8YtCjIvgKzmzn
 f+0MngRgmVLhrQ2ZmyRlrRe9ckeSPGa8ecVPEcapGJiG1bk1hiDRCirsMNUWHtFVc34F
 TA7azSAzEME06KTkhfGHn3PKPsFYxgwTibgWfHD1jlOI/PweQV0lyIzVyMZIqISi9SAr
 e2hn5Amf4FLge7C/J0nm6B1WA14/t34Wr0sGCpMKUFKETKwflICY18FfKVSZtT4kkMSA
 SkLjC4+2BjqwB2YTrPgPjHxgFxIhINrzL7ZF9nLlYVvRjT1Hseh3LNN469ZZsRTgq3GX
 dyFg==
X-Gm-Message-State: AOAM531oKXBGrNfkIem31UpPhLdKo6Si8u3fmJaGworadU3xggACJGjz
 bUtko36I9N0zLZnsXDAll+xm83hoOxhfV6AtUwBQFQ==
X-Received: by 2002:a05:6830:8d:: with SMTP id
 a13mr27561805oto.91.1593104892098; 
 Thu, 25 Jun 2020 10:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200623193658.623279-1-richard.henderson@linaro.org>
 <20200623193658.623279-39-richard.henderson@linaro.org>
 <CAFEAcA8xy_Q-6zXexBEHLR=WSYTXVvttL9V4HqiMPmtRm__TEw@mail.gmail.com>
 <9e80eb42-655f-9ffa-264a-f72627efdf42@linaro.org>
In-Reply-To: <9e80eb42-655f-9ffa-264a-f72627efdf42@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 18:07:59 +0100
Message-ID: <CAFEAcA_bpthPdThRwVaWRyOWkLqbF_cja8w-bga8RHBDHO=r9Q@mail.gmail.com>
Subject: Re: [PATCH v8 38/45] target/arm: Complete TBI clearing for user-only
 for SVE
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
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
Cc: David Spickett <david.spickett@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AbLLt4dzlDbL

On Thu, 25 Jun 2020 at 17:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/25/20 5:52 AM, Peter Maydell wrote:
> > On Tue, 23 Jun 2020 at 20:37, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> There are a number of paths by which the TBI is still intact
> >> for user-only in the SVE helpers.
> >>
> >> Because we currently always set TBI for user-only, we do not
> >> need to pass down the actual TBI setting from above, and we
> >> can remove the top byte in the inner-most primitives, so that
> >> none are forgotten.  Moreover, this keeps the "dirty" pointer
> >> around at the higher levels, where we need it for any MTE checking.
> >>
> >> Since the normal case, especially for user-only, goes through
> >> RAM, this clearing merely adds two insns per page lookup, which
> >> will be completely in the noise.
> >
> > Can we have an assert() somewhere suitable that TBI is set?
> > That way if we ever do have an SVE-capable linux-user which
> > doesn't set TBI for some reason we'll get a useful reminder
> > that we need to fix something.
>
> At what level would you like such an assert?

I don't particularly care, as long as we get notified if our
assumption that TBI is always set gets broken (ie we change
that bit of CPU reset code for some reason).

thanks
-- PMM
