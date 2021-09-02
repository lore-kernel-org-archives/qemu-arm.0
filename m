Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp400843lfb;
        Thu, 2 Sep 2021 08:59:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxR1dsbXejUNJ+OWlRkIpTZnL+1EFWSZKFKIzKeRg4ohW7vLBag0Q+p0q2e34lcFXoQ4AcB
X-Received: by 2002:a37:749:: with SMTP id 70mr3738264qkh.461.1630598354135;
        Thu, 02 Sep 2021 08:59:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630598354; cv=none;
        d=google.com; s=arc-20160816;
        b=Jx3qPvCoOKtNwOHXhkoscsK6/cUAlGGa2AjC8T8XHarGHPzZiuQyqPlNDyIdoauR1S
         vF4jgxxX45xSKKACCaizbmH7ZVOG5v46uATmhUq6t79mKbjmrckYFVLewxgFkMAowsNW
         meUt800EE5nFBCsoSNMI7UaxbAABr7fjjqFM29C/FsZL0zoCj52utZ5DKihCBIwOdTaR
         FtgKEvrKPwWK9GFoit9tDZK3xkrQNq1DSDa/uVUba4bjax2/ncx+mH5xFDZ6p+jLktKn
         PJ7cBNa+9HW9WF4oF791uJRcMTbjNtjSKpaFEwW6ofAh2HPKVjeq8aT3Q1KpSS8XfVaN
         Utwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y+RUG+AZkfiFzsk0lc+8ExcS8P695yTR1lHSIzv9YGE=;
        b=u7JzzJFuL1PHWQ1Abm0iwXIbEpN28r9EH8+EEIZgn9VOU83We+0T/AC1N3zl6BDdzd
         UyuSHhn5L1Gw2mh8kjxWeq1p5XK1IZGXcBDNzyiiJqzU7NHTt8H6wwDbuaX3Gt1f2blE
         C903ICOeBFUzERhQbqXlJpI4fj5xZ9lp+5hQ8jRVQFdbiKnOZ8PxCnVn9nE02P1s8AJD
         ItN5rqU0FbvOqPaJCo/ztJdbsjdxsHICdPWf4yNt26d3zXT3tC1xOaN4zh48c4NNjxQQ
         Vs2ksIqdl4JpL20UkGorZAyIJ9vbBKdi0WkttaYsVrv600XOrU/tu8WaLnkqyl3nYVSh
         Il1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CNVAqGZE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c14si1562270qvc.111.2021.09.02.08.59.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 08:59:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CNVAqGZE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLp7R-0007XZ-FY
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 11:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLp7F-0007V9-QK
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 11:59:01 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:45913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLp7D-0002ll-Ig
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 11:59:01 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so1696828wms.4
 for <qemu-arm@nongnu.org>; Thu, 02 Sep 2021 08:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y+RUG+AZkfiFzsk0lc+8ExcS8P695yTR1lHSIzv9YGE=;
 b=CNVAqGZE1PtiEMH0FUANMS8dErlANSoSu4f+N49jmbiFAijjxHfNfB55WWpj9gGL3q
 xL66I+AbZ3F6za3IzDjN9HRIWrFCZQTQJly/aUyRp8irtJVgjw9toL4QGcbGjCQgZaix
 7K8GFGtcNHmd63nW5R7z3uN+5mAhlIF5udhm/QRJFDITAfBVMb3a+gRDKYJGKUsJTwIG
 rY+sWTqQ0RwuSgEzFQlPkarFQx6CO/OHLKTP3y0BHl4NbeTT0SHd6ilD59KNzJFobw7F
 6qIoCvvXLuCLeJv5rW4yGfHmzp1gIFjwD6iiKsZ/B+CP5lLiWHv6w/mDPlgjU20iCq/Z
 EE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y+RUG+AZkfiFzsk0lc+8ExcS8P695yTR1lHSIzv9YGE=;
 b=J5WyfCIr1tYxXH4DQoUMaqNoQJ1hrrEt1F6UaEONwIvOUL52jKHhWIf7PcDMFsV+06
 a0E6Dfh4jr/ljlnBEgiiMcpMbyyajNT26oV/fDbdyg2YIBrj78F1PbIEo3Sk2Tlsn8eg
 MUQj9894mJhVuUB4w/yBdoN0d2LDERDBg6Pp3wCiWqL9YNJxGROL2y08RaxYhsP/Bcc+
 lIlluA8V/5EW8k5oonoomDIZJiELd54mlvF0zMVWZw0ZR4WUJEr52ZvxXJ3Qp6bJEmTK
 S1BoAohJ+bM4pNuqqjgMNJc/TlFZKpgHr+YSY01qY0I4We2mnha7zwjX2VS4AalZ8k/L
 NhxQ==
X-Gm-Message-State: AOAM533mnZLlCyO0VWRrufFUqoxA2Ex3TKbuuhgtYtUDhHidhQCXJZ/Z
 meIydwkaahV3PfkhxHjp5pzGuLbjCWf843GcHP64fw==
X-Received: by 2002:a7b:cd83:: with SMTP id y3mr3861640wmj.126.1630598338040; 
 Thu, 02 Sep 2021 08:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210808013406.223506-1-linux@roeck-us.net>
In-Reply-To: <20210808013406.223506-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Sep 2021 16:58:09 +0100
Message-ID: <CAFEAcA8+o69ztRaaMvqh+zNaFs_6reSHX_ijknay6_0VePSE2w@mail.gmail.com>
Subject: Re: [PATCH] hw/ssi: imx_spi: Improve chip select handling
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wEbTVnbdobyk

On Sun, 8 Aug 2021 at 02:34, Guenter Roeck <linux@roeck-us.net> wrote:
>
> The control register does not really have a means to deselect
> all chip selects directly. As result, CS is effectively never
> deselected, and connected flash chips fail to perform read
> operations since they don't get the expected chip select signals
> to reset their state machine.
>
> Normally and per controller documentation one would assume that
> chip select should be set whenever a transfer starts (XCH is
> set or the tx fifo is written into), and that it should be disabled
> whenever a transfer is complete. However, that does not work in
> practice: attempts to implement this approach resulted in failures,
> presumably because a single transaction can be split into multiple
> transfers.
>
> At the same time, there is no explicit signal from the host indicating
> if chip select should be active or not. In the absence of such a direct
> signal, use the burst length written into the control register to
> determine if an access is ongoing or not. Disable all chip selects
> if the burst length field in the configuration register is set to 0,
> and (re-)enable chip select if a transfer is started. This is possible
> because the Linux driver clears the burst length field whenever it
> prepares the controller for the next transfer.
> This solution  is less than perfect since it effectively only disables
> chip select when initiating the next transfer, but it does work with
> Linux and should otherwise do no harm.
>
> Stop complaining if the burst length field is set to a value of 0,
> since that is done by Linux for every transfer.
>
> With this patch, a command line parameter such as "-drive
> file=flash.sabre,format=raw,if=mtd" can be used to instantiate the
> flash chip in the sabrelite emulation. Without this patch, the
> flash instantiates, but it only reads zeroes.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> I am not entirely happy with this solution, but it is the best I was
> able to come up with. If anyone has a better idea, I'll be happy
> to give it a try.
>
>  hw/ssi/imx_spi.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
>
> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> index 189423bb3a..7a093156bd 100644
> --- a/hw/ssi/imx_spi.c
> +++ b/hw/ssi/imx_spi.c
> @@ -167,6 +167,8 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
>      DPRINTF("Begin: TX Fifo Size = %d, RX Fifo Size = %d\n",
>              fifo32_num_used(&s->tx_fifo), fifo32_num_used(&s->rx_fifo));
>
> +    qemu_set_irq(s->cs_lines[imx_spi_selected_channel(s)], 0);
> +
>      while (!fifo32_is_empty(&s->tx_fifo)) {
>          int tx_burst = 0;
>
> @@ -385,13 +387,6 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
>      case ECSPI_CONREG:
>          s->regs[ECSPI_CONREG] = value;
>
> -        burst = EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
> -        if (burst % 8) {
> -            qemu_log_mask(LOG_UNIMP,
> -                          "[%s]%s: burst length %d not supported: rounding up to next multiple of 8\n",
> -                          TYPE_IMX_SPI, __func__, burst);
> -        }

Why has this log message been removed ?

>          if (!imx_spi_is_enabled(s)) {
>              /* device is disabled, so this is a soft reset */
>              imx_spi_soft_reset(s);

thanks
-- PMM
