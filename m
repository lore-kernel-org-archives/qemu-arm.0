Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp299153lfk;
        Fri, 22 Apr 2022 02:17:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWxWBOkBy7WL4WnajGR3wm9cOb5JF15JbeW7hecvg8TBM4SrwHEV5UpJpyqO44+ZNHIuCr
X-Received: by 2002:ac8:5ac2:0:b0:2f3:5882:fc8b with SMTP id d2-20020ac85ac2000000b002f35882fc8bmr1365666qtd.423.1650619071103;
        Fri, 22 Apr 2022 02:17:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650619071; cv=none;
        d=google.com; s=arc-20160816;
        b=GGD918XedUV7YjQOoG+WTuVqNoOAnrmsj8PJJ/JjutRNJo4XbOcB/ZdnsVxtfGa3TB
         Q9y+tPcVib4aB+bgUiVu/6+VQvFIz42fTrzlA6ZJ0NAA4zf0e2YzKU+aMbgXiHiMVNSq
         PripIG+Dl+QNTXOlHmgnQavxmTTvx0ytH5lC4FoqjwPu5O8ReS07Xc2ZwlVIU6zftxLm
         ZqMc3gDtmccsyaNEEn+3z4tU1iiF+aNsBSqiNDc+ikS/SwrpSGiknIC6nkLGy+vJNqFu
         65xRZxqfPsdu3J3JcvW0UFziBAr+bEZymnacSpMa4KFfGdmwzW7CCbQ6Dauo001hPWvB
         Qufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f9+wGOBMOHnMd8HAk5Klcn/KBZXpyBJEBr/MoSNKGK4=;
        b=Qq3zG5IKzdGR0sC1iZaCftommQn+/FD0ajuN3rlDE7l2NigRoXxXsvbDrWHm4DDpBC
         9eASaXwmD/7+0dDepbGdBsNArbpMUpUz+kDpgkSc2QIHdYGwgri50eVH7qop82FeCcHk
         tLe0/i74MxElDcBpmzv0l4omSZZMeS0YmA7PViO7JaOAn3WP+toNsgByo2sLD/6hdZTQ
         rqgqZtZj1zRsspi2cuTuwNV6VjDwNa0R5DD5RgNh8VN7JhcYN8aeURkN3TgBsMna3wdV
         t7ms62ds0qS+9Xq2ipz8x9uYmD1MxD73KSYsJ7c+dBiG6B06es87KQOF3T4CDZPR9byY
         HR7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XktiUGLB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gm15-20020a056214268f00b0044652b3eefasi2165410qvb.163.2022.04.22.02.17.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Apr 2022 02:17:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XktiUGLB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhpQE-0001Es-J2
	for alex.bennee@linaro.org; Fri, 22 Apr 2022 05:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhpAx-00026w-VZ
 for qemu-arm@nongnu.org; Fri, 22 Apr 2022 05:02:04 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:41890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhpAw-0001RK-5d
 for qemu-arm@nongnu.org; Fri, 22 Apr 2022 05:02:03 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id w20so7126676ybi.8
 for <qemu-arm@nongnu.org>; Fri, 22 Apr 2022 02:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f9+wGOBMOHnMd8HAk5Klcn/KBZXpyBJEBr/MoSNKGK4=;
 b=XktiUGLBr/MbYqndi1n69bKoztppaX/5Hj/PrDKv/jNQy0usPjDEEwGPvKzSx8Pf8Z
 2rdhf4awezh9hFC7KwTSsvNDhyuXdB0sY+bS3LEAUh5GjYlxnDvFxAU3zY904OjwRwsp
 UmPOBZihZLMewn0gBuMhhc4tdg/est2D0DIBeprJmfKn6bkA/Wvp3WZa2lkXL7BAQu8Z
 zsYJNb60CRMt7jdiH2dN8S29xAaZALMNfUAUvqRoecyhA+MG0cukSmpvB9rrRp5Yu99x
 1SsM++UvOHoY4C2W6GacD3HoywGFvcloRfETN4Ip8ZjlmpW70NV4deSTeytk5nBI0A0M
 4Cow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f9+wGOBMOHnMd8HAk5Klcn/KBZXpyBJEBr/MoSNKGK4=;
 b=sPRqUFyu6qxMc3Hi3FNH0Jn4QyiR9wqNdbFJEf5bzsOyd8VLKCDiSDdqpHaqXCzfxi
 HhbgU8Dg0cVH0VGNqZJYn3Khs1ouYNdnIJlUQABnoxXgt2eI4zv/V//GSAZbJZPdK3UD
 6NPnyymdnMtMZ21Tz6Ts955UJVQC9FW7DWzmTKhM6HXZT+riSTsdpidy/Z15ht00jSwy
 WLJNkq5tcG1O5fTi3HjTyfp2knGUZYnvVXELEnfN5mK4hnsGwk8B2IW2rcKUH+/UXHdI
 /9gTwPeV4VIy2vnmeTmGKzXWkR72yyzxyYR0cbrVT2ar+PkCvaIhl0sy0OT4eQb0u+1O
 fFNA==
X-Gm-Message-State: AOAM533BZwF20GN9WInHOYw6TQdEo/T1I4lOiIUWX5WExQ8p2b0i0I2z
 K4BvP1PyIcp6VbFi6V4uCuuEx5+neyW/Lbube9TJOA==
X-Received: by 2002:a25:cf4d:0:b0:645:755c:a5af with SMTP id
 f74-20020a25cf4d000000b00645755ca5afmr3355865ybg.140.1650618120025; Fri, 22
 Apr 2022 02:02:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 10:01:48 +0100
Message-ID: <CAFEAcA_65pJg47Qsk8CSuivCJw+cze+h5fhaoRRD4qT4wn=e0A@mail.gmail.com>
Subject: Re: [PATCH v3 00/60] target/arm: Cleanups, new features, new cpus
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5Xf3XdSaiCw+

On Sun, 17 Apr 2022 at 18:45, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Supercedes: 20220412003326.588530-1-richard.henderson@linaro.org
> ("target/arm: 8 new features, A76 and N1")
>
> Changes for v3:
>   * More field updates for H.a.  This is not nearly complete, but what
>     I've encountered so far as I've begun implementing SME.
>   * Use bool instead of uint32_t for env->{aarch64,thumb}.
>     I had anticipated other changes for implementing PSTATE.{SM,FA},
>     but dropped those; these seemed like worth keeping.
>   * Use tcg_constant_* more -- got stuck on this while working on...
>   * Lots of cleanups to ARMCPRegInfo.
>   * Discard unreachable cpregs when ELx not available.
>   * Transform EL2 regs to RES0 when EL3 present but EL2 isn't.
>     This greatly simplifies registration of cpregs for new features.
>     Changes contextidr_el2, minimal_ras_reginfo, scxtnum_reginfo
>     within this patch set; other uses coming for SME.

To help reduce the size of this patchset for v4, I've taken most
of the first third into target-arm.next. More specifically, I've
taken patches 2-12, 14-16, 18-20, and 22, making the minor tweaks
noted in code review for patches 7, 14 and 18. Patch 1 is already
upstream. Put another way, I have not taken:

>   target/arm: Use tcg_constant in translate-a64.c
>   target/arm: Use tcg_constant in translate.c
>   target/arm: Use tcg_constant in translate-sve.c

or any of the patches from here on:
>   target/arm: Split out cpregs.h

(I'm still planning to review the second half of this v3.)

thanks
-- PMM
