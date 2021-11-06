Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp3185808lfv;
        Fri, 5 Nov 2021 23:54:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEvotP1OciTNvp2EFQd0SJnn5VB9n8EwfyCBo9NaZUl9nAyKsg4ffsq1CIz5Ji1R6J3gJG
X-Received: by 2002:a05:6830:14c9:: with SMTP id t9mr35819447otq.24.1636181663021;
        Fri, 05 Nov 2021 23:54:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1636181663; cv=none;
        d=google.com; s=arc-20160816;
        b=pp65HXBAVGiRWCRzERAQtVKRQ9mJZdgySDEmNjfCSTuMlQsyOqfGy2727xzFxZlH5V
         de108u8Fp2QtQbDDl4LX1AlBWcCOr7n9Iqrma2b6MXzYuzUV7CuIg74jo8H7dyarenno
         E5Zy8ctWiex52JHhlFIo9PR5J0JztxCX3Vee5JrILBxdX5S1R1+Hkt+fk8vIBW3H8+n/
         T5VobaJGY0nkxJ3ogxEL5IL/pK/Mug36sCpbpn7aGY0N0QTiPa9Ov2KGHa7qIypkp1Vg
         TfoVydd0BoGEYxj8mUAG800NZFW2mv36/f2LavjQeDl/Nv/SD7pcmDoC2LG+8Kf0BBvl
         FL+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:to:from
         :dkim-signature;
        bh=nrZeeMZnRP3ApwNiz0fVlan+bBxZbOO1iTZjX9rbwPY=;
        b=iw6EPPNzkwlTdBHiUImWBgBZw76BRe+eoD9jwfo515oW8G6xt5gffy3vFbyAnTJd91
         7Dg/0fvmKwsiBVyv9SJdZ87yxk7LJ3g1PwqaxiljJnw6+j18F9YTtzPJXJatbILnjbPd
         zoapuE3qXOXt0knuHLKD0/qVngOWowWEE+MMvHyWMbGe/y/AyOp2OxVP+CwCniuByAb4
         u7y/niNawFh1hyV33oFIXVsg+6JFkhFgzp0zyhnKkIz0iKyBnRtO/ySjEWwdWSYB+BIy
         Nvaq2Pw/dy1VCWPJOEI37aZ+WXcVIsP4ytBRxQJ+YcRFQ1iuol6pmhiB3oR7QstqYmdY
         kmKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RlIryiYM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v2si4572333ott.173.2021.11.05.23.54.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Nov 2021 23:54:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RlIryiYM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mjFao-0000Rs-BB
	for alex.bennee@linaro.org; Sat, 06 Nov 2021 02:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mjFa5-0000Qd-RN
 for qemu-arm@nongnu.org; Sat, 06 Nov 2021 02:53:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mjFa4-000810-DZ
 for qemu-arm@nongnu.org; Sat, 06 Nov 2021 02:53:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636181615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nrZeeMZnRP3ApwNiz0fVlan+bBxZbOO1iTZjX9rbwPY=;
 b=RlIryiYMZwN+p+2+3TtqsqPXPJpaEe1aDuZgswhk17aBTdJwE2/5eelOKWmDNSMMbEgLxi
 DzXzo4QZCONNpNgZeeiu2OtKnF+KP+zV9SJd1Z87za79cySgetvhYjISvfn/Cmn5+m+I/T
 4qPeyDHmZ5rvmhfCl5NDnWnlgujKlIk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-ikE5YByzNXiyCrvwtztPvA-1; Sat, 06 Nov 2021 02:53:31 -0400
X-MC-Unique: ikE5YByzNXiyCrvwtztPvA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74D02800053;
 Sat,  6 Nov 2021 06:53:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A7C8C60C17;
 Sat,  6 Nov 2021 06:53:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 379ED11380A7; Sat,  6 Nov 2021 07:53:27 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Hao Wu <wuhaotsh@google.com>
Subject: Re: [PATCH v4 6/7] hw/nvram: Update at24c EEPROM init function in
 NPCM7xx boards
References: <20211103220133.1422879-1-wuhaotsh@google.com>
 <20211103220133.1422879-4-wuhaotsh@google.com>
Date: Sat, 06 Nov 2021 07:53:27 +0100
In-Reply-To: <20211103220133.1422879-4-wuhaotsh@google.com> (Hao Wu's message
 of "Wed, 3 Nov 2021 15:01:32 -0700")
Message-ID: <874k8pvkpk.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.735,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, qemu-block@nongnu.org,
 venture@google.com, bin.meng@windriver.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, armbru@redhat.com,
 f4bug@amsat.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sl81HxNXdY31

Hao Wu <wuhaotsh@google.com> writes:

> We made 3 changes to the at24c_eeprom_init function in
> npcm7xx_boards.c:
>
> 1. We allow the function to take a I2CBus* as parameter. This allows
>    us to attach an EEPROM device behind an I2C mux which is not
>    possible with the old method.
>
> 2. We make at24c EEPROMs are backed by drives so that we can
>    specify the content of the EEPROMs.
>
> 3. Instead of using i2c address as unit number, This patch assigns
>    unique unit numbers for each eeproms in each board. This avoids
>    conflict in providing multiple eeprom contents with the same address.
>    In the old method if we specify two drives with the same unit number,
>    the following error will occur: `Device with id 'none85' exists`.

When a commit does three things, chances are splitting it into three
commits would be an improvement.  This is *not* a demand.

>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  hw/arm/npcm7xx_boards.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
> index dec7d16ae5..9121e081fa 100644
> --- a/hw/arm/npcm7xx_boards.c
> +++ b/hw/arm/npcm7xx_boards.c
> @@ -126,13 +126,17 @@ static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState *soc, uint32_t num)
>      return I2C_BUS(qdev_get_child_bus(DEVICE(&soc->smbus[num]), "i2c-bus"));
>  }
>  
> -static void at24c_eeprom_init(NPCM7xxState *soc, int bus, uint8_t addr,
> -                              uint32_t rsize)
> +static void at24c_eeprom_init(I2CBus *i2c_bus, int bus, uint8_t addr,
> +                              uint32_t rsize, int unit_number)

I'd keep bus and unit number together.

I'd name the new parameter @unit, to match drive_get().

>  {
> -    I2CBus *i2c_bus = npcm7xx_i2c_get_bus(soc, bus);
>      I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
>      DeviceState *dev = DEVICE(i2c_dev);
> +    DriveInfo *dinfo;
>  
> +    dinfo = drive_get(IF_OTHER, bus, unit_number);
> +    if (dinfo) {
> +        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
> +    }
>      qdev_prop_set_uint32(dev, "rom-size", rsize);
>      i2c_slave_realize_and_unref(i2c_dev, i2c_bus, &error_abort);
>  }
> @@ -239,8 +243,8 @@ static void quanta_gsj_i2c_init(NPCM7xxState *soc)
>      i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 3), "tmp105", 0x5c);
>      i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), "tmp105", 0x5c);
>  
> -    at24c_eeprom_init(soc, 9, 0x55, 8192);
> -    at24c_eeprom_init(soc, 10, 0x55, 8192);
> +    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 9), 9, 0x55, 8192, 0);
> +    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 10), 10, 0x55, 8192, 1);
>  
>      /*
>       * i2c-11:

