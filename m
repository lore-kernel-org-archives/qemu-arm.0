Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1999881lfp;
        Thu, 6 Feb 2020 14:34:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqzIGprQFTX0SkPraM3W4JkIkw48DCWhSaXgSFhy1ZtA1UyzdmwzfuBQzSTvAxgJNHvim/18
X-Received: by 2002:aed:3463:: with SMTP id w90mr950023qtd.42.1581028455434;
        Thu, 06 Feb 2020 14:34:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581028455; cv=none;
        d=google.com; s=arc-20160816;
        b=tcJl5vxo9kiR86Uwh8deaedbxxOg+/B/chtWb11xSj0EPqPTa+YWxndfCeiciNk7MX
         yIGz0VPDNRM9E2Hg9PUpKhljh//rfgabAP/JfmWtfnLJYn/T/lxdUAxrDbDYIn3xlTcO
         UrFSOLaxaluXdkgnNcyBtdXPAI0fQ+npY9jujNbrbC5xi+7QbYHzdNC7OZky0LDsDIr3
         7ahVKyKbX1JbCe+FKUQNtTAC6VyxIxgDxiN/Q61/M3ygZGeo/qJEGqNq8oMK3rJ2AWww
         NBxAe+f9ZdOvySg+3Qiuvo0gXqdZzmf9yM+RcLbVk5N6y5Olfjiukj6JorkK1O+V/vVl
         PGWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pbd862HwYW69wjnzYROXLhMI6hq2ouoRB9W0g4hsBRI=;
        b=hSpYdNUGGzgpHPKILR/jim5kk77bUy9u7+Tx7fSIrpVQZim3nGw0OELyFIGoDV8hFm
         hegDqYx1TNvyyiwP6ss4JtGBFzivxoXrESYUEheEXizN1YJmp+jWteZFKomAtcJB86wH
         TtEDc78QniecSh3nAsac4qLDWRil6u9Mu4sDMMHa7Hx+JRT1UrE9gNYgbjAG7Hsmeo+Z
         XxyqkBAPWhjBwmQt1EE70qzUs0Y04EvoR22tinalCiVw02LjGEoP2Cy3eHztgQ8sExOZ
         1nm2vVNAlLBGm4FLt2kN9G7PvTwUodCh/jM4ZLJkmcIINnqpAOkYxkMwJcOPvtfyjHu7
         S1nQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CsAJgebZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4si361024qvo.86.2020.02.06.14.34.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2020 14:34:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CsAJgebZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izpiw-0002xL-T7
	for alex.bennee@linaro.org; Thu, 06 Feb 2020 17:34:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57668)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1izpio-0002v8-2Z
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 17:34:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1izpin-00079u-3k
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 17:34:06 -0500
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:42805)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1izpii-0006dO-O6; Thu, 06 Feb 2020 17:34:00 -0500
Received: by mail-lj1-x243.google.com with SMTP id d10so7893092ljl.9;
 Thu, 06 Feb 2020 14:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pbd862HwYW69wjnzYROXLhMI6hq2ouoRB9W0g4hsBRI=;
 b=CsAJgebZmEu/mNHsF8e/5fNG0yZu7sL//YZpct8RPeKqcd45+KW7cZgiHdaSGDJDPK
 9VtcjNkmkpjEo2615219aaSABTje2i8i4zUaiL1rHlqbt/XzsnyUdoUuxNxOB8H2uXrP
 Fhx1ICntNnmiP9PIn35+Eq6uS0jsF+XRm93Z/7NsJOUi5VDWRQg8/Y7LBz7RwRvEOlaS
 0r+x0wqVVqSKd97nRy3rUmoAQ3KlMa7Ui6FTiMh3nMfGWGOMtZ9Q4ZiNhYjctwB3d7ez
 NTsqeyhhIXbS/vMqpgbJDfRYb0UOPUCpr64X+FMl+Wc0fLEewgi7vcqN9dNsmhpFVu40
 RlaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pbd862HwYW69wjnzYROXLhMI6hq2ouoRB9W0g4hsBRI=;
 b=HMl3PBIv2femK0fugRrZ5PxhpYQj6EIwtJBMYTjkWhNtCWU0VVtU72FyjItae2K+MH
 pwcfReHim8mgAJOj4ecRSVuTxltQxA0ZPXklgnKX/brSl14SCgODXXGelXoxx9+VKB83
 riyF+vvme8yjZ+UxcbE2rRR4MJcaAc/G5kylHnhxA7lXsBJlqehHPtllJi+G+E/XnraY
 0pZqj0qoArtQBTY2munD0v4+WTlM1M63ZvtX3kTR+F+XULcFaZ81+R/m2QLXZHEX4vyl
 HtvZZ3357MiRl1wjR68YwuhyiQakshOHsfbn3BcRfZUlJxB4Z5NzPLtprz32ErV4Da4C
 g9nQ==
X-Gm-Message-State: APjAAAW0xq90w4qQ1qNNfnRknyxLV1lWufJOQP2BStRFXOTWy9qn18/B
 1NXpZcvb+u90Za1+tcfWXLiCFAcUYInSHOVhaqk=
X-Received: by 2002:a2e:8119:: with SMTP id d25mr3437488ljg.76.1581028439077; 
 Thu, 06 Feb 2020 14:33:59 -0800 (PST)
MIME-Version: 1.0
References: <20200206183219.3756-1-linux@roeck-us.net>
 <20200206183219.3756-2-linux@roeck-us.net>
In-Reply-To: <20200206183219.3756-2-linux@roeck-us.net>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Feb 2020 14:26:46 -0800
Message-ID: <CAKmqyKMNwoTv15J94sm7-DyYXct1j5r6GM8Mqz_t=BcZ1jn0KA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] m25p80: Improve command handling for Jedec commands
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::243
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Qemu-block <qemu-block@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mEqdToK6lFJU

On Thu, Feb 6, 2020 at 10:33 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> When requesting JEDEC data using the JEDEC_READ command, the Linux kernel
> always requests 6 bytes. The current implementation only returns three
> bytes, and interprets the remaining three bytes as new commands.
> While this does not matter most of the time, it is at the very least
> confusing. To avoid the problem, always report up to 6 bytes of JEDEC
> data. Fill remaining data with 0.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> v2: Split patch into two parts; improved decription
>
>  hw/block/m25p80.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 5ff8d270c4..53bf63856f 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -1040,8 +1040,11 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>          for (i = 0; i < s->pi->id_len; i++) {
>              s->data[i] = s->pi->id[i];
>          }
> +        for (; i < SPI_NOR_MAX_ID_LEN; i++) {
> +            s->data[i] = 0;
> +        }
>
> -        s->len = s->pi->id_len;
> +        s->len = SPI_NOR_MAX_ID_LEN;
>          s->pos = 0;
>          s->state = STATE_READING_DATA;
>          break;
> --
> 2.17.1
>
>
