Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3049354lft;
        Mon, 4 Jul 2022 01:34:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t356VPKbhTGVLly+1HFCtSPCjBTe1I574NuP2CHNUoLBJiD3CeW8D02rzXzSGSUJYUu5Qj
X-Received: by 2002:a25:1945:0:b0:66e:320f:b374 with SMTP id 66-20020a251945000000b0066e320fb374mr8641173ybz.8.1656923665620;
        Mon, 04 Jul 2022 01:34:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656923665; cv=none;
        d=google.com; s=arc-20160816;
        b=uQRQZyZ8eDFPQGLmWf4EzufrFYZAgH6qN2k4Y+62Yw0zi7vRUicQXLf3d3ZK2THyKw
         hTF+0bj1M+Al8383mT33qU4zXaxznHxjKlESekXKyhOzk8hjes+l4rDdH/TodR9WJ2vA
         1jsf3PbP2hWOFfeEoDX8IcIMTox8rzMtT32mNPXz836GZId+HMG9u0vEwY21HK5nwjq7
         DnOxZNgHgDD89IdKVF6/XfX56ONCltGkDhytEh5R7CW2AAQB1louONWPpqO0QKMFzrTG
         NHxdp7hp3TwnDHeSmlRZVOe29qPIUw9BDRcxGO7OHUm6TUvCOsqTbUmgTXQohXGcjMqB
         voQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=sqBX9KnvPqZtB1YMDIS37EODqcPLiSRn7eh9oZpIje4=;
        b=ggsAHxp6taCJZj7eOFGRieJT8YSgrmC/yBkbRvMTuMpC7Flk8GzDLFxit0GTzDyLtJ
         DMqoPVx9F1/6UVVg+2udNQiAvcXW2hJQO4nZmhQ6Xsnq2dVYXCeWe06bpq4uKn8xgZak
         q/yfPfds8lhNI+p6yy9ehIrP2KxMJ/c8/b+GPrRIFyc31eolv7HVeUm9QBCtylm7m2O2
         OHzamabk2KsrHLSnNVrFB/wZmyUChQKCoLtSIKfJgUqH2lY8RVuyjXfazWBDy4bt9rJ5
         wLrQa8vjou3gFRWMzWAwt1Q6tQZ9HsFLNbjYjf4W2mN1WQgctqx6a2QouZ3ayW1VU0Hv
         0cBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eHgFFj0q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l8-20020a056902072800b0066d73abacc4si26954266ybt.665.2022.07.04.01.34.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 01:34:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eHgFFj0q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8HXF-0001Jx-21
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 04:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8HWl-0001JJ-2s
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 04:33:56 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:42861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8HWe-0004TW-5r
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 04:33:54 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2ef5380669cso74845307b3.9
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 01:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sqBX9KnvPqZtB1YMDIS37EODqcPLiSRn7eh9oZpIje4=;
 b=eHgFFj0qCDpfuGlwOblodi9eY5rU+MtxTb2/hLnHiQ9dAFGHHEoHetiVs5LulshENZ
 +9uJ5Y4ekd3cJwZPEdz/zGkyFCxmDbomMqES8F6VT6I5EM8KXpBJwOMrjpAviRAwrwNL
 i0fH+cOOItyfzdi+dhC5SfLGwEGcThT8Vdl9kqrg+uBbGti/GtBJv1hmQpSb/zde+8qi
 ik3R9cJQQcb2KqcJpVN9e7IRhJknaF0OQ8L335IpuJjo/td0NJC8h/uplgJNWpfXo8zr
 o3ia19rY3manLHag4BwoHTo9dt8PoqPiCVcZQ2gEfF3GQMIwJA/UjSAI1hKNObxMl3g/
 D01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sqBX9KnvPqZtB1YMDIS37EODqcPLiSRn7eh9oZpIje4=;
 b=UIgcEA9+WwmSOpkyBbJumAlrfqmpqcRszJboudxiDRe7z0sLWbBIyJI9OhTSb/k3zn
 E7GtxTuZk4V0K3FFijdKQKZhQi/WFLQyKcphQi5NxsIEZNDwzYY2vg7P0eag5Zp88m7M
 LhQqCz8vIaFlReWgM9bUKF3IA9CNjmQvcoOR3Y2q+b/LqOgHKmkpBGP+NQD/NMFTfrid
 8Ww8L9EUTYpL3lKuX1MZ7gsesX+odPq6XAfpM8FCvJpU/KNvuQH8aSoWJUkvLtOrgvxa
 UG5/54Cn19TEPyoi5yaZ7aQ/3NruTEs8FAr9DR3ZbECYIGg4Al8o5oe1zKf0Wns78Tjp
 4cWg==
X-Gm-Message-State: AJIora8SsWooSEwRuC1afg6lUmwJ7qAVrvrjaKNTLhYBoU3x8vbXzWkN
 dx+hrIAsVgaa/BmhBzM8ZkzCqCoPJqgpp8U6AP/peQ==
X-Received: by 2002:a81:6a85:0:b0:31c:8624:b065 with SMTP id
 f127-20020a816a85000000b0031c8624b065mr9890991ywc.64.1656923626843; Mon, 04
 Jul 2022 01:33:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-4-richard.henderson@linaro.org>
 <CAFEAcA9MNTrD=O+v53TsejbbpJrNzfhWv-uq6tJfXnXzLKSQRg@mail.gmail.com>
 <bea0892e-ab42-a61d-418e-37ea49cb5a25@linaro.org>
In-Reply-To: <bea0892e-ab42-a61d-418e-37ea49cb5a25@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 09:33:08 +0100
Message-ID: <CAFEAcA-eK2Hm8oY2eytDDkKfFrrBKZ=mys6XEcxJzNMPmdVfCw@mail.gmail.com>
Subject: Re: [PATCH v4 03/45] target/arm: Trap non-streaming usage when
 Streaming SVE is active
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v6/7WxsEmqdz

On Mon, 4 Jul 2022 at 09:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/1/22 16:36, Peter Maydell wrote:
> >> +    /*
> >> +     * The SME exception we are testing for is raised via
> >> +     * AArch64.CheckFPAdvSIMDEnabled(), and for AArch32 this is called
> >> +     * when EL1 is using A64 or EL2 using A64 and !TGE.
> >> +     * See AArch32.CheckAdvSIMDOrFPEnabled().
> >> +     */
> >> +    if (el == 0
> >> +        && FIELD_EX64(env->svcr, SVCR, SM)
> >> +        && (!arm_is_el2_enabled(env)
> >> +            || (arm_el_is_aa64(env, 2) && !(env->cp15.hcr_el2 & HCR_TGE)))
> >> +        && arm_el_is_aa64(env, 1)
> >> +        && !sme_fa64(env, el)) {
> >
> > I can't get any of:
> >   * the logic in the comment
> >   * the logic in the C code
> >   * the logic in the the pseudocode AArch32.CheckAdvSIMDOrFPEnabled()
> >     which causes it to call AArch64.CheckFPEnabled()
> > to line up with each other.
> >
> > The comment has:
> >   * (EL1 A64) OR (EL2 A64 && !TGE)
> > The pseudocode has:
> >   * (!TGE && EL1 A64) OR (TGE && EL2 A64 && EL1 A64)
> >     [seems odd that it is checking the width of EL1 in the TGE case
> >      but I haven't followed the logic through to find out why]
> > The C code here has:
> >   * (!TGE && EL2 A64 && EL1 A64)
> >
> > What am I missing ?
>
> I'm looking at 0487H.a... are you looking at a different version?
> Because the pseudocode I see isn't what you list above:
>
> > if PSTATE.EL == EL0 && (!EL2Enabled() || (!ELUsingAArch32(EL2) && HCR_EL2.TGE == '0')) &&
>
> > !ELUsingAArch32(EL1) then
> So
>    (!EL2 || (EL2 A64 && !TGE)) && EL1 A64
>
> which is, as far as I can see, what the C code has.

Yeah, I misread the pseudocode (it only calls AArch64.CheckFPAdvSIMDEnabled
in the first branch of the if..elsif..., and it's there that the SME check
happens, not in AArch64.CheckFPEnabled(), which is called in both branches).

thanks
-- PMM
