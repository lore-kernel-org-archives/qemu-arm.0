Received: by 10.28.71.27 with SMTP id u27csp5055595wma;
        Tue, 27 Feb 2018 09:14:13 -0800 (PST)
X-Google-Smtp-Source: AH8x227mOg3m0wJlq9+bYZ/Qaswk4IMLlxk08OdKD+naPSPXB2sBkdDJDMbhf9suxe1+iSX7SFHT
X-Received: by 10.129.168.134 with SMTP id f128mr9870225ywh.136.1519751653614;
        Tue, 27 Feb 2018 09:14:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519751653; cv=none;
        d=google.com; s=arc-20160816;
        b=F3tlLozXhnV/s9t8BEcjunzkeb9CnxTS1bfzumpvbmKSpTXbqwVHj76r1zAVwUU482
         gdkbJgh8xCUWAYHihj9WMS3mA5MD9/IODUJ6htn+0j0H/h2OvLwo1G8LLW73ViPv2nnf
         5W0e95WEGfyo5UfUhVZsBHLr0H5CGfpaeY9ELEp4hLStF4opFOcWoKhFg5HyqB4Wv2x6
         qPPWC36Mwcb1D7Fl5Kuerg9FUgJi9jwc0Rj/BYrXtY8NS96HPriR+8V0bSjhugUOzfii
         azURoQnOZwuPBoSnZ/5mLJW5YUhkCNMM2PdFCNGuZS/4uBSuIxtj7VyF8GcHOVcmw7BS
         KREw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=iwjEF8xZpvQR6YDXgBDv3X4p6bKVGnRO2Sabg0RBZpQ=;
        b=BMMV48LWN+M6Z1UfOGB0HnN3V0VxqJxQyozRhHwUldgednkl6oTmpWDP4yCYoO+E2z
         9EE+vkEmMZytkoV6pL5SZuoOlNw1vnN7ErgDR6N2gqH4KHRwrPZeybTaNQ9r93Dp3BzG
         fDpM3BqPz7hb4Ic/PWUYU+7pCJ/en/VTxs+BCLkKbC2P/oU2aXvl+MISTKOXZid6CSNs
         GOBAf3arDkpRsPU4YwO8mUZel2soWtRmCS+8t4oMPWl2U9hcI5Gld4VpagZ4RsEZmd1h
         awlkvTunyUL6TJuAtEf81A8GeWkpr4WqZ3dQCsSFeqPPUAvASf6JSwqBaRO1tkFxcRh9
         01CA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EsD/tK+M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r189si1949523ywd.408.2018.02.27.09.14.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 09:14:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EsD/tK+M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38914 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqipQ-0006Hx-V8
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 12:14:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51896)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqing-0005It-VQ
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 12:12:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqinf-0006Ga-W8
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 12:12:24 -0500
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:36835)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eqinf-0006GB-RJ
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 12:12:23 -0500
Received: by mail-ot0-x242.google.com with SMTP id 108so4468919otv.3
	for <qemu-devel@nongnu.org>; Tue, 27 Feb 2018 09:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iwjEF8xZpvQR6YDXgBDv3X4p6bKVGnRO2Sabg0RBZpQ=;
	b=EsD/tK+M48bF/DRDEacAk4r/MWTzjHfKrTin6Sa0zx+zECDHTtwgd8KZqy/mjUInEN
	rqgqhQc27NhgtnLQj1rr42bM4jfr8o90uD7pV7YyPeUfGrqGzLCKfhuF71+c++yfHv1y
	0t35nIe9FFicw1uoeZoRqprXptAfFGVuBFfwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iwjEF8xZpvQR6YDXgBDv3X4p6bKVGnRO2Sabg0RBZpQ=;
	b=odCFgHg0DD6p4tVD2SOPD/GLsjDmyX0lust3AfSF2kLUWZpQQeNc/5OfeCUDQhKT/9
	tE5KdJTFTjnZGNqWGNxt5MsfFOkjY/jaJNABPDT3Y/Fo2VKlnE63GBvmpn1XsDz3QLWe
	PLBi+3a4o7ZyQMHsF9bDujn2I5ixUqi1f3VljpWyh+MIJUse2+QfxmlbdG+1qqmheDJA
	O8cWEvKH9v6czAXBZBkWr68zD4vapPrdsyqCeP2YUuS+wIUudecguJOn6+DGIDNE9ooh
	pFoTh6h9qaP6TvfsgirXMbYHaaxGVsgtqryQTT+j/lvrm28AZuPwerE3tQGd24hctfqs
	pVrg==
X-Gm-Message-State: APf1xPD3g9JpOq/jy6eiLxb8f5wefEp7iOuaTWlrdNgr5C+JG2OLpZVB
	QibcYXMAvhnCyK/EYDX/YWn2pgCfXyjd8H8FSOncqQ==
X-Received: by 10.157.27.17 with SMTP id l17mr11157344otl.294.1519751543209;
	Tue, 27 Feb 2018 09:12:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 09:12:02 -0800 (PST)
In-Reply-To: <20180227104903.21353-6-linus.walleij@linaro.org>
References: <20180227104903.21353-1-linus.walleij@linaro.org>
	<20180227104903.21353-6-linus.walleij@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 17:12:02 +0000
Message-ID: <CAFEAcA88tabmji-pa6HNBAyx8aXV7cX3z=S0iw-GTW2rBBgMDA@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-devel] [PATCH 5/5] arm/vexpress: Add proper display
 connector emulation
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
Cc: Corey Minyard <cminyard@mvista.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ClHo2p1k21J3

On 27 February 2018 at 10:49, Linus Walleij <linus.walleij@linaro.org> wrote:
> This adds the SiI9022 and EDID I2C devices to the ARM Versatile
> Express machine, and selects the two I2C devices necessary in the
> arm-softmmy.mak configuration so everything will build smoothly.
>
> I am implementing proper handling of the graphics in the Linux
> kernel and adding proper emulation of SiI9022 and EDID makes the
> driver probe as nicely as before, retrieveing the resolutions
> supported by the "QEMU monitor" and overall just working nice.
>
> The assignment of the SiI9022 at address 0x39 and the EDID
> DDC I2C at address 0x50 is not strictly correct: the DDC I2C
> is there all the time but in the actual component it only
> appears once activated inside the SiI9022, so ideally it should
> be added and removed to the bus by the SiI9022. However for this
> purpose it works fine to just have it around.

This last paragraph in the commit message can just be
removed now the DDC I2C isn't created here, right?

> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Only add the SII9022 now that it will by itself realize
>   the DDCI2C as part of the bridge.
> ---
>  default-configs/arm-softmmu.mak | 2 ++
>  hw/arm/vexpress.c               | 6 +++++-
>  2 files changed, 7 insertions(+), 1 deletion(-)

(if this is the only problem with the patchset I'll just fix
it up in my tree)

thanks
-- PMM
