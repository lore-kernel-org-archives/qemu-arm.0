Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3638392ejc;
        Tue, 29 Aug 2023 05:52:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEet5FoyrR85H6IWqSDmY8ptB0KGZDk7kGiPgqTQ5okDS4mZiukfsnOvnOvbYhyxNqvMjFr
X-Received: by 2002:a05:6358:2484:b0:139:be3d:d032 with SMTP id m4-20020a056358248400b00139be3dd032mr32446908rwc.0.1693313569634;
        Tue, 29 Aug 2023 05:52:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693313569; cv=none;
        d=google.com; s=arc-20160816;
        b=sR190pzMleVoMNaMq59Qt5x6X+ciGX+m4hZfzAt3jc/J0XIuGG8AdgfSNAfrWS9ZpH
         J8Va6LWMpcUtkznstBrLxQBxa5fYjLUX8jRwxfDXqUr2r3Edhi9E6XNS25VXJQzOjl4W
         R4w+nA0Ir+uPo1ybpZ3hdL5rds61bnmdDEJYWFxtkHrDuF/Kqpl8Xy81WjjseUslu2a3
         AxJn2r1zEVj4rMg6rVhF+BO4JPT+JgSYc6E5rpvZ4jtetNNpqREYf7YmIHDGumWbOWcG
         Zjr6hqiq1WZ0vZI6xR8uSk2Ivgmn59mq+JK1524FENFsPWQeRFcOkVISgZefkh+fUt8y
         nBKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ybN8uNSc5PZTJ6TLlLfRoGWfX9zbzqTmwNSDNk+P1Pg=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=ZWkODpcHKdSsYlpjToMQsB+Jpc9s5IcGgT4Y8Dxn6jie1qHvzrnsucaxHVjJBFMBOO
         qUrO6kV7Gf4t6KuUpJaVeXKs9TTubsizIrI2YbAgRmNyu8xTXQS0xbGxV4KQnBzEmA4Q
         JsqzD+JouTuoNKxYtByTW5TVN76Iy/HbjaN1jF6oPSyAbMn4AedzHp6S1OWZnnUY2fNf
         +Anh0E4OwYwp1u1tUvPafsNIU+ay2wtVKTS0Iw5M8oK6KbbFB7fapGVAKvPvGfrlO5r6
         k83YM1D9GTdCszO2RCXt1psRnzpmItTVEUsDCpryaviJgAh6NbkMQTDkhAk6vU0B82va
         Htpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uUZMwvG7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f9-20020a0cf3c9000000b006261bd7a355si3716489qvm.375.2023.08.29.05.52.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Aug 2023 05:52:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uUZMwvG7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qayD6-0006bj-K5; Tue, 29 Aug 2023 08:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qayD0-0006YQ-8t
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 08:52:39 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qayCv-0007Hu-R3
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 08:52:37 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-52683b68c2fso5777276a12.0
 for <qemu-arm@nongnu.org>; Tue, 29 Aug 2023 05:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693313547; x=1693918347;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ybN8uNSc5PZTJ6TLlLfRoGWfX9zbzqTmwNSDNk+P1Pg=;
 b=uUZMwvG7q2+Q55ARgaikv4ykY81wCncu1KXyMXOHuQ2HSW2dKaBI+hWDjlNQr1LPz1
 FLAv9gsryhahd73dS1HBXCk8MJN7/PDW8LX/gr4dEVRcGgxXLVXO2rvp23FH8T2fOuRZ
 REwcmXSKSSjMHoiOJbIA8p0+sAfe1kjJf/Ur4WNrIoUHVg8SOyz2qLuC09UsGXjfZzo8
 hVcE1qMr4IHc1yrUafpuiflLBuFAksRI+L4OjS8eVroi/FhjNuDYIIs0iEoVvWBxRvFS
 jClNeYqjUtlyztU9zEaT408jvb6bGVRw7syPOvKf2BJoNZ8Sawc+l+8/6qxrNMU7UQpW
 fN4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693313547; x=1693918347;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ybN8uNSc5PZTJ6TLlLfRoGWfX9zbzqTmwNSDNk+P1Pg=;
 b=FRU0T3fTnm0GOIUPkPKN0IrQwI1tvRfIawYnQp3Gp7EuBq/mgGW5x60AhVWakYBWrE
 MdHrTreGFOjEAjpoPPdgv/hedMR5g6TkEQDBSmBzQeTFHl0KlRhA/ADMS4oasQfSF3Ab
 IzTWxIxkkJfLFzo44lKYcE0PGm1bG79nSjWOC6y/wFxmMxtee4PdRcBOoiQnC9gNC+hk
 ybMIZVm9SMHhmsjtfjrWI9iSE6FCTGibzDBL9G1pkT0n5n5vdvfmTnBE3XcicxXZCY3O
 SOO7DrjPpIVxfqzsICdmA6kv18dwrbA/kDA35Sl8n4vs9wEjNSN5uz84NKbbwKJmPRc/
 +KYQ==
X-Gm-Message-State: AOJu0YyEX48lqmpiifTTFeH62hanOzmJ4R6Bm62Lm5cChdY1ksC3JIEt
 B6UhiXtu8bTVy9dF7KelhG2jPpI2YKENVCezUNTPtsR0Z2jZsaf6
X-Received: by 2002:aa7:d6d3:0:b0:526:9c4:bc06 with SMTP id
 x19-20020aa7d6d3000000b0052609c4bc06mr19559979edr.18.1693313546757; Tue, 29
 Aug 2023 05:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230822042530.1026751-1-richard.henderson@linaro.org>
 <20230822042530.1026751-2-richard.henderson@linaro.org>
In-Reply-To: <20230822042530.1026751-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Aug 2023 13:52:15 +0100
Message-ID: <CAFEAcA9qHW4-OGnsPnNHHhn+fda0Qri_8iqcNwkc-nhxqYiCYw@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] tests/tcg/aarch64: Adjust pauth tests for FEAT_FPAC
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
X-TUID: VUQ4oWQlmAXV

On Tue, 22 Aug 2023 at 05:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> With FEAT_FPAC, AUT* instructions that fail authentication
> do not produce an error value but instead fault.
>
> For pauth-2, install a signal handler and verify it gets called.
>
> For pauth-4 and pauth-5, we are explicitly testing the error value,
> so there's nothing to test with FEAT_FPAC, so exit early.
> Adjust the makefile to use -cpu neoverse-v1, which has FEAT_EPAC
> but not FEAT_FPAC.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tests/tcg/aarch64/pauth-2.c       | 61 +++++++++++++++++++++++++++----
>  tests/tcg/aarch64/pauth-4.c       | 28 ++++++++++++--
>  tests/tcg/aarch64/pauth-5.c       | 20 ++++++++++
>  tests/tcg/aarch64/Makefile.target |  5 ++-
>  4 files changed, 101 insertions(+), 13 deletions(-)


>  int main()
>  {
> +    static const struct sigaction sa = {
> +        .sa_sigaction = sigill,
> +        .sa_flags = SA_SIGINFO
> +    };
> +    unsigned long isar1, isar2;
> +
> +    assert(getauxval(AT_HWCAP) & HWCAP_CPUID);
> +
> +    asm("mrs %0, id_aa64isar1_el1" : "=r"(isar1));
> +    asm("mrs %0, id_aa64isar2_el1" : "=r"(isar2));

You need to use the S3_n_Cn_Cn_n encoding for
ID_AA64ISAR2_EL1 in this test and the others,
to avoid problems with older binutils. Compare
how tests/tcg/aarch64/sysregs.c does it.

> diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
> index 681dfa077c..780ab3f183 100644
> --- a/tests/tcg/aarch64/Makefile.target
> +++ b/tests/tcg/aarch64/Makefile.target
> @@ -42,7 +42,10 @@ endif
>  ifneq ($(CROSS_CC_HAS_ARMV8_3),)
>  AARCH64_TESTS += pauth-1 pauth-2 pauth-4 pauth-5
>  pauth-%: CFLAGS += -march=armv8.3-a
> -run-pauth-%: QEMU_OPTS += -cpu max
> +run-pauth-1: QEMU_OPTS += -cpu max
> +run-pauth-2: QEMU_OPTS += -cpu max
> +run-pauth-4: QEMU_OPTS += -cpu neoverse-v1
> +run-pauth-5: QEMU_OPTS += -cpu neoverse-v1

Why do we need to specify neoverse-v1 here ? A comment
would help.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
