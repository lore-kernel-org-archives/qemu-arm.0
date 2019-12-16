Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4836690lff;
        Mon, 16 Dec 2019 09:22:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqzyLHkecJh+Rf2It4iEG/fpGjgQLCBU05I5vX+Yp1fOFP024If/B1xTc5Ty7cuP2b38LFcZ
X-Received: by 2002:a9d:554f:: with SMTP id h15mr34315028oti.338.1576516960336;
        Mon, 16 Dec 2019 09:22:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576516960; cv=none;
        d=google.com; s=arc-20160816;
        b=uF2NX59Y4mbZqzdg1mu44/mpe8rYO/lt3PdAj5KkjA59pbdDX1+NLmJc1WFlGPudfC
         SlU1Lw902E8SbmxrF1elOjtnDrsy1zqb1CeMoDK7wbXUD2NaBIO28gEsY8Gt0GuxI3ZS
         oHX3mX/EUWnh7CRqvjT5Ds8sQcP6mB6sO2RLC9D56q1gFp1zeQa6c51QUhxMyvCgcAJr
         jQkwfVLvWaIkvyUGywQm9Zng7XemQVkkRguLYZHZU80C+FeKw1Zkvcq/fKpkQhMPxY0H
         VI/46a0LaQjQQ5VjWgxP6ASxbq5u9nWbyug9DcEjKHEG9jBqviTwvxyLpCoOHTE2azub
         mm5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QaFLLYDEWud99qoiUNGEueTX0iNK5/Ih2SGsu7QWWCw=;
        b=v7gNrD+SvfUYS5uW4ibdJrvvkHcOkNVM1P2mgahA4zkrDBSLQFtXwxsA86x0n6z6Ae
         22QvrQw8D+5l0j+nJxBB0JlEcGkRoiBjKCH/wU6YBIFEe0aDVl7ElwVZqKSIV588Z6EC
         aETDNiKp+DWaQ0jdes7dP/BkWqlmOR+2wbvyciPk3VoLLkThzoeHwWDwIoX/xOdIL70P
         mtjvMSMmPrWxz1mTNeEy/lIorKTxd7Nls1ydV48Y5FbajnmWaDZMkf8lxQBjRqPI6D7j
         oPY8EZJAeyonaWPgPkt8KceBNkA1vaI4d45NBuWTFrZB48Hg3Mx1/2WyFT4kTJLLtdUk
         cDBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hVDtMmy3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v12si11932485ote.168.2019.12.16.09.22.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Dec 2019 09:22:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hVDtMmy3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1igu4t-0005OO-92
	for alex.bennee@linaro.org; Mon, 16 Dec 2019 12:22:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45294)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1igtgL-0006dW-1g
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 11:57:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1igtgJ-0001ED-Np
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 11:57:16 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:38967)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1igtgJ-0001B4-8X
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 11:57:15 -0500
Received: by mail-oi1-x241.google.com with SMTP id a67so3845124oib.6
 for <qemu-arm@nongnu.org>; Mon, 16 Dec 2019 08:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QaFLLYDEWud99qoiUNGEueTX0iNK5/Ih2SGsu7QWWCw=;
 b=hVDtMmy3zyYCoxN+m2cHJqFkUt9piFFGIUuFoZwabaoY+KnWL6g2duJZedACp2UzsZ
 2zy1zKhI3/uWpRvP813LzBbrrm305FHOLT5292dUaOX6iKW+K77R4zCWMoZLovQdVnd6
 ZJBK6kWK891LU9P+makBzD/SpDs8gRzB2ubFxDPVueUXt8nUUvC9Rl2pz8lo5euJGxxi
 V7XgljTgNwAIanV59QEfhVNPB86z4zjZIeUiRYP17VdwSg/1DapxYt1UBxIpf4+cjKLu
 qofUOA0AG3fNLHEHhjvkiL5zNZyDH/Fb/TH3IGL+y9iwXPqtBHy2mZdzU62wwxgYH9F5
 /KoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QaFLLYDEWud99qoiUNGEueTX0iNK5/Ih2SGsu7QWWCw=;
 b=HmwmsF4V6obT2/hfQk3DMndS39w9wHuuWLk4cO/BRvca7Bzuy5DrDJ9lFNQiBcKefV
 B5K3Govc4CT6eFyd3/wtmDRtrbOo2imSq/dpSeI9UEwmZsM+7nQwN2lNHd2YWloI87ba
 7g+3cIHadMRj2OYJKD1/SWoYL3SAlpoSH8wWD/IZ+Idzc8HAM8ati/mfso50EdECBu/B
 aYRAxBAib0+2cQnQf44eHnUXmuzKtm+QdLAUpD8UIWT+/73sK4MnaspinU44q4WIkU6+
 CRuRwK570yS8ITrVDtpetz2spmBvtKwFNPu3l9usWs3QtTEnkV8+fXJevMG+x6xPDLp5
 +aIg==
X-Gm-Message-State: APjAAAX1Ko5/335GQ6S/TDIIs4LT2q7mOfPyOOapr2gRo4IpjXkmgdiy
 19BtzVK6Dq2OyJa9u3HeBa6dhPC0hcgfyslxYvHzTw==
X-Received: by 2002:aca:f5cc:: with SMTP id
 t195mr10156384oih.163.1576515434294; 
 Mon, 16 Dec 2019 08:57:14 -0800 (PST)
MIME-Version: 1.0
References: <20191212173320.11610-1-drjones@redhat.com>
 <20191212173320.11610-6-drjones@redhat.com>
 <CAFEAcA8=FcrT8dRMDzxu14J-gv5LEDuNBNpD5yo9j3waV7u8iw@mail.gmail.com>
 <20191216165249.lygksiptf2yowqh7@kamzik.brq.redhat.com>
In-Reply-To: <20191216165249.lygksiptf2yowqh7@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Dec 2019 16:57:02 +0000
Message-ID: <CAFEAcA-BND8-kxjaN2gRn48NLJ_BVxcguKPgAQ0qG3XaQ5ghRw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 5/5] target/arm/cpu: Add the kvm-no-adjvtime CPU
 property
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: bijan.mottahedeh@oracle.com, Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Heyi Guo <guoheyi@huawei.com>, msys.mizuma@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T8efydsqcgb8

On Mon, 16 Dec 2019 at 16:53, Andrew Jones <drjones@redhat.com> wrote:
>
> On Mon, Dec 16, 2019 at 03:06:57PM +0000, Peter Maydell wrote:
> > This phrasing reads a bit confusingly to me. What I would usually expect
> > is that you get
> >   name-of-option              Description of what the option does.
> >
> > But here we have
> >   name-of-option              Long description of the default behaviour,
> >                               taking many lines and several sentences.
> >                               Brief note at the end that enabling this
> >                               feature gives the opposite effect.
> >
> > Especially since the default-behaviour description isn't prefaced
> > with "By default" or similar, it's quite easy to start reading the
> > text assuming it's defining what the option is going to do, only
> > to get to the end and realise that it's defining what the option
> > is *not* going to do...
>
> I'll take another stab at this, but my feeling is that a '-no-' option
> should be one that just turns off the default behavior, which is why I
> wrote a long description of the default behavior. If you'd prefer the
> description to be more terse, then I can certainly delete a bunch of
> the text, but then I fear what this option disables wouldn't be clear
> enough.

I'm happy with the length of it; it would definitely be helped a lot
just with phrasing that was clearer up front about that it was starting
by describing the default behaviour.

thanks
-- PMM
