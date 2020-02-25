Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1543351lfg;
        Tue, 25 Feb 2020 03:17:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqx6KlyWWTLs/iTQOD+lI6j4yl/bEyIQQEUWTkOkIfNlOXCg296yvVx1Q3zavgkIFG9ZDz7n
X-Received: by 2002:ac8:7297:: with SMTP id v23mr53444737qto.135.1582629425484;
        Tue, 25 Feb 2020 03:17:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582629425; cv=none;
        d=google.com; s=arc-20160816;
        b=hUAoymP0wHXI+liFNBPS5lntQxbfugkFVoIrqsTZlk3iwIXR94KvXdnhC7hoRb9iUO
         YFV40PonyaL4i74UuCE8r1hVfr1QWTPR9HwDscWdfcqDA72JYur8S43BMvftoBIC5WlH
         PLK9bS4CZk85sTo+yftunnJsBKknZGd+8e7PwGqzC+VG58si6jc3vdTYuCBmFZMgiiE9
         fiFgVqfbA3UFuziB7cwlTAyglntWdHWk09RKwXaV4umqWfW6sMQ560AUfXEQQUT32zuG
         gzOO+9bJM59W7LCbBIiIXa2d60c2FyZFZJ4aYRq7QsSLxTn+Kxf5O76eYDWaC0JH67Ei
         L2Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=3BnY+u7s79rAmYLt+X2g5zqRZ/vhE6dNcKt11EC2/4E=;
        b=UeTMqnsiCPS3hhMDHDSEBclWwMomGoaHUgH4V1QxiAtCZ4YtNfWIo92/J4XA9z7Z6T
         owXYEEJeavSkFgixriXb62xQEQpLB3d2p6f2RSmdAA/CePTDpEQ9PvJ8KFzntTR0GoVC
         G5RIui5OdidM9N9x5JGt1xnPV7ps2HYnNfTZU4eeBOEEkI1iwHU4c9vRm8T/MszBGUhL
         rWN9tgx8iy2EAu6ek3Vm0RXj+kHb3AW7Bb9hI2dJX1T9gYqPLjy893W69wiLH5RIiNJ5
         nxwRMJYImBkInp+AXyaa1iDm4uZ11rCQ+jmcQqad3msRPPPua8kMNd+WKLAYGGybmVvS
         JJbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="heVOrsH/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y185si7616686qkc.171.2020.02.25.03.17.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 03:17:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="heVOrsH/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6YD2-0007yH-Tk
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 06:17:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40937)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6YCp-0007xO-26
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 06:16:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6YCl-0006jg-Da
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 06:16:50 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45982
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6YCl-0006iJ-9X
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 06:16:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582629406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3BnY+u7s79rAmYLt+X2g5zqRZ/vhE6dNcKt11EC2/4E=;
 b=heVOrsH/fE/LOHo9rei3rKHCNgd5b8XzPbMfs1jwUvJjn+mb7BWuIIg09spM7IwzDGDLrV
 wtREqeThCHTFaMkC/6oHrSKvWG1OliI0gX1YOzKpB0ciVZXjlOUVkmzH9z25npdh5tSf5h
 Tk9ulE5E2RLLjZX+5obPr+HETfMUy48=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-BZ8oQJ4vM4OLUJIXuY2eVw-1; Tue, 25 Feb 2020 06:16:44 -0500
X-MC-Unique: BZ8oQJ4vM4OLUJIXuY2eVw-1
Received: by mail-wr1-f71.google.com with SMTP id m15so7097274wrs.22
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2020 03:16:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mybTY2JMYN6zflQVzeyGn4UvK2wvHyf2BrGcCFX1Jl8=;
 b=TZqwZCDE4JwyGBKPNbKimMQSVnw/Zmi5/xUHWcmjZXcNY3C8z8G4d3D0l71QRI1U9Z
 vQDAJ2drfqKxG+0DaEAY24AOrwXKKGI2fOKQmk23MrH1avFQXP3XaIWqqlarIGsdEw9n
 9Orwujb4jV/cqC+rm19ggQNudZ0zbYIQ7+XwBCzCI2wKXO84vD1zJdY/G32/0err1Xr+
 K1Q7pVHYIcgmR3/P80rpxrGy03UYu5VK3WTfNLyWFlVpVaDxD4dIK32u4atQ63bzzCg1
 7GN8m5sffY866lpMorRw5Kg4bjEhmwLAHn0ezQpbNE8UComLhvoZ1W5qKRifM58B+KAn
 9NgQ==
X-Gm-Message-State: APjAAAUGTchz2a9XiX8Wtv0NRGrbzMMjGK8qAdseiMfwVZWmk4z46wKl
 0tnjJ/lsYc+uGRTAYu9x06BeWzQcAZTihDJiQdVGtTNoWlog4jOzPMY8v9MwtgXXjLVXIOyeBE/
 eEITDULXSejKU
X-Received: by 2002:adf:c445:: with SMTP id a5mr1777292wrg.14.1582629403709;
 Tue, 25 Feb 2020 03:16:43 -0800 (PST)
X-Received: by 2002:adf:c445:: with SMTP id a5mr1777273wrg.14.1582629403547;
 Tue, 25 Feb 2020 03:16:43 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id r6sm23898793wrq.92.2020.02.25.03.16.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 03:16:42 -0800 (PST)
Subject: Re: [PATCH 1/2] hw/arm/gumstix: Simplify since the machines are
 little-endian only
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200223231044.8003-1-philmd@redhat.com>
 <20200223231044.8003-2-philmd@redhat.com>
 <CAFEAcA_H7aWjtoky=o2uKpNjZnebuskn-fFUMXbq=Gja5vyaBA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9ac5c707-c34f-b374-d910-e5d73ba8c327@redhat.com>
Date: Tue, 25 Feb 2020 12:16:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_H7aWjtoky=o2uKpNjZnebuskn-fFUMXbq=Gja5vyaBA@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SeTBaxKiVf6a

On 2/25/20 12:12 PM, Peter Maydell wrote:
> On Sun, 23 Feb 2020 at 23:10, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com> wrote:
>>
>> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>
>> As the Connex and Verdex machines only boot in little-endian,
>> we can simplify the code.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>=20
>>   static void gumstix_machine_init(void)
>>   {
>> +    if (target_words_bigendian()) {
>> +        return;
>> +    }
>=20
> I don't think we really need to do this, do we? We don't
> in any of the other arm boards that just assume little-endian.
> I think TARGET_WORDS_BIGENDIAN will only be true on Arm for
> the BE linux-user targets, never for softmmu.
>=20
> Also, there's a warning comment in the header file for
> the declaration of target_words_bigendian() that says
> you probably don't want to use it...

Yes you (and the comment) are right, we should not use this call in=20
target-specific code.

>=20
> If you drop this, then otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks!

>=20
> thanks
> -- PMM
>=20

