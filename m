Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2973136njc;
        Tue, 25 Mar 2025 16:24:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWOQ6MNjjqeZyvfH3kH2K/V63HSIoyvDMk1d9QkWPCHiIu6k923M+TyZXH9Tes/+kFV42yGX0hdovLqyQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHaH6ZnpakuQ2BUmMGq6Z9QnyJKMSoWFyp5mydtzZlCWxJkWSU4DAoHMewAXe58TQD/9Lzu
X-Received: by 2002:a05:6214:c8a:b0:6e8:fa7a:14ab with SMTP id 6a1803df08f44-6eb3f284a8fmr167116166d6.6.1742945052156;
        Tue, 25 Mar 2025 16:24:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742945052; cv=none;
        d=google.com; s=arc-20240605;
        b=KprUgL+gCU4DiMpf/1TzaSpD/D61g7oJJeFKHfBZ2+2y/Cp0k/LsoeNiZtW4d77fND
         daDPOwE6WNnOYPtGlRjaP9wWC/NFVNqcft3LuIrW2D/wcIkqznGtfXwLQ27Y6dL8D0T6
         Anj1CqmREg3/lN9fp9YWwTmIidjDcYrLuTFPqf1ttph9dx4Xy/v57abe20j1SHg/2V43
         VFpX9UEK4ZsZEAPNo9Xdg8Hqp5tbjvblMcAEqPvwg93N+l6lmdKCFw0Uzc+FSPd4lISX
         r4YpYRG4JWOPs8BNT6u6BrD3tZ4+Km78fzn1vC4dU7eiSTF9C5uNY/Sek9+6A9G2o0Ay
         qpAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=HuxzM7gBfcHNzUxaY34Q0CiFpYF2BQo1KiDgOsTDuNo=;
        fh=ewGJImUovWnQkzjKRZEo/zAIk89CUgFNu48GYWQUPlQ=;
        b=YSvCCklKByYiBLXUfbMr2dRjq6YssQCOIFq3GUJVMVosKsCKq07BePugHU/Kn6pT7U
         al3J/ne/Ev1Aik9LEUwralliEkxLTMF2HsawiFV11kT/rrs8s1ce3O6kyH/86FAxRCqu
         ldjJ5huumWlISeIH7taEpg44M7aAQsynYq0m8GakE4HEPmlxfsBk8ees/vTJ8fyowzQ9
         mYy3cOKdftg+M0OmEhYnho03Ofrvkn3c0cu3o3pbr5NuMR3j1H538VuizNFNjhUzIAaw
         +BO6c9YB2c0sH+cUYTZPE814DjlWbjaXzggXYSUhNHm5IeH+4lzBbviPo1Dz6yFvO4X9
         pKtg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eb3f01a530si104883236d6.316.2025.03.25.16.24.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Mar 2025 16:24:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1txDcW-0003db-Tt; Tue, 25 Mar 2025 19:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1txDcU-0003cP-CR; Tue, 25 Mar 2025 19:23:42 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1txDcR-0003QC-Lk; Tue, 25 Mar 2025 19:23:41 -0400
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E06D34E6005;
 Wed, 26 Mar 2025 00:23:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id mlfJ0eZ_8WBn; Wed, 26 Mar 2025 00:23:31 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D85494E6000; Wed, 26 Mar 2025 00:23:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D28BC74577D;
 Wed, 26 Mar 2025 00:23:31 +0100 (CET)
Date: Wed, 26 Mar 2025 00:23:31 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, 
 Ilya Leoshkevich <iii@linux.ibm.com>, 
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>, 
 Matthew Rosato <mjrosato@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Glenn Miles <milesg@linux.ibm.com>, Samuel Tardieu <sam@rfc1149.net>, 
 qemu-block@nongnu.org, Patrick Leis <venture@google.com>, 
 David Hildenbrand <david@redhat.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Tyrone Ting <kfting@nuvoton.com>, Eric Farman <farman@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Halil Pasic <pasic@linux.ibm.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>, 
 Bernhard Beschow <shentey@gmail.com>, Hanna Reitz <hreitz@redhat.com>, 
 Hao Wu <wuhaotsh@google.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org
Subject: Re: [PATCH-for-10.0 10/12] hw/rtc: Categorize and add description
In-Reply-To: <20250325224310.8785-11-philmd@linaro.org>
Message-ID: <056b78c2-d2fc-fa49-91f7-abe3dd6fc3d2@eik.bme.hu>
References: <20250325224310.8785-1-philmd@linaro.org>
 <20250325224310.8785-11-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-722171422-1742945011=:7722"
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 28g6Tv2YI+gv

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-722171422-1742945011=:7722
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 25 Mar 2025, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> hw/rtc/ds1338.c  | 2 ++
> hw/rtc/m41t80.c  | 2 ++
> hw/rtc/rs5c372.c | 2 ++
> 3 files changed, 6 insertions(+)
>
> diff --git a/hw/rtc/ds1338.c b/hw/rtc/ds1338.c
> index 8dd17fdc07c..56162917c1b 100644
> --- a/hw/rtc/ds1338.c
> +++ b/hw/rtc/ds1338.c
> @@ -230,6 +230,8 @@ static void ds1338_class_init(ObjectClass *klass, void *data)
>     k->send = ds1338_send;
>     device_class_set_legacy_reset(dc, ds1338_reset);
>     dc->vmsd = &vmstate_ds1338;
> +    dc->desc = "Maxim DS1338 RTC";
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> }
>
> static const TypeInfo ds1338_types[] = {
> diff --git a/hw/rtc/m41t80.c b/hw/rtc/m41t80.c
> index 96006956798..55f52d95c51 100644
> --- a/hw/rtc/m41t80.c
> +++ b/hw/rtc/m41t80.c
> @@ -99,6 +99,8 @@ static void m41t80_class_init(ObjectClass *klass, void *data)
>     DeviceClass *dc = DEVICE_CLASS(klass);
>     I2CSlaveClass *sc = I2C_SLAVE_CLASS(klass);
>
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);

This set_bit() is not needed for i2c devices, i2c_slave_class_init() sets 
that already.

Regards,
BALATON Zoltan

> +    dc->desc = "ST M41T80 RTC";
>     dc->realize = m41t80_realize;
>     sc->send = m41t80_send;
>     sc->recv = m41t80_recv;
> diff --git a/hw/rtc/rs5c372.c b/hw/rtc/rs5c372.c
> index 5542f74085a..98067ad06d1 100644
> --- a/hw/rtc/rs5c372.c
> +++ b/hw/rtc/rs5c372.c
> @@ -216,6 +216,8 @@ static void rs5c372_class_init(ObjectClass *klass, void *data)
>     I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
>     ResettableClass *rc = RESETTABLE_CLASS(klass);
>
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +    dc->desc = "Ricoh RS5C372 RTC";
>     k->event = rs5c372_event;
>     k->recv = rs5c372_recv;
>     k->send = rs5c372_send;
>
--3866299591-722171422-1742945011=:7722--
