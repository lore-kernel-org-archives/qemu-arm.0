Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1237552lff;
        Wed, 18 Dec 2019 11:37:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqyAhqacirdWxSmON9T1OekVmDhDpw7Dh9fWsij339a/4MSeywDp7rRaKq4kNwv1184dl+fi
X-Received: by 2002:a0c:fac1:: with SMTP id p1mr4086671qvo.231.1576697856146;
        Wed, 18 Dec 2019 11:37:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576697856; cv=none;
        d=google.com; s=arc-20160816;
        b=KKVbofSoJSTdWt43678zL/mmZnTycV0oei9dnD5qFO374pAcmwuMJbS7bFYpefnH6L
         cQxO2MuiBmnW2Tb1xNMvBDUAxEx68X3sSjfDDSKo8LGbCmCG4irK9rX8lcBt9kUQyrIl
         j161Fpla9eG3/H7CU0u+r3wNEINkU3NpgWbDIoksHnhlY67CJPH+1Sp4J1AobGA31Qt7
         WYeOAJlwbUVf1nPnqC0bZjyzd86bKSNm/YBmWabi68fEL4SB+JXo+2kG+ehdSgTngsou
         rmSlrNPIbeGgL/rVOboTAedCVeD0vYfiBnRbBjyhUEWbmctIAmZR9Rh/8hFDw4OXYixh
         59PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:references:to:from:subject:dkim-signature;
        bh=GiprSwdHZ/Z6TSNz/6DxrHEnQe0kiuxGby8tvQrTjLc=;
        b=dq2uS4yvanYhAxckF+YNKQUSiL2G1yO9NewZ++868sYZOQZNulRNeoo5IlaNNBS/+K
         sQdWv7+9NRC1ZBG499TJM5JHOWV0Ss6JMFLnUJEVvsKTrcPfo4VRQSRhmQgcTvdYzDN9
         8c9BXYlmFWc7iTNVTvDN3pC2bEDuakt8EmrsoYtaAb5KLJqUDk1xIiACnWf610yLLpMM
         WbJONDcQiWMJceOr77ZM3Ij07K0ckEiMdSV9sRwR/WwMocW7s/WLRoWyMB6ji7OVnBbh
         5FMevFUEcQR2ojWdwIhZjTJmjIBiNoX3bGBX02zT9IuLmLBbsCwgyjSqF7NRD5qnARb+
         5TQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EPzTB81Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x15si1821330qtk.350.2019.12.18.11.37.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Dec 2019 11:37:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EPzTB81Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ihf8Z-00039J-Es
	for alex.bennee@linaro.org; Wed, 18 Dec 2019 14:37:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40295)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1ihf7F-0001aU-Pc
 for qemu-arm@nongnu.org; Wed, 18 Dec 2019 14:36:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1ihf7D-0005PC-BC
 for qemu-arm@nongnu.org; Wed, 18 Dec 2019 14:36:13 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:36031
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1ihf7C-0005KQ-Rp
 for qemu-arm@nongnu.org; Wed, 18 Dec 2019 14:36:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576697770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=GiprSwdHZ/Z6TSNz/6DxrHEnQe0kiuxGby8tvQrTjLc=;
 b=EPzTB81Y8skjfkM8vtZC19G/vLoAopcKCqiCdGhCb9O2jLqpkek2qR5EHg6R8Ckl5oztFb
 eNpNo/i58IDeB7izjH8GmxsZiTC7bVin+uzCNHCYsDMt1tOg0YpmgSOcvpt2OuwXkIkvmF
 isv92fl4CRIZ5fIzSfrQ9FM/2kY09K8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-WxuNooOsNP2TC_FJfZ2PFQ-1; Wed, 18 Dec 2019 14:35:57 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E8C4102CE16;
 Wed, 18 Dec 2019 19:35:54 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-120.ams2.redhat.com [10.36.116.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 56DAE5D9E2;
 Wed, 18 Dec 2019 19:35:50 +0000 (UTC)
Subject: Re: [PATCH 3/6] hw/net/imx_fec: Rewrite fall through comments
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191217173425.5082-1-philmd@redhat.com>
 <20191217173425.5082-4-philmd@redhat.com>
 <2fc74b64-0a0b-c437-e925-4c16d3907da7@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <54e5071f-b5c2-3cc7-514c-ecc2b7e2bed4@redhat.com>
Date: Wed, 18 Dec 2019 20:35:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2fc74b64-0a0b-c437-e925-4c16d3907da7@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: WxuNooOsNP2TC_FJfZ2PFQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pe9XWX4ClCzm

On 17/12/2019 18.55, Thomas Huth wrote:
> On 17/12/2019 18.34, Philippe Mathieu-Daud=C3=A9 wrote:
>> GCC9 is confused by this comment when building with CFLAG
>> -Wimplicit-fallthrough=3D2:
>>
>>   hw/net/imx_fec.c: In function =E2=80=98imx_eth_write=E2=80=99:
>>   hw/net/imx_fec.c:906:12: error: this statement may fall through [-Werr=
or=3Dimplicit-fallthrough=3D]
>>     906 |         if (unlikely(single_tx_ring)) {
>>         |            ^
>>   hw/net/imx_fec.c:912:5: note: here
>>     912 |     case ENET_TDAR:     /* FALLTHROUGH */
>>         |     ^~~~
>>   cc1: all warnings being treated as errors
>>
>> Rewrite the comments in the correct place,  using 'fall through'
>> which is recognized by GCC and static analyzers.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>> Cc: Peter Chubb <peter.chubb@nicta.com.au>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: Jason Wang <jasowang@redhat.com>
>> Cc: qemu-arm@nongnu.org
>> ---
>>  hw/net/imx_fec.c | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
>> index bd99236864..30cc07753d 100644
>> --- a/hw/net/imx_fec.c
>> +++ b/hw/net/imx_fec.c
>> @@ -901,15 +901,17 @@ static void imx_eth_write(void *opaque, hwaddr off=
set, uint64_t value,
>>              s->regs[index] =3D 0;
>>          }
>>          break;
>> -    case ENET_TDAR1:    /* FALLTHROUGH */
>> -    case ENET_TDAR2:    /* FALLTHROUGH */
>> +        /* fall through */
>=20
> Wrong location. And I think you don't need any comment here at all, GCC
> should stay silent without it?
>=20
>> +    case ENET_TDAR1:
>> +    case ENET_TDAR2:
>>          if (unlikely(single_tx_ring)) {
>>              qemu_log_mask(LOG_GUEST_ERROR,
>>                            "[%s]%s: trying to access TDAR2 or TDAR1\n",
>>                            TYPE_IMX_FEC, __func__);
>>              return;
>>          }
>> -    case ENET_TDAR:     /* FALLTHROUGH */
>> +        /* fall through */
>=20
> I'd suggest to simply remove it, too.

/me needsmorecoffee

... of course this hunk was fine. Good that you kept it in v2.

 Thomas


>> +    case ENET_TDAR:
>>          if (s->regs[ENET_ECR] & ENET_ECR_ETHEREN) {
>>              s->regs[index] =3D ENET_TDAR_TDAR;
>>              imx_eth_do_tx(s, index);
>>
>=20
>  Thomas
>=20

