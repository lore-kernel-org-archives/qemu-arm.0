Received: by 2002:a17:906:3953:b0:a3d:1c09:7d3d with SMTP id g19csp789754eje;
        Wed, 14 Feb 2024 05:39:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXMLgd17RkZ+I9DiUtIKmWOeaw1WHbojLDPlgFgm31TuquyH5A99N12q1EntJ+0wm65k/fozPj+sh5hR/eQK+GgqENs8yFe
X-Google-Smtp-Source: AGHT+IGknJAP3fIcvQQWhVHkJefGto9nZvs89yFLVRoQJ1pC8OTPZtCiccs+U7st9mK4JsHVYIak
X-Received: by 2002:a05:6808:2017:b0:3c1:3427:fef3 with SMTP id q23-20020a056808201700b003c13427fef3mr225760oiw.48.1707917981879;
        Wed, 14 Feb 2024 05:39:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707917981; cv=none;
        d=google.com; s=arc-20160816;
        b=J5ANiMUAbBZujrqhYFYsmB3Fqf7itI0rslFeqkGizmU9JL61bhHpFjnZ2/RCisEjgD
         pwE0O/mSrjr/JsUjSvDAzcwYebgka0Wg7XxJRGG7CQ8gKCQk/Hj8BqNPrfSP2CdVH9um
         PA3m+HfkFHtWt9RhC8m3YnAQqksNuZVBnL7dgziCSkDKehc4m0m7jQr5+MLaw7L8fBTF
         oS+4pOE4NJECUpeMc6RMMxm+4u34P8Iq43/iV5DgUO75qk4hvGRjipjiPp02Avp/2qre
         mfpJIgbK2c0qYOdZiQwjsTqoLXfPgMT3uqFYLL94/jPnpd/xsAlhU+ORjwqO6Zj+TxMg
         h4ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=LggHhwi3m1WRsUhddvjIokNLKTx/WSiLR+NxAO/q2io=;
        fh=VinsWtbQxrJvEnHuCpT0M4iShEhrtWr+BSRgthRZfYg=;
        b=ft+E3mD0sKbOYX4KI01CJ3wmel1wy5jO13X7Ywf2blwya4PwMLBqoOYuZIb95j+EGZ
         578up5sMuDXiAghRX9jytL0PzJbV+A2oaeJgURJITvVVgpwvDZOmBxbMtdhcKtotbCls
         yi6kb3hr+Oow0xWoShDF+s070XY1D3jT5zKLtUth8nbN9NUDMIag+KIblLX3/VyZ/QEy
         w2jUKOiahyIWXTkKV58BChkf7M/lnTbAR6mtg2rF/gwBhP8rUO/ZMBOHDGTc7kqliMjy
         zVT2vE5x1LSXb2GCWBeAhbJNU3XPbmmcRgXta40ZNfiH/9qcnkelBZk4RLj+szFJkru0
         kodg==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UvUxQ181;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCXLax7ZgauQLq4Gct8uE7b5XKCY2MEGtMeAL61jpppTgkUHFPcSD9H4zParqUIQ4iHUUKsnFx9zhZjSl3zDxMJzGiJ74gSm
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jk3-20020ad45d43000000b0068cbcf48e43si5726323qvb.49.2024.02.14.05.39.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Feb 2024 05:39:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UvUxQ181;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1raFUA-0004RW-FH; Wed, 14 Feb 2024 08:39:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1raFU8-0004Op-5y
 for qemu-arm@nongnu.org; Wed, 14 Feb 2024 08:39:36 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1raFU6-0000kV-Ez
 for qemu-arm@nongnu.org; Wed, 14 Feb 2024 08:39:35 -0500
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a2a17f3217aso705577466b.2
 for <qemu-arm@nongnu.org>; Wed, 14 Feb 2024 05:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707917972; x=1708522772; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=LggHhwi3m1WRsUhddvjIokNLKTx/WSiLR+NxAO/q2io=;
 b=UvUxQ181Eqo1G06DgGbKG+mVHxkqTj0fPDddrM6j2SAaGd/eoM5EUDyt3aqqD6wMN0
 r06dIWyLc+R0TfktADrnAl5IR0yQ2LSMBxw0JQZMSRv2pyFqX8W2+5pG9dRnwF/Ia0zT
 5vxL04z1Uwns7f/oXIuqJKgYuBL5AAWCLR4cR4IZ1Z/SbRGesrSLw2ebFlNz0xBYf2zt
 iQKVYfoqyl5vMsOdZEuw6bHy2uwau6zUph8nhr6iTrZ7rHD7IZ1UDYlWB7y2SmNTuVDv
 7tqypDFiTNxJ79mQrvKsfeyzg8WyF715+7ooBdDAtsK0gmHMtHm+glB5a7enG8IitS+N
 bYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707917972; x=1708522772;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LggHhwi3m1WRsUhddvjIokNLKTx/WSiLR+NxAO/q2io=;
 b=cY27wp7JRJ7f1NEtQ5jqJCElBq4PbSFscJ6fKKx5TK1yjfDBfC5XKUWbHprA0AJwE9
 dmYrh/Ie3566Z/6zMazXenrhFun/oPaDzfhkMosTJbSj//2vJOR/XFKjRfgKUCwYrFa1
 Or8+2XpkTuAX4Y35NAi60tq8ju70sNApICu7KPVhhm1I9KkC6cNSsg/B5T/gvyimsfa7
 FrqJ7Rm9ap1VvkV4TMn70iexj3oFbGduz4dURoWMc8MdkS6MsywZ8mIUyt91A75XJOkT
 7IsIPxUBcyX3+Q/kib3K+oGbM4ldFv5FFRt0tU81a4XUVQh1nbjROZaLRF6yyU6UIXpP
 HDAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfQdLeUd5nPeit7yjacEL+sx0R3gQ3u75V2h2NdP0FR7QlLrdH9yI7aLKmeuw0ojDLQd2qcXeSi+Pme4z7KEGitQI5
X-Gm-Message-State: AOJu0YwRNhd+ZHAqbNva99MiPlNlIot0leYs2q83zzwp6V99IhN3b3CX
 YTMFTg12WzRKSb7rj7ZROJQyHkiDsp/t0pwvzJxcUs2/tBf6VXls8T8H9iXcdU8=
X-Received: by 2002:a17:906:5589:b0:a3c:edf6:a735 with SMTP id
 y9-20020a170906558900b00a3cedf6a735mr1936289ejp.47.1707917972495; 
 Wed, 14 Feb 2024 05:39:32 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX0tgkHYOIoiME2Z+tJNPcYcVzP/fojlHePP5zXMs6K2bBngkU0lk4Gmu7Is0ep84jGi534r0JEwwiSwDSKc3QmcDn8TysnM6YcepFmZNjpZArdIXY+AI0pGq4l4XzPbUyQJ5efXI6dJqA+v2Jxt3WZrJ8/3YbxbD2OVug9GwYKPqWNR6UztA9/JadzVO4KJldLOJnxHwa6zQiSGuQ7XGJn3ZJ/Hg9MGJ6JWkx4ox7r2RoABvQsVNtV3SUpGAwhKQCAiiAgH5jW0eVlNlmO/54O8vGHYhno5Msr8h5RjvhKA+RJePKH2JJbWv5QcXIioF2AekpK6MOKZP5dQAUkR72K0MFDiMKzLJEJlMytIQ1RQ4tK0hAkn1p3OZDrPelBEptnr1gRydW/dXWtI9FRs4hZ6VkAunAXWnAq3Z7BcblHqZdHqQ0gnzaRiebGuAflPGTQHXaW9dEk8hvbm56YgDjA8iaTb87h9Az3GntkAPWsNd49DrWxW0rVfa1C3YcpwT5x+mzS7Nr2Rpt6Qths
Received: from [192.168.200.206] (83.11.29.216.ipv4.supernova.orange.pl.
 [83.11.29.216]) by smtp.gmail.com with ESMTPSA id
 tb16-20020a1709078b9000b00a3ce9081547sm2051268ejc.39.2024.02.14.05.39.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 05:39:32 -0800 (PST)
Message-ID: <4781f6c5-4a0c-4b24-bf8f-5fdc17b074b2@linaro.org>
Date: Wed, 14 Feb 2024 14:39:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: possible deprecation and removal of some old QEMU Arm machine
 types (pxa2xx, omap, sa1110)
To: Dmitry Baryshkov <dbaryshkov@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, paul.eggleton@linux.intel.com,
 Andrea Adami <andrea.adami@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Daniel Mack <daniel@zonque.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Stefan Lehner <stefan-lehner@aon.at>
References: <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
 <fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net>
 <CAFEAcA-bqOM4Ptws-tsEwo2HDZ6YSX1Y+xGkR0WueRD_dUd0+Q@mail.gmail.com>
 <7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net>
 <fbab8e59-6d2d-4193-a5ca-9fea3c524229@app.fastmail.com>
 <CACRpkdbmJe8ZE7N0p_utWucyw+3mp1Qrb0bQEKcJPmwNFtVA_g@mail.gmail.com>
 <CALT56yOT_U9jVkhTP=zZu-32B4pta5zaJocn9695N7ari4cFyQ@mail.gmail.com>
Content-Language: pl-PL, en-GB, en-HK
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <CALT56yOT_U9jVkhTP=zZu-32B4pta5zaJocn9695N7ari4cFyQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sfCSBE2Eedts

W dniu 14.02.2024 o 1:26 PM, Dmitry Baryshkov pisze:
>> The thriving world of PostmarketOS only exist because Google was
>> clever to realize devices should have a developer mode.

> There were two projects that worked on reenabling phones and PDAs from
> that era, hack'n'dev and handhelds.org. I think both of them were dead
> when the Zaurus was still alive and kicking.

I left handhelds.org developer community in 2007 due to trademark wars 
when admins wanted to take control of several projects hosted there.

LinuxToGo was created in 2006 and some projects moved there from hh.org 
server.

Most of OpenZaurus/Ångström developers abandoned Zaurus devices in 2008. 
Usually in favour of Nokia 770/n800/n810 tablets.

Both OpenZaurus and Ångström used own hosting in handhelds.org era.
