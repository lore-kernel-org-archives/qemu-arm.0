Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp480560wrs;
        Fri, 23 Aug 2019 05:04:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxjwg43rNbr1TPFZu0uF+RAd5Y0vo9gqUdf/LtN9x/eMXkRX0cv7RNUWbYKA65x5W5cnD8k
X-Received: by 2002:ac8:21bd:: with SMTP id 58mr4392080qty.192.1566561869131;
        Fri, 23 Aug 2019 05:04:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566561869; cv=none;
        d=google.com; s=arc-20160816;
        b=SZLjwKLontC2WSwX96B/zAnv7P6XfnoBxXnTlEuuRA9ihGK1dWY4fg0mhxwXm+fxDa
         wnaqQ9FPSSHKs7Pnwt365hVG0ChlOLU8G0mOIUeSpI5Cf2OzK3gw57AwI2K+fopDXJAx
         dfLY9aP4gy/xs/uyLWiRM2GoRk6y/W7eRGDTiicK12y+RpmFrEkxNIbwvNMNP6xy2bvb
         u6rOEzvZHrESxwQZIT8iTzIBESnC63UNs5y0GeushHQuVprBJ6jMlRIUSr439uEFsuLP
         BFKsm2Z3s2cD9GZlq562Mja7B1qcOceOTOSkmyECM0H9s6qE0dC1UJrv+z7CGa5z9Pm0
         FUSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6+4y/sW/1VgDa0gt6P6z+fL5/QwCG+5SLlLJ0r7ArZA=;
        b=VFSCzXeUeeF2aITSgBoPBIAAxIz9B+p3RV6D97xym4HKvTGvGlMy9cmQEVdmpU+P6y
         K7f/h7u/ozi9G6rwHgO+0gzqrfopEXQukQmHIQmI+8qKiMwLw2AcY/8tNYMI5LWp/Chr
         6A9CVGFkP6e4IF22TT7YmOOnbnYX3i0lk4pqNqdqrObRAJkvUJJbboA0L1KL4AH7CyXP
         1uUoGayMpc8yVRzszr9sMN39xVJPy+eFRjowIVFxh/a/Lt1aMh1Ayb1yEJrji/726v1P
         2nlWih8IeyvX00p0cfRMM3Z22i/fEOwilyFNMkndo27u3hdKb2pN12l0KXYzoaD7vlNj
         aXmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MRV2snWK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5si1537553qkb.66.2019.08.23.05.04.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 05:04:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MRV2snWK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i18It-0004aC-4i
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 08:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54529)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i18IP-0004Zr-0g
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 08:03:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i18IM-00032e-RH
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 08:03:56 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:40284)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i18IM-00031q-MX
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 08:03:54 -0400
Received: by mail-ot1-x342.google.com with SMTP id c34so8510556otb.7
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 05:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6+4y/sW/1VgDa0gt6P6z+fL5/QwCG+5SLlLJ0r7ArZA=;
 b=MRV2snWKnPImw7vLfXlLNcnF8jHrBUXVCbSr19sCTQxeas9immvqfHLAaYo4Pb/Thf
 m4pIcW3yRuiu8mY7ZILnINPkcVbw6BzHLWTdMZZu1SFcj3pqTNy/YRkA4MxxqGSgOK1v
 JjsWzmFwpzhWRBct1XGlPHN7zwAlZ11dyr8VOqa5Fveu7g6fv+9ZcgIRCuQDjGYMES1l
 fApWQ53alBhpjG/WxsqdtWhcdGMNQo5fIckUt/IXHJgEdvFiagAPEolb7tHh/3vFGbBX
 Y/S8npxBCx95iQpELwre4xWURQPe9Ts49ZOFXvGE2oUjEoVEe/DKeNrOn+icZENJIjQt
 ViPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6+4y/sW/1VgDa0gt6P6z+fL5/QwCG+5SLlLJ0r7ArZA=;
 b=NEu1eCvRbCIvkhc6NqIpQfWqXl/6vlTLzGdODDff/wgcbvJTe3xhEaYtzGqCY9BIwv
 ugwlApYFDZ18cnWu/BiREyEPGx4fex2v3jAZihEM6q15GkjmK9I2klWClxoDKeCtYqQB
 9uStSKnkSIvknA4wXdnaVhV+A5h4/1/LAWXMb64tHfYI0+fAWAYXJMTvOWRkg1vlY6cx
 cq2dU1AQnZYKm7jxGDCOJHgZPuO4+hmYfyNDj+On6Bb73mq8k8W75yyBUR76jRMmqCxw
 lzEigL04JsUy7y1+Sf++uky6mgRRGl9pLJ7qCuTAU3vDt3IrnsHhPXpWUADKNEl+JEbf
 22Pg==
X-Gm-Message-State: APjAAAUjVbjZcP58ZwfZEOx+tWjfKdNrek/p3j5Xl5xsBeVQ0eZX35B5
 aK9UmJdLi93sMbbKAmkb28FhjA86I+OKFvxGjXEFdw==
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr3970601oti.91.1566561832617; 
 Fri, 23 Aug 2019 05:03:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-19-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 13:03:41 +0100
Message-ID: <CAFEAcA9xx_bDZ3hf2aTaOxPupmSFQ11g4xTsHow6nxn6j2ZcEw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH v2 18/68] target/arm: Convert the rest of A32
 Miscelaneous instructions
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
X-TUID: GQ9Ar+7FUuht

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:

In subject, typo: "Miscellaneous".

> This fixes an exiting bug with the T5 encoding of SUBS PC, LR, #IMM,

"existing"

> in that it may be executed from user mode as with any other encoding
> of SUBS, not as ERET.

Should this paragraph be in the commit message for the previous
patch? This change doesn't touch SUBS/ERET.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
