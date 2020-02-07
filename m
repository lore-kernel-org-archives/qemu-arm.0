Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2092612lfp;
        Thu, 6 Feb 2020 16:21:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqyKPFR8BV57PGlORoIK3hSuJbzCEEfXAkYLXXluzTwPtQe453MrSj53VddUBN4yTH4h41gD
X-Received: by 2002:a37:7d01:: with SMTP id y1mr5167727qkc.452.1581034899166;
        Thu, 06 Feb 2020 16:21:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581034899; cv=none;
        d=google.com; s=arc-20160816;
        b=eM3naetTs/tKbtRxNMTAgRnwRT/9np8aDWxNGyCNRHIUhrP5/lbu83ttsuuC0Hx0o2
         AUgY7QHiWdExW8q+sQ5HhxiML92/scrAAU6fI2v4RW1NRr9sK5NZF6rPz902PSQ9kxg+
         OaRYrTQIgF2a8pLhJcD0XzMwt8wUg3PCqrEzNX1wTqX0reQs6r6HPHwXLr0z8ktleKhr
         DHkORs6Qvar0Q/6cgwbzbOQ2R+elURKP1zIK+e2cZ9uqN0weOcjaWzq5wacaHaSv6CTW
         r0jvmjOE6gQ/ZGTv+sstFCZKwISWE0MJuOMe49OVL0Nnm9VB8F1YXMung4PaRXtD9Ku6
         SPDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=s3Q4FUv0JvyibRsw6iAxeHyN5xi5kNpFADNMc7DiO3c=;
        b=V7GEJ+8kz5qgOW2QvpGwLSy9YQa4Ub5SV7qplkDqGNqC025+6E7cuVq17EaWKfnj9g
         8mUq5x0DwGxBKIeuXVoqrYapdCKPm1dYICDnc/QkXet765obu3KpLFdQHYc15Y/h3sfq
         uSb6zCBVC3DqpWusra0ap9ffzT4dHjhDbbsT+Z9gWhNp+CDhS44guG1SRBCwmH5Bqsu8
         +QHeu+8JPq2Xu8p7ChfjDD9cl5GcDlkJ9weeew9tlhpXWJa/9ppkddaj44a4SMImJB/u
         3gmMuHrrtnUD616H20NoCdcvO7NZGLJZ0Brk8CGJOoYuay0IFyKjm94ZGTnLdgIJ4ysf
         4lYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N4OKUDHJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x74si480454qka.199.2020.02.06.16.21.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2020 16:21:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N4OKUDHJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izrOs-0003Ik-JH
	for alex.bennee@linaro.org; Thu, 06 Feb 2020 19:21:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58140)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1izrOb-0003F3-AZ
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 19:21:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1izrOa-00008K-39
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 19:21:20 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:20278
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1izrOZ-00005X-VQ
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 19:21:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581034878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s3Q4FUv0JvyibRsw6iAxeHyN5xi5kNpFADNMc7DiO3c=;
 b=N4OKUDHJ0QPcjV4SFryXTyNc9kGP5DiBwfcinsXO8AJivhHoXm0FKkDKcIFaJfaOwvNfyN
 2cPtD8vPI3FIX3Zl4NfTSkbwEzu7HmudRS7d2EaFTAbJfex0Nis+T544VCJEt2sV9IaT8g
 o+yADt9RdeOT+1+RNEO2/ZWmeo2jYq8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-lniVAawKP_ipiD7mcxTvzA-1; Thu, 06 Feb 2020 19:21:17 -0500
Received: by mail-wr1-f69.google.com with SMTP id u18so325762wrn.11
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2020 16:21:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lLkZD4wBLDRhGKRYrPoACT34vqZqYhy2O17uqclLv0c=;
 b=kSR6BOY+i9q1HGLMskyg/faKt2o7Kh23fSsP9HAJekX2m/NCtJDmmiMy7n0yyG9SDJ
 blzYAvC+n5artF5OxQUnepTAN/Vwzie+kzlFhmOeUDsjtKRcOtmCSbpvbZwf/j0MqJVs
 cf53uDvzHQceWqQEtCRdhFhvRbEgXSpLNSb57gFvIxPNlxvUaMF56I2snHx1JxWZg6tB
 gMUutT2MdqEaI0V4VAAO/CcL9yt/v8nYIJxNvCTI5/s2YfroGlaamTKgLjQvpw3fA3Ao
 LZWxif+0BDQk9XVGf3TV7IzpQWQnMWUyBDRd1kxJQei6kyNOFZgPyOt7LiOb1bVDPS87
 uC7w==
X-Gm-Message-State: APjAAAVEkoprMXdAPz9OFei5cyr1Iv7kK16kkN9CdSIQ3TPI1VhjNGkM
 nrG7GZKcCAofnS2OquSquzgjbNLJ9Bpx+6p8C8FiBNSGFAZENtoFtSMvSMB207KpKF3RHmmYKIf
 +N9ZKV1uAOvtC
X-Received: by 2002:a7b:c3d1:: with SMTP id t17mr442449wmj.27.1581034875065;
 Thu, 06 Feb 2020 16:21:15 -0800 (PST)
X-Received: by 2002:a7b:c3d1:: with SMTP id t17mr442396wmj.27.1581034874696;
 Thu, 06 Feb 2020 16:21:14 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id v17sm1123352wrt.91.2020.02.06.16.21.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2020 16:21:14 -0800 (PST)
Subject: Re: [PATCH v2 3/4] m25p80: Improve command handling for unsupported
 commands
To: Guenter Roeck <linux@roeck-us.net>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>
References: <20200206183219.3756-1-linux@roeck-us.net>
 <20200206183219.3756-3-linux@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ad276d31-ae72-3349-86cc-6339ec250c74@redhat.com>
Date: Fri, 7 Feb 2020 01:21:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200206183219.3756-3-linux@roeck-us.net>
Content-Language: en-US
X-MC-Unique: lniVAawKP_ipiD7mcxTvzA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9uvTMujF5ptR

On 2/6/20 7:32 PM, Guenter Roeck wrote:
> Whenever an unsupported command is encountered, the current code
> interprets each transferred byte as new command. Most of the time, those
> 'commands' are interpreted as new unknown commands. However, in rare
> cases, it may be that for example address or length information
> passed with the original command is by itself a valid command.
> If that happens, the state machine may get completely confused and,
> worst case, start writing data into the flash or even erase it.
>=20
> To avoid the problem, transition into STATE_READING_DATA and keep
> sending a value of 0 until the chip is deselected after encountering
> an unsupported command.
>=20
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: Split patch into two parts; improved description.
>=20
>   hw/block/m25p80.c | 5 +++++
>   1 file changed, 5 insertions(+)
>=20
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 53bf63856f..8227088441 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -1161,6 +1161,11 @@ static void decode_new_cmd(Flash *s, uint32_t valu=
e)
>           s->quad_enable =3D false;
>           break;
>       default:
> +        s->pos =3D 0;
> +        s->len =3D 1;
> +        s->state =3D STATE_READING_DATA;
> +        s->data_read_loop =3D true;
> +        s->data[0] =3D 0;

Maybe self-explicit using:

            s->data[0] =3D NOP;

Matter of taste probably, but I find this order easier to review:

            s->state =3D STATE_READING_DATA;
            s->data_read_loop =3D true;
            s->pos =3D 0;
            s->data[0] =3D NOP;
            s->len =3D 1;

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

>           qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Unknown cmd %x\n", valu=
e);
>           break;
>       }
>=20

