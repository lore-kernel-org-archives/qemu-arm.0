Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1307561lfb;
        Fri, 10 Sep 2021 09:03:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzGxWDDa5wcqacv7SSTD7YuwskBCXbMM36XyjIdUKZvDfJpWyRbWO91ANx0W2sw2cwoAn5
X-Received: by 2002:a5d:560e:: with SMTP id l14mr10285126wrv.205.1631289786867;
        Fri, 10 Sep 2021 09:03:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631289786; cv=none;
        d=google.com; s=arc-20160816;
        b=GpxDWsVfqpeUJDa398M8PpAapTtKr5EU2pPiz5Ydhr83sbr3gfPIEE6aRaLzRFKhmX
         LVjRxBQbbY9cdf5TR0rpCSxwwjopGm1kV/0uTpY8Z4+5VUmxa4taAFo8kf9y9hI3MFUy
         Jaae8iJHvbObcamUNNMQ8gTdRaCfTPny1HziqKWOkuWCLBFtbKl+8S3xkWYCG+Ylsxdj
         UeqqXPsBKZqIIwQNzXMbnDGFmRciKT7VE7/acw7l35JJgDX7f+xg+8O6F0OPQKp1s2wW
         jgRHxQmQ/wlXiOyp0aq0Ty85i6+1Cgy8n+WwwMWiXM1fw05Qg+Lxkd/6WM5/2aUjmK+A
         y94A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A9X+1s7d8lRGjDDZpM979YKkRx8eSsSi/aQ2KCCGTpA=;
        b=TOrACUZQLoYOiQl7JpXGDkkelX9Is7wASJuGG8rqcNSsmZsMIbOKLwb4AjSetb0zCr
         hmM7NqlNrVk6NP3Nn/0Kou+Ys2PQL2FO4CqL9A/UpLIUBdTnxk7P4GPS3NstZ5Lwz9nd
         asFewiExd1htTb2PkBPbXEEgTSZ/5uapMNOy3sr0Pzp19vSTUDWgN2tQr5bDYNsXMLmC
         iHqciSu/a52r9mUXeUhlHxlj/yr6Lr35F40zG7WP5whCWnqVyH+/RMZ4cifPvTSiBY0E
         JbObb2VgWrTXEZ4H/KZzaIsqF6LYhxaPmL12hH1gvHobgqGvLjieod6SLeok7UegScGr
         r8zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d70sKalx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l10si5428352wrs.456.2021.09.10.09.03.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Sep 2021 09:03:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d70sKalx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mOizZ-0001CP-FT
	for alex.bennee@linaro.org; Fri, 10 Sep 2021 12:03:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOixi-0007yL-Pp
 for qemu-arm@nongnu.org; Fri, 10 Sep 2021 12:01:12 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:42680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOixc-00058D-04
 for qemu-arm@nongnu.org; Fri, 10 Sep 2021 12:01:10 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 u19-20020a7bc053000000b002f8d045b2caso1731479wmc.1
 for <qemu-arm@nongnu.org>; Fri, 10 Sep 2021 09:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A9X+1s7d8lRGjDDZpM979YKkRx8eSsSi/aQ2KCCGTpA=;
 b=d70sKalx6K9m3FECC2zANbLra1Qd7DdhkX+ZxDOEyCvYXNnaInyLiDm3BinGd3zugl
 5+aFZdg7Ta2WzrkDDX+5eiVJI0J3SwkwCLl8ZlfJ0WSeA0u/LZMRrsjZsvVUo5TQs5Ou
 lqqrx4q8ZKGFFZj1TMEiGa9iyP9ZVFhywXA0+1tVdHKyimPn31nCtzB5h3XAhUyZr3Ey
 cmyPkC6+XjxKAOPjlzYDYt5o/kvbBp5UahlZrWJJrAVCYHBHiqrVQCiu/aeqc+LcbQad
 DWty9pNlJXVrFFnW28XjYgptMZjEy92acexMyduJwxf+9a06JVdFu2mZufDnIxBGrvQG
 jxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A9X+1s7d8lRGjDDZpM979YKkRx8eSsSi/aQ2KCCGTpA=;
 b=V7Aq8I0O82TcKTdS2L8rR1cfDg49RtCe3X3gG/x/KbVpwiJlPb4r0n21bnQb1ZgwVS
 2iou4mglMKsUiUpxmw5/ehRfRmT3U3NeuBBD/yoCb4d3ArSv48Zew5YYqi1OQwA1/71t
 NYE++6CvW841XYz3JUqGtZnSXhP2jorqJIVphP9tJnMYMVZ9sYX86Cp3eEpwXaxBBlXb
 SjCDo+ULky7X1VX2nH+NQjQ0N/LlXqcSCgqseiWkUJs1uWKG/xtm1lK+hKG7LrBsyAOg
 3OzCwTyzvgUQHZh8Pu6wVGM5PYJI+echNS1iv7GPKPnMqfOfCmVPhbuKAcZwhKIHODFn
 DUZQ==
X-Gm-Message-State: AOAM533HCSZYJZixo82EQoa8LcMa3jGCD1eLH4Bl9fBPbJxYrnLCnZ9c
 0BENrqdXrVg7vBoTZPuqjpNgY04N7aspwE4TA5u1rA==
X-Received: by 2002:a7b:c246:: with SMTP id b6mr9174872wmj.37.1631289662370;
 Fri, 10 Sep 2021 09:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <20210902150910.15748-2-peter.maydell@linaro.org>
 <76cd3594-f864-232c-8687-19a1d44ff07e@linaro.org>
 <CAFEAcA8EoyaCSzA1vL_SHY50T6Fxjm420_pYgXx1_+E-nV-MBA@mail.gmail.com>
 <906c738e-904c-99ba-b6ab-2556e9262c87@linaro.org>
 <CAFEAcA8-wj4TEQ+VKhVk8JuUW3xKA2NuJ2AnU=2ZTDdMfieuGA@mail.gmail.com>
 <dc5b66b4-4d34-6da9-ceb6-00eb524a070f@linaro.org>
In-Reply-To: <dc5b66b4-4d34-6da9-ceb6-00eb524a070f@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Sep 2021 17:00:12 +0100
Message-ID: <CAFEAcA92sxy7bBQBH1A6oM36xVm1mpJMHGaS8KPB_0gW7vk30A@mail.gmail.com>
Subject: Re: [PATCH 1/4] target/arm: Add TB flag for "MVE insns not predicated"
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ENPKPFm3O0W7

On Tue, 7 Sept 2021 at 15:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
> >   * gen_update_fp_context() -- this function gets called for pretty
> >     much every FP/MVE insn (as part of vfp_access_check), and it
> >     can in rare cases update the FPSCR.LTPSIZE and the VPR. I guess
> >     this means we really do need to end the TB
> >     if (MVE && s->v7m_new_fp_ctxt_needed) (ie the comment in
> >     gen_update_fp_context "We don't need to arrange to end the TB,
> >     because [we don't cache FPSCR in TB flags]" is no longer true).
> >     That seems likely to be painful because some of the insns that
> >     do a vfp_access_check do complicated things with the TB exits
> >     (eg WLSTP, LETP) that are going to override a naive setting of
> >     is_jmp in gen_update_fp_context()...
>
> Well, we could let gen_goto_tb see that is_jmp is already UPDATE_NOCHAIN, and suppress the
> goto_tb in that case.  That would seem to take care of any entry into gen_jmp(_tb).

We actually already have code that sets is_jmp (to DISAS_UPDATE_EXIT)
from gen_preserve_fp_state() -- we do that if we're using icount,
setting DISAS_UPDATE_EXIT to force this to be the last insn in the TB.

Do icount IO instructions need to avoid a possible goto_tb ?
I suppose we do want them to go back to the main loop.

This suggests that we need to make gen_goto_tb() look at
the is_jmp value anyway, regardless of this series.

-- PMM
