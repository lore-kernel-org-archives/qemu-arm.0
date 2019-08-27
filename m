Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp5061492wrs;
        Tue, 27 Aug 2019 03:44:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyCYsL8FNCQtOOBV7V9DbJY1IEvgwR+xadIZ14lTHYIHIeuRAPIffVc/pmPBgelJ+dPz462
X-Received: by 2002:a17:906:cecb:: with SMTP id si11mr21077006ejb.178.1566902688834;
        Tue, 27 Aug 2019 03:44:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566902688; cv=none;
        d=google.com; s=arc-20160816;
        b=GM07FExAnb+kbtsv4Z2yag84NwUKRoXq9inK6+hvKcncMnoU/a6K0SfFQSPNsVAxBe
         5AciX4ySYhstS1JRTI36xuxKVOLRBSdcU8HV9S4OwZPxZCcYSJiCWJYSNIvp/l997w+B
         HSC7h2yS/O8f5Vcx/fcnZv2zE8bg//tYdsH7JWNRC4rfhKYs00nLjTmqq8hDSz9N9PGM
         3PNwQ0dToZWGCRqSxu2E+eEqjmPp5okSfIW50TV4SeV9TY7nX/pS0gXarcgwOz66PEGg
         W2RnSSz5jku0UxY6S79qIen/S6pzWSYBzl+TxJ1SnuyeYQZj40jkf+q/WQUZPl8iA5Rk
         7FpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SL1+Vu/Pp9flDd+Z7wud1TjEBXU7Ib14lQRu6iN4wkU=;
        b=hktmOZ0fCGrD1B66oACjLHAiR0t5IIH+YJYaxkVLSkc6KT2bDNxd5ubdlGUJApPRmX
         h5r8jO1ABxNCyi5U8T63f3wUR5S5TC22bv1WsvaUtewqYTjraBcuRM6PSrCOppwqimbM
         FGtCNxB5CdQO77mIEOn6I/IlDxH3A8T70yTemhWsaVIYG2WnwydfYjsPF/CseYBeLo1H
         vKZ+rk4YrlDq33kUhG2xL7jWtiQ7lrEvqB349vzjtYqda8/d8nv6NquA9HNEQVgF9UaX
         sJyraOlyMoJSUXg338s5iOiTe1A6bOkgIxuVLw4azuNkkLY5EKg7QyEfqfAaMomksv8y
         nZ5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QiECRMHp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s47si8390215edm.38.2019.08.27.03.44.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 03:44:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QiECRMHp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2Yxz-0000pa-SN
	for alex.bennee@linaro.org; Tue, 27 Aug 2019 06:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34110)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2Yxp-0000pD-WA
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 06:44:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2Yxo-000123-Q7
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 06:44:37 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:36055)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2Yxo-00011q-Hz
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 06:44:36 -0400
Received: by mail-oi1-x243.google.com with SMTP id n1so14557427oic.3
 for <qemu-arm@nongnu.org>; Tue, 27 Aug 2019 03:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SL1+Vu/Pp9flDd+Z7wud1TjEBXU7Ib14lQRu6iN4wkU=;
 b=QiECRMHpaozHmzMyKVKQQLDLvbZy94Dv2uBnAKEASQx5LsZbYwwoIrUgBor+hCH4Qm
 JXEQcVDR29wjL+G8sFcBRlvc/WLMThwepsUZsK/asqZYXfE76yLj1nbXDRhH2ieTqVPD
 4tTjeWK6tt9+1yB16QDEDNdHYPI6UoIpAPe4yF4S3FTJJglQqKE3cpd1RkR87Edti+Dt
 2t5KNkuHSQYx8jowKOYh7x0GPGexc6xeRDHnIeUnfdDDZ1jQSU1qXgdwXb+znILCWNiC
 kmVP/laBMGp4aJ0v8QL2qTQPyTLteORutv3NsAuehwzBLU6TefSt0ls37XryrGFBE60T
 xCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SL1+Vu/Pp9flDd+Z7wud1TjEBXU7Ib14lQRu6iN4wkU=;
 b=tROGnZSLKW5f5auzVo8EQ0DLfbSwv6RhxFJcYm7wEhzLtuVgnQlDBbZvVlELNoW1L9
 VUuw+Btfb+WV1WKphxLDURoOJZByAhueCyybKEO7c34Eik2AbtHup04NRFc6NGswYCD4
 6xc368wR8eWTfyxneQP1whIkkHLjxo4vaZm+xF5o56QP4OlxEjFIdcJAuoIybdRzmOpq
 j8PGgMqX5fvymviniU2JFkKsgSo2gH3arjG4A0FIAnuj+c8TwUOsg7fZ7UWhJwkHSkSi
 g2s9TI0HFI+QlMlH2qXdd4zwUA/3UTmd7olT+yT92h2/uixtki+MArgA8asw4Fw8uZm0
 9zLg==
X-Gm-Message-State: APjAAAXXkmAG2V8Z+sA0SWBNwKYOJk0ZJn1L3xicAA+k+OV8q00PDjBO
 S53vuAq5fcXkMjgLj052npNoKu9JABC8BXDRcTZOpw==
X-Received: by 2002:aca:50cb:: with SMTP id e194mr14495155oib.48.1566902675469; 
 Tue, 27 Aug 2019 03:44:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-22-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Aug 2019 11:44:24 +0100
Message-ID: <CAFEAcA8saD6zkOA7-6nF5jQBMgKPLv0L3WXV2m0Y4WtHwVqWgw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [PATCH v2 21/68] target/arm: Convert Synchronization
 primitives
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /MfHPGmfzrSm

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 560 ++++++++++++++++++++++-------------------
>  target/arm/a32.decode  |  48 ++++
>  target/arm/t32.decode  |  46 ++++
>  3 files changed, 396 insertions(+), 258 deletions(-)

> +static bool trans_STREXD_a32(DisasContext *s, arg_STREX *a)
> +{
> +    if (!ENABLE_ARCH_6K || (a->rt & 1)) {
> +        return false;
> +    }
> +    a->rt2 = a->rt + 1;
> +    return op_strex(s, a, MO_64, false);
> +}

I've just noticed that there's a bug in these checks -- the
M-profile CPUs don't have the V6K feature, but they should
still have STREXB/STREXH/STREXD, and with this test they'll
incorrectly UNDEF them.

thanks
-- PMM
