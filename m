Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp109596lff;
        Fri, 30 Jul 2021 03:39:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzU3cQMbCJVVXpdTbxUdgUHbNYFoiYWQt5OAmFLjXn1p/NFC2AuEAIfD06YPeHJNRuqYW+Y
X-Received: by 2002:a25:320f:: with SMTP id y15mr2222682yby.515.1627641582496;
        Fri, 30 Jul 2021 03:39:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627641582; cv=none;
        d=google.com; s=arc-20160816;
        b=tdAsc1LDfL5Xww5Tv/SoHrRWCS/QFUauCd/ugr5TlQxXwrB7NDp7qhzcTkSafuW5Y6
         I2281wKq/CRVr700qz9JzgVASTa+qIcvFY+cjTLIwsQblXdyEs8CjjZhnxuCTdFMcwYS
         diGQJt0KI7EmpFot8r02h03Fzg9hsEZC+pxfPM3cZXJu31D7CgToEnzZvwqODnp/IHwA
         aZz3s09tTNzjYDre582q0TXJ3KWg5eG1Wf0yxgIV0WU40083nckBPiZlMKnZ+GX54glH
         dqKpZprDZ8nGU0QQlXxA3qo0yjlJTZKcYToMW5Sgeeu3xqsV+kn+P+UDAZE+ScU5Buz/
         VuxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lmywFJnflwU76wFQbROM6OrQ7ircdidd18ZIgbK9tfM=;
        b=fbKETdXrST0/vaxvcv4f3KpH1LTHqNZmRMCd4Z2GdzugfCDm/xvdVe6FodN4QET0cw
         x9TZTdypIigHoX3Vgd6MQhsZSYW/xExRTFpbjr3dTPMYUq93lAJ1KXZwmfWiz80PEnjn
         ZAItqo/QAtBA0ywiv62HTLVIb3tDUlMDzaM+TZxEUzpaPOt23Z8H9j4dEXYaBCJbuZsG
         PJLcpQenYGS1XkF26zehxcVfKvjBZmgmMpm1YW314ZcMw9jv1jQL+Itc1HjK1tjQF3oC
         lFX7oZyQui40Ya9+QaPAbi2afhV3IWI5o+kAjEccfkWXeUWo48+CxbMNtEi86iKKXk4k
         itPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ibWkzx/T";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q5si1349385ybk.405.2021.07.30.03.39.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Jul 2021 03:39:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ibWkzx/T";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m9PvZ-0000oy-Sq
	for alex.bennee@linaro.org; Fri, 30 Jul 2021 06:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9PvD-0000n2-0V
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 06:39:19 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:33626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9PvA-00052z-GY
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 06:39:18 -0400
Received: by mail-ed1-x52f.google.com with SMTP id ec13so11990037edb.0
 for <qemu-arm@nongnu.org>; Fri, 30 Jul 2021 03:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lmywFJnflwU76wFQbROM6OrQ7ircdidd18ZIgbK9tfM=;
 b=ibWkzx/TOvzS5GioXJLm9gy7AYlhi9dPh9kiD9oT97AzWuvpaUEXYYc7CgynRfxJ6A
 UfyBnHGMO/fY1jpUlJ3/4h44bxQ2bRGVJEOcMxuopFObH6VorXWxhAhEQQ6Rc/VrxEly
 3gP1YdMc4csLv0Nr4nL7xHsyY9B0aIudTxSvBvBCMUugtAgy3gaO+YProzIFJGSkl15j
 WYGCFCckLBG4H4VRvLW+tozWrkmEcNptfEpzJLLV5SyJ7jCRR9EvjyHPwJrKiqWaLwct
 +D8qM4O3lBET2T3pUq0mfGfpTLVSdsBDACHbm/E6VStgLLZypZm5KoYclN1r/BPGzwzx
 xOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lmywFJnflwU76wFQbROM6OrQ7ircdidd18ZIgbK9tfM=;
 b=nnEaKQMa8tCK9BjI7fRNChBdmOM2Sufh1OQceE2bvZ9rzvaaVOToM86+5rlwWB+iYM
 7S1D34g47oL5HIqLq4Vleoeo6dqFm7h214iAm6g4bCr7tJskMOebxRAhh3q8+uAVxyk7
 rYRNDxo32iNSXph06cqc+pKITEVmeMp1t4il8IURj7kNwanbtLtG2d7a/Bsf7M2X2js8
 qfHsTLM1iMckrXpPFOrA2jrH4nVl899gI2Mn1xfmV84HX0d/8Ik5ej1z6g7xrMJCo9Id
 26cg3C0lvkIMQ/pdDTXi2o/jHyBDHLcG7bhiTH/hkOs90m6PwghV43ncTfFi4XGTEe6Z
 Cq8A==
X-Gm-Message-State: AOAM532R19WJ4LtYEQkALS+bE5nDtE4/ECeDZXgU+3/Dg+I5S1enVcuY
 lQmiMbzAxDNf/Z7gSJTnE2496UeUjVnqRIAn+6eQIQ==
X-Received: by 2002:aa7:d30e:: with SMTP id p14mr2144728edq.204.1627641555103; 
 Fri, 30 Jul 2021 03:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210730030821.231106-1-ishii.shuuichir@fujitsu.com>
In-Reply-To: <20210730030821.231106-1-ishii.shuuichir@fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Jul 2021 11:38:31 +0100
Message-ID: <CAFEAcA_=685EKqdsLh=rnXPXQNSRJ+PNuDYec5LTxr_rcAbeOQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Add support for Fujitsu A64FX processor
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2PSEONeC2GNe

On Fri, 30 Jul 2021 at 04:08, Shuuichirou Ishii
<ishii.shuuichir@fujitsu.com> wrote:
>
> This is the v2 patch series.
>
> v2:
> No features have been added or removed from the v1 patch series. Removal
> of unused definitions that were added in excess, and consolidation of
> patches for the purpose of functional consistency.
>
> For patch 1, ARM_FEATURE_A64FX is not used in the v1 patch series, so it
> was deleted this time, and will be added again when it is used.
>
> For patch 2, since the a64fx_cp_reginfo structure is not used in the v1
> patch series, I deleted the empty definition and added the TODO in the
> aarch64_a64fx_initfn function. Also fixed the appearance, and cleaned up
> and removed some things for patch consistency.
>
> For patch 3, a64fx was added to docs/system/arm/virt.rst and
> hw/arm/virt.c respectively, as a modification to the patch consistency
> cleanup done in patch 2.

I'm afraid this isn't the way a v2 patchseries should be structured.
The idea is that a v2 series should be complete in itself, not based
on whatever v1 was. So when you make the changes requested in review
of v1, you update the commits in your local git branch, and then you
send out the patches as the v2. v2 should apply cleanly on to master,
and all the patches in it should be logically separated out changes
(with no "patch 1 makes a change and then patch 2 changes the code
that was added in patch 1" effects).

thanks
-- PMM
