Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3087778lfy;
        Mon, 27 Jul 2020 11:24:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpqlaCSnvWJ4CO9Ix20zd4fSboM7plEygkVIWoQRODQO1CERJTRnp1S2DTYzY3uhWvifZz
X-Received: by 2002:a5b:e89:: with SMTP id z9mr39687592ybr.143.1595874249379;
        Mon, 27 Jul 2020 11:24:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595874249; cv=none;
        d=google.com; s=arc-20160816;
        b=ZQMAXtNyKb48Rnt//5p/3mSkAAsi3ufKokODjOSYyWapDKJC5A/b0epq4ef7rvm/Sz
         OsiMVvjzmAOHhrxWYYSfRHoRrIje7ASkFYvExQRBXUHJjD0Y0rWxdlX4RNfOUXF3y0XF
         GreczyfVXwhsScAAt/Tb9C6hBcG0sjC2aNG2d7tPsOK3JsSkLP0D006DX8RIi/g15XFK
         8xS5XMVSuhwocT72ifknA7QkBkov8hGYmX84r5N3Kwz0e2NSEFFgU+G9Wn2lxiEp5Ezu
         +a1U6fAkI2vaMlEO49NsGjwYMfq1gWqy1axT1yvfK7EHjxwmFZcOgNbC7EegiQGcZ6X9
         vF6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ISGC9/eZOktdkhNGYcXuKAL592CTulxLxrQTaJooBts=;
        b=vXLJg87kMao1A+TJ9k6cZBF1lMwJJ2h72K1wgIkoio1igOq4u79Ud+LmRX1BSrmuu3
         aVP49z0G8rhCuTXaN6f+PiVvHvJufXzt5my4i1HDlTMUOWrBK4+CFyzFAsh/KfIBc5gk
         mbKTEstZee01VgSei9k+V66WX6XpnpB+iKUAcP2GIOhgzwTEbV8aIAne2z7Jql3dt6Kj
         4O/565OgzLMiJC0c0WJ2xsttoeQgWV542l6b7EXuGe+JEnm/itEGALZBfPxUbw1OZrpT
         AUh9ZYRE0tJXfHo5ddlmitc3VN+JcuwnMHojoJzZUbHdJgv3W1F5c+ZmLIXkvWKcnXGJ
         HyYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QKetyWwE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r14si9617587ybl.1.2020.07.27.11.24.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jul 2020 11:24:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QKetyWwE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k07nE-0001Tz-Pz
	for alex.bennee@linaro.org; Mon, 27 Jul 2020 14:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k07n3-0001St-Em
 for qemu-arm@nongnu.org; Mon, 27 Jul 2020 14:23:57 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:38124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k07n0-0002QV-9q
 for qemu-arm@nongnu.org; Mon, 27 Jul 2020 14:23:57 -0400
Received: by mail-oi1-x243.google.com with SMTP id u63so3410401oie.5
 for <qemu-arm@nongnu.org>; Mon, 27 Jul 2020 11:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ISGC9/eZOktdkhNGYcXuKAL592CTulxLxrQTaJooBts=;
 b=QKetyWwElItI/GQg7aAqA0XHxieunvsJAp+ER7pM/dAxhI4XSHPde72afKsu8CQ106
 G/nro3g/DB65Op8tdGMo40zKdNP+Y1qeL3OdeKUUlZQsHmo/W/xcMYpoGa5O2J4YH2rY
 p5OwQRkCHIzZYINWkwIBcLvLgJ3PcrrImrYOdpiP0WjIPRQhb1rPkPi1YbsRPDC8z+/V
 4DHTBAg2TuTo3IHZWdBl0cr/VDU1ILUGYBjo86r2t74sgLx5afCcT0QkrUV9EQNgGvE9
 PUZeoURSvo239gd1AbdEXfnzQ5O24D0q5d9A5mAXItTK/oOK8EEGj0rxgu0yChwNhptU
 7VAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ISGC9/eZOktdkhNGYcXuKAL592CTulxLxrQTaJooBts=;
 b=kLLTN/FqCvGVKwQoJ1lmstX8MiiXL3lJlu6zW/Ra6/Lehw4DFjGbjOli763V/lk7LP
 HCJnClOKIjm8Y92tsPuL3m9pA0JUrirGrBj4fkYeZsdnb5cJkUqpgVYaQdgZvcdo2jCX
 HlHrjluYTwEyQ36gog/1ZWIP5cpWi6pFH4vNUzVQIpCkCw4lbV/vYrCtMOyjC8ECtJ0n
 mdin0Wlt216a52ke7B5a7n5HdwNqCgHPUiWCRpp1BLuMpGwyQM0kuPxAPbqoBWeWJnBq
 d/bruq12/2BtWJRxhXQpP35csyEWSAgzAehvyCX7lg8k5gl8bBS+XE3ryPtQ9ona44Le
 3QPQ==
X-Gm-Message-State: AOAM531txiNl/C8LGmuK5RQ+bKhxNRPvd9KpNYAfMBbggiEFDdI1aKwh
 QT1YiboWarkZX2f52fN5DnfTiV/LgcOCnoj2ErzKyQ==
X-Received: by 2002:aca:2819:: with SMTP id 25mr485548oix.48.1595874232957;
 Mon, 27 Jul 2020 11:23:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200727162617.26227-1-peter.maydell@linaro.org>
 <e549c6d3-9fbb-ec47-f6c3-c84e4c625647@amsat.org>
 <4743e83e-d893-c719-5fe0-ce105c0650f8@amsat.org>
In-Reply-To: <4743e83e-d893-c719-5fe0-ce105c0650f8@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jul 2020 19:23:41 +0100
Message-ID: <CAFEAcA_g2NwSAHiCbAOpNmQ0PLAyw1=n=0ogYZ8pQxqgqfin7Q@mail.gmail.com>
Subject: Re: [PATCH for-5.1] hw/arm/netduino2,
 netduinoplus2: Set system_clock_scale
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: efEfEcRZT985

On Mon, 27 Jul 2020 at 19:07, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> $ qemu-system-arm -M microbit
> qemu-system-arm: can not use systick with 'system_clock_scale =3D 0'

Yes, that's the other one on my list to do next (need to find
out what frequency it runs at though).

Good idea to have an automatic check for system_clock_scale
being set, but failure to do that is a bug in the board
code, so we might as well assert() it.

-- PMM
