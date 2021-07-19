Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp3888680lfc;
        Mon, 19 Jul 2021 07:18:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwwfmhROX/Q4YbDGFTqyapF/dAhrMcZhsubgbASEt30gzr4S8JP8bT/8EY3fXUCkGGuME3
X-Received: by 2002:a05:6830:40ae:: with SMTP id x46mr5798885ott.71.1626704333906;
        Mon, 19 Jul 2021 07:18:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626704333; cv=none;
        d=google.com; s=arc-20160816;
        b=KOTZeNv+jGAIKkoVAxgiFi7pbyVxYNY88TeqDC67cCip7OPjC8092Hosdt8Izubxmu
         R4VmF/g0oNhuTs6yFRMpkUBBMm/B4yHE/QAYQyS29nvQvnVb6ammuGjF21rjSAYr8USO
         83QZ3IGnDXAxu1SRlg1xuoCNv2zI6O0Cp25GnIs3GlxjhxOsH0DD/tXJKcnDY6vBvfgt
         Un7pxBTRBNe8uwwR9xZjY6jmcnSZJ4vReic37S8/4av7xvCh1n9Vfam2QCPe4/nMIX4b
         gXYBggGzAwY6T3uHcvnUGtVwSHhM0ZEC6tSP2z3I8CRfVKsQuZ9Z12fuwdTU5Fc+7TRX
         ONkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tp5qD+dYMe3XUOFDt/gmk2ljufrFFiksoQWz3AEiTp4=;
        b=fZjpwznRbOKotnawvnGJK1QyTnLltYl6Wzso2I5ogyOV/jZUT6e6e1z6LKDAQswKWu
         JehWcVJ/5d/RvzpkUiSgj4LjC+w/z+pxjuxYFQ4OUAiHrxRd+lVX7ZxmaHvtmnabJ+Hm
         ynCKB7CeGV+ecp7ztp26JkeLWBJoWgyhHDlzPQPDIZYDKKwyzUvDBTcwqiPU/7NNzMX0
         IhPlzJqvG5v0sXuZdBfXJyE1H347uVWkVFDVLvAaZgbsdde4QnklTDQ4944bGCS/KPeu
         1ezwXLNnpwsdfI+QbBQH947SuoQ0a3adln/30FMegN7SHXq5QCwezTdagfImgYOLZ1sL
         ofpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t8wspWHZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r19si17522355otp.263.2021.07.19.07.18.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jul 2021 07:18:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t8wspWHZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m5U6f-0001OU-9D
	for alex.bennee@linaro.org; Mon, 19 Jul 2021 10:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5U5H-0008QN-0N
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 10:17:27 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:39645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5U5D-0001c0-N9
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 10:17:26 -0400
Received: by mail-ed1-x532.google.com with SMTP id v1so24160621edt.6
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 07:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tp5qD+dYMe3XUOFDt/gmk2ljufrFFiksoQWz3AEiTp4=;
 b=t8wspWHZXsCbJx8/vO4oZ91CYbeMbT4AhqE9Gv9609Lkdkq64Bki3mbCHBmx4vTHbL
 nC23lFSqb0xCxS8aSt12IbMAkSBcMsUM1XIQm5/LL9HHSU8shqJ+9fAy//FzI0dB9Nzs
 YrBCtZRdgJA3FDAszh7iERvDzKrda0GuD5wWIal7LYSJoxc5CH1FJWjAd6W/gZ91Mn04
 Dv2xwNJ79u5SbtCZFkkX1YMO5VBaoLqJpAhqRqLsfoVCBaTa2t6hEeFYVlR5cpANt+73
 ynlvzsX3MgNE6wkT/glGxr7fFwoa/IkXjQcWuJImr4TJlwosFlAoXGEXIxF4XGjztA44
 R5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tp5qD+dYMe3XUOFDt/gmk2ljufrFFiksoQWz3AEiTp4=;
 b=tdDKSJe0IqAW1OK+fuX//cS1dRbNG4ICOlEv9PdPQVNYU3QFqo6mO1mRrmVvdC6Ah0
 jo5KJAKBKWDp/i3y2/POw/9OCzu6G3TAVLcFzgO6/oyRzTk6YNYfdU/eIoSfPbfmYl/o
 Z+e6pkx7i80av28rjvoCjCm0Jg12Gs8+6kMlivzCjyx1t/BXbEPNubLyogJ4EhI4S1PT
 cdtQvIp9YWq1iwAfCRuVQ6xe82ObTxakleI4wU6xMmlKoCme5e3IR/uyJiD//MGmelwD
 EaD7h3e+4PKh05yALsjg8ycknn1RCqySCW1++p+IQrX5NK08AovOzR/AzS/qoUbUcnVw
 FVYQ==
X-Gm-Message-State: AOAM5315GBGFDBP1dshH0NEyHcbazjPXs0Sg3q4Xk2lM+Kn7FdLQHiFH
 qcBQz4JpIzcYcfh+XNvs0P5/iqgMyo/3OO4NkAH9HA==
X-Received: by 2002:aa7:c857:: with SMTP id g23mr34455518edt.100.1626704242006; 
 Mon, 19 Jul 2021 07:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-9-peter.maydell@linaro.org>
 <d7551081-5ae5-0ff9-63ec-a491c5e1628b@linaro.org>
In-Reply-To: <d7551081-5ae5-0ff9-63ec-a491c5e1628b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 15:16:41 +0100
Message-ID: <CAFEAcA-8UopNZOTBxwM2sOB5sNw-w5rcV0ayNcjy5m=-n+DEqg@mail.gmail.com>
Subject: Re: [PATCH for-6.2 08/34] target/arm: Fix VPT advance when ECI is
 non-zero
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-TUID: crBHOHKWTXwC

On Fri, 16 Jul 2021 at 17:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/13/21 6:37 AM, Peter Maydell wrote:
> >       if (mask01 > 8) {
> > -        /* high bit set, but not 0b1000: invert the relevant half of P0 */
> > -        vpr ^= 0xff;
> > +        if (eci == ECI_NONE) {
> > +            /* high bit set, but not 0b1000: invert the relevant half of P0 */
> > +            vpr ^= 0xff;
> > +        } else if (eci == ECI_A0) {
> > +            /* Invert only the beat 1 P0 bits, as we didn't execute beat 0 */
> > +            vpr ^= 0xf0;
> > +        } /* otherwise we didn't execute either beat 0 or beat 1 */
> >       }
> >       if (mask23 > 8) {
> > -        /* high bit set, but not 0b1000: invert the relevant half of P0 */
> > -        vpr ^= 0xff00;
> > +        if (eci != ECI_A0A1A2 && eci != ECI_A0A1A2B0) {
> > +            /* high bit set, but not 0b1000: invert the relevant half of P0 */
> > +            vpr ^= 0xff00;
> > +        } else {
> > +            /* We didn't execute beat 2, only invert the beat 3 P0 bits */
> > +            vpr ^= 0xf000;
> > +        }
> >       }
>
> It might not be any cleaner, but I wondered if mve_eci_mask could help here.
>
>    inv_mask = mve_eci_mask(...);
>    if (mask01 <= 8) {
>      inv_mask &= ~0xff;
>    }
>    if (mask23 <= 8) {
>      inv_mask &= ~0xff00;
>    }
>    vpr ^= inv_mask;

Yes, I think that works better (you need to capture the ECI mask at the
start of the function before we update env->condexec_bits, though).

thanks
-- PMM
