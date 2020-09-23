Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp585593lfq;
        Wed, 23 Sep 2020 08:55:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7/z0Lru2WMIi/RYjfoe0VvF64s0l7inUWdGV7KjZ7uuzIvU7j5ULyOJNlm9Ak7igwJ8xN
X-Received: by 2002:a25:be13:: with SMTP id h19mr1101250ybk.50.1600876543567;
        Wed, 23 Sep 2020 08:55:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600876543; cv=none;
        d=google.com; s=arc-20160816;
        b=wKBotLm9zZitRViBmlLLYIp8Gw8ql5LYMea5hIIsw5Zwan7uzueKErv5O8vl2h4mpp
         6d4Bpvm97aX2N62GqOpR57+qQp/RzKIehw72S0V8uLJ97Tdcxsk9uD9U2cl2QC8u+M13
         MmiwepXD8FL/QSJGMVLFgZD5n6F5X8EdupFYEg9tpJ809Cr1y8Qc37cSxk+U3511PEPZ
         YErqdfb7HU5CAS5TXUZ8H+ouwFqPYVCmrgDFVHeQpZ88i9/1RRx8zWKi32KA7l7QotK0
         hoCflNdF0H4gZgliFTOa3Ee5ErL/q8TR+pQwu49/F9vzA95nPkmf8cGd9fAkmtJlXACt
         Yokg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=3ZuHYpzEfkIObUGQaVKJA8bpKdkHZr2NFxh44fTT9pY=;
        b=PjBtmZawtkc9ryMPNvxsJ9yGXOf+8v0BSso6PNT7EbZ8HXksymJtJoSbtl5+eTs6RX
         2HcKDS8dLzEev/7FLw0fCT1NEJ95GDCOJ3sD28yIH7AjwVDl37AlUMk6yDi4m6DdSt8g
         Vlawol9b3g+UihS0ZInnb2VywyO7z/OwvLvw923A+tPnuq3hCCeLTnNWdH+z8YIYvgV7
         qdcNbvXL99NdFPIdkuYhgw6CJ+0wRceArmKvjGhcC3pQTaWShJwOzi6wGNvqDpFydpmG
         8Vsygq0SdEiqrPMEUIfgEghCEJv7SSgYU7vn34S9H6vyYPHSLJil3Zz5Kedzb5dpFnoO
         6n9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZzKK9ofa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2si331454ybc.216.2020.09.23.08.55.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Sep 2020 08:55:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZzKK9ofa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kL77O-0005DK-Ua
	for alex.bennee@linaro.org; Wed, 23 Sep 2020 11:55:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1kL77F-0005Cf-L8
 for qemu-arm@nongnu.org; Wed, 23 Sep 2020 11:55:33 -0400
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:46054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1kL77D-0002x5-Pr
 for qemu-arm@nongnu.org; Wed, 23 Sep 2020 11:55:33 -0400
Received: by mail-il1-x143.google.com with SMTP id h2so31621ilo.12
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2020 08:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3ZuHYpzEfkIObUGQaVKJA8bpKdkHZr2NFxh44fTT9pY=;
 b=ZzKK9ofaxmMg4rtHRZCuSKleZdFO9CSpaW1U+PvL9nKv1SuuUJydCjg34TyQp8mBZY
 /H9YFd5d6hmX4rlR5etEs89P3vfE4oenYsRQ9jJs7KJL2OFgaSRoxJ9HmwWdgHcw1bmt
 Nsl7OFjLX6+C66zP9ls40IpnYg+r7GeAeGX4pjzIRVum9OoGeIgUipLeoQnEXZS57nOq
 tRmN3TTAXZl+niL+FXGJrL7vlVpXeSpHNotr307A396y6Qn9hzk2mqbW70cLMGuKzQT2
 T35Y5bsL4QCCGIGD0Mrjax5FAr7ByMHdDpEj9WIsxihpOe5q07vv0R3DfSIDhjYTVC9F
 7D5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3ZuHYpzEfkIObUGQaVKJA8bpKdkHZr2NFxh44fTT9pY=;
 b=uFSp7mQn/xWPnARPQje55Btdl9tq2voafDMIDQB/crwPwq0jf4I5N+mZnc73JmD8pP
 aGeSp0RzEqQQ6A8D4PRx71tUA11rfmVISQDmz2t2rTyCMxPj7gq3bOXLpvwsj7i1tP8o
 y/CNn1NvRWKY6ARGgFY2Ly0uC5uO4frXgWZsfDJc4dyvETi32S2SdqAqnPMnW9PH8M6Q
 zQ2/T3RFy454Bj7OWzkLeWFePY9xBNccdEQcv6WTt7eqFwsxlUmfOIuDJZUaRWdJ3ATD
 QfanW9bIXbjTvlrCt7oYqL3q9+6Pji7w265iytFX9pZV77cO6eWdfr5fbHujtWdkL5oc
 Rqnw==
X-Gm-Message-State: AOAM532EbOEa9ytpgl3K1sdNbFCXsC6EWZ2wYheYCTMoZtHiWJz7Xz9y
 wrAYypG670zTBQMUyGQy3FlfZCmYzh4otGLqRiE=
X-Received: by 2002:a92:d105:: with SMTP id a5mr411113ilb.206.1600876530591;
 Wed, 23 Sep 2020 08:55:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAC41xo2yEoDvy15yExroY+ZX+qQns_rxQiqP9D2Xo3dqquP7KA@mail.gmail.com>
 <CAFEAcA-gMfOntN=up20vjF00Mbf0MOeWyTWufmcZ9E=AKKYWEw@mail.gmail.com>
 <CAC41xo0mWv4LoHbzvxkq+vhw=kn8iyi2vhgZhv4vxODmJcnngQ@mail.gmail.com>
 <1bfa78a6-b478-118f-c284-466dcddde468@amsat.org>
 <CAFEAcA8OhKmg5R=h4E4qO_RwPGbP50p711j_zjoSY-fhjeMAjA@mail.gmail.com>
In-Reply-To: <CAFEAcA8OhKmg5R=h4E4qO_RwPGbP50p711j_zjoSY-fhjeMAjA@mail.gmail.com>
From: Jose Martins <josemartins90@gmail.com>
Date: Wed, 23 Sep 2020 16:55:18 +0100
Message-ID: <CAC41xo1cOxgM5bR9G6O72QRgAcPMEA_tCje0=HZ73vGhD22hQg@mail.gmail.com>
Subject: Re: gicv3 maintenance interrupt not triggering
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::143;
 envelope-from=josemartins90@gmail.com; helo=mail-il1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FK1Cz/fQEt6z

I've tried to debug the issue this morning but I've hit a wall.

As I said in the previous email, the issue seems to be due to the fact
that cs->maintenance_irq is not initialized correctly and therefore
the call to qemu_set_irq for the maintenance interrupt in
gicv3_cpuif_virt_update has no effect. When this variable is
initialized in gicv3_init_cpuif using
cpu->gicv3_maintenance_interrupt, the latter was also not initialized
yet. From what I could understand this initialization is only achieved
in the call to qdev_connect_gpio_out_named which is only made later in
virt's create_gic function (using gdb I was able to figure out the
call to gicv3_init_cpuif is somewhere in the call graph of
sysbus_realize_and_unref for gicbusdev made earlier in create_gic).
I've tried a naive fix by changing the order of these initializations
in create_gic but this crashes qemu immediately. Given my limited
knowledge of qemu internals, I'm not able to figure out how to fix
this.

I'm not sure if this analysis is correct but would appreciate further
guidance on how to resolve this.

Btw, just to make sure, I've run pretty much the same code on an
imx8qm board and it works fine.

Thanks,
Jose


Jose

On Wed, 23 Sep 2020 at 10:44, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Wed, 23 Sep 2020 at 09:06, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> > On 9/22/20 10:46 PM, Jose Martins wrote:
> > > I've compiled QEMU 5.1.0 which I configured using: ./configure
> > > --target-list=3Daarch64-softmmu
> >
> > You can enable a trivial tracing backend (displaying trace events
> > to stderr) as suggested by Peter in (a) by adding
> > '--enable-trace-backends=3Dlog' to your ./configure.
>
> That does work, but it's much easier to use the -d trace:whatever
> suboptions, because those are always built in.
>
> thanks
> -- PMM
