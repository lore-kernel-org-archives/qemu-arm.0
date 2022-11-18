Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp345984ejx;
        Fri, 18 Nov 2022 07:43:06 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7j69OoSp/aqRg4hHjVIOTXGkNHaVsAJtS1losrCUhkMRbQ7ZR9W4N8Vj0RrtoRlQOLehyO
X-Received: by 2002:ad4:50ac:0:b0:4bb:ce03:5714 with SMTP id d12-20020ad450ac000000b004bbce035714mr7265814qvq.30.1668786186183;
        Fri, 18 Nov 2022 07:43:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668786186; cv=none;
        d=google.com; s=arc-20160816;
        b=AKAmreVTqC5F6PuB8fTdOMRRCumNHLZnLSIEBITMrpGr/+pdMpxPphN1OB5sJCi5SX
         U6dTOZvcqFSzenhKmn6lp8+EepfBFG7slUcS9xv0tTRp7wzIvmvTbrbm1vl0URIBO8N/
         wR7/miSp2PghydCQIfRT5ryStjDHr9nyi1ge0wYDKwswm8wXaiJFhwRQMe8sIAlL1JbR
         WA//SNCe337HXT5OG6fo8Tg7Ch1PoqCLoylFCeTbkplDyTx0A9IKqz/+BDOhaxShMZPg
         uRaM5ZdkmHkNM6fKDcrBeWd0AEW7IuwHOcB4LoMg3HC6buuWtm2mYAmU9jLidKiKsV+Y
         mx9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=KPQxCp0nDUndTIOOn4qJmlBsDTJ9eVNzbLVediVE5q8=;
        b=l3H0TxVkt2mzOIZ8a+VRVIrvUgsvj2i4H+mcgDZUANg/nMTmL9BCoRzkNh96Uj2IxO
         VQL8QPpJubWmBVIWYUSXuEt8ys8cbewU2FDzWPpWoRff4xZq4Mgk6tTeevQmcauuz6qx
         /LSFlwGESj2PO7gdZZH/zeP1l5Fpz6GYEa84JGivqpZvtcfzh2pA0BAwBX1RoMrgLWGS
         Ff41gUWw1cg8LGghGUQ8Jmk1IgkGiTuAIDNT8p83KA5wv/BBBMujBe9zmh33NngFzk+0
         FD+At/HfhcrHPkmtAfcxq84orUzalF5cVjHp3n7khNAsDWfqpjpoioGbH49kdWzSPeoT
         quag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JVieQgjt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k20-20020a05620a415400b006fbc8883942si2250927qko.738.2022.11.18.07.43.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Nov 2022 07:43:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JVieQgjt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ow3Vs-0006fu-Fk; Fri, 18 Nov 2022 10:42:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow3Vo-0006eb-Fg
 for qemu-arm@nongnu.org; Fri, 18 Nov 2022 10:42:40 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow3Vj-0000uy-1Y
 for qemu-arm@nongnu.org; Fri, 18 Nov 2022 10:42:39 -0500
Received: by mail-pl1-x634.google.com with SMTP id jn7so3025276plb.13
 for <qemu-arm@nongnu.org>; Fri, 18 Nov 2022 07:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KPQxCp0nDUndTIOOn4qJmlBsDTJ9eVNzbLVediVE5q8=;
 b=JVieQgjt/0Vg8QsU4SXHU1c3A9NaXK4fiSN6MSqpWJ9nep4nkKVgmqtGBZwjsQuuM7
 NyP1k3H/y00rDdsoB4pNV6GZHdL3OudeWe72xYwuqLjs6vYT0p1fJe3TaJ86Tcq0WyEl
 HRBC4SJzBUgR42mpYh1X/Cw20GGXXPlzubZ6TGJqv7xkDZEDPX4niIJ4fNXWcWLfWugE
 v6XLXypSBuPfN9xBHDKhp8dQcshAhTDuMZzQf7EZUEAdo9VFaVpngcYQxM1t07kH+Nc1
 C0FuHTa4NeKEDBb2fxYBgRAQ0OfeT4QPkf9+86HiQbpvtoDHrMr+fEg8Mpxy9TmrZSbw
 7rsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KPQxCp0nDUndTIOOn4qJmlBsDTJ9eVNzbLVediVE5q8=;
 b=lZCOnY3/mUIf8x3dNtw7pZvv0r0qNZb3HUFrc2SKL7u4NF27L/ndwb8I0I+Qbocjmt
 GB6BbmeON4Cl57E0qEKy8e61dfKebRkV8MRj8Gt3oAXs6jUyYEpUucfINhjoVbH4kiIt
 dp/ORCLoPn9FcZ4LvqXhFHMe5dNTJpitbusXN2N17UbCL0tnfcaxquqLZSdlwRTFrk5I
 26hv6z9v4PgsbiO5UcM1S+j2WwifsCp8cn9VnDUqHIahTehDXdKt6kVYauHBOnZ/f+JR
 zaRt6twoD1nQu3+JVUQzJDNbo92buaGiCi6NkYJ0OUeaLQXn3sbSwfTtjEBfAV/jgOf4
 0CCQ==
X-Gm-Message-State: ANoB5pnvbuFGDiAuSfI3Lf2v5Mvv/eXYG54TnowcB69AXY6zIR7bZyO9
 zCeJuyV4ULEn4rpal1WPFLK2JrxTPfAGqtUsq+D6gpCfh8Q=
X-Received: by 2002:a17:902:b18a:b0:188:5240:50ec with SMTP id
 s10-20020a170902b18a00b00188524050ecmr8029711plr.168.1668786153667; Fri, 18
 Nov 2022 07:42:33 -0800 (PST)
MIME-Version: 1.0
References: <166783932395.3279.1096141058484230644-0@git.sr.ht>
 <166783932395.3279.1096141058484230644-4@git.sr.ht>
In-Reply-To: <166783932395.3279.1096141058484230644-4@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Nov 2022 15:42:22 +0000
Message-ID: <CAFEAcA-RoriU5nz3LYmHgQ3ah+50PeGqpWuYL=zE8nfPSCf82w@mail.gmail.com>
Subject: Re: [PATCH qemu.git v2 4/9] hw/timer/imx_epit: software reset clears
 the interrupt
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: q+i3uuL81JkY

On Mon, 7 Nov 2022 at 16:42, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
> ---
>  hw/timer/imx_epit.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
> index 2e9dae0bc8..5315d9633e 100644
> --- a/hw/timer/imx_epit.c
> +++ b/hw/timer/imx_epit.c
> @@ -94,6 +94,10 @@ static void imx_epit_reset(DeviceState *dev)
>      s->lr = EPIT_TIMER_MAX;
>      s->cmp = 0;
>      s->cnt = 0;
> +
> +    /* clear the interrupt */
> +    qemu_irq_lower(s->irq);
> +
>      ptimer_transaction_begin(s->timer_cmp);
>      ptimer_transaction_begin(s->timer_reload);
>      /* stop both timers */
> --

It's not valid to call qemu_irq_set/qemu_irq_lower from a legacy
reset function (because whether it has an effect or not
depends on whether the device on the other end of the line gets
reset before or after this one, and there is no guaranteed
order for devices being reset). The convention is that if the
post-reset state of the IRQ line is 0, then you don't do anything.
The device on the other end will reset into a state corresponding
to "the input line is 0".

thanks
-- PMM
