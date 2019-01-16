Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp315057wrt;
        Wed, 16 Jan 2019 00:33:27 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4aYGDEsmnZFuJSJ6S3pet/j/o3ULEDRi2UsUg9e3H8kHfQp4OHgFlB2OjpI7QYyC0h8MMu
X-Received: by 2002:a1c:ef11:: with SMTP id n17mr6391054wmh.112.1547627607710;
        Wed, 16 Jan 2019 00:33:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547627607; cv=none;
        d=google.com; s=arc-20160816;
        b=VfbmAXYliQF8c/f7PCY4bAIP8GD4mD3p5k2BEwrRxm6A+djvIAUxkWsA4v0LnsNbPd
         y9KiNXC20P24cb7jJ6/jLnNUaZSHb/t6rqYBzFkviqCf7g8wWgpciS1drBAYgRVX5RZ8
         Iz3JxvXaAgor9CY6IRzWRE7fnnM0xXJiCNSTRfdA+4sXVXFArP3Espj6O6tBSPvg0XGX
         PZU71ZCkwb8VYrXM6HY3UP63WnkSirZIhgO+ujWTj5xQ8BQeDf48qI+lJLO+mkFLT0o/
         po/mQ3oqhGSDknjc6D6lYtbparlp845r8en7ijXsPxJkKCTzAQjevjBqWDE6B4vNZdBD
         D+MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:to:from;
        bh=XqitpDHAlBB7lrhEreIPh98bMCj8b1lDomZa+76dNcU=;
        b=SOlwuMaKCCVu7TLXLwxpqOqNRvqcH8Yr8WL4qheXgLc/tkA1ydog1NmBwF07fu8RK4
         d8QL4Lnl4/OUiIg5gdMyTAWj3/ufPCefDnHbjHBTI1CkX7W6ZCZ1WNDraXlcfYcgmC1P
         KeQoUqlnGfDA9aeiqW25k4tRRml5Hefj+KtdMhMBhSx3soR4rWSUEXYXkMguRN3Yvexm
         Mg02I+pRa/v6765LVrCaw7NYyorjw/msGCIOSGy/PQlM5mb/GHLiqwKSOSG5fiTwisLE
         D9ifQNLBBvyfU0qDq66KCrgTRezadL/u0pM4C6sQsV5Tzh+O00lXB3QOYycV4BgtbS9g
         gguw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c2si24675442wmk.151.2019.01.16.00.33.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Jan 2019 00:33:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:48803 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gjgda-00066Z-P6
	for alex.bennee@linaro.org; Wed, 16 Jan 2019 03:33:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gjgdQ-000655-AJ
	for qemu-arm@nongnu.org; Wed, 16 Jan 2019 03:33:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gjgdN-0000O6-Bv
	for qemu-arm@nongnu.org; Wed, 16 Jan 2019 03:33:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:31545)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1gjgdL-0000H2-UV; Wed, 16 Jan 2019 03:33:12 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D5244C057E00;
	Wed, 16 Jan 2019 08:33:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-32.ams2.redhat.com
	[10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C328D601A5;
	Wed, 16 Jan 2019 08:32:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 3AF1B1138648; Wed, 16 Jan 2019 09:32:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20190111140857.4211-1-philmd@redhat.com>
	<20190111140857.4211-4-philmd@redhat.com>
	<875zuqjea7.fsf@dusky.pond.sub.org>
	<f907c7b9-5eed-e604-d0da-b7a3265fc1bc@redhat.com>
Date: Wed, 16 Jan 2019 09:32:57 +0100
In-Reply-To: <f907c7b9-5eed-e604-d0da-b7a3265fc1bc@redhat.com> (Paolo
	Bonzini's message of "Tue, 15 Jan 2019 18:57:34 +0100")
Message-ID: <87tvi9atom.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 16 Jan 2019 08:33:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 03/15] hw/ssi: Remove SSIBus
 from "qemu/typedefs.h"
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	qemu-block@nongnu.org, Laszlo Ersek <lersek@redhat.com>, "Michael S.
	Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xlxlFoqYCX2Z

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 15/01/19 13:28, Markus Armbruster wrote:
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>> ---
>>>  hw/arm/strongarm.h      | 1 +
>>>  include/hw/arm/pxa.h    | 1 +
>>>  include/hw/ssi/pl022.h  | 1 +
>>>  include/hw/ssi/ssi.h    | 1 +
>>>  include/qemu/typedefs.h | 1 -
>>>  5 files changed, 4 insertions(+), 1 deletion(-)
>> When typedefs.h changes, we recompile the world, but it pretty much only
>> ever changes when new typedefs are added.  Thus, *keeping* a typedef
>> there is therefore pretty cheap.
>>=20
>> Nevertheless, we shouldn't keep typedefs there without a real reason.
>> Being able to move one away without having to add any new #include
>> directives is a strong sign for "no real reason".  I like patches doing
>> that.
>>=20
>> What I don't like is adding #include directives just so you can move
>> typedefs out of typedefs.h: it slows down the build.  Granted, the four
>
> (three - one added line is the typedef).

Correct.

>> added by this patch are a drop in the bucket.  The point I'm trying to
>> make is typedefs.h's purpose: it's for avoiding #include directives.
>> Circular ones in particular, but others, too.
>
> In this case, adding ssi.h inclusions to SSI controllers seems to be a
> feature, not a bug.

Adding #include can be a necessity.  It can't be a feature any more than
"slowing down your compiles" could be one :)

I'm particularly wary of unnecessary #include in headers.
