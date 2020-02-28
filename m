Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp854601lfg;
        Fri, 28 Feb 2020 08:25:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqwg8tqxdafn0XdRxhh0qI1jPBAuhjF7cWNxukBliPEbOYvvatEh0mLKW2dbBmUZJW0ZK5JV
X-Received: by 2002:ac8:8c6:: with SMTP id y6mr5025225qth.388.1582907112615;
        Fri, 28 Feb 2020 08:25:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582907112; cv=none;
        d=google.com; s=arc-20160816;
        b=xVPccQKIMaoaUneRbRTZA0CX01VPCV3I5EiKKfJumNVZuvl6TL1ggi+7O3pdWdG0Ua
         4I0VetNJwAZW+r6tTlm5bz5voDDlGOqR2xmRW5TbvLs06TgL/FqbR8QVmueOewHX7Av/
         mpq37IimEefSuhWA57D0Yu8yOG6ZQfneArOwRpfpt85IRqxlnGsVDEspKyMEBgJVQnU7
         GJ+wapF9L82ppk8Vb0/eK6XkmKikC80rqrk3qRW9wtafpskSTza9qkAt8jliq7xOyCFN
         TiGCjZayqO6cZ+s7Eo+QexLGpxRCJZVcyCzOXYpM3M6SrrsqpdNKYHqts6rFRLJQvt0Q
         yR9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d42eOQ+FroABh9Zx71MLvHVrNI2rCUNUXwAK0Q60MJI=;
        b=0nSCC9VuScfS1ijLxYee/UOjiNp/r6nf7eK7mLq0w4ZykH6vV5AwHIFBVeqRGnqBCQ
         sZAZ3kuEipj0qkFGoBz+QMG8EUJcmzTpMNjwTbQq04jxZwcLqsEcaM6T6fnFfEJszsVL
         QGKy7gMbHR5SSLSg9TL3Argq161RkxVp7c8PC62afifC5BSAUKCzxPuThehmTwUIJ9VB
         /EZ4fEQArP/rKTKmlUon9th9Edf0hoItimkFQ3RmfPZ+u44RBUpBeYBiDN9Yoav+wNEj
         mVTCJNakeBemWEe+FgTiy7j4S2M5cWmzsYDVGHrY/azxlsbO7Ffqizap1vlALVMhwPHt
         oFUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fI5EFqJg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2si1651859qkh.256.2020.02.28.08.25.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 08:25:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fI5EFqJg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7iRr-0006fK-TU
	for alex.bennee@linaro.org; Fri, 28 Feb 2020 11:25:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54429)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j7iRX-0006ew-To
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 11:24:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j7iRW-0006sJ-UQ
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 11:24:51 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:35949)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j7iRW-0006rl-QF
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 11:24:50 -0500
Received: by mail-ot1-x341.google.com with SMTP id j20so3115367otq.3
 for <qemu-devel@nongnu.org>; Fri, 28 Feb 2020 08:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d42eOQ+FroABh9Zx71MLvHVrNI2rCUNUXwAK0Q60MJI=;
 b=fI5EFqJgNapf1kqpkbvahxC5TdX0uzMV3WcQqK6+T33BjTDkzZudmRPS4AfKFYYWfZ
 yTxvHlEXscgR40dk2Aa5OsysJfePdu41WBdLjltyzEVb0xKuBglKkso8XmJcr8Q8GJPj
 fA1GXfXOEe93XghQ6GLxxtCdqcXLDYBwK58YcQvquFR6wgPTuTCEAONUYfTvfvNGFVo/
 WcD97/ZjwcPFq6lUjtiu9BwJx65o5aO7ba/114W0n/b461ZckJ4M0aJTz3WV9cpLCxge
 5j7P9nCsB0AAn3lwJkaERXE4WDZFUr2dWJPh1QlArKivNOBTi1xA/oT0z0RnepGp5Iec
 FG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d42eOQ+FroABh9Zx71MLvHVrNI2rCUNUXwAK0Q60MJI=;
 b=qQ1HM80LA9+v/ULAhlBEx+iQqmjB/idDY25oJL91MMSMXX8+f5LRW9xfDViGT+8T7S
 +DOBbcoBGRg5Kj1NJJZyU7PbMZwjvVDzz926sGPY03/oTY5fGyheNoqF5LRehMcYefyJ
 NpcfsNs6zjd39/W8FjZ0suRYbB26TCtwQ5wfu55+ZePQ26YwcX8H7G5dbiapBsKEn5Tz
 iHNPqkQL3azSkWDNbECpojACNc2PA13N9PvbApcxwjIhMl2Q6b6JDj8eLIuREq3XrTVT
 OTwdDoDeyteYqVL2296G42ko+UNv1Au5eRRSLjMBxdPUltT16xPUImyTvpWygzlDzwMF
 tG8Q==
X-Gm-Message-State: APjAAAUmeJAKjhoRDgvM3NVEUGlxkTwugpCxn2BhiVF6EDxX4snc9bT/
 NqX9mUbYKLmFU6wBg7xhYraYvS9cM0G/QV8RsJ07zQ==
X-Received: by 2002:a9d:68d9:: with SMTP id i25mr3993871oto.135.1582907090143; 
 Fri, 28 Feb 2020 08:24:50 -0800 (PST)
MIME-Version: 1.0
References: <20200225180831.26078-1-richard.henderson@linaro.org>
 <20200225180831.26078-3-richard.henderson@linaro.org>
In-Reply-To: <20200225180831.26078-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Feb 2020 16:24:39 +0000
Message-ID: <CAFEAcA9XmxPy=cagxrzbTLB4V_RknLF7AgYdb6UfhPzScd6EiA@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] target/arm: Honor the HCR_EL2.{TVM,TRVM} bits
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w0+M5s670wvL

On Tue, 25 Feb 2020 at 18:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These bits trap EL1 access to various virtual memory controls.
>
> Buglink: https://bugs.launchpad.net/bugs/1855072
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Include TTBCR.
> v4: Include not_v8_cp_reginfo, lpae_cp_reginfo, CONTEXTIDR_S;
>     exclude not_v7_cp_reginfo (pmm).

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
