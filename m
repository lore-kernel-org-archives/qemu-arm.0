Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp510719ejb;
        Thu, 1 Jun 2023 08:02:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6oF+QCv9qnPWMoJFyQyt/v2IJtStqbD/Cm3WgstqxAOm08hBQtz2cxwcuP9XyMyG7hLsQf
X-Received: by 2002:a17:90a:5081:b0:256:82c0:8120 with SMTP id s1-20020a17090a508100b0025682c08120mr6449098pjh.13.1685631753819;
        Thu, 01 Jun 2023 08:02:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685631753; cv=none;
        d=google.com; s=arc-20160816;
        b=xsogS1/2UqOw1ujkIrzmGgdOd7+XGpVcRLi+J2tNFkPqw0zIpN0eHvBRqpdwMf7ycv
         POKDB1cZlbN78QtXECndoxKMhIB2ZG4HYSiDii+GOFPNUkEYFW4MRjGEYsuqrsA0a9uo
         IB9cR+a1gY/Bq+vl9OUe9m0lzZbpF62ODMb7cEwH+hrvXfbDm7othnt9t1ZSMhfo9EIm
         Vm4nYCmqC+T627lmB/YFb1G1QpS5B46TdLgl0dbjEoNpV8EH+cEmUt2SclKXg+k7VCpZ
         9uLXUh9knufaAGMyx8FfuujZ7D8S9wbXMEnFscoVREkxzQ6//XGRmbQmxvTaPeetpHL4
         82iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=1Inb+o5+rvctMnASN8Pvu3E+8lkwKhWrDXjz+5/swP4=;
        b=ZFnJsKCdaunjaDDojRuZzJmfws1HS+K1p8+c70oofyekjMqJGXFbM3RRAlEsJrtQ1a
         23ONNwqTakqfVijHwcyI0Svzui2ag3XGtKg6VGsqbIYZG8F1oI5q1QG/VYOQPC2rXkdd
         9HyNZ15YgEzD1gRZAi/UmkpBNsiRX9hYqpvnlshCWEzkBPa78t3Z+TA3FBnc6ttFCeNU
         kEUQaVb/2h171gI/0WkvHxKvRxYvrBhIKRD+MYEd+nPE+K6j54hVN/mVkBN3xK02x4sB
         gMw0ptCM+7X7DX/oN9i3rPqlnVOg98EjOSHghGP4V1s9XVlRv6pwaPxHAOAGzfPJa5cP
         GsHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WZOV8A32;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o14-20020a05620a130e00b0075caf48f759si9271597qkj.538.2023.06.01.08.02.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Jun 2023 08:02:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WZOV8A32;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4joc-0005kA-4Z; Thu, 01 Jun 2023 11:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q4joL-0005fu-U1
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 11:01:57 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q4joK-0006wm-05
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 11:01:57 -0400
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2af1822b710so13778111fa.1
 for <qemu-arm@nongnu.org>; Thu, 01 Jun 2023 08:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685631714; x=1688223714;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1Inb+o5+rvctMnASN8Pvu3E+8lkwKhWrDXjz+5/swP4=;
 b=WZOV8A327sQKuI1CqQyaSK65NT7biptDAvWEe5guQHoBvvWwRtGDFvAyoo56/JD11m
 2wkan8GTTceZ27QiaefX1WVzk/4uBRlQc6FkMPk8h7KOH7wX7LF/OJWZ0GsXMpgwEvMU
 GYel7FV4IFT5QVxcaNk/bm00qVYUqGnaKdENSuFcR1YUHYQAsrf6SGPs8hvy8WRc7r+k
 PE2VbVM2qFykAxk8IgRuM+Pn3IqXoNfx5K7zMbts4FymXRhkV4U90JHPckCEF9RVlUJs
 GxxnBKmQcSStEPL9yVw60px6YLd3iE+QgX1Qw4wmz5b9nU5shy82qf23ei0NiG9abpti
 o1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685631714; x=1688223714;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1Inb+o5+rvctMnASN8Pvu3E+8lkwKhWrDXjz+5/swP4=;
 b=Yq4BCNOpBCIFsHyJc6sHYESdWgQ4DyazeXh/sI4osSYr3C+lW4LMHznCKBFgLpHN5c
 LWiwIqe0ibHU6h7ub3tXB/jVabF+F5FGfZCtwwldHX+dWnbMpcI/BhBKFa/sVrhgLtpf
 fwwaBYPizzjASQRQhHXN5rOCE6CLsMUYte6yaxW5+3An+VSw+0FHbIx/13LwFjs53SSy
 5YsqRMmQhfh1/9VpA3IFPiLCwRBvoaRyWnb0q2sEnhiU8vuO7W2yiQeOZxf1R1XxhYBf
 kLPYLvZ3wPT5PJ8R68KD/tb5XxNFNQo5LudWQkCRyusbs27GV8Wlywe1besq2feB9JEr
 jaiA==
X-Gm-Message-State: AC+VfDz/aRUXpYzAgMue88K35vUKxMlRuVTnYNXjVyd0X/RLzYqFnT0y
 R2fJlMw5zNwiiBR9AfGaIr8RoCCWnnQmpjaTPhOo8Q==
X-Received: by 2002:a2e:8050:0:b0:2a8:c75d:8167 with SMTP id
 p16-20020a2e8050000000b002a8c75d8167mr5287085ljg.4.1685631714120; Thu, 01 Jun
 2023 08:01:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230531070229.334124-1-wangyuquan1236@phytium.com.cn>
 <20230531070229.334124-2-wangyuquan1236@phytium.com.cn>
 <lfcmvvqjp64wngrdk33bvkb3k7op53l24lcoslah2evsyh3esc@at7jnsnrto7h>
 <CAFEAcA8h9-YWUYsvuERttmsEK3xi+K+xasFdoWmnFm26S6npNw@mail.gmail.com>
 <b663fb55-dc8e-9fd8-9d82-7e693c3c4ad3@quicinc.com>
In-Reply-To: <b663fb55-dc8e-9fd8-9d82-7e693c3c4ad3@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Jun 2023 16:01:43 +0100
Message-ID: <CAFEAcA_9Prr1xV2s1q2+GpWEnrsEEFT57bbLDnop5Hw3MaxM0A@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/arm/sbsa-ref: use XHCI to replace EHCI
To: Leif Lindholm <quic_llindhol@quicinc.com>
Cc: Graeme Gregory <graeme@xora.org.uk>, wangyuquan1236@phytium.com.cn, 
 chenbaozi@phytium.com.cn, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x233.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AG4OOmi0/93W

On Wed, 31 May 2023 at 17:37, Leif Lindholm <quic_llindhol@quicinc.com> wrote:
>
> On 2023-05-31 16:27, Peter Maydell wrote:
> > On Wed, 31 May 2023 at 15:58, Graeme Gregory <graeme@xora.org.uk> wrote:
> >>> The current sbsa-ref cannot use EHCI controller which is only
> >>> able to do 32-bit DMA, since sbsa-ref doesn't have RAM above 4GB.
> >>> Hence, this uses XHCI to provide a usb controller with 64-bit
> >>> DMA capablity instead of EHCI.
> >>
> >> Should this be below 4G?
> >
> > It would be pretty disruptive to try to rearrange the memory
> > map to put RAM below 4GB at this point, though in theory it's
> > possible I guess. (I have a vague recollection that there was
> > some reason the RAM was all put above 4GB, but can't find
> > anything about that in my email archives. Perhaps Leif remembers?)
>
> I think Graeme was just pointing out a typo in Marcin's email.
>
> Yeah, we're not changing the DRAM base at this stage.
> I think the reason we put no RAM below 4GB was simply that we had
> several real-world platforms where that was true, and given the intended
> use-case for the platform, we explicitly wanted to trigger issues those
> platforms might encounter.
>
> >> Also has EHCI never worked, or has it worked in some modes and so this
> >> change should be versioned?
> >
> > AIUI, EHCI has never worked and can never have worked, because
> > this board's RAM is all above 4G and the QEMU EHCI controller
> > implementation only allows DMA descriptors with 32-bit addresses.
> >
> > Looking back at the archives, it seems we discussed XHCI vs
> > EHCI when the sbsa-ref board went in, and the conclusion was
> > that XHCI would be better. But there wasn't a sysbus XHCI device
> > at that point, so we ended up committing the sbsa-ref board
> > with EHCI and a plan to switch to XHCI when the sysbus-xhci
> > device was done, which we then forgot about:
> > https://mail.gnu.org/archive/html/qemu-arm/2018-11/msg00638.html
>
> Ah, thanks! That explains why we did the thing that made no sense :)
>
> To skip the migration hazard, my prefernece is we just leave the EHCI
> device in for now, and add a separate XHCI on PCIe. We can drop the
> EHCI device at some point in the future.

Why PCIe for the XHCI and not sysbus? At the time the board
was originally added the argument was in favour of using
a sysbus USB controller (you can see Ard making that point
in the linked archive thread).

thanks
-- PMM
