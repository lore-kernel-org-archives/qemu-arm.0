Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2245001wru;
        Thu, 19 Jul 2018 18:35:48 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcb5aB68ahYLFCpl9t1szIFHx2CumKRx7bZgjvH4t8/Wj/9lw9w1I78nAm3sMZIwgbCikZE
X-Received: by 2002:a37:a507:: with SMTP id o7-v6mr40319qke.338.1532050548488;
        Thu, 19 Jul 2018 18:35:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532050548; cv=none;
        d=google.com; s=arc-20160816;
        b=N2Zehi7Gxa6d5xrFlHjtl0rxwbUcXFcEFlQ9E6ZiFEnPl7XvuPRI740XYBGYopSuHA
         juDidtIMWulgvcWtJzO9d1cNwD4ER5R8rjFXNFXnnL7/iLNQVcw0YyXT/SKxCmID8xRZ
         p3ewz3GBCl2hgNfmFaTafkyJaTYqVFJhGH0I+ZFtx7ujb/ftCV6Kva0lZ+3JzbDHSJVU
         ZExKydALk7ELQPJjDm2CXoU1wVVpFE084GBmy6xFdO/iZmaEoi/mtT0OqDTrSN9u6qra
         g7DPHsWEQR3IRbl1+WONczn2KUkHOpUeHHuWaHWqvsgMs3VjSr1NnSIYjhdPFQPgC24Z
         pjUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=QxNNFPsDgWcR0MqRQDpMWfAaod9+x890NR6m+Pjh3A8=;
        b=Zq/DeF2uknhy34HPKBUl38+fZ5RNSp+88/PT+0844dNcGvNrzSx/oWP+TADqBlgMgr
         WHRij6Ad9SFBqxFfU6joFjwjntP+Gx5tc9UaUVqpA9dDh7Zm8vok8eRLGepSdFFco9yG
         FK46XOOcOesbPx1COmkbzbstXYiuQcoPUoIWbBwjx7+kcowjgy4Vj523blKEqRo/jdla
         Pb4v7TlF1CvZefsHsrKQqYEcGu+Rog1Dwef4VHNXAexq0DK1SEVsJFIn6QF4JL4kgY00
         teYtBahrWsmJbkNrbnLEc87eV/AQw/7aWnkIor/ZgE6IRVTOvW5BE00S7nFjAvz7DZPr
         8eZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CwXH+j+J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i11-v6si697649qtf.37.2018.07.19.18.35.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Jul 2018 18:35:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CwXH+j+J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46020 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fgKKh-0001Tn-W4
	for alex.bennee@linaro.org; Thu, 19 Jul 2018 21:35:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39058)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fgKKV-0001Tg-EH
	for qemu-arm@nongnu.org; Thu, 19 Jul 2018 21:35:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fgKKS-0005nF-8v
	for qemu-arm@nongnu.org; Thu, 19 Jul 2018 21:35:35 -0400
Received: from mail-ua0-x244.google.com ([2607:f8b0:400c:c08::244]:38999)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fgKKS-0005n7-3O; Thu, 19 Jul 2018 21:35:32 -0400
Received: by mail-ua0-x244.google.com with SMTP id g18-v6so6467348uam.6;
	Thu, 19 Jul 2018 18:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=QxNNFPsDgWcR0MqRQDpMWfAaod9+x890NR6m+Pjh3A8=;
	b=CwXH+j+JRNr7HXyxDLutFqN0li77vj7Yhuz1+qvgLq3QKJs/pml7+8Wx0akv7Xya5r
	0XDEJ1+98oTZtDwId3Pyx89ezpQT0DhkuDY9QSl134yp2pL+7wDvT3LUzfdLQtb2sj27
	2BcjV+LgxOVLcV8Vu54HwPs8LbQGe0PQ3ssvv3QnLFHJXQEUWNl58NSe/gfSiGkLK+7y
	kHNAaXIzROfU+xjk9JaqHnV5qfM/0RFaqzMQJ9GRDs7v92nuydO/b+9oK64py7DG/g0R
	8bJKnJw1m57mVtjWm1nt2gdAekFA9yFEpZmRS22kgEITMjIPogoWkdfxxh/CpbnWYkiU
	eZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=QxNNFPsDgWcR0MqRQDpMWfAaod9+x890NR6m+Pjh3A8=;
	b=OjaJ+Bn3dxEnPf9qrd/Puq6msK/qJ/utg7+j4hWZ3zCjFyiFanfBSJuS5Huzm+dl/F
	Atz798RtWSpQDlLpJ+7x0khNR3N2sXvAZ18jJ0WW5PEqSK8ZGDd+z2I0aKN/T2Pqu1g4
	orlOm295TO1QgzPrZmdvytsvq0g0ePLQ51hzbdjbrN8KYJ06Ww/aN70z29INDyMvJKPc
	A7Ak47s/crXJiXHccNjqnI/P2iIawgkOfOCMPb8twEfKzPem4hdqW+lGXXP0XJLazJsq
	3grIeTLMiA8IRZPIR3sGlFp/OP9sjcMoCYkauze96NspgbIPFURytZvNDhvS28ltQLBJ
	llBA==
X-Gm-Message-State: AOUpUlFMEW0sP4pSYBgZaRn81FgHJCpTgQuhjKnLaeTeab3e6Dumrk8d
	eMhA1ehlyGc5Ua3kgWBdyCJzuBea
X-Received: by 2002:a9f:25f2:: with SMTP id 105-v6mr34154uaf.68.1532050531098; 
	Thu, 19 Jul 2018 18:35:31 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	e23-v6sm160001ual.15.2018.07.19.18.35.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jul 2018 18:35:30 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrzej Zaborowski <balrogg@gmail.com>
References: <1532006134-7701-1-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQI+BBMBAgAoBQI3aGSw
	AhsPBQkmUJgABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDj4yws3q3A3nS+EACxKosO
	3DZdwdVPXLVvSAA5y3Ohr2ByWN06RlVEkKWkOxm0lQ96LxBOZ03mDC+He/36DHaP+fujPBTz
	XjTXygWWZUtk0flDWR1w0a4yhX/JHfL5yloMZrxifCwouf2Sv9Yd6D46pzMeGsq8aCvbZYSf
	lDi3KXsVHc+jbmRwxtzJxz7366dsTC1tOJmjVSxc8bE55pHnPFOT1KKM9fxGWZFYx0UqAL/1
	NkrOKP5eXdJ51EhQa5pjivJw6dQlfWMQURG4o4e2+aLe4TkS2FI0r6nTgmoDmTT74u35NzZW
	Q3xjqcfqUX52+0drwlta22guNDbcJ4J+/I6FBF1C7CoSysBiIrldZQ6cJZ19st3jb7NHAoNk
	DcUt5I3gt4EpaiijWEEYAhw1/NSagm9bfn9veBqzVHNQrz76NZMiy2kP2vAxKOvo1XVlcEl0
	8MQ+IAUvYcLvU6yHRB4da7ts+ufqriNI5WBpvoLPRRa0wFDTj0nX/CfWFX9UkTwHA6/SWlhE
	hHau4xrpzFENwF5UDFtMkleo/u5Ipv7q8wYNs5JBpSXGmm4oSV9BbW0gp28D8fY4GGv1+6Dz
	BNDeuIdPf2NX0X55uyphpB0J4d70uNszAWXr7VqGOBbGrHcNHeT62BvoRd8bUQhaEyiJwOyC
	Ny4YIWW+I8W2wXkW+vSrZfEro2GZjQ==
Message-ID: <487a731f-9519-aea7-d70d-a8316fdca407@amsat.org>
Date: Thu, 19 Jul 2018 22:35:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1532006134-7701-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::244
Subject: Re: [Qemu-arm] [PATCH] hw/arm/spitz: Move problematic nand_init()
 code to realize function
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RmT3FTFdebYO

On 07/19/2018 10:15 AM, Thomas Huth wrote:
> nand_init() does not only create the NAND device, it also realizes
> the device with qdev_init_nofail() already. So we must not call
> nand_init() from an instance_init function like sl_nand_init(),
> otherwise we get superfluous NAND devices in the QOM tree after
> introspecting the 'sl-nand' device. So move the nand_init() to the
> realize function of 'sl-nand' instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/arm/spitz.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
> index 3cc27a1..c4bc3de 100644
> --- a/hw/arm/spitz.c
> +++ b/hw/arm/spitz.c
> @@ -169,16 +169,22 @@ static void sl_nand_init(Object *obj)
>  {
>      SLNANDState *s = SL_NAND(obj);
>      SysBusDevice *dev = SYS_BUS_DEVICE(obj);
> -    DriveInfo *nand;
>  
>      s->ctl = 0;
> +
> +    memory_region_init_io(&s->iomem, obj, &sl_ops, s, "sl", 0x40);
> +    sysbus_init_mmio(dev, &s->iomem);
> +}
> +
> +static void sl_nand_realize(DeviceState *dev, Error **errp)
> +{
> +    SLNANDState *s = SL_NAND(dev);
> +    DriveInfo *nand;
> +
>      /* FIXME use a qdev drive property instead of drive_get() */
>      nand = drive_get(IF_MTD, 0, 0);
>      s->nand = nand_init(nand ? blk_by_legacy_dinfo(nand) : NULL,
>                          s->manf_id, s->chip_id);
> -
> -    memory_region_init_io(&s->iomem, obj, &sl_ops, s, "sl", 0x40);
> -    sysbus_init_mmio(dev, &s->iomem);
>  }
>  
>  /* Spitz Keyboard */
> @@ -1079,6 +1085,7 @@ static void sl_nand_class_init(ObjectClass *klass, void *data)
>  
>      dc->vmsd = &vmstate_sl_nand_info;
>      dc->props = sl_nand_properties;
> +    dc->realize = sl_nand_realize;
>      /* Reason: init() method uses drive_get() */
>      dc->user_creatable = false;
>  }
> 
