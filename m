Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp582770lfb;
        Thu, 2 Sep 2021 12:31:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyp+6R6LnE0Y8GLZRmlBWXxcQHurnCKIjUARUd78xhbka+H7b5iXNU/HMn1CCJPotVDMmzn
X-Received: by 2002:a1f:1157:: with SMTP id 84mr3443569vkr.13.1630611062244;
        Thu, 02 Sep 2021 12:31:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630611062; cv=none;
        d=google.com; s=arc-20160816;
        b=UvbpARKgOBT8bv2ZeQyapHAX7Cdv2d2cxujrC43b9R/AQu2xHSaxfK2HRvB4vHHkU2
         FB/lexc+h6zTV6yNcyGbbmhn9PMXx4myNOXtBj45vd6X2vOqcstypcQkYn0NWGGGjEfW
         +uLjXCWWjHrg5FSVdd/drQ1HJ9Z4wWwHUAgmTxSofALTAePwoVrAiZ5zpsiHe9biLWjz
         yEC79ce45h5F8J6NL7jDQ8VzKLOLebcup3B1+tlbrcuZiX3XaRoFx836W4uHpsJ914FO
         1HCrekkQaP7fXkj003d7niiEqFDiaUd79+eWKxdzpe/ClBjUagRxb+PQ9pzH8LTVwH1P
         Ktpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LDgYTaZPd7fIgaqSd2LJvUg0u8gA8KQxliFRygtGFJM=;
        b=bGLqgGVaElTmXOs5Znek7PBlJlCURJgEG3YC3QSriFZPD7nOk40vcytfL5HLZPlU4x
         3E3aNEN3ofe+4iw8Q2U1bSwO485hvxh1Ml/HqNPcYvY0pzzVCzwr4Sd0ghhJ89lTGSc0
         82RyGrjFkZ8+1LOjvWbsk94hsKX1FWXUJT+OES8jys+J33HQbgAd9cJW1Mton/c4XjIN
         WNvUJQHsMQ2Uo3ikXhzhP+UnxZfO9fRxkM8xvIXF2Rz8swurYDN5Vmu7DqOOuWCDtWk4
         XAOBb3O6GYKQrDXWj8aCvDFeY/ca+EYL/GBqVoPNwkAaEL6yl3VnSkaiU8d2KJAIj87f
         s+rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=u4183SyG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o207si1362529vke.19.2021.09.02.12.31.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 12:31:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=u4183SyG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLsQP-0004Q8-Ee
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 15:31:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLsQA-0004N7-MS
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 15:30:46 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLsQ8-0002VI-RE
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 15:30:46 -0400
Received: by mail-wr1-x434.google.com with SMTP id u9so4681628wrg.8
 for <qemu-arm@nongnu.org>; Thu, 02 Sep 2021 12:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LDgYTaZPd7fIgaqSd2LJvUg0u8gA8KQxliFRygtGFJM=;
 b=u4183SyGPMqn86XxNfKuH4///StAm8zYgLSkagvy3+3NQqzs0Hq5HvxQ/9p1oJsRlI
 yHHOxUvIIYxPA28/w0W0k38GBAYEQs4SGN86V34p+AxgB+d/b0p85AFdoYrzrIVxNcZv
 Hr7vgVgBlBo/OUX0uBsum6+wSSD6FCNRtLNGj73/qRV70qc6KD0nguSn0i+Ix+XGZIfv
 U7XreJiBWcctM5BYAL28J8kJKtf445JbSZckDmliqwcckBI0JKMtUE5t1U70JhoD85EM
 5VPcod/1YBtuxKcIMqyW9cPRkglMRKus7ZhdI/5tRfGi+ORwtD1zHxz9RlOuCYSHH7+W
 dt4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LDgYTaZPd7fIgaqSd2LJvUg0u8gA8KQxliFRygtGFJM=;
 b=Poq3i6xN2K94LK+bsJGnuOFjs65hNGoZ7nQ9Ll/Tcw3LlVQ60Yp8rTdMv30Y+KMe/1
 fsQwvKzVe87IUR0w+ejB6sJSflBhxXUlQGozuePa/0pfd8PVbUJK17CGTMnWZlWUIqlQ
 ZMN20digd93os0sAhJYtqqdEp737bHBV6TKuaN7ApcxB6uBSUPfyHODjs9P3uel/rSsB
 05omshhrnSM/8iGHfDU+MuBt8IxtUcgki6pHcV+iIh+hEQMPvRm0AQ1GijcaT95Hda+f
 5HovYXmQpJLlaVYc7fqc3W1OkbTX3iCLMAEeJZEzhpty/1GgkGhHxrupLC2yAC82AdeK
 dBgA==
X-Gm-Message-State: AOAM531RWXGtaTmI01E4l3eSQAbgoYVvEQ/HCDJlJ3NkbF1tI5FgamB/
 2s7JDX7zFAi9wUYGI4Lj9QOMRbh4NfkuR0+hPuWaZw==
X-Received: by 2002:adf:b748:: with SMTP id n8mr5614986wre.133.1630611041455; 
 Thu, 02 Sep 2021 12:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210808013406.223506-1-linux@roeck-us.net>
 <CAFEAcA8+o69ztRaaMvqh+zNaFs_6reSHX_ijknay6_0VePSE2w@mail.gmail.com>
 <a34c10d4-fc90-0186-3214-c3c5e77b4eea@roeck-us.net>
In-Reply-To: <a34c10d4-fc90-0186-3214-c3c5e77b4eea@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Sep 2021 20:29:52 +0100
Message-ID: <CAFEAcA_cAp6kWTE6Lpx6QF1zfTYfQXiOPgdfkztS3iuJkRB0xQ@mail.gmail.com>
Subject: Re: [PATCH] hw/ssi: imx_spi: Improve chip select handling
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0F8/FnaO3woK

On Thu, 2 Sept 2021 at 17:09, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 9/2/21 8:58 AM, Peter Maydell wrote:
> > On Sun, 8 Aug 2021 at 02:34, Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> The control register does not really have a means to deselect
> >> all chip selects directly. As result, CS is effectively never
> >> deselected, and connected flash chips fail to perform read
> >> operations since they don't get the expected chip select signals
> >> to reset their state machine.
> >>
> >> Normally and per controller documentation one would assume that
> >> chip select should be set whenever a transfer starts (XCH is
> >> set or the tx fifo is written into), and that it should be disabled
> >> whenever a transfer is complete. However, that does not work in
> >> practice: attempts to implement this approach resulted in failures,
> >> presumably because a single transaction can be split into multiple
> >> transfers.
> >>
> >> At the same time, there is no explicit signal from the host indicating
> >> if chip select should be active or not. In the absence of such a direct
> >> signal, use the burst length written into the control register to
> >> determine if an access is ongoing or not. Disable all chip selects
> >> if the burst length field in the configuration register is set to 0,
> >> and (re-)enable chip select if a transfer is started. This is possible
> >> because the Linux driver clears the burst length field whenever it
> >> prepares the controller for the next transfer.
> >> This solution  is less than perfect since it effectively only disables
> >> chip select when initiating the next transfer, but it does work with
> >> Linux and should otherwise do no harm.
> >>
> >> Stop complaining if the burst length field is set to a value of 0,
> >> since that is done by Linux for every transfer.
> >>
> >> With this patch, a command line parameter such as "-drive
> >> file=flash.sabre,format=raw,if=mtd" can be used to instantiate the
> >> flash chip in the sabrelite emulation. Without this patch, the
> >> flash instantiates, but it only reads zeroes.
> >>
> >> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> >> ---
> >> I am not entirely happy with this solution, but it is the best I was
> >> able to come up with. If anyone has a better idea, I'll be happy
> >> to give it a try.
> >>
> >>   hw/ssi/imx_spi.c | 17 +++++++----------
> >>   1 file changed, 7 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> >> index 189423bb3a..7a093156bd 100644
> >> --- a/hw/ssi/imx_spi.c
> >> +++ b/hw/ssi/imx_spi.c
> >> @@ -167,6 +167,8 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
> >>       DPRINTF("Begin: TX Fifo Size = %d, RX Fifo Size = %d\n",
> >>               fifo32_num_used(&s->tx_fifo), fifo32_num_used(&s->rx_fifo));
> >>
> >> +    qemu_set_irq(s->cs_lines[imx_spi_selected_channel(s)], 0);
> >> +
> >>       while (!fifo32_is_empty(&s->tx_fifo)) {
> >>           int tx_burst = 0;
> >>
> >> @@ -385,13 +387,6 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
> >>       case ECSPI_CONREG:
> >>           s->regs[ECSPI_CONREG] = value;
> >>
> >> -        burst = EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
> >> -        if (burst % 8) {
> >> -            qemu_log_mask(LOG_UNIMP,
> >> -                          "[%s]%s: burst length %d not supported: rounding up to next multiple of 8\n",
> >> -                          TYPE_IMX_SPI, __func__, burst);
> >> -        }
> >
> > Why has this log message been removed ?
>
> What I wanted to do is:
>
> "Stop complaining if the burst length field is set to a value of 0,
>   since that is done by Linux for every transfer."
>
> What I did instead is to remove the message entirely.
>
> How about the rest of the patch ? Is it worth a resend with the message
> restored (except for burst size == 0), or is it not acceptable anyway ?

I did the easy bit of the code review because answering this
question is probably a multiple-hour job...this is still on my
todo list, but I'm hoping somebody who understands the MIX
SPI device gets to it first.

-- PMM
