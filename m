Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3658310wrx;
        Mon, 25 Mar 2019 03:01:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzPeDzmwWUb3l9UYUQwUv/YoKmKx6aHp1jtC5jLd+RHf4dKQTn3czTU/sXzqiiA1SkUkkxV
X-Received: by 2002:a25:4b83:: with SMTP id y125mr19862192yba.503.1553508094067;
        Mon, 25 Mar 2019 03:01:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553508094; cv=none;
        d=google.com; s=arc-20160816;
        b=vBC1KamSxQYiFlVt/RRD9a36GZ7bJxpAAbDQbGQEHU/0yIoanSkN9YxzGFaFU0PyOa
         jbVwxtTDBbmk0zlyeG+hRMauohuHVrC9eqWmTKZMxS3akt59nR48dHXgdsFP6wes04dv
         yfKycYXGtlkUZdjTJgaOPeNrP43VHe5gAHxAb3ONQEDd+E6TnPjF5bpp6iD3WIN3km6d
         E1d+43g6xDOcNM1a4wOAcOCgqvgrM+nXnXlaRQNfJx2VX6BCzrQCVGXSa9Pe9ZuhT6L8
         9mvSUUww11hxj0XNtGCfQnjmkKexzZVsYK4qcxWIyVXOzBdeDVK0mqK4lqWwggg8XrXi
         /s1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fBzSAwdD/f47LlVVgADdSNfMWHx/7Tz61f2sFBSptMQ=;
        b=IzqxK9QnPBq1vzoBg0C4CZy9qo43qIYBTU2fRylWAkS/ZM8ISo0wN02NwnvMdjbkhe
         uqGy5/A5cmrR71Cxd1DAxfVlZ8bzji6AzWmzCf8BZh1/S+f9aQjTaugWjmptHIU1CbTs
         h6G5QFLVw6y2jAJfcWuU1j9TSW3izldgTmImQFSQBIyY3jj+852GgpvKufJIsROzU7gJ
         PUFktcSalNZECql7KdqxEXv6XG2+33j+i7tmXwxmaH+1dMh7AD+eHKPx462NUzYzGsj4
         MF88G4zisZQjyslk7DcfwEqYKBTt8YMKVD1tiYgku7qzziZWEJe7yoHc0bWcnXxNznQr
         3aTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Vu0sK9TH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z185si5691158ywb.129.2019.03.25.03.01.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 03:01:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Vu0sK9TH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:39590 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8MQ9-0003Hj-EI
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 06:01:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46111)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h8MPp-0003HJ-NF
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 06:01:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h8MCF-0006QY-V2
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 05:47:12 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:40033)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h8MCC-0006Oq-76
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 05:47:10 -0400
Received: by mail-ot1-x342.google.com with SMTP id t8so2133507otp.7
	for <qemu-arm@nongnu.org>; Mon, 25 Mar 2019 02:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fBzSAwdD/f47LlVVgADdSNfMWHx/7Tz61f2sFBSptMQ=;
	b=Vu0sK9THRMkuProOyuZ/MwXHiDTu7lRLxw4lcJUloJsP98AmRDUo8g3Qg3q4JrwJzF
	VRk8u/N4fQDzW0bBReWSSoFaPvUFYR2Q0aqoLIqxhQHbmiv/24KF2IOYzmPr21RYnEfw
	vtxjSVIWyERESGUp+4FxN2m4Gl7wLVRRq50fqhTaAZG7+bz1cjCr9GBxvKJFWcZc3di7
	GKdR58+hMIcA5n9vv7lgg+4oAZGUgP/1HhDUlA95hn16iq0xUVb+Tx6uAOiuWZ0IpcCJ
	SmerS46ZI/dPebCkMQeDcpixmAFjrzaZCRbL42Oo/weMWFfAzTO/ep6PEbFXeij8GNIC
	3IdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fBzSAwdD/f47LlVVgADdSNfMWHx/7Tz61f2sFBSptMQ=;
	b=bQKmEe18xQTjPCWSxcqjFwYevPa2AyF6SHk7yOaJ6O5wnCBJvvDBZtH4TQtFTl2Pgy
	jpwXIEQIGm8HS6U5OWXC+9uB5LeX3t51ZNGEt4sgMdotGjMDZjtdIQfzmt3FG6DQU8el
	jQKMR4WAVD3ZQotjEegMLRH8UPvZJn/ofKybIy/kbYn4znDkdhhUqSMrr9vnsJy0c1SK
	bbzNIUmgnPIIbPkFVCIo76BTkMHQr8KyQQSxjh+ucd7TYgUxuV02e+xA15FLK9Jte9z5
	bG811ylfzhWRLxE2C8zX6wleqVJy4xgERo1scranPDmjwRrPxX5kDn6CpbUL+izBDgKK
	1LTw==
X-Gm-Message-State: APjAAAX3FLIK/x4bSDzYY/r8JOi8ax3gAarvK2g0R8Wjz7VI5hP3yYHj
	pldHwWQFiI+49AEtQP3dXtBHiebzWUbZsPeqBPre3A==
X-Received: by 2002:a9d:130:: with SMTP id 45mr16672413otu.352.1553507227165; 
	Mon, 25 Mar 2019 02:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190317141001.3346-1-pbonzini@redhat.com>
In-Reply-To: <20190317141001.3346-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Mar 2019 09:46:55 +0000
Message-ID: <CAFEAcA8fzOO2xe0uEBijBMo9mdLQsaT8kaLaEUh+yXaKYivqjA@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH v2] nrf51_gpio: reflect pull-up/pull-down to
 IRQs
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E9b10+1O2wf6

On Sun, 17 Mar 2019 at 14:13, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Some drivers do I2C bitbanging by keeping the output to 0 and flipping
> the GPIO direction between input and output (see for example in Linux
> gpio_set_open_drain_value_commit, in drivers/gpio/gpiolib.c).
> When the GPIO is set to input, the pull-up resistor brings the output
> to 1, while when the GPIO is set to output, the output driver brings
> the output to 0.
>
> Implement this for the nRF51 GPIO device model.  First, if both input and
> output are floating, and there is a pull-up or pull-down resistor
> configured, do not just set s->in, but also make any devices listening
> on the output qemu_irq receive that value.  Second, if the pin is
> driven both internally (output pin) and externally you don't get a
> short circuit if both sides drive the pin to the same value.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>         v1->v2: fixed short circuit conditions, reordering the code according
>         to the schematic in the datasheet



Applied to target-arm.next, thanks.

-- PMM
