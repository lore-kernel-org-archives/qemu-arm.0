Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp2294462wrq;
        Thu, 24 Oct 2019 05:39:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzs+2xj+2FPFqQkHUD6mCEsKdF3Mr91sSDV5+rmhBn7w+A/qtoCGZ7iPNZtkMbp8YlGDrB4
X-Received: by 2002:a17:906:4813:: with SMTP id w19mr22818314ejq.258.1571920779556;
        Thu, 24 Oct 2019 05:39:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571920779; cv=none;
        d=google.com; s=arc-20160816;
        b=02KYHkQ9ZDHeR+vwC1ozmVDBDSYG1c8g4qOhANA/NnJ2PDV/QV+VF9/LumI8tpwZiB
         mEb8XfVzEof06Vqhx4Y6mUQsd7osgPNXf2n9RKXme1GAZSUbLceGFh9wVL592goKYgdb
         b8zWEP96xDk9CiomaVocAMTQU8K+q1tM5hHBQc9iobmURRXuZcSBNUJdFJayaoTlqa/j
         FVws4GBvg9tmnTfVb9pXYPffKW1ulj9Pw2Pfh5ydZdvcK4n4wUldRSi1YArJP00Tqv7n
         ktosyw9/zu1qxjYQtRTPwAy6yYbLEof4rDz6nj3xHmRbPxEsrsgpDa28Q5PS4p48/2AF
         2NmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BJIN4H2esPOlYHkrD4Fg+pRVtEv/m/K1uo9Tg8DRzj4=;
        b=SWz6ciaak8FOkq8ZS/KFP8QNXNUEeDw10MEbwnuZ/Ph5UiYl4uTyllLF3FRqrI9GDC
         5YQMIG18k5ocTnyoqkjjimBDYjWnHZ4qBVltY10Q0cPVSTBULfDnxG/1cMJzcq1fGRJ6
         BNh+scTfJ9PQmlzhBVxLonphvNcUPzggLit5Jf6rOPf9EtrK9JRBEANOhrnUDKYdt7Q3
         SyChwbFQPsuyWV81FnlO35MjwIlH2jCo4bWMs079pXdJbwyaTEHaNJIpmT/3ewtHxLn7
         mIN3QVraef4zQYgF2zvRmdyGM3Mw13J8Aq7jDfejopNGqBBlxyyYeMCBzNtrt3phdtTF
         Wh9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Gj/9ClAa";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r1si14307272ejp.287.2019.10.24.05.39.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Oct 2019 05:39:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Gj/9ClAa";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNcOw-0005Lq-8k
	for alex.bennee@linaro.org; Thu, 24 Oct 2019 08:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40779)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iNbUf-00067J-5l
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 07:41:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iNbUd-0004W0-QG
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 07:41:28 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:36332)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iNbUd-0004Vk-Hz
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 07:41:27 -0400
Received: by mail-oi1-x241.google.com with SMTP id j7so1564656oib.3
 for <qemu-arm@nongnu.org>; Thu, 24 Oct 2019 04:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BJIN4H2esPOlYHkrD4Fg+pRVtEv/m/K1uo9Tg8DRzj4=;
 b=Gj/9ClAazeNbD0xLH3fnGdmaeeS7YeresvdjSiZmux1MzRluM12PVj/S5Bm9A+8mLq
 mRua7+cIpmlmMU5agM4+leBP7hU5ryFWtYwvrRQmM5P0PAbXyOSc/yMqgKkFRzIrofpr
 Ta3qO6GRQSmQC+a1hyI7jLoLn/AoQtBEBWEu8QWL8k/NVkqHvrjeC4bmuKNUcQsFrnz4
 zQkstsUfY2FoP8HPpBZyR63QdXXFN1z94H/9c6OQjbhTTdYSAQtpR/9pRER0M+bgd1xH
 Ys877Dl6shHPsf17E3BHTeAa8UcHpTuxQbPetZuaWwioGJ0JtORer4fB7w4vxhY1Ju58
 5VrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BJIN4H2esPOlYHkrD4Fg+pRVtEv/m/K1uo9Tg8DRzj4=;
 b=JBSo+Tg7Y+SeMBp6HVcnk45aooxRdyTDrnf5N2AX29c0nQHvv0XHu22ZYRl/gTWMTO
 zOeTa1pW8/TnakRSpkU8uUdNSnPmneqZmAx6BjCtkdWtaTm1I5X1qxcWsJPuWQOW6HKK
 JgLkiBscflUNeRYGZrxKh8AjWgOaQLFYUFrW5TZ7ThoaPk7JIuk25vYy4zCuYfZztzXO
 4EZDO3b4ZcztcN4ltNbryGmyAkvMe20/lYpvITLy17EksIqc9lGVLlwUzZfUQazp67jn
 17AenuCFuWdVYHJJzFoI8A9FZuxsClWwQTdi87fBNLGa5Xxq5UN9GB47QAu5p8gUFwBT
 bh2A==
X-Gm-Message-State: APjAAAXbxtzBmi9GE3GPGAfr4UCYLS5DLUWAMUHh8uiVXte+oaXB3eUs
 XtjDAG7XP0tdDB0tyQZw86SCEmfJHFTTlvt6qKPSHg==
X-Received: by 2002:aca:49c2:: with SMTP id w185mr4235052oia.163.1571917286204; 
 Thu, 24 Oct 2019 04:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <20191023150057.25731-1-richard.henderson@linaro.org>
In-Reply-To: <20191023150057.25731-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Oct 2019 12:41:15 +0100
Message-ID: <CAFEAcA_qAo3+4oO+bLY=m-vCdSAxHSRiLBe4xDUxztofmTw21A@mail.gmail.com>
Subject: Re: [PATCH v9 00/24] target/arm: Reduce overhead of
 cpu_get_tb_cpu_state
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
X-TUID: FH1R1ghbQ3rO

On Wed, 23 Oct 2019 at 16:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes since v8:
>   * Rebuild hflags in linux-user/*/cpu_loop.c, after changing to big-endian.
>     This allows the armeb busybox ls to pass.  I don't have a test image for
>     aarch64_eb, but the code looks the same.
>
> Changes since v7:
>   * Rebuild hflags for all successful nvic writes (Peter).
>   * Rebuild hflags for Xscale sctlr writes (Peter).
>
> Changes since v6:
>   * Regen hflags in two more places for m-profile (patch 19).
> ...


Applied to target-arm.next; planning a pullreq tomorrow.

thanks
-- PMM
