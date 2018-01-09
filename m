Received: by 10.28.173.206 with SMTP id w197csp3881511wme;
        Tue, 9 Jan 2018 08:28:43 -0800 (PST)
X-Google-Smtp-Source: ACJfBovu/gEdG4p6ai3uuFqc/dfi1rPKrmAdheVIe9p9e5FOQCtCtZQH4OrDXhXl+A5EDsULN12r
X-Received: by 10.37.128.77 with SMTP id a13mr14322306ybn.174.1515515322996;
        Tue, 09 Jan 2018 08:28:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515515322; cv=none;
        d=google.com; s=arc-20160816;
        b=04p8SwleaeOVC9IGQotLwIGXzbByai7QNTxgksR1VWKojg4P/PDC/fMPnizxk/aKXS
         xwphvbMPW8XDZomrqtoWk8xnJ6209YfPNDy28fMiLC+HJY8O0ByZrKU5YSHa7yd0jEF0
         K8763G1WITW6FUdYzmKqlS86QvH1OZWcNJfgrwM67zfOqPbtdmCdhh+ackNbYzjLO36d
         oHuydcMaEBdpkI9/ytQV0KaJoC22vhBZNutqQZCUlsXTxGHOFXwZwuFHn6UNJ5onJ9OV
         tFHlsakUF+jRHYK7Wk/Fc/TD1MTXAU6SeCHDfYLM6dpYmwGO2lx2fSBFsXzZCv2WSYtC
         lIcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=maylas0vZnEtDTRECbrViA93mg1TBRDRdh0g5vatZho=;
        b=VHtUiUv5fS80yEHEsJEEIXi7Wq+rFu95TeB4fVmIHx5wV9tUwlBag5tFOvoY9dycE+
         6J1zUpPzRRm9KhiShkkFSZgUFU+FKWFH1i0NIEYrgUzgSSq6IWxTi3L/eTuSEsx3kjmP
         Sra692jW1dpflC3TfBTTOcvO6UEi3lJ62GKcFUAcw2yMY0p/8y9rJMnoAonBv5nipMLl
         vfD0AY8dqTXVIJpAyNe3Daf93E8vZOXkTVqCjlHTCOlsKJzchDOxEw2C59MsVpZXiiYd
         TyLcqeeGQx5INRco6dv4RdwrINFBkDRIbT7NOPmMd5F94jxk6ietaMxY36Q/TrpTNC3T
         uTxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H4y7wLiI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t205si3032112ywb.598.2018.01.09.08.28.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Jan 2018 08:28:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H4y7wLiI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32775 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYwlW-00078u-D6
	for alex.bennee@linaro.org; Tue, 09 Jan 2018 11:28:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYwlH-000774-N8
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 11:28:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYwlG-0001W3-Om
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 11:28:27 -0500
Received: from mail-ot0-x235.google.com ([2607:f8b0:4003:c0f::235]:45470)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eYwlG-0001V7-KS
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 11:28:26 -0500
Received: by mail-ot0-x235.google.com with SMTP id o1so11792271oti.12
	for <qemu-arm@nongnu.org>; Tue, 09 Jan 2018 08:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=maylas0vZnEtDTRECbrViA93mg1TBRDRdh0g5vatZho=;
	b=H4y7wLiIu3pHovJEFca/xMdschO2yv0n7o/OoBlHugrMw0AZc6JSzkur13N0471+C/
	YRArwvtwFTQXeFgYw+q66xK5BXeUoYxSubb/n8ocfLgLSPDKiKyR0HfumRjd4CRJgy5G
	adwVG3KwvYUhTgddNNqRDvFhd3XgBxXgYclWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=maylas0vZnEtDTRECbrViA93mg1TBRDRdh0g5vatZho=;
	b=ai+njOghSIU/dGFVw/Zn27frXcdVluWCFsIlZO2LVdjt1wITcip5I337iTqGDZqq87
	/FT2RoDfNodjGtGgOOeOLdp5x3TH+1qE/gWM77GGoQlkxSK4XInlgi7ytuLlXZJt5RUl
	WH6XWXCuwX/Ba/u/giCQq55f7/sOSbcUgu/UQENUswGqTb6aj7NnEuApibTW1VhJyRld
	tnZISnYzrPeyCj2SZYiXDlup5OoupSoLCHlXd3mwQ84snd+XVFNmu3haBP3u6PfQruyj
	u0o/RBT4g+iEjy3w0HYn+RXYYQlXxdkvXH4YHCCsm03IoupQNP/lrtK9qJUmx6wg3WcW
	/LFw==
X-Gm-Message-State: AKwxytel14/TCX2JdjdVIQgvOIC0HWe0I7YP8D1/gyIubIm6Tk7Lg/HF
	t76JzzIAwlA5XlNhQqT8LIbpoJmSpXy/SylaWQZS1Q==
X-Received: by 10.157.52.215 with SMTP id t23mr943523otd.54.1515515305855;
	Tue, 09 Jan 2018 08:28:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Tue, 9 Jan 2018 08:28:05 -0800 (PST)
In-Reply-To: <12647bf7-eb9f-889a-76e0-32fb1f799160@amsat.org>
References: <1515506513-31961-1-git-send-email-peter.maydell@linaro.org>
	<1515506513-31961-4-git-send-email-peter.maydell@linaro.org>
	<12647bf7-eb9f-889a-76e0-32fb1f799160@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jan 2018 16:28:05 +0000
Message-ID: <CAFEAcA9Gd6qLqFfrmzj4w69=SozWyP8D5mbGSaGEvw0BhwnyjA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::235
Subject: Re: [Qemu-arm] [PATCH 3/4] hw/sd/ssi-sd: Reset SD card on
 controller reset
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>,
	qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JyP+mRK03UEK

On 9 January 2018 at 16:25, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> w=
rote:
> Hi Peter,
>
> On 01/09/2018 11:01 AM, Peter Maydell wrote:
>> Since ssi-sd is still using the legacy SD card API, the SD
>> card created by sd_init() is not plugged into any bus. This
>> means that the controller has to reset it manually.
>>
>> Failing to do this mostly didn't affect the guest since the
>> guest typically does a programmed SD card reset as part of
>> its SD controller driver initialization, but meant that
>> migration failed because it's only in sd_reset() that we
>> set up the wpgrps_size field.
>>
>> In the case of sd-ssi, we have to implement an entire
>> reset function since there wasn't one previously, and
>> that requires a QOM cast macro that got omitted when this
>> device was QOMified.
>>
>> Cc: qemu-stable@nongnu.org
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  hw/sd/ssi-sd.c | 24 +++++++++++++++++++++++-
>>  1 file changed, 23 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
>> index 24001dc..30d2a87 100644
>> --- a/hw/sd/ssi-sd.c
>> +++ b/hw/sd/ssi-sd.c
>> @@ -50,6 +50,9 @@ typedef struct {
>>      SDState *sd;
>>  } ssi_sd_state;
>>
>> +#define TYPE_SSI_SD "ssi-sd"
>> +#define SSI_SD(obj) OBJECT_CHECK(ssi_sd_state, (obj), TYPE_SSI_SD)
>> +
>>  /* State word bits.  */
>>  #define SSI_SDR_LOCKED          0x0001
>>  #define SSI_SDR_WP_ERASE        0x0002
>> @@ -251,6 +254,24 @@ static void ssi_sd_realize(SSISlave *d, Error **err=
p)
>>      }
>>  }
>>
>> +static void ssi_sd_reset(DeviceState *dev)
>> +{
>> +    ssi_sd_state *s =3D SSI_SD(dev);
>> +
>> +    s->mode =3D SSI_SD_CMD;
>
>> +    s->cmd =3D 0;
>
> Not necessary/useful since s->mode =3D SSI_SD_CMD.
>
>> +    memset(s->cmdarg, 0, sizeof(s->cmdarg));
>> +    memset(s->response, 0, sizeof(s->response));
>
> This might be cleaner to move it in ssi_sd_transfer() case SSI_SD_CMD.
>
>> +    s->arglen =3D 0;
>
> Not necessary/useful since s->mode =3D SSI_SD_CMD.
>
>> +    s->response_pos =3D 0;
>
> This might be safer to move this in ssi_sd_transfer() case SSI_SD_CMD.
>
>> +    s->stopping =3D 0;
>
> This might be cleaner to move it in ssi_sd_transfer() entry "Special
> case else s->stopping =3D 0;"

I felt it was easier to reason about both (a) whether the reset
function was correct and (b) what the state of the device might
be at any point if the reset function just cleared everything
back to the state it's in when the device is freshly created.

thanks
-- PMM
