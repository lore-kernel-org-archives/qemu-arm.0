Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11CCF34C55
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Apr 2026 14:07:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wCHwV-0001iR-KN; Mon, 13 Apr 2026 10:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wCHwU-0001hx-7i
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 10:07:10 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wCHwR-0006b6-9e
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 10:07:09 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-6501d32b04bso4112365d50.2
 for <qemu-arm@nongnu.org>; Mon, 13 Apr 2026 07:07:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776089226; cv=none;
 d=google.com; s=arc-20240605;
 b=Yd9o19QgHiatHU1KU//ZnUoXOXmOETjbmCePwBPNWGo58cNImom4Lfdo2YZyf02aD7
 zA/9z46JiApBGBe6YYlpV2jQbTPj6lhMmQDhEUGnesdbAUwbDxC2KRpLYkqRi0YMFnnt
 FSDJqMSNdNj8uTQZQulhVR+4EVynqDY1nHfQcQzB+FWYnuImLeBnAWWCVWQEExzA1s7Q
 mA4XqFTer1QPtaa+V+ozgifG5AvZhkAaxgPe9iHPEnthY+b3PiLQXEfIDtvQ42TZYgxt
 JfSSHJ8vlKI7I0X3G7COvpOW7c0wRXbHfbs/iM9LjwRmQ4dAzjmxsh+2rhQFg4o9z/+L
 Lw3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=XFXf2FhVtHaWPnl8wOCiV9KxNjWSg+uowlhv+eTkq7Y=;
 fh=cOCJ6nxVLS/nhHrVmuyGqA/SwmYcKqkAchSd6aN/hSE=;
 b=YwzOr1zTGNsJ8WwWWUliZCPA+8uV8cV0wNkzDF6RX/sRyq9Z9axh/K6BRKRSftyq6E
 OWTDEDTaxgj8flriEBBG3Mfg/CV6odrf9vhuVFtlIEcQx6GlSqHseTJ5r67ZRKUqLK0D
 RYXEmKgEgctEmxKvWTZ3K2f9e5Maq98iJQZiSzjqkhI0g2vHx8BBE6lhRUp3HsHe3+K3
 eExytJJoYHjR59WMtqSckEtxlNFELMiRCh6qeezPgW3W/euJrqjGbh8GXYUdBpdDYbjf
 HW6MzPudd9HfiEZW0hVWR7xJ9oQAHXj5D7vNVnQ9u53jr0Ae+nNxn3+aBdVyyOIFCliO
 PVxA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776089226; x=1776694026; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XFXf2FhVtHaWPnl8wOCiV9KxNjWSg+uowlhv+eTkq7Y=;
 b=dfZfRDR125PD9KbHgqKCMIlTDIMY8FZpuzHCZXAMoVOv8jjWRvrZDgNbTniHQRcGEu
 iS365N4LhKxhOxYJuwlIVsoAUT1ZMNloAAiwV6S6jewTaFKblse3rjB9x83wI/aC+qqy
 cfFIwYyhNS08lwcSnzp8+6/74kjRxwNwrZoEMTk5ZEGxh72ggsSOu1ZqDc64vHZn8N3+
 xohTAO/AdBvnd4EjEZ901POQh8P3f6hjutsIjLpiut8gfEuSV89omXPoYnOv2DaEqrO4
 PNSutwelwL/bWCnaZaaqbG8/xALogZD8wgTd1jadvFSKVX6oqey+veWb7zGdfZiVAqel
 yy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776089226; x=1776694026;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XFXf2FhVtHaWPnl8wOCiV9KxNjWSg+uowlhv+eTkq7Y=;
 b=WtiX0+57RX1dfHz6j4hyQgDZmXMuJctnLmTxMrnBHNa8p9cWmLE06FqLLPHv9HaaJg
 b4kg3Id29uV274Y1YVEa/0J4b0ssXw5RhFlLjznknfHpwmRJ8VO4tzOPbQs8AREeR54w
 lVA7RxTx+DUMx7Lgx9M1gYzjnq/ZzBS5EM4ZMRPGIY3XA8oEFiX6oDw2BqHg0NXC/iF8
 HmvnZYZ9vHa3BgeVy71x8ETTgaCdVTSKM8+jJYpYoN7lxTfR7xADoBkk53QHhiV4qytI
 77ghjJgOy5i50Zsq1vxzdBInvOug7ds/9RNYqQB3epAhv7nt36p/Ydgjvr11PDE8+iTD
 ufEg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Etzkovox2Hcy6Xi3Q4xCFwIFP+utQK5048N6AeHKy/NJqIpqeuclHjm4MQZZT3FdRA3LazoDXBQ==@nongnu.org
X-Gm-Message-State: AOJu0YwNKEAIYqaGLlmx4wHvjiNyUxh1y7z0jiHzaST27VK2WS3ArD9U
 Ac8ENPEaaOv43x0M+iwwo4s4h00Y5E+kK54OHU+xxyVbucQGX7r9UBPpBkMG5/Pa8p+O1FlvcUT
 3FiHyOHeSvcBUElQUwLW+X0TZ4jLSv2OGy9DcxWrYgw==
X-Gm-Gg: AeBDietuV8B88/daaivkgMdJZJ5rgwi/9UUXyVGaAqLYP3qdq/DBfwzkoQ/IPGYax6G
 PlYTVScRmrEwhDgQIW9+sOfy6q4p4ivcqz9NSc62BnLSTuGqAWLEmdol6ApiA+Z0CCIcFRH5o5d
 7k+WWY8jBYi4s8XETJ4ABv7vqUpsSCV/bptpIFXwmU8SetsJ3S78XRAFIBvbmrjCAmnB+0ewiwt
 zVsXCYJlC1+Wmo6uMiUN3NY9ldxC+5FhOJQaV42X1m2ch46YvlbbgPELHBXW+xxmiiIEQiDx+06
 fAmixP1I19bCcWg/EuKFigD95gEeMb+ugJSoTYoFhNtEJ3LgQe0rKwRdwwgDb8akuRA=
X-Received: by 2002:a53:d246:0:b0:64a:f3fa:af4a with SMTP id
 956f58d0204a3-65198a395ccmr9854933d50.5.1776089226013; Mon, 13 Apr 2026
 07:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260311-edk2_arm_serial-v1-1-c25e237116f3@redhat.com>
 <0b4976f9-cf83-47b4-8f00-cc68c9cf47fd@linaro.org>
 <abkPy4Xzf6YT6g5Y@sirius.home.kraxel.org>
 <CAFEAcA-dTkoKs0tgF+VV0PayFbDcmH_t64P6AOT18ShwEKTW_g@mail.gmail.com>
 <adyZm41cp_nZHPYj@sirius.home.kraxel.org>
 <CAFEAcA-pZCrti_==m2u-Kq55dmqBcs8S=Ztns8moBxSe2fV+ug@mail.gmail.com>
 <adzucwBFU3u1HWnm@sirius.home.kraxel.org>
In-Reply-To: <adzucwBFU3u1HWnm@sirius.home.kraxel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Apr 2026 15:06:54 +0100
X-Gm-Features: AQROBzA5uKN3vnFalUKhTZJeNzYEHjIjYnSl5TipUQYPhru3tXHuRYQdvKaIVPE
Message-ID: <CAFEAcA8sdXNSsMHyepvqK1m6BzgzYzfZYCOL23TOdAG3gk1UCA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: add serial-debug-level property for EDK2
 firmware
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Luigi Leonardi <leonardi@redhat.com>, 
 qemu-devel@nongnu.org, Oliver Steffen <osteffen@redhat.com>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 13 Apr 2026 at 15:03, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > > I'd very much prefer to use device tree.  A device property is maybe
> > > not the best choice.  There is this /chosen node though which is
> > > already used to pass around guest configuration information (kernel
> > > command line for example).  Maybe we can add properties there?
> >
> > Sure, if you can get consensus on a device tree binding for
> > it and get that documented in the kernel's Documentation/devicetree
> > then we can implement something.
>
> Documentation/devicetree/usage-model.rst (which documents 'bootargs' +
> 'initrd-*' properties in '/chosen' too) says:
>
>    The chosen node may also optionally contain an arbitrary number
>    of additional properties for platform-specific configuration data.
>
> > But fw-cfg seems to me to be a much better fit, and it has
> > the advantage that it requires no changes to QEMU at all.
>
> On the firmware side fdt is easier because that needs to be parsed
> anyway to find the serial ports, and the firmware also checks
> whenever stdout-path exists in /chosen.
>
> Adding a -chosen name=${property},string=${value} command line arg
> to qemu should not be too much of a problem, no?

But we already have a mechanism for telling the firmware
config information. I don't really want to implement a second
one just because it would be easier for you to not use the
one we already implement.

-- PMM

