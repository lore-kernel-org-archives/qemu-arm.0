Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp23536884lff;
        Mon, 6 Jan 2020 08:03:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqwj2CX3HKi2jcxpF9XbvydBhMpBImizW1MkD+aO4Qmvsd4s/a46RKbJByAhgTnCUaeTr69V
X-Received: by 2002:a05:6214:108a:: with SMTP id o10mr70186157qvr.246.1578326596998;
        Mon, 06 Jan 2020 08:03:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578326596; cv=none;
        d=google.com; s=arc-20160816;
        b=OsIHAM0aL7u98vFxLueIHiTbw8UUpa0eWHZKJSb45RoOcjsfHCTOWj/NEW6ijm5iup
         umZQiMqQUTxLyTcdp1G2q+Q4wsqgOZWmqbCmt/QS0Zm4BDpGRMfP41KB5s1bfB2Y33sq
         3WvyuNi2Blg1mrXlKDEHfvuXfQRfpcstrfRHUr+Nd1kHUvxBA5lXa3Rl1Dw4asZjT3xC
         dfu8d6qextmsvLpJOqAEurnBEtWPgNqctMkbTJ5qCfOrGGLyiAO1HMdhhZj/jXuP87CT
         lu4fVLHxIUqpGXUCQfU6haPbiPCVIMWOeuI+ZX3GBYGAOD5S1oF3y2UGBB7jkIy/G/Il
         hN+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=MyBoD+GRi5UgrLaTQFGGHT9g8eJIcgDuyxmBDZcx7jA=;
        b=EnNMrNGpqIQqMyv8/u2KVsbt1viCtbrQoFkQcDW/fUZ4PnMhys393IiTXP5XR0B1DL
         wEsI5A6Io5t6zJmjpK1dTKdXIACtOhuOrMPNGA6nIbQQdilXCmygi2oqoRdz1IdAld2a
         XAuOq6Bd/atdGGljzJeh4ABEcR3m5A5ir3PNMWRZYBofJQiXeIZ3wjw0YYckQkxokAAt
         FFMmmy/lnR7Cof5j8bCRJVJRILx0GMMJOvqqDov2q2TcGOw/sUp0bMOR7iIGpY9btMZe
         B66rKxEnmhjxwLALBB8wBj3pMoEuyj8SuMrmGw/maZISOomEl9ozaV17Nd3Hb8KZyKuX
         dRtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CIT6mdF1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m22si30516070qkg.100.2020.01.06.08.03.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jan 2020 08:03:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CIT6mdF1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ioUqZ-00060K-Dc
	for alex.bennee@linaro.org; Mon, 06 Jan 2020 11:03:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54997)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ioUpF-0004wD-Bb
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 11:01:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ioUpE-0004D1-DO
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 11:01:53 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:35110)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ioUpE-0004Ca-8Z
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 11:01:52 -0500
Received: by mail-ot1-x344.google.com with SMTP id i15so4626975oto.2
 for <qemu-devel@nongnu.org>; Mon, 06 Jan 2020 08:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MyBoD+GRi5UgrLaTQFGGHT9g8eJIcgDuyxmBDZcx7jA=;
 b=CIT6mdF123mFv3Rae1Tl1KAm4uj9g4wttRix9Uf4C07GxwTqAYg8fLPP+lRtRfC7v8
 wf61FnImqKFAvNH2nBLLayuFpvmPH3cYfTPP65FR3ORAru5a4JjboYpVbKqVBelj7mK6
 ixhUGcEHbaezpoUZDQSGh0Px4zj+RxDI3Tc10THLxoKXHNJCojdF0+OjHlYUuxrNgW/U
 K1VcBTTOCx45xvSCAYcrGtyB51WXUwly9w/Sesu6n+APIazbvgQawsmBXU6e1Q6jflQT
 6A6wRa5FQxPOQXjc7XebFeCgaP6kwfWR9bIOZU/2wBn/Jsv+4LvuyyaieuAQm8Ss9cEd
 CTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MyBoD+GRi5UgrLaTQFGGHT9g8eJIcgDuyxmBDZcx7jA=;
 b=h7pyqDFNay6g9G+kiUW+AxVFjJyNUh/WzyjVhx+VZ1HkRzGdUVUgTdGGqKOvfy2UY+
 IUS1/XkH7jnG4JCbfKTdReFY2Kr0GHouShjsKanQRlWT8VeiZUctgaDjnb7FHxb5exFq
 2YCPMsA/tmZLPzgoLdp9W0jlWHJq9FRPOa2Dfy93XS0QETbH9WN+Z49jShrP7Nvvf7pd
 LshBzQhTKVRIf9vNWf87S+CE2arrpFsm8ar+ZiA7n0Mxv4A0NB83BUy+lsJnXa4+3Im4
 Fx2GAyr3xF2v1gYhcW/5E+hf1kAGcGYh67z4v0HIze2mwqCM0+QVBCzXWcFDG7zCXdbj
 diIQ==
X-Gm-Message-State: APjAAAVa+mlCXgQMItzcnYUcOI27pzg2dl563NG/3g1Eo1+AMBL1RGJr
 51Qu1zKhaP0TLBRc3b/kp259ee8r7pq3xwTKfqNAvg==
X-Received: by 2002:a9d:644a:: with SMTP id m10mr12895009otl.97.1578326511606; 
 Mon, 06 Jan 2020 08:01:51 -0800 (PST)
MIME-Version: 1.0
References: <20191230110953.25496-1-f4bug@amsat.org>
 <20191230110953.25496-6-f4bug@amsat.org>
In-Reply-To: <20191230110953.25496-6-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jan 2020 16:01:40 +0000
Message-ID: <CAFEAcA8VVmU2L9oV73hBVcAZWhbZCKiR4RThcteswMr1_uo6YA@mail.gmail.com>
Subject: Re: [PATCH 5/6] hw/arm/allwinner-a10: Remove local qemu_irq variables
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TAYh/dmnPPje

On Mon, 30 Dec 2019 at 11:10, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> We won't reuse the CPU IRQ/FIQ variables. Simplify by calling
> qdev_get_gpio_in() in place.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
