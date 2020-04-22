Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp187587lfm;
        Tue, 21 Apr 2020 21:25:17 -0700 (PDT)
X-Google-Smtp-Source: APiQypJDFkO+Y96xawR8YRKets7ErNpdULOaJ5JBJrhgjY3jv1Gkgx93zVaELjHaVrE7ZAYcJ5ZN
X-Received: by 2002:a37:bd47:: with SMTP id n68mr22181941qkf.379.1587529517164;
        Tue, 21 Apr 2020 21:25:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587529517; cv=none;
        d=google.com; s=arc-20160816;
        b=sGi6f0dd9yPseefp04muzaSyzVxg0+yV2Pq3LjFwSkgK72PME/ZEYrcC3kbbUV6/Ei
         +3DeFeETW/52n/oI4V3cposvDMqdP0fA4LJkZcnHyXxRYVsdz/6LR2ANqwZje/IdsPhE
         t64lhwP6MC1Mg0XNXlYK8O0yg39WSEmXv1ni12qSeDxgiucFj54AnyzD6kHJQq0sxs7p
         XwqjRrV4zDEJaPSiAgIK3pncdEbV7RflVAIXB/gG4QBz9GSC/WkXbTvp0VWy9r0F8zrr
         TRy4Ys7jPBZRJo2z/HVG/TgSsRXpB6aU9CrRTvPnG/Y+jeqWUDfk+wu1n4kFaQorD9iV
         m0SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=tdQDoUztRv6XvgHSmvPyCM3uW87+jm3LK61yOenytJs=;
        b=smpTMR5BWh7Aeq0bVoiNDOKLckTOduXvAGlD3v/IEFsvUOjo/a9EOZmsRg4HmfFhMZ
         FRVfV0P3oqFZRm62v52pBIicWZXJS1A07PLY/pxfvKnXraILBmDMJMjl96PGPO9jDGy7
         N42NJs0Yk8R5jfSkTP5R4gZKmFgo08Tyycht1+wqlPbE88yMo4vGmPSfEN9CjNEf46FS
         pRLJ4YPvgrwhN/RebErMJzB4oNdsUZGsfgxXMWQrlpQ/UynxX7ywlEo4WEbGa3OGOcww
         OlpLddicPHP346hSpTJjzCeV7bY9VEF8ZOhXsL3A8uPurqQEHzRsDBVwJmBwIJUjSkP8
         tlpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ekffncWj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b47si2565293qtk.399.2020.04.21.21.25.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 21:25:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ekffncWj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jR6wl-0004Qn-GA
	for alex.bennee@linaro.org; Wed, 22 Apr 2020 00:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33970)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR6wY-0004Qe-Bj
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 00:25:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR6wX-0006O9-KX
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 00:25:01 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:40466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jR6wW-00065v-Tw
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 00:25:01 -0400
Received: by mail-pj1-x1042.google.com with SMTP id a22so358773pjk.5
 for <qemu-arm@nongnu.org>; Tue, 21 Apr 2020 21:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tdQDoUztRv6XvgHSmvPyCM3uW87+jm3LK61yOenytJs=;
 b=ekffncWjIuUieS8S+hRbCcsHpmOSRI54JYedJrfScEznOmfUid9A9j86ebMHLB3TAU
 OWbZlv91bZfwWMvN6T97EJpU5UzYtNhoPPv0Sk/XsNmrSOYNQhhCZADfu3Chac3HkFO+
 fknxhYPf48PRK0++5UEOj6t4c91r+G9jmOPv2w67yx4sj78G7vJO5wZT739YRZwimp+i
 kPLo4pLhOAHoY/4B/WXkTxIFJt9GrstciDVJFa5S2AHcM55GVBHv3fD09Aasdaf1k1PM
 bszG9PjS4L8oYkRGDBzNS6FSTpEFuClmfZR6Dc1cEeJloWCsm8jTiVRbH3ZWBPwBKBz+
 DmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tdQDoUztRv6XvgHSmvPyCM3uW87+jm3LK61yOenytJs=;
 b=PjVC6WJcpQggsFn9caJNXrSB47frSLw0lnAKgNWbXGrwgUe74Yjej69epgm4KCebzW
 5IR+vudeUcHDNvjk6e0ocYoeoROJek3ozyht/r5OHYudZk2YXOf2885zDFZvw9YfOYn0
 X2d6p37a6oQzthowupsElvv2WEFjvCmRI3zCJEPSAd7RTJFido6eiWOa7S2BBdYgqrc7
 fimxKuJ5kBXYNtU6Rtifp6zYxQgYC3HQa1slb+9yhzeAmLcpkoeMevWMcCwILCNOwmh8
 PUEc486wJJrNfhlHmXvvjg1DmLJPPB6uxw3RGIz3ZBHbq0KtTsN7fDT7linoJkw1AUV9
 PuDg==
X-Gm-Message-State: AGi0PuYpWTGaGdTQ5PR9UNIJfkD+f7Eh//KFhZ7rNCTh23JIp8pqaqzB
 4VpgjEbCv50YSffSHxrZoZXemX7vyQg=
X-Received: by 2002:a17:90a:ba88:: with SMTP id
 t8mr9595561pjr.182.1587529498437; 
 Tue, 21 Apr 2020 21:24:58 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id t80sm4152243pfc.23.2020.04.21.21.24.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2020 21:24:57 -0700 (PDT)
Subject: Re: [PATCH 6/6] target/arm: Restrict TCG cpus to TCG accel
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200421131926.12116-1-philmd@redhat.com>
 <20200421131926.12116-7-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e2864e76-90a7-03f6-7bf0-e409980a2900@linaro.org>
Date: Tue, 21 Apr 2020 21:24:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421131926.12116-7-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::1042
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bEIEgtmPsQvT

On 4/21/20 6:19 AM, Philippe Mathieu-Daudé wrote:
> A KVM-only build won't be able to run TCG cpus.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> This patch review is funnier using:
> 'git-diff --color-moved=dimmed-zebra'
> ---
>  target/arm/cpu.c         | 634 -------------------------------------
>  target/arm/cpu_tcg.c     | 663 +++++++++++++++++++++++++++++++++++++++
>  target/arm/Makefile.objs |   1 +
>  3 files changed, 664 insertions(+), 634 deletions(-)
>  create mode 100644 target/arm/cpu_tcg.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
