Received: by 10.25.0.147 with SMTP id 141csp1289597lfa;
        Mon, 6 Mar 2017 01:46:31 -0800 (PST)
X-Received: by 10.237.33.69 with SMTP id 63mr6328947qtc.109.1488793591885;
        Mon, 06 Mar 2017 01:46:31 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 13si15054498qkq.210.2017.03.06.01.46.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Mar 2017 01:46:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42657 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ckpDp-0000ks-9d
	for alex.bennee@linaro.org; Mon, 06 Mar 2017 04:46:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ckpDl-0000jm-9D
	for qemu-arm@nongnu.org; Mon, 06 Mar 2017 04:46:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ckpDk-00032f-F1
	for qemu-arm@nongnu.org; Mon, 06 Mar 2017 04:46:25 -0500
Received: from mail-wr0-x22f.google.com ([2a00:1450:400c:c0c::22f]:35438)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ckpDk-00032R-8s
	for qemu-arm@nongnu.org; Mon, 06 Mar 2017 04:46:24 -0500
Received: by mail-wr0-x22f.google.com with SMTP id g10so112209122wrg.2
	for <qemu-arm@nongnu.org>; Mon, 06 Mar 2017 01:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=HNwF2Y79IZcSOk4d2k73ol1yvteId1IaJSYxXQr1ERE=;
	b=NLupeXQlD7NIsSRzU1jb+cTOvzq5MVotqvEL4eR96rtdxu7wCsB9ZttrFOTf1TJSeP
	3mqEXqlEwpZrpnqOVdD7xyA0sC2+pECVCkecRJ9tNYJXBvFhQ0y5hFIDfz5r6kWnaMWu
	5OuL1BRNNVU1q0+U8EvQVwSlw2F2aeLmsKLNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=HNwF2Y79IZcSOk4d2k73ol1yvteId1IaJSYxXQr1ERE=;
	b=CZnONPgW+aiL2RBhHdvnIw1X+i+kUHIRGEsimJfOs9t+N6MAQoviG0I6qk1QmH/PTW
	wF4aKBFiWNDn1OJ/e6rOCDiA54x4kSnIhYbN7qO6r5ILEOt9TVPINgvpkcG2Mp8R4Jn0
	mBBy41bOcKDPD0SQbVTmMnnvIdVboZ/fE2zuIJKY05c6EvDH2RipYpKJs3JUuZ2QKnrb
	6TU9TfZzxcIbTX8eLbMVWhU+Jt8/q//rBlQU2Q9SitvbEg5Kk6p5wP4vx+axDw6HOmwa
	dyEo24wx8L4IXANkyqy+X0XgQ+0lD/L3RbPK6i0Z8dmxJA7wSV76K7xja3NDfavkJH07
	ytqQ==
X-Gm-Message-State: AMke39mS+YM4Z0glC+9Jj/W1ZpRJzhX3Lc9dpFB57mc5+JaMSlmmWWmEYspnv5IkXRSH6AVUWop+VXc555O9tvkF
X-Received: by 10.223.152.215 with SMTP id w81mr15228377wrb.151.1488793583239; 
	Mon, 06 Mar 2017 01:46:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Mon, 6 Mar 2017 01:46:02 -0800 (PST)
In-Reply-To: <2130c1b2-0f81-13f6-a1f8-c0a2e294e3f0@amsat.org>
References: <20170305214857.9510-1-krzk@kernel.org>
	<20170305214857.9510-3-krzk@kernel.org>
	<2130c1b2-0f81-13f6-a1f8-c0a2e294e3f0@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2017 09:46:02 +0000
Message-ID: <CAFEAcA8DOfstrMiEBLsgf6U6S9uT9ahA1ALrJdmQhcV+7K8Obw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22f
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9R20zdS18bIa

On 6 March 2017 at 04:06, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wro=
te:
> your change seems OK but while you are here, 'unsigned' is considered
> harmful since more than a decade.

Considered harmful by who, and why?

thanks
-- PMM
