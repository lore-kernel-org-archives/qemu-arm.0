Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3208597lfb;
        Mon, 18 May 2020 09:53:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUudoFu+Z/Gzof2tBT0L76jyLj1ClwHUlSre9osSQjT0OZPEo+fKdiZvBB08+OrxKFTE7q
X-Received: by 2002:a37:4786:: with SMTP id u128mr17544640qka.378.1589820822136;
        Mon, 18 May 2020 09:53:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589820822; cv=none;
        d=google.com; s=arc-20160816;
        b=WdWTk1XQVL1LTLDIZ9e51re20gTk3m2CCJZa+0Wti8vwnD5tfBQAbiRETndkIv8nBe
         zZ4h6Jne8ecL4Nrw37KOc1/t6xM/hoLoZXwKa6XKbpygj3iNS24tv4jBghveyX09SSSq
         zFP9BxqGPnulhNVolH6gFWH6kZrPXIzz5loZzooH74e6Y/lGOX3PWK4Tsx+VLCYNG45e
         pgM4iKrTyrdi1/QBTOxhMxcq8bD6T7Ie/ICFZplp62qwlJIDSajqZV77vJXTx7DkrEf5
         umYYL+encMLOHpDzUZFGgThV4yeCtHmiFSdkmKVUzSKzbDzVMwxmxNEqO1wiCnpKGSV2
         iU7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=FL2bHRaaG9r+wra0bobdI896edL3rD2JAUT9hR2ri1c=;
        b=K6GBh9I0WcSYw4CwsIPd7b1LZCqp4EfB3w0OezE9UAFrVJsOI0zeqVksWomk+QDDph
         oxAE2QRy2DSp7jZi0dJxa6X7uo0L88DQjSMMQaBK9eSoKrRrNEw4cAddCRBUQZqFlr7E
         fB83Gsud4zUERxd/sjfdfDHWx06AhsV/Kdr3xp0ndECPemhlSdrMtPLb/vy5xUz3Y6vh
         EQ6snL3KhsyRGraU8haw75z0MQgG8cRt3GE4LbeLbPkB2JaT5ajJVR3eCTqBTlF+b2sO
         CuKdHGz0ngT4SZMo1IPU99qSs8UZOIRcq3xGDjpWmGYM8XPTh2IAmg+B6NiZRKkzQisu
         127A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NIaFB93N;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cc6si3341794qvb.217.2020.05.18.09.53.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 09:53:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NIaFB93N;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jaj1J-0004t6-Jn
	for alex.bennee@linaro.org; Mon, 18 May 2020 12:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jaj07-0003CW-To; Mon, 18 May 2020 12:52:27 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:41284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jaj07-0001Bg-2a; Mon, 18 May 2020 12:52:27 -0400
Received: by mail-io1-xd41.google.com with SMTP id o5so11307101iow.8;
 Mon, 18 May 2020 09:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FL2bHRaaG9r+wra0bobdI896edL3rD2JAUT9hR2ri1c=;
 b=NIaFB93N7HtAFkbWPPu4Rsc9k8oVnJwZ3pcwVwpqaXPqwKOw8oKxyayrsN/uUmk0bX
 tSbiJWWJEo2RK0I6tL3V2vBaqaY9NILBocUu7efhl1JJQe2H0vPvLlyYOtLogFFu72cn
 P1tEk6slNejPPzwjbigJzVeQGp9us7VQOhhmIVewJp13XbFT7UC+lD+EskHHYyPrEOQb
 Hbw4mRNENPpe7h3P1ytQLLlLRMEMROoy6Q57OmdgQ+5Nl+vBWw3keUn8CqK1xSYYhego
 M6BKPGdcXTn5LWYrIG3e9Oq+RQKcYxSDc7qe6PEfLshkSDtKcn69EAfNw2ozicY04xpU
 gpNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FL2bHRaaG9r+wra0bobdI896edL3rD2JAUT9hR2ri1c=;
 b=HWgkY+GplbQtgjsdOyUVKBoeHHMW5MkgTiTIJYY0J6GBWiNgKHwc8bswatMbTO2vLJ
 L3NYxdNN1/xgA8cakztU8YYTAkf8qQeGs05IES8l9C1GPo8HQ8XtR0JHFNTMyTAoMrpe
 xhF6D7a7JDQ5Sr6t/1xDA33FHomwzkKYKpLI/roBv7/OncATaZ8Aakz4Ik29zdXOBef+
 aun2/f45Bem5/zOxpk5g2bLGeeldzWJRJQZvZhQHxneHEDikMUtN3YUDIkoa/QSI6v24
 zFhQWLp/iI+frag01HXESt/eT9iJzIYqLV6LRpWAaEWl8VxIovwRPDDbUZtCiBP82eha
 0iFw==
X-Gm-Message-State: AOAM53385mnsY1Av0/cYGgv1AU0KbuowgVzxfw1uYLWKUiUghuIJFMV5
 FfCl2l7vBaGCjoidqrIB5+5/NSjbTDPxGxfVe4A=
X-Received: by 2002:a6b:6a13:: with SMTP id x19mr15067205iog.175.1589820745585; 
 Mon, 18 May 2020 09:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200518140309.5220-1-f4bug@amsat.org>
 <20200518140309.5220-4-f4bug@amsat.org>
In-Reply-To: <20200518140309.5220-4-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 May 2020 09:43:34 -0700
Message-ID: <CAKmqyKPubMjc3gRLDaYRJ+=4TqUuzAhtNHyNxC+WPMs5SA7zsQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] hw/char/xilinx_uartlite: Replace hw_error() by
 qemu_log_mask()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VuIgP1TXNsup

On Mon, May 18, 2020 at 7:04 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> hw_error() calls exit(). This a bit overkill when we can log
> the accesses as unimplemented or guest error.
>
> When fuzzing the devices, we don't want the whole process to
> exit. Replace some hw_error() calls by qemu_log_mask().
>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/char/xilinx_uartlite.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/char/xilinx_uartlite.c b/hw/char/xilinx_uartlite.c
> index c6512285d7..ae4ccd00c7 100644
> --- a/hw/char/xilinx_uartlite.c
> +++ b/hw/char/xilinx_uartlite.c
> @@ -23,7 +23,7 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "hw/hw.h"
> +#include "qemu/log.h"
>  #include "hw/irq.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/sysbus.h"
> @@ -135,7 +135,8 @@ uart_write(void *opaque, hwaddr addr,
>      switch (addr)
>      {
>          case R_STATUS:
> -            hw_error("write to UART STATUS?\n");
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: write to UART STATUS\n",
> +                          __func__);
>              break;
>
>          case R_CTRL:
> --
> 2.21.3
>
>
