Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp535140lff;
        Sat, 18 Jan 2020 07:05:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqx90nV05sHScv5q3n1OBY7FH26iKD8pvQicKIcrQ9LFBBe8Or/+u+an4G2LVdPdCPD0u1zy
X-Received: by 2002:aed:238f:: with SMTP id j15mr12763634qtc.240.1579359953629;
        Sat, 18 Jan 2020 07:05:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579359953; cv=none;
        d=google.com; s=arc-20160816;
        b=hkq3VjzvcO5Xdu42jOgSKpdOtS9rvzFYacZNRMrHHSjEpZpUFDA/ng5GYo0vhaZ+mp
         6dCnyVBj41yzCcukK1gpa4D25sDpmTgooF8gQipMYbUZb7p6Y4OZeDyJ62KLWmFk+N6p
         hXRBrjmX0AKlp7P/9vt4CoL9baRoCyE4MvWY5NHTU/+rY98iMRcLI+M5zFKbEC+KO/0T
         cJrVUOi4z8N+0cWHsOT5szVI6LA7fdv/NFFzPlTepNuaEZh9f2/b19mLYieLm6WdXA3a
         08khA6olQoctst9Vp7wUZ8/ppYIuTiFImrfippKNOvmWjLWaIVmiPlv6+cPgmxfgUK2C
         psQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=jnFA1cOU4c0Ow0cB6UHREl1Tw1EHeh/JI+7GYsynQRY=;
        b=hg0lKIdhxcTkVBQ+71T4Q6X+87Kz0fEccHsRJdagiczo6LzkBtV2wEBweY2iHho2c+
         DrNPBB/9FNTU/qYt4pnU6NFYHrSXyO1FHu6u6QNmZpVzSACneX4Z4P4QDAQhMhlsQkVF
         86WPz77GJ8LeRPXJMQvCDbp/L4xyGb0SCh/PiZWIUmTP9yoG2rrz4PRsPZICu9TBdsQT
         7/iD97QZzYoIyXU8goYmYwdV3CbdMnAflR97qsHKvtYgQgeknA+5upZHfmcgQJJZxOcM
         Kq6wM/WINwuK//saNpdXnQDN3fTt9MaxJkvs4EeXVjYrterNI0ssIKHS3RiUmcPCZWoA
         j4wA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KIx8SkyP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d12si17182317qkb.313.2020.01.18.07.05.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 18 Jan 2020 07:05:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KIx8SkyP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ispfd-0006NH-0p
	for alex.bennee@linaro.org; Sat, 18 Jan 2020 10:05:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51461)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ispfS-0006Mx-1y
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 10:05:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ispfN-0003sr-OL
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 10:05:41 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22257
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ispfN-0003rl-K1
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 10:05:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579359936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jnFA1cOU4c0Ow0cB6UHREl1Tw1EHeh/JI+7GYsynQRY=;
 b=KIx8SkyPZnutVWPP4744+uzHmwmSb30FtksGnrkjHZewGTq4ByWl+eHat1mZrYOu91xPnZ
 7PRJIGTAPap5uu6BOZ1ysJZEWw+GiqfdqxIKAM+N4oxRLXab3YrLIG2uw6CxELaK0agokk
 darghIZYp+9jZjwRK9Gg+6qRGJ5dN8w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-aDMlRfEvMBqkjeilfmtFTw-1; Sat, 18 Jan 2020 10:05:33 -0500
Received: by mail-wm1-f69.google.com with SMTP id l11so3573643wmi.0
 for <qemu-arm@nongnu.org>; Sat, 18 Jan 2020 07:05:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qFM0Bodz3dXGTB4n0xDVQcQoWUXbQWKnLXvk3tXI7VY=;
 b=EiZkJZ+huQO+HweS6H+C+BqtVL3aOPyyMxVJMMcSZ0cw5L0nUhrrLUYBMBw/pslajR
 z6vXOIe/a194zQFxyQHvtAu9Q3Q4zguCSRMv0OqMJjETTF6DJsTz6f+mz0gjRabzAiF/
 pau1ttunXG87QowR9QSgmPKdLpPZ4mSSGlEPEVyq5o25AyXJdyoVOgx1UjmeN3Ol4JC1
 6r3Y9TXB7RD2hM3QZcBBukuBfygYPNbo27ITXHvl4qppijVzMrteKKVz7K3i37VKnX34
 CjreBQGEdiZl16LGoBAlE6FKnMQAvPa7CBlEAl+j2XPHPG45M6D/w2bRPuyj5x/JlLlo
 WlVA==
X-Gm-Message-State: APjAAAWZdm9gSW1zF1ayTwgKPh3pyXr0MBsJmRghW6tcOj2PAK5eSgoI
 BLA3VB7zliV7RGyUaQcHlOMcJbXlCoN65M7Jsbmyv+MDvqMm23yKal7ETnIlL2AeJAfsjYqH6r5
 JBBwBzl70iPPq
X-Received: by 2002:a05:600c:2551:: with SMTP id
 e17mr9916921wma.26.1579359932092; 
 Sat, 18 Jan 2020 07:05:32 -0800 (PST)
X-Received: by 2002:a05:600c:2551:: with SMTP id
 e17mr9916898wma.26.1579359931744; 
 Sat, 18 Jan 2020 07:05:31 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id r6sm40073636wrq.92.2020.01.18.07.05.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Jan 2020 07:05:30 -0800 (PST)
Subject: Re: [PATCH v3 12/17] hw/arm/allwinner: add RTC device support
To: Niek Linnenbank <nieklinnenbank@gmail.com>
References: <20200108200020.4745-1-nieklinnenbank@gmail.com>
 <20200108200020.4745-13-nieklinnenbank@gmail.com>
 <cca7b552-ed09-fdc4-e80e-fc172e30e9bf@redhat.com>
 <CAPan3Wqso11h47mGdWxbDFE7dPL7wzNGCM6XVB-12SAZhJ0mqA@mail.gmail.com>
 <CAPan3WrkQVb7VhJRYZET_BjEWEOYow-28ft2+4=G-9SNUDm6WA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <128940fd-eda9-8151-eb4f-4d29c2c1d72a@redhat.com>
Date: Sat, 18 Jan 2020 16:05:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAPan3WrkQVb7VhJRYZET_BjEWEOYow-28ft2+4=G-9SNUDm6WA@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: aDMlRfEvMBqkjeilfmtFTw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AyDq8EUigc+7

Hi Niek,

On 1/14/20 11:57 PM, Niek Linnenbank wrote:
> On Tue, Jan 14, 2020 at 11:52 PM Niek Linnenbank=20
> <nieklinnenbank@gmail.com <mailto:nieklinnenbank@gmail.com>> wrote:
>=20
>     Hi Philippe,
>=20
>     On Mon, Jan 13, 2020 at 11:57 PM Philippe Mathieu-Daud=C3=A9
>     <philmd@redhat.com <mailto:philmd@redhat.com>> wrote:
>=20
>         On 1/8/20 9:00 PM, Niek Linnenbank wrote:
>          > Allwinner System-on-Chips usually contain a Real Time Clock (R=
TC)
>          > for non-volatile system date and time keeping. This commit
>         adds a generic
>          > Allwinner RTC device that supports the RTC devices found in
>         Allwinner SoC
>          > family sun4i (A10), sun7i (A20) and sun6i and newer (A31,
>         H2+, H3, etc).
[...]
>          > +static uint64_t allwinner_rtc_read(void *opaque, hwaddr offse=
t,
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned =
size)
>          > +{
>          > +=C2=A0 =C2=A0 AwRtcState *s =3D AW_RTC(opaque);
>          > +=C2=A0 =C2=A0 const AwRtcClass *c =3D AW_RTC_GET_CLASS(s);
>          > +=C2=A0 =C2=A0 uint64_t val =3D 0;
>          > +
>          > +=C2=A0 =C2=A0 if (offset >=3D AW_RTC_REGS_MAXADDR) {
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, "%=
s: out-of-bounds
>         offset 0x%04x\n",
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 __func__, (uint32_t)offset);
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
>          > +=C2=A0 =C2=A0 }
>          > +
>          > +=C2=A0 =C2=A0 if (!c->regmap[offset]) {
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_G=
UEST_ERROR, "%s: invalid
>         register 0x%04x\n",
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__, (uint32_t)offset);
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
>          > +=C2=A0 =C2=A0 }
>          > +
>          > +=C2=A0 =C2=A0 switch (c->regmap[offset]) {
>          > +=C2=A0 =C2=A0 case REG_LOSC:=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Low=
 Oscillator Control */
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D s->regs[REG_LOSC];
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s->regs[REG_LOSC] &=3D ~(REG_LOSC=
_YMD | REG_LOSC_HMS);
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>          > +=C2=A0 =C2=A0 case REG_YYMMDD:=C2=A0 =C2=A0 =C2=A0/* RTC Year=
-Month-Day */
>          > +=C2=A0 =C2=A0 case REG_HHMMSS:=C2=A0 =C2=A0 =C2=A0/* RTC Hour=
-Minute-Second */
>          > +=C2=A0 =C2=A0 case REG_GP0:=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Gen=
eral Purpose Register 0 */
>          > +=C2=A0 =C2=A0 case REG_GP1:=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Gen=
eral Purpose Register 1 */
>          > +=C2=A0 =C2=A0 case REG_GP2:=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Gen=
eral Purpose Register 2 */
>          > +=C2=A0 =C2=A0 case REG_GP3:=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Gen=
eral Purpose Register 3 */
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D s->regs[c->regmap[offset]=
];
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>          > +=C2=A0 =C2=A0 default:
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!c->read(s, offset)) {
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_U=
NIMP, "%s: unimplemented
>         register 0x%04x\n",
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__, (uint32_t)offset);
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D s->regs[c->regmap[offset]=
];
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>          > +=C2=A0 =C2=A0 }
>          > +
>          > +=C2=A0 =C2=A0 trace_allwinner_rtc_read(offset, val);
>          > +=C2=A0 =C2=A0 return val;
>          > +}
>          > +
>          > +static void allwinner_rtc_write(void *opaque, hwaddr offset,
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t val, unsigned=
 size)
>          > +{
>          > +=C2=A0 =C2=A0 AwRtcState *s =3D AW_RTC(opaque);
>          > +=C2=A0 =C2=A0 const AwRtcClass *c =3D AW_RTC_GET_CLASS(s);
>          > +
>          > +=C2=A0 =C2=A0 if (offset >=3D AW_RTC_REGS_MAXADDR) {
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, "%=
s: out-of-bounds
>         offset 0x%04x\n",
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 __func__, (uint32_t)offset);
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
>          > +=C2=A0 =C2=A0 }
>          > +
>          > +=C2=A0 =C2=A0 if (!c->regmap[offset]) {
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_G=
UEST_ERROR, "%s: invalid
>         register 0x%04x\n",
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__, (uint32_t)offset);
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
>          > +=C2=A0 =C2=A0 }
>          > +
>          > +=C2=A0 =C2=A0 trace_allwinner_rtc_write(offset, val);
>          > +
>          > +=C2=A0 =C2=A0 switch (c->regmap[offset]) {
>          > +=C2=A0 =C2=A0 case REG_YYMMDD:=C2=A0 =C2=A0 =C2=A0/* RTC Year=
-Month-Day */
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s->regs[REG_YYMMDD] =3D val;
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s->regs[REG_LOSC]=C2=A0 |=3D REG_=
LOSC_YMD;
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>          > +=C2=A0 =C2=A0 case REG_HHMMSS:=C2=A0 =C2=A0 =C2=A0/* RTC Hour=
-Minute-Second */
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s->regs[REG_HHMMSS] =3D val;
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s->regs[REG_LOSC]=C2=A0 |=3D REG_=
LOSC_HMS;
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>          > +=C2=A0 =C2=A0 case REG_GP0:=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Gen=
eral Purpose Register 0 */
>          > +=C2=A0 =C2=A0 case REG_GP1:=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Gen=
eral Purpose Register 1 */
>          > +=C2=A0 =C2=A0 case REG_GP2:=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Gen=
eral Purpose Register 2 */
>          > +=C2=A0 =C2=A0 case REG_GP3:=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Gen=
eral Purpose Register 3 */
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s->regs[c->regmap[offset]] =3D va=
l;
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>          > +=C2=A0 =C2=A0 default:
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!c->write(s, offset, val)) {
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_U=
NIMP, "%s: unimplemented
>         register 0x%04x\n",
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__, (uint32_t)offset);
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>          > +=C2=A0 =C2=A0 }
>          > +}
>          > +
>          > +static const MemoryRegionOps allwinner_rtc_ops =3D {
>          > +=C2=A0 =C2=A0 .read =3D allwinner_rtc_read,
>          > +=C2=A0 =C2=A0 .write =3D allwinner_rtc_write,
>          > +=C2=A0 =C2=A0 .endianness =3D DEVICE_NATIVE_ENDIAN,
>          > +=C2=A0 =C2=A0 .valid =3D {
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .min_access_size =3D 4,
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_access_size =3D 4,
>          > +=C2=A0 =C2=A0 },
>          > +=C2=A0 =C2=A0 .impl.min_access_size =3D 4,
>          > +};
>          > +
>          > +static void allwinner_rtc_reset(DeviceState *dev)
>          > +{
>          > +=C2=A0 =C2=A0 AwRtcState *s =3D AW_RTC(dev);
>          > +=C2=A0 =C2=A0 const AwRtcClass *c =3D AW_RTC_GET_CLASS(dev);
>          > +=C2=A0 =C2=A0 struct tm now;
>          > +
>          > +=C2=A0 =C2=A0 /* Clear registers */
>          > +=C2=A0 =C2=A0 memset(s->regs, 0, sizeof(s->regs));
>          > +
>          > +=C2=A0 =C2=A0 /* Get current datetime */
>          > +=C2=A0 =C2=A0 qemu_get_timedate(&now, 0);
>          > +
>          > +=C2=A0 =C2=A0 /* Set RTC with current datetime */
>          > +=C2=A0 =C2=A0 s->regs[REG_YYMMDD] =3D=C2=A0 ((now.tm_year - c=
->year_offset)
>         << 16) |
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((now.tm_mon + 1) << 8) |
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0now.tm_mday;
>          > +=C2=A0 =C2=A0 s->regs[REG_HHMMSS] =3D (((now.tm_wday + 6) % 7=
) << 29) |
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (now.tm_hour << 16) |
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (now.tm_min << 8) |
>          > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0now.tm_sec;
>=20
>         This doesn't look correct.
>=20
>          =C2=A0From H3 Datasheet (Rev1.2):
>          =C2=A0 =C2=A04.8.3.4. RTC YY-MM-DD Register (Default Value: 0x00=
000000)
>          =C2=A0 =C2=A04.8.3.5. RTC HH-MM-SS Register (Default Value: 0x00=
000000)
>=20
>=20
>     I don't yet fully understand what you mean. Could you please explain
>     a bit more what should be changed?

I was thinking about:

- Start a VM on Monday at 12:34

- Pause the VM on Tuesday at 12:34
   rtc_time=3DTuesday,12:34

- [Eventually savevm/migrate/loadvm]
   rtc_time=3DTuesday,12:34

- Resume the VM on Wednesday 12:34
   (time should be Tuesday at 12:34)
   so rtc_time=3DTuesday,12:34

- Check time on Thursday at 12:33
   (time should be Wednesday at 12:33)
   rtc_time=3DWednesday,12:34

- Reset the VM on Thursday at 12:34
   (time was Wednesday at 12:34)

- Check time on Thursday at 12:35
   (time should be Wednesday at 12:35)

However due to reset() calling qemu_get_timedate(), the rtc_time will be=20
Thursday at 12:35 instead of Wednesday.

I don't know how the hardware keep these 2*32-bit safe when powered off.

Laurent Vivier posted a patch where he uses a block backend for his=20
machine NVRAM (used by RTC). This seems to me the clever way to do this:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg666837.html

I'd use a block of 8 bytes for your RTC.
If we start a machine without rtc block backend, the 2*32-bit are=20
initialized as zero as the datasheet. If we provide a block, the machine=20
will power-on from that stored time.

You might want to look at the global -rtc command line option:

   -rtc
   [base=3Dutc|localtime|datetime][,clock=3Dhost|rt|vm][,driftfix=3Dnone|sl=
ew]
         Specify base as "utc" or "localtime" to let the RTC start
         at the current UTC or local time, respectively. "localtime"
         is required for correct date in MS-DOS or Windows. To start
         at a specific point in time, provide datetime in the format
         "2006-06-17T16:01:21" or "2006-06-17". The default base is
         UTC.

But it might be specific to the MC146818 RTC.

>     For filling the YYMMDD and HHMMSS register fields, I simply looked
>     at the 4.8.3.4 and 4.8.3.5 sections
>     and filled it with the time retrieved from qemu_get_timedate. The
>     shifts are done so the values are set in the proper bits.
>     If I read it with the hwclock -r command under Linux, this reads out =
OK.
>     On NetBSD, this works as well, except for the base year mismatch
>     which I explained above.
>=20
>=20
>         I'm not sure what is the proper to model this, maybe set this
>         value in
>         init()? If we suspend a machine, migrate it, and resume it, what
>         RTC are
>         we expecting?
>=20
> I forgot to reply on this one.
>=20
> I have not used migration very often, but I did manage to test it a=20
> couple of times
> using the 'migrate' command on the Qemu monitor console before I=20
> submitted each
> new version of the patch series. My expectation would be that the RTC=20
> time is suspended
> along with all the other state of the machine such as memory, I/O=20
> devices etc. So that would mean
> the time is 'frozen' until resumed. I think that is what we currently=20
> have here.
>=20
> Do you think that is correct or should it work differently?

Yes, this is the behavior I'd expect. Maybe other would disagree.

