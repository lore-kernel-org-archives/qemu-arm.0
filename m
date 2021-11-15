Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp5851587lfk;
        Mon, 15 Nov 2021 05:19:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXKFghCSNyNFATQ+k4qpPVec00jBvxLevIGcAn4CjiTLeLtv/qknqF8kr35dM0FSPO9/5N
X-Received: by 2002:ab0:2b96:: with SMTP id q22mr59940370uar.87.1636982392170;
        Mon, 15 Nov 2021 05:19:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636982392; cv=none;
        d=google.com; s=arc-20160816;
        b=rEUBOUIFOSeuuR3TjQnNZLpIZJwjEnlSi+/RcT8x7EPh+Azx61U8KPSSVvmTXHNl3g
         pIypIEknKIgVbzwl0QrxlVgZa/9gQaGK18gqyoxPRlf2lcTJAF+MBS2aXn7WG8awGf5D
         8bpxPaJxz+L1/XAmBMSgCPILpEIV04MhP0NLKYvGMDbmabzGt1QinYC8trNe2Q65HpNj
         H5Br2ZUA3nLOfmmsd/qr8yr/jnMtreTKVebV1cGxXyiG0gqGv/9tEtrnXjuUCxm/QDyq
         Ic9tFSKIDBOvKvoa5JQEc+BiEKePWvy36bfX0QQqKCHpcJE5AzqgbbWo9iybYGGfqevN
         s1ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=xSI7ZG8GZDGv5lNHkwnQboube9kbbtx/sWPc2kvxxZg=;
        b=KYoz3z9R80o4ZNqY9bzmZyujoauFlcxz0PGOb7koyTwpJSXHkoYepfJdiQdy9dnRqz
         IbR4cE8pBDemdlsAMk/sT+9AZjefpI1+L95r2Mw5ATogZ/Ex2flZY8u82UjQZktwvcBk
         RVlhhSCN1k/siq2N+3R9zpG3m2vGclTun+QChMH6+zMbQPqzEovjjPWz5xNIlTOmfMtW
         tLmIReK/JDFKQCA1qy+9jUXQ5bl55uAC9215ntIdkHVJceGfg+SR2jidrSFVfy8XX23l
         jpxIP8lcCV77xEaGelyzKaAKFqwWT3FRlSedyDTmRLxVS4BA5nG9Qz1SiVNmqBD5A6R7
         KKeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SSO2vxxK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay9si22248103vkb.40.2021.11.15.05.19.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Nov 2021 05:19:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SSO2vxxK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mmbtn-0004RB-Hi
	for alex.bennee@linaro.org; Mon, 15 Nov 2021 08:19:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mmbtZ-0004Cw-JU
 for qemu-arm@nongnu.org; Mon, 15 Nov 2021 08:19:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mmbtU-0000tI-M0
 for qemu-arm@nongnu.org; Mon, 15 Nov 2021 08:19:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636982371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xSI7ZG8GZDGv5lNHkwnQboube9kbbtx/sWPc2kvxxZg=;
 b=SSO2vxxKpne/TxFzrXEQsEb3iPCfPnVZCrkaChC1n4q8TIBdGrpSTpp49uDyDKtrlKntf/
 5pBriMjm6sFFl7uz+0qD4Yw4G/+lJX7F4iIZEW40skVLrY74NVu614I+cdyMMRZA6/zzzM
 Sgj/MerBpWPbezSkMFDtXEZxnb5ROZ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-gcKEmfEjNqeQSMtcFxBrjA-1; Mon, 15 Nov 2021 08:19:28 -0500
X-MC-Unique: gcKEmfEjNqeQSMtcFxBrjA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4F0B9F92A;
 Mon, 15 Nov 2021 13:19:26 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.157])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BD9F1017CF2;
 Mon, 15 Nov 2021 13:19:16 +0000 (UTC)
Date: Mon, 15 Nov 2021 14:19:15 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Hao Wu <wuhaotsh@google.com>
Subject: Re: [PATCH v4 6/7] hw/nvram: Update at24c EEPROM init function in
 NPCM7xx boards
Message-ID: <YZJeU5fCxR07hmJQ@redhat.com>
References: <20211103220133.1422879-1-wuhaotsh@google.com>
 <20211103220133.1422879-4-wuhaotsh@google.com>
MIME-Version: 1.0
In-Reply-To: <20211103220133.1422879-4-wuhaotsh@google.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
X-TUID: xkpudAohkj3x

Am 03.11.2021 um 23:01 hat Hao Wu geschrieben:
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

I may be missing the history of this series, but why do we have to use a
legacy DriveInfo here instead of adding a drive property to the board to
make this configurable with -blockdev?

Adding even more devices that can only be configured with -drive feels
like a step backwards to me.

Kevin

