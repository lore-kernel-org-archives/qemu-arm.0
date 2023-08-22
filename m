Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp721203ejx;
        Tue, 22 Aug 2023 06:27:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGk3PqHbEfNB9OanhIbjymK8L3EqXvyJC2TjalOaQHQMZkhNRd3H/VJqNq2p1U7U30rj5jS
X-Received: by 2002:a0c:e28e:0:b0:64f:3c7a:fc4f with SMTP id r14-20020a0ce28e000000b0064f3c7afc4fmr7494961qvl.34.1692710866319;
        Tue, 22 Aug 2023 06:27:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692710866; cv=none;
        d=google.com; s=arc-20160816;
        b=kPigzug+QZ5oZ7qgqnYvlxPGv5CK7nFVGQ4jyA4dBfsjtAwsX4WlrMsXQS0Vp3icB5
         aOmUliYsmHTTElmaVbL7SKbVRfSP4VFKSguzMz+GQ/FIRDkOGMkJq8y7kjAcozj0XUxZ
         34lcPXeloe3YhGvVdiiL5rA0K8X+0ZLUloI2JIPWfPVarc5O6/v5L45FZFXONe6xGVGE
         KEY0DJJNDorWnqpMBSsFhbfS/SiHBY38y8Lolw44dF3iM58GDi/D8VVOCdwoIHAKBWSQ
         sQJybJW5Bd9KeSwpbb2ZvH/sFoBClL4z2HyNdSjaZL8+N5rhXtmsI6y8gRc+k0qUFW3+
         Fdnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=7Tlq6sm0EJLMdMPojVf6LeZKgsJnFMVxazCT4Zj1wPU=;
        fh=2n2TGmFa1ri6Gm+ryyd12WVJ0xNvvL53TsASRxKHK5I=;
        b=HyGnQzS2yrEG2DSa8/y2vROE44SNHvkxLtTlaAejN3hvwWpaHDMh9eyDV5pNQ9aslk
         TigXX9yX5m0YcuWG4nVQlmIBTj8AFAiXKa3oFjuZHnMKNbv6WTfbh1qWkrx2bDCI5qnD
         hwh7FWCu+cbFrkktKnXDwE2piG6XeywEMz5LY1JsunbhoUtKbArwhtIngNeIdN7nuz8t
         3iF497Bu4+28MsUy5bXKXA75E+K9YxvR11V0Lyn7umJA8zWgRX6UPfZaBXlYb+FmBWOw
         k6l85r83V/qlk1PueSiQiRXlplinZNwYCRW4Nt4Zlwuk07xP5OwSnpJmgcBPxL2qPKTa
         1pHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VEhig5CF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4-20020a0cab04000000b0064a3217fbaasi1271114qvb.231.2023.08.22.06.27.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 06:27:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VEhig5CF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qYRPl-00067G-NW; Tue, 22 Aug 2023 09:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qYRPk-00066u-Uv
 for qemu-devel@nongnu.org; Tue, 22 Aug 2023 09:27:20 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qYRPh-0003pc-5z
 for qemu-devel@nongnu.org; Tue, 22 Aug 2023 09:27:20 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-523d2ef19e4so5684386a12.2
 for <qemu-devel@nongnu.org>; Tue, 22 Aug 2023 06:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692710835; x=1693315635;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Tlq6sm0EJLMdMPojVf6LeZKgsJnFMVxazCT4Zj1wPU=;
 b=VEhig5CF61hMtnyOFaSPwa06bsSLwHmPP7Bk61dOTwUH8pVen4j4fK6/dBjJZka34I
 jA2pxrYr0+BnZrOs+/B0X1OgxT21NVvjS4vFj8KZoozxci0Ki3157PQbeztjcr3YMBAS
 nq2/lMLVvonf2dlLMVgj2WanQ93HHCJjdqZGoz0gJ6iDruSEYQUqiHCcIm/LwhNPvN1u
 diEUedSw8ALkXyyvG97C+xfA4EflVD3lC0i5FMfFutrpxo0Zyavz7PVlOx2537ZP9YI+
 5V5tLO93H3+GeJGstJTJU30Zl9s5lNWZxGkbV4Sxgj7JCgbUAFYdgPZ/FbMaYTCvqGFa
 IgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692710835; x=1693315635;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Tlq6sm0EJLMdMPojVf6LeZKgsJnFMVxazCT4Zj1wPU=;
 b=bqKC6qPBSbmdnFFz2vEL/AaGxYTpyqNvj+3rOEi+doCNhz5OQPPYIH2okx34a9bopQ
 +fq/fQNHYUwRzVrC8Ert7dLqLrpjTvYdXmZBumd2YM+6s5vVlpkC4DnCCGouPo2k1XvR
 wJDOPlyEgu7ggfGpq2uA1SlJs/NWxOT1uXwOr4H+SU/sjdJAWcfTcG/j0YsZxtPgZM13
 8gGN2w9zrqGU505vP2usvrxr0HI/REryGFW6XAOQyTg78P5QlGFL1i0PcpnK37r6y4Hb
 AH1ktcZiAZOu0ra7j1cro7aWAl3TobFe0+vQQiNr4MQ716NmQueuRjM+bzHdljAaUAGa
 HZ2w==
X-Gm-Message-State: AOJu0Ywe1GJdehBSt+JY2mv8V3CqaDQuzKKLfOnC/bolDpXnIzD8Yb0v
 W02zo+dBIUYtCb52qj5kvS3qwGlZ4olhLJEEFL078w==
X-Received: by 2002:aa7:d790:0:b0:51e:5322:a642 with SMTP id
 s16-20020aa7d790000000b0051e5322a642mr7565425edq.27.1692710835519; Tue, 22
 Aug 2023 06:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230822110129.41022-1-philmd@linaro.org>
 <20230822110129.41022-3-philmd@linaro.org>
 <CAFEAcA-36XE-9ikSp0F4EMUKysz=ms2JyLCc8GOWcgJq3sb=hw@mail.gmail.com>
 <09dd2dc9-edc2-a9d2-e91a-a5eb07f96ca0@linaro.org>
In-Reply-To: <09dd2dc9-edc2-a9d2-e91a-a5eb07f96ca0@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Aug 2023 14:27:04 +0100
Message-ID: <CAFEAcA_k27aUdMZaONwVx-R4KvmPA_naUjF8DwuXMvVH2vfjYw@mail.gmail.com>
Subject: Re: [PATCH 2/6] target/cris: Use hswap_i32() in SWAPW opcode
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>, 
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 qemu-arm@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Song Gao <gaosong@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jfICY4mq/0B1

On Tue, 22 Aug 2023 at 14:06, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 22/8/23 13:44, Peter Maydell wrote:
> > On Tue, 22 Aug 2023 at 12:01, Philippe Mathieu-Daud=C3=A9 <philmd@linar=
o.org> wrote:
> >>
> >> Commit 46be8425ff ("tcg: Implement tcg_gen_{h,w}swap_{i32,i64}")
> >> introduced the generic hswap_i32(). Use it instead of open-coding
> >> it as t_gen_swapw().
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >> ---
> >>   target/cris/translate.c         | 14 +-------------
> >>   target/cris/translate_v10.c.inc |  2 +-
> >>   2 files changed, 2 insertions(+), 14 deletions(-)
>
>
> >> diff --git a/target/cris/translate_v10.c.inc b/target/cris/translate_v=
10.c.inc
> >> index b7b0517982..0ff15769ec 100644
> >> --- a/target/cris/translate_v10.c.inc
> >> +++ b/target/cris/translate_v10.c.inc
> >> @@ -506,7 +506,7 @@ static void dec10_reg_swap(DisasContext *dc)
> >>       if (dc->dst & 8)
> >>           tcg_gen_not_tl(t0, t0);
> >>       if (dc->dst & 4)
> >> -        t_gen_swapw(t0, t0);
> >> +        tcg_gen_hswap_i32(t0, t0);
> >
> > Both these are operating on TCGv, not TCGv_i32, so I think this
> > should be tcg_gen_hswap_tl(). (Compare the tcg_gen_not_tl()
> > calls.)
>
> You are correct, if someone copies part of this code to a new
> function compiled for a 64-bit target, this won't build.
>
> We know cris is a 32-bit only target.
>
> When implementing tcg_gen_foo_tl(), should we implement both
> corresponding tcg_gen_foo_i32/i64() even if one is never used
> (thus not tested)?
>
> I like completeness, but I'm a bit reluctant to commit unused
> code (mostly for maintenance burden).
>
> Maybe I can go mid-way and only add tcg_gen_hswap_tl() ->
> tcg_gen_hswap_i32() here. If tcg_gen_hswap_tl() were used on
> a 64-bit target then we'd get a build failure. Does that
> sound reasonable?

We already have tcg_gen_hswap_tl (it's a #define like all the
_tl symbols), so I'm just asking that you use it rather than
the _i32 version. If we were writing the cris target code
from scratch these days we'd probably write it to use _i32
throughout, but since it's not written that way I think
it's better to continue the pattern rather than deviate
from it.

thanks
-- PMM
