Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp503899ejb;
        Thu, 8 Dec 2022 09:06:07 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4zCl6eap5+z8cpMVAPPRmT6raMI8pqQGv7uKqYJEsHSt7SUuuxDNRqO5yEXW5uAlmn64r4
X-Received: by 2002:ad4:4f2a:0:b0:4c7:124e:d999 with SMTP id fc10-20020ad44f2a000000b004c7124ed999mr4326771qvb.52.1670519167398;
        Thu, 08 Dec 2022 09:06:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670519167; cv=none;
        d=google.com; s=arc-20160816;
        b=PkS2glXEovZIEXLo9HubbAYxvX/8u1Frv7GHx+Qr4srV0g73AvP9dwMLY05Yc05DTD
         4ry+2D73P5tTUa5B2an22bvvk9SI2E8NtfgNg/VJFMYDNUsTxrMxKf6jIZEwAhf8BER1
         qmW4sBT0aZlaMYVGCzXvqnddcdkqJnH11ZqxbgXrFQGwEObydSsHLfXzR6mP/yfCB5ef
         fgU5cYT4QdWY2xeA9p8Fj0BpQlxW6ywllzMqzM8O/CKTpOYbFwtXs8eo/uO9L8DsUOJS
         azfB6VZjqWEu0SXOkLRdwJx56qWGhbn7NrODKM/ErVXHUaaNc2FzjMkKTgF5M8JNuSKu
         JM3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=tNmXQ1jY2P7WPGouFIzTSfGkUC7gPH5EBlqFcrSvwj0=;
        b=07Gq2blg6AjD1+DvLhE8V97uqMtZLb0+xO9vRdlN992R2Z+dBs5NcAd4APQv56dVxM
         No4L5vNWNtWcNsJsUBVyGKali7YWY5vGYypXBwylZymXu0qUKGw7/i2hWNroXbfY/6W+
         i0F51LlgUcUd3j5dl+/+LP/JKsX1CieIkhyZ0XyW2IL/XX7be6eJ3yOM/jwsufEfLEOM
         tbOgYwirCzWgYuZWd8iC5Mvry1HcyjUI6CA4MN8Pn1fv8PBAHvYxV7fgXsZAUzqjkKTL
         Rd4MBksis0pabs5RNac6ubDj7lVzInxsN1+eLzE26hqqyAQvSVdI0UMTHWRXnlUyORNO
         D3Jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VpUJPYoD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay19-20020a05620a179300b006faa9dcae3bsi12973117qkb.11.2022.12.08.09.06.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Dec 2022 09:06:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VpUJPYoD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p3KK1-0004jE-4z; Thu, 08 Dec 2022 12:04:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3KJW-0004c9-0J
 for qemu-arm@nongnu.org; Thu, 08 Dec 2022 12:04:02 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3KJU-0008RB-1y
 for qemu-arm@nongnu.org; Thu, 08 Dec 2022 12:04:01 -0500
Received: by mail-pg1-x52e.google.com with SMTP id h193so1641383pgc.10
 for <qemu-arm@nongnu.org>; Thu, 08 Dec 2022 09:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tNmXQ1jY2P7WPGouFIzTSfGkUC7gPH5EBlqFcrSvwj0=;
 b=VpUJPYoDxIOKVAkOo8nW+r1XulrHDg7XmGaRKgomBWDlIc7nIndRmqU1xLjsGxcj9L
 Y1RY9CYOdh+H3uo80D72xm22EXTngxLMB+PUtMW5Y7UOJYy0b0YVsrIwJNkDr43uZ5if
 BZ3AtMin4UyTFrScKzjvzkpz7KqguxFLGKSH1mfr6iKEFgL1CZgswS7vRW92rBrRVoxI
 v155uFGyeR/X8HZApxG5xavwc2iGBPO9/rSDwC1RAL5noxUWwQxE25tiiPsormVMornR
 K57lyUNFyN2m1P66pZwSwmc10YH1V2i40DB5N3OxvCYyrHChNzaD82hzwt7nHPXSmZwF
 oWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tNmXQ1jY2P7WPGouFIzTSfGkUC7gPH5EBlqFcrSvwj0=;
 b=4N4HDhUc2CiSgwF8UqKV06zn4yG/V0bIAlJrF6DDq8ZIEUM6U76IF3BJ+f7dpLRhU5
 Z/w+xH8Xf+AVyZ9G8z9tfhJlwmApfaTJ5t5Tl0rUPK0gedvHxj21hQoIoBvGQGFLSlGB
 QdQZRREF9ZYz9BBvhxo4pt8EJ9eb1OU854zUXaNYm9jEd9G1p5u+wO2VutFZVukgQVRt
 lofAyKEarlDeqgnC5m6z0jZUmJZpjf/qZLqQWxvbI7WU+QIv+YRGRdmChnFaOWMp8kTQ
 2xJVvd3YcF9YShr+BoGf/4ov2FxpXlka0sGYtknVPD946aMGJR3emrKozbTKhdUdm2rK
 G1Kg==
X-Gm-Message-State: ANoB5pldeyK87oENGEPSgBtpwt1gmwS5sLQwW6f9RRhNR3qG8W1nF6kq
 VVu+xin7JPTfMc5A6+8+t4GLrtTrHgaicbT6ESDWFQ==
X-Received: by 2002:a63:d20d:0:b0:479:18a:8359 with SMTP id
 a13-20020a63d20d000000b00479018a8359mr3790755pgg.105.1670519035113; Thu, 08
 Dec 2022 09:03:55 -0800 (PST)
MIME-Version: 1.0
References: <166983457648.13115.4940680286975412418-0@git.sr.ht>
 <CAFEAcA8csAbbdvLoq+202CAQ0PLWdHaBTfADtqx33c=DNU-wSQ@mail.gmail.com>
 <c31be243-e380-eabd-f387-0b0923d4f6c1@gmx.de>
In-Reply-To: <c31be243-e380-eabd-f387-0b0923d4f6c1@gmx.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Dec 2022 17:03:43 +0000
Message-ID: <CAFEAcA88QfXmos_vCMGnDsmH7L22jtMz+-MRrMimObhDaFrwXA@mail.gmail.com>
Subject: Re: [PATCH qemu.git 0/1] hw/arm/virt: add 2x sp804 timer
To: Axel Heider <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wOZRHPaIMFZj

On Thu, 8 Dec 2022 at 16:59, Axel Heider <axelheider@gmx.de> wrote:
>
> Peter,
>
> >> This patch adds timer peripherals to the arm-virt machine.>>
> > Is there a reason you can't use the CPU's built-in generic timer
> > device ? That is what typical guest code does on this system.
> > I'm a bit reluctant to add more devices to the virt board
> > because over time it gradually gets increasingly complicated,
> > and every new device model we expose to the guest is another
> > thing that's part of the security attack surface for guest
> > code trying to escape from a KVM VM.
>
> For the seL4 specific case, this is currently not possible in
> the standard configuration. It's only exposed for a special
> debug and benchmarking configuration.

It's not clear to me what you mean here -- the generic
timer in the CPU exists in all configurations, so there
should be no obstacle to seL4 using it.

> The catch we have here is, that the virt machine is a nice
> generic ARM (and RISC-V) machine for OS testing purposes also,
> but it sometimes lacks things (see my other patched for the
> UART). So, I wonder what would be the best option to continue
> here. Should we consider defining another generic machine
> profile that is more suited for the system emulation use case.
> This is what OS developer could use then. Or could the virt
> machine get some config parameters to customize it further.
> So the "Machine-specific options" would  support a "sp804=on"
> that would add two timer peripherals then?
>
> The really cool customization option would be passing a DTB
> to QEMU that describes exactly what "virt" machine is to be
> emulated.

This is a firm "no" -- it sounds on the surface like a good
idea but it doesn't actually work in practice -- DTB files
don't provide enough info to be able to build a board from,
except in some specific restricted situations like the Xilinx one.

-- PMM
