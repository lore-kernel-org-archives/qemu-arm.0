Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2706865wro;
        Mon, 5 Nov 2018 07:21:02 -0800 (PST)
X-Google-Smtp-Source: AJdET5esQbAnOLdZkjyVA75F7XN9sdxpajzwERvJ8lAgtSKzA12iGmwavhqH+3fzhVL3xaBmoyCp
X-Received: by 2002:a0c:88a8:: with SMTP id 37mr21251176qvn.63.1541431261991;
        Mon, 05 Nov 2018 07:21:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541431261; cv=none;
        d=google.com; s=arc-20160816;
        b=KM6E4qufAsXxLoWiwPXc1UpK1Op7dKKIIELYzUnrecDMW33pDw5sPdO++G/CuCZupc
         +CioH0R0dehVh/PoDrla65i/e7zIb/GI3uOxGbyx/tuGKHT7EkS/TgTDyrnEOulMdtoW
         +6AGSQi6zgr8ph55t2vCJns3nEt9mn2pgIJloaen9TEMESV89Cp4qxz0HpR+c/RYVgA8
         qTBPYHy8rF5fA11J994sx5mFZLJqJgUeXlu/cX2q3h2iSxb3/CQ1w8iPGsHmS0nzhzJB
         fI3AAXIju69HbG8/+0g+8NBIJv+lU59+O2oNK7WAwsu3Geo5dfiKAiTHmrwItvOBwhnT
         7krg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=7ZN4vbBnTUI7oO6Cuf5wRl0kX71cylfK1hS0zWdRAT4=;
        b=of3/PSu35gPmS8V1dtojOMNd+P5nLc9DIRLi8GUdQSzKncXFlWub/z7t9CdY77R51+
         H4m5KSLhs5VBXp6DdF5nkG8vQbraMDcek1gY/e40o+jWJxOuRGeiY8Yrc9lWseN2OvWP
         Kfbj3dOsya+1xc4jOcCWt/WTvJ3ukrMLR2Ue9cyusQOll7EscARqJXuDxwa5qnjQN4pw
         ChvAirr5S/E7dOsgPoipbcVXDRJ8RmlhKdskKGjy4QQmwbbq+MnMWF1Wg46LbWOfX/qN
         TDKqj60J2N8EW2Yx0sRZW10P2u3rD6dGmIxA4/wHXHDhZSHrHsJOS9z2rJ8l53vUgBuu
         TFkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BSGHRFWz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j47si1006223qvc.124.2018.11.05.07.21.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 07:21:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BSGHRFWz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35760 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJggX-0006Om-4C
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 10:21:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51512)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gJggM-0006Nh-EF
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 10:20:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gJggD-0001k4-Tk
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 10:20:49 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:46687)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gJgg6-0001Yt-Kh
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 10:20:35 -0500
Received: by mail-ot1-x344.google.com with SMTP id q5so8233708otl.13
	for <qemu-arm@nongnu.org>; Mon, 05 Nov 2018 07:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=7ZN4vbBnTUI7oO6Cuf5wRl0kX71cylfK1hS0zWdRAT4=;
	b=BSGHRFWzKYMy7LjwOBcT28ndvni21AQWhEsB7ew740vxCDQCyhthtWAVMnb4ZUVmzR
	e6ntubVf9KBWAY3s3+dVbUe4kjza2E4b+9OmRla7+os5Xl/gU6UQGlhcwzkaBS2KxwxK
	IRZZfBBUZeQhwmWmC7qbOvYhYcOVO3M6CnMFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=7ZN4vbBnTUI7oO6Cuf5wRl0kX71cylfK1hS0zWdRAT4=;
	b=UTCSlvdbaRrtoakWNe+lp9C0q7/TBBNUuSvabl399Y+aZxJK9kirgopFrv4TNLWc17
	mOovGtU7I0AuCYxP8hQu+qm5zfYj69ZNvR36efk1hrNuv8oYHW7sJsQHie+SRXuwNMy2
	vjhya+r6PWb2D5oWW6gHk6jRBznxl8RLaHaZvcnrT7aWEgODoRO1CCjpFUx0W3GI/nC1
	lKDDZdeRzUuweP98eqVlwhi9KN4+2JVRALqRDzbUAgnG9uNQ+NmMaai0H8vpxpi+3lzG
	2Jp22/WYHQ7mFmU2BARpPMmxhg/y0CDn0rsZ/m5SH/AJ8WGcZzeQI3TmEtxSn9BKlZm7
	v6GA==
X-Gm-Message-State: AGRZ1gK7/0XzUP/LU8HuXqPJ0yyPEkmEE9XOk19F4eOIW4tIDnoMPV9n
	bZbKHA1ucWo2Xy/2Yk6VjMZ3UUP1WR34MODZg/WSeg==
X-Received: by 2002:a9d:582e:: with SMTP id r46mr9013589oth.238.1541431233294; 
	Mon, 05 Nov 2018 07:20:33 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP;
	Mon, 5 Nov 2018 07:20:12 -0800 (PST)
In-Reply-To: <20181102001303.32640-1-f4bug@amsat.org>
References: <20181102001303.32640-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Nov 2018 15:20:12 +0000
Message-ID: <CAFEAcA8kho6tBJMB6qXgKEq_tt5GQm1wHE96mqoM_vx95x44Pw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH for 3.2 v2 0/7] hw/arm/bcm2835: Add basic
 support for cprman (clock subsystem)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sNKYUHOh/dcw

On 2 November 2018 at 00:12, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> Hi,
>
> This series is a mix of a previous work I had for the raspi, and a patch =
from
> Guenter: https://lists.gnu.org/archive/html/qemu-devel/2018-07/msg03153.h=
tml
>
> The final patch keep Guenter ideas and comments, but is mostly a rewrite.
> I dropped the A2W code from this work, it doesn't seems unuseful to me.
>
> Guenter can you test this series?
>
> I kept Guenter S-o-b and (C), is that OK? (Guenter?, Peter?)

Yes, that's the general approach the project takes. If you've
made changes to the patches yourself you should note those with
something like
[me: changed foo, bar, baz]
after Guenter's signoff and before your own.

thanks
-- PMM
