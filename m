Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5798633lfp;
        Mon, 17 Feb 2020 22:37:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqxKWZ89r6KVtl+kxtrWpEEZk2oegkL2AJv3LU3gY8PDU5fIkgBFpdYKTKV+Lr4Pgl3u+Th4
X-Received: by 2002:a05:620a:100d:: with SMTP id z13mr17766377qkj.266.1582007879021;
        Mon, 17 Feb 2020 22:37:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582007879; cv=none;
        d=google.com; s=arc-20160816;
        b=lhTosSkh/W+9suuLrsCNka9XEEuW/I8dIcz1GEWlmEuru7EkzsKu1UG/7K94RqaUAg
         WzU4ObrF1Tt4pPSHvK8fxzA1C5FA6DcZBUSc3B1dSCi5zBfLIZE/qd6uIuQQKfwDLCK2
         oGzlp+M61KgcyKRm2je/7Aj3ph0dw4b5+YZgKHBsaDBsJwXMBkxdIevk5SNHPfUXX2su
         +WQfNHqM2HxbKsxws/OadWOTuj/v8Pc9kBIZNMXw06hZSWYmHtoiknmcyukzdWcsA6BW
         z42gxFASq/rmTh0tuSEOnkr7DAJNALYaQ1AXXE+jDSMaIh+wZJRca18+PEh8NNfar1M0
         oOCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Kk+AsAz6XiAvxVlVydRbGv1vQ0eTkYRksDPBW/NRObI=;
        b=tw8t6kFgYXnvr//egorj3UeTCRhFxEMnrEMmXTrKnNqhk+Unm6Tc1JVSgTWsxxqqC6
         RKvbNLKRdAP11yVkAcJtp7AgHF4qrI15p6RS0uaDett7+vKCcGGTrFQuRfcxWgSma8Iv
         nnx1zRb1bAeRZhTZK4AY28y5g0N4z6LMVz0oYIAeHgr1X7Icxh2E7ImykSv5FxRXlk0D
         N7lI9nOZ4QD+x6m6DBLWvJNwvbKdWFB5RHmWiSyGXEqaqyOunD8KZzxQ6VXHPLjdre7l
         AwnM8FH2kH/fWWnxBiKn1YWMMXR7oOoD8pgDCpWtc3T5gzyi0fSOLNVJbZDmJjCgo8rI
         2y/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XBIFuIb3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q65si1471361qkf.0.2020.02.17.22.37.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 22:37:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XBIFuIb3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3wW6-0004Af-EC
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 01:37:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49297)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3wVz-0004A7-Dg
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 01:37:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3wVx-00089h-DC
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 01:37:50 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:60004
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3wVx-00089N-51
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 01:37:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582007868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kk+AsAz6XiAvxVlVydRbGv1vQ0eTkYRksDPBW/NRObI=;
 b=XBIFuIb315lUEK/fHO6lD1KPslifm+/5CaVQvTDw2ZCPI/G1zgFdnZGBxBgpQsyiKXud34
 QBte+LlpvkLaidMBsHQpU1EJSeHwd5fo7ZDKFDlpHyJupmmE9e62Zm7XsecNojxzFZL2NC
 16ss2acCcEvfNCayfXCvEKMK0MYS5QA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-fruXd_H-O02nuQb7IXt2Wg-1; Tue, 18 Feb 2020 01:37:46 -0500
Received: by mail-wm1-f71.google.com with SMTP id n17so610281wmk.1
 for <qemu-arm@nongnu.org>; Mon, 17 Feb 2020 22:37:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zr4F/r9gq3V47vNBUvQLhxt9Zpw/a79sMTFDSyjzjMk=;
 b=LCyI8lEkjaNgPzeFPtfy/QNhiuwa7/oWRKze8A42PNfWDh0uuDdLgcCDj+KlIjP5pF
 IRxwgDGVzBBOOp0xacaiX69qoHUtEtDNBt82f972BQeNvH2Ga3hUtnfV5iMg9YPT/X0g
 dLy3eDrnbWj8z+K3h48ENAvU5HBCzMmK9sb9ZaAhdWF1IRJuAPCahAtVJjFyTgEYnbak
 DRQgxrEfnW5lOy78PGTz43cc0nEeu9PE3/PVUv2q0moXXRSWEHpUhCKKD4/xBsRmhGpJ
 lJ7X/UIagWai7nwaV1geUmpVVymYULKYj0m7cwX2DtQGETfeFNjiYXsFbyauyDrOlfze
 zlZQ==
X-Gm-Message-State: APjAAAXgTQvlB4Ae4ykEZON+YfQIaQuZDA14FEfMwrjcf3rwvBF5eSc6
 cIGlQl7RfzNzAqxnKSrog3I/2Yg0+p0iV79z0WLmj7onn4kSWQSBUTGvYT9hV3I6eMDvS4E6XuY
 jq94N65u6Q7fK
X-Received: by 2002:a1c:f003:: with SMTP id a3mr1124750wmb.41.1582007865050;
 Mon, 17 Feb 2020 22:37:45 -0800 (PST)
X-Received: by 2002:a1c:f003:: with SMTP id a3mr1124731wmb.41.1582007864846;
 Mon, 17 Feb 2020 22:37:44 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id p26sm2208390wmc.24.2020.02.17.22.37.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 22:37:44 -0800 (PST)
Subject: Re: [PATCH] z2: Make providing flash images non-mandatory
To: Guenter Roeck <linux@roeck-us.net>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200217210903.18602-1-linux@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9854376f-eb4f-2456-de03-52c72b810e37@redhat.com>
Date: Tue, 18 Feb 2020 07:37:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200217210903.18602-1-linux@roeck-us.net>
Content-Language: en-US
X-MC-Unique: fruXd_H-O02nuQb7IXt2Wg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jy3+SawQ+Dz1

On 2/17/20 10:09 PM, Guenter Roeck wrote:
> Up to now, the z2 machine only boots if a flash image is provided.
> This is not really necessary; the machine can boot from initrd or from
> SD without it. At the same time, having to provide dummy flash images
> is a nuisance and does not add any real value. Make it optional.
>=20
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>   hw/arm/z2.c | 6 ------
>   1 file changed, 6 deletions(-)
>=20
> diff --git a/hw/arm/z2.c b/hw/arm/z2.c
> index 34794fe3ae..4bb237f22d 100644
> --- a/hw/arm/z2.c
> +++ b/hw/arm/z2.c
> @@ -314,12 +314,6 @@ static void z2_init(MachineState *machine)
>       be =3D 0;
>   #endif
>       dinfo =3D drive_get(IF_PFLASH, 0, 0);
> -    if (!dinfo && !qtest_enabled()) {
> -        error_report("Flash image must be given with the "
> -                     "'pflash' parameter");
> -        exit(1);
> -    }
> -
>       if (!pflash_cfi01_register(Z2_FLASH_BASE, "z2.flash0", Z2_FLASH_SIZ=
E,
>                                  dinfo ? blk_by_legacy_dinfo(dinfo) : NUL=
L,
>                                  sector_len, 4, 0, 0, 0, 0, be)) {
>=20

Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

