Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2180668njb;
        Mon, 17 Mar 2025 04:54:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXblfVS+L+5ApW08Z3dPG1YvkVbtaw+ZpJZu8yp4EmHeVriwK5PPEkYKwTyBOxgFSisaYcvdtnrbmHXRA==@linaro.org
X-Google-Smtp-Source: AGHT+IFDSTSYYQ0bWq43uHV7E6CVle7v3x67z9SwbrDECPlQaAOq+7Y7ZKHRLIk+ZcHjehfvCdaA
X-Received: by 2002:a05:620a:260b:b0:7c5:3d60:7f8d with SMTP id af79cd13be357-7c57c7d46f9mr1668204085a.19.1742212459205;
        Mon, 17 Mar 2025 04:54:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742212459; cv=none;
        d=google.com; s=arc-20240605;
        b=JNWTKP/lP+NKuYl/4dEf8fRE0W6Ue+HGjMineQZYA4aaS0bl+Axduphq74TZszNjyz
         jwEw9dYwwSHOIvfSwrDy9OON8/436Mhbv8AbH7UCBwirnZT+LrZlntcJTUOoMc9t9ZUo
         GlNhrCKs/FJ8ChcZJPSGTXVtyMlnuiDyXmnobn8qY9LIbGAWHYSp26mDEJEjxRPvsApk
         V+IH7zzWJvc2wlhU1X3dJHlayLrulzpMlh+KLp/lbE0JOd+lvL10qaBsQ+KRTjazIV4z
         ZM+zYISztlea0+GInztCdotIPsh9HtH6C2UwXgAsnXmWKxeWyIj0gruJ2lQboYVKJoN5
         tLMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=pPe/7/yUQFRB8Elsl01jkfv7Oja5Bi+E+6DbLmo998k=;
        fh=lGt5eB7PAvT0cnVMwV+7aMbBCu5TP53EZU3wuO7iyHs=;
        b=jqE4syKkwaiMsZC4+GPOnSQbabGbZpe36BlMES/JXMiPKez8vEq8lhwNOkSwjs5MhR
         y73HNvn4qQQZe46jj2dYjAmamX+uJs3nCDdFwFvslhMsTt336GPWAxwFxSJsREQJ6+w7
         F15NB1C2TIm6SF5Ne5pAqg0M92KvFMgxykATirE/in1Q/hSGN22p0ruNnd/VpiSrUZhW
         HOxBZAyLCgi95kOyeCUuTEYV6JFUSrYZJB3zBYpSpw8paWL7qev1jriMdB7F3VPENm4D
         9exFVW0GK6ThXBq16wYmv/rp/wBpr86uirTJZR2GYv7ODZyxxgg7ZR6Rx8S2ttuCPEss
         cDYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bwZjc2wB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c573cf0a92si969188885a.451.2025.03.17.04.54.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Mar 2025 04:54:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bwZjc2wB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tu92n-0005Dr-JX; Mon, 17 Mar 2025 07:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tu92d-0005DS-18
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 07:53:59 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tu92a-0007yU-EQ
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 07:53:58 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-e53a91756e5so3918405276.1
 for <qemu-arm@nongnu.org>; Mon, 17 Mar 2025 04:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742212434; x=1742817234; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pPe/7/yUQFRB8Elsl01jkfv7Oja5Bi+E+6DbLmo998k=;
 b=bwZjc2wBo1X7q6keHAQ+1KDi7RLK+x8o0KG5SEZzKdXwdG/ScKRanUoCICYj4K49Go
 xbFLeyKxJEHDWjsUqQ/AA1RGwuy0A1ASpLTjwXxYOwq433p/OcLdgo7QJ3bGAqqfgo7F
 UmkGltjjF2KOhpGoGa3CS15SIPlv48T98b97nEgV+IPSnZmdALs/ELZiCnSUKmdbHv0/
 YXJ6qn/JWNiOtGTHbSkatlTxgv5S2tsZ6V/9o1C/3/qsfdOJ4i+tg0ihj3Qc3CJzv6EF
 TeWN3C8m1LvrTijGHyX76p/I2mGTEPjJJqk9SvPB5ZHdxEqtzZPBImBBZBcnrTEczuiq
 ecTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742212434; x=1742817234;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pPe/7/yUQFRB8Elsl01jkfv7Oja5Bi+E+6DbLmo998k=;
 b=WNXpjmMAAr/KfrylpTd3MqtVwuxKx1AVIys52s9lCoaS/7xtazZOvviY0cZegZHv66
 umgMNum5im6ttHTB9aMoqybW76gGq5fXONTUsdBZe9kM9mrdv+YJ5QYIuxh3X3e9420f
 nPRlcwCvJ5YFwPQERsvNvo/v/4SwAf0e9AFkbPOsTjOOnob+N57mg2Av4GBVZk6bik8i
 5lvysHeGIkpiHWHpx1Cp5NRnHW7wifqPCI9eiUj/1nvXj9z18BGDc8SMV4x5dX5Kgost
 R1uT0j6Nf2FCUkvhMAyqqOUir8lNc6hTGeCE33qgO6c3DsPYE83W0imCrJYOu016n9Rz
 10CA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbzSz9IYoo4CzlEG5WaFlvxEqh5qfCNHPU84SauDDjYopCNaI8DoCWuEDIWS8bExp1THT4pNFi7A==@nongnu.org
X-Gm-Message-State: AOJu0Yz/rOZPqGX8x6cXE6kPZJFAA6HB9cHk+siIa+x+tnWxTBjIFlZh
 1UCFaXJOY+ZASUxhekM8qyNWjoxQebV2DShn9Lbn82KL2ATpUg6fsC3rPb6eN7CQqYiThi/Mu09
 ckriFNpXoP4EMzSD6rs/uge+zejE02TxFUViCUg==
X-Gm-Gg: ASbGnctLblIRigeANqZteF3fM520Q1ZWKPIOghi7U3JsJUZyNMMnbsYQ3K5cY84YPnD
 wiGxmo/7RxypS513p+i7ShvbL4U2oBteHzMTUn+FBKQ/pRxAKkIR8f8jRRnHcHdDYIx7MZT+H/u
 fFOKE80L9MSzva0YBAyQ7zWvN3zI0=
X-Received: by 2002:a05:6902:2807:b0:e5d:aeb7:6e62 with SMTP id
 3f1490d57ef6-e63f64d236emr14202391276.7.1742212432444; Mon, 17 Mar 2025
 04:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250317-raw-v1-0-09e2dfff0e90@daynix.com>
In-Reply-To: <20250317-raw-v1-0-09e2dfff0e90@daynix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Mar 2025 11:53:40 +0000
X-Gm-Features: AQ5f1Jo5nBE7BSVUIahWWqdqD8IY585B7lrGv5MupP0LJ7p1lUOZobD71SQzxls
Message-ID: <CAFEAcA9Cy_870gxNmPFykzTjXOfi0raotmA1NRpZEQKfFfB=0g@mail.gmail.com>
Subject: Re: [PATCH 0/4] target/arm: Flag PMCNTENCLR with ARM_CP_NO_RAW
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, devel@daynix.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 97Yk5juZ0+Me

On Mon, 17 Mar 2025 at 11:16, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>
> Supersedes: <20250314-clr-v2-1-7c7220c177c9@daynix.com>
> ("[PATCH v2] target/arm: Define raw write for PMU CLR registers")
>
> A normal write to PMCNTENCLR clears written bits so it is not
> appropriate for writing a raw value. This kind of situation is usually
> handled by setting a raw write function, but flag the register with
> ARM_CP_NO_RAW instead to workaround a problem with KVM.

I'm not sure there's a "problem with KVM" here -- it implements the
write to PMCNTENCLR to have the semantics the architecture specifies.

> KVM also has the same problem with PMINTENSET so add a comment to
> note that. This register is already flagged with ARM_CP_NO_RAW.

What are we trying to achieve with this patchset?
You can't write to registers from gdb, and reading PMCNTENCLR
just gives you the same value as PMCNTENSET, so you might as
well read that, which we already expose.

More generally, the gdb-stub access to system registers is
something we put in on a "this is a minimal amount of code
to provide something that more or less works" basis. If we
want it to work better (i.e. more comprehensively, possibly
with write support) then we should address that by looking at
the design of doing that more holistically, not by making
tweaks to address individual registers.

Specifically, I'm not really happy with adding explicit
ARM_CP_NO_GDB flags to everything we currently mark as
ARM_CP_NO_RAW. Either we stick with our existing
"minimal changes to produce something that works" approach,
in which case we deny gdb access to NO_RAW registers because
that's easy and most of them it won't work or doesn't make
sense. Or else we do the actual design work. That might turn
out to mean "we explicitly mark no-gdb registers rather than
overloading NO_RAW for this", or it might mean something else.
But we won't know until we actually do that design work.

(see also https://gitlab.com/qemu-project/qemu/-/issues/2760 )

thanks
-- PMM
