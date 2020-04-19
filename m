Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3012814lfm;
        Sun, 19 Apr 2020 12:03:56 -0700 (PDT)
X-Google-Smtp-Source: APiQypLR5mLY8Hg9uapJa7ct8KTnslH6Ed42G+5Ar1WUxkx2lrCW3PQxWFR4uF+sdRMRtjUVnXI3
X-Received: by 2002:aed:2e65:: with SMTP id j92mr12594211qtd.273.1587323036658;
        Sun, 19 Apr 2020 12:03:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l26si16446024qta.107.2020.04.19.12.03.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Apr 2020 12:03:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=bcBbkDSD;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQFER-0002Aa-Ug
	for alex.bennee@linaro.org; Sun, 19 Apr 2020 15:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43086 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luc.michel@greensocs.com>) id 1jQFE2-0002A8-Fd
 for qemu-arm@nongnu.org; Sun, 19 Apr 2020 15:03:30 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <luc.michel@greensocs.com>) id 1jQFE1-0003x3-Os
 for qemu-arm@nongnu.org; Sun, 19 Apr 2020 15:03:30 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:39814)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1jQFE0-0003pS-UK; Sun, 19 Apr 2020 15:03:29 -0400
Received: from [172.17.10.10] (unknown [172.17.10.10])
 by beetle.greensocs.com (Postfix) with ESMTPSA id E219A96EF0;
 Sun, 19 Apr 2020 19:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1587323004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nRKFEuXAKLsEX2U13LRI8BUYt/b9YcUUlivgjXJW/5I=;
 b=bcBbkDSDEIGlRx/OdUt3IQkrhesUkYCWPT0b8es76eVd9iT4BneVNGRbXGQsEPuJsP8LlG
 wAYpUslfxrgSbc+4c7+lbxAuzzfhJatHR1+7ULgK9Bo3UHl1Z+djU1v0dBZ0fGNh5aJg1n
 b4EecDCsou2nwDpp4Safdbi8d38WXEQ=
Subject: Re: [PATCH v1 1/1] hw/arm: versal: Setup the ADMA with 128bit
 bus-width
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20200417153800.27399-1-edgar.iglesias@gmail.com>
 <20200417153800.27399-2-edgar.iglesias@gmail.com>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <3415ca01-2765-7269-a4f0-9d2c18d5147c@greensocs.com>
Date: Sun, 19 Apr 2020 21:03:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200417153800.27399-2-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1587323004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nRKFEuXAKLsEX2U13LRI8BUYt/b9YcUUlivgjXJW/5I=;
 b=unfUvTx0RM2aoImD3tL2OxicRjfjv5T6/szmMfpLuSz+rzN4/nxP/lXwVNbuDUtPpvORkf
 PKlFScSN/Q9L8bnJCd90/HzJAd2pJnFHCKIQGQEQFbILlT1KGt8svvFbUGwD/sxMZhLT/w
 xgwxJpt5D4KaJnC6d+3xKm+kXVEQwAg=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1587323004; a=rsa-sha256; cv=none;
 b=sBk5h/UsitLNESPGWYuMm1jnq+0RjMizTVrHAGgEpmsDIMVgtR6rWSTNmq/KUAah6jdrq4
 24xrisp6MBFs0TeLqSjY+ztFr0qMqLuJEq3oezLDhL1JDMOrhfhCf58Fajr4BFJhJiTlxv
 CxJAkGlwEG7KjWBFg4Hs6Xz/u1qyEM0=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=luc smtp.mailfrom=luc.michel@greensocs.com
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-detected-operating-system: by eggs1p.gnu.org: Linux 3.11 and newer
X-Received-From: 5.135.226.135
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 927D0GGq2kra

On 4/17/20 5:38 PM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Setup the ADMA with 128bit bus-width. This matters when
> FIXED BURST mode is used.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> ---
>  hw/arm/xlnx-versal.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index cb0122a3a6..94460f2343 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -205,6 +205,8 @@ static void versal_create_admas(Versal *s, qemu_irq *pic)
>  
>          dev = qdev_create(NULL, "xlnx.zdma");
>          s->lpd.iou.adma[i] = SYS_BUS_DEVICE(dev);
> +        object_property_set_int(OBJECT(s->lpd.iou.adma[i]), 128, "bus-width",
> +                                &error_abort);
>          object_property_add_child(OBJECT(s), name, OBJECT(dev), &error_fatal);
>          qdev_init_nofail(dev);
>  
> 
