Received: by 2002:a19:fc0b:0:0:0:0:0 with SMTP id a11csp208783lfi;
        Mon, 18 Nov 2019 07:42:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqz6humRNnna1bRH+lxLmOVizANKY7JXpPTfYV4NM8NMg2mOi7YSXOY8Jawrg9ZYhXhRHi8E
X-Received: by 2002:a05:620a:648:: with SMTP id a8mr24660131qka.426.1574091735609;
        Mon, 18 Nov 2019 07:42:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574091735; cv=none;
        d=google.com; s=arc-20160816;
        b=zjQt1MV1sJfUn1df4EJpshhzwl1fixkJhtbxnn86TFw4kXiOOD7thx4bl4Wx3iPnQW
         WZNiLBSxLIWULJ2KSJRoEuiHPL9QaNgRbHvBe3t9xCrebY+3WTnQS5wMBjwuwLIj3FNU
         z5XLLy6evUsBIdsJuudyBBIDJMnH2pSs6mKrjDM212R4yGqMjqEx6k9f/PVkBhg78qJC
         3Z6Naa6LoIBFIU/nDg6qRDmYk+tPRzN2qXvheF3Zmkv7RFePPLAAsIBujWJhgR98x5s/
         LXI6ZYPPsU2SvGmtQjEB5i3hnedmplGp9M0Xp9n/9vYRDgJi+RJvAz2uRCG9drJq7WA+
         mSbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=X/qKHiGv8AHlwunNFoSi7Jst4DhffNtRK+oUrOvA1Yg=;
        b=DsXRkaNFRLm11vpgiuB+xp7nwu0w+nGNYqG8jE5KmYuDJIcl2e+6oHxUbquY0IoSOc
         zjnguppI/pw5AT3HnPyvplMvPuguuoyd7DxwlWAL8SAiWaFM7OIwQUrbUX7kW8WPC0GS
         Hi7g3yBYXCdlEIeHLFhkOex8LENzWXlz43/PFtmmviAd99BFoOH07iUMMxu4u1+riFI7
         p5/fn/KqsvvUt51W/8bLGyO4z8hAyHSruZGZUqf+orDYpEpEmlUUSV3VcpyaaarPGHtp
         DQF2VYFMzFH6Q/yE4gVPDtMDoRdzNp1SLW9igByVA5hxh0Aj+nd2LoBZ91KODFhEJbMb
         VAGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HESWmeMQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r46si11900683qtc.200.2019.11.18.07.42.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 07:42:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HESWmeMQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWjAN-0004R7-2s
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 10:42:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39607)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iWj8V-0003Lp-7b
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 10:40:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iWj8U-0001pQ-8F
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 10:40:19 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:44378)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iWj8U-0001oh-30
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 10:40:18 -0500
Received: by mail-oi1-x243.google.com with SMTP id s71so15667133oih.11
 for <qemu-devel@nongnu.org>; Mon, 18 Nov 2019 07:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=X/qKHiGv8AHlwunNFoSi7Jst4DhffNtRK+oUrOvA1Yg=;
 b=HESWmeMQjj7dJSh2XpSICP1ltg+hHXEKNrNNW6jvhUZNcaYaVkCnFF/uHiRcNIv0xC
 c0yGbDqkepK1t09TQK46f1cybM5xLUuX9nfN339Okmbv5XR5DgU4UyiI6B+W9CfbL0MW
 A3tJHqOhgZOQ2mXIRJLbpL+nw+N0laXe3oChTDVdOUGyAtGsnTJ1hIPfk1LB8LncaG3Y
 fYFAeK8XQ+SecrCvvtDsF02p1SNtgrK0PhhEdJWsLXMLOsKVCn3oYq90J4Ilxx+VnYTl
 Nfe6VndWXg6SkjgQRJq5vi0kcpd9qVEO3yZPx37+iIo/uh/pHH2aUls1yq/pkY0xXxhn
 ff8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X/qKHiGv8AHlwunNFoSi7Jst4DhffNtRK+oUrOvA1Yg=;
 b=qNsBUUQhDZWbziH7SUDdgBYIxEgfwix5HAeRSnOWywiUofqulWuDU39qcjoOkjwovw
 zwktpwxDqu/PEjhIrRJr73mRg+YseTdpc2wvows9BhFaOVLG/Za3x0MQ7IKMwtQ5NP5E
 Od92UY7LA1VTk0Kq6X3ehq8rBfGjYI+sR/o20sibYiFYrxrFBdE1DtZhbWzAqdRWcYMj
 tcWfUV4CZl3c+2eEB2J4G3WxQDPtCHKqe2+11EH+mu5OLVVOCx//FFDX5P7PSTPe3OOf
 9cwrBBjHGOATMLDqEgfiGm0d4Knc7ysarWnLuaQa7+kl5cYIikwjBviASschiQhB30wn
 hF3A==
X-Gm-Message-State: APjAAAVUtDsNwZOLyxJUH1426kOHoP0VYJo3sl8nvG2vlxSbxKEBaUg9
 SG/6vtdgOcHHRQigJIQsKIP6JrkEhDhDdDZ261/xjg==
X-Received: by 2002:a05:6808:b04:: with SMTP id
 s4mr20967940oij.163.1574091617224; 
 Mon, 18 Nov 2019 07:40:17 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-28-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-28-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Nov 2019 15:40:05 +0000
Message-ID: <CAFEAcA927BQw+kZxG84Y7tgKoiFepk+GSH3uqsUS1N95xCmyDQ@mail.gmail.com>
Subject: Re: [PATCH v3 27/33] cris: improve passing PIC interrupt vector to
 the CPU
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paul Burton <pburton@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sp44Toap5oF8

On Wed, 23 Oct 2019 at 18:35, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Instead of accessing cpu interrupt vector directly from PIC, send the
> vector value over the qemu_irq.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/cris/axis_dev88.c  |  4 ----
>  hw/intc/etraxfs_pic.c | 26 +-------------------------
>  target/cris/cpu.c     |  8 ++++++++
>  target/cris/cpu.h     |  1 +
>  4 files changed, 10 insertions(+), 29 deletions(-)
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
