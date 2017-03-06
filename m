Received: by 10.25.0.147 with SMTP id 141csp1365743lfa;
        Mon, 6 Mar 2017 05:16:53 -0800 (PST)
X-Received: by 10.55.48.147 with SMTP id w141mr14300714qkw.306.1488806213097;
        Mon, 06 Mar 2017 05:16:53 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n62si15425003qkf.156.2017.03.06.05.16.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Mar 2017 05:16:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43818 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cksVO-0000cb-9U
	for alex.bennee@linaro.org; Mon, 06 Mar 2017 08:16:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53096)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cksVB-0000Zz-Vw
	for qemu-arm@nongnu.org; Mon, 06 Mar 2017 08:16:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cksVB-0004X3-2y
	for qemu-arm@nongnu.org; Mon, 06 Mar 2017 08:16:37 -0500
Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236]:37136)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cksVA-0004Wx-Sd
	for qemu-arm@nongnu.org; Mon, 06 Mar 2017 08:16:37 -0500
Received: by mail-wm0-x236.google.com with SMTP id n11so64111409wma.0
	for <qemu-arm@nongnu.org>; Mon, 06 Mar 2017 05:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Yv/4zqSAsMvQH70LQUUIBwA7MroCWPvxRICdl6XNDqk=;
	b=HjyWkisFVcLB3CE/14H9940qFH0b2XwQrWkmJxnzCu/bKBINpsphD6NpmeeYNf3NAs
	ISKgl4vXQuNRu9FhDOBCu8E+BQhP/TljsKwiseG191+pRYOdDvININiKqPnBKKE3VXtJ
	MGEzRzghyDUxQs3RDb+I+kBfCc/BkR0pnySTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Yv/4zqSAsMvQH70LQUUIBwA7MroCWPvxRICdl6XNDqk=;
	b=gckdhy5t0vvdBZTBUpUTFulckPtw3nehZQr98s46EpsVMRYvqB5j++OI/B71zhj/BJ
	9YDxsfEHQUIPfb3tVNcDHbe8CRgWIuYK2w4kDQc2VSrRAVe81KKo3b6Sjeek2imaAlYE
	sA/BCtvGraEdIXILCyn5wdcjNjhY+AUSqxCVL0qahOl6JyTJL3Me506ESkG7tMGmUV8D
	JrhgRONIE5S+MFTWAj2SbOtXFrc1z9TBrDm6mvs6CKiSvETRP6ShQtZ2oTFwvkNYkV/N
	nmL/wGjgoaB6fuMI42Gn9jwDhyD3IZfgVUQ7EiuMH3V/7kucgbOwO/fk/VIBEMUppwGZ
	6+Gg==
X-Gm-Message-State: AMke39kgdu+0pSENod3oXMuLc1/CJ6z7qYhctJavoloicJejqohbmLAN4RD+k9d1TaXpRyrrmHqb9RBjx8xTJKuW
X-Received: by 10.28.172.68 with SMTP id v65mr13080080wme.111.1488806195862;
	Mon, 06 Mar 2017 05:16:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Mon, 6 Mar 2017 05:16:15 -0800 (PST)
In-Reply-To: <4989d5b6-586a-de18-e8e6-6ab9e9ac131c@redhat.com>
References: <20170305214857.9510-1-krzk@kernel.org>
	<20170305214857.9510-3-krzk@kernel.org>
	<2130c1b2-0f81-13f6-a1f8-c0a2e294e3f0@amsat.org>
	<CAFEAcA8DOfstrMiEBLsgf6U6S9uT9ahA1ALrJdmQhcV+7K8Obw@mail.gmail.com>
	<4989d5b6-586a-de18-e8e6-6ab9e9ac131c@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2017 13:16:15 +0000
Message-ID: <CAFEAcA-6yQ=95hGdia6TDhq4C-swOJ1iZA8C+u99Dy9kfG+f0w@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::236
Subject: Re: [Qemu-arm] [PATCH 3/3] hw/misc/exynos4210_pmu: Reorder local
 variables for readability
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yP9VTl5rMq5b

On 6 March 2017 at 13:03, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>
> On 06/03/2017 10:46, Peter Maydell wrote:
>> On 6 March 2017 at 04:06, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>>> your change seems OK but while you are here, 'unsigned' is considered
>>> harmful since more than a decade.
>>
>> Considered harmful by who, and why?
>
> It is true that unsigned has all the disadvantages of "int" (it may be
> smaller than the size of the object" and all the disadvantages of
> "size_t" (it doesn't optimize as well because the compiler cannot
> exploit undefined behavior).
>
> I wouldn't call it harmful, but it feels like the worst of both worlds.

size_t is a pretty silly choice for a variable that's looping
through the number of registers in the device, which is a value
that would fit in 16 bits, let alone 32. I would probably have
written this with 'int', but use of 'unsigned' doesn't come
very high up on my list of things to complain about.

(since we use -fwrapv the compiler can't exploit undefined
behaviour for signed loop indexes either.)

thanks
-- PMM
