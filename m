Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp647926wre;
        Wed, 23 May 2018 04:51:08 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZodBOpQ/wRo+/tgl5CZNBe13ImSQI3sBLKCE+z2LsI95HD+SZoarYHzwiY/oE3Jn8uwlRGi
X-Received: by 2002:ac8:2aef:: with SMTP id c44-v6mr2259483qta.380.1527076268078;
        Wed, 23 May 2018 04:51:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527076268; cv=none;
        d=google.com; s=arc-20160816;
        b=ORI5plqz/OiPev8frXDuAHkHMfJg+hMUCLdnEE49CswQC/ObJNEj7yYC3qi1DUPK+X
         hLqFlsHvx7DG0Ge3P4WxgVLoGfMayuiX4ptvZlajiT3AxZOPIM0FC+Ka+NneMh7EmSPS
         tRbc50PdhcJ7ebHuk6jdN/9Y5fjU2cnw0/Cby6V65AAZWDe+dLIBT0HoU4/dDTZNpS9J
         6IRxSQ/tNrlEiNiMiwmuVyqxCMANZ+WV8cAqFHwQs41YttLwcDNEbLiSc+6n5AYATx8o
         mQ13JXXVj/wG92nKCkqw8YyCiFq5Fk9Dcawnb0XJoZtNKyJ4AHD6yq8IN5+MCwRTATEk
         R7MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=sxm/NOnbpeD8G1ONz6eccrhuGnd8aF8DcrRkqQMv00A=;
        b=iXKylozj32t2j7WVvbd4XUKhSMXgAlLlik8VgFiSe//mGITCj5WmhgjTfbR9m5RmoO
         2TUmYZDMqaaxD32u8X7ewknh35hQWMhmZP7hrobzPHukUKuou126ycQL2kMnWx9J+U9+
         VACpfYyWVGtBQpvf9eeQLvarugdnBAWmN5ESDwrjHxF7wXMIInOnQXeoz0qdB6ZW+IQN
         UCUtIPywQ6ACZFCCaj7RpCIKyZaUV7amy2iMtGQZz3DeVsEalx8uTvf2p2zaTjMqIR9q
         MWPq6/X5bBKOSm4ntIo3a0IKmbePEQdlyExhX+56uAmSdtkjF9xae7o2vTYl9knWeEw/
         pQuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Eshdwy4L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o29-v6si1016420qkl.169.2018.05.23.04.51.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 May 2018 04:51:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Eshdwy4L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60853 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLSIN-0007wI-Jj
	for alex.bennee@linaro.org; Wed, 23 May 2018 07:51:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58868)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fLSID-0007vk-Ho
	for qemu-arm@nongnu.org; Wed, 23 May 2018 07:50:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fLSIC-0005CJ-PE
	for qemu-arm@nongnu.org; Wed, 23 May 2018 07:50:57 -0400
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:34920)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fLSIC-0005C0-KL
	for qemu-arm@nongnu.org; Wed, 23 May 2018 07:50:56 -0400
Received: by mail-ot0-x242.google.com with SMTP id h8-v6so24840086otb.2
	for <qemu-arm@nongnu.org>; Wed, 23 May 2018 04:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=sxm/NOnbpeD8G1ONz6eccrhuGnd8aF8DcrRkqQMv00A=;
	b=Eshdwy4Lg7waMSmlBLRrcj/pTfC18FJMgX2OXGXcGHjXycQXSAXvkNrom3eZlCVaMW
	aN4L65iQZ7UpbKOu7hr4/j2fGTTjHOkDsWfniKuph0VhF5HkF+r+HSKKzxkcVOdtOee8
	VR3zbouJZOuJo2XEsAi9FTX89Q7uSw3Tterw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=sxm/NOnbpeD8G1ONz6eccrhuGnd8aF8DcrRkqQMv00A=;
	b=AyVH/TgqYWULINZ9cZiF6vRkL18Vhwqi3dc4nbjn+VGNHOB99TPkbB/E+NiarCAOhy
	9xnKzo6U5bwyjeUbSR0J8a1eABbnWI7obovNc7z35EVO35WlmYn2O4V0N1Ga9Bo291Bf
	Q6J9QPCDl9vJ/j6kAqoCGRFxZKFMfoDpZGBgPxtY91h1/AnqtC6T4rEMLbtSpl7h25zf
	ZiezlPP9LvpsRkiGBTPPGTSgZmx0N0V18ieM9NzfM078OWMDRcc8nH8Yd5qhhxVDEPky
	r1OwLVWf1j0WpRPOMb3EfwUaOh4BCWY6ezOi3PRTPGzRKkL+SXL573kaezVM2QkF3im1
	pPXQ==
X-Gm-Message-State: ALKqPwc2IxtQobHRg+4Z1ocKFBW0vdaoABgqoqSAIQqVm9zdDHNouQDh
	AWGc8RzG4OyaWy58M4vZ/Je0kdTm/H3L/zYLbOJskOOf
X-Received: by 2002:a9d:255b:: with SMTP id
	j27-v6mr1625261otd.316.1527076255907; 
	Wed, 23 May 2018 04:50:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Wed, 23 May 2018 04:50:35
	-0700 (PDT)
In-Reply-To: <013774a0-6ec4-7a37-79c7-d3068b4cc5bc@kaod.org>
References: <20180522173713.26282-1-peter.maydell@linaro.org>
	<d8c13782-48b1-0975-ee2c-0d2ec2eecebe@kaod.org>
	<CAFEAcA_3P-JEsiz_3ZdVhG2kcQ+Y3yOAufLQtHknuzufRosANQ@mail.gmail.com>
	<013774a0-6ec4-7a37-79c7-d3068b4cc5bc@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 May 2018 12:50:35 +0100
Message-ID: <CAFEAcA-2q246LU77uxfwsdfE_iQ3ZNnqsrqZ-PQUc+zWGRGpDg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [PATCH] Correct CPACR reset value for v7 cores
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
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OddtS6M73Z5G

On 23 May 2018 at 10:13, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 05/22/2018 09:26 PM, Peter Maydell wrote:
>> (You're not using trustzone, are you? I know of a bug with
>> migration of cpus with TZ enabled which I'm probably going to
>> look at later this week)
>
> The PSR is :
>
>         PSR=3D20000093 --C- A S svc32
>
> 'S' for secure. Is that also trustzone ?

Yes. In that case this very likely is the same bug (we don't
migrate the secure-bank registers properly, so if Linux
is executing in secure state it doesn't resume right).

thanks
-- PMM
