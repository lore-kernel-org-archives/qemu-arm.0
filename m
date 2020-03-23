Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1620693lfi;
        Mon, 23 Mar 2020 08:58:31 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvIW2aHEvYAismHXn86ZJO3UEb3cnoqnLwCDz+zsic8QLHzuZ7q8ceOI6eAgfqXqFASpAeg
X-Received: by 2002:a0c:9e45:: with SMTP id z5mr13683221qve.250.1584979111264;
        Mon, 23 Mar 2020 08:58:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584979111; cv=none;
        d=google.com; s=arc-20160816;
        b=ERbF4SZbR5S5TneawLkid2r03ToXBBpeHTQhfz5q3iPCOvcocfpweKK8JhjpxZ0kgX
         iHiqWDe/lLrnsC47KlcYY4KAmkbKgeP9f/bKDQCY0VKqbYAxdT8tPIufVkOIRNJRe2vP
         4DdhhPNbEqmdx14ccW8Nbbx37yWFaFR2rfPptM6ADGv6vCm23j4Uxm1d5DtjRqzvanfG
         DX4r7DNpWYjyisgggGLjNkTWutVYeR9GF2WMCvyxaB5u5o6YJmCXldW0BWU+LTKuFPTo
         UAWQv/M5lXf4w9x27kUFGjgHeALptu9arqrkxcmDo/W95JD22Nl2PFAlXEx1b33Fyyj2
         et9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=M8YISYLxprjf1kzWXEpmDWYbQYJJMFlnRQMRu8MBWHM=;
        b=zrWdOyVzsvjUdSUFK9qU3AA0y41nXIKkh7baDzlJcQdCXI+TcD1uIse4l8cznH60IV
         +RFz5nfN60vyieSuL9VaYTGNx8FQc9t9EleXxUL1TKU9rnJM58c8kGM3oyo34ekjTl+5
         CzkEr5rS6z3jiVa+5xcx4wLKMmuyi7OUWLnSLgbrJUc1bmjnsnX3zfVH/gowplIW4Qrd
         cfB3oRYCxuMyi6JmMIBmhqli+kCCCh9kFTEqNhnKrWBAU9tjZODqDoJOmw0Z+fLmbYJ6
         J2tQxJckIpZvDbaXXTsrFvuzSWlo0wCzill9N8J+0JCoHZIJFwdnLSyugZa4SzylQoqb
         AZuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oXpHylHN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dy12si8431658qvb.137.2020.03.23.08.58.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Mar 2020 08:58:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oXpHylHN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGPTC-00014v-JB
	for alex.bennee@linaro.org; Mon, 23 Mar 2020 11:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59774)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jGPT1-0000v5-Al
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 11:58:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jGPT0-0004lu-9Y
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 11:58:19 -0400
Received: from mail-ua1-x943.google.com ([2607:f8b0:4864:20::943]:45101)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jGPSt-0004bZ-VI; Mon, 23 Mar 2020 11:58:12 -0400
Received: by mail-ua1-x943.google.com with SMTP id 9so5142504uav.12;
 Mon, 23 Mar 2020 08:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=M8YISYLxprjf1kzWXEpmDWYbQYJJMFlnRQMRu8MBWHM=;
 b=oXpHylHNOUaYSZg4fvvouJKGdNtzr/SSrOYYCcf7Q7Ptgln46YtSkXeZnTr1LCcCbH
 gBCntqBUz+MS2YdG6MTj1sTenrlTTJqnT7SEdbDHHmChJRfEX8oklwohLyUt/1zECjaF
 UgQNEfruFzk1mI+zCGCqCsffFep3PJmRYWZcF+vyIqMvLMVUvHmumB/iD8ncpGDptYlI
 cUYd8dGmfRYUKzWM4bbUCNacEGVHO7siMBbSUbyM6CfPeQUm/SWJbXV8C+Ex9ffGgF4f
 PVVAxv2xa/ybojMKz4099t+jOxK55TvVqIGo+fBGPrAinFeci+eNilikm6UMLe6G13xX
 dOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=M8YISYLxprjf1kzWXEpmDWYbQYJJMFlnRQMRu8MBWHM=;
 b=B6MD1GZqnkdd7mpXijcTFugC2pF1bpogRFvchFKf+CQiaaBwDcqv0t75WxM9ea24M4
 6BeOk1/v5xeVWuBLt5XnNVoIoazgUPde++suZiDK7MZCdh/Hp56IbbbYZ3GgT5TKSyWM
 4ep71QfiryOzwnDZiFAo+o46zMC82qLhpMBNEw+dZwr5wXtu4GQj/jnEpZWGkLgFRXV1
 HpgTSPrEoux222DXLmQjbl/L2CcPFsWIrKizzUqZnR1FUNOfoW1oHSyng51J+TNV8vWf
 R1AGnn+z8xE7Mb1fkntUf8Ed4vViMZSpZa4F7kWwUgznEnXSQuY4w1UTSor9VF/bCy56
 wcMg==
X-Gm-Message-State: ANhLgQ1NDXiDNJAbdWzLQl+Eoli/kP27zXMEZwBri9jL/N+oJakrrwDe
 CF9lIxmcta2QqUu6VDltVLZiWzpp1YHY1MIgk5w=
X-Received: by 2002:ab0:630b:: with SMTP id a11mr13904640uap.133.1584979091256; 
 Mon, 23 Mar 2020 08:58:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200321144110.5010-1-philmd@redhat.com>
 <20200321144110.5010-4-philmd@redhat.com>
In-Reply-To: <20200321144110.5010-4-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Mar 2020 08:50:13 -0700
Message-ID: <CAKmqyKNngiNFN7Q1+PRFSPKyg6xubmESFgtp7dkEjRM42bZs-Q@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 v2 03/11] hw/i2c/pm_smbus: Remove dead assignment
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::943
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rlRMDpqUMqPo

On Sat, Mar 21, 2020 at 7:45 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Fix warning reported by Clang static code analyzer:
>
>     CC      hw/i2c/pm_smbus.o
>   hw/i2c/pm_smbus.c:187:17: warning: Value stored to 'ret' is never read
>                   ret =3D 0;
>                   ^     ~
>
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/i2c/pm_smbus.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/i2c/pm_smbus.c b/hw/i2c/pm_smbus.c
> index 36994ff585..4728540c37 100644
> --- a/hw/i2c/pm_smbus.c
> +++ b/hw/i2c/pm_smbus.c
> @@ -184,7 +184,6 @@ static void smb_transaction(PMSMBus *s)
>                  s->smb_stat |=3D STS_HOST_BUSY | STS_BYTE_DONE;
>                  s->smb_data[0] =3D s->smb_blkdata;
>                  s->smb_index =3D 0;
> -                ret =3D 0;
>              }
>              goto out;
>          }
> --
> 2.21.1
>
>
