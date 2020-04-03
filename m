Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp657727lfi;
        Fri, 3 Apr 2020 06:29:06 -0700 (PDT)
X-Google-Smtp-Source: APiQypLDf4u02YCwtozo1o11yjrKYYySYYc2BakMt9T7zp5OXaW9KwtN+JqFdSGdlTUV+txCFfuE
X-Received: by 2002:a37:274d:: with SMTP id n74mr7771049qkn.259.1585920545555;
        Fri, 03 Apr 2020 06:29:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585920545; cv=none;
        d=google.com; s=arc-20160816;
        b=PXcJoWO0j/nC+tWBfk3j5fNEwrW6AdOWHt3d/ezomzsJ2YPH3LQyKxAbMKaRXZDdQE
         RJb1TfkouK3solAsAM+NlJOolxcv3ZEvys4ZqHw3ffFYNzF17ROwZq/Umctgjpe/3308
         Jpqx9Qgu+wkS/F/heMcuqv0vxlISXajFKNKzbfc1qfY5erMbRqTBvFR8DXjkK0CGF/tm
         LfOyo6eqZmmC9hZCpk7/mQVW8beABL2Xk6QhGdPtngeewdc8jUWPhnln9KOcHxajYw4o
         viCXlEW8UlOm6F5+wn71TY3eWLTVRxZ5tx9XII9XssNwDFaC/ETnfHbfQTVBm3zR6nBn
         mM2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=ng94s0eTI/dCHhiZws+YA7fwibke+mLb369fECR8tz4=;
        b=DJiKtUTdpDAPRXIuOoD67rVCQ7uw3mHXK4foAnGsI/un5M0X5+EoPoZLSAcKZ3+g+N
         cYAEYavlGmwGWbMrPT2o2GLyY3vonFoHopDtYvUSOz9h7q2dQxjuIK8GONykp9EXgoaB
         LgPltYoj3S8/UZIVrqWuT74KqIwJme2mNMjeWEklLOu1sLAB3SGKnfXHIZSfUJkl6649
         KrHm89K39SznvQJg5Vsosntp4pG8f/XqmCcXXLQx4dDphMlZc3O68Sv1x1KKLlS2SQvu
         4cGur3+/LMdhcBzZdLVssWL/lrx0t9m+4XFgny8aGKx8N3jsg7zwhk5LAY1hcHZdjRym
         9Lzw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5si5300093qtu.257.2020.04.03.06.29.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Apr 2020 06:29:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jKMNc-0002oC-TO
	for alex.bennee@linaro.org; Fri, 03 Apr 2020 09:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33546)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1jKMNT-0002nl-N5
 for qemu-arm@nongnu.org; Fri, 03 Apr 2020 09:28:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1jKMNS-000272-BO
 for qemu-arm@nongnu.org; Fri, 03 Apr 2020 09:28:55 -0400
Received: from 5.mo173.mail-out.ovh.net ([46.105.40.148]:56819)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1jKMNS-0001rL-5l
 for qemu-arm@nongnu.org; Fri, 03 Apr 2020 09:28:54 -0400
Received: from player737.ha.ovh.net (unknown [10.108.35.211])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 681B9138009
 for <qemu-arm@nongnu.org>; Fri,  3 Apr 2020 15:28:45 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player737.ha.ovh.net (Postfix) with ESMTPSA id 299DD7A2CBE7;
 Fri,  3 Apr 2020 13:28:39 +0000 (UTC)
Subject: Re: [PATCH for-5.0] hw/gpio/aspeed_gpio.c: Don't directly include
 assert.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200403124712.24826-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ed43d629-c6ad-f3ff-6e40-aa9ccddbebc2@kaod.org>
Date: Fri, 3 Apr 2020 15:28:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200403124712.24826-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 4182718157698534355
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrtdeigdeigecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeefjedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.40.148
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aKtrJ3+J9I5v

On 4/3/20 2:47 PM, Peter Maydell wrote:
> Remove a direct include of assert.h -- this is already
> provided by qemu/osdep.h, and it breaks our rule that the
> first include must always be osdep.h.
>=20
> In particular we must get the assert() macro via osdep.h
> to avoid compile failures on mingw (see the comment in
> osdep.h where we redefine assert() for that platform).
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

> ---
> Reported via a random comment on our github mirror...
> we should probably do a proper clean-includes run post-5.0.

with a 'sort' maybe.

Thanks,

C.=20

>=20
>  hw/gpio/aspeed_gpio.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index 41e11ea9b04..e52fcfd9a03 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -6,8 +6,6 @@
>   * SPDX-License-Identifier: GPL-2.0-or-later
>   */
> =20
> -#include <assert.h>
> -
>  #include "qemu/osdep.h"
>  #include "qemu/host-utils.h"
>  #include "qemu/log.h"
>=20

