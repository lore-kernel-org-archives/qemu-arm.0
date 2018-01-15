Received: by 10.28.173.206 with SMTP id w197csp2661485wme;
        Mon, 15 Jan 2018 04:25:07 -0800 (PST)
X-Google-Smtp-Source: ACJfBosRgk0E+doHUSunryEM1ZrqUozq2Alm8BseMuV33LiEvvjwqy+vYk7+TYHdXegFWOio0wOe
X-Received: by 10.129.86.139 with SMTP id k133mr22986726ywb.253.1516019107630;
        Mon, 15 Jan 2018 04:25:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516019107; cv=none;
        d=google.com; s=arc-20160816;
        b=CuCYpZs5UeiiF1mYJHZdJLZNxY6oQZDgX5Of2LJHfidMMTs38Mdb8kZ6UWAzl6jW80
         wYYa8QeFBdjIuqpc97IYvP0CQPm+CDfJcakL9ISrI8RS/pYQ+QMQcW5UNxENOl0rivHM
         KOWx1/rugZ1hGfU9sTunDMNw2p01nID0PVAYJF+KsjB2/gPClzs+QvbUilAHp8/tfOJf
         II/JShTYiEuz8wL+15Fo0AUyy0Td/Bo7xfNX/q8dR3f0l+IKgJ9EAegAQ0xh2R772ngd
         1iHKESW3VPpNB08jamE0SXWTML0q1WyjCsygicR5fHJcI50HxJc+si3GYTlxr3nYIQOr
         vLpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=C5HuJRfuMKpAB42cCGWv/30opL9FuUkrtsBbnNDprQQ=;
        b=0FE97kuoYtbuysCy65FIV9FTfYMel1YKYbrKzeduA4/GAS1I1J383J3n+YDQgRW+23
         UMNhABw3cSFrO4IH2R7gmNEL4TWGQ/YW9KYoBrVNR9/m86E1lstiJJ7wBXkS2NC+QFQX
         wSpRBElrAXOjwjGirHa/8oxv4gScNNpYAnx3zyfv34x1H2Y7lUaPYCBThW0qbdWObpiH
         TYfDUCibxD4T8qsFHEJud9HH1swDn7b28nXdmgKUUlY1B2hb3v+c6lHvVauHVl5gl8ts
         0P40AP39N3ABM3GKfdrOteI1QEy87XB9EhDGVLKLslalzvMVJOp7/I6dydeXV0Bqgv/y
         NIWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CDSknDya;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t13si1982743ybc.681.2018.01.15.04.25.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 04:25:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CDSknDya;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60105 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eb3p5-00075O-1f
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 07:25:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54288)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eb3Y3-0002Ka-RN
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 07:07:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eb3Y2-00046H-MT
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 07:07:31 -0500
Received: from mail-ot0-x22e.google.com ([2607:f8b0:4003:c0f::22e]:42736)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eb3Y2-00045y-HO
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 07:07:30 -0500
Received: by mail-ot0-x22e.google.com with SMTP id s3so10432578otc.9
	for <qemu-arm@nongnu.org>; Mon, 15 Jan 2018 04:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=C5HuJRfuMKpAB42cCGWv/30opL9FuUkrtsBbnNDprQQ=;
	b=CDSknDyaflwR9uik8KTfpQAPM5HUoV+F2FrvVwCimigU49D9412rJC/WdDG9RJTsua
	ONXNyq4M1m5BE6g8dWvZvv1dFq6EgfOEnJJ8SQz4wFdRnq95R1yM/L7+rOofTJaT4meW
	kS5A4DQPWWYaLoH53OeqpjgnrvF+K36+pg9ek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=C5HuJRfuMKpAB42cCGWv/30opL9FuUkrtsBbnNDprQQ=;
	b=ZhMOh0yPywzS24tXqrEhp6wbC8pg1z2JjjbkJzG3gEfyaVWAn8Lf59LcLrXli455NR
	KExKJuuoxK1a2bvW8ZkhFTj95Uxp1Ui1KgsJh+bBFnOmAAkiDdZd6IBj8xwo39zthqER
	hVJRLgJByijq+Sz40GsHWQgQFMILZxs2bBU67GXDkx7t1lMXauV5aGcn0v+laU8gxy+O
	vRSkW3uGtXo82TUB/Wt36bXN5p12CRd+Yo9/WFt0X98h7ugYf3dfOua1uriKIcSvpV3D
	SOmCVZNOe8dkKoEtDyb/+hMQVpq82E/7WxcRVLqjKQ3RtMYW2lNXqaoR09uw0tfWGDn6
	XZ8g==
X-Gm-Message-State: AKwxytfr3xZvwaV7ueyjl5iyhxA56Ga+tYseN9wq9In5kEmBA+3T+Jgv
	j3uTXvJq8vDmS/x1lCbNrVyh2phX8WO1W2iw/JQ1TQ==
X-Received: by 10.157.2.175 with SMTP id 44mr18311610otl.335.1516018049827;
	Mon, 15 Jan 2018 04:07:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Mon, 15 Jan 2018 04:07:09 -0800 (PST)
In-Reply-To: <d7f23db3-6669-76fe-661e-a5b506cfbeaf@amsat.org>
References: <1515506513-31961-1-git-send-email-peter.maydell@linaro.org>
	<d7f23db3-6669-76fe-661e-a5b506cfbeaf@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jan 2018 12:07:09 +0000
Message-ID: <CAFEAcA-bwHPH0W2WDOzoKrvTLff7WS-KN0NpRkP7tR=geL-HSw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22e
Subject: Re: [Qemu-arm] [PATCH 0/4] Reset SD cards attached to legacy-API
 controllers
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
	"patches@linaro.org" <patches@linaro.org>,
	qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kf0Ck62xJe0X

On 9 January 2018 at 16:13, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> w=
rote:
> Hi Peter,
>
> On 01/09/2018 11:01 AM, Peter Maydell wrote:
>> It turns out that we don't reset the SD card model if it's
>> attached to a legacy-API controller. For new-style controllers
>> where the SD card object is attached to an SD_BUS, the generic
>> qbus infrastructure takes care of ensuring that the card's
>> DeviceState::reset method gets called. But for the legacy
>> API where the card is created by calling sd_init(), the card
>> object has no SD_BUS to plug into, and so the reset function
>> must be called manually.
>>
>> This mostly had no ill effects because a guest OS will typically
>> perform an SD reset command as part of its device driver init
>> sequence. However it does mean that migration won't work, because
>> it's in sd_reset() that we set up the wpgrps_size field, and
>> without that the migration struct on reload won't match.
>>
>> This patchset fixes up the four legacy controllers to call
>> reset on the SD card device in their controller reset functions.
>> The first 3 are cc:stable as migration bugfixes.
>>
>> This fixes https://bugs.launchpad.net/qemu/+bug/1739378
>>
>> Philippe: this probably clashes slightly with your sdcard
>> patchsets (and where you've updated devices to the new APIs
>> it becomes irrelevant), but I think we should apply these
>> first so we can have a simple patch to backport to the stable
>> tree.
>
> Sure, it makes sens.
>
> I didn't test migrating a card (but have a "sdcard migration qtest"
> entry in my TODO).
>
> this series:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Thanks for the review. I've applied this series to target-arm.next
(with the fix to the milkymist commit message and the removal
of s->mod =3D SSI_SD_CMD from the ssi-sd realize function that you
suggested).

-- PMM
