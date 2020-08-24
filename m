Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2424376lfy;
        Mon, 24 Aug 2020 02:56:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8Oq/0nZ+8Rm/hkEzHX6r4vDhQTeFN94azNW7eeB5DYXjrW5wrSpbzlXC29pOoa/kc5VGE
X-Received: by 2002:a25:6c8a:: with SMTP id h132mr6918401ybc.68.1598262974669;
        Mon, 24 Aug 2020 02:56:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598262974; cv=none;
        d=google.com; s=arc-20160816;
        b=n9hM+Ft6vdL5MhfNzYOiPFB1ZuZkaEs8vDNJqsvJFbFZP+b69EJXCnuApX8tf3u6en
         ssfJSs+2qo8Px3fEhv/CbqvA0WQp9E0OmuEAc8wnHAyx5oDDIQjDXzJjGHssOGcJAEem
         qSMhGmeVdzyjSaIoyUo98WdSgoWikpYZrcI0bUIocwy6rCFw9TV2DktKKGIQjlggfdv4
         l+x0B5Xq9XMLNjuaF9gOcALh7obynP1liTyRoWs6kD24Pp+YLMY5loxZxoLdhier5CSa
         Xd3ex4s5ql8n9Rta6s6gKUjlaGE4jyaAxm0y3e7eNzHxzxerhoyxCXnbftnXQ/wObI8w
         AEIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rb/iVcj4/053Wo6lNIqqnndPANiWQVZptN8jtU9zZec=;
        b=cZJjjudjaHDKWTnMJredjy2dbplp8JUnOiQV4fMA5cYz/WOARKQCXi4S0sZl6fW5i+
         JKdpr1JBsbzc03B+2D+ALMYkLxOAeRaWUH/7l0nB0WGk746gyzBtXv6ZZ9607e81UdA6
         rTTCHuh3hWR56q/Xo/c39sDjw2lrEFH6T40Z+qRbQhIixZhrq12wCisXLSac8n2+a+0U
         ccXtEkqwektjwBsX6DDdskO9rS+eOHN8vpQo4D9+TD30x7nvOcUQYHoHdCuNCj+I2iqQ
         Ivr2Vbf1TzRS3+D2SNPedIFzL/QoFpmPt/uLjnSg8R6oE2w337jVxASQ4xeg337UEwY1
         hIcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tr99VY8v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w2si12038503ybe.261.2020.08.24.02.56.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 02:56:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tr99VY8v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kA9D3-0004fi-Uy
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 05:56:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kA9Cv-0004cx-L7
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 05:56:05 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:37294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kA9Cu-0005p1-0u
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 05:56:05 -0400
Received: by mail-ej1-x62a.google.com with SMTP id dp2so5786556ejc.4
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2020 02:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rb/iVcj4/053Wo6lNIqqnndPANiWQVZptN8jtU9zZec=;
 b=Tr99VY8vtrCVHtBtFvO/mazI+hpXq+Pus4Cbkdk0Y7hJiewgjm7koO25RG9Dy3q/aG
 dqrGDnnvb40fdKnISv3Gcj8vCktj6K+qfC/pmuiLWfqoailfiredOGf46uqUtusrUj1C
 H0ifAYF8K3No29+uMTlNwEUw3dZgVEVcRdZ2UdKNNYEnUVxXZ1WxeMU7AWLEfiYDavRW
 FiRhkr4dR47DR1faXhh16d/gamxLjgU4lye8B6gvbLx1QaNymAFP8i/nJCoTL8EJU4eo
 Em3wgeaMAI/xYGyxKpDl2Qu3hyRlrIkoMzY5QUaOG1GQPTqLPlvalO0tUeTc4XlEIKpX
 j3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rb/iVcj4/053Wo6lNIqqnndPANiWQVZptN8jtU9zZec=;
 b=ZZ0FrXtXBLNs0AU18egQqYmYpYQSRugmyeGSXwUqa1ZLnHztY7QVefWm/D/3E/I1qH
 uKSqWxKncnQSNpxWIgfb6C3XF3SkqaqhIN7ClU3Ij5smSs/cI79LhqolY6VhGRZsDa5t
 MI2y9rvjD09L4L0mhQl5VXOMBJEUK1P/x2yZXwcij49OQ0621N7GzJaqGPCBQ2o6YmTf
 XRx/1SZRuQ5scVBHDI1j1iJ0zkI+JyMGeCl9SogL2z29u2eqQg0MAfmLMS5noIerNDfE
 1Y32RgdNM/Sit96EcSSDY+rFWouP17FS6QT/Jumf0XBGW/RL3OP2EHHQxupY/oPdszkn
 BG9w==
X-Gm-Message-State: AOAM533g/wQJaDRonYV99L0Bx3ntwAIT3pWLx43uSERflOb3bTJIBjmP
 Gm+vrEH++iq5SILom/Mud9xag0GlkFXYzU7J/GvqCQ==
X-Received: by 2002:a17:906:68da:: with SMTP id
 y26mr4626771ejr.250.1598262962487; 
 Mon, 24 Aug 2020 02:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <554074341.6540650.1598262327794.ref@mail.yahoo.com>
 <554074341.6540650.1598262327794@mail.yahoo.com>
In-Reply-To: <554074341.6540650.1598262327794@mail.yahoo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Aug 2020 10:55:51 +0100
Message-ID: <CAFEAcA_5a7aGpGMtVxjYjVnnDJNzXkQJwDW-846+TeNjTrAs_g@mail.gmail.com>
Subject: Re: [QEMU]send key event from monitor
To: Mircea Cociuba <cociuba_mircea@yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
X-TUID: B2BbduA3X8Wh

On Mon, 24 Aug 2020 at 10:45, Mircea Cociuba <cociuba_mircea@yahoo.com> wrote:
> Basicaly I have a running arm cortex m4 with FPU enabled, all good an' well.
> I wrote a small echo server, whatever I type I get back, simple, right?
> it works in the same console(I type 's', I get 's' back). Using the UART of the device.
>
> When connecting the monitor( I just added this: -monitor telnet:127.0.0.1:55555,server,nowait)
> using telnet, I use the sendkey command(It says in the monitor it emulates sending keyboard events)
> The problem, when I send the command, the echo server does not get it(not present in the UART register)

That's expected. The 'sendkey' command simulates sending
a *keyboard* event, ie it goes to an emulated keyboard.
That's different from a serial port/UART. Your setup has
no emulated keyboard in it, so the sendkey event will just
go nowhere, I think.

thanks
-- PMM
