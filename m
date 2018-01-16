Received: by 10.28.173.206 with SMTP id w197csp4066186wme;
        Tue, 16 Jan 2018 07:15:48 -0800 (PST)
X-Google-Smtp-Source: ACJfBov5z9B5WMcG/Nnqt6zemMLGbgAuRxKzT1O2Cg3+cfgNLFC0eo3OiUPk1gm+T4G7t+f5taNM
X-Received: by 10.37.88.137 with SMTP id m131mr16183917ybb.467.1516115748457;
        Tue, 16 Jan 2018 07:15:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516115748; cv=none;
        d=google.com; s=arc-20160816;
        b=SNpeOQ99/CPWzUTqexuJsV92xQkO1DNwwigY737qzw76WLjuYqYcHQ/oYl5q6lCXJp
         WbU3nM9lh3FsTusYG0XbICtbudJ7xqCtw1DtQv14xMafjb++/uZXU00aPwTdVf/JUiEh
         Ul69kHyXP60dGYqelVaOrg9k5TwTtQnxQmMz9ysOj8pgHE6NVuR8A69K74OTSfSIl05R
         3g/NX/QujHW8QwCS7pj6gdVZ0U9mwSgr6u26lpyK5INonISQP3jPxDHL5eAm3Sd1O4yw
         7697ap4+n7DxEAlc4Vt49MUPMszVg0QkwXP5xtKuajq5CSvCS8Ua4MaiKlIDA4Ch2stQ
         fLFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=I22SPPzXpGkL+LfZvLCypuB09BtFUpFAWsiY8eLVNyU=;
        b=Io+jfat8XEBwycBSI79Tkg4slbr0fxg5ru8cuMYBdSroUApf8LQBfttHtHvwHPPCUl
         KHuuEHPcw6ib3YlaVZBNT+yZkUjmG/dKvFrGq2Vm7fEB0jV5IGC4R4F2KS3WEo56gDPV
         VAarzq792fbf+EUoffSKockPBCtl6pQuGQ5kYh4cXfKs7Okh+JtHrFcy0vAcBFumf/GH
         uhprEK1yB6Hp/PU4KbmU52iPvABgfzoSK2FqOfdRhUAzE3WzveG85ZA2V4JEvnzI11Ci
         u+Sxelgb/jjYuyZqxew9mWz4uYQlHyLnxskTFkWWtjtNFoOeKNL077GImZ390e4dV+vC
         VfjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Jc24YoLz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z13si549617ybm.825.2018.01.16.07.15.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jan 2018 07:15:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Jc24YoLz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39981 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebSxn-0001Lm-OU
	for alex.bennee@linaro.org; Tue, 16 Jan 2018 10:15:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58599)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ebSRt-0006ob-8E
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 09:42:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ebSRs-0000Tp-Dx
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 09:42:49 -0500
Received: from mail-ot0-x229.google.com ([2607:f8b0:4003:c0f::229]:40970)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ebSRs-0000TW-8t
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 09:42:48 -0500
Received: by mail-ot0-x229.google.com with SMTP id 44so12892548otk.8
	for <qemu-arm@nongnu.org>; Tue, 16 Jan 2018 06:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=I22SPPzXpGkL+LfZvLCypuB09BtFUpFAWsiY8eLVNyU=;
	b=Jc24YoLzOKmXe4P3zlxCB38Qvy2fLqFRIGc+WOPkA91ADy9v9ZS8DjcyhYZbgrI7kR
	cxWui4XuOxozGzY4jmKy5mQ3BQaYt7RGE4ASc4KITtb6YEBQaoGeSGmU/toBq9Ou6OaE
	XKwOTdS0xx/VKOtZsYe+29uZWPgog/QIhVwU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=I22SPPzXpGkL+LfZvLCypuB09BtFUpFAWsiY8eLVNyU=;
	b=NQKsJPT4zQmjGMJHK88QpqWBAvGCRwCI4ybzEloYaMY5BgcGXJHnSFqG+txK6l9YWD
	5pmgPRBoeuTXYvkfpGzxRQbccuCeVcmtGmp3zIsT50i9FUGJFHK3CHXfj1VObKiuRbX3
	MxgFwlL4FXkbu3S6cmnjuVopAf7M//XaQlh0641VTUc8F5oEncQQ0SxLqIQCo26F6A9V
	uCYoFkG7C3RqXAQ5oFklP9oWIU3ebMtor2l62LQQtNpg2CbfmNE5FuTB8ogDeXZjbAEn
	U2nkKwmHkdSLMCRb8KNctefb/5aXuG+K61sJIsaQhIwRJumMXcZUH0MbzIhbcR2hyvrw
	Z2fA==
X-Gm-Message-State: AKwxytemIU+iVcNzrGMGuG2H7NGgLE6zpqduTRhFFZB1QHGiXYyRDN2P
	TKQtucHq/GN+PE18da/PEf5JLgDvUoRjQXxsiL32Tw==
X-Received: by 10.157.2.8 with SMTP id 8mr4508457otb.116.1516113767600; Tue,
	16 Jan 2018 06:42:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Tue, 16 Jan 2018 06:42:27 -0800 (PST)
In-Reply-To: <20180116013709.13830-13-andrew.smirnov@gmail.com>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
	<20180116013709.13830-13-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jan 2018 14:42:27 +0000
Message-ID: <CAFEAcA9VmZQJjvWe=a9V6TO0nMk+L5i1RgrpkkB1EYWDc9fr7A@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::229
Subject: Re: [Qemu-arm] [PATCH v4 12/14] i.MX: Add i.MX7 SOC implementation.
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MWhjFDooZuYp

On 16 January 2018 at 01:37, Andrey Smirnov <andrew.smirnov@gmail.com> wrot=
e:
> The following interfaces are partially or fully emulated:
>
>     * up to 2 Cortex A9 cores (SMP works with PSCI)
>     * A7 MPCORE (identical to A15 MPCORE)
>     * 4 GPTs modules
>     * 7 GPIO controllers
>     * 2 IOMUXC controllers
>     * 1 CCM module
>     * 1 SVNS module
>     * 1 SRC module
>     * 1 GPCv2 controller
>     * 4 eCSPI controllers
>     * 4 I2C controllers
>     * 7 i.MX UART controllers
>     * 2 FlexCAN controllers
>     * 2 Ethernet controllers (FEC)
>     * 3 SD controllers (USDHC)
>     * 4 WDT modules
>     * 1 SDMA module
>     * 1 GPR module
>     * 2 USBMISC modules
>     * 2 ADC modules
>     * 1 PCIe controller
>
> Tested to boot and work with upstream Linux (4.13+) guest.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
