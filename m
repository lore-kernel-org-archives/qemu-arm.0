Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5956959wrm;
        Tue, 22 Oct 2019 05:47:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxahYbCNO+0+PmWbscPusyU827uSbrwMETDZwmSf3bJ2OfF5B6QhFbTt6KPtcXg+pCSaV6F
X-Received: by 2002:a0c:e70b:: with SMTP id d11mr2897250qvn.51.1571748472302;
        Tue, 22 Oct 2019 05:47:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571748472; cv=none;
        d=google.com; s=arc-20160816;
        b=qKsIJFd0g9Pt2pKnOTb8qFFlPeKDdL2nKA93SWtv6RYhhp0IoOdjcyJIfFlBFkN8Ix
         JOrhQldaQpmxK6+XSz1HnCE3sqr4BMMJZMVaazHhXnHv3EyXbHSxRvNFoQgWqnQUgCtg
         P8//qRrkp0w2We8qg8rUW6AG7vOkZFcWIMwFC7U+I1eGCoiLE5ZRalzkqaroFnkKv0ia
         j67ynIQRpyIApNu4AtEeJmT3Km0OaqFCCl29Cr+cVXjbUG61PgdPQsGlHUKJqCOCLJuK
         pjUJ+IiBjQ0yMeKAIW+F6uHHIJoOrHKx3YKsfMmXmuihEpMIUd1FIK42e9RPZA64Dm34
         kKvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1OweYMXpkSlcHwkbtejrWkUiib29y0AOj+d1bjILcpo=;
        b=iiUCmXQ1kQrzNOzIzzQRirwQK26Oq1sDNhlgf+gOJTYSRHx0upeJKnFJn2hLd2cqq7
         yVteYVWq7/p2QPYB3Jcoh7jDUCSUnM7ps06H5xTN9TzKaRvR1UBg2vznnWnhmGujD0/Z
         7nGmPuHHxbY829ti0r7QNPikX9Hzg5mZC3+EXf4TAg2XMU6SjS1f/eYTxoDpb21Ff/St
         4SOz0MiRtWb9bhL+7CJo5fT1zUM2wScmrIuB5dwymc3ty1IAHBf1cYCx1G4Pj/DBIrH9
         OxqDPsdaCdrVhJbKsMprZT+GHqzJBNoQsQKg0uwpJhSFiJ9nMM9pRGTpwsm7I5HYf9xO
         7shQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mdkCE2+r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h65si15721326qkc.347.2019.10.22.05.47.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2019 05:47:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mdkCE2+r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMtZn-0000WL-CX
	for alex.bennee@linaro.org; Tue, 22 Oct 2019 08:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56068)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iMtZX-0000V1-KI
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 08:47:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iMtZW-0001dV-Hr
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 08:47:35 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:43541)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iMtZW-0001dG-BD
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 08:47:34 -0400
Received: by mail-oi1-x244.google.com with SMTP id t84so13992299oih.10
 for <qemu-arm@nongnu.org>; Tue, 22 Oct 2019 05:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1OweYMXpkSlcHwkbtejrWkUiib29y0AOj+d1bjILcpo=;
 b=mdkCE2+rejlb6OkJOL64fc7ajE61s+m1Ki9M/WNHbVizLExNifmarOirN80KiF2MgV
 GK+L8cWf8e7I7K3KoH4lPLh2uXuxmT/Xsj3UQiUPgGnwWvXkqrI46eI0XS+k6wPz8f6O
 Rqwr0VcTmV3Jw1GVLUky8P1qAskY/BOHfe7ePzM9kwgNuh0Akx85IiS7cz4bCvOIwvMn
 VxZtsnaSfZFITWX1HxBQtMWk/uttnPv88U/2sBVbelVltrTuFQ0lIE0bxI9SGqgZz00H
 J7SmdPlxp/l+8sx8aZDRfU+562LbU4zAi+8AKHaYYI5xHkVxyudlLPG8vfCai3erUoa/
 mbuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1OweYMXpkSlcHwkbtejrWkUiib29y0AOj+d1bjILcpo=;
 b=p4FOOu+et8Ud+C8ijaSqGhcQDgaKuOeB1NMzBB1azCJxGbsisUQDhleVyG9vMyig9G
 hitjFlvb7UTGoAlND8ia7FbS1h5ESb2Q0QRRksT4XYFfKxILTOTvlMEfKfKBkaL9j2oT
 OxbBENUEDJ2rTWgMDPca//GiT+3hpPycscT6WTgtuOBXp+C/Y2/VtMZ8KeuSx2kbi9Bi
 PJomflvajBCiqXc6hHtx1rwGy/Lnt82TT+rvs24hhJEJvGoeog+oQD31wkI5LoI/3HjY
 ww7OsTODNnfMoOW9+gmGZLiqejVa6S5Z1gD3b+9MTLan9XMz9sOYYKStO6Vy8TyO4cFw
 Xe3w==
X-Gm-Message-State: APjAAAWZWDgmh9buxfiCGOp/LXxQI4/amPtsCiuicwHPzj7DbQyQ8Mhx
 bEkkCv4kVMNcgkNHAWtq6KwU2jL0y91sTfhhYEld3Q==
X-Received: by 2002:a05:6808:9:: with SMTP id u9mr2849839oic.98.1571748453478; 
 Tue, 22 Oct 2019 05:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20191018174431.1784-1-richard.henderson@linaro.org>
In-Reply-To: <20191018174431.1784-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Oct 2019 13:47:22 +0100
Message-ID: <CAFEAcA-MyKoA63UF6DYQ6J-dKihYn9iyG09eFCgWT8j4OqsQnw@mail.gmail.com>
Subject: Re: [PATCH v8 00/22] target/arm: Reduce overhead of
 cpu_get_tb_cpu_state
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
X-TUID: 34vu1buTXquh

On Fri, 18 Oct 2019 at 18:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes since v7:
>   * Rebuild hflags for all successful nvic writes (Peter).
>   * Rebuild hflags for Xscale sctlr writes (Peter).
>
> Changes since v6:
>   * Regen hflags in two more places for m-profile (patch 19).
>
> Changes since v5:
>   * Fix the debug assertion ifdef in the final patch.
>   * Add more calls to arm_rebuild_hflags: CPSR and M-profile
>     These become two new patches, 18 & 19.
>   * Update some comments per review. (Alex)
>
> Changes since v4:
>   * Split patch 1 into 15 smaller patches.
>   * Cache the new DEBUG_TARGET_EL field.
>   * Split out m-profile hflags separately from a-profile 32-bit.
>   * Move around non-cached tb flags as well, avoiding repetitive
>     checks for m-profile or other mutually exclusive conditions.
>
>   I haven't officially re-run the performance test quoted in the
>   last patch, but I have eyeballed "perf top", and have dug into
>   the compiled code a bit, which resulted in a few of the new
>   cleanup patches (e.g. cs_base, arm_mmu_idx_el, and
>   arm_cpu_data_is_big_endian).
> ...
>
>
> r~



Applied to target-arm.next, thanks.

-- PMM
