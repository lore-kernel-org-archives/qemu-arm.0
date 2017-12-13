Received: by 10.223.159.74 with SMTP id f10csp5302210wrg;
        Wed, 13 Dec 2017 08:49:26 -0800 (PST)
X-Google-Smtp-Source: ACJfBovvWkGU98aWg0kqLMKomffLmsit1lbKJkMUDTDidE+xbxHWaaU7xFt+ClhLDsNZAOq7p5/q
X-Received: by 10.37.170.199 with SMTP id t65mr1447012ybi.398.1513183766208;
        Wed, 13 Dec 2017 08:49:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513183766; cv=none;
        d=google.com; s=arc-20160816;
        b=pTCHtri6voiTgb+vFtC3qgvq9RJkyjutSQ+BatapP2XV7PwxLyQgQp5+TjYdAmyHKa
         JOmSBasqrRrfE/d6ZAGNM2Q1Kw39K8B4Od9qUBD6RNjVJ7GjVfxyf0/935djD98pUF1z
         58t0ZJkB4Ff7LnKKeLlWqPpFgB77J5RABHzYxoewYCHcTDwVqw6nOwDT+uByqQXbZZXo
         yU2MdsvM7gEPRHMu3FBdPbBDp6UlmdU4nZFeKijxYY3edt+7Ac+wCdvcLUpRWCg7A/5N
         Q/9f+ngOWS/yjQCznx76os5FB2I3eHBOreW7DY2PdUfVSFfZZs4ajU7WZ+zRLCE+19sO
         MLhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=712MzYsrUran6KM8cPQTvxmlnaIdvSGkp7XpolJyF+k=;
        b=dJ+P465ePkJBMQvb2wxvgHUvkGZRxqZlXiLlFKOIZGF960yDKbdemnkiBZmLZkE9hx
         mcnQFfbFU4U5/LPlao9yfUpIuERe2IykyJmKhJ3b5tR+s5yEW9RKb7rUlQFFo3qNzLYU
         41LUfIVH88c/c1bsu40YrQEK2gfxZYRLilLySA2ZL+DSxYnjP5UNb6CjRWD9vUFSpbYA
         p6wiRaJvhq++Raj3vcV1ib16DlwxasdOwuwq1frCnoAQedx+TzjmSLP1qu7F43iRraPY
         lZwKsXSydR7MaJtINRxufeurNRXsAqXnqPEyJ74S8RoPJHZs2IpKgRWbCQqhgFuz+gZP
         QShg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W9IGNCiE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q186si413460ywh.391.2017.12.13.08.49.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Dec 2017 08:49:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W9IGNCiE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36284 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePADl-0006yJ-MT
	for alex.bennee@linaro.org; Wed, 13 Dec 2017 11:49:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58574)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ePADB-0006Ri-V0
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 11:48:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ePADB-0001Sp-Al
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 11:48:49 -0500
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:39736)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ePADB-0001SV-5T
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 11:48:49 -0500
Received: by mail-oi0-x243.google.com with SMTP id r63so1973890oia.6
	for <qemu-arm@nongnu.org>; Wed, 13 Dec 2017 08:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=712MzYsrUran6KM8cPQTvxmlnaIdvSGkp7XpolJyF+k=;
	b=W9IGNCiEmukl1e18MZzt6GqqD8B6XVvTb2mMoKYs5xy+sGxf++YAOhtksU8h06ePno
	Wr2LZw20J6hGE3L0VJ8CxKicFGBeUskzEnq/o4ozOrK0pQj97GMX266tX3KRvJNgbMU8
	TMXjFaqKdguL1pOpUtDhkPEFejtUFU/ZJDyw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=712MzYsrUran6KM8cPQTvxmlnaIdvSGkp7XpolJyF+k=;
	b=as6kME4pO/+0ZrhAqJxvRsRGLG8td4rYHYG/MtICqZQAFwF5WvWKCMLx2xroW4yQ//
	g+rULAcS/ZP5adOs3TLSzjNulD9cefHHEWWd3+bogk+voH1jd2Tl6VkULTU71ow8p4jR
	vnHDe+E1gXjwkRcoNQTNFkQNSKaN7KoVxCcPoc9FZuUCeYhEgb6cjzX6W7bU4EtShJxG
	rhr7qDUh0tlEpimj4QjznrzAyTVGQ+A27JDm3g3F3Jhhmkk0URX4yHM8RvC+0/KL+PGw
	Cfs6+HOr8lxeOFDD+4SNO0Hynh15X83OBW3NI5cZss9Eod3j7HOOhkf4kPGe7bCoYpt/
	pq3w==
X-Gm-Message-State: AKGB3mLA76HNe6rbaGOFHxsGqY6YBFIvntZ27uOAoo42FpNC4MX9U1UH
	JJ9fpaamt1UVPG0i/vuQ/WMkooGUNePUG/6cAwviDA==
X-Received: by 10.202.216.137 with SMTP id p131mr401150oig.256.1513183728450; 
	Wed, 13 Dec 2017 08:48:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Wed, 13 Dec 2017 08:48:27 -0800 (PST)
In-Reply-To: <CAKv+Gu-uPf9QLobM1Vqdek_rSPfZcAXV24Ybg83hZvHbH5LqHw@mail.gmail.com>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-4-git-send-email-peter.maydell@linaro.org>
	<5A2F6ED9.5030605@huawei.com>
	<ac182406-8011-9f19-38e7-37328434095b@redhat.com>
	<CAFEAcA8ySsNx-rz__Nfbmd+QM3nKbgRXJtwSYjhRRvqbokt+uQ@mail.gmail.com>
	<0355e1ee-2f48-81ce-55e6-bed7bdeac771@redhat.com>
	<CAKv+Gu-uPf9QLobM1Vqdek_rSPfZcAXV24Ybg83hZvHbH5LqHw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 13 Dec 2017 16:48:27 +0000
Message-ID: <CAFEAcA-P-bmHORpS15nowroWkM0yXgvdP2dmb5sp7RBaT4m_Aw@mail.gmail.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/3] hw/arm/virt-acpi-build: Add
 second UART to ACPI tables
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
Cc: Drew Jones <drjones@redhat.com>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /NrFmNUT6g4p

On 13 December 2017 at 16:46, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> The kernel uses the contents of the SPCR table or /chosen/stdout-path
> as the console unless overridden on the kernel command line. This is
> independent of enumeration order.

True, but we don't want to assign ttyAMA0 and ttyAMA1 to the
UARTs arbitrarily -- ttyAMA0 must continue to be the one
at address 0x09000000, or we break commandlines.

thanks
-- PMM
