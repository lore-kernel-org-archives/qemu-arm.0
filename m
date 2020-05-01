Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp827404lfm;
        Fri, 1 May 2020 09:03:24 -0700 (PDT)
X-Google-Smtp-Source: APiQypJpSBX0qTAyEs/gEvJy4cimFk4d3iUwb11Z8etdguteioJS18l3n8Hs8YaWdTe1vKwYGeAc
X-Received: by 2002:aed:34c3:: with SMTP id x61mr4193218qtd.333.1588349004610;
        Fri, 01 May 2020 09:03:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588349004; cv=none;
        d=google.com; s=arc-20160816;
        b=yuVxIim0RMVZceAc7Ey2c3gA0RId0euA0HRwipZK5e7ma5ISEak2LOSgmvBYU52wqf
         NweHjZ0ZL2KOVMTMTtPLIcov0HK/mmqSdOw+QF2dXb/UEioqDoXs7whFrkwasOJA05KQ
         12B2MSR6JLziNIV6CW3XM935UT3p0O/WLCOq+fP2UIqqv3jW93T4m3C1xSIEZrCWRF8M
         bPGabt2+U+byFbVlwl5Ya2V79IlnjI+IbXV0Z/mxcgt0lEVe7+tXmfFPfKORV/L5XYWV
         TFPTvpyDH7Wn09WBQ8dJxBggBD1IErDOkuFjNvYos9gDjEcr+aGtnuhWsHIIy6n/HDZU
         V6SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0II5KOiKx3aLfM51C/N4C/613U0yDAvzHZjXkCsSyDI=;
        b=eM6yW9QSUWLBHw8mZWOC2ziN0ah/5kvh+l+a5leL+9gutpqQhKfEryzVF8AkL18mxS
         ++KfbhzoNyAvPvtxS5nfYazG9R54ObGIlXdE35+FF6Vt8xfjZIvHQL4gsjFAFPb6p3gy
         vime1gNBoGXoy9ox1q4D5Fs/V49csM1OPyJAQcNYYxiNtvWThFTtwmMedc6k6WYt0ofI
         R5alz8Ce1vumoPc9zM5JbWRuqCw6w6BTEFkuMk5v2ZNtd7wAkeG2lvlmVjzkSlJJhj05
         P3sbQlza0YQDKviMrAliQCAaSEZEAT7Lo5WPHutv2mkq371Gvzz2ElTi3RFPZbBu+/ap
         thFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cnMjRken;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id w20si2133101qvl.205.2020.05.01.09.03.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 May 2020 09:03:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cnMjRken;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUY8K-0005Bt-1P
	for alex.bennee@linaro.org; Fri, 01 May 2020 12:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUY4i-00012s-H2
 for qemu-arm@nongnu.org; Fri, 01 May 2020 12:03:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUY3I-0005lb-6w
 for qemu-arm@nongnu.org; Fri, 01 May 2020 11:59:40 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:40210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUY3H-0005hr-NZ
 for qemu-arm@nongnu.org; Fri, 01 May 2020 11:58:11 -0400
Received: by mail-oi1-x243.google.com with SMTP id t199so124881oif.7
 for <qemu-arm@nongnu.org>; Fri, 01 May 2020 08:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0II5KOiKx3aLfM51C/N4C/613U0yDAvzHZjXkCsSyDI=;
 b=cnMjRken/U1cDu9x0E04fWyMUf8piztv7hzx25Atyz9DFyiz7c1oZZBFhxdE5mkl+A
 bo62Wk8PGYSs2Lb+nkg0wdrfcGQ83IHuquRQ3/9p7icI1JEJSNxShiZ5NKVwlf15HPEX
 fe6n8LkBCHf8+DhsiUKtU1UMpYqQOY8HfGjUnklT8D69/YagiE5L3YXjtd83kNljhdIK
 XlvB7dN4wvkw+fM9dNdpNaVsafBebTWQEx8/qeliRuXQoLPJjG3D+JWj1qFuRXEGmlrb
 RZJFh/GeLiVk3o+CooRy5WM2soUmDl2yeC4F7+86N4sWwYN0dUWbGlYETf9xYGP9X4xG
 uqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0II5KOiKx3aLfM51C/N4C/613U0yDAvzHZjXkCsSyDI=;
 b=Pnou67qvl6xZKDrkEg65h39drssuya3DnDZrBeg6IZ8Va5XhFc7DkPX9NaaDSCMNXX
 O+pmJiL6F8b1Oxwf6egwYQpTpGdFEbxbGupuu/ug5rx+LnSezTugeUFxeEu9zuIsoWkw
 vQHctnpthrC7HvRnoC1ZGCTFodbXA/Bf3GetxQSK6RWvJKPkhxaNzgHRNBV4m5wG/scN
 AZ4i8p+I7V3GFw+Iq+DcmMhF7uZK7ZWaslvKPpSdlZksgkerf3yx/7RzOuFNdJiFg3LK
 CBL9bxiyFA4GJV/tGfgoGX3CARv7hhpZFWbVTonjjLWwfqnMoQgyXWxyV30L7I19odOS
 HPow==
X-Gm-Message-State: AGi0PubHOHL10crzAwoQU7ZJNdnDH1i0Rm0aIKDzXYWmQiYUBF3PHuz1
 Hxc5x+fYhw065mbjNMTFBqcg5Hvru5gpp/FebsMh9g==
X-Received: by 2002:aca:3441:: with SMTP id b62mr186843oia.146.1588348690170; 
 Fri, 01 May 2020 08:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-24-peter.maydell@linaro.org>
 <366a2e79-d963-bfdc-fcc6-2a63026fa1db@linaro.org>
 <CAFEAcA8M6M7CYg0AsTVbmfX88jzW9MZvRFihQ9cGDJNHhXV+Pw@mail.gmail.com>
 <2050ff9f-1338-2b6e-230f-e07c72ece3e5@linaro.org>
In-Reply-To: <2050ff9f-1338-2b6e-230f-e07c72ece3e5@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 May 2020 16:57:59 +0100
Message-ID: <CAFEAcA8u=0LED6BQdkDCa-i3ySk986oSnMQzZj4KaBaBQ5tDuw@mail.gmail.com>
Subject: Re: [PATCH 23/36] target/arm: Convert Neon 64-bit element 3-reg-same
 insns
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::243
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
X-TUID: JN2Z5+6ZnzyF

On Fri, 1 May 2020 at 16:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
> The original intention of the hook is to expand some inline tcg ops.  That it
> can be used to call a helper is a happy accident.  For a helper that needs env,
> ideally we would use tcg_gen_gvec_ptr and handle the vector with one call.

The inconsistency where half the helpers nede to be passed cpu_env
and the other half don't is really irritating for writing code
that calls them. Lots of ought-to-be-common code ends up needing
two versions :-(

-- PMM
