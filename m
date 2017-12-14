Received: by 10.223.159.74 with SMTP id f10csp6615638wrg;
        Thu, 14 Dec 2017 10:04:26 -0800 (PST)
X-Google-Smtp-Source: ACJfBovcXFONTTPIVnSdv/lZa6aVqxCj/4cdFa+vtEyalJxVWbyuf5zfTvuGx4hpGyJsOId83WvL
X-Received: by 10.37.37.146 with SMTP id l140mr4936420ybl.267.1513274665923;
        Thu, 14 Dec 2017 10:04:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513274665; cv=none;
        d=google.com; s=arc-20160816;
        b=Mf7uYFVAqkVonsxjzhRr2xY1J40ItoN5G37za11EKcxtc+CRmNGfRofLkkiigkELnp
         5eC/G4FjHrPp0XQqvT2YJFsHBAfV515rK2sRpNGB9aEWLgjN/lN0SorvnfWTJR9MUgNr
         K8ftrpjpU5aLnfjQy32RrySFm/DB6btV2NNwydQ679k2odPU+ONSRxxnNjc8Dm1xgu3s
         pAOc6yXmJ1SESsBcQ46nzuTBOTFuRNWlEu8ftPFuOtwA0cZvSoSgsSCOcGLFmHr0TkZD
         sbT42ov/B0J4Jt9r1P70Pnu9SxFcN2PhIFLG79pj5Dk2J4Af607iIXj1MaACRsD24PIQ
         3TIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=NFYn6vTxQKHFr5uI24pE47QOneUiu8a4qazcugep650=;
        b=QzUvMEMcTTDDhXI5xtu8jb6Fz6IFdEAaUlUJX8leMZvSOFOyIj7hZw36UWxgemUWjB
         wQ2nOuAyfKtVz5CKvYpKsghFFhhnP4dYPUB0KhcSaIRk23nLWMZ6b05CaZzjLL4+AruG
         nlUm702NSmw3NBTtKvpfE/Ia+8yoMleEDimKpumeffkBX4z6YyvvdwPWPZJK5i2lu+XQ
         GZLzOBOjfzrLhgt2y9LKSbbUqBjxHf+kG5YEN3ep+VIBdDU+ivaInreQK3BIceNPPLrF
         190Wlk0/x9jyD4OmCNVedd1gORDEOtS5Zpvk9EWbwvFDgusHPcfmFxXu14jxJ8T5tA32
         XUiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=f4XZne+E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s184si920186ybf.531.2017.12.14.10.04.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 10:04:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=f4XZne+E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42499 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePXrt-0002uc-DK
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 13:04:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58436)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePXnM-0007wB-4P
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 12:59:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePXnL-0004Qy-Em
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 12:59:44 -0500
Received: from mail-it0-x242.google.com ([2607:f8b0:4001:c0b::242]:46564)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePXnL-0004Q9-9p; Thu, 14 Dec 2017 12:59:43 -0500
Received: by mail-it0-x242.google.com with SMTP id t1so13287092ite.5;
	Thu, 14 Dec 2017 09:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=NFYn6vTxQKHFr5uI24pE47QOneUiu8a4qazcugep650=;
	b=f4XZne+Ex6aAZ9X1dTuC7UXfphktnCEGMG4X9mjWUZjxxjUKa5dRjLwz1vXsfuVUVC
	QWMi+VyXoo/NhIcyMLF97kTHl/OA5g7nEhq6isVvzKBg1HZVBYUwdnszMnUus0bAomcd
	fmYiTwCZQOAajtIy32Cr0WCam3+Vg37a5ZFSk2j2yZ/VnbX1HYsWX7m9FBhvWKevp7lO
	MSaDqNdjuHlnnsU/gC/vk5c6BhsjwfZdZSMR4lgu192FX4bm9XLD/bjqMwJ2iX/iIz3o
	RGFn+BmrED9XIJAxcSg3K1UTq2v2ksJwCHXZWy/VJIx+X48J4bx813Kh4E/WDMzBBsia
	PAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=NFYn6vTxQKHFr5uI24pE47QOneUiu8a4qazcugep650=;
	b=Ic50SJo1lCuYKiPMZLlnXZraE2Gkl6J8F1AUqerBkyA2bYSg4+TTsshzEgPZb6dU8l
	sKzTcspELawV5R01ZSYTED4PWMjBVs9qCztHfmSW77D39N1sCbso910ECr3Z8joetpDm
	igqSI9RHoEpRvfQBUPPNmd/uEWPRy2iBL9eRy824KSHUh2LaySHo4oXoEaU+L5afvxnr
	jjoPkg18FAX9TDgb+UAE0hwRrpbw3Q9rfBwbrl14VDR/ukmf+6PZjLTXEVjWZvjmTx73
	J/QMW/ZO+ZvM+aZK+5HrQawZvqHWkmwYL4V073zl4cihHlcF9Q7ds1CwtQIfQJ0aEwvY
	0z9w==
X-Gm-Message-State: AKGB3mJDcFfkNGYHO/JoOG71EEjIN5KdpZiQtnQHNNnXKxj1JgxI24VA
	Zmv77oi9yhgrkrpz3OpM3bmMN3V1Hd7o2QEopUU=
X-Received: by 10.36.94.202 with SMTP id h193mr4162292itb.129.1513274382505;
	Thu, 14 Dec 2017 09:59:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.2.183.19 with HTTP; Thu, 14 Dec 2017 09:59:41 -0800 (PST)
In-Reply-To: <CAKmqyKNSGCndaHmpGPOYGX7jrVbse-ahT=dEdY9XQVm43=AYZg@mail.gmail.com>
References: <20171213195852.30439-1-f4bug@amsat.org>
	<20171213195852.30439-2-f4bug@amsat.org>
	<CAKmqyKNSGCndaHmpGPOYGX7jrVbse-ahT=dEdY9XQVm43=AYZg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 14 Dec 2017 14:59:41 -0300
X-Google-Sender-Auth: wN7UC8CW-drrqTDGEM31O_aR6Jw
Message-ID: <CAAdtpL4gPTyMo-a0sNDN0F71wBca3gTfU0NBOr7ZHkmWDXwJow@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 01/14] sd: split "sd-internal.h"
 of "hw/sd/sd.h"
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xx6xDFMC9nzx

On Thu, Dec 14, 2017 at 2:50 PM, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> On Wed, Dec 13, 2017 at 11:58 AM, Philippe Mathieu-Daud=C3=A9
> <f4bug@amsat.org> wrote:
>> Now only SD 'producers' are able to use the "sd-internal.h" API,
>> while SD 'consumers' are restricted to the "hw/sd/sd.h" 'public' API.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> I don't see what this gets us. Why bother moving this code into an
> internal header?

This helped me to sort out the QOM design, however it is indeed not necessa=
ry.

I later use the registerfields API to add a bunch of other registers
and bitfields, so I prefer to still move the register #defines in
another internal header, else this API header get pretty unreadable.
I'll respin this series without this split.
