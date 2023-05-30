Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2260045ejb;
        Tue, 30 May 2023 08:30:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6v7HaW/+APhOa0lLoNDL5QeLIfDEAXnCs3qPhJY28brOctsnc5oGcQYszBymUpyWqcOYGj
X-Received: by 2002:ad4:5cc1:0:b0:625:aa48:e62f with SMTP id iu1-20020ad45cc1000000b00625aa48e62fmr2610393qvb.63.1685460647374;
        Tue, 30 May 2023 08:30:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685460647; cv=none;
        d=google.com; s=arc-20160816;
        b=XDtk6pVu7N/tsKB9pql72tinB64Ug8CPDuQ9/LCtyJrml2OkvIjetDrLXSMGTvDJoc
         eX2oJ44La7EFW7LPVgcg/+wSVWb9kmmGUx03AZW45YUxR8wN+ZarG8iojHrQV1aOHnTs
         toB3MWApVmXMsa37j+GIH+ulFjjtmasQDPX9fXkgjc8QfWwCt6F7JvNt6JZDQP5el8mU
         pqpn+4MeqN0W8IM1b8LLZHv+l5QYMBd76uGrDyxSOMW5/TaTzeqrAmqRvAOmkJD3Degz
         0YZ7BRiuP1CsuJL/QRxa9MOve2+nEb9Mjg5DJCFglHJP8gDVbng0Mt4yeg/X3oGwp3NH
         o+jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=iaTrPRGKkkf4z6lCtMi+5SfTV1OeH7LryHKVi7n7wbs=;
        b=rIMIwPJwBmEEHPeuXIXCtKzvMPPpCtfpb83CdjM/MSaxudIKb3jra2wQGiF3/lHk5M
         qqoAhhjJH4lN1aCGRovMB/IkApvbo6YD8hBPIL93B8TeMTf5KTvZaOnmo9ZFsUfu4ukY
         pYDaMbQW7Pdh99oleiBM/bDE6Kzr0+HIJAHzJ9lZYQSPOtS9GNlflBrhBFp/iwQtT4TV
         y702zwZEWvocKJaZ1tlEt8lz+l54vqnlv5/OJkxufUk5dPsyQpO91ffK+C+ux56c32Wy
         WIOYptQSMmWj8rcpq1Tk5cbStkkf16MFUYlgWlQiAtPn3rFqs4nuDjn6A4CVcS9rydY5
         pocg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PferG3AG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c1-20020a056214224100b00621599d2fa7si6782814qvc.428.2023.05.30.08.30.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 08:30:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PferG3AG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q41J2-00057X-AT; Tue, 30 May 2023 11:30:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q41J1-00057D-RG
 for qemu-arm@nongnu.org; Tue, 30 May 2023 11:30:39 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q41Iz-0002MS-UP
 for qemu-arm@nongnu.org; Tue, 30 May 2023 11:30:39 -0400
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4eed764a10cso4936155e87.0
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 08:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685460635; x=1688052635;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iaTrPRGKkkf4z6lCtMi+5SfTV1OeH7LryHKVi7n7wbs=;
 b=PferG3AGtnbIDLLpQWlRBHiDUiPiqgrFSUzYQBYHqtV40ZDzaC84sgZ4dsOLXzFos/
 XIwQ7h0u5eGwCtsEqz2BCLrj2vV1XzyV+tpUY1cQtZAsKO5D1FpJST8k7iDJHNb4xZqs
 Tgk8kX5olh6wd4NLjN3YvGVcToIFxhkb1rl27F3Kh0VtxIjw5OqoTgNa/FzkJ8cYGybA
 PFZw/dVvs2fFfiIMgEsXlRJYfqoAp0sx+U3bkqr3XOsMUbLvBAOoMxm16RVwqr1y0Cwz
 +Emj6KU9AJJMyw/VJceEMqFdOEROmPz0OTZRcIbZwBVpyySjR6SO3bM8KJzs1plwR2Tb
 A0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685460635; x=1688052635;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iaTrPRGKkkf4z6lCtMi+5SfTV1OeH7LryHKVi7n7wbs=;
 b=QoUw8oPz2g92AXedH0JgdnSAqLsbfWfsx38ixnJ0LNkJC47xSmDG+hus7D9vZWkS/Z
 QFyHcSY4FKYu3v7aM0Md7jNqY+4iNyHcw40fovljVdrWyqn+HSMtf7awcaaPvoQMLHLl
 BnmU8hyn4n4g0ffARGwJFvv469d2sNZwNp9shDycvH6jU/pxWOIQXt66Pyi/r3q8KP29
 hFzwZBArMabRs8omUQEtW4UhO+/IQroOqYNgMTsxiNnPT/vCtwmkCA8k7HTaOk4meYEN
 OCovbkW7n+nr5R5pYynD6he4Oe5+eLESBm8Q+vy6dPtxqC/HRV1WzlZf5/LOgpsZ7JnP
 MU0w==
X-Gm-Message-State: AC+VfDyIeDUhLwVV8JGRD02My4q/3Djz54dIRgN3ECRK4X3LUoNFexAC
 Szxj1tKNJQgY9SlWxMlrN4pdADZS26WT4/R+MiyR1A==
X-Received: by 2002:a2e:9e47:0:b0:2ab:145e:c04a with SMTP id
 g7-20020a2e9e47000000b002ab145ec04amr1152704ljk.17.1685460635032; Tue, 30 May
 2023 08:30:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230525232558.1758967-1-richard.henderson@linaro.org>
 <20230525232558.1758967-19-richard.henderson@linaro.org>
In-Reply-To: <20230525232558.1758967-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2023 16:30:24 +0100
Message-ID: <CAFEAcA-m514=+H6yuWkTWh=NMQFj1Q_4OchA=4KPBaBA=_c8vg@mail.gmail.com>
Subject: Re: [PATCH v2 18/20] tests/tcg/aarch64: Use stz2g in mte-7.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12d.google.com
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
X-TUID: 0j/wZF1uUpb3

On Fri, 26 May 2023 at 00:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We have many other instances of stg in the testsuite;
> change these to provide an instance of stz2g.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tests/tcg/aarch64/mte-7.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
