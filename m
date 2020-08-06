Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1601649lfy;
        Thu, 6 Aug 2020 05:54:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhQWhfxArG8Lz29mifQd5BujDAQvBbHsHESyFSgS1yJwnZaJuAcq0qm8I0vI73YuChh4ZC
X-Received: by 2002:a25:4609:: with SMTP id t9mr12064087yba.231.1596718482881;
        Thu, 06 Aug 2020 05:54:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596718482; cv=none;
        d=google.com; s=arc-20160816;
        b=jCH6WkJLYlFRfwneYJbGsivrOexhrFwzZF7cRS2FmY/E1BLcEUah7xOIPgsps0TCJK
         5GmIlhE96w6UUhIYD6woz6RxU38O9psfy9Sla20KMdtqqxxvk8ZqZqMd8wNLGulEqUqy
         jJlDjCo8M1kJQ5zz3PcdeYxgztwrt6oSuuLg37ZzrVlapwJq6XkL55zPJf9cVOASyf2y
         +6mDg6Xn7+XtIrr5ToMmuVFtigiYgWiRk6qKJ4oX3oh3xayylKxUNKeX3SqyEJhSgaRb
         VJlIJLiageU07xuUyPbhEPYtfo4EnhG/u+tipGfQfZIr0l9DR9F2Pm4EVS8twh8GTrMM
         TRpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Ma5Spo8GB6B6vpsylIDasmSoZ8sei6BF0p9K2xGKKno=;
        b=hR0R+4HogdSk/FuTetVqLdNHBolO+PZYKbQzUBK6kUg2jxe6QGy5Rg3/+tah7ncAAL
         2ksmyDAD2Fjh7Ut+BUDFazVqafKoZSXPe6DnivZ5Mm+i3E9OQc1x8ZfQAo5X+CzL+djo
         PvYIsEmmNnNMVgh8jtnWSeF0sE4nAS3qFXX1PpcVQuXxxXgRRXOxhBSO/nd0NK2gRS8l
         YdexJrZwX/fN1whGcpf2gbA3xgs52nT5GeSv48ZnOdxhlieWjmud3esGPX5f8NNVlguJ
         kWie/EsCSxCDoSBkdYpCPCHq5rfegtaJ19RjNdw1o50v1vluKjxxCO7sBxagChFwEjXk
         kX1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TISiTnV8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14si4525071ybj.341.2020.08.06.05.54.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 05:54:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TISiTnV8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3fPu-0004EN-22
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 08:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k3fPm-0004E0-EV
 for qemu-arm@nongnu.org; Thu, 06 Aug 2020 08:54:34 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:45213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k3fPk-0005vp-J8
 for qemu-arm@nongnu.org; Thu, 06 Aug 2020 08:54:34 -0400
Received: by mail-ot1-x341.google.com with SMTP id c4so10524967otf.12
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2020 05:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ma5Spo8GB6B6vpsylIDasmSoZ8sei6BF0p9K2xGKKno=;
 b=TISiTnV8waiu4/S5+LTBUOFoUK5QuLpjjHMR+towkIIAkt0SbWAm0LNDbllhNy97ai
 38OgIwdUd6XVUfN3Y1edN1rLbSt4IMH9s9fmX9MfnEf0BVVbgIZndKvKxABAWLyHXBuJ
 tII7/eDa29WS4QCpATOzJqe+FDAEMi7bz29KG2jwL0/JGuhUSxZSvQ5jq7PPBS1woqeD
 uSwbq9gYsPulMX9XpItbHR3yrXyRQT60yYme8PQYa/m2MzwOEnr2hv2XkMOxDJbJtWbk
 CRW8ZHwvDMeo0pUSpqeg8QtpYnObAATLEnRBylswvih16TmI5dwyXJ1oajbHoU3dwPj6
 2syA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ma5Spo8GB6B6vpsylIDasmSoZ8sei6BF0p9K2xGKKno=;
 b=RIX0w0XfQJ07ZuUBKyIpB7Q6WUBc+utYrvKuMRT7WLC7udos4l3ATlGdqQzjII3eeK
 C+WDD7EkWrfTdbQMRE6dHoWbuUbPezJQ9U2v+4fih4bvEoi4WQQNV54o8gGZkRHcr75O
 A/3WJsdHfrKfjzv9jmccyuRbqEsqhGPuDV3GJVmuMCan8x4wVFqdWhJf5jLL/4RvZCzX
 ZNWSBPQDOUB11ej02g1Z2JMcHChQBKFqMrFlXB2zbHn53TxierxE2ciKoCEHXmZQzeuV
 2OkBo0GX001JVm9VqRC2ygtKNBz/1tp5uxJ+EapPy7cUVHi9UcGeu4D9x1dvXiBJZNcv
 pnSw==
X-Gm-Message-State: AOAM531Eh/2q5xUuy/yyc6ojk5E7lsTgqHdFFbp6opU2/uE3UM3GmhIC
 RFBXQJPphSDyFAs9YsUuV9nylZq3F2XyH838fdDHjg==
X-Received: by 2002:a9d:39c2:: with SMTP id y60mr7000005otb.91.1596718470944; 
 Thu, 06 Aug 2020 05:54:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200709152337.15533-1-f4bug@amsat.org>
In-Reply-To: <20200709152337.15533-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Aug 2020 13:54:19 +0100
Message-ID: <CAFEAcA_Sbaai_TPMVkGHKGGhfyjc1Mk2Z6pWSVkLcwHLVZVzNg@mail.gmail.com>
Subject: Re: [PATCH] hw/cpu/a9mpcore: Verify the machine use Cortex-A9 cores
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Rob Herring <robh@kernel.org>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Randy Yates <yates@ieee.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EEeZaHgYfFms

On Thu, 9 Jul 2020 at 16:23, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> The 'Cortex-A9MPCore internal peripheral' block can only be
> used with Cortex A5 and A9 cores. As we don't model the A5
> yet, simply check the machine cpu core is a Cortex A9. If
> not return an error.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/cpu/a9mpcore.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)

Applied to target-arm.next (for 5.2), thanks.

-- PMM
