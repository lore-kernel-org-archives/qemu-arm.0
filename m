Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp3514279lfh;
        Tue, 31 May 2022 07:56:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvUJMxpi8FmJLJED3HuNz1vV1S0bSxqJr+LEX1UmhklV88WxqVLMPw+DpDh3RLqor3onFJ
X-Received: by 2002:a05:622a:4d4:b0:304:b650:67ee with SMTP id q20-20020a05622a04d400b00304b65067eemr5614688qtx.223.1654009007309;
        Tue, 31 May 2022 07:56:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654009007; cv=none;
        d=google.com; s=arc-20160816;
        b=nOUIWCVhY1+IPPbyzU5DevDq3ASp/XixeAuT1AD5yfYFyVG5kkkjXBqX+6mMb6alld
         wZiwwtSWXACeurdnYPI/mnfCjvYM6nGFwRvMzcgomNLdJtTuufZM7AKxEF48T7xrei7K
         Yuq9zdgX5rUNvLMct7tAwdtZQajM2ddeWQ1xVx/1nkJ6r0ZKroCYNKNEfaYRLT5oeqwK
         A+b3ge19CunZ3bCoLfewtSUVIBC2+mdKcrpZqT+mWJJVPvGdMTcWjfWeQ6fJsleE2Rif
         Hn423CBabb1m2dmtj6r/kvJhJZk6/BM/oJ+cKkh9wF06EZkv/s94X5w+lb/oyrsm+R4Z
         YZjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ysINbQHcUnxGeRnEoXCrG9JCUoms8oF+WIu6lzKxHSc=;
        b=SSX51cIA+B45v3KqbZEJelIj7n+F3a3+jycxzmYy3Q8QptoWIvQx+jlX5BersXzJ+H
         SCMnuPxj8xXdw/EGTbLyfQ9K/8MAFeYJfNiOZrBbCP8M6ptMDHs4PAJxnhQj7a9TVXQY
         nvp0dRSTVk718Zsh/k3MqEwfFBB54cs/dh+6wQaWPLBPiYoKIGMner1yfEUA/19XI6OR
         m8D7iTg2PIzr7ntnioFcUhUzVEkRwUOfVUb4p7duwF/OxMQMO6nBt4VrRnhL0NwHCdK7
         EW3/o1ie9tooNVIXf/nyagnA0ZaEEB3F8ohkHK3/ew2U/PCnIRl6QzSRP3XRphShJE3X
         faMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LDDOqslb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bw17-20020a05622a099100b002f7a43bf153si8392046qtb.556.2022.05.31.07.56.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 May 2022 07:56:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LDDOqslb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nw3Ic-0006Hz-Rr
	for alex.bennee@linaro.org; Tue, 31 May 2022 10:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw3Hp-0005z2-3N
 for qemu-arm@nongnu.org; Tue, 31 May 2022 10:55:58 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:33427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw3Hn-0008Qa-Iu
 for qemu-arm@nongnu.org; Tue, 31 May 2022 10:55:56 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-300312ba5e2so143104957b3.0
 for <qemu-arm@nongnu.org>; Tue, 31 May 2022 07:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ysINbQHcUnxGeRnEoXCrG9JCUoms8oF+WIu6lzKxHSc=;
 b=LDDOqslbQTBDjyCuOT1GMA9kMUWRoCjSoaSaogT9wZKMq6Sb0eQg1yKo1PZGzFU9vo
 /TXGd+kj6T+MjIEWLDCLqTq52vze12iFz7AHsWND7SWtDAuWkjaM2zYA43QF5zJNgyS/
 buRW2TNX/jAsRa/b8slvvXFByDBn0GBfh/xUwR8bftdm2lwPuRWClG/CuwGhu4AgZ7bL
 E42JslHZl+8jbS4u42uJ1U1u9mAiPhzMpAVcKM/DbB7OrXtrpS2LGVgM1LjQEREvycEi
 U0QPyEhGi9U0VW6gvLNjW7+vmOcAi83rVsN1B1pShZ2E/sh7qiPqQWijcQ8Lzl3icvLK
 3Orw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ysINbQHcUnxGeRnEoXCrG9JCUoms8oF+WIu6lzKxHSc=;
 b=kEZQO/Up5sG1oNpxVfnhQQoPtC6oX3W5BiCRr3Q3+gG1s8GSzNZPsRIsP1RtdwGL2b
 9YDj7H9S0Dz4DYPhrCZ/CbiE2HBURdnJtvkGLLZjgB1FUMWKuZ+E8lJhNXr2t9a6qkni
 lomHzGLo+V4Fm3w5xtZAtG/MbXkPS6E+Vu/UKp9WwJj9KcDqBX11QWNkOhGQd0r8sts9
 hbiiUKCmlv3o1NQMPBs4Uw6v70/RS5tpl3gEZOiM0QGFBHTfcQZJATB0Bj1Hgfswk8jm
 S+IKiLBp/SkHDt77qUEM7uLRbqdiayaJN8Mkis/3hL0aDFOGdeC8D3JIMjittEgcfDB5
 rIGA==
X-Gm-Message-State: AOAM531yeNNaFm7Yqzk2RMyIigUHCPZiarbWZlmnBv/LN9zSwkO8oATV
 Rp0w9Yx6l+V+wBeoh0vNPMD2K2G0SaLqiC4sSfgb/w==
X-Received: by 2002:a81:6589:0:b0:2ff:e11d:3fb3 with SMTP id
 z131-20020a816589000000b002ffe11d3fb3mr47980071ywb.10.1654008954093; Tue, 31
 May 2022 07:55:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220527180623.185261-1-richard.henderson@linaro.org>
 <20220527180623.185261-4-richard.henderson@linaro.org>
 <CAFEAcA8XTYwjshU1cUNtW0uzFQBa2rBJd+5JbraFP6iJ3g1Fwg@mail.gmail.com>
 <cebbfbb8-fabb-25ce-5fd8-5f6391d543fe@linaro.org>
In-Reply-To: <cebbfbb8-fabb-25ce-5fd8-5f6391d543fe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2022 15:55:42 +0100
Message-ID: <CAFEAcA-UA2D+AkRBKLofMDvwOf-hQYmOgtXpU6K92gEZy-RwGA@mail.gmail.com>
Subject: Re: [PATCH v3 03/15] target/arm: Do not use
 aarch64_sve_zcr_get_valid_len in reset
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
X-TUID: 2/Q+mhu/7ALs

On Tue, 31 May 2022 at 15:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/31/22 05:15, Peter Maydell wrote:
> > On Fri, 27 May 2022 at 19:07, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> We don't need to constrain the value set in zcr_el[1],
> >> because it will be done by sve_zcr_len_for_el.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >>   target/arm/cpu.c | 3 +--
> >>   1 file changed, 1 insertion(+), 2 deletions(-)
> >>
> >> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> >> index d2bd74c2ed..0621944167 100644
> >> --- a/target/arm/cpu.c
> >> +++ b/target/arm/cpu.c
> >> @@ -208,8 +208,7 @@ static void arm_cpu_reset(DeviceState *dev)
> >>                                            CPACR_EL1, ZEN, 3);
> >>           /* with reasonable vector length */
> >>           if (cpu_isar_feature(aa64_sve, cpu)) {
> >> -            env->vfp.zcr_el[1] =
> >> -                aarch64_sve_zcr_get_valid_len(cpu, cpu->sve_default_vq - 1);
> >> +            env->vfp.zcr_el[1] = cpu->sve_default_vq - 1;
> >>           }
> >
> > I'm still not a fan of the zcr_el[] value not actually being
> > a valid one. I'd rather we constrained it when we write the
> > value into the field.
>
> It is an architecturally valid value, exactly like the kernel might write while probing
> for supported vector lengths.  It will result in this, or the next smaller supported
> vector size, being selected.

Mmm, I guess so (having re-read the ZCR_EL1 docs).

-- PMM
