Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp7221925wrr;
        Fri, 15 Nov 2019 11:30:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqyf86hiQglZ6P56vD0fSuSi53QNiUIeMaCiqCGfDRi+s+FURkTe/MQBjb4Z3I1Han50uSw8
X-Received: by 2002:a17:906:c44f:: with SMTP id ck15mr3166306ejb.7.1573846221030;
        Fri, 15 Nov 2019 11:30:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573846221; cv=none;
        d=google.com; s=arc-20160816;
        b=bc1hp2llhB9VrrR2pW5kFulNF+Kmoo6yy9QydQ7YhLP1pXkqV1mKaDS+XltyGkC1VU
         7Nen+e14sFTC48O5G6fZaqESUVhVGpJ90KHr5VDiXek5TGRcsD6e9Y74AcfhnNdAQFu8
         9d6I2YvYg5j/YirGc/bEcSuTOosMnimFVMIXpTmWrEOvopV/2TLX1/UABzi6fQ+X/cwi
         Mr27Dzbno7Z2bM/Z4HuvVjDrkwsKbI0Rg8Fs+1KAIa91Q2pSlJIfHuOVz3BODILc6HBN
         czQyBeTm2AXc2XgwrW/Hv7aRUDpAUfG4cu/2xUbmJVwa3PEc+DzQo5IlbWnisaKksGoH
         05oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h/apNc2lpH2/OD74Mr2EXYiB0PVupSrPYk7ZBbbZdVg=;
        b=QSwsyZcCVxlN4IP6uhZa5prdKJr/wfY37bceIeDgF1DRbiNOqTfZhiXbh3vpyDBwY3
         XphU0aZME8KUQA9q54xJ6jbc3J6rIAeIToeAwu5GEGQSWC57XGcfWMutBrX7/tICmo/0
         u5xQ9OyMc3niOkfMt9lmKtOIosjZe2hlIick1hLoHrvExjtfyAvawsDRctC46y9Q2UeG
         3y6MVoCz79fDr03pO9meq5LOqIGA+JF7Wttk+FuoXW/QGL9NhQ6plfI0W+snZ5qoJoeF
         Mf7FCjOZ+mF06YRLLrpFB6tVZZTigkgh1TKs2AeVTP8wAoDP6/PHaoo2TlltCabLkjmw
         lJyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lyAnnFGr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k7si6889986edb.265.2019.11.15.11.30.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Nov 2019 11:30:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lyAnnFGr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iVhIR-0007nR-Uw
	for alex.bennee@linaro.org; Fri, 15 Nov 2019 14:30:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59408)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iVhIJ-0007mA-6s
 for qemu-arm@nongnu.org; Fri, 15 Nov 2019 14:30:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iVhIH-0001Bj-UI
 for qemu-arm@nongnu.org; Fri, 15 Nov 2019 14:30:10 -0500
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:41717)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iVhIH-00018l-Mh; Fri, 15 Nov 2019 14:30:09 -0500
Received: by mail-lf1-x144.google.com with SMTP id j14so8821461lfb.8;
 Fri, 15 Nov 2019 11:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h/apNc2lpH2/OD74Mr2EXYiB0PVupSrPYk7ZBbbZdVg=;
 b=lyAnnFGrURVgEBTYUKTRlPT5WT/Cu50lwaj53sEXMWpq7pW++DIaVpr7HdS+BeikSj
 55o6u1On5OrJGrQjRSSPZs6loWbqpl2u5qbs0mZpl18YqUuLh8kTGEvb5hhdqMXYJe/c
 pqlXDDFgH76WW5srzNDG27kUIFpuGiGmDxij7JMIbCJxLz5EMvSzMSo05dm93cfCBIqR
 pFNttY90I20PFSMmCWjj9rNvDWOHBD9HsKmpivbnV514vzIrMFXPes0MnDe9N0BWwmBO
 0dcDfdt7clxNuaHUQelOphiOb/ZaKlvLKzuXP7nlxXThQjTpNXIhmyXNN/eOeSo/je2N
 blww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h/apNc2lpH2/OD74Mr2EXYiB0PVupSrPYk7ZBbbZdVg=;
 b=WgdyFqlPKzY5QjHiZK/EcjBS2LiWj3lVvaOAX+DpH89jODUDse2Idl8LAGeOCv6kHI
 2mFRMyTGU/oj3CuLZXrZxvMBdArnsIKGYGoZQaW5+ysuN2vQ7nBTknq2ppDC0BzSQxma
 mmm6F9jnAF1t8XPpbqNT8IV9v1B93Ne871J885jNW3dgDwtsLfvcv7pxPN8/fsRJwnGs
 HwBMERpa1+SKB6dU0tjEhcwN8wJMeV6V0y0W5mEX8JA0KMgeizag3h6YOtuYIyfpN6G8
 DpZhtLbHqRRVLtoaCggg50+tw/A+hJZHAbLXTBWAxmLPlv7JCDvVizcG7PxDB2j2PWa4
 BYag==
X-Gm-Message-State: APjAAAU81hr+3H4ANc01goGbcwnoEFx/x6DyxVCgj7pWwn8SRVk/Al6c
 oeks4dy4ZPl5AoyIQEVeWf2ISVZA4VY5bKuyngo=
X-Received: by 2002:ac2:4a8f:: with SMTP id l15mr12227636lfp.5.1573846208263; 
 Fri, 15 Nov 2019 11:30:08 -0800 (PST)
MIME-Version: 1.0
References: <1573833408-2388-1-git-send-email-sai.pavan.boddu@xilinx.com>
In-Reply-To: <1573833408-2388-1-git-send-email-sai.pavan.boddu@xilinx.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Nov 2019 14:29:41 -0500
Message-ID: <CAKmqyKNJf1Hin=tRV7nZ0TaUYD1NacK4FBJqvfxxnbUdoo_BNg@mail.gmail.com>
Subject: Re: [PATCH] display: xlnx_dp: Provide sufficient bytes for silent
 audio channel
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::144
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, KONRAD Frederic <fred.konrad@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Thplbcyz0xev

On Fri, Nov 15, 2019 at 10:59 AM Sai Pavan Boddu
<sai.pavan.boddu@xilinx.com> wrote:
>
> Fill the audio channel with required number of bytes to cover the
> elapsed time. This prevents rate control reset, and avoids debug prints
> like below
>
> log:
>         Resetting rate control (65692 samples)
>         ...
>         Resetting rate control (65721 samples)
>         ...
>
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/display/xlnx_dp.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index fde3b21..7058443 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -394,13 +394,18 @@ static void xlnx_dp_audio_callback(void *opaque, int avail)
>              written = AUD_write(s->amixer_output_stream,
>                                  &s->out_buffer[s->data_ptr], s->byte_left);
>          } else {
> +             int len_to_copy;
>              /*
>               * There is nothing to play.. We don't have any data! Fill the
>               * buffer with zero's and send it.
>               */
>              written = 0;
> -            memset(s->out_buffer, 0, 1024);
> -            AUD_write(s->amixer_output_stream, s->out_buffer, 1024);
> +            while (avail) {
> +                len_to_copy = MIN(AUD_CHBUF_MAX_DEPTH, avail);
> +                memset(s->out_buffer, 0, len_to_copy);
> +                avail -= AUD_write(s->amixer_output_stream, s->out_buffer,
> +                                   len_to_copy);
> +            }
>          }
>      } else {
>          written = AUD_write(s->amixer_output_stream,
> --
> 2.7.4
>
>
