Received: by 10.223.197.9 with SMTP id q9csp1686777wrf;
        Fri, 6 Oct 2017 07:05:09 -0700 (PDT)
X-Received: by 10.237.49.35 with SMTP id 32mr3174591qtg.33.1507298709645;
        Fri, 06 Oct 2017 07:05:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507298709; cv=none;
        d=google.com; s=arc-20160816;
        b=LgbUnQ4AHvyVMDTj+mp6Z46wVrvdm/k8CsNxvtzIL6HdxTqoMl09T7QlLsvIJer8+R
         jiW7wjTzRBRziE8dfo3aB2ow8vZa671A2jGH3/nBInxrfuUm/15NPyKo0WpRGMbjdfvc
         Mg2sqz54uD6iIvjwliTFhGSxb4EzstyRmPuJ+BcbgVxTENLWhv+/riCy/HPe+9BFXT7z
         7+snCX8SCXntcFbmwtgSZvQEch3KesV2JRjjRvVTwTYS3Qu4z9K+jtu702rUwdbCTTCB
         Hj5Vpx8+fazruO3FDk0DVkufLeo+g3xQhgibF+j871Qe5UjvhIThN/KcYXG/nydXhm2B
         A7ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=hQfhUPvyq78hEYAfeZL6Q+voaUc9YQg4fIUoDzZ3Uf8=;
        b=zVcSsTXxfYVdB1WCSrl1FcnEAyDapKA3PDWIvrquredLSdwEwJvJ3Ey9Wy1MGFXdJt
         37Wc6GeXMft2424gJ0J6ALhpYNFoidNXFbwvsEOjJ7s0JjJbcK6abnq5NzdRwJzz5Alx
         wC6xZwlXRQMHYc4vI33DFEN5QFl3ENooulh2reJS3+3x+7M8HvGTcInok5Pbev7r1RdT
         F67iIEodPOR8xmzGICIsrFCHsbd8y69OZm6c0InV6XrawzuVjY6zfWyctATOfMAaXozY
         Xx3N8BNaepAh3v2jWBcjO3vorvAE38d69/hQJWmTgSxuybEFlQiFCUQs7JDV+xHshTLc
         i/Ug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VBcPI9yb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e4si248475qkf.211.2017.10.06.07.05.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Oct 2017 07:05:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VBcPI9yb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45132 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0TFV-0004yG-4T
	for alex.bennee@linaro.org; Fri, 06 Oct 2017 10:05:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46655)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0TB2-0001tQ-IZ
	for qemu-devel@nongnu.org; Fri, 06 Oct 2017 10:00:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0TAt-000733-40
	for qemu-devel@nongnu.org; Fri, 06 Oct 2017 10:00:32 -0400
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:49589)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e0TAs-00072Q-T8
	for qemu-devel@nongnu.org; Fri, 06 Oct 2017 10:00:23 -0400
Received: by mail-wm0-x232.google.com with SMTP id b189so7766970wmd.4
	for <qemu-devel@nongnu.org>; Fri, 06 Oct 2017 07:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=hQfhUPvyq78hEYAfeZL6Q+voaUc9YQg4fIUoDzZ3Uf8=;
	b=VBcPI9yb1R828U7ry/rJF6YgjqQJq202ckVI7N5yQGoDqE46wiKp+QOXdcaRkHU3fn
	YJC7X4EypA2Wcalotjx9jpKXWthvSAd05cXQcOs+e+ORIJscYhiBeCRbT7tuOI3zx9kB
	Us+F5aZbUdLxG3YLqwcnC4VGVmfHt0porx/oY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=hQfhUPvyq78hEYAfeZL6Q+voaUc9YQg4fIUoDzZ3Uf8=;
	b=E1NdiOZl6Gj7V7ATHit5XrgVkfuxDe4zILaIqo+lcWHFsdquXOgl2bk18/8veFaGZj
	xqdf4013RPszfCgr8TfnrJeAEgW2EwkRDmOLD1NmI1aGHPT9HQfT2XWaG8GvTIfnESmt
	IYBM7xVSLB7yheOBPkOjEnBHKcnL52AF8HyyQK4rhEkQPXxkOws00jr/Xl3O/kaCTu1I
	Zi54HigxZl5f6yRixyhatY/ghnpKQmWmi/wPBRoiffFzGUtpp8WWe3CUWJIwCepVr1Jo
	OpgHBnA4xVSTWWKH5I/nqwygWN5PFHcCq0JlRxw5GQ3pqaJQsddFFB3UwSFY0RpDO3eq
	ABvg==
X-Gm-Message-State: AMCzsaW21mhO9Mdl78fovQK5ocZ341mpW0EF+eKK0NW2KjdD7cxev1FY
	GyzIUC+zhTg07/FSXXwwVjMr7yLGpdOjOyPUf6MaXg==
X-Google-Smtp-Source: AOwi7QBGNtnyPQ2RJgJH2mZ4IjArumfc2rQQS4Vb15dY2vkiu3FuTNVPsRNWlxblN4dUhTpuzah9uL7eQldEE/jJ9IU=
X-Received: by 10.28.22.66 with SMTP id 63mr1860913wmw.11.1507298421700; Fri,
	06 Oct 2017 07:00:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Fri, 6 Oct 2017 07:00:00 -0700 (PDT)
In-Reply-To: <9a757d6e-6745-9df4-7199-d55ee2510d8f@amsat.org>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
	<20170918195100.17593-6-andrew.smirnov@gmail.com>
	<9a757d6e-6745-9df4-7199-d55ee2510d8f@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Oct 2017 15:00:00 +0100
Message-ID: <CAFEAcA_KTvAN8qa7Qq=kxKSVgJQLQJ++BguQsVHB6PGiFuoFvg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::232
Subject: Re: [Qemu-devel] [PATCH 05/17] imx_fec: Use ENET_FTRL to determine
 truncation length
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Jason Wang <jasowang@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LJYlfwpjToBn

On 30 September 2017 at 01:17, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> Hi Andrey,
>
> On 09/18/2017 04:50 PM, Andrey Smirnov wrote:
>>
>> Frame truncation length, TRUNC_FL, is determined by the contents of
>> ENET_FTRL register, so convert the code to use it instead of a
>> hardcoded constant.
>>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: Jason Wang <jasowang@redhat.com>
>> Cc: qemu-devel@nongnu.org
>> Cc: qemu-arm@nongnu.org
>> Cc: yurovsky@gmail.com
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>   hw/net/imx_fec.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
>> index 767402909d..989c11be5f 100644
>> --- a/hw/net/imx_fec.c
>> +++ b/hw/net/imx_fec.c
>> @@ -1050,8 +1050,8 @@ static ssize_t imx_enet_receive(NetClientState *nc=
,
>> const uint8_t *buf,
>>       size +=3D 4;
>>         /* Huge frames are truncted.  */
>> -    if (size > ENET_MAX_FRAME_SIZE) {
>> -        size =3D ENET_MAX_FRAME_SIZE;
>> +    if (size > s->regs[ENET_FTRL]) {
>> +        size =3D s->regs[ENET_FTRL]; >           flags |=3D ENET_BD_TR =
|
>> ENET_BD_LG;
>>       }
>
>
> for this to be ok you need to update imx_enet_write(), such:
>
>      case ENET_FTRL:
> -        s->regs[index] =3D value & 0x00003fff;
> +        value &=3D 0x00003fff;
> +        if (value > ENET_MAX_FRAME_SIZE) {
> +            warn_report("%s: guest requested bigger "
> +                        "frame size than QEMU supports "
> +                        "(%u > %u)", value,
> +                        ENET_MAX_FRAME_SIZE);
> +            value =3D ENET_MAX_FRAME_SIZE;
> +        }
> +        s->regs[index] =3D value;
>          break;

Yes, and also an incoming-migration post_load callback that
fails migration if the value is too large.

It might be simpler to truncate to the smaller of the ENET_FTRL
register value and ENET_MAX_FRAME_SIZE.

(PS: what is the hardware behaviour if ENET_FTRL is set to
a larger value than ENET_MAX_FRAME_SIZE ?)

thanks
-- PMM
