Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp471083lft;
        Mon, 20 Jun 2022 07:17:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v/hnZv65kYDOo3bEojeHcOL3aKylQXSKRoB0SddioIXi++a8wGEot/dtVa9XF9AD4xpB+m
X-Received: by 2002:a05:622a:8b:b0:305:29cd:4ff3 with SMTP id o11-20020a05622a008b00b0030529cd4ff3mr20267604qtw.32.1655734638476;
        Mon, 20 Jun 2022 07:17:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655734638; cv=none;
        d=google.com; s=arc-20160816;
        b=MOPuEzUWrpWt7qpayJWbXnYMEZII8mCTCoVdlw3omRQqr+TRvyVJOTKSTIAz4GAY1S
         hTQSjD87fWpOQRr2NdPckcaiqvr/6ehtsUKZSmClov4bScYBba5n0JeUydYW2CRPHDiG
         VoYdkvbXLqhJRrh8/QF10nBv+yonq6RFFmbz/X32P+soCDvNCbWdgM2NEyPCdociLZU4
         Hexcgy6ObYwNCIj/CNomzHNbBeAsVYbfq+GIqwXaPFwufioZFVzN43sFNb+sC5NWFDda
         b9X20a/tw1RJUk/QSu6NnHu5I8rYJG9X/f0qBHBQW1pIUA7Aw6az5J8zeF7hde0l7L+q
         UP6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=dQr983cL8r8jweYuTWZ6X0RnYCVEw2hBOCEy5+PaE1U=;
        b=P+pbCEXEtRhooftfGiZiON6B46y/qJcfF/0wWx8X8USDa4vJC9rPCSMzsvFj1c1/TF
         AkHg3tVzVKTqPaQ7LS0ObybQmvDRWkGH++AhaLghemAxsOxWca3VxGNgtF0stBn6UpYl
         QLot4nNwBhbdeATUTGBEBh9mVwYC20VMxq9mGyAtHbFUhyxD2bZ52unddRY537mnSib3
         ft903B8QXj7CcTrBigkX5VbQslpXtvk93x14ZEEKxugjVShOht99fFkGArP4w8k3N2hn
         LoZ6SzDgPnsO23G0K10898TJ51FC3ZtVCS4c203kgQeTU8WU3F87t66kSqFbbyhjzWrr
         McoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ddYTiFef;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l8-20020a05620a28c800b006a7032548b1si8610466qkp.39.2022.06.20.07.17.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 07:17:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ddYTiFef;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3IDN-0008Pl-Fq
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 10:17:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3I9U-0004h3-CE
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 10:13:16 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:41540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3I9R-0007wD-JI
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 10:13:15 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-31780ad7535so75425617b3.8
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 07:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dQr983cL8r8jweYuTWZ6X0RnYCVEw2hBOCEy5+PaE1U=;
 b=ddYTiFefU8eWsedYLTx/Iof2+FjZEdeTDFO6H5T60gZ+vYpZCE1kX9fmeYMqOjh76W
 zl6axH2Q6+xNTj54Rs11d1CA6UHeZNPgXocwMD/bRKqt4ZGkg5R3xfTQJYwCmgs7wYSy
 5Mqv5xUvftebO1qqybN2HqWxx96ORBDC9JbaNQMHPXDNPob+66/lrohOUSFbbsC3nZeB
 8mG2luIFctf9GELz8YmRgnx4j2pXRblY4uF15wTH871as+XrlNWLKQo776oDAEpwHhqW
 2j14CpCS1t6ko3IkKVeP1HTQWB/jpFPAt7HeP1ApVCDjfdo5CKzG+DvqlQUpeZIJK1XC
 fqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dQr983cL8r8jweYuTWZ6X0RnYCVEw2hBOCEy5+PaE1U=;
 b=F53kFf1d2VFCfaBBfyx1KRK1Zs9zno83+XCx+Sr9hwvoQW2+QVMd/opeN7m5o9WE4s
 Tv+UxAI6vcx+JP3Cq0z1j7miPf4Nn1wkvfoqvIOj/t9S0jLDvm/gb8YiDo79zvT97Vqy
 xqR1hKEMFEK/okXV9tQwEG3B/QIAz3RZE7KVV8qguLmRCig4vW05OIV1axdS9XU+sEvc
 j5nLXzEIHl86Wmx5Z23Hw3okkAleyAqpz6GeE4F0WPRG0NemBHjxV8FvHceXQgJpihxM
 IkAzspNN3upCoh989awMWpUeDnBiKNKuCWkJSpGI9WPaQwcf3qxHIorNgvKPCRay4Mqh
 aEZw==
X-Gm-Message-State: AJIora/0m+8W5wmNNol7fgn6Y0YWAi9xn7LUW1evLKPvuXYB3FnwcMij
 HUKlEhz8kj3dpFQ5z2zh4IrNBnvTD7wHPJ78wYb5XA==
X-Received: by 2002:a0d:ca0f:0:b0:317:a2cc:aa2 with SMTP id
 m15-20020a0dca0f000000b00317a2cc0aa2mr12304851ywd.347.1655734392443; Mon, 20
 Jun 2022 07:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-46-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA9CxLKNZzfvaoUFSRtykEymu23er+zj=7GA1V2nRtcU9A@mail.gmail.com>
 <939ffd58-3a89-ea5b-157d-d4a9bd4dffa4@ilande.co.uk>
 <a425db75-5636-8b29-26d2-9bef52c8eb25@ilande.co.uk>
 <CAFEAcA-F_v_S3TMbtQvboBCzg9OsXM3YZ-Bs6yVabTpE9_yJ5Q@mail.gmail.com>
 <ee98844e-93e6-1c43-ae1c-57af166d9beb@ilande.co.uk>
In-Reply-To: <ee98844e-93e6-1c43-ae1c-57af166d9beb@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jun 2022 15:13:01 +0100
Message-ID: <CAFEAcA-5P+45sZeprHCsEWiXCQ_pojdPG9U042nmJEmr=Wi-_w@mail.gmail.com>
Subject: Re: [PATCH 45/50] lasips2: use qdev gpio for output IRQ
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QqxliYZltHLq

On Mon, 20 Jun 2022 at 14:22, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> On 20/06/2022 11:17, Peter Maydell wrote:
> > Well, I think that "unnamed GPIO out" lines should be for
> > actual GPIO lines, ie on a GPIO controller or similar.
> > If you want an outbound IRQ line and don't want to name it,
> > that's what sysbus IRQ lines do. Otherwise, name the GPIO line.
>
> That's interesting - I've always been under the impression that this was the other
> way around, i.e. for a TYPE_DEVICE then unnamed gpios are equivalent to IRQs, and
> that gpio lines for any other non-IRQ purpose should be named :/

Well, named GPIO lines are relatively new, so if you look at older
devices you'll probably find plenty that use unnamed GPIO lines
for various things including IRQ lines. But I think that for clarity
if you create something called "gpio_out" the obvious thing is that
that's a GPIO output, and if you create something called "sysbus_irq"
the obvious thing is that that's an IRQ line, and if you want to
do something that's neither of those then the clearest thing is
to name the GPIO.

-- PMM
