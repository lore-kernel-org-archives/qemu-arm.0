Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp6332749wrp;
        Wed, 18 Sep 2019 03:52:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzPyt98W8q+CAVNOhO0oHgQ1IJ1Vlw9dAsXyGTuF7bxpi40LtIsi26jryBxGdBpTM1JDMbH
X-Received: by 2002:ae9:eb8c:: with SMTP id b134mr1943452qkg.377.1568803974843;
        Wed, 18 Sep 2019 03:52:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568803974; cv=none;
        d=google.com; s=arc-20160816;
        b=qbVY7p3hCYr7yydyG+fX2zHwRm1VJvnSDeYVXrAxJH7U9rn5VWDLdX3JSLouXM0vH7
         mVGpB2/Zeg/9if98XFW4oJqMvZnUpvZZjSv3RIrM7y8YWMADLSyujwRLoS2/4qwgdSoi
         uxwC17f8RHuBuA+DgkKEzgR8DxZypSOrEtAFtbAbfZZSH0R1S5qh/Qgbw34tupx+0OVy
         FIuQnCVxrY9723TDMswD7XXIIGi90f9mFnuG8Ma2nrT189r+DOv3dVywe7aP26uayVjm
         3QDve0AB0dqtuj44XdYcilk+MfNzjyGTcI1C9yqNh2B/TPk9z9U0MV18Vh9K1ie3oY10
         ssLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=Uywjn+yJb5l2+Y8o/kV8Cd+jRnlIiqDwurAFABqWAb8=;
        b=wxbg7mYHFYs/FoLAdzFddY9aCXyArS2P+DwTwQKjC8AX5cU06Vmodrym5ZEZwjU0bq
         I0koAIAeoqjGlf+UePT+muadspdxEgassdubUilGLMIvYTWcMeiF56QPfd1BPoIekNEo
         XhZBBgsuSP6DXGDpBo9CPEf6mK3XbI0EqO1Ogxdtkl8lBH5NzJvtzqK+AOKRoxQ3Sth8
         fYnUPGhGYIpQqYSQNScPxdByP0eoSDV4b3DQfrfOdNh9AhcZQcGUvyGtQ3k+lQReJi6U
         pK5MVbssHjtiQA+7Ox0Xelx9Bth19AN6UP8CgprvTSPkFYpbLH0ngFvw1GKVq9uM1Bj5
         AMaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n45si3825538qta.39.2019.09.18.03.52.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2019 03:52:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAXZu-0007nh-6h
	for alex.bennee@linaro.org; Wed, 18 Sep 2019 06:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39547)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iAXZM-0007Ur-Ni
 for qemu-arm@nongnu.org; Wed, 18 Sep 2019 06:52:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iAXZK-0002D5-F8
 for qemu-arm@nongnu.org; Wed, 18 Sep 2019 06:52:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53992)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iAXZK-0002CE-8C
 for qemu-arm@nongnu.org; Wed, 18 Sep 2019 06:52:18 -0400
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 336DA6412B
 for <qemu-arm@nongnu.org>; Wed, 18 Sep 2019 10:52:16 +0000 (UTC)
Received: by mail-wm1-f69.google.com with SMTP id k184so932013wmk.1
 for <qemu-arm@nongnu.org>; Wed, 18 Sep 2019 03:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UQ2Y6VQpqh/1DWGeGRRgQsyoDgxpXOFSiVOtuKw+2sk=;
 b=FF9fOBor+aQs8uQYrX0kOeenMGekNlybzGOwvlrWqcJ24yPmDsThXf0UZkHNUCak6y
 m8FbkN+B+Ibb66RZQprQyesq/s8DhF5hBniRY0HZSEzc1Yf9iw37Vn6v0eI8IRXG9UNP
 nrrVSALgDRSnLF5yxT6fsmKBWr86i2C07VfvLimrWHUEnB1GKNsoI/xflzw3fXUEC4rk
 V5KO+Q3TJ6jfiBjHhKLaR09PbPvWKh1L1pvUG6JToFewySfGphm/0ittvj5l6UUTEzhc
 Jz16CML3v7HlusUB4VNb59Qb0YGxS8VjWYjVOYqCTrQjGkzRnFszvWYwCQu+WVLRTS7S
 XLvg==
X-Gm-Message-State: APjAAAX2vllmAxMdd+ZX7uJl+Z3m4n+ZWp+Qu260Un7oSTyYw6OTM8rL
 ZawSprG3A91/sDieiy4SmGwimfKiKpac007E0NCWH+fvKYlF9m/8Cgh1SoQt9tTPFeZMN9M+naS
 doa+GGBCkaDs2
X-Received: by 2002:a5d:6951:: with SMTP id r17mr2488730wrw.208.1568803934977; 
 Wed, 18 Sep 2019 03:52:14 -0700 (PDT)
X-Received: by 2002:a5d:6951:: with SMTP id r17mr2488695wrw.208.1568803934779; 
 Wed, 18 Sep 2019 03:52:14 -0700 (PDT)
Received: from [10.201.33.84] ([195.166.127.210])
 by smtp.gmail.com with ESMTPSA id l18sm4773752wrc.18.2019.09.18.03.52.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Sep 2019 03:52:13 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190916154847.28936-1-philmd@redhat.com>
 <20190916154847.28936-4-philmd@redhat.com>
 <dd8bdcd6-9e43-3721-7b39-f53d906988b3@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <221be2fe-f55b-1197-a477-eb503d99930d@redhat.com>
Date: Wed, 18 Sep 2019 12:52:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <dd8bdcd6-9e43-3721-7b39-f53d906988b3@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 03/13] hw: Move MC146818 device
 from hw/timer/ to hw/rtc/ subdirectory
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qkLCVjvrbCjA

On 9/17/19 10:32 PM, Richard Henderson wrote:
> On 9/16/19 11:48 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>>  include/hw/rtc/mc146818rtc.h                 | 38 +++++++++++++++++++=
+
>=20
> Same rebase failure as for patch 4?

This one is actually correct, it got moved from:

 include/hw/timer/mc146818rtc.h               | 14 --------

The difference is the addition of missing copyright/license.
