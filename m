Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp2842316lfh;
        Mon, 30 May 2022 08:20:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw49uVU5LalMOOLKc1vTMTWSp/4QnMYq7J2B26eqTta6JcyK3/zXPCswEtagBlYqGymmFKW
X-Received: by 2002:a05:6214:1949:b0:462:4a9d:3280 with SMTP id q9-20020a056214194900b004624a9d3280mr29017392qvk.130.1653924031567;
        Mon, 30 May 2022 08:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653924031; cv=none;
        d=google.com; s=arc-20160816;
        b=Mp7wIDpKvWGezEWQBv4fWl6yrGLm+sr/5haaguMSFShorMm22loFP8uiVukiQ0tLyg
         PIl4fOPO4TbGSmZ8aeXLfjNiNEl6uHMel/dF8Me6JhOkRvAX3/xz0WrMhh+gc2/9AfB6
         0awgtbNPi5qKt7RNI9u8HyiHcOlcITtmoCl48l5nJSI4MgsmD+scG/c6fFX/bn70SMKv
         PCF0hlwnslE+FZ/Pot/MY4RFBKhqcZzt0lU4aZfIt3h76dKSOp7lSEn71ws6pDG+3UHh
         84NYq8ZyQh7gf8KwP5zWWjY+nN7XjT6yvtnLULddoTfRA0arlxyChY9F+m0p5zwPrqSl
         II4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=N24CqIO+A/gKY32uNb8F3Q30EG4HLSnFbSCFywL3BaY=;
        b=GKpxDtaJWD38Xwp8k8O0V8BNIMnz1uxnn9Iww3JALlfDugLaGKJ/o1vZnFdHPCyOHK
         DFgLFqU5ehphzH7enLTLFnvyyZpRD5hWzK6je/d+4u4CLCcLGWa3s+yaHFl27aupUmYC
         LYfs/W3vQK9MKcnjMCJXykalbWFiDmxwlsoLLI84UeOlLFx6TSrgpgqqW3PWiLQb0Kyd
         KxnERNU/QW2qdITWLrS51+5ZHZb5bAkTImtSBXaqzceycMjlZLIesTgP85ROb6WZ5Bvz
         EcOWBDkCx04QZNRaHIgQGWdxYAWofnUWJFTwQvuvIPc6SExQJrL773HVSs37OXqi5mrG
         fiig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LmFAH0i9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jf12-20020a0562142a4c00b0046267134425si2549095qvb.258.2022.05.30.08.20.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 May 2022 08:20:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LmFAH0i9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nvhC2-00044G-Us
	for alex.bennee@linaro.org; Mon, 30 May 2022 11:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvh3B-0008Ea-Vr
 for qemu-devel@nongnu.org; Mon, 30 May 2022 11:11:22 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:39481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvh39-0006h0-W3
 for qemu-devel@nongnu.org; Mon, 30 May 2022 11:11:21 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2f83983782fso112896827b3.6
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 08:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N24CqIO+A/gKY32uNb8F3Q30EG4HLSnFbSCFywL3BaY=;
 b=LmFAH0i97D4wMiyKH6hFZfCvTlLlzxEjkAPOLtadVFapUOiG9lRAmtZU34HchCsr2X
 6B4V3kUAl8nr/umM4PmZzkJxwXf2Xq1A0zPdqGzCaWNSxA0eq7AlPLftfJimkb4IK5Ex
 sVH7rM8KZ2nm+bOcq//LLQPBTkZ6517LRrsnzVAsbRsRjdCfGnT7ScWquHr0u3Qj9LDD
 1BX5wz5qYGNHMvwZeV1EM2wVJMP1o7jkHm2sa+HA/YSGsNtaxOVTXn1Nag7eYdjCyF4H
 bTan6lQsnh+9zIi+FkHsrBtyyuwZaB8NMKtEByAVm/Eqm4CIXsSO3QRagqzkbWl0XBib
 WU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N24CqIO+A/gKY32uNb8F3Q30EG4HLSnFbSCFywL3BaY=;
 b=ubqOaKGmHqrWoi6vmyo7F6PNd7sMMawcQIBT5WKAG8/VUQFJ6kmELgBic2PG8MwEz+
 qKgnkeCZWUGqJqIfV/MBjmE93fbZTVXfzpsiiExTNTT5SLPKrDDbILtXSqUCjS/g434s
 OlEyq4tZEx+xsopVuKDTuqnW2HFI4Ssx4SmiMQd6OGTPDFOps7UfHfWXByobx6Z9iShW
 lakUFcKRFGJPbbaC0FlB/+mehAUNNtKZ8Yw9J2gGmMvAq8X4UOsVONT2eDquJG4nSpul
 5vdQmeJeqUhV/nWAPpTvdf1jCxPuFNDDMvbba4nNbe2dvYL/vWWxhpEkaVpTW79/Gh63
 3FJA==
X-Gm-Message-State: AOAM532QY1yiCjuObtiXWMGAtFJbmIgVieXWUIdIn6T/f9cLu2Eg7K29
 dAGG7BpDTSQL8Fe4O5v+NSLdufqlSGs0y4zpTuhQJA==
X-Received: by 2002:a81:6904:0:b0:2fe:e670:318a with SMTP id
 e4-20020a816904000000b002fee670318amr58739980ywc.329.1653923479044; Mon, 30
 May 2022 08:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220527181907.189259-1-richard.henderson@linaro.org>
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 May 2022 16:11:07 +0100
Message-ID: <CAFEAcA_SprAaCjMf5MiE1VCXZhcCpo29jwRgNq-NPN0sJ777ig@mail.gmail.com>
Subject: Re: [PATCH 000/114] target/arm: Rewrite sve feature tests
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /4d1HcjmgYeg

On Fri, 27 May 2022 at 19:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There are SME instructions within the SVE encoding space, and
> technically SME does not require SVE.  Thus we need to move:
>
>     if (!dc_isar_feature(aa64_sve, s) || !disas_sve(s, insn)) {
>
> into each individual instruction.  Use a macro trick similar to
> what we've been using over in target/ppc/.
>

Series:
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

and applied to target-arm.next.

thanks
-- PMM
