Received: by 10.28.71.27 with SMTP id u27csp3836422wma;
        Mon, 19 Feb 2018 06:10:32 -0800 (PST)
X-Google-Smtp-Source: AH8x226OW2a+o8SiZToTq5yRevsN0zCKID2BSvhQopYcnFAZhB5IuHee7DSoxAKnX7MpLbb1TF5w
X-Received: by 10.129.165.211 with SMTP id c202mr10734559ywh.487.1519049432437;
        Mon, 19 Feb 2018 06:10:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519049432; cv=none;
        d=google.com; s=arc-20160816;
        b=F2jhzd35tThPy1XBn8wTWPhBlsc1AZTYnswlrm6rzOOEfvIrdrhIVjqVvf/wpG80Kd
         oRop/BnmlSdhsTVsoSrL2WGuYLdw0pknV2DgJHxv5SC/ZjgZfAEJPdDHZh8JBGdWxXud
         f4PHwrb4gmxje2MOB03N1t+/VZyedL3fFGCCTi1+2t0yaLLm4RpwPsz8TLZPC6Mu5UbM
         wmRuddFgo9+5H47OSkD6hRJt9+fhkHfXnYBoeovQ3jabkhbVlrsZGAX7oK0eWw8bM2LI
         H63/EwPASVNcSri8wXwrqLg9KZo6edIjmVIIlgPfigctDuIqnTSeaIxETSjYodOMpPok
         9YsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=2nVIPiH2JlS11XIh2GWvJ4AkBZkLNf+u1ZkbR6p49Pk=;
        b=TunZyGX6G8X4K5pbICjuqylgKQLgqek9+AsomIVB5sqyd4XWbSqd9ofxz4/c/yD56C
         I5DugXC7bQvZ48QTy4MpNLcCVW9UzPaErJW0YkMpPYQ5t8NgFl8/YFg5YoqdbcVbUBYS
         3mrAYnEFg5gjAIHbhhULlDYRfoIdxfH9023cKqaPUWSdieEZ5eH+8b1NB1i2axeGt3v+
         KRLEKz4M79+5cjNI3hn9MTzFkphsgMZ/vbADoNAJEeF31BfTBU9ixNWGNwrNL7f23kmP
         Yj4jx2CtrHv8Hccpx9iGdHdR/3d56H7cBrP7Kp5Hlu5mm65v+kiCNKsbuF9RGtvZSXBH
         tSZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WLP/9BfV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q1si1799749ybd.808.2018.02.19.06.10.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Feb 2018 06:10:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WLP/9BfV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50506 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1enm9H-0004ua-Rm
	for alex.bennee@linaro.org; Mon, 19 Feb 2018 09:10:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59219)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1enm97-0004uN-3W
	for qemu-arm@nongnu.org; Mon, 19 Feb 2018 09:10:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1enm96-0002WD-4T
	for qemu-arm@nongnu.org; Mon, 19 Feb 2018 09:10:21 -0500
Received: from mail-it0-x244.google.com ([2607:f8b0:4001:c0b::244]:55760)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <linus.walleij@linaro.org>)
	id 1enm95-0002UV-UO
	for qemu-arm@nongnu.org; Mon, 19 Feb 2018 09:10:20 -0500
Received: by mail-it0-x244.google.com with SMTP id n7so48667ita.5
	for <qemu-arm@nongnu.org>; Mon, 19 Feb 2018 06:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=2nVIPiH2JlS11XIh2GWvJ4AkBZkLNf+u1ZkbR6p49Pk=;
	b=WLP/9BfVENxFsMIG3VzEIiWG6X5rPJUFVuXoSqlklSq4GWIP5dxEhmjEJ8QbTrfcPf
	17AsIIQN8jmHtBfVfCXOfhadFt8BKcBDzSvl/oOZOGWxnLaMtPfAWOSsaNVrXO9rxTcD
	GA2LNfpXSovWP616qDHN63jQ9rx5WsLmr5mJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=2nVIPiH2JlS11XIh2GWvJ4AkBZkLNf+u1ZkbR6p49Pk=;
	b=l7BkQYSaxro1q+ZAW07bcGYdjID/4YqkJ8+ZbYyeXt1vrIYHExJA61Cibj1on6aL/l
	Ls1a0fADj+NoRKmPYVrjhnVRZNtXY+RbDnldus/zyUhRuvMR0Tl6NMbX+9OJqj4G2oyN
	bBTPdDvQjPMLw4LiiWc9JF5VCkPFk38+FWQ7IO8kgnu/FJ40Qc+ayfb6NuWdoqALU++O
	hfwrH4TEv5TAnywyRLeBluHZhdX1jvrNICiknD9u3YlZVjf1JloodKwxfKjYfE0Y3BYA
	Tu3grWL+6VPC8+zJtlc7/Jfx7tHyZ3yigeV3iQfS6WvPqEpU5vskcH3N2+OYEVq3HRd3
	mbxw==
X-Gm-Message-State: APf1xPD1WmSI+SAy6BdsTohXQYQaoC4Kih6EElmbfK0BRQImiB9axKgi
	OvswRLidGRxEUFIvKXBwMgCgdCFsL3QIz9IwC8kmtg==
X-Received: by 10.36.159.134 with SMTP id c128mr9268691ite.135.1519049418951; 
	Mon, 19 Feb 2018 06:10:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.230.25 with HTTP; Mon, 19 Feb 2018 06:10:18 -0800 (PST)
In-Reply-To: <3f009bb2-fb39-36ff-b3ed-a9b8c63db081@amsat.org>
References: <20180217140051.22731-1-linus.walleij@linaro.org>
	<20180217140051.22731-3-linus.walleij@linaro.org>
	<3f009bb2-fb39-36ff-b3ed-a9b8c63db081@amsat.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 19 Feb 2018 15:10:18 +0100
Message-ID: <CACRpkda9B=frmS0QF429p-q+KoCKG=5NON-kQ0Rt-nba2powRA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/3] arm/vexpress: Add proper
 display connector emulation
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5l4H2frcgjFy

On Sat, Feb 17, 2018 at 7:28 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> On 02/17/2018 11:00 AM, Linus Walleij wrote:

>> The assignment of the SiI9022 at address 0x39 and the EDID
>> DDC I2C at address 0x50 is not strictly correct: the DDC I2C
>> is there all the time but in the actual component it only
>> appears once activated inside the SiI9022, so ideally it should
>> be added and removed to the bus by the SiI9022. However for this
>> purpose it works fine to just have it around.
>
> This seems easier to just do it now rather than postpone :)
>
> In your patch #2:
>
> static void sii9022_realize(DeviceState *dev, Error **errp)
> {
>     I2CBus *bus;
>
>     bus =3D I2C_BUS(qdev_get_parent_bus(dev));
>     i2c_create_slave(bus, TYPE_I2CDDC, 0x50);
> }

I tried an approach like this but the I2C_BUS() macro was not
publicly visible in any header file and trying to pry it out just
brought along a lot of refactoring in the i2c core.c file that
scared me away...

Has someone else fixed it already?

Yours,
Linus Walleij
