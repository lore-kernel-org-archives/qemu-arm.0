Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp381404lfg;
        Thu, 20 Feb 2020 02:10:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqx6EBDckTX874QrspstL9ovYA+Z5okr73r7aQnWJc1mwKl9USuUCk0t/hrJtckx6Z81CqVL
X-Received: by 2002:ac8:3418:: with SMTP id u24mr25413260qtb.87.1582193451949;
        Thu, 20 Feb 2020 02:10:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582193451; cv=none;
        d=google.com; s=arc-20160816;
        b=lgDv3pT1yEqKVxJdBsAiFrRGA1ZbcwAcbGOBEwficnM/EuF8cF6xApmes27zL6SWHy
         ps3qR3XKRVhowovp60hHpyFVyIoZs7yYWX2OD9GpVZEIaiz8j18oVqL4NZ3M/OciLVd7
         VUtsGYt9jXOz7oV3SYyYD9vsSgJqj51xvwtBVlfppVTvVkRAIiLz5yeR3BZHCXrEYBwh
         ErYe5iobWcXBj3LxFqS6AZDfZw1yl1ZxPj+v3xx3mbs98SFFUrJyybXkg9mAzsYpwX47
         NELMn5VCwt1UdKQC6MTkPr4fQMpd6MxgA9q3YcCgXzK2Gwo//j4g6sXzB8CB6ikWKAbO
         0/Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/e2aIq6+KTlWo5s9WlgNylEFifK+JmjI80oq7DNCZwA=;
        b=vAMWnV/syKv6eXBO74GiqNBpFpsnbjp7+bmKu6JEYjL6qc4NFFNwvix7Gx8GQOL4yb
         or0U5Fu6SU8nMGRXr9lPFwO2Yz2SziYLEa7/FVTUjIJlhaaKIIqdo/UsiBbBR2r6Ndbu
         uNGw7Pw3nFz+QU1TsqsvTwR++qxRtAsabbbivmp3rOFBfipfZyXjknU4tIG2gS+mcR1i
         t85/yvKZGVuO50Mr/dnkfL+dhr7jJHvB9GVkl3v9QLys/uIZUmm2dHSebfIIcoOfmgGQ
         xKoaqUGqFOOaTm4lrGbezGp2IoWSIL4N4p7pAar2EvvJFf8nIIyzanaIGk43hqgtEBYq
         xnPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CCya6m+E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m124si1140794qke.371.2020.02.20.02.10.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Feb 2020 02:10:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CCya6m+E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j4inD-00077F-CT
	for alex.bennee@linaro.org; Thu, 20 Feb 2020 05:10:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58185)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j4in1-00072E-Em
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 05:10:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j4in0-0006iC-18
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 05:10:39 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:40749)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j4imz-0006h8-RM
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 05:10:37 -0500
Received: by mail-oi1-x244.google.com with SMTP id a142so26971717oii.7
 for <qemu-arm@nongnu.org>; Thu, 20 Feb 2020 02:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/e2aIq6+KTlWo5s9WlgNylEFifK+JmjI80oq7DNCZwA=;
 b=CCya6m+EB/JlQ2duDW9Z8Ifeu0ZdD06Ajs+gswUvUK9n9BLjP2453zpam2q+cNj8vp
 fFX1E65zttDreOXkXPkYWGNuRGgYDGTQ6eW2XVAryHf9EONBbr0N5/SNOF9KoT5K60px
 /Y5z63SbN3vCKr6u0uT2r+2M5PBm97gIhuQmysQr2jzXJ/c4RrujCDTHC4aCyNUpo6Xb
 NtE9LA8bOhAY2S5vejWCCPyYNRfrshAbkR8GMRFLa3l6PzK3KKNzZjk1lY3GfarHnqIk
 dczNLjmo5GqoCRY45i/Qjtaruy7K3L76CZOJX9cGU0CKQbsle5ud/95zkgSEZV6JUcVe
 YUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/e2aIq6+KTlWo5s9WlgNylEFifK+JmjI80oq7DNCZwA=;
 b=o3ZEQSJnY8JI1HNJ+jcs1shLAYq6MklgSVHg5E/TL/R8YwuvW29+38Nf7r0w36xxvj
 DTduJF45E37HZqyOS2yYyHz9OJvc4UkJ1LMygg3Q+rO+sm/tFGieeAAPphKoeEz6nltS
 1TvD5Q59LcypFOU9jYNjIXwwr1xZt/RYMUugXcuhwPukft4Bh6Lq9p/RsXOpOk0hRKZj
 hY1kuCTmYbbhMXj7xscepENTCuPqzlW8S9ePuGND1+7uKKiJjdGfW2ngtkaWpucRoOT5
 Cv1ws2Zr5DU/BpLoOGI+obj1+cXq0U58UbGXbf8fTalKdpYVRgIg672jK65CDqaE+oFA
 S+vg==
X-Gm-Message-State: APjAAAWpbv6HHlseENy2DOM5doOdrn7H1ZZdBDA4KPAIEQTP3J2X9ID4
 dVZEOklU0yLHCqwUUUX8s/cmtYpKgeUxfZoVCvjkyg==
X-Received: by 2002:a05:6808:289:: with SMTP id
 z9mr1367097oic.48.1582193436880; 
 Thu, 20 Feb 2020 02:10:36 -0800 (PST)
MIME-Version: 1.0
References: <20200220060108.143668-1-gshan@redhat.com>
 <f3c8adba729d050ba2144cc9c834fe82@kernel.org>
In-Reply-To: <f3c8adba729d050ba2144cc9c834fe82@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Feb 2020 10:10:25 +0000
Message-ID: <CAFEAcA8inLO75XOcCO3bUiiJQyZT+nqmp1be+z6ZtQx2a=68+g@mail.gmail.com>
Subject: Re: [PATCH] hw/char/pl011: Output characters using best-effort mode
To: Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Gavin Shan <gshan@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Shan Gavin <shan.gavin@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jnRXHPNZlxMG

On Thu, 20 Feb 2020 at 09:10, Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-02-20 06:01, Gavin Shan wrote:
> > This fixes the issue by using newly added API
> > qemu_chr_fe_try_write_all(),
> > which provides another type of service (best-effort). It's different
> > from
> > qemu_chr_fe_write_all() as the data will be dropped if the backend has
> > been running into so-called broken state or 50 attempts of
> > transmissions.
> > The broken state is cleared if the data is transmitted at once.
>
> I don't think dropping the serial port output is an acceptable outcome.

Agreed. The correct fix for this is the one cryptically described
in the XXX comment this patch deletes:

-        /* XXX this blocks entire thread. Rewrite to use
-         * qemu_chr_fe_write and background I/O callbacks */

The idea is that essentially we end up emulating the real
hardware's transmit FIFO:
 * as data arrives from the guest we put it in the FIFO
 * we try to send the data with qemu_chr_fe_write(), which does
   not block
 * if qemu_chr_fe_write() tells us it did not send all the data,
   we use qemu_chr_fe_add_watch() to set up an I/O callback
   which will get called when the output chardev has drained
   enough that we can try again
 * we make sure all the guest visible registers and mechanisms
   for tracking tx fifo level (status bits, interrupts, etc) are
   correctly wired up

Then we don't lose data or block QEMU if the guest sends
faster than the chardev backend can handle, assuming the
guest is well-behaved -- just as with a real hardware slow
serial port, the guest will fill the tx fifo and then either poll
or wait for an interrupt telling it that the fifo has drained
before it tries to send more data.

There is an example of this in hw/char/cadence_uart.c
(and an example of how it works for a UART with no tx
fifo in hw/char-cmsdk-apb-uart.c, which is basically the
same except the 'fifo' is just one byte.)

You will also find an awful lot of XXX comments like the
above one in various UART models in hw/char, because
converting an old-style simple blocking UART implementation
to a non-blocking one is a bit fiddly and needs knowledge
of the specifics of the UART behaviour.

The other approach here would be that we could add
options to relevant chardev backends so the user
could say "if you couldn't connect to the tcp server I
specified, throw away data rather than waiting", where
we don't have suitable options already. If the user specifically
tells us they're ok to throw away the serial data, then it's
fine to throw away the serial data :-)

thanks
-- PMM
