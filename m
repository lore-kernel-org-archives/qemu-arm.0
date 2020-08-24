Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2441871lfy;
        Mon, 24 Aug 2020 03:26:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/VWdikwmdvH46gzH3Wj8e7iD6GSSe7ixIqRnDeam2JPTQawTH+sW8+EQ+eKIWeO6LC+5D
X-Received: by 2002:a25:dace:: with SMTP id n197mr5858872ybf.168.1598264763632;
        Mon, 24 Aug 2020 03:26:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598264763; cv=none;
        d=google.com; s=arc-20160816;
        b=thqDu7G1SD1K9M6/BxaO8bzhCFg7IhgvF0GAHnCOMxQge2rHNDSSZ5T5yn4Q7RxBR/
         Ef/riQTI7yQ2fPBR/SQrQZWQETeV6wHJnadi0XWpiNFdjke0WpTYQ4y4J7STBFV2IeiJ
         86D03BB7gAbhrPmV9f32PXW0W36y5mk8JwBx9ghUtpsRdjZ/1V1m71Tzuzp2nwTcSt+K
         6zCsFYo9QqolXuAtaNy/8PQxaCyhUCeQcug1hmLL+GFyTFdSbi4FfbWG37IXCQ3RBnqH
         B5aFFugnIlfDsSPkxRCU2lDoZLc+F0mX52AM9NsYTmzz3k11FOJhN5ITso2sG19bhUpF
         99JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9VA6CK0oVuKVsJVc1s37mSVw9n5Ea9i/APdynWDUg48=;
        b=ed0TntxZ29AHkBWQ+5fthlIn1ccOcVrTJV0IDO3MyGP97kGkFxLpniG4oQ6zo+iOAu
         FxiWtBpUvY95yYU8FyEMVxNtl/jNRkEKbMFjq5k07iDBfsRIpqmVKX12Nr/U5MWouzHz
         1xTryN8yFIiP0v1O7ZtVPcZ9IZdbm1SjrEYAabKyJbcgb02HIVck/BiUQ7WIATQDLL0L
         9e7KFwet1BuLACsX/hT6P7F/M7XxN+yKg6jXiXMlKml3WekDMZDPcksY9xAXGi0j8xGn
         QD+TdLWX6rukFeEvLTFKuAU/SpC+mrUvDEzn1uWyC3gpIiAu75oGZXazk2rmgbRt/GSb
         cgBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WZXugnuX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5si10865186ybj.412.2020.08.24.03.26.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 03:26:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WZXugnuX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kA9fv-0007DM-1x
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 06:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kA9fn-0007Ci-BQ
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 06:25:55 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:37631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kA9fl-0001aN-0W
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 06:25:54 -0400
Received: by mail-ej1-x629.google.com with SMTP id dp2so5898698ejc.4
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2020 03:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9VA6CK0oVuKVsJVc1s37mSVw9n5Ea9i/APdynWDUg48=;
 b=WZXugnuXcmve8CyRxHBqUkpkKdQXf+/Rqd0lmwumh8GtoAC+JY1/1C3pA5L5TKHeDU
 FSURdxq/DoOVWOAI5LTdgUgoIkR3TUrvhF1Rvka2e7DUZEAg9iKU9dzjWKsEAvFShqjm
 gvjRWcnsjVgOSV71t8gT5X22aUDclB5qNR6eVCzyTE3PQaOvDWXjLqfkgm8qOx9OHbmN
 WiDDVyNkvG9yjUBY3M/bGeQQtuX81BqSnHYWGXERV6gyP0vJFecCPbF+2B5QGsklTa0w
 PkQZwExgQvUdo2LvPqpS1rnlQ/o/pbYuUNzSBPvpkqGcJXV7VpcKIPAxQZIwSAS5YS0K
 fv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9VA6CK0oVuKVsJVc1s37mSVw9n5Ea9i/APdynWDUg48=;
 b=TG34/DqQJOxR3aOideuL358Mb50bi1JEurBWpGn29mk18v+CYklo0d5ZKimGmxS/Zw
 p4S+m2U2HXh2XfeVo+ScCN3Bxzkn0XX2/3HwFL7XZQCwta8gBYyuDkrXmuDulUa8leE6
 t3MoUT+zM6Y/WRJUZpfsyCA3tM9NeS1zjHyESbuKUhway5tk4chMftj/ywxUi81mNOLR
 2BAUKKGQCVDFDZyw6tkkBdNUJQCW5/FrinLz1a2WY/iah33tuD/BgDVKQyoWmxW406Dx
 k2o9F+Y3jgAgEpYFHHd2hkOKY7Z69LMnfcRQ+cCK7rw86jJH4tagfYXv0CvX4wRwqVzD
 JexQ==
X-Gm-Message-State: AOAM531yLnT/eg8KN/LqAQ0hfEK3nCMTqZ2NNLMTON67W9QRDYVl6UiT
 LX10pMasYW0j+9+DyMtqkDCEETXRM4yn8GNGzacQww==
X-Received: by 2002:a17:906:59b:: with SMTP id 27mr5138235ejn.56.1598264751246; 
 Mon, 24 Aug 2020 03:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <554074341.6540650.1598262327794.ref@mail.yahoo.com>
 <554074341.6540650.1598262327794@mail.yahoo.com>
 <CAFEAcA_5a7aGpGMtVxjYjVnnDJNzXkQJwDW-846+TeNjTrAs_g@mail.gmail.com>
 <316503436.6530715.1598263341117@mail.yahoo.com>
In-Reply-To: <316503436.6530715.1598263341117@mail.yahoo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Aug 2020 11:25:40 +0100
Message-ID: <CAFEAcA_3yUToiV_iXERz4MMtrQFwmmBzRMZ4KzttA0pS9srvVA@mail.gmail.com>
Subject: Re: [QEMU]send key event from monitor
To: Mircea Cociuba <cociuba_mircea@yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z8EfEN06J/W8

On Mon, 24 Aug 2020 at 11:02, Mircea Cociuba <cociuba_mircea@yahoo.com> wrote:
> I get that, I also think that is the problem.
> How come the current console works then?

That's because your command line will (presumably; you don't
say what it is) be configuring QEMU to say "connect the
current stdin/stdout to this UART". You can alternatively
configure it to connect the UART to a TCP port, or to
display in the GUI window, or various other options (see the
docs about configuring 'chardev' backends, which is what the UART
emulation connects to:
https://www.qemu.org/docs/master/system/invocation.html#hxtool-6 )

> I mean, thinking about it makes sense that qemu "sees" something to send to the bare-metal program, how to do it from the monitor?

There isn't any support in the monitor for sending characters to
a chardev, I'm afraid (except for the special case of sending a
'break' event with "chardev-send-break"). Usually people who want
to automate sending things to a UART just set it up so the
chardev backend is a TCP socket or a file descriptor or similar
which the automation can then read/write. (Obviously this then
means you don't have the human-can-interact-with-it-too behaviour,
unless you put something on the other end of the socket/fd that
will multiplex human and automated input.) If you really need
to have something you can interact with from the monitor prompt
in particular then maybe the 'ringbuf' chardev backend and the
ringbuf_read/ringbuf_write monitor commands will be useful, but
I've never used them myself.

thanks
-- PMM
