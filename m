Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3441897wrq;
        Sun, 24 Jun 2018 23:10:50 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKL7vvZhGpB3Vj9rZ5E9HqhaNo8uCoYoPEkMc/n9y16OKOso34c1V5Ic7wFgz0avtyv/qv1V
X-Received: by 2002:aed:3a24:: with SMTP id n33-v6mr9982250qte.348.1529907050427;
        Sun, 24 Jun 2018 23:10:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529907050; cv=none;
        d=google.com; s=arc-20160816;
        b=pEWTtiPMCHP2ZWfzlNE3QeLvWtxFrCw9NvbpqzrawNEFu13TyYNwi6UxNxC1iJ8lEn
         lrAQcuaxHgyCSF26p8uz1F63gPw5ttPZQwmIe92f7afEpQphq4dNqXmg9i+awdAgUFDR
         I+bpf4dce9J+MkmX2mkSISyg95zh5rVz6cKz86At+dwvJmzw9KHP6H8C3C1cI5Nq5A38
         9slg7PEPpNZgk3UWEmLC4Mhpd/HK2FqKq4Qgha+qDrWnGrXtft35MVmqZ5oAs5wMy+z9
         1ol5Kflfbs+ocvhhnuEDJROd2G5Tv2lzyKb5yzIHXYoktSdUtC/27EHgN+po/Y7wQkpE
         yuVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :arc-authentication-results;
        bh=9L8Nl0XjAw81P2Bw63pmBAPfxIDMGO/CI5rTFwtRdME=;
        b=eq0soR49mi8H8WhneGdDWoDPUKBRoakbikbKgrB22fah/F/oGeF6igNV3RHIuMGkte
         3lVlssQCSkP6osnnMwzgEtf9ybwMJ7nKiFLADWDqVZvgY3wrE33GhqrNZo6wXeopurWM
         G+2/S9pmnEdo5tytQ01SDgDIagmYUJjVFkdFbqbwp7uwRjG1hRh3hd0gbKzSgtUYhX5B
         fW1QztyqBaRvnyMcrM5C6y3mPME/o2awfoy4nXw1rxWYV7M/sazBiYiiqQSUOYdzuvWV
         M2H++TB/mQBMAMLlDcLzWvW5astfay9h0bLNchJkDdjpdyYN8LzlHQQ48zVqdA/lBtVt
         L8Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o19-v6si3056501qtb.380.2018.06.24.23.10.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 24 Jun 2018 23:10:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44419 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXKi9-0000zm-U1
	for alex.bennee@linaro.org; Mon, 25 Jun 2018 02:10:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56103)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fXKi2-0000ze-LT
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 02:10:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fXKi0-00072k-OW
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 02:10:42 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43618 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fXKi0-00072N-Aq; Mon, 25 Jun 2018 02:10:40 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E76C04075656;
	Mon, 25 Jun 2018 06:10:39 +0000 (UTC)
Received: from [10.36.116.31] (ovpn-116-31.ams2.redhat.com [10.36.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A07762026D5B;
	Mon, 25 Jun 2018 06:10:38 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20180622134036.23182-1-f4bug@amsat.org>
	<20180622134036.23182-10-f4bug@amsat.org>
	<b70145b2-5c24-d525-b23a-aaeb7ab960c5@redhat.com>
	<39def888-734e-f4e6-8104-9534e611fcb1@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <797d336f-bfc6-050e-7f13-d9872049d197@redhat.com>
Date: Mon, 25 Jun 2018 08:10:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <39def888-734e-f4e6-8104-9534e611fcb1@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Mon, 25 Jun 2018 06:10:39 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Mon, 25 Jun 2018 06:10:39 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v2 09/14] hw/arm/omap: Use
 qemu_log_mask(GUEST_ERROR) instead of fprintf
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IXcPIU7W/tEh

On 22.06.2018 22:13, Philippe Mathieu-Daud=C3=A9 wrote:
> On 06/22/2018 04:44 PM, Thomas Huth wrote:
>> On 22.06.2018 15:40, Philippe Mathieu-Daud=C3=A9 wrote:
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>> ---
>>>  include/hw/arm/omap.h | 5 +++--
>>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
>>> index 39abba753d..3867687b8c 100644
>>> --- a/include/hw/arm/omap.h
>>> +++ b/include/hw/arm/omap.h
>>> @@ -21,6 +21,7 @@
>>>  # define hw_omap_h		"omap.h"
>>>  #include "hw/irq.h"
>>>  #include "target/arm/cpu-qom.h"
>>> +#include "qemu/log.h"
>>> =20
>>>  # define OMAP_EMIFS_BASE	0x00000000
>>>  # define OMAP2_Q0_BASE		0x00000000
>>> @@ -962,8 +963,8 @@ void omap_mpu_wakeup(void *opaque, int irq, int r=
eq);
>>>          fprintf(stderr, "%s: Bad register " OMAP_FMT_plx "\n",	\
>>>                          __func__, paddr)
>>
>> What about that fprintf above?
>=20
> Well there are still many fprintf() in the OMAP codebase.
>=20
> I didn't want to start a fprintf() cleanup, I just cherry-picked the
> patches I used to make sens of the current (ugly) output.
>=20
> With this series the console is 'usable'.

Ok, fair. But I guess you should mention this in the patch description.

 Thomas
