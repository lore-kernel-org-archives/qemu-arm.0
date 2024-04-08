Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1313395ejh;
        Mon, 8 Apr 2024 07:37:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVYxfrgvwQ39AvnyXRus1RuIZdpeY1SAHrWJ8h9CG/R3B29FpLNpR/AsIgyiH7u3QNAQMD4Q3mMjQIifNLha3ghxr19Gpbx
X-Google-Smtp-Source: AGHT+IHH3bnrIL8O6k4BXcNlmdurY3ok5U95sKLG/w/82Xri+D2cFtFHIW/09Sh5fr9+GJUDpnZR
X-Received: by 2002:a05:6830:4104:b0:6ea:2287:bea3 with SMTP id w4-20020a056830410400b006ea2287bea3mr455315ott.6.1712587044757;
        Mon, 08 Apr 2024 07:37:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712587044; cv=none;
        d=google.com; s=arc-20160816;
        b=rgcJBVMhXjK0cMP4R/TRcQZo1VeS7ik8VQUHCD3qf5bUry0ArKEXSibqlG3I2jcN8f
         MsiQPuq/kIoOKXzO+Zur55HCnfQ+7KnWF0nzXyIJCTIMXtdgnYOxpVkm6Q1I8aa5K7gU
         fEgRpRct5LBlvVArnFAAwbn4ashzEl4e9aDfitpv8Wk6rWJ+DoNYXFDnU/z3jE8RTIbG
         OrnTj9sxHyjoKOpY9WSJ+F0JmxW1ciqY2IWk7IPQdQyeFGPyIRYFNa+XTqM0wdT/HWsR
         fI0kqNxooaFVzSUyf4B8ke3/gssr6k9oVezgeQAE1cOLDcmrJv0qzd/5x/yFu8lznaco
         HN0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=yCDQyG+FP5ng746D09xToBXY+tFyXOqQooASaSIcqb4=;
        fh=VC2mIIup9g8RxERfr8dKyGncM0TZgO4BvFw+WEAq/gg=;
        b=CnBKl1Iv8HSZ/jABa0ofRTn1SNNbvsBvSX+2CjYqvQRmzjc30zdx5tUnqyvFNH+QCs
         F+A8XTejbE4SPDPyOTlIUaKEST/pZFOC3/dOURW7V8Rwvl04L0kTW7fwi4t0TW7rdv1J
         CRktLutr9ue600U+xsK1FhdKQjcNElxxdaP3VL/c8ecDBanrlFOi5O2SUJNlytfAVY4+
         Ri1vNp+KkvNMF8SWyXY2pRulB4b7w8UEc/fVUHaM3wdXkdpubGfykXoj50hTYNeRmItp
         jbi/lHRIGGWbQzOdBSEG5wKhl+EoOXiqQUSGwhG69Spkv6GtrPyKI0kNggwWBDv8mof+
         cFbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XB/kpe3o";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l17-20020ad44091000000b00690c9ae32ccsi8341220qvp.395.2024.04.08.07.37.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Apr 2024 07:37:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XB/kpe3o";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rtq7S-0001hp-1W; Mon, 08 Apr 2024 10:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rtq7Q-0001gj-8l
 for qemu-arm@nongnu.org; Mon, 08 Apr 2024 10:37:08 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rtq7M-0006bA-VG
 for qemu-arm@nongnu.org; Mon, 08 Apr 2024 10:37:08 -0400
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-516cbf3fe68so5523330e87.0
 for <qemu-arm@nongnu.org>; Mon, 08 Apr 2024 07:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712587023; x=1713191823; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yCDQyG+FP5ng746D09xToBXY+tFyXOqQooASaSIcqb4=;
 b=XB/kpe3oKF1q8LR6uK8N7o1MdwYkAY+sI/V89vSCwR993sLFuE3ZMupj2eZx8WJBzZ
 XvAqVbhkOTH5c23JP/mpMUxHwKmm/2p5RFKUVnUMdrqvEO2LCtKYi+9uY7CWJP2ecGFs
 U11MLzsqPsRN9RXWqJCP7j3BX5BRsDjQAwBe5b7K323iOn0gqKsQfnrBz9H9lhO3A5Xr
 Y7NCzBWZx+dKsRRm1plipOtPa41NAiiXALwj4f5NFOnUvp7TME8wc+469gunhdeWJunz
 UepTnGWnbbX2EnLtflqqJK5nx03er8ELc6n0lBtCdL01AlJvRbDjk0KGYFRSsZcI0jpX
 UxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712587023; x=1713191823;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yCDQyG+FP5ng746D09xToBXY+tFyXOqQooASaSIcqb4=;
 b=uWkU3VwGvdaksLEgc9RPX4QUSfWATxxsOdaBiyvm8G1lhMQethVJkTBrruhivITcl4
 bjbbDmfqZl6WNRjzjm/iyVrLEoRtxWt1fgBrQwY688F0U+L52uh25fdjDUMU1mlZMjaA
 jsMyMLZrVcjZn7sV/YiFJCDh0qwofCOSk2ntTeXlb5epCzIbiQNAJ7xvOJQaC0abPY8f
 4yXvxojvDinTK9fcuRNSunSbee876Vco3oI1qPqqS/r20lFQ3tKRLaF6+qxdhXqw2LAJ
 Pz9HcTgD7MWlNfcIW0e3Czix/whxR5700qpjRVDhkiBKOHGbFHALgPlCjIdqnOdzfgVg
 rSjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNqC388Tv9SlaQPaa6Ki774StOOffe+81Oye6aJRvL+q3XABhwuOVudmNb2fCl3ScYmiaZ0sahB7HXG3AdV5j421vX
X-Gm-Message-State: AOJu0YytzUn0DWscIqmmnJaCg7SfB+L5t/Hd9TqeOGOoNOvk+QJcBTys
 UDmQOiEjlkXMTNHkyNIfmWin4BaEQvVrlLo74AKXP5m8ksqxkd5CfkmPGaxixYlWfafcwHQaFia
 ZhVp8HI33B8V3xmVqp7rjWAkMKlnhYWfMdKcp/49DqFfWlNoP
X-Received: by 2002:a19:ae12:0:b0:513:b1d7:6d07 with SMTP id
 f18-20020a19ae12000000b00513b1d76d07mr5321230lfc.58.1712587022857; Mon, 08
 Apr 2024 07:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240408141717.66154-1-philmd@linaro.org>
 <20240408141717.66154-3-philmd@linaro.org>
In-Reply-To: <20240408141717.66154-3-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Apr 2024 15:36:52 +0100
Message-ID: <CAFEAcA9RfS7MNvRHLGeWyu9HgZ4QzOq2i-umFxDn7N3R2Kn0OA@mail.gmail.com>
Subject: Re: [PATCH-for-9.1 2/2] hw/sd/sdcard: Assert @data_offset is in range
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 qemu-arm@nongnu.org, 
 Alexander Bulekov <alxndr@bu.edu>, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: j0JJQLEWWS/5

On Mon, 8 Apr 2024 at 15:18, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Prevent out-of-bound access with assertions.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/sd/sd.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 16d8d52a78..c081211582 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -1875,6 +1875,7 @@ void sd_write_byte(SDState *sd, uint8_t value)
>                              sd->current_cmd, value);
>      switch (sd->current_cmd) {
>      case 24:  /* CMD24:  WRITE_SINGLE_BLOCK */
> +        assert(sd->data_offset < sizeof(sd->data));
>          sd->data[sd->data_offset ++] =3D value;

Abstract out functions

static void append_sd_data_byte(SDState *sd, uint8_t value)
{
    assert(sd->data_offset < sizeof(sd->data));
    sd->data[sd->data_offset++] =3D value;
}

static void read_sd_data_byte(SDState *sd, uint8_t value)
{
    assert(sd->data_offset < sizeof(sd->sd_data));
    return sd->data[sd->data_offset++];
}

(etc for read_sd_status_byte() etc) ?

(sadly I don't think there's a verb that is the equivalent
of "prepend/append" but for removing elements.)


>      case 22:  /* ACMD22: SEND_NUM_WR_BLOCKS */
> +        assert(sd->data_offset < sizeof(sd->sd_status));
>          ret =3D sd->data[sd->data_offset ++];

Checking against the size of a different array from
the one we're reading from.

thanks
-- PMM
