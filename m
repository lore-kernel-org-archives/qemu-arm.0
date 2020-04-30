Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2045245lfm;
        Thu, 30 Apr 2020 08:56:17 -0700 (PDT)
X-Google-Smtp-Source: APiQypIgE6K5QSNDtCa8nsP2REdMYdI77bQmzCvagi1+dM2+5XtMjR/0+k3qPxYv7ByBZ34D+yW9
X-Received: by 2002:a37:a806:: with SMTP id r6mr4214051qke.171.1588262177347;
        Thu, 30 Apr 2020 08:56:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588262177; cv=none;
        d=google.com; s=arc-20160816;
        b=OlAqJhsAAc7Az4J5UwU16EJoKyJLBtKqeZkhWOq36ribR0iz3cCjBWgGFOd87x5HOY
         pO9TYNIXvZh45PgiA9pGLd5dkCsamHOeA461AZOSxB3eF4CPJVydsgZX6mJqsTECBthc
         rfw4sGgJyG+8lExSfW/XLc5uHhonuCl0xQufeldGy6NgbWPyy/8Y/0tmt/5IGLIKdGvJ
         BvxdtcYQkMA/pn3+K4aVeC2ZS+g9WaaKeAVrhNn9Lj75xEN/ecK5E9yU/GfctI8cdCMS
         aByLCnGGtzTbCdTf2RI0R+ZQqYAGI4wFeDD3aS1OvK98CuItMgFrVIz86b09/Hsj+xtt
         T3PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vI7YEddwhwTYmUdEiDq/Zu2AuyvZd87ySpyZoFxZea4=;
        b=SH5f1OOfIvr/64HiiCSXJ6zaAtxwoy1ZHVfF0spn/fg/+KYXNA1suMzuxAcq6NFMl3
         cMDDEpRVH6dT+qFuToRwNLXxzEECEZbi1y8COM6YTJ3d6rxD7UGNhMz297iPVe58jcOq
         5c4IxmIQ3S5oDnemKuHLX/tSJuatjKX536RNdNjzWveKyPo2C8I6JQtbKYx7Bhe//D9S
         8YarjQFM/niohxyD3K5N7R3V2XhgZHVTnyStvbl1HII0Ku6hwDqRmJcR+2qSA6VX9kHv
         G57bMrtFCpNvKYPYpyBarRRPCwpNYrff3EiLKNXRnJyFNoJnc7MyrJRTOhfMeqEg1bDg
         gVAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kY5TNCw0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id bd20si70814qvb.8.2020.04.30.08.56.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 08:56:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kY5TNCw0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUBXs-0000Ed-ML
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 11:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44578)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUBWT-0007bV-LO
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 11:56:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUBTb-0002iq-5F
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 11:54:49 -0400
Received: from mail-oo1-xc42.google.com ([2607:f8b0:4864:20::c42]:35797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUBTa-0002iK-Nx
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 11:51:50 -0400
Received: by mail-oo1-xc42.google.com with SMTP id t12so1388715oot.2
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 08:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vI7YEddwhwTYmUdEiDq/Zu2AuyvZd87ySpyZoFxZea4=;
 b=kY5TNCw0e5A/ZG2j0nUSN2SiBJjCSXx2ORsPn9aLyq09xjKtcMIds4d0+RGJlQu4Gi
 nK2XhgCTJRZ8qUwpiaILdEAWLA2VEnmUKupEecfS2wtNI/Vfz9OF/WtqFMhG3i1NGG1W
 2qEoOV5pOt9WRFOrZkhPB1Jy3rlvD21nz+U5ftY++LUpT5q1m3k2QZEfYSUKM0wR7zS9
 In2NFAgMkcm0wa5Ey0aVorgV7jyWq4ozst3WWVMC7hpg/8vdXH8qpHltnmvdFDJv/PUw
 axPnwHRSggnIb9VLVRm4vNzdQjqttbJiI4a1Xj1AjEYvT8V/5q5s196EM1kJmItTdm7B
 l99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vI7YEddwhwTYmUdEiDq/Zu2AuyvZd87ySpyZoFxZea4=;
 b=VCMYooodXS1yoeVSPeNk5tqnZs9Z8HowQwlJO/uGhcErv96X0kjvULW1qKQgonyE7p
 ksTmsJKYwTG4giBXH27LTtiWTBuBhzP2q55IPpzZB1tMlG52f5wYWmsct/X9O+AtrxYE
 euv1JdTwCykRnJ8Cp6cbrTm3tfLnphiXtvN6fepE0J5q5i7Qu+DJuWg6aZKF90N7jUb4
 yMGutFpFKBN4rNZJnhTraY+M1Koa+r1FSLvMKt5hr8VntKBrT5RNm9JTr+djwTaJHM5o
 uoTSobilKcWaAZjzo01ol514d9aOBsUSuugxCwLQ6qpoRZ+IdOeZCCxy15JSITGfD0Iq
 fuCw==
X-Gm-Message-State: AGi0PuZAPUv8ve7AZJR1VrdwDl8N+z1pG23PZQg1xmHR/2KfKd7EeJwB
 ZrmhgMsbuHlHUxMxJwcE0FdVPxQp4z5eAuns0I0IGg==
X-Received: by 2002:a4a:3113:: with SMTP id k19mr3419743ooa.20.1588261908584; 
 Thu, 30 Apr 2020 08:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200408115953.1158-1-fredrik@strupe.net>
In-Reply-To: <20200408115953.1158-1-fredrik@strupe.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Apr 2020 16:51:35 +0100
Message-ID: <CAFEAcA-wtZxUCNs_GV=sUtGjpPnvPEg2YgiBn6GDmPDE=G=s7g@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/arm: Make VQDMULL undefined when U=1
To: Fredrik Strupe <fredrik@strupe.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c42;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc42.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::c42
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
X-TUID: Uhe0w0iSK3gT

On Wed, 8 Apr 2020 at 15:54, Fredrik Strupe <fredrik@strupe.net> wrote:
>
> According to Arm ARM, VQDMULL is only valid when U=0, while having
> U=1 is unallocated.
>
> Signed-off-by: Fredrik Strupe <fredrik@strupe.net>
> Fixes: 695272dcb976 ("target-arm: Handle UNDEF cases for Neon 3-regs-different-widths")
> ---

I'm going to apply this patch to target-arm.next because
my refactoring of Neon hasn't got to this group of insns
yet, so putting the fix into the tree is the easiest way
to remind me to handle it during the refactoring.

(The other patch is in code I've already refactored; I'm
planning to send out a series with that refactoring shortly.)

thanks
-- PMM
