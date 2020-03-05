Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp3030615lfi;
        Thu, 5 Mar 2020 07:12:31 -0800 (PST)
X-Google-Smtp-Source: ADFU+vu8S3eY2Q1n1tXSTiCUTUfOO2qWdpe039fZFwk+EXGdRF2a7RB5PGXufNLYQ3Q9bmL2gb5a
X-Received: by 2002:a37:6e42:: with SMTP id j63mr8457794qkc.400.1583421151778;
        Thu, 05 Mar 2020 07:12:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583421151; cv=none;
        d=google.com; s=arc-20160816;
        b=Nx8UjeyP4vL3PZxXHkJcO/drAfFhi5zLLbn/dEnhBWwrRynNyNtysQ5Ju5qu7GY2D9
         uQpOu7ruEbtEvLD8XQqH0BV/v4hmpRcJEoH15V1pjStIh5jXbSu4FjlddQiSd9ha/af4
         dIJSyrOvyRMgCUp5V/0CebvUUgEgGaSWTiz+H5rBw30ZXUGM1zgg6gUd0Je+DWuUZ5nV
         AUCq8bZA/j/P1RVTQeIia4ZqnC0bENHT1GbE5M49Uk+pjdhoJBrSXJeZzbNemln3QRi4
         6fXRPtCbv+1Mxnmu91+8MkbBVhfIiZOZWTeOMn47ICBRro6EAr0exe73YUuZ5dTrS+2k
         9ciQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5wY0b8pvpJG0t2jLOKClYgCQYlE0BnwwKRiZ/BUOMAU=;
        b=nxCsuzCmiPiwqHEiw/Ruq9R5rSeb+Hz18VosmTB19kIL39Lr3hpzrXw0+1wp+GrQUC
         ARf1NUSqw1I5pUmdx/f1pBgH1GsWgUQjVaDbK+4EX+C/Ds1xUEHA0y03tI9xsDg8kOUz
         ez9TIcOmMFgw9NbpOQ+tsnTuqYh+NJ86jXGcRKIgDqEcTbuQe4SgWA0Uq6szzrxfmHN+
         SiVrrOUSp89RSjRsVePddsp+WaR3vfawLpBSoAAoIJEBMDh1ESpkMJp8DOW+5ThX9AOx
         8FqCmX200Nxvmb1T/3KkCtbRCunQWv5V/sM/jcf+KXn3gWyL9Y4YRMjTx3DybNYFJlG2
         Fhkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="JV/X8QZd";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c14si3154012qkl.190.2020.03.05.07.12.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Mar 2020 07:12:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="JV/X8QZd";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9sAp-0007FF-0G
	for alex.bennee@linaro.org; Thu, 05 Mar 2020 10:12:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43903)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j9sAe-00078F-R7
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 10:12:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j9sAd-000240-MG
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 10:12:20 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:45523)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j9sAd-00022s-G9
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 10:12:19 -0500
Received: by mail-oi1-x231.google.com with SMTP id v19so6233191oic.12
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2020 07:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5wY0b8pvpJG0t2jLOKClYgCQYlE0BnwwKRiZ/BUOMAU=;
 b=JV/X8QZdpqAnqDzU53OR9BTiIi78uVCli/R+e1+Vjfe/8IPn/HmGEby/Z4sebQ6gWr
 k0y2HHuKAPdjfix+hcbrhdwvdk6ftcJU2O7TWk6fwMbvCY7FJN0zRyUnCKLAq/a0i9HT
 nabwdjkwWb3QdgYjDJI77BDNXV0bbK33vUEEZb5D8lKHnlGfOPYf/ItO0gOp6gg2SNFj
 om/PFSFqV/i6IyG/rAnG8RO7HDUauWBecHPnn17gFb8esif6i9oRohqqfugkvybWcDHL
 BH/BnqtLtZYoWIzG0+ESVFtoAoNIzkszcoFM2eyu+FuVoTozMUBY27t81qVZ77Y+3oeZ
 v4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5wY0b8pvpJG0t2jLOKClYgCQYlE0BnwwKRiZ/BUOMAU=;
 b=PhHS6+Uz7EAqufQcChzBR6UVXnlk80rLu8EI0M4xoNZzzxLMlsA0MKlkMeM8ekl4cy
 ye3rAjIJ/K0EEdUp6sFJyL+b278voWVRONuzPAI5L+p2M/7XVfEfv5itqRpfbxTOra2y
 j3q1Vbu2MZztJpw1Q4av6GiCU+YRcO8dGoLOZAlkjoGXlitpiexyqcA4dwpLhk4yGWlv
 ub1yquhvwDH7VtO9hfMASOLyn2LaEc2Bdw3Lz3Dfuv04qKfWYv/hAVzXmewK99WfGctx
 l/yQIJ+M4PE+6IRXjw/CXtYYvAs8bLnC0tWCtONMZRE7BNjjdm+cN4iV0nCdwgs6BjZm
 48ew==
X-Gm-Message-State: ANhLgQ2L7bf9/xGRcVVrH4KkAyd1TmKRLuV5jo99rtr7g/7qXq9G9Bwz
 Yr1jA92qTNPe8KgKmavldIUNmZcJ8jT5NXQU0PKbhg==
X-Received: by 2002:a54:478b:: with SMTP id o11mr1049536oic.146.1583421138606; 
 Thu, 05 Mar 2020 07:12:18 -0800 (PST)
MIME-Version: 1.0
References: <20200302175829.2183-1-richard.henderson@linaro.org>
In-Reply-To: <20200302175829.2183-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Mar 2020 15:12:07 +0000
Message-ID: <CAFEAcA-SFEHPGhBesEwHir1a4Y5a-vqXuaoh6LKjx7c9WqDVMA@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] target/arm: Misc cleanups surrounding TBI
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::231
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
X-TUID: CcNFFiwLps4O

On Mon, 2 Mar 2020 at 17:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v2:
>   * Improve commit message in "Optimize cpu_mmu_index".
>   * Add "Introduce core_to_aa64_mmu_idx".
>   * Use it in "Apply TBI to ESR_ELx in helper_exception_return".

Applied 1-7 to target-arm.next, thanks.

-- PMM
