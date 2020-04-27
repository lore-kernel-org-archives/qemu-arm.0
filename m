Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3955706lfm;
        Mon, 27 Apr 2020 04:01:23 -0700 (PDT)
X-Google-Smtp-Source: APiQypJZc/L6I5o5XBK1cxTm0ZTiyJ0xCaGBsLtFyzQVqL52B5kYPOE2/3IuI/FXEaVi07XReYki
X-Received: by 2002:ac8:6f66:: with SMTP id u6mr21965697qtv.201.1587985282895;
        Mon, 27 Apr 2020 04:01:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587985282; cv=none;
        d=google.com; s=arc-20160816;
        b=WDYCbwVwKoelHwUqKCUUFTXuXgjFeSzvt8HNL0XAkWHRDSsUxSnyjvJwHrpkukb17c
         vFoiuPIexm6RIIWUEEzavytP7ZrmfJWwyJCrrNBbFUtNwAJI5h+J+TKQpiovQIehtNs/
         ccMK2dpAgUC/bNQ5rt9WiCael2h7bi9SCG0BUvy9mnAdfLgkewGF9mLr90K0BEHP1HFG
         5Mo0x+6J2tO9elsIVpQFPSZ7gns7X8OOt4hXcYgdvc3Z7h5twS1Ml9Jf2L2TKTX3oB/U
         AIr3HuceUaum5rmFCa68uubK2MyTtV7LGclVyvg6899VPnF6FtQwxA55MWqB9YIUZto9
         79hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VJq+mgb4XrzJF0lylAvz3yr03alybFogbUMfHKlJVxk=;
        b=FCO3XWBfTOFCxvNst5fIp3CK0BdiKbouQuiVMJG/jyP0obaaO2xyky3++KBGrWgumm
         ApsAkgXUKCDOeJ/plFqJCtqUXhjPDZfHE6ScDE1JMPkHnqAdcvCEZe8Zrw1oceazc8yW
         spSzSAzGtHzy/7sU8s/ktD+WA4HQ1ZTNqGwIopjsLJv5No3t6ejwb1tZoLEXEpcm7WKL
         FDAIb2gcAOWTyNfSlBMyTpHg4vFZ/504F3z+0N4KmNgIusYHUpwaYLPlT5Nh01krIMSB
         EsP96lwHk69uSwfRA/HzerrBz3NArWD5X2eJE6qXdlyMEnPBbK4sQFecZ/PsQO15k6xw
         KH0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QwGeyyH4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p6si8464463qtn.332.2020.04.27.04.01.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Apr 2020 04:01:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QwGeyyH4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jT1Vq-000519-AK
	for alex.bennee@linaro.org; Mon, 27 Apr 2020 07:01:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48310)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jT1Uz-0004gT-Dg
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 07:00:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jT1Uy-0002Ay-EL
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 07:00:29 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:44850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jT1Ux-00026R-PL
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 07:00:27 -0400
Received: by mail-ot1-x342.google.com with SMTP id j4so25404992otr.11
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2020 04:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VJq+mgb4XrzJF0lylAvz3yr03alybFogbUMfHKlJVxk=;
 b=QwGeyyH4BSISwo4j2POX2WlJeMi38MJ2SIfHC0TeoaBF7qoTjkwWoNBCjbdtDzjpEI
 kfkUSOGy9gBbQJDoBSndx3JFKlo9G+ejxGG5f+wj+qh9ZpasfnqhKAQ+Md5QYwt8AKCk
 o2NuhFh6zQ11IUvUklaoq/YGN+/NJceusAn6ecx74PUhKdLX9smrMGlQ6FPrQtzj1XrY
 M1KlwbS5bbxQs6BHcF+aH/9QWf/xZbAcX4rdeFG3MGFiGI/cg9HXbL2V0UbcTuaJXBiN
 4DZc5Fr74eIt3MG/zVFP6E877MyA/WkACvwVW7KY8cq0BMUKK9qcEL8EdOqa5Xm6VIyl
 68wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VJq+mgb4XrzJF0lylAvz3yr03alybFogbUMfHKlJVxk=;
 b=H6TKr9f8LK0dt6lYNqjskhatpmd28h9Ydy1ZK5EzLRJ55IYA8eOlA9cwm8rlIrkuYR
 s6kzECHIIgqSyOuV7zEZZD/wRz/q76wUg/fpFi13qBj3DDKxk/zlqX9pyPfwRzQ3V7Ue
 S90up0wnHaUkTPdWujvOmA3AjX2wJYJPxBqKU+ui0WAarY+hNbWznarNGJIYu2bbbfVt
 oHTqcsQHaLOKuWB0ROj+xGDUBfI279Nx6dwcqp7+u9dntQl08meWz0rmFUMG8Y3ZgP1a
 HQJ85ag4KivbFNOiPBiNjlYUtgRkJvXCYhA2hVYDf0BxsmYp0GeMZbFuoeQwSBBuzWEH
 vpwA==
X-Gm-Message-State: AGi0PubgSdNH4krrqUIUHaTOxDLqPhoTXwsko+VAWjK6nYUNBosm9qNM
 o6UL5wv/vIpEuyyqp7DGs2rhuVfhPNz81r4rs3f03QXq+Ec=
X-Received: by 2002:a05:6830:1e4e:: with SMTP id
 e14mr17470258otj.91.1587985225067; 
 Mon, 27 Apr 2020 04:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200422043309.18430-1-richard.henderson@linaro.org>
 <20200422043309.18430-9-richard.henderson@linaro.org>
In-Reply-To: <20200422043309.18430-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2020 12:00:13 +0100
Message-ID: <CAFEAcA-TT3Omxk6B601bUxyXLR9m_y0O18ivR9FX5CEsoK+Smg@mail.gmail.com>
Subject: Re: [PATCH v3 08/18] target/arm: Add sve infrastructure for page
 lookup
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::342
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
X-TUID: yCiwX/CdO49e

On Wed, 22 Apr 2020 at 05:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For contiguous predicated memory operations, we want to
> minimize the number of tlb lookups performed.  We have
> open-coded this for sve_ld1_r, but for correctness with
> MTE we will need this for all of the memory operations.
>
> Create a structure that holds the bounds of active elements,
> and metadata for two pages.  Add routines to find those
> active elements, lookup the pages, and run watchpoints
> for those pages.
>
> Temporarily mark the functions unused to avoid Werror.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
